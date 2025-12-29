Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326F7E8FDB1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Dec 2025 04:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7qsA59Z6VFaS78baJa7kQDv/8RvoseWsssX5vdMZZ1o=; b=02JkCj8elsoQN3QHePDghFqw5A
	CXTZN1bIfNdrmxrKGCVfvx6/YEFfjO1onvyWAB0SeHlS2Fb1F1YtdnFrYq6U4cxailwu3efijLJl/
	dtOc6kx7ePhiSsvJzAe8bMO9MP3A2Re0Y5Xmu9XGHuGxKngbZcZi67typdEHPTwJkcMxZJeU+TT6X
	7+u+fVm84E487RatKjzzOCMKwiYpy7AyL065QfgFOxjGO0pfZwxeToNDoeQTtTDJt8MXgXJEX3geL
	ax8xIh8RpDH4XcGyRlCLSlD48UV92Wu2tbyaRw05Y6yMwWmE2MppIp6I2ezQGX3KNNCPDjCgh5awZ
	yOER17aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va4vf-00000003JtL-2JEA;
	Mon, 29 Dec 2025 04:32:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va4vd-00000003Jsx-3P06
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Dec 2025 04:32:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B6C240DC5;
	Mon, 29 Dec 2025 04:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4716C4CEF7;
	Mon, 29 Dec 2025 04:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766982739;
	bh=kLJp2zW30SyEirLd2hJk5YmCXnYsCmPJ8ttStB77kFw=;
	h=From:To:Cc:Subject:Date:From;
	b=R17pDxF2cYQGJjr0Lui2Oskacm9bRRnadyTcMahexEeGvO8Ps+pERAKLWB9+MvSyj
	 Gb+GMAyo0U+bGza6YOMQXCf4uBGdozhNV3kLFPUE8wrQyoLOYtH5DLxRX2y3fZpGNY
	 sVhMUjr4bQ2eNLUhhYBJBPTuUbmhMOpeHcH2IZPSW7ZII/aftWtl55uCpX29x7G30P
	 T92ByQqgJVMEVaEQJqVaaNlRhE6ny2NEr9DG7E5sVdbeUizVVe4iDhet4VE7ttrQiT
	 d+kIEmC/ZCfmSBHoPuvd0OdF2GvRtAyJphGQN2s2Kd72iJvVWzKNEUVOL7O658a3Bt
	 ABlYzJ3S4+5Wg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	tzungbi@kernel.org
Subject: [PATCH] remoteproc: mediatek: Break lock dependency to `prepare_lock`
Date: Mon, 29 Dec 2025 04:31:46 +0000
Message-ID: <20251229043146.4102967-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_203221_891046_1A378D9E 
X-CRM114-Status: GOOD (  12.28  )
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

`scp_ipi_send` acquires `prepare_lock` via `clk_prepare_enable` while
the caller often holds `ec_dev->lock` (e.g., `cros_ec_cmd_xfer`).  The
reverse dependency exists where `clk_prepare` can trigger operations
that eventually take `ec_dev->lock` (e.g., via sysfs/regulator/genpd).

Move clock prepare / unprepare operations to remoteproc prepare() /
unprepare() callbacks to break the lock dependency from `ec_dev->lock`
to `prepare_lock`.

This breaks the dependency chain in the lockdep report:
> WARNING: possible circular locking dependency detected
> ...
> the existing dependency chain (in reverse order) is:
> ...
> -> #0 (prepare_lock){+.+.}-{3:3}:
>        __lock_acquire
>        lock_acquire
>        __mutex_lock_common
>        mutex_lock_nested
>        clk_prepare
>        scp_ipi_send [mtk_scp_ipi]
>        scp_send_ipi [mtk_scp]
>        mtk_rpmsg_send [mtk_rpmsg]
>        rpmsg_send [rpmsg_core]
>        cros_ec_pkt_xfer_rpmsg [cros_ec_rpmsg]

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/remoteproc/mtk_scp.c     | 39 +++++++++++++++++++++++---------
 drivers/remoteproc/mtk_scp_ipi.c |  4 ++--
 2 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index db8fd045468d..98d00bd5200c 100644
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
2.52.0.351.gbe84eed79e-goog


