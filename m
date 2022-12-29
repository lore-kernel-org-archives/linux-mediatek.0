Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B4DC3DA79
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Dec 2022 10:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rCm7hH5uXZuEM5snO1A0LAgtMHllZa9phPVhoVRh7Lw=; b=zK1V+mYmvNZS2LXil1Kg/3FTU8
	93QuE1TqjznthXhzWu2aDUVdGCcPcLFe7Xm9hMqF+WEVxJe7H8r+b8Ep1QwbL51e93fxXH6QwN8h3
	ldSaYOSCIkGvYegqs9AVqMXYdemHCRGnOyBZfMbHLXdjCES7BxSEroLkVBaCo+RvzRyyU6GU1UV85
	lRws1BUaHuT733JMiFkSVFeMUBdxrqhoFjGLgUbbBRJ04KU4B7VWDTooCAqL6bORGlIqFXzQuxGD6
	KymAkUqOxOtJj8fWXnbx4vPS108c9Qb40c5zVnKc3fQTma7rWWjhxy/uPjQKktyP43dAKvJ2EwtAp
	F8SPHWWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pApsd-00EXyG-Cr; Thu, 29 Dec 2022 10:11:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pApsa-00EXwR-DV; Thu, 29 Dec 2022 10:11:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=rCm7hH5uXZuEM5snO1A0LAgtMHllZa9phPVhoVRh7Lw=; b=Y0wlYpGIUFCQkRdN2evvBbJfuk
	ZRHfrCZBtSO1jV7NceW3pN0sImdiNUcwx5sziVF0RFMTgvXOYngQlT0vxd0Ez9dQTNQo3Yq2bJFWs
	z9sWk4HBS3VGMceV2M8yFWlDLxQk+Bd0t0qBwHFkRdD+RJG1pK1ipkOaXMJVNKCilnB4K7XcKnAGn
	tlMfcl+95gc+0ORE1FKQqxYE4ZvD9bY4nlZzrDaPMlsuzJoz444o2CEj5aIhzBVuCoGTofR93Crap
	vfwof1Oh7lmWXrtjArgzeAuU6imc8bjWeKpyfYIS8x7c9LpKyAbbb3jNhVxMSWkoyDKurDNVboKPk
	ALXRiTTA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pApsQ-00GNBM-1M;
	Thu, 29 Dec 2022 10:11:10 +0000
X-UUID: 8c6ddde6461445ab80d35a414e4ff39f-20221229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=rCm7hH5uXZuEM5snO1A0LAgtMHllZa9phPVhoVRh7Lw=;
	b=bQSdPxzqVlZaNdZe2FPJ71AsB9S06uQ/bEy8ewCbiYceY41hH9Ow7g5wAAh3u4Dk47bu59Rays9thCf+XeEZjuArSdH8IKiuuhNY56gaDU7DkfqTIit5gmaXw6giMSnVjW0tfDbTS0cEfr1xf4KsmLEZrQ7cZJZ9JQxr3aVidH0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:756a57d4-2fc3-4169-a2d4-f6781f409616,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:-32768,SF:-32768,FILE:0,BULK:-32768,RULE:Rele
	ase_Ham,ACTION:release,TS:0
X-CID-META: VersionHash:09771b1,CLOUDID:97172253-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 8c6ddde6461445ab80d35a414e4ff39f-20221229
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 710377983; Thu, 29 Dec 2022 03:10:52 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 29 Dec 2022 17:30:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 29 Dec 2022 17:30:14 +0800
From: <chris.lu@mediatek.com>
To: <jwboyer@kernel.org>, <dwmw2@infradead.org>, <ben@decadent.org.uk>,
	<marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <sean.wang@mediatek.com>, <soul.huang@mediatek.com>,
	<yn.chen@mediatek.com>, <robin.chiu@mediatek.com>, <Deren.Wu@mediatek.com>,
	<Tom.Chou@mediatek.com>, <steve.lee@mediatek.com>, <jing.cai@mediatek.com>,
	<linux-firmware@kernel.org>, <linux-bluetooth@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Chris.Lu <chris.lu@mediatek.com>
Subject: [PATCH] linux-firmware: update firmware for mediatek bluetooth chip (MT7921)
Date: Thu, 29 Dec 2022 17:29:59 +0800
Message-ID: <20221229093000.25369-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_101107_535174_2C1220C3 
X-CRM114-Status: UNSURE (   6.43  )
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


