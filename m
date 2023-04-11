Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCC7C7619A
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 10:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0NtnqZs2P9N8mSYcOTQ44Mza0LeqD4/w26LdwETFfqg=; b=JVkV+jGknSKImvsnM+gwsl2xjF
	wN+JUXIqK6eXi/c5wtdZc8lE6GTpVDc4iGI6VSwPvysdQ0P5bDyrM5c/Blai/KwNPZ57Gul1YRUAr
	bd3ctu7iz24HtwT3wbV0nfrf5bHBpsjXkOHqxOsBbZoVJ4e1njTfMtJThSAKQS7mJBYd599IhBBcM
	EwNimxkq1VWYSZFWt1K/Tl5fnN52Cc/vFMAOIi2sROBrvZGkjdxbciIzlsQMcNrXjoNbKPzjBYJuK
	GqMDb/4wimVp60iD8UszpiHdefOuWJcKrShS2piUAuqS+zOjF8iCGCvWsiJuykeZBkbouaqf51d8H
	aAD0cohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmB8i-00HEZU-0s;
	Tue, 11 Apr 2023 10:22:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmB8e-00HEYs-1W;
	Tue, 11 Apr 2023 10:22:13 +0000
X-UUID: b52227d2d85211ed8687db9d93187ff1-20230411
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0NtnqZs2P9N8mSYcOTQ44Mza0LeqD4/w26LdwETFfqg=;
	b=mpwTKkQFNUUoptZe1QXFNKL2KpdmLn+xO4hDUYhYnnMULktUATSW3hHUmeq1R4wjbotr64YPVsH3lnUBFF1o2QXa9ZgZqm9jb7lDzK1vsYd7VmdZDmBlh43ts284Xp45yQ2drVJ2VRB7YoFuYSOIO1pW6KId9SoP3PtIyGG0CZs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:85ce2ac6-16f3-4981-a29c-af2d975ee004,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:a4d5af83-cd9c-45f5-8134-710979e3df0e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-UUID: b52227d2d85211ed8687db9d93187ff1-20230411
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <mark-pk.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1135391627; Tue, 11 Apr 2023 03:22:05 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 11 Apr 2023 18:22:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 11 Apr 2023 18:22:03 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <mark-pk.tsai@mediatek.com>
CC: <gregkh@linuxfoundation.org>, <johan+linaro@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
	<maz@kernel.org>, <stable@vger.kernel.org>, <tglx@linutronix.de>
Subject: [PATCH 5.4 3/3] irqdomain: Fix mapping-creation race
Date: Tue, 11 Apr 2023 18:22:03 +0800
Message-ID: <20230411102203.29646-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230322124550.29812-1-mark-pk.tsai@mediatek.com>
References: <20230322124550.29812-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_032212_518307_5D8F96BF 
X-CRM114-Status: GOOD (  11.16  )
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

> From: Johan Hovold <johan+linaro@kernel.org>
> 
> [ Upstream commit 601363cc08da25747feb87c55573dd54de91d66a ]
> 
> Parallel probing of devices that share interrupts (e.g. when a driver
> uses asynchronous probing) can currently result in two mappings for the
> same hardware interrupt to be created due to missing serialisation.
> 
> Make sure to hold the irq_domain_mutex when creating mappings so that
> looking for an existing mapping before creating a new one is done
> atomically.
> 
> Fixes: 765230b5f084 ("driver-core: add asynchronous probing support for drivers")
> Fixes: b62b2cf5759b ("irqdomain: Fix handling of type settings for existing mappings")
> Link: https://lore.kernel.org/r/YuJXMHoT4ijUxnRb@hovoldconsulting.com
> Cc: stable@vger.kernel.org      # 4.8
> Cc: Dmitry Torokhov <dtor@chromium.org>
> Cc: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Tested-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Link: https://lore.kernel.org/r/20230213104302.17307-7-johan+linaro@kernel.org
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>

5.4 also need this patch.
Could someone please help to review it?

Thanks,
Mark-PK Tsai

