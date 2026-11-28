Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10D9606A31C
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2026 01:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x8Ft3e7i;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TwBJoXSP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=aguOstNiNosKFJOAXsnYWl5uoiVa6iE06IgtXJTe9mM=; b=x8Ft3e7iAoETFg5oG11W6Ahovf
	m3ZYjUzmiPxW2q0U493C6uzkI9BiWViUtTn3uaXuS5pgKKitHg0IijULbjeCkOwOQX2MCVSV3yFpV
	Kl7yIrOrDW4+xtDHuMyip/STnquuh9GuXTbV3tdhKtUN+vX2RIIlXk4JgrCXHtH8t+dxP7X5bQYie
	EV+0sLqCc6Q5qpiQgcRJyujOQcut3TIc/Ra8Oaco4uZ02VSn9TKLwguc2k5el1TXCLr9UkYI4ggns
	j0hFtGQdBz/HiVLjZJWbwZsMYughuF5SpmVeOrjeMsZf4LTdSBwRaCs3pyFQuyOeMJYHLOrGX/xuV
	/MknMENA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX6tx-00000000FdS-0jYK;
	Sat, 28 Nov 2026 01:06:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX6tt-00000000Fd8-2CEV;
	Sat, 28 Nov 2026 01:06:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E388D45523;
	Sat, 28 Nov 2026 01:06:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795828008;
	b=f8H+e5SwiP/eYqn4INZZxKhO8+rzxGfrKQpWFr7iihQRWry6vTV+82CL7X74XUZFromn
	 zgtzsyT4Pjkh5yUg/SkKtHs/sXPUjV0VGUq/gDlKtYUu8fvhX51XXMe4qGU2AqWZjd7Jt
	 jpfX1WoGeQyOyN5L0dbZRJtcMN8DmKqga+oGQgV2da0retpsCCqc605wwfZ1E9YqohDeL
	 lEghVan5YTAbqZjXtvOmwCfRhrBK2FKyKFImOJ1TDyMNhlXNvdHYWVdfb8gfI8U8RVaot
	 f5FGmNAYgfeYr12J+cg94bYX0y9M5GIz++UAzs5rxHSSftE7yegB3BBoJyYlqtP3epw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795828008;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=aguOstNiNosKFJOAXsnYWl5uoiVa6iE06IgtXJTe9mM=;
	b=S3LBMYzHoAYm88k7XCJ8AG4m0TDyQ15ymFClcV2L7I3aOV9KFxEJDnCYi782DKbaP8Wg
	 gR+Mj7ZiENZz6VG86UEoxYmMa+LTffqzvYaBSvsYb4aGqp6OQ7yjBx9nfLf0LSiC2No08
	 FnuDcwPiKBL/RHeiHECHaL3GV0c+p64Uz+vr0LFsYhcEf5deNDNP1nDuUPaVNH+psfTAp
	 C4+q75/Jia/S7iu+GRzE2gZgBYtQJOm3WVfVt5neZpb2ZQvfE2GwxDxJXjwY0PaJIjU0h
	 JFQHAIY/zTrIVQ40c/V0ssM8XYSDHwxv0+5s03FnlG/9InuDuVQTJRVoybbzZ/HYZNw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 56BCD1F000C1;
	Sat, 28 Nov 2026 01:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795828008;
	bh=aguOstNiNosKFJOAXsnYWl5uoiVa6iE06IgtXJTe9mM=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=TwBJoXSPZB4npE8z1hJ/eEqSP/fckt7RkTpEF0Av8fRAHqWkIjCDwGtEfZftwSbuE
	 cRUL9AaeHaUQK9ZUg+OcHL4mIbt0AkIuHi1aVFOIOIMLWr/4gZC8XyxhQjTcWLgTjM
	 Wz1qA7Av9FpH+2TxCEUmfCKCHlI5X/ohS+OlUp410ESr/dHnWm3tjzjkFsuujoAMlS
	 ecpIx/BFYXxlXQmjIju5d+KxI92JSwVx6VruO0TkVrvD6PC2U1qvQTwYwFNoV5iGU3
	 xhVdjR17BCW4EYV/u2thtmrcNzNMgg4Awm34meyxqdPGcZ9h4ZErJ6YGSNPaMDkfFe
	 7hprf3hx+w24Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D96044DED5;
	Sat, 28 Nov 2026 01:06:47 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Sat, 28 Nov 2026 03:06:46 +0200
Subject: [PATCH] ASoC: rk817: Do not free the regmap of the parent PMIC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261128-rk817-keep-parent-regmap-v1-1-de515c2899ed@iav.lv>
X-B4-Tracking: v=1; b=H4sIACUpCmsC/x3MQQqDMBBG4avIrB1oorXRq4iLaH/tIMYwKUUQ7
 27o8lu8d1KCChJ1xUmKnyTZQ4YpC5o+PixgeWeTfdjGGOtYV2devAKRo1eELyuWzUeunrV3YzO
 1s2sp51Exy/Ff98N13VMNwg9qAAAA
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Chris Morgan <macromorgan@hotmail.com>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-sound@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1879; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=VRMDAVdATty+o32CLZkZxbTwRbwASeEGt2T/3vL6z4Y=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDNlcmmq6V7Y55yq95pH6bOB2/VrVltPnfaJua2g0RRyyE
 D6121Gho5SFQYyLQVZMkWXCIY1bGUuu/vX3MH8AM4eVCWQIAxenAEwkIp2R4dIPw4sGhl26lcrR
 32RUZiZcjEratrHA33P2tYfBf8Q4VjEyPPl6Us76z0XbCZVexY9jhAs/tPUek+ezWvE6qvmp05+
 jDAA=
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Igor Velkov <iav@iav.lv>

The codec uses the regmap of its RK817/RK809 PMIC parent, which the
PMIC core, RTC and regulator drivers use too. rk817_remove() calls
snd_soc_component_exit_regmap(), so removing the component, on a card
unbind or a failed bind, runs regmap_exit() on that shared regmap. The
other users are left with a freed regmap, and devm runs regmap_exit()
on it again when the PMIC goes away.

Clear the pointer instead, as commit 6d66c5ccf5cb ("ASoC: mediatek:
mt6359: Fix unexpected error in bind/unbind flow") does for mt6359.

On an ODROID-M1 (RK3568, RK809) the PMIC regmap (3-0020) disappears
from debugfs after unbinding the card, and a later hybrid sleep oopsed
in regmap_update_bits_base() called from rk808_rtc_readtime(). With
this change the regmap stays, the RTC reads and binding the card again
works.

Fixes: 0d6a04da9b25 ("ASoC: Add Rockchip rk817 audio CODEC support")
Signed-off-by: Igor Velkov <iav@iav.lv>
---
mt6660 has a similar issue: mt6660_component_remove() calls
snd_soc_component_exit_regmap() on a regmap created with
devm_regmap_init(). Not tested, I have no such hardware.
---
 sound/soc/codecs/rk817_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rk817_codec.c b/sound/soc/codecs/rk817_codec.c
index 2c0fe1dfd842..c7804b2b559c 100644
--- a/sound/soc/codecs/rk817_codec.c
+++ b/sound/soc/codecs/rk817_codec.c
@@ -434,7 +434,7 @@ static int rk817_probe(struct snd_soc_component *component)
 
 static void rk817_remove(struct snd_soc_component *component)
 {
-	snd_soc_component_exit_regmap(component);
+	component->regmap = NULL;
 }
 
 static const struct snd_soc_component_driver soc_codec_dev_rk817 = {

---
base-commit: a6c7e545d8abac8ad0b48da4c8b4ca5ef8ea8eda
change-id: 20261128-rk817-keep-parent-regmap-354a8b6c9f89

Best regards,
-- 
Igor Velkov <iav@iav.lv>



