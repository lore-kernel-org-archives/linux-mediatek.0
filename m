Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F5C5C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 09:09:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20E19233A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 09:09:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pvir4S2C";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kyYYbtXh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20E19233A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F6T1xug+yMIAMsQfIKuhefjaQKBQor9NksGxXgSpRNg=; b=pvir4S2CVSAt/UU4cixE1wLbb
	0rukIwQpyAonIBB9FQ++oj0cjWhsSQZxVj/Utr7JR3EZdlhmnyMcBMw6XGGt+Qp8z047raphzBW7c
	r7+mhIHqg4DbHilwjkdbDq29hmba9ivK4lp9njIdlvLYmxY9sGL69f50niWaugkGHSY1I3Fyi2yHF
	SmLyMIijQqYUdH1xA38eYm43FUq2RuDbre4k0tWuDA8pjVwKnDA8Rvv9OeTIZonhIpjit6jId+0lO
	WWgcaFc0HxwT153sZ8/pYszRn3JH8lGk77iZ1Kl8q/qam4ixnwU+s6wNr8NeE/CMm0lYkozp89K1A
	B1blWrF2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jppnF-0004RZ-Io; Mon, 29 Jun 2020 09:09:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jppnB-0004QZ-AT; Mon, 29 Jun 2020 09:09:34 +0000
X-UUID: edb6018c9b1c477fb7837e8cf5ef9588-20200629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=1F2yvktHD/8e7j0l63oJYuwydDMvrGMAqjvDfVvXOgA=; 
 b=kyYYbtXh3YUYv6HECvPU13J0f3HV6/fZoJ8VXim667UfskjYG8RkI9wODqyDD9/5mJeRn0VzqUp43D6U1KtpHlJsiqQfATr6mgc46W2PGjfBv1fShT90LY010JAJ1k+K7A3iusiNdv0zX9DD3637lCZ1KvyRE+MQw/69jXepLC8=;
X-UUID: edb6018c9b1c477fb7837e8cf5ef9588-20200629
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1164041268; Mon, 29 Jun 2020 01:09:17 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Jun 2020 02:05:53 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Jun 2020 17:05:40 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 29 Jun 2020 17:05:41 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Jacob Pan
 <jacob.jun.pan@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH] cpuidle: change enter_s2idle() prototype
Date: Mon, 29 Jun 2020 17:05:40 +0800
Message-ID: <1593421540-7397-2-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1593421540-7397-1-git-send-email-neal.liu@mediatek.com>
References: <1593421540-7397-1-git-send-email-neal.liu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
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
Cc: wsd_upstream@mediatek.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 Neal Liu <neal.liu@mediatek.com>, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Control Flow Integrity(CFI) is a security mechanism that disallows
changes to the original control flow graph of a compiled binary,
making it significantly harder to perform such attacks.

init_state_node() assigns same function pointer to idle_state->enter
and idle_state->enter_s2idle. This definitely causes CFI failure
when calling either enter() or enter_s2idle().

Align enter_s2idle() with enter() function prototype to fix CFI
failure.

Signed-off-by: Neal Liu <neal.liu@mediatek.com>
---
 drivers/acpi/processor_idle.c   |    6 ++++--
 drivers/cpuidle/cpuidle-tegra.c |    8 +++++---
 drivers/idle/intel_idle.c       |    6 ++++--
 include/linux/cpuidle.h         |    6 +++---
 4 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/acpi/processor_idle.c b/drivers/acpi/processor_idle.c
index 75534c5..6ffb6c9 100644
--- a/drivers/acpi/processor_idle.c
+++ b/drivers/acpi/processor_idle.c
@@ -655,8 +655,8 @@ static int acpi_idle_enter(struct cpuidle_device *dev,
 	return index;
 }
 
-static void acpi_idle_enter_s2idle(struct cpuidle_device *dev,
-				   struct cpuidle_driver *drv, int index)
+static int acpi_idle_enter_s2idle(struct cpuidle_device *dev,
+				  struct cpuidle_driver *drv, int index)
 {
 	struct acpi_processor_cx *cx = per_cpu(acpi_cstate[index], dev->cpu);
 
@@ -674,6 +674,8 @@ static void acpi_idle_enter_s2idle(struct cpuidle_device *dev,
 		}
 	}
 	acpi_idle_do_entry(cx);
+
+	return 0;
 }
 
 static int acpi_processor_setup_cpuidle_cx(struct acpi_processor *pr,
diff --git a/drivers/cpuidle/cpuidle-tegra.c b/drivers/cpuidle/cpuidle-tegra.c
index 1500458..a12fb14 100644
--- a/drivers/cpuidle/cpuidle-tegra.c
+++ b/drivers/cpuidle/cpuidle-tegra.c
@@ -253,11 +253,13 @@ static int tegra_cpuidle_enter(struct cpuidle_device *dev,
 	return err ? -1 : index;
 }
 
-static void tegra114_enter_s2idle(struct cpuidle_device *dev,
-				  struct cpuidle_driver *drv,
-				  int index)
+static int tegra114_enter_s2idle(struct cpuidle_device *dev,
+				 struct cpuidle_driver *drv,
+				 int index)
 {
 	tegra_cpuidle_enter(dev, drv, index);
+
+	return 0;
 }
 
 /*
diff --git a/drivers/idle/intel_idle.c b/drivers/idle/intel_idle.c
index f449584..b178da3 100644
--- a/drivers/idle/intel_idle.c
+++ b/drivers/idle/intel_idle.c
@@ -175,13 +175,15 @@ static __cpuidle int intel_idle(struct cpuidle_device *dev,
  * Invoked as a suspend-to-idle callback routine with frozen user space, frozen
  * scheduler tick and suspended scheduler clock on the target CPU.
  */
-static __cpuidle void intel_idle_s2idle(struct cpuidle_device *dev,
-					struct cpuidle_driver *drv, int index)
+static __cpuidle int intel_idle_s2idle(struct cpuidle_device *dev,
+				       struct cpuidle_driver *drv, int index)
 {
 	unsigned long eax = flg2MWAIT(drv->states[index].flags);
 	unsigned long ecx = 1; /* break on interrupt flag */
 
 	mwait_idle_with_hints(eax, ecx);
+
+	return 0;
 }
 
 /*
diff --git a/include/linux/cpuidle.h b/include/linux/cpuidle.h
index ec2ef63..bee10c0 100644
--- a/include/linux/cpuidle.h
+++ b/include/linux/cpuidle.h
@@ -66,9 +66,9 @@ struct cpuidle_state {
 	 * suspended, so it must not re-enable interrupts at any point (even
 	 * temporarily) or attempt to change states of clock event devices.
 	 */
-	void (*enter_s2idle) (struct cpuidle_device *dev,
-			      struct cpuidle_driver *drv,
-			      int index);
+	int (*enter_s2idle)(struct cpuidle_device *dev,
+			    struct cpuidle_driver *drv,
+			    int index);
 };
 
 /* Idle State Flags */
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
