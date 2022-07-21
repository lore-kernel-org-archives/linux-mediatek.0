Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3224BC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 04:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wf1LQQVMlejwVavZzKyQVnvTDeb13NZDLnJL9BCtgDk=; b=IK8s5zy6ra3v7dxGjH7sX3B+v4
	1/9Pxy1pBFkbdMhXmUAUIrkzfSS5GiqCz0zgkyELvk+b1DGUUZ960mM3QenNmoHqiSJKPNfVtcv9w
	+RoBDjQ2/MaX/oo44XAnE5Lly2kt16HtVYopYqjkkkj+K7mXZpPgXgbk5H0WUAW9IIPwZGbf2QcoZ
	6nD+as3pjUyBge0lEHvJOXXC3maaVNuaiK88D/IK8+GM0B/OouEB6DMurh+KUNoQS1OGc3fgFI626
	Op6Kc7ZgWTS9dym2Aj76zUUanYMer5vHb8hTy2Nhupt4Ee17cx68Kbj+BIq/fx4Nl9mxDcTuJ0SBd
	MiRbAirQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oENS8-00GByp-CJ; Thu, 21 Jul 2022 04:06:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oENS4-00GBrS-RN; Thu, 21 Jul 2022 04:06:19 +0000
X-UUID: dc8801709a974143a49ad332fde2633b-20220720
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:590a75e7-5553-4b17-b866-3d068f49fdfb,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:4d2bdc64-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: dc8801709a974143a49ad332fde2633b-20220720
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1318737337; Wed, 20 Jul 2022 21:06:10 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 21 Jul 2022 11:05:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 21 Jul 2022 11:05:35 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
CC: <chinwen.chang@mediatek.com>, Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] arm64: Fix comment typo
Date: Thu, 21 Jul 2022 11:05:31 +0800
Message-ID: <20220721030531.21234-1-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_210616_911041_4CB54CE1 
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

Replace wrong 'FIQ EL1h' comment with 'FIQ EL1t'.

Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
---
 arch/arm64/kernel/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index 254fe31c03a0..2d73b3e793b2 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -502,7 +502,7 @@ tsk	.req	x28		// current thread_info
 SYM_CODE_START(vectors)
 	kernel_ventry	1, t, 64, sync		// Synchronous EL1t
 	kernel_ventry	1, t, 64, irq		// IRQ EL1t
-	kernel_ventry	1, t, 64, fiq		// FIQ EL1h
+	kernel_ventry	1, t, 64, fiq		// FIQ EL1t
 	kernel_ventry	1, t, 64, error		// Error EL1t
 
 	kernel_ventry	1, h, 64, sync		// Synchronous EL1h
-- 
2.18.0


