Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDB3C63798
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 14:26:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E71292222C
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 14:26:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QFsI5dCB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="k7+ZI/Kq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E71292222C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=egFum8BzduUizmorSWZEFl/kXhF0qpA9j+6zBwbAHGM=; b=QFsI5dCBDZiZsaMrIVkXiO4Nz
	KYeNLM3wUqnDlkbcdJD1lNbn2fpf9a5XVbpmMmpM5mP7K/SBPLBXItJHnLon1zqO4CSilfRuy6//3
	BGg3rSLf1pPzladsSEqMqjdBVTvSBsGtlORSxYlBxVdf9FV5C2PrWeyiTn8bQiqrmXgGw9sG+yvv/
	okl7gCgA3p3aN1yWyahjB4O1uvQ3mPXdBnepzCAJ/k4z7plp1CF+9kS+o+2lsxoinU8sKFTGITAaa
	F9zvQQtJdLtb8a9boDrVOKNbo8n4CDUsTTQDDfmfWagZ9sUt3ac+SygkyahJ4ZGXHHYJAGEtrsl4B
	kcCr2/oFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiehD-0001IK-Q8; Fri, 27 Nov 2020 14:25:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiegz-0001C6-Do; Fri, 27 Nov 2020 14:25:47 +0000
X-UUID: 3d7c0365bf07454e8d3dcdf06a5c26e2-20201127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=71IL+fjPy5tcd4qRDjG/PsF6skVBO1wgnu8pe3WvDSw=; 
 b=k7+ZI/KqUwIUZkUf8u8BKCvTVnNkLcmzrfPkylsxDwGFhNzTtVfccm5VAnC0b4JGDTK5KxLEbdwFRMjVKdiVar4VzZq6K46mADfKYWzzlydehzL7XOwT64iHdijR6Mx/MPEeOks0m0XnlovOVdKKMT+VFV/NxehflXR30AbaM8s=;
X-UUID: 3d7c0365bf07454e8d3dcdf06a5c26e2-20201127
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 433722771; Fri, 27 Nov 2020 06:25:58 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 27 Nov 2020 06:15:35 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 27 Nov 2020 22:15:32 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 27 Nov 2020 22:15:33 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, 
 Marc Zyngier <maz@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
Subject: [PATCH v1 2/3] arm: disable irq on cpu shutdown flow
Date: Fri, 27 Nov 2020 22:15:30 +0800
Message-ID: <1606486531-25719-3-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1606486531-25719-1-git-send-email-hanks.chen@mediatek.com>
References: <1606486531-25719-1-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 51FF224ED26ADDFF5E1372E7DC0ED8DD164EB61E564AED9D7CBF5263AC81A60A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_092545_729078_DA84708B 
X-CRM114-Status: GOOD (  13.12  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: CC Hwang <cc.hwang@mediatek.com>, Kuohong Wang <kuohong.wang@mediatek.com>,
 Hanks Chen <hanks.chen@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Disable irq on cpu shutdown flow to ensure interrupts
did not bother this cpu after status as offline.

To avoid suspicious RCU usage
[0:swapper/0]RCU used illegally from offline CPU! ...
[0:swapper/0]lockdep: [name:lockdep&]cpu_id = 0, cpu_is_offline = 1

Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
---
 arch/arm/kernel/smp.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
index 48099c6e1e4a..6b8f72490320 100644
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -262,6 +262,12 @@ int __cpu_disable(void)
 	remove_cpu_topology(cpu);
 #endif
 
+	/*
+	 * we disable irq here to ensure interrupts
+	 * did not bother this cpu after status as offline.
+	 */
+	local_irq_disable();
+
 	/*
 	 * Take this CPU offline.  Once we clear this, we can't return,
 	 * and we must not schedule until we're ready to give up the cpu.
@@ -600,11 +606,11 @@ static void ipi_cpu_stop(unsigned int cpu)
 		raw_spin_unlock(&stop_lock);
 	}
 
-	set_cpu_online(cpu, false);
-
 	local_fiq_disable();
 	local_irq_disable();
 
+	set_cpu_online(cpu, false);
+
 	while (1) {
 		cpu_relax();
 		wfe();
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
