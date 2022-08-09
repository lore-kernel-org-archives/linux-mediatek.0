Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC073C19F2D
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Aug 2022 19:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FUZurhOVWbSFlq4M53I1Rb6VAfl1vXlk/stu+pqTW7s=; b=hNkI6x7Kg31YsUI2zSLlerOd7i
	xL5c6SkbQBYttjzUWrKM7vbGUTwa0TZ/RZUao64Jy1cC1MvhQSiY227Dlu07JHwsLTvgkGCgaEy5L
	PZ1ddYgod8I7CYUSYJ7aRkLfbQ+XQiX+01VeXaD2ZgSAjcYrpT4Mkt2OT0owhzkbAqrIXFEyjLnYn
	AYuOakMLJYz/JOK0LeLAtgMgOE4jNXE/61xa3g+oekTvUTwoJ8eXZarLt4wFaVNvAC+Nf26XjFJ7e
	r4YRPOpUMRRfNv1j84g8e1kn0Sqjv8kLkntD4JvWIRAxCcNnkAIyfPjN5Sc8waxmCTgDtP8OlZJuV
	L8LpY7/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLVC1-005zIE-Le; Tue, 09 Aug 2022 19:47:09 +0000
Received: from mail-il1-f176.google.com ([209.85.166.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLVBi-005zCT-SM; Tue, 09 Aug 2022 19:46:52 +0000
Received: by mail-il1-f176.google.com with SMTP id j20so7108134ila.6;
        Tue, 09 Aug 2022 12:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=FUZurhOVWbSFlq4M53I1Rb6VAfl1vXlk/stu+pqTW7s=;
        b=3e6fQI4fJou+cYNU6G/B2N9aWQZKIDXh/AHMu8fGpbS6MDNOfln8FUbF65oW8H47Bv
         DygfJabsrnrL2/BRHIu2U3PyVsbxMwF3Za03ndk9B89NJUigeSelOmkLh/330qR9dNuP
         mZPGgUVABPziccT0fydfB5QdzJ+ZWmyR/JUsRCbZsDkPWcvhwPJlLRcpbBDmxQrYnpGn
         pjMX7G7vwiMPtYyau05rT219Kyfe51P8Ld5CrAuX6dfPKJhcs3jWUn7jybZThGYQmpMB
         mCygjh45TI9BNBCldc9ZYqfTodzSS6u+/Uwmyg4PAsigL1V0e2t2Ciget0lmijRoPdv1
         dQEA==
X-Gm-Message-State: ACgBeo1FtR91xPbeFGharEbAZSNWucKMQQsy55eMgSueBvArFj2oEd7q
	hAmidmDvmKbR4G3T0TCWWo5EEPO4EQ==
X-Google-Smtp-Source: AA6agR6tDsZo27ZLWdYBCuktolWxGN7xvWY3iudAMl4Ek0rvZPqnjNE6AERrQZNVv3UbX1qewNYK1w==
X-Received: by 2002:a05:6e02:1aa7:b0:2de:b9f1:593f with SMTP id l7-20020a056e021aa700b002deb9f1593fmr10779350ilv.243.1660074409570;
        Tue, 09 Aug 2022 12:46:49 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b3-20020a056638388300b00342f67a4789sm3448164jav.164.2022.08.09.12.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 12:46:49 -0700 (PDT)
Received: (nullmailer pid 2272995 invoked by uid 1000);
	Tue, 09 Aug 2022 19:46:47 -0000
Date: Tue, 9 Aug 2022 13:46:47 -0600
From: Rob Herring <robh@kernel.org>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Cc: krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, msp@baylibre.com, jitao.shi@mediatek.com, p.zabel@pengutronix.de, tzimmermann@suse.de, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, ck.hu@mediatek.com, linux-kernel@vger.kernel.org, deller@gmx.de, wenst@chromium.org, linux-fbdev@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, angelogioacchino.delregno@collabora.com, mripard@kernel.org, granquet@baylibre.com, chunkuang.hu@kernel.org, liangxu.xu@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, airlied@linux.ie
Subject: Re: [PATCH v16 1/8] dt-bindings: mediatek,dp: Add Display Port
 binding
Message-ID: <20220809194647.GA2272961-robh@kernel.org>
References: <20220805101459.3386-1-rex-bc.chen@mediatek.com>
 <20220805101459.3386-2-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220805101459.3386-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_124650_933413_AD381D76 
X-CRM114-Status: GOOD (  11.87  )
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

On Fri, 05 Aug 2022 18:14:52 +0800, Bo-Chen Chen wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This controller is present on several mediatek hardware. Currently
> mt8195 and mt8395 have this controller without a functional difference,
> so only one compatible field is added.
> 
> The controller can have two forms, as a normal display port and as an
> embedded display port.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dp.yaml         | 116 ++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

