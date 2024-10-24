Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C55D0BB59
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2024 03:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rlk3QRcH7Ks80dwuVKbQIrEI0lSPNUwzwey7SfnjSMA=; b=pJQ+OvWApPRyJDGdisTOf+m8A5
	3ZpC7/kayGybhzwwpKpg/3uMXOZ3/KJ+ivUPZl/0U2XQ+xHkr+9XXaFneXMiEPBp1ZviYtEYi0a47
	WlnOi9pJmI0R+2622z5ZSmI7UEveCE598SsgOYqKx1+QZ0yQW3X+WT+RDwFIQgB6s/QyYdf126A1o
	LG9V3uI8sB+4HBIxPlRoCDVNjaiBrBY3bWNepmNrX+bBes3Rv2IWcfxZzar1SUQXPKjUw87FewSGg
	mW0WA7N1dexiJ/2BqSECfFBAsc9lauaZmuKjaRwY3l76Z8Ft2LCyR4rmySoNAanLoKs6SGIOVbtoA
	6VhgcaMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3onM-0000000Ge1G-3c8u;
	Thu, 24 Oct 2024 03:45:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3onK-0000000Ge0E-0Ogk
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Oct 2024 03:45:55 +0000
X-UUID: 742094ee91ba11ef82ff63e91e7eb18c-20241023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=rlk3QRcH7Ks80dwuVKbQIrEI0lSPNUwzwey7SfnjSMA=;
	b=gO2ZejuKfhLPUFperwlbqFfAUoYezQNChXJNIwP5YXXlFkr5E4hhRq+CclKhotKwUF3jDmxL4Qg2LM8VAAPMC8SDGkH3WSFmH+GSkyW+iXS+5a1NgB+AcwqznBiKVtQFyx42vWI3fKMXve24knaMUi4CCoYeNMZihmElFTLFx40=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:5a546ae1-016e-4a20-b82f-4c752df71284,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:1d42062e-a7a0-4b06-8464-80be82133975,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 742094ee91ba11ef82ff63e91e7eb18c-20241023
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <yr.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 837143004; Wed, 23 Oct 2024 20:45:47 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 24 Oct 2024 11:45:44 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 24 Oct 2024 11:45:44 +0800
From: 20220315151852 created <yr.yang@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <shawnku@google.com>
Subject: pull request: linux-firmware: Add sof-tplg for mt8195 
Date: Thu, 24 Oct 2024 11:44:06 +0800
Message-ID: <20241024034558.667-1-yr.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_204554_247468_5F7D0D93 
X-CRM114-Status: UNSURE (   6.44  )
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

for you to fetch changes up to 7f3099f4482f2eda1dfa45068c3618c1203fd1fd:

  mediatek: Add sof-tolg for mt8195 (2024-10-24 10:21:23 +0800)

----------------------------------------------------------------
20220315151852 created (1):
      mediatek: Add sof-tolg for mt8195

 mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg | Bin 0 -> 16191 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg


