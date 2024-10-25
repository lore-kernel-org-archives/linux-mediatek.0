Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5D4D116E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Oct 2024 03:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MNHuK5aNNy+gMsZYux2H21Z5RV+BRTldWg8zS44Al1I=; b=CwP5Lbot8o9rThBQE4krSrMuit
	Go4lx9HcGLLdViYWGLomOC4Ml3KBzRDxpdElN3CReMj1hYaXstTQvdD8vYyg4U/ECR/zVEHGJra2y
	pJthrt9TJHFOma3vn7J5ps7sg9x1hvHBkXTgQHIEhVKG2edHO9zM5majyEMCeiiuKNAMFppiRbUc1
	7d1e376yxjOO0/XgO5dSHfctb5X/ililLbEPhiwkg+ne0R7XZT4mVwK3lkISkduau5XKSUqVeR3u/
	Rvt8U3izCAg7MF26bQhloMbkAfi2YV2b9MSnc4H44cwa1qF3uGiganW68kE2sw0jfQlpmvMVsMfeH
	cnOKPeJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Ard-00000002Mt6-16Ht;
	Fri, 25 Oct 2024 03:19:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4AqX-00000002Mgv-3Zzz
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Oct 2024 03:18:43 +0000
X-UUID: d399a788927f11ef9048ed6ed365623b-20241024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=MNHuK5aNNy+gMsZYux2H21Z5RV+BRTldWg8zS44Al1I=;
	b=uSuIYHeSCdePCrGyktzGn9+uifgX+Oro7rBVR/SG8UCXbTAnPTtxXntEmsovgXqw0f82JG/v6+j9VJvpHtArC7whY6iC7HZ68mV5Q2gDwU1Huj5+J+axZXPVeeafz/gutAOizYviuxV7ah7t4jJz0jYyFKBRraElxVoVckQ8aE4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:99cf4116-d565-4fa4-bfe1-e5e1b8272f10,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:3823152e-a7a0-4b06-8464-80be82133975,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: d399a788927f11ef9048ed6ed365623b-20241024
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <yr.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 248900090; Thu, 24 Oct 2024 20:18:38 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 25 Oct 2024 11:18:35 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 25 Oct 2024 11:18:35 +0800
From: YR Yang <yr.yang@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <shawnku@google.com>
Subject: pull request: linux-firmware: Add sof-tplg for mt8195
Date: Fri, 25 Oct 2024 11:12:41 +0800
Message-ID: <20241025031848.21368-1-yr.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_201841_914547_15A6C16E 
X-CRM114-Status: UNSURE (   6.63  )
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

The following changes since commit 8dbcf94bfc68bdb1c6df3a42762b275557095558:

  Merge branch 'robot/patch-0-1729102102' into 'main' (2024-10-17 15:40:04 +0000)

are available in the Git repository at:

  https://github.com/mtk13576/sof_tplg adspsof

for you to fetch changes up to f9a502ab3ad4d25e0ea39f0ecb7ab9ef5e7170d3:

  mediatek: Add sof-tolg for mt8195 (2024-10-25 11:10:24 +0800)

----------------------------------------------------------------
YR Yang (1):
      mediatek: Add sof-tolg for mt8195

 mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg | Bin 0 -> 16191 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg


