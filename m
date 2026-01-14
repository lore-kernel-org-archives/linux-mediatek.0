Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D95D31A1B
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jan 2026 07:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U7nHMmte4jZDlZIIYx9NXNOXVIfDhYodf8UXKbPOKwk=; b=YwRWTfLI95SfeOqfr2W98ezHhj
	OjYy06rftnq4jVG4aJRkpFoa2xQYUDCccX0SVTAlh/CB5DtkISUjT8SGCpluGV49ZoBTRVoNOoynR
	7L6+q69+WRs5Pu5rxV4u7IJH5QBF6QFl3G4GDF8/Kjy/zhqLH0yCORy5mc5hEMmTdtHlneSjgBeoz
	uKgZsJlDASp3XgirJN8oiYP/ohMHCcV6qVZRGQ1uiRCA+9LGCl5VGnww/Ujv62biiCQXRE7xe4AoV
	FEeJMgCnPzQO70h/I/JkVkFvoUErhDA55ymQwqpOFVBiQHc2PTC8E0sYlyQG1sqsCDBzzS24XAfyA
	1Z17adow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvFF-00000008BhU-39y7;
	Wed, 14 Jan 2026 07:24:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvFC-00000008BgL-2Rfk
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Jan 2026 07:24:43 +0000
X-UUID: 14aa2442f11a11f08b17dd397dc63300-20260114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=U7nHMmte4jZDlZIIYx9NXNOXVIfDhYodf8UXKbPOKwk=;
	b=iGUuSY5wsWX8pyisKwbEt58Fh9udZznk8fsf2fvJsEAs1c24NOD5R8HSD8fV0vWDSkRlDn9uzUUsLEPjXoh5EAql1DLp/jfdPEYMr1QqDiFCfEWTYVGll5N1rQ/+cnmS8758O6oLJVfqa3CZNl7EtJQm3QbiATYxu/65VDpRRi0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:4a1e1258-8872-4377-a65e-442f9cc87fb4,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:f6871c5a-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 14aa2442f11a11f08b17dd397dc63300-20260114
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 239204359; Wed, 14 Jan 2026 00:24:36 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 15:24:34 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 15:24:34 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <nfraprado@collabora.com>,
	<Jason-ch.Chen@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<Macpaul.Lin@mediatek.com>
Subject: pull request: linux-firmware: rename MediaTek MT8188 SCP firmware
Date: Wed, 14 Jan 2026 15:23:02 +0800
Message-ID: <20260114072433.3076970-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_232442_653680_1E484FC7 
X-CRM114-Status: UNSURE (   6.69  )
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

  https://github.com/MoudyHo/linux_fw_scp v27748.05

for you to fetch changes up to dc0fa0cd80a676ea66e204400966be598fe3f554:

  mediatek: rename MT8188 SCP firmware (2026-01-14 15:16:36 +0800)

----------------------------------------------------------------
Moudy Ho (1):
      mediatek: rename MT8188 SCP firmware

 WHENCE                                  |   3 ++-
 mediatek/mt8188/{scp.img => scp_c0.img} | Bin
 2 files changed, 2 insertions(+), 1 deletion(-)
 rename mediatek/mt8188/{scp.img => scp_c0.img} (100%)


