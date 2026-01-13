Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE966D29DEC
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jan 2026 09:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TH9HLBFSf2M9aQf0oRpBhlUJN14RJoa5i1CqqbSox/4=; b=rkTK08uO3RMdC4/iKAE8QhXAiQ
	TV2sZ7IIi4qNEFyWdVWikGNgdjVgcfqYoiusQ69T/scLVWnSwPMOkAWIArXj5Iuok8T2meejrjJbJ
	PMhMLIWKDTOf0FfLWwIDeHzKkP+KAyPCeBBlYRnMXalm0GuOnpUDtye1RpFQc/kw8Ttsg0nURihuf
	JHmSQy8uiLC/AKmcV2eu+m6NbohVuImSZfNDw0d3sC8z/kkGr0qjJFJwN/BQofmmZLbFLCkRavE8X
	JvFzQ0rvz0C7JolcvpV5hGKt2P6tY2oa83MzuDl3ExlDS45BXp+Ch3IxFbdWKtsIHRIEUThXR96Nj
	iFRrjDtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfayH-00000006rDt-12Kx;
	Tue, 13 Jan 2026 09:45:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfayE-00000006rDL-0hBf
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Jan 2026 09:45:51 +0000
X-UUID: a162e402f06411f09f706fa2197c6ceb-20260113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=TH9HLBFSf2M9aQf0oRpBhlUJN14RJoa5i1CqqbSox/4=;
	b=uzr1lc75P7NjCGAJ3DxA09paItdXdzkFw+LM5FArNqrz3B96zZjRIwN0KQQbqCUARGphPxYIVwC4QGTMd50J3Rhk8/XiuZqICHjJs291FVGol6KPSJeatN5uAizhF/GRcfWd+sZiz9BCknW14t1gDSzXlRUBYkES9thUBtUScf4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:02018b04-7ba0-4cab-b93c-09fcf9dee76d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:e403bc79-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a162e402f06411f09f706fa2197c6ceb-20260113
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2030724906; Tue, 13 Jan 2026 02:45:44 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 17:45:42 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 17:45:41 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <nfraprado@collabora.com>,
	<Jason-ch.Chen@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<Macpaul.Lin@mediatek.com>
Subject: rename MT8188 SCP firmware and add symlink
Date: Tue, 13 Jan 2026 17:45:04 +0800
Message-ID: <20260113094541.2528905-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_014550_207610_C9F76C30 
X-CRM114-Status: UNSURE (   7.41  )
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

The following changes since commit 486ac8f9adb4d77b951b55179985c6b3c20b6957:

  Merge branch 'robot/pr-0-1768198342' into 'main' (2026-01-12 07:14:40 +0000)

are available in the Git repository at:

  https://github.com/MoudyHo/linux_fw_scp v27748.03

for you to fetch changes up to fdae06e63ed75fa3a91c8fab7a88c7b22c12ec3f:

  mediatek: rename MT8188 SCP firmware and add symlink (2026-01-13 17:13:26 +0800)

----------------------------------------------------------------
Moudy Ho (1):
      mediatek: rename MT8188 SCP firmware and add symlink

 WHENCE                     |   3 ++-
 mediatek/mt8188/scp.img    | Bin 636548 -> 10 bytes
 mediatek/mt8188/scp_c0.img | Bin 0 -> 636548 bytes
 3 files changed, 2 insertions(+), 1 deletion(-)
 mode change 100644 => 120000 mediatek/mt8188/scp.img
 create mode 100644 mediatek/mt8188/scp_c0.img


