Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD44C433EA
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 03:26:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A6F420658
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 03:26:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jxEimMPO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Q1oTugg2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A6F420658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z+k/jDu+bS29APUfxXNXUzBFiFWbVo4NlfHqQlQu41M=; b=jxEimMPOVs0W8mPFv52h7eata
	ljeGEUttxZ6AtZcXzOmYAv6L+gcjsQ6biUbUyGiRvMrXtiJH7s1uBrVoLb0l0Vd+40gkWHKzMqKWj
	XKdD8FUMgPbmlkj9VpwPvMYVJStxLtU+JSdIyBzI4zMY3lH503dbasttS0rajDl3tyRD02TNNeAjf
	z25BBr5e6ncBX4syEAEObj+YNFDVSbOWsIN7P8DjosbJTaMKlsz0jPungiTrtH1zwGhF5uNnJvOL3
	wHktf9jRU/5GCkUD3MwwsRSbFsgRZEto77FcptrtxkYG1JDdO5YBOU6axtPAkrP71AGeBTiGYBKpo
	Ya9Q4vOMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jztm6-0005Kc-6r; Mon, 27 Jul 2020 03:26:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jztm3-0005Jn-VB; Mon, 27 Jul 2020 03:26:01 +0000
X-UUID: 1c4d99824f784f03bcf24e0733868863-20200726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ts2TbemboXTjPLm3syKaYD/dvm0+IAdQpXqli+IsEmE=; 
 b=Q1oTugg20XjTN70cWrd9vhCDy6XdAgHFPySEZJiOVK058MKVnbRiFXQp+634LJBUdbzvy41lhfYSWLfQBGfbjF6W7N0r0JBq4BFf8hlto9iShD2aYxTPC4J1G2TTQKMpd94UHfI7yYv47nBBSbLPRWX0ia0VVSlz+8y/xNMTn48=;
X-UUID: 1c4d99824f784f03bcf24e0733868863-20200726
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1981531710; Sun, 26 Jul 2020 19:25:55 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 26 Jul 2020 20:25:54 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 11:25:47 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 27 Jul 2020 11:25:47 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Jacob Pan
 <jacob.jun.pan@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH v3] cpuidle: change enter_s2idle() prototype
Date: Mon, 27 Jul 2020 11:25:46 +0800
Message-ID: <1595820346-4361-2-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1595820346-4361-1-git-send-email-neal.liu@mediatek.com>
References: <1595820346-4361-1-git-send-email-neal.liu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200726_232600_150908_68C2B0C6 
X-CRM114-Status: GOOD (  16.05  )
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
 lkml <linux-kernel@vger.kernel.org>, linux-acpi@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 Neal Liu <neal.liu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Control Flow Integrity(CFI) is a security mechanism that disallows
changes to the original control flow graph of a compiled binary,
making it significantly harder to perform such attacks.

init_state_node() assign same function callback to different
function pointer declarations.

static int init_state_node(struct cpuidle_state *idle_state,
                           const struct of_device_id *matches,
                           struct device_node *state_node) { ...
        idle_state->enter = match_id->data; ...
        idle_state->enter_s2idle = match_id->data; }

Function declarations:

struct cpuidle_state { ...
        int (*enter) (struct cpuidle_device *dev,
                      struct cpuidle_driver *drv,
                      int index);

        void (*enter_s2idle) (struct cpuidle_device *dev,
                              struct cpuidle_driver *drv,
                              int index); };

In this case, either enter() or enter_s2idle() would cause CFI check
failed since they use same callee.

Align function prototype of enter() since it needs return value for
some use cases. The return value of enter_s2idle() is no
need currently.

Signed-off-by: Neal Liu <neal.liu@mediatek.com>
Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
---
 drivers/acpi/processor_idle.c   |    6 ++++--
 drivers/cpuidle/cpuidle-tegra.c |    8 +++++---
 drivers/idle/intel_idle.c       |    6 ++++--
 include/linux/cpuidle.h         |    9 ++++++---
 4 files changed, 19 insertions(+), 10 deletions(-)

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
index ec2ef63..b65909a 100644
--- a/include/linux/cpuidle.h
+++ b/include/linux/cpuidle.h
@@ -65,10 +65,13 @@ struct cpuidle_state {
 	 * CPUs execute ->enter_s2idle with the local tick or entire timekeeping
 	 * suspended, so it must not re-enable interrupts at any point (even
 	 * temporarily) or attempt to change states of clock event devices.
+	 *
+	 * This callback may point to the same function as ->enter if all of
+	 * the above requirements are met by it.
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
