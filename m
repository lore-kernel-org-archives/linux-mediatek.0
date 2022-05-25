Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A50C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 May 2022 09:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EaVPftU8ZHCeWHPInDLPd4y/MvJybmkjHMTn7M9cWgY=; b=iXfU3SDGSCJvmu
	X0EF8pvzpplXxjbgbUJ3MS9LOLvev8EaPrSx7VtkGafLWSlH9xw8EUJVOpGOB5HLXiOyj45j089GF
	GXRXxmrHElK0F5aKut5Cvbd86O1snhw43SdICIc33DjEdNT+6ZEJv0uIUAZZwp3BZyJNzlXWGpDW0
	xI71YDNegVmiXijxHDJEDBs7Dn+LJFNWxSbj8m63Nr/U2qG4gYfJ9KhPEYL3iALys+aeF+hnEo5y2
	hv0JEnQcsqEdF2Wvdei3P6Hrh6i5Y3lnZed3B9AS1VXagOIgBdyDPR+TClftXWSNzqwO+98m7Z3Ms
	TWnGWxO9HxmQhT7FqqyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntn45-00AXlc-P3; Wed, 25 May 2022 09:12:25 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntn3u-00AXjM-FT; Wed, 25 May 2022 09:12:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8861B1F4496A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653469931;
 bh=jhlvNujJZ+7GWC27bWuoWRrm1K541tZjvGmeL94ME2I=;
 h=From:To:Cc:Subject:Date:From;
 b=mulk/s1j4MggZvC2nueHcJkx4ICK/NaQaEGAihzUNLS13bE5iQvflj+daXoq5LkEc
 YTygk8Bc0xyg3QJUVW5KQJt18OqHkeK65ogR24+Sl4Kz2/bqm3iHQMfBE++Z9Wl/jO
 yekWO/YHqyA6jTWb3MkjTpbGeKoFV043c5n6rpK0Ha0vPde5XlsOkxD2QDQZrQOCif
 zGW4+XaI0Pdz11rwtgRD6xrdAUxttg0fiE53tfEwzZaJsXKSLoO2fkw/kgv0SwQM2R
 uyDK0zMlyAJmf1FANMG1MqIiTSP0k1Ecb3MVFs3rDDHi7C9z3Cc5l8/8EzlmNuTHM2
 2JiAWTlMC7M7A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: bjorn.andersson@linaro.org
Cc: mathieu.poirier@linaro.org, matthias.bgg@gmail.com, pihsun@chromium.org,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2] rpmsg: mtk_rpmsg: Fix circular locking dependency
Date: Wed, 25 May 2022 11:12:01 +0200
Message-Id: <20220525091201.14210-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_021214_903288_0749DE84 
X-CRM114-Status: GOOD (  11.45  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

During execution of the worker that's used to register rpmsg devices
we are safely locking the channels mutex but, when creating a new
endpoint for such devices, we are registering a IPI on the SCP, which
then makes the SCP to trigger an interrupt, lock its own mutex and in
turn register more subdevices.
This creates a circular locking dependency situation, as the mtk_rpmsg
channels_lock will then depend on the SCP IPI lock.

[   18.014514]  Possible unsafe locking scenario:
[   18.014515]        CPU0                    CPU1
[   18.014517]        ----                    ----
[   18.045467]   lock(&mtk_subdev->channels_lock);
[   18.045474]                                lock(&scp->ipi_desc[i].lock);
[   18.228399]                                lock(&mtk_subdev->channels_lock);
[   18.228405]   lock(&scp->ipi_desc[i].lock);
[   18.264405]

To solve this, simply unlock the channels_lock mutex before calling
mtk_rpmsg_register_device() and relock it right after, as safety is
still ensured by the locking mechanism that happens right after
through SCP.

Fixes: 7017996951fd ("rpmsg: add rpmsg support for mt8183 SCP.")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

v2: Adding debug log to changelog portion, fixed commit description

[   15.447736] ======================================================
[   15.460158] WARNING: possible circular locking dependency detected
[   15.460161] 5.17.0-next-20220324+ #399 Not tainted
[   15.460165] ------------------------------------------------------
[   15.460166] kworker/0:3/155 is trying to acquire lock:
[   15.460170] ffff5b4d0eaf1308 (&scp->ipi_desc[i].lock){+.+.}-{4:4}, at: scp_ipi_lock+0x34/0x50 [mtk_scp_ipi]
[   15.504958] 
[]                but task is already holding lock:
[   15.504960] ffff5b4d0e8f1918 (&mtk_subdev->channels_lock){+.+.}-{4:4}, at: mtk_register_device_work_function+0x50/0x1cc [mtk_rpmsg]
[   15.504978] 
[]                which lock already depends on the new lock.

[   15.504980] 
[]                the existing dependency chain (in reverse order) is:
[   15.504982] 
[]               -> #1 (&mtk_subdev->channels_lock){+.+.}-{4:4}:
[   15.504990]        lock_acquire+0x68/0x84
[   15.504999]        __mutex_lock+0xa4/0x3e0
[   15.505007]        mutex_lock_nested+0x40/0x70
[   15.505012]        mtk_rpmsg_ns_cb+0xe4/0x134 [mtk_rpmsg]
[   15.641684]        mtk_rpmsg_ipi_handler+0x38/0x64 [mtk_rpmsg]
[   15.641693]        scp_ipi_handler+0xbc/0x180 [mtk_scp]
[   15.663905]        mt8192_scp_irq_handler+0x44/0xa4 [mtk_scp]
[   15.663915]        scp_irq_handler+0x6c/0xa0 [mtk_scp]
[   15.685779]        irq_thread_fn+0x34/0xa0
[   15.685785]        irq_thread+0x18c/0x240
[   15.685789]        kthread+0x104/0x110
[   15.709579]        ret_from_fork+0x10/0x20
[   15.709586] 
[]               -> #0 (&scp->ipi_desc[i].lock){+.+.}-{4:4}:
[   15.731271]        __lock_acquire+0x11e4/0x1910
[   15.740367]        lock_acquire.part.0+0xd8/0x220
[   15.749813]        lock_acquire+0x68/0x84
[   15.757861]        __mutex_lock+0xa4/0x3e0
[   15.766084]        mutex_lock_nested+0x40/0x70
[   15.775006]        scp_ipi_lock+0x34/0x50 [mtk_scp_ipi]
[   15.785503]        scp_ipi_register+0x40/0xa4 [mtk_scp_ipi]
[   15.796697]        scp_register_ipi+0x1c/0x30 [mtk_scp]
[   15.807194]        mtk_rpmsg_create_ept+0xa0/0x108 [mtk_rpmsg]
[   15.818912]        rpmsg_create_ept+0x44/0x60
[   15.827660]        cros_ec_rpmsg_probe+0x15c/0x1f0
[   15.837282]        rpmsg_dev_probe+0x128/0x1d0
[   15.846203]        really_probe.part.0+0xa4/0x2a0
[   15.855649]        __driver_probe_device+0xa0/0x150
[   15.865443]        driver_probe_device+0x48/0x150
[   15.877157]        __device_attach_driver+0xc0/0x12c
[   15.889359]        bus_for_each_drv+0x80/0xe0
[   15.900330]        __device_attach+0xe4/0x190
[   15.911303]        device_initial_probe+0x1c/0x2c
[   15.922969]        bus_probe_device+0xa8/0xb0
[   15.933927]        device_add+0x3a8/0x8a0
[   15.944193]        device_register+0x28/0x40
[   15.954970]        rpmsg_register_device+0x5c/0xa0
[   15.966782]        mtk_register_device_work_function+0x148/0x1cc [mtk_rpmsg]
[   15.983146]        process_one_work+0x294/0x664
[   15.994458]        worker_thread+0x7c/0x45c
[   16.005069]        kthread+0x104/0x110
[   16.014789]        ret_from_fork+0x10/0x20
[   16.025201] 
[]               other info that might help us debug this:

[   16.047769]  Possible unsafe locking scenario:

[   16.063942]        CPU0                    CPU1
[   16.075166]        ----                    ----
[   16.086376]   lock(&mtk_subdev->channels_lock);
[   16.097592]                                lock(&scp->ipi_desc[i].lock);
[   16.113188]                                lock(&mtk_subdev->channels_lock);
[   16.129482]   lock(&scp->ipi_desc[i].lock);
[   16.140020] 
[]                *** DEADLOCK ***

[   16.158282] 4 locks held by kworker/0:3/155:
[   16.168978]  #0: ffff5b4d00008748 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x1fc/0x664
[   16.190017]  #1: ffff80000953bdc8 ((work_completion)(&mtk_subdev->register_work)){+.+.}-{0:0}, at: process_one_work+0x1fc/0x664
[   16.215269]  #2: ffff5b4d0e8f1918 (&mtk_subdev->channels_lock){+.+.}-{4:4}, at: mtk_register_device_work_function+0x50/0x1cc [mtk_rpmsg]
[   16.242131]  #3: ffff5b4d05964190 (&dev->mutex){....}-{4:4}, at: __device_attach+0x44/0x190

 drivers/rpmsg/mtk_rpmsg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
index 5b4404b8be4c..d1213c33da20 100644
--- a/drivers/rpmsg/mtk_rpmsg.c
+++ b/drivers/rpmsg/mtk_rpmsg.c
@@ -234,7 +234,9 @@ static void mtk_register_device_work_function(struct work_struct *register_work)
 		if (info->registered)
 			continue;
 
+		mutex_unlock(&subdev->channels_lock);
 		ret = mtk_rpmsg_register_device(subdev, &info->info);
+		mutex_lock(&subdev->channels_lock);
 		if (ret) {
 			dev_err(&pdev->dev, "Can't create rpmsg_device\n");
 			continue;
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
