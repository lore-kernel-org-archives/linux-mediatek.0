Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D80CC5DF9D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2026 08:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9i6s6p8vgsMvcWKdXghGsBuJ/Y2ADIePCQPvKyAxig=; b=tLrY9ERXjPDI/NtWSCU01kEcFr
	KI8fT8Y0bBkR2Atx6mkN7WGSnBnY1wj0x6vlfnPdI1fCRQIR19fqvs8JDVIvgXromD9gaSSokSQ4l
	dPHBGnE9Z9roxjPhjv1LVY4QSjbbyAuxA+sws9M9p0DOH8NPpENkKQfFfi3/BErlskJB3/myjU2TG
	I3SFWR+MF1ECqEdvu9c+rQvLmm7xyd4aiQ8M0EKL3mFkU6IBSG6RYE8w/KBiHqJFpefSpfgxuFWP5
	C4ZTUCHzj1CV5GKKNl8bO9NGl0dVSPzi7JNKglRGXgfS1/0vLJ0s7yM6M/Ea/ex1vVaVUxCGx12rQ
	u+0PRDLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVaf-00000003eSg-3V7N;
	Thu, 27 Aug 2026 08:36:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVab-00000003eRI-1yNT
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Aug 2026 08:36:05 +0000
X-UUID: 50f49a98a1f211f1afed4741b24580c9-20260827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=O9i6s6p8vgsMvcWKdXghGsBuJ/Y2ADIePCQPvKyAxig=;
	b=CZAvY0s2gwdyEzGHY8vI8VBn5PXOaDaXgJfEVWcejXpw1vb01FLMMmwtzcp0klFLxGdp+Yt3E85x/pVkpf2XPYMA7EvIs6FxNz+pgAI7nKlBliUxpT19vd4q3cDQyR8R8u5ONXvh+CZz21kle5COnrCt9vSW9s+xWTJgsSLsA+I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:c6317165-b468-449c-b316-7a6c1a1b46b5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:141bd82c-3f1f-44ae-95de-cdba08d92009,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 50f49a98a1f211f1afed4741b24580c9-20260827
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <eason.lai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 384088610; Thu, 27 Aug 2026 01:35:53 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Aug 2026 16:35:51 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 27 Aug 2026 16:35:51 +0800
From: Eason Lai <eason.lai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<kun.wu@mediatek.com>, <deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<quan.zhou@mediatek.com>, <ryder.lee@mediatek.com>, <leon.yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>,
	<lucid_duck@justthetip.ca>, <eason.lai@mediatek.com>,
	<stable@vger.kernel.org>
Subject: [PATCH v4 0/2] wifi: mt76: refine USB/SDIO TX path error handling
Date: Thu, 27 Aug 2026 16:35:24 +0800
Message-ID: <20260827083526.1621600-1-eason.lai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260819082129.1062282-1-eason.lai@mediatek.com>
References: <20260819082129.1062282-1-eason.lai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_013603_144509_EE860CAA 
X-CRM114-Status: UNSURE (   7.79  )
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

This series fixes a UAF in the SDIO TX path when out of memory and
a memory leak in the USB TX path.

Eason Lai (2):
  wifi: mt76: mt792x: fix UAF in SDIO TX path when out of memory
  wifi: mt76: fix memory leak in USB TX path

 drivers/net/wireless/mediatek/mt76/tx.c  |  2 +-
 drivers/net/wireless/mediatek/mt76/usb.c | 31 ++++++++++++++++++++----
 2 files changed, 27 insertions(+), 6 deletions(-)

-- 
2.45.2


