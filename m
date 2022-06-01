Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803B9C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 20:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+YRfBIoqpgf99b5ukVYn7WNFTAUvFtBLHULwsLut0c=; b=w/m6AonaVxrA6V
	GQ/7UMlvArFv4f7Z3EumwSGJZ3VzAA3ajU4KerEpzA2ESE1O9xqbabnkTpzjyZFEZxpe6uNI7d2eq
	4+YtxwcVYGljG7/N0GOQonqKEQ7ClcFeqnWrajPQtHuFRgcoQ/RSy8Fg9a3kYhXqZDb6zRSyH3b90
	KJGTli1dy7FacN3qWvtY32h2S235d0G4zX6CTSXFHU6GH/Ip1nNJqSZrrEWRwdaKgB7sGqhEV6tWA
	o4TAc0SPBX2K1oXjsjvq8mtThSFAdzduY4/OZQatq6dFa0CIDAkWoFEqkmhVIHOGBRlF8mmUIMbhL
	yq85Qwtqhy0YRUW+h+DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwUYD-000EPF-6n; Wed, 01 Jun 2022 20:02:41 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwUYA-000ENI-MQ; Wed, 01 Jun 2022 20:02:39 +0000
Received: by mail-oi1-f176.google.com with SMTP id y131so4036444oia.6;
        Wed, 01 Jun 2022 13:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xRz8WTc++E/Jydb7FMNOLlt8oZQ5VXJmtj71a3RfnaY=;
        b=izyVKB3yuRd66qh1/Cp2dC22rhG2qqEz/2+bSR+jZYcSUQ7TOH6ZY/72m4zKerF8ro
         GKhmErTn4+/pUpqNyg9NBCD8xronwaidzoEKTrcBZQptXxj/QyuGubdER1zDZ43nI13E
         nk0gyFFG7ANxb3CEML99B3WLZ21FqMkDJ/Lb3SHN2UFH8bU2qRsK/kOyaTESeucPeiOL
         J9qLejxqUUYGDPGXtHQTX6cVZZnDdp2KzHxS230exOMzhnd6rV3ahv7tfuDfYPx4NAwI
         dUQyW+/VC5yhxwQuSxN2n689DTYu36gS7CKKnwNJ4e0jxF6Te9XBn0JDJlbxKQK10JbS
         E73Q==
X-Gm-Message-State: AOAM531pOb2+1BJfU4sHt8q3DWY/KxOpf0XZ8kuLbK5gjTX50Tk7oGli
	993BF224FkhinjD2+JyqlejSoLDW0g==
X-Google-Smtp-Source: ABdhPJxcJb/XqsmIRQMb2lYc01pOYbvBfafkRH51jgoAfdrhlG47KxqXZcw3D1gUMxkbvYi213aErA==
X-Received: by 2002:a05:6808:1599:b0:32b:18e3:3e04 with SMTP id t25-20020a056808159900b0032b18e33e04mr15943062oiw.227.1654113754778;
        Wed, 01 Jun 2022 13:02:34 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i15-20020a056871028f00b000f342119f41sm1064127oae.42.2022.06.01.13.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 13:02:34 -0700 (PDT)
Received: (nullmailer pid 340030 invoked by uid 1000);
	Wed, 01 Jun 2022 20:02:33 -0000
Date: Wed, 1 Jun 2022 15:02:33 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: y.oudjana@protonmail.com, miles.chen@mediatek.com, matthias.bgg@gmail.com, linux-clk@vger.kernel.org, kernel@collabora.com, wenst@chromium.org, devicetree@vger.kernel.org, rex-bc.chen@mediatek.com, martin.botka@somainline.org, chun-jie.chen@mediatek.com, ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, weiyi.lu@mediatek.com, konrad.dybcio@somainline.org, linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de, ikjn@chromium.org, paul.bouchara@somainline.org, fparent@baylibre.com, sam.shih@mediatek.com, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, marijn.suijten@somainline.org, sboyd@kernel.org, ck.hu@mediatek.com, mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org, tinghan.shen@mediatek.com, jason-jh.lin@mediatek.com, bgolaszewski@baylibre.com
Subject: Re: [PATCH v2 3/7] dt-bindings: reset: Add bindings for MT6795 Helio
 X10 reset controllers
Message-ID: <20220601200233.GA339992-robh@kernel.org>
References: <20220518111652.223727-1-angelogioacchino.delregno@collabora.com>
 <20220518111652.223727-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220518111652.223727-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_130238_751785_858A5D7F 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 18 May 2022 13:16:48 +0200, AngeloGioacchino Del Regno wrote:
> Add the reset controller bindings for MT6795.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  include/dt-bindings/reset/mt6795-resets.h | 50 +++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 include/dt-bindings/reset/mt6795-resets.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
