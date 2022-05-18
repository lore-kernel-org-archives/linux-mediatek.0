Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91711C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 01:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vsagliAcYhCgSNJhZ1MFzbzsu/Onb0CR4T7/4z2Ugx4=; b=ouGsnE1nOsnUBS
	GNPQU25uETPCZ65zgP9nuM4NFL2WbMl/DpYNnADvnmZB+Ar/5Qktc8BcqN2uL1p06dOKHVYdZ+vw8
	GJKjVzfBBUGUSWcNMbKkHOv05oUBDHEpsY7kAlkvO2uX0aiOmP7Hf5JRe+3O7M6tSgAcAQxooluaF
	uX41/HgQCyR96DlCuw7zygQkylIg1pWvTr3DucF2crd49hZgIsFFopSTDWFGI1Pprt4p0wmXGuyTV
	XvdyYCFta6RKsz/wwPvM+9DJ68sRbUZbWDkwz4UIW41Yirurjc1HYJaj79bS+b2EmSS4amOyn9W5m
	bqdUvnjTZEkXpUw5dRhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr8hE-00GbzU-4u; Wed, 18 May 2022 01:41:52 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr8hB-00Gbxa-FU; Wed, 18 May 2022 01:41:50 +0000
Received: by mail-oi1-f175.google.com with SMTP id y63so1022832oia.7;
 Tue, 17 May 2022 18:41:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=INqLY13hD2JDCbK9Kzj2SkFwh0u4TnDrvBoPZ/nTnLs=;
 b=5fe/XbJGYQ2twKoF96PSgpVkpGYo9BlN4MwNJPmanuyw8cwgVcn+i6lbCT/xwcw+yS
 rmBiLNtYHSSX2iTtCeC2JMGzoMMJU0FKOtEPeX7RGyfEPkt9XsPQcxE3CwT02gwlEIgQ
 mA7h10UL2cGaszcVvag2n8vvA6NHq2ldoIl2S6fCWMWtkpZDp4FxWAun7Gg1OJ+Darfq
 PzTzvOQU/tuX1PKzozswEY4TdUKLxZWRBz3sp6N5Gv/BCht+ThzEhBKaeVlDDlZz9G5q
 irGejl4yMn5xPav+PCqRH8yVIYn+Y8hD4Zrz1fpULaD3LyQZVaNGehYBXfehu5VLMZpr
 zpkQ==
X-Gm-Message-State: AOAM531QAGBKmo2UuALI9QqjfZboYgWCTpo31Qz0MGOAyHzxg8b0PMsG
 9f5QX29enqVoM1OVU8RFVA==
X-Google-Smtp-Source: ABdhPJx139iTWFrPfr5U9wHbjv2MePhCFY50wUeMLu11V52NqLmVBr0mHI4WiJnDdO+yAl/0Q2cQjw==
X-Received: by 2002:aca:e155:0:b0:325:6d76:da4b with SMTP id
 y82-20020acae155000000b003256d76da4bmr12579250oig.125.1652838105035; 
 Tue, 17 May 2022 18:41:45 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 g3-20020a056870a70300b000f174840b4fsm444606oam.17.2022.05.17.18.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 18:41:44 -0700 (PDT)
Received: (nullmailer pid 2044234 invoked by uid 1000);
 Wed, 18 May 2022 01:41:43 -0000
Date: Tue, 17 May 2022 20:41:43 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: yong.wu@mediatek.com, joro@8bytes.org, will@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/8] dt-bindings: iommu: mediatek: Require
 mediatek,infracfg for mt2712/8173
Message-ID: <20220518014143.GA2024242-robh@kernel.org>
References: <20220517132107.195932-1-angelogioacchino.delregno@collabora.com>
 <20220517132107.195932-8-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220517132107.195932-8-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_184149_541220_2F426487 
X-CRM114-Status: UNSURE (   9.99  )
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

On Tue, May 17, 2022 at 03:21:06PM +0200, AngeloGioacchino Del Regno wrote:
> Both MT2712 and MT8173 got a mediatek,infracfg phandle: add that to
> the required properties for these SoCs to deprecate the old way of
> looking for SoC-specific infracfg compatible in the entire devicetree.

Wait, what? If there's only one possible node that can match, I prefer 
the 'old way'. Until we implemented a phandle cache, searching the 
entire tree was how phandle lookups worked too, so not any better.

But if this makes things more consistent,

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
