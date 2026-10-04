Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3753CA5FF0
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Oct 2026 20:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=64dx1BbNweAnxiSqrDwTCBobsnxCeoMwaSiq5ZXWTOc=; b=JyGCYYKIxE6mB8BBPdsNwEkaQx
	fdIlHk4gi2qS42CUSOM652XLGwDw+09dtsaQv0sgv5JGEZscij40ezsEVKL6kR17h952rQMY16HRF
	U9A7Df/oPHTeTnqsX6WdovtYnp/KWBzKujByCGDm93xLF9e4R3o91v5zZZluFBuO+D0oM4wDYM9AF
	0uD7TZxRaPAWmk67G6Kv5UmS0Wgmar2Wa7dO9J0+pOHngb4fAf545pm4fd0geaoyHBQwXrdlhoPBI
	rfMaX1X0NUNCA4ys+yo2hzTjLYzvwjOC6rpLyFltZKntPXG6SbuNTtiL5v8CGZA9g1kKG2qeUI0Fr
	KecGTW9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDT8j-0000000FIiD-1wIu;
	Sun, 04 Oct 2026 20:48:57 +0000
Received: from mail-oo2-x08.google.com ([2607:f8b0:4864:31::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDT8h-0000000FIhU-0fjc
	for linux-mediatek@lists.infradead.org;
	Sun, 04 Oct 2026 20:48:56 +0000
Received: by mail-oo2-x08.google.com with SMTP id 46e09a7af769-81d53a6ca68so1869567a34.1
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Oct 2026 13:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791146933; x=1791751733; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=64dx1BbNweAnxiSqrDwTCBobsnxCeoMwaSiq5ZXWTOc=;
        b=IGpHhEcat/CBpisQfNig0evIbsMkQosxq5WvdHnNyrPp3HTN4FgIqC8hGhlIPEiAOi
         oKCoJ+HSI0P7A6zrCjkrz8UyMs4PM1gLJBYEM7XkzIiRhVHOzt6zJQLB0PqWMKmQCtUX
         lynA6P8Dkl+iw+qUCHUmWjT9gVZKpYvvyAzWb9crmHx0ZqGRysoJHzlgw4+quFVfSmT+
         N5Nzh7OoHR6JQU2Pst+WWBXtEdJjbJD8Dozv2B8/j4CrA0Vk92mlTDiQ/ZYyvgo9wmOq
         a//jciypU6dNR1slTHDXzjLmeFvlc2gxIhREHm84UZb3yFuLZsV0kjQlM0QKAzv7wxWv
         G6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791146933; x=1791751733;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=64dx1BbNweAnxiSqrDwTCBobsnxCeoMwaSiq5ZXWTOc=;
        b=Qpk83qEFiYTn1yQkzjaoIw+3qrbM8ZEB2QoAaF+aokn6QkKBezUeAp0Imzzp6tZjbo
         jc7G9XoZsamfg0p9oVAUYdulII56CWVZ6lPHS9YxjsMZYp0QIGVJRU+eIkwTkJumgYp0
         pgKx3amBJGEOKa+gqsclia2mhPJGZcMMc1dU5d/bukS0aNE/qE1hSCCiQBl03qMJCtsa
         rEy2vWiSiL5G1U9BBXAIUMiK5vjHx94wdg6AgqNEWJd8OhsL+Rvaue4sadrSYYz0mCaR
         dT5JzJR4EB6HRw2hXTooo6FEac0vrNcdpBlKyzTSd0gm+2EDntkz7aaTj8rtXq1e9ZoW
         VS8w==
X-Forwarded-Encrypted: i=1; AKwUvByot3xRML8BQhqWty0xI79YIhz4kMUVPP9fm2myNs99ySHq+TYdW8Mgb5nisCU24n1VT0IffODipTLf4SDnFA==@lists.infradead.org
X-Gm-Message-State: AFuF++ku3U7PY1H+zkjelyc+NkmIvbMGTXwLD6UlSipgS4fu/obvdtXc
	0mlfcGllhN3vrq6ZecweeeRU9ll6p1YPDj44nvssZ4B25tt48VwCCPXW
X-Gm-Gg: AYBFou0a1HjpC2zrxnJPFtAqD/BQRzkKWVElA4L3ShHun5zfpQHtfVJCkDKuAnUTAY/
	B6FlroXdKrBe34WO/Ed10sgFPuJvrzwk0SrpVnFcw1aRvUvGlC2QL/DqDFwK5STS/TJNLyx6b8e
	cgUNuxC+kuhamPWOfMCmawWp7hLJFNiy/9LiaBxnDolEpb4qLROQ+HLwdD8wJ3sybweJNODJrzz
	l3z4A4jb4EJfUAB9ayYzGtE0HrY+V2EPIlxF3J5+I29UVtigmtfEF6oIidqmMcP/AIMv0UZ1FxD
	4FDgNy/1aKypVKMWPU2AXXohgdRwjx6ahm9jvcR4nZ3Cvkl4n9gw4uKo5gOHpcBE3acZJux+4WN
	Nsup9noE6DwNS618/6e5nkdtYn+t0fwTG8yeYQXTRqhIxbloiZ1+OfjGHTjtlkui6CF74K9i6Cj
	a5ftnf6UgYn0YoNkDJxWUhYrH8QgnfaoWxuLQQ2JhRLcpUyCs0kFihisvbdfORmhha1hTH/wIlf
	j/G
X-Received: by 2002:a05:6820:8cc:b0:6dd:5f11:2772 with SMTP id 006d021491bc7-6e09eb5bb95mr4694735eaf.67.1791146933277;
        Sun, 04 Oct 2026 13:48:53 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6df3bb8ed63sm7997183eaf.15.2026.10.04.13.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 13:48:52 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 04 Oct 2026 15:48:44 -0500
Subject: [PATCH RESEND] drm/mediatek: dsi: force command mode in
 mtk_dsi_poweron()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-v1-1-53a4f46ca489@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791146930; l=2760;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=OcJVs5yn0YnQaQ4cSxKF5bO4C3o583LMnGdciACqpJE=;
 b=1l4cNu6iSTNSIv+NG3qt0kh7o+fG3x0bWp03ylDgdgiAL0DWdqVdOTa9xSzUY40MnsckbQ/8g
 XtXLdSNzganBnvGGX4IVpkwFUR+rd0uh9jLeNxs4jVcDEwbAksd83xb
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_134855_336723_8145F8D9 
X-CRM114-Status: GOOD (  13.94  )
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
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


