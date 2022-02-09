Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6AEC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 03:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8KEDU7W3lmWNoUQhL554TPvqxA5xBt0F/r4e4l8TqiQ=; b=Dt7nFSspBD9i8t
	i2iJZVlNKYFuEgzSvkPycES7/08GUbQnmDyknb3fv4IgNpDdG7CRMGMZ7apdZ+TtXCU8t8zm8divW
	0xcjU57kXp1V0KpWyqlqU0/b6fTVtfSN5ZLmkgZKox8XsLexruiSCtqQtsRkEJ+8/bn90GMes5Mxv
	DzhSTBNt2n17kR9P7LFfI2/jEvyXOWi2VVxMjm+LdtWllGozdtlksyW1GRPkFLQbHINzpv19r7FmF
	c2t9Hb/wVapVk5DB/FUtG4ejEQEWvLiklrKja1FgzW/QkqpH5M5lKuDoK1di90BrBfe46PD39XFI9
	DN5TJoUD8t9A24NLYH1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHdS9-00G4vI-R4; Wed, 09 Feb 2022 03:15:33 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHdRy-00G4t3-KE; Wed, 09 Feb 2022 03:15:23 +0000
Received: by mail-oi1-f170.google.com with SMTP id u13so1201388oie.5;
 Tue, 08 Feb 2022 19:15:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MJCtSboYT6/FzFkykJymBzPa+HtdV+toCECownbioaY=;
 b=c1HeHq8MqqWw+Eor5Tdo7uOOfbIsSMQ8FcUp/N9r6+KsSTr2XOGkxPsimaTUZS4mpo
 VEYHqnMuM/FHDIfVm1r5CqYEdunsrZ8M1Tk1l27JWxf30NqKzuclQHRuw2KrH1oAg0PB
 2dcQ8hhUnbmKSQMWY++Iuon+HO2dELj9eSksWrNvJU7KAJHxVdN+CceHiTF35j16CO20
 4TOVn1jxukPq/FeCzyFih40Yjdcw//C11Ko3YrrINstUi2mkSa5AFcnsEfZB4DyiCYY8
 nt00h827wgVdTDu/TKD2d3fHRYCzhGZkrdyaeLhXFgagBcPKt63LCBg03e4ely7QAJUo
 GYww==
X-Gm-Message-State: AOAM532FEwBrSuq7y0e4cdLLfAsRB/t3sCYDVNHw8g1kvM2d+jLUmZEk
 CSGT2ScYg+XVPVixtBu40Q==
X-Google-Smtp-Source: ABdhPJwdf+t06UGFJrNWAzD6ZQ6SffxtFCOI3Zx37S5Z0p0n4x6v109e9VJ4zIoDm5w0/CB30nKSmA==
X-Received: by 2002:a05:6808:2214:: with SMTP id
 bd20mr461324oib.159.1644376521985; 
 Tue, 08 Feb 2022 19:15:21 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id s3sm6096547otg.67.2022.02.08.19.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 19:15:21 -0800 (PST)
Received: (nullmailer pid 3560138 invoked by uid 1000);
 Wed, 09 Feb 2022 03:15:19 -0000
Date: Tue, 8 Feb 2022 21:15:19 -0600
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, devicetree@vger.kernel.org,
 Will Deacon <will@kernel.org>, libo.kang@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, yen-chang.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Tomasz Figa <tfiga@chromium.org>,
 linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, youlin.pei@mediatek.com, yf.wang@mediatek.com,
 mingyuan.ma@mediatek.com, chengci.xu@mediatek.com, xueqi.zhang@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, anan.sun@mediatek.com,
 iommu@lists.linux-foundation.org
Subject: Re: [PATCH 1/2] dt-bindings: mediatek: mt8186: Add binding for MM
 iommu
Message-ID: <YgMxxx+b77IHQIbq@robh.at.kernel.org>
References: <20220125093244.18230-1-yong.wu@mediatek.com>
 <20220125093244.18230-2-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220125093244.18230-2-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_191522_687326_2760F00B 
X-CRM114-Status: GOOD (  11.00  )
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

On Tue, 25 Jan 2022 17:32:43 +0800, Yong Wu wrote:
> Add mt8186 iommu binding. "-mm" means the iommu is for Multimedia.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  .../bindings/iommu/mediatek,iommu.yaml        |   4 +
>  .../dt-bindings/memory/mt8186-memory-port.h   | 217 ++++++++++++++++++
>  2 files changed, 221 insertions(+)
>  create mode 100644 include/dt-bindings/memory/mt8186-memory-port.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
