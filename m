Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8217AC35FFC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Mar 2025 06:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=leCWnjxbuD3QqJWjec/tvRazbXSNvb/QAMksouGRwB4=; b=R0YTCrhr7Hnt6MQz1fK1FPpg3C
	Xx8LLAe3R51AiHbXQB4TcrMpmkoeYAMtG1LcsU972WVFInmiq74DSA8igWqkT/3M3rd7t25deJn+r
	ntePYFfTsntwgqM3umwJRAbkdk5J7ftOvwbvFr85HUWL3FqeQVfLzss9yQ00fw/wt/Y3wsyaW9C5P
	Ad9oWL11MN6znvnbepNG3QOf4cLYew1ak7/caLRPjMx11wD7YEzojFfPucD6V8hzg9AAIau9S0zWV
	YgppvTWJ5XCLSfFY8S+Yu/igz3QfDdTI7060k33XfcPQoJIy/i62zZnMzxqX37GjYMPcB7+JCVZIa
	UheZppxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tunIM-00000008A1V-25LN;
	Wed, 19 Mar 2025 06:52:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tunIK-00000008A0c-0FRG
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Mar 2025 06:52:53 +0000
X-UUID: c3d8a84a048e11f083f2a1c9db70dae0-20250318
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=leCWnjxbuD3QqJWjec/tvRazbXSNvb/QAMksouGRwB4=;
	b=mfs2FVOYpkN7Q8tpMicsLjWo9VSvVifj6ENULOklLUOD5fZkSIlbowss8VH9Oke6UdWP555wTYMutHV15O/3ZrpUSOcZmHvdTXybOFChct9kpf2vsQuHypUx59IwMZO8r15O3V8nqaKRKvy9vLc4I8+mJGfBGwIwWEMIQS18PO4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:bada9578-c6ac-4041-a07c-39d5fc35fe34,IP:0,UR
	L:0,TC:0,Content:-5,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-35
X-CID-META: VersionHash:0ef645f,CLOUDID:777b87c6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:2,IP:nil
	,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: c3d8a84a048e11f083f2a1c9db70dae0-20250318
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1650744418; Tue, 18 Mar 2025 23:52:46 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 19 Mar 2025 14:52:44 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 19 Mar 2025 14:52:44 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Nicolas Prado
	<nfraprado@collabora.com>, Jason Chen <Jason-ch.Chen@mediatek.com>
Subject: pull request: linux-firmware: Create MediaTek MT8188 SCP firmware
Date: Wed, 19 Mar 2025 14:51:55 +0800
Message-ID: <20250319065243.3775352-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_235252_111154_7C452678 
X-CRM114-Status: UNSURE (   7.61  )
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

The following changes since commit 588505068c48fe07b1cfa32c5f3acd4395ec9482:

  Merge branch 'copy-firmware' into 'main' (2025-03-18 00:45:21 +0000)

are available in the Git repository at:

  https://github.com/MoudyHo/linux_fw_scp v27748

for you to fetch changes up to a5932c0dc930fa54bbbe2360d1eca5f87b2db8bc:

  mediatek: Add MT8188 SCP firmware (2025-03-19 14:50:24 +0800)

----------------------------------------------------------------
Moudy Ho (1):
      mediatek: Add MT8188 SCP firmware

 WHENCE                  |   2 ++
 mediatek/mt8188/scp.img | Bin 0 -> 636548 bytes
 2 files changed, 2 insertions(+)
 create mode 100644 mediatek/mt8188/scp.img

