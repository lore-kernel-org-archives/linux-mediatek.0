Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138FBC7EE25
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 02:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RexUN+td4e/E4ud86CV5E7wKgvXssOxMb0wiC7TICTw=; b=aSjGNpOPbLcyumYNSGami09NhV
	OolBcTiNAYcm2QiSJds4tnKaFRxwbhgg3Cn26xScFc8IhKmAyvBejYG1xPz/M2A+Cpsi7HSy+QI+d
	uTaA81Z9QMt25Wya+ozrz6E97oIjzojKpcqyCbwI2c0Ytb3OuH6au+IAjkG52i+vG44dRnwF7hVG9
	hXHhcxmc7v5x0SaSlNJx0NP1OFMgdb7grlpn/2uDUhNbyKtMcj7rUKsop6lbDVy9C9vcS+7zffs1T
	FGyqw5E4BEmSE8m9G+qoeDyT0/nGymAvYst7bKubKvZddqXVJgM5GgaR2QIQwUiGsBGXcvY2bb2zP
	oWn6qPoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz71y-007s0l-2p;
	Wed, 17 May 2023 02:36:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz71w-007rzy-0Z;
	Wed, 17 May 2023 02:36:45 +0000
X-UUID: a5c19bd6f45b11ed83ed1395ce914268-20230516
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=RexUN+td4e/E4ud86CV5E7wKgvXssOxMb0wiC7TICTw=;
	b=hUO4c6X3WKhlrMZ3GAPprd9C1WcOx3qABNvcy1NAFe/QUzdnziavl8pOELjIEcnQaReTIk9oyLdx/7c1omL4Hw537iUcvEEa2M9wr9qlx375XovT5KM38AnQyRdG2SrJb0DcUUNUFaqPtKMljZTv8CmOZ7hiSNtDtVQEwkg2yJk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:26acc787-8c9a-4c48-a9aa-68b92e04b612,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:802a0d6c-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: a5c19bd6f45b11ed83ed1395ce914268-20230516
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <walter.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 561825409; Tue, 16 May 2023 19:36:37 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 May 2023 10:26:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 May 2023 10:26:30 +0800
From: <walter.chang@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
	<tglx@linutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Maciej
 W . Rozycki" <macro@orcam.me.uk>, John Stultz <jstultz@google.com>
CC: <wsd_upstream@mediatek.com>, <stanley.chu@mediatek.com>,
	<Chun-hung.Wu@mediatek.com>, <Freddy.Hsin@mediatek.com>,
	<walter.chang@mediatek.com>, Chun-Hung Wu <chun-hung.wu@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v5 1/4] time/sched_clock: Export sched_clock_register()
Date: Wed, 17 May 2023 10:25:45 +0800
Message-ID: <20230517022557.24388-2-walter.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230517022557.24388-1-walter.chang@mediatek.com>
References: <20230517022557.24388-1-walter.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_193644_222151_9C473D49 
X-CRM114-Status: GOOD (  11.66  )
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

From: Chun-Hung Wu <chun-hung.wu@mediatek.com>

clocksource driver may use sched_clock_register()
to resigter itself as a sched_clock source.
Export it to support building such driver
as module, like timer-mediatek.c

Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Signed-off-by: Walter Chang <walter.chang@mediatek.com>
Acked-by: John Stultz <jstultz@google.com>
---
 kernel/time/sched_clock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
index 8464c5acc913..8e49e87d1221 100644
--- a/kernel/time/sched_clock.c
+++ b/kernel/time/sched_clock.c
@@ -150,8 +150,7 @@ static enum hrtimer_restart sched_clock_poll(struct hrtimer *hrt)
 	return HRTIMER_RESTART;
 }
 
-void __init
-sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
+void sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
 {
 	u64 res, wrap, new_mask, new_epoch, cyc, ns;
 	u32 new_mult, new_shift;
@@ -223,6 +222,7 @@ sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
 
 	pr_debug("Registered %pS as sched_clock source\n", read);
 }
+EXPORT_SYMBOL_GPL(sched_clock_register);
 
 void __init generic_sched_clock_init(void)
 {
-- 
2.18.0


