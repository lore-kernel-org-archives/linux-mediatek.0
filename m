Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5154C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 09:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eH/bIR5zi12TgHpDTtc1EGishVJujqrdXpCuKtTrfps=; b=Us171Dm1BXcAP2
	O99GtBmLKmRxiiL0iHTQsivBmsALgUG+impPEfprBajxUZj4X+gENtZGv/yDDJQl7xnSJvfoI2Ang
	+tHZeipogTA4/PwrDEDBhrEhBeSGELnNeXcz689iCqp2FAPiRNrmduqUGaMe7XOOsLVggNUz1jN0W
	DzPs1WhK9OtOtwwIrp9WoaS3YBQoeuEtd1hcUUlPjMdgnNCYA6wsWPB/UgRBzLGCLCuQp7D7+cDSh
	qm+X4hq3NNd201kP5laWabaAEgZLBdeiA50UqN02CGNDGfqywlz2feXYFjWFgRODtksanz1Je8r9l
	/gRHK1rymVAc87v8NCmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmYBy-00F8Lp-Ha; Thu, 05 May 2022 09:54:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmYBo-00F8Jw-6P; Thu, 05 May 2022 09:54:29 +0000
X-UUID: 3d49fff482d44c3589769334a01f1927-20220505
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:db81ff9b-7b18-4af0-b75c-42166af28efe, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:99144f16-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 3d49fff482d44c3589769334a01f1927-20220505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 238159078; Thu, 05 May 2022 02:54:21 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 May 2022 02:47:14 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 5 May 2022 17:47:13 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 5 May 2022 17:47:13 +0800
Message-ID: <9bddb8595ab7a8a9ca598aa7a90eb52c75916499.camel@mediatek.com>
Subject: Re: [PATCH v5 0/9] cpufreq: mediatek: Cleanup and support MT8183
 and MT8186
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <rafael@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <khilman@baylibre.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 5 May 2022 17:47:13 +0800
In-Reply-To: <20220505085358.nmohfx3akk7to46r@vireshk-i7>
References: <20220504130540.5902-1-rex-bc.chen@mediatek.com>
 <20220505085358.nmohfx3akk7to46r@vireshk-i7>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_025428_271955_DF0B3129 
X-CRM114-Status: GOOD (  10.65  )
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

On Thu, 2022-05-05 at 14:23 +0530, Viresh Kumar wrote:
> On 04-05-22, 21:05, Rex-BC Chen wrote:
> >   arm64: dts: mediatek: Add opp table and clock property for MT8183
> >     cpufreq
> >   arm64: dts: mediatek: Add MediaTek CCI node for MT8183
> >   arm64: dts: mediatek: Add mediatek,cci property for MT8183
> > cpufreq
> 
> I guess these would also go through my tree? Please get them acked by
> SoC maintainers.
> 
> I would also need an Ack from Rob for the binding patch.
> 

Hello Viresh,

I also mail to Matthias who is mediatek soc maintainer.
As for binding, I think we need to wait for the review from Rob or
Krzysztof.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
