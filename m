Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8765C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 19:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ou2iWBMYAeA/yRIZnkILz0jhRRskqquaQO86kp7WlKY=; b=E5F4w1Ee/2Ev5W9VErNdmVAnO/
	NZUKSSQ00dUfSVI+apr3I5mkbsFEMSTdbFDvwROl9rqN44qt3ijEiVtapiugAVbuJYM1/rosExvqI
	oTPe5PzoG1VrdKi+J4xPqSnVP7N93HcBWq8iTadhPHMeOq7/pORnswKoIKN08tvcuhX75Y7p4aItZ
	WhDg+SyKV7j9mpCeJYyheoVXwFU8drbvmOpoz94mpxPIlAY1xX7jkW0HDjVNGi7tSjLF6h4xFDDhv
	wRZq2lrZzlyt2uo8WQHkP7Jza0Lb/1sDpiaEKqS4xViGDqtLfMZZ7vupS8WteeFI9SqmrCu74Es4M
	TxMnD0kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWbx-004mGT-Dz; Thu, 06 Oct 2022 19:32:49 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWbm-004mBM-Br; Thu, 06 Oct 2022 19:32:39 +0000
Received: by mail-oi1-f176.google.com with SMTP id o64so3150266oib.12;
        Thu, 06 Oct 2022 12:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ou2iWBMYAeA/yRIZnkILz0jhRRskqquaQO86kp7WlKY=;
        b=mwwFjY4N1RyYQrWq0h06fBS8G4Q38mAr4yYldsicDQMNGGgJwstRcbwUzYb65bSVXp
         ljqIEyvqA3hU4e6wAhgIx8DgnI2Pplr5JSt1DwtJjY80EIVdi8yozZfc8es0Z3peflFt
         mp9p0iRKDJbOml5ZW83JYyZm9Db90+K4JvCIcQmWuTosDmt6Z+lUZRNXXQl4KnBW365z
         hsU+JLRf/XZ1B/VeR22Nuj6qhJ7C4PC8bSvH2fx1IhYFpc2U2LGk+XTxVE8ORUm3KRLU
         xUz5wDffRyhOxFJVUHx0uW3y6BSMCLtm/HMJnVWwXZSA5TleJCnaWEDpUADxhuvmfTsE
         PGsg==
X-Gm-Message-State: ACrzQf03Uzg7doG+sAcq9mB0ZMaz7LjtYnjHN9SM2ma6NOiNfOuz971s
	ey0H7Nchsol05ls++samfg==
X-Google-Smtp-Source: AMsMyM6+iKp6n/gVIENPluD3O291vWyTSKOHTvo1T/SMpsq0uv6Gqf3JBN4hgfpp+k6Ft2W1pkEHoA==
X-Received: by 2002:a05:6808:118e:b0:345:9c3e:121d with SMTP id j14-20020a056808118e00b003459c3e121dmr624143oil.211.1665084757531;
        Thu, 06 Oct 2022 12:32:37 -0700 (PDT)
Received: from robh_at_kernel.org ([2607:fb90:8a65:c536:245:842:a3a4:9017])
        by smtp.gmail.com with ESMTPSA id z90-20020a9d24e3000000b00655c6b2655esm171173ota.68.2022.10.06.12.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 12:32:36 -0700 (PDT)
Received: (nullmailer pid 60798 invoked by uid 1000);
	Thu, 06 Oct 2022 19:32:35 -0000
Date: Thu, 6 Oct 2022 14:32:34 -0500
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andy Teng <andy.teng@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Yassine Oudjana <y.oudjana@protonmail.com>, linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 09/10] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Document MT6735 pin controller bindings
Message-ID: <166508475428.60747.9048131740903882168.robh@kernel.org>
References: <20221005174343.24240-1-y.oudjana@protonmail.com>
 <20221005174343.24240-10-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005174343.24240-10-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_123238_423849_1DC2701B 
X-CRM114-Status: GOOD (  11.51  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 05 Oct 2022 20:43:42 +0300, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add bindings for the pin controller found on MediaTek MT6735 and
> MT6735M SoCs, including describing a method to manually specify
> a pin and function in the pinmux property making defining bindings
> for each pin/function combination unnecessary. The pin controllers
> on those SoCs are generally identical, with the only difference
> being the lack of MSDC2 pins (198-203) on MT6735M.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

