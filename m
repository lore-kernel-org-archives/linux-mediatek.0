Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861BDC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jan 2022 23:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=5uXmntClZLngxIrInpxOPCJCE9Rsd1mmt/uitk/nwYI=; b=no3
	Bzbl0qiwAwUidIsNPigV06Xde95rYPE55f+INykfXEKtin4cdYrbgKUccnDCRt69tzNMId4HkU+4t
	1aznZbNu3ZiUq8uQMHG5/g/U/+hnQUyx61xrxbflA4Tma1ZXkroDltXJI1szkN1acY2NQrICNmpXN
	nE8OEGW+G1AuGa6zrYe3oJ7ZZ5ZkLzu9QrqbAPZJna8/HDyubmtkhHRU8hUyIWH6JM8lmeQfcm4+u
	qlJ3SdMN1nX95qK+6CF/kxrZIChiLXS+qB1Q5EJyarh1624XLf3QVS+Fssx7m0p3uURVk2ADap6AA
	fPqWKZ6M2xkYYBoDheYcK7ZODT4TbBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nB3D2-00GELV-LG; Fri, 21 Jan 2022 23:20:44 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nB3Cq-00GEJe-1b
 for linux-mediatek@lists.infradead.org; Fri, 21 Jan 2022 23:20:33 +0000
Received: by mail-pj1-x104a.google.com with SMTP id
 w2-20020a17090aad4200b001b4c7c04a94so9384117pjv.3
 for <linux-mediatek@lists.infradead.org>; Fri, 21 Jan 2022 15:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=rJkt2rp2sXcRKhkLbOo10vg523kUXSvK0RkANN3MrI4=;
 b=b0PSSLjMA5GIr8UuuiikhzZQaMMaOujVMTttgymGlcyXTBrxEQ+In/nePf5noq63y2
 t2u+JHI9BGHGdFMV97vpwtPj3Oahi9eB0h6OSMJFp5sD+z5Gtvp1MjVaaYnelF9UyB0d
 ZzMwUDxuv/bnHw1/FnDtbLdFXEaJ56mNZZ/G99IC8hF3TsLxh6ic0Jfuo5laKGW9e3ya
 8wgx32Wmh1Fp1zSBADrgzOQBA2NdwZ8d5a+iKi+dX6saxgIxAalHhMwmgVM+IP713Ld7
 7tC2jJNavikNSohhSy2FODSIiQC/D1Vb6ZZKU1Id2dJjRdEmko2CRzs+CcMgzrnbMpps
 qItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=rJkt2rp2sXcRKhkLbOo10vg523kUXSvK0RkANN3MrI4=;
 b=dgM/FzfJl3y93fIIuCcLQvPhvKTs76mIwwjb98eInBVzdDL8c9IxRyw7PSVdbIq4BI
 LSOSiV8Hil6peZwfZ0/uZRhqXbScuTHb0O0De/TQW3vS508BuOH2VWJRVdKj8iAg1EB1
 VfOSKMmbT9UN4BlxfthrHhmekZReK3Nmp9x/F9wBuRBEhQ59sIIg5ZK8ZS4/GuBKwCh0
 G1vGmJ09mNLWIWdUbPwTRcHzk3qG3rGGka02Lx3qlsxKE20L8qhBZHZzUd4D6HixJcQN
 hFM/cDVaZR28B4/rB8PsGAVgHDCkzMI/tzQHxiS8XacQeg6QCh86g5rLSiVVCf61LpdY
 7klg==
X-Gm-Message-State: AOAM530NPWkzWn3JwApYrXmAelff4hx85rTgfEG9WHthfqkhlE8d8xqJ
 JZFbhWfCgi8MUDxrokD90nkUk3PMP6tiXiiFYH8=
X-Google-Smtp-Source: ABdhPJy1ZSu0bOXNhLK9X7vDvaQii1mjijoZbMteqfbEmW74sdj3aP0uARWXHVYxLbcNveDJnsIxebCVN62BHQ7jANs=
X-Received: from willmcvicker.c.googlers.com
 ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a05:6a00:168b:b0:4a8:d88:9cd with
 SMTP id k11-20020a056a00168b00b004a80d8809cdmr5650635pfc.11.1642807230301;
 Fri, 21 Jan 2022 15:20:30 -0800 (PST)
Date: Fri, 21 Jan 2022 23:16:44 +0000
Message-Id: <20220121231644.1732744-1-willmcvicker@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
Subject: [PATCH v1 1/1] ASoC: dpcm: prevent snd_soc_dpcm use after free
From: Will McVicker <willmcvicker@google.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel-team@android.com, KaiChieh Chuang <kaichieh.chuang@mediatek.com>, 
 Will McVicker <willmcvicker@google.com>, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_152032_137797_4D7B224B 
X-CRM114-Status: GOOD (  17.59  )
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

From: KaiChieh Chuang <kaichieh.chuang@mediatek.com>

[ Upstream commit a9764869779081e8bf24da07ac040e8f3efcf13a ]

The dpcm get from fe_clients/be_clients
may be free before use

Add a spin lock at snd_soc_card level,
to protect the dpcm instance.
The lock may be used in atomic context, so use spin lock.

Use irq spin lock version,
since the lock may be used in interrupts.

possible race condition between
void dpcm_be_disconnect(
	...
	list_del(&dpcm->list_be);
	list_del(&dpcm->list_fe);
	kfree(dpcm);
	...

and
	for_each_dpcm_fe()
	for_each_dpcm_be*()

race condition example
Thread 1:
    snd_soc_dapm_mixer_update_power()
        -> soc_dpcm_runtime_update()
            -> dpcm_be_disconnect()
                -> kfree(dpcm);
Thread 2:
    dpcm_fe_dai_trigger()
        -> dpcm_be_dai_trigger()
            -> snd_soc_dpcm_can_be_free_stop()
                -> if (dpcm->fe == fe)

Excpetion Scenario:
	two FE link to same BE
	FE1 -> BE
	FE2 ->

	Thread 1: switch of mixer between FE2 -> BE
	Thread 2: pcm_stop FE1

Exception:

Unable to handle kernel paging request at virtual address dead0000000000e0

pc=<> [<ffffff8960e2cd10>] dpcm_be_dai_trigger+0x29c/0x47c
	sound/soc/soc-pcm.c:3226
		if (dpcm->fe == fe)
lr=<> [<ffffff8960e2f694>] dpcm_fe_dai_do_trigger+0x94/0x26c

Backtrace:
[<ffffff89602dba80>] notify_die+0x68/0xb8
[<ffffff896028c7dc>] die+0x118/0x2a8
[<ffffff89602a2f84>] __do_kernel_fault+0x13c/0x14c
[<ffffff89602a27f4>] do_translation_fault+0x64/0xa0
[<ffffff8960280cf8>] do_mem_abort+0x4c/0xd0
[<ffffff8960282ad0>] el1_da+0x24/0x40
[<ffffff8960e2cd10>] dpcm_be_dai_trigger+0x29c/0x47c
[<ffffff8960e2f694>] dpcm_fe_dai_do_trigger+0x94/0x26c
[<ffffff8960e2edec>] dpcm_fe_dai_trigger+0x3c/0x44
[<ffffff8960de5588>] snd_pcm_do_stop+0x50/0x5c
[<ffffff8960dded24>] snd_pcm_action+0xb4/0x13c
[<ffffff8960ddfdb4>] snd_pcm_drop+0xa0/0x128
[<ffffff8960de69bc>] snd_pcm_common_ioctl+0x9d8/0x30f0
[<ffffff8960de1cac>] snd_pcm_ioctl_compat+0x29c/0x2f14
[<ffffff89604c9d60>] compat_SyS_ioctl+0x128/0x244
[<ffffff8960283740>] el0_svc_naked+0x34/0x38
[<ffffffffffffffff>] 0xffffffffffffffff

Signed-off-by: KaiChieh Chuang <kaichieh.chuang@mediatek.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
[willmcvicker: move spinlock to bottom of struct snd_soc_card]
Signed-off-by: Will McVicker <willmcvicker@google.com>
Cc: stable@vger.kernel.org # 4.19+
---
 include/sound/soc.h  |  2 ++
 sound/soc/soc-core.c |  1 +
 sound/soc/soc-pcm.c  | 40 +++++++++++++++++++++++++++++++++-------
 3 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 88aa48e5485f..7abd8d4746ef 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1113,6 +1113,8 @@ struct snd_soc_card {
 	u32 pop_time;
 
 	void *drvdata;
+
+	spinlock_t dpcm_lock;
 };
 
 /* SoC machine DAI configuration, glues a codec and cpu DAI together */
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 8531b490f6f6..273898b358c4 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2752,6 +2752,7 @@ int snd_soc_register_card(struct snd_soc_card *card)
 	card->instantiated = 0;
 	mutex_init(&card->mutex);
 	mutex_init(&card->dapm_mutex);
+	spin_lock_init(&card->dpcm_lock);
 
 	ret = snd_soc_instantiate_card(card);
 	if (ret != 0)
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index af14304645ce..c03b653bf6ff 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1221,6 +1221,7 @@ static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
 		struct snd_soc_pcm_runtime *be, int stream)
 {
 	struct snd_soc_dpcm *dpcm;
+	unsigned long flags;
 
 	/* only add new dpcms */
 	list_for_each_entry(dpcm, &fe->dpcm[stream].be_clients, list_be) {
@@ -1236,8 +1237,10 @@ static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
 	dpcm->fe = fe;
 	be->dpcm[stream].runtime = fe->dpcm[stream].runtime;
 	dpcm->state = SND_SOC_DPCM_LINK_STATE_NEW;
+	spin_lock_irqsave(&fe->card->dpcm_lock, flags);
 	list_add(&dpcm->list_be, &fe->dpcm[stream].be_clients);
 	list_add(&dpcm->list_fe, &be->dpcm[stream].fe_clients);
+	spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 
 	dev_dbg(fe->dev, "connected new DPCM %s path %s %s %s\n",
 			stream ? "capture" : "playback",  fe->dai_link->name,
@@ -1283,6 +1286,7 @@ static void dpcm_be_reparent(struct snd_soc_pcm_runtime *fe,
 void dpcm_be_disconnect(struct snd_soc_pcm_runtime *fe, int stream)
 {
 	struct snd_soc_dpcm *dpcm, *d;
+	unsigned long flags;
 
 	list_for_each_entry_safe(dpcm, d, &fe->dpcm[stream].be_clients, list_be) {
 		dev_dbg(fe->dev, "ASoC: BE %s disconnect check for %s\n",
@@ -1302,8 +1306,10 @@ void dpcm_be_disconnect(struct snd_soc_pcm_runtime *fe, int stream)
 #ifdef CONFIG_DEBUG_FS
 		debugfs_remove(dpcm->debugfs_state);
 #endif
+		spin_lock_irqsave(&fe->card->dpcm_lock, flags);
 		list_del(&dpcm->list_be);
 		list_del(&dpcm->list_fe);
+		spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 		kfree(dpcm);
 	}
 }
@@ -1557,10 +1563,13 @@ int dpcm_process_paths(struct snd_soc_pcm_runtime *fe,
 void dpcm_clear_pending_state(struct snd_soc_pcm_runtime *fe, int stream)
 {
 	struct snd_soc_dpcm *dpcm;
+	unsigned long flags;
 
+	spin_lock_irqsave(&fe->card->dpcm_lock, flags);
 	list_for_each_entry(dpcm, &fe->dpcm[stream].be_clients, list_be)
 		dpcm->be->dpcm[stream].runtime_update =
 						SND_SOC_DPCM_UPDATE_NO;
+	spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 }
 
 static void dpcm_be_dai_startup_unwind(struct snd_soc_pcm_runtime *fe,
@@ -2626,6 +2635,7 @@ static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int stream)
 	struct snd_soc_dpcm *dpcm;
 	enum snd_soc_dpcm_trigger trigger = fe->dai_link->trigger[stream];
 	int ret;
+	unsigned long flags;
 
 	dev_dbg(fe->dev, "ASoC: runtime %s open on FE %s\n",
 			stream ? "capture" : "playback", fe->dai_link->name);
@@ -2695,11 +2705,13 @@ static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int stream)
 	dpcm_be_dai_shutdown(fe, stream);
 disconnect:
 	/* disconnect any non started BEs */
+	spin_lock_irqsave(&fe->card->dpcm_lock, flags);
 	list_for_each_entry(dpcm, &fe->dpcm[stream].be_clients, list_be) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
 		if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
 				dpcm->state = SND_SOC_DPCM_LINK_STATE_FREE;
 	}
+	spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 
 	return ret;
 }
@@ -3278,7 +3290,10 @@ int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
 {
 	struct snd_soc_dpcm *dpcm;
 	int state;
+	int ret = 1;
+	unsigned long flags;
 
+	spin_lock_irqsave(&fe->card->dpcm_lock, flags);
 	list_for_each_entry(dpcm, &be->dpcm[stream].fe_clients, list_fe) {
 
 		if (dpcm->fe == fe)
@@ -3287,12 +3302,15 @@ int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
 		state = dpcm->fe->dpcm[stream].state;
 		if (state == SND_SOC_DPCM_STATE_START ||
 			state == SND_SOC_DPCM_STATE_PAUSED ||
-			state == SND_SOC_DPCM_STATE_SUSPEND)
-			return 0;
+			state == SND_SOC_DPCM_STATE_SUSPEND) {
+			ret = 0;
+			break;
+		}
 	}
+	spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 
 	/* it's safe to free/stop this BE DAI */
-	return 1;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_free_stop);
 
@@ -3305,7 +3323,10 @@ int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
 {
 	struct snd_soc_dpcm *dpcm;
 	int state;
+	int ret = 1;
+	unsigned long flags;
 
+	spin_lock_irqsave(&fe->card->dpcm_lock, flags);
 	list_for_each_entry(dpcm, &be->dpcm[stream].fe_clients, list_fe) {
 
 		if (dpcm->fe == fe)
@@ -3315,12 +3336,15 @@ int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
 		if (state == SND_SOC_DPCM_STATE_START ||
 			state == SND_SOC_DPCM_STATE_PAUSED ||
 			state == SND_SOC_DPCM_STATE_SUSPEND ||
-			state == SND_SOC_DPCM_STATE_PREPARE)
-			return 0;
+			state == SND_SOC_DPCM_STATE_PREPARE) {
+			ret = 0;
+			break;
+		}
 	}
+	spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 
 	/* it's safe to change hw_params */
-	return 1;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_params);
 
@@ -3359,6 +3383,7 @@ static ssize_t dpcm_show_state(struct snd_soc_pcm_runtime *fe,
 	struct snd_pcm_hw_params *params = &fe->dpcm[stream].hw_params;
 	struct snd_soc_dpcm *dpcm;
 	ssize_t offset = 0;
+	unsigned long flags;
 
 	/* FE state */
 	offset += scnprintf(buf + offset, size - offset,
@@ -3386,6 +3411,7 @@ static ssize_t dpcm_show_state(struct snd_soc_pcm_runtime *fe,
 		goto out;
 	}
 
+	spin_lock_irqsave(&fe->card->dpcm_lock, flags);
 	list_for_each_entry(dpcm, &fe->dpcm[stream].be_clients, list_be) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
 		params = &dpcm->hw_params;
@@ -3406,7 +3432,7 @@ static ssize_t dpcm_show_state(struct snd_soc_pcm_runtime *fe,
 				params_channels(params),
 				params_rate(params));
 	}
-
+	spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 out:
 	return offset;
 }
-- 
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
