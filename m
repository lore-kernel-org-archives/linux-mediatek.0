Return-Path: <SRS0=Wwml=5N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34CB0C43331
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Mar 2020 10:27:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0758320716
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Mar 2020 10:27:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bD/ykMiU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0758320716
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v4ofbFfPQpS86fyQGeyoztzuZKQDWRtwVOIzTDeok7g=; b=bD/ykMiU35FNah
	gZu636YGGxTvtqzVQ8ewHrn14Aw3mA+tZuU9MoRhY1perNK3x40rVXEF0HOzp90+hhqf7KufO/cHY
	PAtMhw/MDGbOF3KIdR6GfUgKK+adxFwjoAXdTBcBn3LRZh7qgEa1egvFW+owuG5jXiX+nKnmpk0h4
	VbYio87c0gfzoXI3U7ciaJE6JFdGUpSQm3dMcI8LZHupwobhYzxXdCSayRY/SuH3pX0CKTq3mBisN
	yvOGW3Pz3p+oBMvnH7qHJvrAceVclvDLeoMRqUdmlAtdQx6FWpU4QPc9KwIYRLxHP4MWcvW9M+4bf
	9Z5gwFn1SgGIDtQQ5NfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jI8gl-0001IQ-Re; Sat, 28 Mar 2020 10:27:39 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jI8gc-00019b-KH; Sat, 28 Mar 2020 10:27:32 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5AC13AF0E;
 Sat, 28 Mar 2020 10:27:25 +0000 (UTC)
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] MIPS: ralink: mt7621: Fix soc_device introduction
Date: Sat, 28 Mar 2020 11:27:13 +0100
Message-Id: <20200328102715.8309-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200328_032730_817401_2F7B7C2A 
X-CRM114-Status: GOOD (  10.25  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Depending on selected SMP config options soc_device didn't get
initialised at all. With UP config vmlinux didn't link because
of missing soc bus.

Fixes: 71b9b5e0130d ("MIPS: ralink: mt7621: introduce 'soc_device' initialization")
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/ralink/Kconfig  | 1 +
 arch/mips/ralink/mt7621.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
index 94e9ce994494..35c2ebd8f094 100644
--- a/arch/mips/ralink/Kconfig
+++ b/arch/mips/ralink/Kconfig
@@ -52,6 +52,7 @@ choice
 		select COMMON_CLK
 		select CLKSRC_MIPS_GIC
 		select HAVE_PCI if PCI_MT7621
+		select SOC_BUS
 endchoice
 
 choice
diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
index 905460aeeb1f..0accb80db709 100644
--- a/arch/mips/ralink/mt7621.c
+++ b/arch/mips/ralink/mt7621.c
@@ -243,12 +243,12 @@ void prom_soc_init(struct ralink_soc_info *soc_info)
 
 	rt2880_pinmux_data = mt7621_pinmux_data;
 
+	soc_dev_init(soc_info, rev);
+
 	if (!register_cps_smp_ops())
 		return;
 	if (!register_cmp_smp_ops())
 		return;
 	if (!register_vsmp_smp_ops())
 		return;
-
-	soc_dev_init(soc_info, rev);
 }
-- 
2.16.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
