Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8D5C88E77
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 05:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zSwtxaUSQ7K0oB62qUITKeVKiPbi0vng9/BLzWTtzOE=; b=sWTlU5Ie0RxaPBhdp7Kj+1OV8j
	YYHEdARi8go9fnvDoDuS5/DKEWUNqntQb66Qd9vn7lgyr8nvBmsQrrKW/8TkgvTDxzWSdSbifpn69
	Tn0owr4+2g1mJTf3gtTaaRV3EzsrRSGvKoRbvwwzkEPBx8TVaZGfjiplecOcWlpraOh54HYFvC631
	7ybzPTE+oH1CHUldbLgLVzUEnxNm7Tq84tv1PGj/UaoM+tpsG25mIsPbNNfh0h4ofoBey9jhHkEoO
	BFF/nELwP8JKWw0WvVwmYDxZKJ0imUJlqLhMgD20U44i2ZftlUTfLhF/QwGXa8GnMAeyn0PIbqxT4
	aStWud5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6i7y-00000008NcA-09Or;
	Wed, 16 Sep 2026 05:24:14 +0000
Received: from mail-oo2-x05.google.com ([2607:f8b0:4864:31::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6i7v-00000008NbW-2ZHJ
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 05:24:12 +0000
Received: by mail-oo2-x05.google.com with SMTP id 46e09a7af769-7f748fe2947so2247370a34.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 22:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789536250; x=1790141050; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zSwtxaUSQ7K0oB62qUITKeVKiPbi0vng9/BLzWTtzOE=;
        b=oNRL6AdDXHpHVeOGraXzqwkfNZKljw32smiv2zcfkd+HdxPtboXBPW/RZfh7bNBc6m
         kRB1VEFcCOdCSWSEJFDYc20o4ZKhgg0Il3l13FdhmQV0WSA1VYFWzCx24RuQDi32fSR5
         hj7t2jxjHEkMQYV7oM6jBpfzFEiSuLznbrvsaXBPHKCNnyx5cmPqZoZw8zo46XcXkPWR
         wlXIKt27O0ClPr2qfmhiZt0Jsg/NGkbhwWaQaHM4M6SdX9bHocx0gt4ibewnBnxC9bW+
         nT2LIk2Tmx/EvXKZemaapvSZm4LqaAzIt5O75kDKuUo63Tr2OTO1JOan8X0oEkMSCXb9
         B/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789536250; x=1790141050;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zSwtxaUSQ7K0oB62qUITKeVKiPbi0vng9/BLzWTtzOE=;
        b=RkrlXCL0/GEwGypzLXReJfqGZrZ0yqYKrMjQ4o+yWXNL5qozieJhI2R2hIbZCv4Q8v
         xYgQXatfOAc/P7C2LnirGOIbHICRPx0mDNjdyVmZaAwAHOnJ7Uz4T0TV9vUAz8j+b48n
         CKi6Nv2jwAaBgR8q5YzVTj7OkYtWaalt2buSMKTZKcrMaXJBI+8zoNTRMG9dH8Gb94c/
         sJdJtgr+yHs722OMI368d9xnaDXMoAJm1vVO98hEuLK5ySH4ckOix5kekaJr7S4yYqDc
         /7yZH2xloBSs0smypaulNqDWycomMN3EY6ogLWYbaxU34cqMlzH15L/QGBu0bQpZdroJ
         u9Sg==
X-Forwarded-Encrypted: i=1; AKwUvBzr6bwb1YR7jf1Aedcovi9MEdVt5atWgk8JpyYPaXX8CPoFMJFBAaAK9GfQ2EUQKLDITyh62c94aca3JihxTQ==@lists.infradead.org
X-Gm-Message-State: AFuF++n8rFpHGd76qPqCNt+J/qi/P4k2IFwJJztFzw+aqvJ+6kuK3CH5
	5sochcGnqhR/2qh1jvwcALdFhU7kL3EgI2pJ6WZ0V7hCn26QSIHPkytD
X-Gm-Gg: AYBFou0duvAxMUeuPItadXx058ZKR26yr2tee4SzMlGO2NynRqSpK+cARW8rzOGJzKv
	RQ1YzCkR1rPS43TCI81hluYPpWJLeQAXsXBxXlFzLQ8g2vUkQx4yU7zJgwLZkE1TVv9FiKDOYAs
	KmS78lF8xhWn/AriD8+fWlYlvCOU1GpDe+vYQEkaIeGCT/5DnC0apY4TpEaKlvdyIMtPItHN4Gu
	szhOCHfxdxHejGh50CNq0aGz+dCpDGik30u3y+d0EZuQH6HEDNmdrQ8scJXm5mSzCQtvZiKEcER
	4qHYHGOb5beB2Drs2kS/PEEWQK2LOlT1VZsNaMkMuhkQopS9hHktCg3x46gmNy2EoUWW7ILMT9/
	uxNcNtayLRkqXoqJHBvDG+E+IHClU7pDGcqyQUYL9sI0OiTwEtRvF8MRpFiWsctTkXV41E9Q/nM
	PxO83Vh6whWPY+FDL/3eF64Bi80QtrlKzWVESG8J2Sp8Cybk6Q4MvQLwEJX4jRd4D/zK8=
X-Received: by 2002:a05:6830:6d2e:b0:80a:45e1:7677 with SMTP id 46e09a7af769-80b2f3ac500mr1403318a34.23.1789536250381;
        Tue, 15 Sep 2026 22:24:10 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80b07ad0294sm1562819a34.24.2026.09.15.22.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:24:09 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 16 Sep 2026 00:24:00 -0500
Subject: [PATCH] drm/mediatek: dsi: force command mode in mtk_dsi_poweron()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-v1-1-b37f167e25cb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NwQqDMAyA4VeRnBeonYjuVcYO2kQXRqskdoyJ7
 27x+F3+fwdjFTZ4VDsof8VkSQX1rYLwHtLMKFQM3vnW9XWLOmpmtMx/zKttykOUNGPcPkgmGCJ
 hXIiRunsTnO+nZuyg1FblSX7X6fk6jhM0/FZ9eQAAAA==
X-Change-ID: 20260916-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-d834c029f4b8
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789536248; l=2721;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=hpjXRGa4viZcbFnNO5KBT0ICAECMSKtgFaKjk3ZUers=;
 b=YGYtnMBV27PnM1edrgMETUOi3yg7VZTGrzPFHJou4Uz1zxAGKN1TiUeZkDDsyt2+fjf5MWWPb
 W6IpgB8c/lLB0mGPpb7e2KK71MSkVE3pVyuDUNsENUDYOqVIuiy9cDh
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_222411_686100_E8B9B0CE 
X-CRM114-Status: GOOD (  14.91  )
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

mtk_dsi_reset_engine() does not touch DSI_MODE_CTRL, so whatever the
bootloader left there survives power-on. On boards where the bootloader
lights the panel for a boot logo and hands the DSI over still running, the
leftover value is a video mode, and the first mtk_dsi_host_transfer() then
takes the "already streaming" path: it stops the stream and waits for
VM_DONE, which never arrives, because the engine reset has already stopped
the stream. The panel's very first command fails and it is never
initialised:

  [drm] Wait DSI IRQ(0x00000008) Timeout
  *ERROR* failed to switch cmd mode
  sending dcs data 8f a5 failed: -62

Set command mode right after the engine reset, so DSI_MODE_CTRL describes
the state the reset leaves the engine in. The video mode is programmed by
mtk_dsi_set_mode() when the stream is actually started, exactly as today.

Seen on the Amazon Fire HD 10 (2017), whose LK bootloader draws its logo
over DSI in video mode and never stops the stream before jumping to the
kernel.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
The board this was found on, an Amazon Fire HD 10 (2017), is not upstream
yet, so no in-tree board regresses without this. It is a state-consistency
fix either way: mtk_dsi_reset_engine() stops the stream but leaves
DSI_MODE_CTRL still describing the mode the bootloader was driving, and
nothing writes that register again until mtk_dsi_set_mode() at stream start.

This touches the same lines as "drm/mediatek: mtk_dsi: Transfer register
offsets to per-SoC const" from the MT8196 series; I will rebase on top of
that if it lands first.
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 7961139333ad..4cb486f54653 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -737,6 +737,15 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 		       dsi->regs + dsi->driver_data->reg_shadow_dbg_off);
 
 	mtk_dsi_reset_engine(dsi);
+
+	/*
+	 * mtk_dsi_reset_engine() leaves DSI_MODE_CTRL alone, so a video mode
+	 * left there by a bootloader that handed the panel over still running
+	 * would make the first command wait for a VM_DONE that never arrives.
+	 * mtk_dsi_set_mode() programs the real mode when the stream starts.
+	 */
+	mtk_dsi_set_cmd_mode(dsi);
+
 	mtk_dsi_phy_timconfig(dsi);
 
 	mtk_dsi_ps_control(dsi, true);

---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260916-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-d834c029f4b8

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>


