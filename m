Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39C0C83F11
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Aug 2023 16:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=run78isH9wzuv4qEeW4mY8FxhoAXSLzkLolztccpSzM=; b=ubYXcAFPtVnHBUX1SYC1WwOCFk
	hEKKYeBRfTLHACvab+sWgiH4hiiBEfdPILx0cm2jdbR63AmsmjAlEata8txyNTQz++AZdXZNsS1HI
	g7msLhezD5atv2u7WrofI8WFYAjWNi3m6a41WtpK4zxla90vP1vykJh4HfXE0nwJ08hVxy5UISYl/
	eRt+5hsJCNuSoN5SwIUxaD0tMJ12o2KzVd4fX7s9XQd1na8QH0AHt3cGhtD9gLutj3HajTC0jXdkU
	7jaC0fH84G7UXmRPfa0I8SeR6vPWkiLVdLABFkiagvoG/QIac8Y9QOzG8X/EKkuFWlVbtNvYzToP5
	yN9QaS5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZwNw-0073s1-2a;
	Sat, 26 Aug 2023 16:43:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZwNu-0073ra-0r;
	Sat, 26 Aug 2023 16:43:39 +0000
X-UUID: b08b55ba442f11ee912e1518a6540028-20230826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=run78isH9wzuv4qEeW4mY8FxhoAXSLzkLolztccpSzM=;
	b=PwjqMvbrBO/ZU7p57J5iqNeMWApmC5ERFmMRQbiFU0j57V1ghXhHEJ5LNZ7eUuEJat8Z93KfKbHbUUWMPY0goa0bLZ7DNntkleegp9xriEGptqvXUJyZDhf90Hk6N2/JYF9QcwqV0U4bRvNqfeZoRSKHFnXb7+LkLgzH4zm9X/g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:27f0d25a-54d0-4ffb-b55e-fceada216411,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,BULK:28,RULE:Release_Ham,ACTIO
	N:release,TS:79
X-CID-INFO: VERSION:1.1.31,REQID:27f0d25a-54d0-4ffb-b55e-fceada216411,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,BULK:28,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:79
X-CID-META: VersionHash:0ad78a4,CLOUDID:38b44dc2-1e57-4345-9d31-31ad9818b39f,B
	ulkID:230824185604G6OMGZAT,BulkQuantity:49,Recheck:0,SF:29|28|17|19|48|64|
	102,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40|20,QS:nil,BEC:ni
	l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FCD,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,
	TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_OBB
X-UUID: b08b55ba442f11ee912e1518a6540028-20230826
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <sharp.xia@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1953981753; Sat, 26 Aug 2023 09:43:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 27 Aug 2023 00:43:28 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 27 Aug 2023 00:43:27 +0800
From: <Sharp.Xia@mediatek.com>
To: <shawn.lin@rock-chips.com>
CC: <Sharp.Xia@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-mmc@vger.kernel.org>,
	<matthias.bgg@gmail.com>, <ulf.hansson@linaro.org>,
	<wsd_upstream@mediatek.com>
Subject: Re: [PATCH 1/1] mmc: Set optimal I/O size when mmc_setip_queue
Date: Sun, 27 Aug 2023 00:26:35 +0800
Message-ID: <20230826162635.617-1-Sharp.Xia@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <769a67cb-1b32-fd4f-b37e-e3ec4dab5eb9@rock-chips.com>
References: <769a67cb-1b32-fd4f-b37e-e3ec4dab5eb9@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_094338_317902_33323592 
X-CRM114-Status: GOOD (  14.01  )
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

On Fri, 2023-08-25 at 17:17 +0800, Shawn Lin wrote:
>  	 
> 
>  On 2023/8/25 16:39, Sharp.Xia@mediatek.com wrote:
> > On Fri, 2023-08-25 at 16:11 +0800, Shawn Lin wrote:
> >>   
> >>   Hi Sharp,
> 
> ...
> 
> >>> 1024
> >>>
> > Hi Shawn,
> > 
> > What is your readahead value before and after applying this patch?
> > 
> 
> The original readahead is 128, and after applying the patch is 1024
> 
> 
> cat /d/mmc0/ios
> clock:          200000000 Hz
> actual clock:   200000000 Hz
> vdd:            18 (3.0 ~ 3.1 V)
> bus mode:       2 (push-pull)
> chip select:    0 (don't care)
> power mode:     2 (on)
> bus width:      3 (8 bits)
> timing spec:    10 (mmc HS400 enhanced strobe)
> signal voltage: 1 (1.80 V)
> driver type:    0 (driver type B)
> 
> The driver I used is sdhci-of-dwcmshc.c with a KLMBG2JETDB041 eMMC
> chip.

I tested with RK3568 and sdhci-of-dwcmshc.c driver, the performance improved by 2~3%.
 
Before:
root@OpenWrt:/mnt/mmcblk0p3# time dd if=test.img of=/dev/null
2097152+0 records in
2097152+0 records out
real    0m 6.01s
user    0m 0.84s
sys     0m 2.89s
root@OpenWrt:/mnt/mmcblk0p3# cat /sys/block/mmcblk0/queue/read_ahead_kb
128
 
After:
root@OpenWrt:/mnt/mmcblk0p3# echo 3 > /proc/sys/vm/drop_caches
root@OpenWrt:/mnt/mmcblk0p3# time dd if=test.img of=/dev/null
2097152+0 records in
2097152+0 records out
real    0m 5.86s
user    0m 1.04s
sys     0m 3.18s
root@OpenWrt:/mnt/mmcblk0p3# cat /sys/block/mmcblk0/queue/read_ahead_kb
1024
 
root@OpenWrt:/sys/kernel/debug/mmc0# cat ios
clock:          200000000 Hz
actual clock:   200000000 Hz
vdd:            18 (3.0 ~ 3.1 V)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     2 (on)
bus width:      3 (8 bits)
timing spec:    9 (mmc HS200)
signal voltage: 1 (1.80 V)
driver type:    0 (driver type B)


