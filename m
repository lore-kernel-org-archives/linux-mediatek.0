Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED458C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Dec 2022 09:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rCm7hH5uXZuEM5snO1A0LAgtMHllZa9phPVhoVRh7Lw=; b=xhErE7V8desullVu1aXh94Dt4i
	3q/aWlUrCAEAOX8x21tYm9h2PFjWaScj5Amf/qF9EDw7shJED90v7GwavBttgxjVfc1u5xNoKeZtM
	Az02pynml85g80mi3c5vN4/pynOwRQoTiwLHJIvou2FuVt8oHRrS9Zz/uPhg0f9/kU5KrlKLbzyPF
	6HqAePI03uw/XiXvUM6CGO1hnaOQGp6M4iKTZ/SNNwBp6107H31em1cfd9tL6RxtZKRoeYeHdNn3d
	jL1QxX1RwNtvtYcP56bQw+6nNRAK7kjrrD076A8jxgN2wQbCw0Z8HoJrs85lwbNQVEVOFDgPzfeBm
	U80UnhEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pApPM-00EIbL-9x; Thu, 29 Dec 2022 09:41:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pApPH-00EIZu-Sp; Thu, 29 Dec 2022 09:41:01 +0000
X-UUID: 58235f354de64651876f891c626e6f7c-20221229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=rCm7hH5uXZuEM5snO1A0LAgtMHllZa9phPVhoVRh7Lw=;
	b=fKG6olQZRBtTJOcI+DifSraGDoVzQyoG5r70bcYEIXXWCCcHBIYTGe6GPfHsZQGoH7LWk/9fdtzenSygo5a2wWK3nYNdKMdLG1jZ1xYgsTWlmFEaOrAvHfE1y5NR2Uz/XpPaxxbgfC0DvpMgjMllLUtNFwlz+1GPSHPByjesxSs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:31a5d59d-6932-4d0c-adfd-d89285f68cfc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:09771b1,CLOUDID:83064bf4-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 58235f354de64651876f891c626e6f7c-20221229
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 266712480; Thu, 29 Dec 2022 02:40:57 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 29 Dec 2022 17:40:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 29 Dec 2022 17:40:23 +0800
From: <chris.lu@mediatek.com>
To: <jwboyer@kernel.org>, <dwmw2@infradead.org>, <ben@decadent.org.uk>,
	<marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <sean.wang@mediatek.com>, <soul.huang@mediatek.com>,
	<yn.chen@mediatek.com>, <robin.chiu@mediatek.com>, <Deren.Wu@mediatek.com>,
	<Tom.Chou@mediatek.com>, <steve.lee@mediatek.com>, <jing.cai@mediatek.com>,
	<linux-firmware@kernel.org>, <linux-bluetooth@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Chris.Lu <chris.lu@mediatek.com>
Subject: [PATCH v2] linux-firmware: update firmware for mediatek bluetooth chip (MT7921)
Date: Thu, 29 Dec 2022 17:40:19 +0800
Message-ID: <20221229094020.26547-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_014059_963137_6E288B3D 
X-CRM114-Status: UNSURE (   6.32  )
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

From: "Chris.Lu" <chris.lu@mediatek.com>

*** BLURB HERE ***

Chris.Lu (1):
  linux-firmware: update firmware for mediatek bluetooth chip (MT7921)

 WHENCE                                  |   2 +-
 mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin | Bin 527150 -> 527662 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

-- 
2.18.0


