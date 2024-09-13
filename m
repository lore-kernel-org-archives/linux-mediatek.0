Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF3FFA3741
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 10:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L/SYtEbl/61399Qh+bHxFsGQAy9IhdUiQzlwegY6SMo=; b=n0OrHfsFcfhRMIaZi0EPgx50bf
	sDdD/otNWdwLv6eBuSF+sGSkGvmBjnPLDCwgzEme2lj3FvP+Kc5br6hIyvWZCYAm8twzs1RMM9U1o
	BDbOy1HB3ElvA332jCMLa9gLWoYXFo3FqIE6DcoBg1CrFhpsqz2dVFTGOOBtDXI2XOrb2QXt/hZwP
	hxCCLbyk1gxQ5XB4pct/x5f3Cz1Vk1e36hUhLWJDS8nMWNyVpP81HSUosZyFSDULvWA5EDKCmcYqA
	2AKwgLUJi+G4g4YehTRz4M4pXN2WNGh8k35dx84gO7P60dROLX8eIVnTqbUPYWrgoHaDKajFtkoJu
	zqd+Os2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp3jR-0000000Fea2-0MWy;
	Fri, 13 Sep 2024 10:40:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp3ir-0000000FeRa-2epx;
	Fri, 13 Sep 2024 10:40:18 +0000
X-UUID: 8e6d013e71bc11efba0aef63c0775dbf-20240913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=L/SYtEbl/61399Qh+bHxFsGQAy9IhdUiQzlwegY6SMo=;
	b=IPg5vfzMD5NUoaQMvGTgr+d9pIMoZnhd0N3aaLyAG0dYMWe1x5ZoP/zn3+oXqsm16SdqxhC4LFeDZfybUvK7jnNDH0NxBFgNT2NpqEkFr8Z0+LSmvI05/wGF246GVAh33zNzRB+Whu8QxsGG/NGgftLhIoKRBojqkRTaos2nPp8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:04162fef-7de9-48b2-a2cd-5215fe7b7207,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:3d7a2ad0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8e6d013e71bc11efba0aef63c0775dbf-20240913
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chun-jen.tseng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1211637803; Fri, 13 Sep 2024 03:40:12 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 13 Sep 2024 03:39:37 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 13 Sep 2024 18:39:37 +0800
From: Mark Tseng <chun-jen.tseng@mediatek.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<chun-jen.tseng@mediatek.com>
Subject: [PATCH v1 0/2] fixed mediatek-cpufreq has multi policy concurrency issue
Date: Fri, 13 Sep 2024 18:39:31 +0800
Message-ID: <20240913103933.30895-1-chun-jen.tseng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_034017_728587_02A8144C 
X-CRM114-Status: UNSURE (   7.26  )
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

For multi cluster SoC, the cpufreq->target_index() is re-enter function 
for each policy to change CPU frequency. In the cirtical session must 
use glocal mutex lock to avoid get wrong OPP.

Mark Tseng (2):
  PM / devfreq: mediatek: protect oop in critical session
  cpufreq: mediatek: Fixed cpufreq has 2 policy will cause concurrency

 drivers/cpufreq/mediatek-cpufreq.c | 65 ++++++++++++++++++++++--------
 drivers/devfreq/mtk-cci-devfreq.c  | 30 +++++++-------
 2 files changed, 64 insertions(+), 31 deletions(-)

-- 
2.45.2


