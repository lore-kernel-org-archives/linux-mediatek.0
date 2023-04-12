Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E386C77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 21:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhMw93yysyOYrwKp1hI3dRgsA4+S2zDf16pTeQ0jQhE=; b=XOlDObgamcM7ZgwkKBfpI6J1Ee
	qH3Po2AX4+88zNNMy3zhILChETNqymBgC1VSuTMtqlkA2P4tQcoAnlSvY/hvTxjjx1FGINeK/WNyj
	lYViSCUUdy4lq7MG15QrDxOtqOeeRV/Cn4hLFjWee8L/3Obhxa524wFGLgCzkwOnrQJ67hw9i4ieD
	t1wwV6c1AHkDjUfBKa76R9fhINpWORLUTe/Xwh294rVt4P7/9lOHL7vUrSuscw6zEmpRJq0Jus0JY
	YU1gbOJgzGs5gn5QSfAW2OAz8TiZ+TQS0XbQc3DxkrTt92kXx8J6HhRvRO7qJW0FKxsUhWMXr4p6w
	KL4/fjMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmiIZ-004Rnl-0b;
	Wed, 12 Apr 2023 21:46:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmiIW-004RmL-2s;
	Wed, 12 Apr 2023 21:46:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xhMw93yysyOYrwKp1hI3dRgsA4+S2zDf16pTeQ0jQhE=; b=UaRffw5V3i51BRwdH+jQklwjuh
	utkwrsGpk14M7rrPKHFyPB1OkY6gzc9evJCxnwkpfrrkUWrM8jtwZ+6WOHwO9xOO06yqfVwibNcRJ
	ZbcBfGoeY8AQgzT+6fUUWopxMjE+NygQrPmQquOej3LYPNrq+RaAXubxrWjCs9awMNo8DD/oH+8c0
	ZvrA3ZiCa5uQKtRG8LL0nzpCrJJVXgX8XBCyCH/PUycbpPQUDSyrwV680qsM6XTAPh7ISsaVfATc2
	/ruk2Ue6Y6V1ecZF3SLPUINz173r01mQCuTKb0gdP4UMfLPBRAQGFKcIlcAnOLogw+CqiHd2ZUnIR
	UY6MqNIg==;
Received: from mail-ot1-f46.google.com ([209.85.210.46])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmhdH-00E2Md-1v;
	Wed, 12 Apr 2023 21:06:16 +0000
Received: by mail-ot1-f46.google.com with SMTP id x22-20020a9d6296000000b006a42c37ddcdso877438otk.1;
        Wed, 12 Apr 2023 14:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681333438; x=1683925438;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xhMw93yysyOYrwKp1hI3dRgsA4+S2zDf16pTeQ0jQhE=;
        b=K5yLmgO9LlLWfNuyKa9Foxbt6dRTJoFhM8jeVb40T//j9053Ins1AUvsRby+yr6cnh
         0ycwSRwoDn6mPe7k2iLwHwPk7M3rzU/LocLQoNtIk/Ep8wkUq7QFH+BLTCoeKBzhCrZs
         8hoEubthMetXj9yUlasx/JOdlewlajxYiu6YvxO1a4y8iSjZGndiX414JkVg4gIrc2TX
         xdAf0bD6RuiRrnQdavhweC82RHtbCm/NUGyyq0bUe6Yp0c+ghjftJn35IljHXWRTb8JS
         cJZipaZlHXFic7rohC8vMmb6IKI4A2qliv3jZivvuY1zZ5pOQOArrozO5ZKxTt1U8xPm
         CcPg==
X-Gm-Message-State: AAQBX9dqoCUp4U4bvLLuzfyARrePYxInzGxHTCR46pJhQosxM/O2KHdE
	0waM3gTlOCYplEO4XVcKyQ==
X-Google-Smtp-Source: AKy350bDX+UH3xmkYuUvscW0CL6cCSZRAiDFFLGLOqiUOEqq1NjVCfl2xG/WT5gMBlmEZh0qKgWGKg==
X-Received: by 2002:a05:6830:146:b0:6a1:3101:8e29 with SMTP id j6-20020a056830014600b006a131018e29mr9619627otp.18.1681333437931;
        Wed, 12 Apr 2023 14:03:57 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e26-20020a0568301e5a00b0069fa776d3c2sm54079otj.18.2023.04.12.14.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 14:03:57 -0700 (PDT)
Received: (nullmailer pid 3200535 invoked by uid 1000);
	Wed, 12 Apr 2023 21:03:44 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, chunfeng.yun@mediatek.com, kishon@kernel.org, chunkuang.hu@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht, matthias.bgg@gmail.com, thierry.reding@gmail.com, devicetree@vger.kernel.org, kernel@collabora.com, u.kleine-koenig@pengutronix.de, daniel@ffwll.ch, jitao.shi@mediatek.com, linux-pwm@vger.kernel.org, robh+dt@kernel.org, jassisinghbrar@gmail.com, phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, airlied@gmail.com, ck.hu@mediatek.com, vkoul@kernel.org, houlong.wei@mediatek.com, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, p.zabel@pengutronix.de, xinlei.lee@mediatek.com
In-Reply-To: <20230412112739.160376-8-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-8-angelogioacchino.delregno@collabora.com>
Message-Id: <168133319439.3191194.3289065027670891182.robh@kernel.org>
Subject: Re: [PATCH 07/27] dt-bindings: display: mediatek: rdma: Add
 compatible for MediaTek MT6795
Date: Wed, 12 Apr 2023 16:03:44 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_220410_257842_4B007B64 
X-CRM114-Status: UNSURE (   9.95  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Wed, 12 Apr 2023 13:27:19 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795's RDMA block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml   | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230412112739.160376-8-angelogioacchino.delregno@collabora.com


rdma@14008000: 'power-domains' is a required property
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb

rdma@14012000: 'power-domains' is a required property
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb


