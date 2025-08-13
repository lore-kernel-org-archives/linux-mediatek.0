Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A190CA0EDC
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Aug 2025 01:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XwMXWexvt6tR9BupyFp6yXOjD8SMPvd/Ny1SKZuMldg=; b=GKW5Oiia1M4gAvkTUuCKcxFfcr
	HlBrRkXIVQfOTc+vm6M87rapgh108GeNNUL4tJR3Z+Fy+wnQK8lAe0kT4I3RDJ30jT62kLnnBQ0FD
	GuYYlZ/+8tLOog1CoTClq4G0rpB+vGHsUfYNRtGuIjGi+2l5y9+YV2hd1mw4G4lG8VE4/oRnvjD43
	4Jwpui19yEY43z/KCtd5CxxN3CLsxbT33I/1lzLA8CZNKtAS9nnWHAtK7STKgb9IAibXQAO8i/bi0
	bX1A8NGupxM+VJD+1N5+B8wHTTiZZDqny0b+HfTRwaiMXzxu+31uAI1EIdcPBgYkLYun+Li2aZ2oI
	WL81YgmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um0ky-0000000CNRc-1QVM;
	Wed, 13 Aug 2025 01:58:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um0kv-0000000CNQv-2HTW
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Aug 2025 01:58:22 +0000
X-UUID: f887074477e811f09f706fa2197c6ceb-20250812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=XwMXWexvt6tR9BupyFp6yXOjD8SMPvd/Ny1SKZuMldg=;
	b=JmpjB5zYXgtAa9RvOLrRcwG/ZAZjUzVjQCQDgZ/m731UKpm/AgVc+6EMay6mFOZN0jIrHAGfD4TyaRgvd0YlDQk2gEwbHthTwllnX6+lWVHp+7I7RmZt1+yNVXu3+G894gcWqo+D/Jl7gegD7TckNOsScY7XAxBeJ7X0WeX9A3Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:d30817aa-9eae-430f-b202-1404472c0b44,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:f1326cf,CLOUDID:ae32e09d-7ad4-4169-ab95-78e9164f00fe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f887074477e811f09f706fa2197c6ceb-20250812
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <huayu.zong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1426714116; Tue, 12 Aug 2025 18:58:13 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 13 Aug 2025 09:58:09 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 13 Aug 2025 09:58:09 +0800
From: Huayu Zong <huayu.zong@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <shawnku@google.com>
Subject: pull request: linux-firmware: Create Mediatek MT8189 SCP firmware
Date: Wed, 13 Aug 2025 09:53:22 +0800
Message-ID: <20250813015808.26203-1-huayu.zong@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_185821_591212_7AA62A42 
X-CRM114-Status: UNSURE (   6.60  )
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

The following changes since commit 910c190740916a9969ad5105137fb88ae4ce34c8:

  Merge branch 'intel/dmc/xe3lpd/2.29' into 'main' (2025-07-30 00:18:22 +0000)

are available in the Git repository at:

  https://github.com/HuayuZong/linux-firmware-mt8189-scp mt8189-fw-upstream

for you to fetch changes up to d66f2394a85934817f5597d161ce2c1cbd6a2b96:

  mediatek: Add MT8189 SCP firmware (2025-08-13 09:50:34 +0800)

----------------------------------------------------------------
Huayu Zong (1):
      mediatek: Add MT8189 SCP firmware

 WHENCE                  |   2 ++
 mediatek/mt8189/scp.img | Bin 0 -> 6588300 bytes
 2 files changed, 2 insertions(+)
 create mode 100644 mediatek/mt8189/scp.img


