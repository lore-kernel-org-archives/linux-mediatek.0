Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD19C678D5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 21:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4YSoa9uV0XKozIzNBn1e5mCInOvBfhbVHfU7vWcTBs=; b=mGTIuyMGwoaYo/7HWWqdZeuoea
	8zusoKaXGTxyGBZqkXD2+dnOLhIwR87Z98PtUvcT03E/WRpHXp15jVrIUmQBgpjLNlgy9VpeWsFwI
	Z4b3yg1Lg7fJLX9dHP+E2vxTxyU4vPf4s1uVwGZnCg8N5tDGuQRmsWz46VBYIY3ylX6f91LJuse0m
	NFn5xAZ2iqlN4MRGXY9pwT/IkbXwikglxO2enhGUMGKF2U8sE+onVGiuHiz/9YZ4YlGMPF1fuT+3W
	3mTBPWbw+qNXI2rtqsi1atNL4JOHEJGE6zlzFmpAPxGRW2sSxl0r2QtyPiVBbHw9Ij1qWKPQAo709
	qz9yZ1QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa14U-006mI2-Ch; Wed, 08 Mar 2023 21:11:38 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa14R-006mHG-8l; Wed, 08 Mar 2023 21:11:36 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-176d93cd0daso159125fac.4;
        Wed, 08 Mar 2023 13:11:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678309893;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b4YSoa9uV0XKozIzNBn1e5mCInOvBfhbVHfU7vWcTBs=;
        b=KdlMHjDxFDiQwQmdqM+/s4QaFH+hMqCptLh/kRHSvp4rlLP0YxyQnL8wnhXerUy5E2
         I0kg6xGYTSPyP9u+YGvd8+oeNexPgeiCVNoZAuN5jc3nXQFUKVczDLWleb1Dlwka+71s
         fYhUMgpbs87MJVjBqw0rJV9eYUYXaSPQsLWguufoRpmWBCk6S56TYwctHbirgZ5XFJuL
         YDL3Ulb4dkfBuyTvHO4u3O72am+86b1Dkv+vgVNi27OFuXE0Ex1FX2JrLpb11udWlg8o
         P9Keb+DW9DYi8BW+U6j2Gh2ZdT0e6qYiJNX+NImSrhNEKn81I9UbnjxXJHo0NQ4TcNv8
         UI2w==
X-Gm-Message-State: AO0yUKV6d5DwfUq+HogPiUw/uzuG1Dtrh2oB78txj6Gi5gcWF0xKdeEa
	Qj0NeekmgyLr9vEE8DXKzQ==
X-Google-Smtp-Source: AK7set8BSBwdSSGBijkEh6MDrbv/vYZa5o4GV9y9Xt6AyzB5YrpY8yUqtauZKcJm+fhWhiavcjZDyQ==
X-Received: by 2002:a05:6870:e886:b0:172:4748:32d9 with SMTP id q6-20020a056870e88600b00172474832d9mr12216316oan.3.1678309893181;
        Wed, 08 Mar 2023 13:11:33 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id yy31-20020a056871259f00b00172426ebe58sm6597443oab.27.2023.03.08.13.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 13:11:32 -0800 (PST)
Received: (nullmailer pid 3850403 invoked by uid 1000);
	Wed, 08 Mar 2023 21:11:31 -0000
Date: Wed, 8 Mar 2023 15:11:31 -0600
From: Rob Herring <robh@kernel.org>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH 15/20] dt-bindings: pinctrl: {mediatek,ralink}: fix
 formatting
Message-ID: <20230308211131.GA3803811-robh@kernel.org>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
 <20230303002850.51858-16-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303002850.51858-16-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_131135_328995_117A3DFB 
X-CRM114-Status: GOOD (  12.05  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Mar 03, 2023 at 03:28:44AM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Change the style of description properties to plain style where there's no
> need to preserve the line endings, and vice versa.
> 
> Fit the schemas to 80 columns for each line.

I would just leave the enum cases alone and make this patch just about 
reformatting 'description' entries. Either way:

Reviewed-by: Rob Herring <robh@kernel.org>

> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../pinctrl/mediatek,mt65xx-pinctrl.yaml      | 20 ++---
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 31 ++++----
>  .../pinctrl/mediatek,mt6795-pinctrl.yaml      | 29 ++++----
>  .../pinctrl/mediatek,mt7620-pinctrl.yaml      |  2 +-
>  .../pinctrl/mediatek,mt7621-pinctrl.yaml      |  2 +-
>  .../pinctrl/mediatek,mt7622-pinctrl.yaml      | 24 +++---
>  .../pinctrl/mediatek,mt7981-pinctrl.yaml      | 33 +++++----
>  .../pinctrl/mediatek,mt7986-pinctrl.yaml      | 60 +++++++--------
>  .../pinctrl/mediatek,mt8183-pinctrl.yaml      | 24 +++---
>  .../pinctrl/mediatek,mt8186-pinctrl.yaml      | 43 ++++++-----
>  .../pinctrl/mediatek,mt8188-pinctrl.yaml      | 74 ++++++++++---------
>  .../pinctrl/mediatek,mt8192-pinctrl.yaml      | 43 +++++------
>  .../pinctrl/mediatek,mt8195-pinctrl.yaml      | 34 ++++-----
>  .../pinctrl/mediatek,mt8365-pinctrl.yaml      | 26 ++++---
>  .../pinctrl/ralink,rt2880-pinctrl.yaml        |  2 +-
>  .../pinctrl/ralink,rt305x-pinctrl.yaml        |  2 +-
>  .../pinctrl/ralink,rt3883-pinctrl.yaml        |  2 +-
>  17 files changed, 236 insertions(+), 215 deletions(-)

