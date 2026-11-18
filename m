Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71A7606A333
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 09:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nrvnn5nz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bk5aCbO9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=kCnXMyre11QD19JOwanEa/37YHMkLU6RdrlXI8oh2j4=; b=Nrvnn5nz9PG+qj3+zwDWbgekH9
	DBsaQ44CLrqaMM0Bg3yK8tKJmB446Ncp2+ALVpFAO5xsZ7kvL0lNLc0ObXi/LTx7t3Y0l8u7BcriG
	hQKE3XEmkEi8uGTJlxJ9t2ad8Myg4CHlKGUuyRGt0vgGBBKpNjWMzxqEMwen/FJRN7sAD4oUxhvAy
	Ek9oNQFvfNb8/ZfXjYx3HNSK8aaMBzUkRSQf3yw5sjHfMpu4YBpgv9bXtNokbnzy8hKeoFDvZPko2
	lQFQwfoch3HXRb5h9wksEjQZjSwPyLnvHzJmBhDncpSdW1lIznW+zrALIqTi4x3xFs5g2SEjZkjA9
	1TMwUe1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTc2b-00000008ORx-2640;
	Wed, 18 Nov 2026 09:33:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTc2a-00000008ORJ-0VPW;
	Wed, 18 Nov 2026 09:33:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 64FAE612AE;
	Wed, 18 Nov 2026 09:33:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794994399;
	b=J14tAz5si/UN+C1jQ8txpIXsEyOov/CN4ui3P3zmS/P5O3YFTac7A1Moiv0gfk+fLWaO
	 hjpr4R82TceH5pLv8CDonQr6u2RYQq62HuDbzWwkaHcQJ5VZbucWA9NKWyfnidBaukeU5
	 i6c1aJzPbZkrDTg2KuRep31lHYR3MUhz/9BCzghqCyI5iXfEy3lOw4goqLiWiQviOjkCT
	 rAeiYAU9Dpeo38lGGP8ka78/zn017n0x6vtu7kXUNZEhBhrcxSv9B+RfMgxP7lTAG0p1W
	 6F8YJZ0iT//UAHHVkA+KK9TC9RmX3PlnGrSA7JKl8ZfQpxxHVz5wPl4tI0lYQA+7/wQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794994399;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kCnXMyre11QD19JOwanEa/37YHMkLU6RdrlXI8oh2j4=;
	b=qLqKsVFJuUGRrY2Xr0JhhAMy7O5jaVEhTEFm8GM7kowYQnWCCC2ZVBvIayQVKr7Woqlf
	 +zD8645Zubdzyw7/eL5LF9Hf0LK/uggFq+eWjq890j7xhjSJnyQzgspqWGFmi9K09Ezsh
	 G6m5Dl8ryGRY49RduSE/ggJw12QEa1seRz2PZ92fKpHx1e0Ncf9GHF4EIG4+NDeyVWT1g
	 yykEXKUx6xYM9dFnSbr+Ctma3sXNyvsK5oyGH3qFORDL1kOIBoQyxueX2S7B5YoBSC1+x
	 r8A4LXlg27MZ7gyZG5LIbHfrseebpsRSp1TmDHP8Q/sF62lxviYObwvhzKH7CbX5ZKQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9DCA11F000C4;
	Wed, 18 Nov 2026 09:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794994399;
	bh=kCnXMyre11QD19JOwanEa/37YHMkLU6RdrlXI8oh2j4=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Bk5aCbO9TlBq4/G/hAOK93lKLYBC/DeiS6T4Wm4RJb9t1jdlV6Iu1Q8Z3li2nsMB2
	 NgfBq5dYoNy/T8Bw8i2fN8XNg38cVRHklBZVH4k/ASxY3d0/xMJ/hkyxb6PJPuXtEH
	 QvQqCS+Jmg28i4VrC/ZGmgJ/EqJrpvi3uSjAU70PDv6U7j0IprMmdDReqdQxOcI8HY
	 vE4l/wte2ZHp0klPVwyknldmEXdSgYgHYCV0lNAObpRPXIEPU+xK9N83Ho2dNT3cUD
	 HaFnj8NukBumTsGfk42oq0A1hO0Qov8VAP1uV8U4L3sAFVCElmIjR1vBeBD+6Qk2Oy
	 Ekkbu28hB8VTg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F1FCE4ACC4;
	Wed, 18 Nov 2026 09:33:17 +0000 (UTC)
From: Zi-Hao Huang via B4 Relay <devnull+zi-hao.huang.mediatek.com@kernel.org>
Date: Wed, 18 Nov 2026 17:33:11 +0800
Subject: [PATCH v2] drm/mediatek: dsi: Don't let a signal cut the IRQ wait
 short
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261118-mtk-dsi-irq-wait-v2-1-8bda52993c6f@mediatek.com>
X-B4-Tracking: v=1; b=H4sIANZw/WoC/32NTQ6CQAxGr0K6toY28hNX3sOwqEyRhgA6M0EN4
 e6OHMDle8n3vhWCetMA52wFr4sFm6cEfMig7WW6K5pLDJxzSUQ1jnFAFwzNP/ElFlH4VBGLk5I
 rSLOH187ee/LaJO4txNl/9oeFfvZPbCEk5LzouOikrW98GdWZRB2O7TxCs23bF6MjLaazAAAA
X-Change-ID: 20261118-mtk-dsi-irq-wait-a24712ada627
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 shaoming chen <shaoming.chen@mediatek.com>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Zi-Hao Huang <zi-hao.huang@mediatek.com>, CK Hu <ck.hu@mediatek.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794994396; l=2849;
 i=zi-hao.huang@mediatek.com; s=20261112; h=from:subject:message-id;
 bh=oSiLiwqCKkPp3lIKuiL5raZFKV28BSNXcVhbBi3SzXg=;
 b=vxu/8VdPlOJ1xHqEyJ64lB/7rEWbl4aMOvpjVViVoUm+YA7qopHYx1fIM4QO8RL6XUuWtY4CL
 sdTUiA0sJc2DCUsoRmyP0GpmHJ3PFqKaZ1F679Y91eWjGk/LZvKulA+
X-Developer-Key: i=zi-hao.huang@mediatek.com; a=ed25519;
 pk=tbMIVegYSSBtz5MaQSUCX9RJO88MA/AI5cbmQKbaoIc=
X-Endpoint-Received: by B4 Relay for zi-hao.huang@mediatek.com/20261112
 with auth_id=1493
X-Original-From: Zi-Hao Huang <zi-hao.huang@mediatek.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: zi-hao.huang@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zi-Hao Huang <zi-hao.huang@mediatek.com>

mtk_dsi_wait_for_irq_done() waits for the DSI IRQ with
wait_event_interruptible_timeout(). If it returns early, for example
with -ERESTARTSYS when a signal is pending, both callers still treat the
command as done, because they only handle a return value of 0 as a
failure.

On an MT8196 board this led to a hard lockup during shutdown. The wait
returned before the IRQ arrived, the panel disable sequence went on and
restarted video mode, and the late CMD_DONE interrupt was then handled
by mtk_dsi_irq(). The handler writes RACK and loops until DSI_BUSY
clears, but DSI_BUSY stays set while video mode is running, so the CPU
never leaves the handler until the watchdog fires. Forcing the wait to
return early reproduces the lockup every time, and it no longer
happens once the wait cannot return early.

The wait synchronises the driver with the hardware, and it is bounded by
its timeout. Use wait_event_timeout() so that it only ends on the IRQ or
the timeout.

wake_up_interruptible() cannot wake a task in uninterruptible sleep, so
switch mtk_dsi_irq() to wake_up(). Without it every wait would last
until its timeout.

Fixes: dd5080a54df8 ("drm/mediatek: add dsi interrupt control")
Signed-off-by: Zi-Hao Huang <zi-hao.huang@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
Changes in v2:
- Drop the remark that the wait is not made on behalf of userspace, since
  a userspace backlight change can reach it (CK)
- Collect Reviewed-by
- Link to v1: https://lore.kernel.org/r/20261118-mtk-dsi-irq-wait-v1-1-205f25fac8b2@mediatek.com
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index f82506e10fd5..1315dd31a834 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -627,9 +627,8 @@ static s32 mtk_dsi_wait_for_irq_done(struct mtk_dsi *dsi, u32 irq_flag,
 	unsigned long jiffies = msecs_to_jiffies(timeout);
 	struct drm_device *drm = dsi->bridge.dev;
 
-	ret = wait_event_interruptible_timeout(dsi->irq_wait_queue,
-					       dsi->irq_data & irq_flag,
-					       jiffies);
+	ret = wait_event_timeout(dsi->irq_wait_queue,
+				 dsi->irq_data & irq_flag, jiffies);
 	if (ret == 0) {
 		drm_warn(drm, "Wait DSI IRQ(0x%08x) Timeout\n", irq_flag);
 
@@ -656,7 +655,7 @@ static irqreturn_t mtk_dsi_irq(int irq, void *dev_id)
 
 		mtk_dsi_mask(dsi, DSI_INTSTA, status, 0);
 		mtk_dsi_irq_data_set(dsi, status);
-		wake_up_interruptible(&dsi->irq_wait_queue);
+		wake_up(&dsi->irq_wait_queue);
 	}
 
 	return IRQ_HANDLED;

---
base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
change-id: 20261118-mtk-dsi-irq-wait-a24712ada627

Best regards,
-- 
Zi-Hao Huang <zi-hao.huang@mediatek.com>



