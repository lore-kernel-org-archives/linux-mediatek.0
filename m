Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F09606A327
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 00:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a+4OsdY3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hvGHINAf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3NwSdSme6Q9C8WEEF82AMp4+lb92FDUaST62RhvwOWU=; b=a+4OsdY31AE3wSh5mRXnT4e/4f
	2fpTRdyv0RvHZUhznlkSLwMaf/X1KwH7CmpW2Rzt7VmHnEeTdxdvNvFTekQWza3EcU/elo+OP3pmC
	P7kOwrgK7S/CgeYYCyzhe5WVf3P9Sp/i24Oyy1wgSmpzJObgCZfFBj6B0LlMvzqvcdTiCvh3Pp+9Q
	3BZKhUDXaYlC7/2Mdgm7XZjul042NuGiMguJ5t04lay55xwmv5O9s9S5+xzpq2+fPqngDhp6VinUu
	ao5d9nXNW0YOS89XSON/KZf0JL4HP0hJs6SpREK+Ta+TJG771nZzRlQbt1UZpmD4Gl3Ys2/U0Yktj
	G6ihW7CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWN17-0000000BcdX-0h5h;
	Thu, 26 Nov 2026 00:07:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWN15-0000000BcdJ-3IH3;
	Thu, 26 Nov 2026 00:07:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 47AF941A30;
	Thu, 26 Nov 2026 00:07:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795651630;
	b=uXcsWqKiay3t0C5G40OcfBZ6XnZaFNUN9VrlpewWXdV/6i+MZ/8rfivTfRmWWhyl2uOt
	 PYPIraSiQaihBEW2GiOm3y/SeevmACrQ9StK9/SEJC01XVeP29x4lJs2JcoWkS70YDpHe
	 x/8Lh2o3bxgIA2Ww7xvfXQbMz5cUAT3WDRNfIW6R23BlortLAObRL2D+Iq39RAN/R34MY
	 DitXl3OAhWR8mF8RcrayVDp3T3RIJ4Jd2ktucManya04x9aWTZSAe8ezu4ywe2d/rID5z
	 SGpQoxmX3HG6Z3txWmhlQtOfDs/6Q42ZctWDoB6+2Wh76WFy4YW/MgaaP96HCRCoweQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795651630;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=3NwSdSme6Q9C8WEEF82AMp4+lb92FDUaST62RhvwOWU=;
	b=q6TybPd8MwEqlcDRbnPNl2ZX8xQTM1R3tPare4Ld+fK8Tdw4V32+BvkBGcz6IM6E/hfY
	 SDGY+ztOj4TUEiANrgkyiV4fmeZ4KWifmCmiyg2Ty3CWWxXTZu4cQXoJBdijgfbhgKUBi
	 khEOCyTjp54N2TRunRpq6iqY/gyb0qg+oPJvvmOwzjTubm4zidGnt2Tj3SrAJRWq2T7ze
	 l7t3dznZNEjGwGNXA/wq1L81rypB6hhm0PYJkplU8ut4HzauhkuvKAapLEyoueJacscbj
	 U1Yahy8uCYpkLpMIv2aFgedMXcl7Y7g7x1sW7o97gTHAti0CEKgGoSEWdRJ0KeKt0Sw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AA8E41F000C6;
	Thu, 26 Nov 2026 00:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795651630;
	bh=3NwSdSme6Q9C8WEEF82AMp4+lb92FDUaST62RhvwOWU=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=hvGHINAfU44W7RxZaEDcB3NhyGopdFa6Uumu7KoNR+zVvB/Zv+wRdFYKxj/wLZ+Zb
	 B2iMWV4FWF81Zx7Tyut1fEFdBjjYZHMdw8P7xB8LtApt8y/XNnG6ULFXBEtkv7k00u
	 YhdioL7S7apTHjouC8+3+heiASy+gXc0f6jpOraQLmuqp4Ko2ugXo8E3o0rQ1dsoNO
	 JS+NShmSqj3+0S6y/sRVhMz8qicchV154UDNldYAcHakh46zUFxIjiLOntEscVedYD
	 pX3+PrZw4+alVGT+Dw0fQZbimjHrdHI62qDaTkwbWeWxVaLQh0qh46u01fAFyInMjK
	 A0dxqabSMOZNw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3AE704D0D4;
	Thu, 26 Nov 2026 00:07:07 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: dmitry.torokhov@gmail.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Input: mtk-pmic-keys - fix TOP_RST_MISC layout on
 MT6357/MT6358
Date: Thu, 26 Nov 2026 00:07:06 +0000
Message-Id: <20261126000706.15649-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795651626; l=1940;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=k1ugJTSw2S1SmQnBcJkuN/0L5JelnI96Np8GylaWwEg=;
 b=7SVA7OjauVY4HUbsHh+BzYiDcDFH40ql4CQvLKg25dYuU3dLacPfs2TR2s3jU9z2rAT4wwHZ9
 wVpLJezUCU0BpDQF1BNYq+V5kZQ+YsrRA4l3ZUidEqFzxjhhqPkc7IJ
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: iasnezhkov@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The long-press reset setup of mtk-pmic-keys programs TOP_RST_MISC of
MT6357 and MT6358/MT6366 with the MT6397 bit layout. On these PMICs the
reset enable is bit 9, the home key mode bit 8 and the time bits 13:12,
while bits 0, 1 and 5 hold the PMIC watchdog reset setup done by the
boot firmware. MT6357 additionally passes the array index
MTK_PMIC_HOMEKEY_INDEX as its home key mask.

Patch 1 fixes MT6358 (also used by MT6366), with a register read from an
MT6366 board as evidence. Patch 2 fixes MT6357 from public sources only.

Sources (all public):
 - coreboot: src/soc/mediatek/mt8183/mt6358.c, src/soc/mediatek/mt8186/mt6366.c
   and src/soc/mediatek/common/mt6359p.c, pmic_wdt_set()
 - MediaTek LK2 as published by Gigaset (github.com/Gigaset-dev/lk2):
   platform/mediatek/common/pmic/mt6358/mt6358_psc.c
 - MediaTek's downstream drivers/input/keyboard/mtk-pmic-keys.c as
   published in vendor GPL releases (e.g. OnePlusOSS
   android_kernel_oneplus_mt6789, MotorolaMobilityLLC
   kernel-kernel_device_modules-6.6)

Not addressed here: MT6359. MediaTek's downstream driver uses the same
layout for it, but MediaTek's MT6359P header and coreboot place
TOP_RST_MISC at 0x14a with 0x14c being its _SET alias, while
include/linux/mfd/mt6359/registers.h has 0x14c. Someone with MT6359
hardware should check mt6359_regs separately.

Found and drafted with an AI coding assistant by comparing the driver
against the sources above. Not compile-tested in this form
(both patches only change constants); not run on MT6357 or MT6358
hardware with the mainline driver.

Ilia Snezhkov (2):
  Input: mtk-pmic-keys - fix MT6358 long-press reset bits
  Input: mtk-pmic-keys - fix MT6357 long-press reset bits

 drivers/input/keyboard/mtk-pmic-keys.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

base-commit: 2800868f63227c8237d70c41e70d441c919620d6
-- 
2.54.0 (Apple Git-157)




