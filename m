Return-Path: <SRS0=Wnqn=AR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ECB8C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2020 03:14:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A38B20724
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2020 03:13:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WAwW6Ujb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IVmYEUN3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A38B20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4pzceP5tTPGpm7CpcDfbTD0HQ/2na41TnaaT2+ZlqhA=; b=WAwW6UjbkC3Fx4ENfigndliyH
	92XTAR56JTjR7iY/pN0kwYw6cIfWaPnkBRrmY4MjuQr3Dl4VBDbZ5MZkMHfcdDKiz/BYh0D9vpqJU
	zjYpt3soj9M6S0cwStF5GJuIcSqoiCW0Jx2D0nfDGbHdLbndnUoly9IN3E7MPgnZuifwP5CLUHvJ4
	eWwwJHJYXICz60dPLv2luJt1lZ65ooLwaLsi8XxyZ69uhgDKLi3GQC1HOS2ml93UC4A/nqb17bEtg
	NM2iUCnP/Kio57VxnIqIgl9Pv7Tp96aLxGFoun5bFPAzM/klAm4NJ05sWsvWmfI7tWl7yWXqyrUfq
	n5idhO2vQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsHZp-0001VC-8I; Mon, 06 Jul 2020 03:13:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsHZn-0001UK-09; Mon, 06 Jul 2020 03:13:52 +0000
X-UUID: 3596345d97574882aa56ed253de5ef94-20200705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=pKniBVcACW/1c0nv/+i0UMEccnPGSztmdOgnnm5URG0=; 
 b=IVmYEUN3vmp2vCR+13XeHdnDKPyhhE/A1MhmIXtWqBqo9n7y/LJFMlo1lrJr66e66tiWL5NXk3swUPlOdRxMdnpaUJ7rAlng+92hkbUoiDgjIexlFtPYHV3cD1TC30lk0BBWaYK9O/iZd+ShDjx5cgoaL5SdrkProUBNY4zolkE=;
X-UUID: 3596345d97574882aa56ed253de5ef94-20200705
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1154264954; Sun, 05 Jul 2020 19:13:26 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 5 Jul 2020 20:13:27 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Jul 2020 11:13:16 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 6 Jul 2020 11:13:18 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Jacob Pan
 <jacob.jun.pan@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH v2] cpuidle: change enter_s2idle() prototype
Date: Mon, 6 Jul 2020 11:13:16 +0800
Message-ID: <1594005196-16327-2-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1594005196-16327-1-git-send-email-neal.liu@mediatek.com>
References: <1594005196-16327-1-git-send-email-neal.liu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 597824827A178439AFED3D26CDAD9F180957C939B943E4CAF103919A77FC3B032000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_231351_194990_4E3B366A 
X-CRM114-Status: GOOD (  14.34  )
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
