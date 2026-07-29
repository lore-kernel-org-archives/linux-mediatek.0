Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA25C53219
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2026 02:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyD2ZLyTq5wiEGeeAjWZ6IXuUql2AWbemWMgNg/K29s=; b=uhEed8pmEvhe9IHH9abM4bqC3H
	zmT6ySDi60CjzKL/jwjynYNt1vP6FV9voXyFB0R2cs9oMW7kawVCBJwLdo8lUEZ9ay8TbawkYPr1C
	OmnBZ6EjiUwz3UcR70VsrZATfsNptYH78uZjyyXlSP0N4G+fCaS+Mks97IJRt4TLxYURTqZUstORD
	Md+zpIS4uFgSiOQ0Kwnp/CwztY1SLN5fuv/Dp8ZgVXrE89OTZ7yPSS47DtzjW4ieH48WthOElHWm2
	uquIehdXtxsivF8eEzTd3g1h/+mJJoAMJwY9WIR3qGLFSFqkOKsS9JmrSSgHS+eIhtZXoNnHsqguj
	5iC/hQZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wou89-00000006i49-00yC;
	Wed, 29 Jul 2026 02:34:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wou86-00000006i34-31OM
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Jul 2026 02:34:47 +0000
X-UUID: 0b964c3e8af611f1acbe4559397dec65-20260728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nyD2ZLyTq5wiEGeeAjWZ6IXuUql2AWbemWMgNg/K29s=;
	b=WuOhQ1q5eRTNAVVfACdte3xw3F4tgtWoZG47rptcSEiPcCKS2mVMM7IpRZbMbEP5AzISyq9SPIpbwkP5tZ7/yELI3DWbSWGbfdFieiAU4GE4LKSArhqiiMtE0MA8WgYW9FRzli5CF/5QMkSCIwStD8D5UACIhJdn/ijn6pfK3v4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:85d5573d-d781-4d8f-856e-71e60294c2ef,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:8a735a6,CLOUDID:001c8fa9-cb7c-4e20-9880-6cc7cfd6c326,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0b964c3e8af611f1acbe4559397dec65-20260728
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <eason.lai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1419815078; Tue, 28 Jul 2026 19:34:38 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 29 Jul 2026 10:34:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 29 Jul 2026 10:34:36 +0800
From: Eason Lai <eason.lai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<kun.wu@mediatek.com>, <deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<quan.zhou@mediatek.com>, <ryder.lee@mediatek.com>, <leon.yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>, <eason.lai@mediatek.com>
Subject: [PATCH v2 0/3] wifi: mt76: Fix TX performance degradation when IOMMU is enabled
Date: Wed, 29 Jul 2026 10:34:31 +0800
Message-ID: <20260729023434.1105517-1-eason.lai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260709075558.1654164-1-eason.lai@mediatek.com>
References: <20260709075558.1654164-1-eason.lai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_193446_770988_F7B86F9F 
X-CRM114-Status: UNSURE (   9.66  )
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

This series adds a TX preallocated buffer mechanism to fix the TX performance degradation observed after enabling IOMMU.

Currently this feature is only enabled on MT8196, where it has been validated.

Changes in v2:
 - Reword cover letter subject to add wifi: mt76: prefix

Eason Lai (3):
  wifi: mt76: Separate skb and ptr pointers in mt76_txwi_cache
  wifi: mt76: mt792x: Add TX page pool support for IOMMU-enabled systems
  wifi: mt76: mt792x: Restrict TX page pool to MT8196  platform

 drivers/net/wireless/mediatek/mt76/dma.c      |  28 +-
 drivers/net/wireless/mediatek/mt76/dma.h      |   3 +
 drivers/net/wireless/mediatek/mt76/mt76.h     |   9 +-
 .../wireless/mediatek/mt76/mt76_connac_mac.c  |   6 +
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |   2 +
 drivers/net/wireless/mediatek/mt76/mt792x.h   |   1 +
 .../net/wireless/mediatek/mt76/mt792x_dma.c   | 279 +++++++++++++++++-
 7 files changed, 317 insertions(+), 11 deletions(-)

-- 
2.45.2


