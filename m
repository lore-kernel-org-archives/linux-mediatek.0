Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E24C9EC71
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jan 2026 11:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s89wsYvxxsuyZa1RzmP2fef5zd3PsXJberIqY0MMzhI=; b=Xq/E0NmMc32g8ceeYXwfIDf752
	dixjFvbKdn5pZJGFtS/hG4xrzjD2KEnTgQFtMey/KATQmlDi3iDS1rrQSKSicWXN+hH3dPPF6FRt0
	j5ascFZmMqKo1TLnpMCvIO7morbsqdeTsG+gYQ2N/BjUgAbrZPgA2Y1rY715PmXZJ8VGQa4STMrVq
	JFRjxEyAPeBBKg7/ylTVGw8pfVguZWHLsuXiZIpssWgG5F/Xfbze+SZcbEhgW7FDjajqDathBtH4I
	t5YAMLxS02QSaLqZu+3TPVzWcaA3EatdCZ6EkuL8aHNO1o2VI99MVYXvLXM+rViV151QaCiPh2C6W
	+m6/q1og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFmS-00000005DgF-1dzX;
	Mon, 12 Jan 2026 11:08:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFmR-00000005Dg8-26sG
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Jan 2026 11:08:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C2DF6013B;
	Mon, 12 Jan 2026 11:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231B7C19421;
	Mon, 12 Jan 2026 11:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768216094;
	bh=THBb8iNVHiWTn1PIj6nqLs4VxMIVMf+6Yz/hbkzsFYg=;
	h=From:To:Cc:Subject:Date:From;
	b=SNbuxFiM+KUf4s0Q5cA9Ir+Rwb+ANHuCxIxlO7+4q82ldLGqE5n7px8HroqMDvrwu
	 GuNDmpm3n/9W9TdSPNG0wNjUS+a+svJ5NxcEeNajuyttNMxcNBCCc9l86vAH2A4jBH
	 G1UQunGoItdl6kGLmxWYJ4LFw7fPuz6a/pz4bB/xn22cHWC1M2bz+rCOG7AyP5YF3C
	 iiIninKltQh9oLYxVtdITgmQEEcZyofgEDadZDZYA+8oPThYW0I4E9v8DRyQpepwq7
	 qLzkjAts+MMZTQhnUgmiIJbRxvcFOb/v1jtNCnIhr/8/7o5lpQzPRU/rqfbmV7aPTh
	 yLGStpB7j4XDQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	tzungbi@kernel.org
Subject: [PATCH v2] remoteproc: mediatek: Break lock dependency to `prepare_lock`
Date: Mon, 12 Jan 2026 11:07:55 +0000
Message-ID: <20260112110755.2435899-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

A potential circular locking dependency (ABBA deadlock) exists between
`ec_dev->lock` and the clock framework's `prepare_lock`.

The first order (A -> B) occurs when scp_ipi_send() is called while
`ec_dev->lock` is held (e.g., within cros_ec_cmd_xfer()):
1. cros_ec_cmd_xfer() acquires `ec_dev->lock` and calls scp_ipi_send().
2. scp_ipi_send() calls clk_prepare_enable(), which acquires
   `prepare_lock`.
See #0 in the following example calling trace.
(Lock Order: `ec_dev->lock` -> `prepare_lock`)

The reverse order (B -> A) is more complex and has been observed
(learned) by lockdep.  It involves the clock prepare operation
triggering power domain changes, which then propagates through sysfs
and power supply uevents, eventually calling back into the ChromeOS EC
driver and attempting to acquire `ec_dev->lock`:
1. Something calls clk_prepare(), which acquires `prepare_lock`.  It
   then triggers genpd operations like genpd_runtime_resume(), which
   takes `&genpd->mlock`.
2. Power domain changes can trigger regulator changes; regulator
   changes can then trigger device link changes; device link changes
   can then trigger sysfs changes.  Eventually, power_supply_uevent()
   is called.
3. This leads to calls like cros_usbpd_charger_get_prop(), which calls
   cros_ec_cmd_xfer_status(), which then attempts to acquire
   `ec_dev->lock`.
See #1 ~ #6 in the following example calling trace.
(Lock Order: `prepare_lock` -> `&genpd->mlock` -> ... -> `&ec_dev->lock`)

Move the clk_prepare()/clk_unprepare() operations for `scp->clk` to the
remoteproc prepare()/unprepare() callbacks.  This ensures `prepare_lock`
is only acquired in prepare()/unprepare() callbacks.  Since
`ec_dev->lock` is not involved in the callbacks, the dependency loop is
broken.

This means the clock is always "prepared" when the SCP is running.  The
prolonged "prepared time" for the clock should be acceptable as SCP is
designed to be a very power efficient processor.  The power consumption
impact can be negligible.

A simplified calling trace reported by lockdep:
> -> #6 (&ec_dev->lock)
>        cros_ec_cmd_xfer
>        cros_ec_cmd_xfer_status
>        cros_usbpd_charger_get_port_status
>        cros_usbpd_charger_get_prop
>        power_supply_get_property
>        power_supply_show_property
>        power_supply_uevent
>        dev_uevent
>        uevent_show
>        dev_attr_show
>        sysfs_kf_seq_show
>        kernfs_seq_show
> -> #5 (kn->active#2)
>        kernfs_drain
>        __kernfs_remove
>        kernfs_remove_by_name_ns
>        sysfs_remove_file_ns
>        device_del
>        __device_link_del
>        device_links_driver_bound
> -> #4 (device_links_lock)
>        device_link_remove
>        _regulator_put
>        regulator_put
> -> #3 (regulator_list_mutex)
>        regulator_lock_dependent
>        regulator_disable
>        scpsys_power_off
>        _genpd_power_off
>        genpd_power_off
> -> #2 (&genpd->mlock/1)
>        genpd_add_subdomain
>        pm_genpd_add_subdomain
>        scpsys_add_subdomain
>        scpsys_probe
> -> #1 (&genpd->mlock)
>        genpd_runtime_resume
>        __rpm_callback
>        rpm_callback
>        rpm_resume
>        __pm_runtime_resume
>        clk_core_prepare
>        clk_prepare
> -> #0 (prepare_lock)
>        clk_prepare
>        scp_ipi_send
>        scp_send_ipi
>        mtk_rpmsg_send
>        rpmsg_send
>        cros_ec_pkt_xfer_rpmsg

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v2:
- Re-organized commit message.
- Rebased to next-20260109.

v1: https://lore.kernel.org/r/20251229043146.4102967-1-tzungbi@kernel.org

 drivers/remoteproc/mtk_scp.c     | 39 +++++++++++++++++++++++---------
 drivers/remoteproc/mtk_scp_ipi.c |  4 ++--
 2 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 328541e62158..4651311aeb07 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -283,7 +283,7 @@ static irqreturn_t scp_irq_handler(int irq, void *priv)
 	struct mtk_scp *scp = priv;
 	int ret;
 
-	ret = clk_prepare_enable(scp->clk);
+	ret = clk_enable(scp->clk);
 	if (ret) {
 		dev_err(scp->dev, "failed to enable clocks\n");
 		return IRQ_NONE;
@@ -291,7 +291,7 @@ static irqreturn_t scp_irq_handler(int irq, void *priv)
 
 	scp->data->scp_irq_handler(scp);
 
-	clk_disable_unprepare(scp->clk);
+	clk_disable(scp->clk);
 
 	return IRQ_HANDLED;
 }
@@ -665,7 +665,7 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
 	struct device *dev = scp->dev;
 	int ret;
 
-	ret = clk_prepare_enable(scp->clk);
+	ret = clk_enable(scp->clk);
 	if (ret) {
 		dev_err(dev, "failed to enable clocks\n");
 		return ret;
@@ -680,7 +680,7 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
 
 	ret = scp_elf_load_segments(rproc, fw);
 leave:
-	clk_disable_unprepare(scp->clk);
+	clk_disable(scp->clk);
 
 	return ret;
 }
@@ -691,14 +691,14 @@ static int scp_parse_fw(struct rproc *rproc, const struct firmware *fw)
 	struct device *dev = scp->dev;
 	int ret;
 
-	ret = clk_prepare_enable(scp->clk);
+	ret = clk_enable(scp->clk);
 	if (ret) {
 		dev_err(dev, "failed to enable clocks\n");
 		return ret;
 	}
 
 	ret = scp_ipi_init(scp, fw);
-	clk_disable_unprepare(scp->clk);
+	clk_disable(scp->clk);
 	return ret;
 }
 
@@ -709,7 +709,7 @@ static int scp_start(struct rproc *rproc)
 	struct scp_run *run = &scp->run;
 	int ret;
 
-	ret = clk_prepare_enable(scp->clk);
+	ret = clk_enable(scp->clk);
 	if (ret) {
 		dev_err(dev, "failed to enable clocks\n");
 		return ret;
@@ -734,14 +734,14 @@ static int scp_start(struct rproc *rproc)
 		goto stop;
 	}
 
-	clk_disable_unprepare(scp->clk);
+	clk_disable(scp->clk);
 	dev_info(dev, "SCP is ready. FW version %s\n", run->fw_ver);
 
 	return 0;
 
 stop:
 	scp->data->scp_reset_assert(scp);
-	clk_disable_unprepare(scp->clk);
+	clk_disable(scp->clk);
 	return ret;
 }
 
@@ -909,7 +909,7 @@ static int scp_stop(struct rproc *rproc)
 	struct mtk_scp *scp = rproc->priv;
 	int ret;
 
-	ret = clk_prepare_enable(scp->clk);
+	ret = clk_enable(scp->clk);
 	if (ret) {
 		dev_err(scp->dev, "failed to enable clocks\n");
 		return ret;
@@ -917,12 +917,29 @@ static int scp_stop(struct rproc *rproc)
 
 	scp->data->scp_reset_assert(scp);
 	scp->data->scp_stop(scp);
-	clk_disable_unprepare(scp->clk);
+	clk_disable(scp->clk);
 
 	return 0;
 }
 
+static int scp_prepare(struct rproc *rproc)
+{
+	struct mtk_scp *scp = rproc->priv;
+
+	return clk_prepare(scp->clk);
+}
+
+static int scp_unprepare(struct rproc *rproc)
+{
+	struct mtk_scp *scp = rproc->priv;
+
+	clk_unprepare(scp->clk);
+	return 0;
+}
+
 static const struct rproc_ops scp_ops = {
+	.prepare	= scp_prepare,
+	.unprepare	= scp_unprepare,
 	.start		= scp_start,
 	.stop		= scp_stop,
 	.load		= scp_load,
diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
index c068227e251e..7a37e273b3af 100644
--- a/drivers/remoteproc/mtk_scp_ipi.c
+++ b/drivers/remoteproc/mtk_scp_ipi.c
@@ -171,7 +171,7 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
 	    WARN_ON(len > scp_sizes->ipi_share_buffer_size) || WARN_ON(!buf))
 		return -EINVAL;
 
-	ret = clk_prepare_enable(scp->clk);
+	ret = clk_enable(scp->clk);
 	if (ret) {
 		dev_err(scp->dev, "failed to enable clock\n");
 		return ret;
@@ -211,7 +211,7 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
 
 unlock_mutex:
 	mutex_unlock(&scp->send_lock);
-	clk_disable_unprepare(scp->clk);
+	clk_disable(scp->clk);
 
 	return ret;
 }
-- 
2.52.0.457.g6b5491de43-goog


