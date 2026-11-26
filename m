Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519A9606A6A9
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 00:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uDzrs0Bu;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kjOZ6qCc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=e3GFvodZKb6NEBDMDdPL8w7ibtYBo+PSh4w+1SwCVaQ=; b=uDzrs0BuLfIV7zsFYaZofHEboL
	TgdYKL0wRpgDNG0vktznLZKD7n5zw6FipXkE4Ihh5b6cvY0RVvDaXWOTxI9MTOp1gExO3BBovgmQd
	IjQyM2211tPr6oBKYs1MKMCDx0DJT0DXCg2IelsHq7OzRhwKldtHH4aLeDkiVgIgsI75nGvP7rZCE
	mETz89s39jYpd+wn2s7V/B3Iew5ES+VMKkrTxIz4fGANRrKkiuWeqoxlqDydtWr3vEiFyQZJQEw/7
	T2upTXxda40XyiWCauPc2lO00P8fXHbRMehxcxttH6dqHVnBAWbOLDFhHAFMl8VhXLoWdmxuqsjoB
	smD8SzZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNkF-0000000BiSQ-02dD;
	Thu, 26 Nov 2026 00:53:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNjz-0000000BiHN-2FRw;
	Thu, 26 Nov 2026 00:53:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E3A16625A6;
	Thu, 26 Nov 2026 00:53:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795654414;
	b=Vre5Ww9NCVttci1Tuc8POI0yXmp2DdKqXIbEsqWjf5cex/tCqCJwEV2vPwW8OL9Ngk9A
	 hadgcKWGCnm9iK2/seZfpeaVz7oA8puTxQRKit0HQTGP9e++Bjl2hmGRoYigi8wleMn1h
	 WXWqaV9dfmvJQSMUpylc1jLrmvX1XCWH/WO3E9nVs0cDQsN2Q2ZuK8r7jkYjF+aFeThg9
	 +WhgE/YBmARX7ZBSwcTRDuuvF/d3ZogdyCR+zUPR/N3Glq+rBXGTIugQ7jv0ngkrDPCLd
	 yFWbXV+ABCLrUPeBADPIr4c825D6M2iBqPe5LxFzKd0eGVCVAFFFyFzooWLUxMrc3Hw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795654414;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=e3GFvodZKb6NEBDMDdPL8w7ibtYBo+PSh4w+1SwCVaQ=;
	b=TtriifcolMv3VUlWWR5dNVXEygZiEEQYz4hgRTN+wKHX0asY2MTMnBPJkSiSpJ+GMyx7
	 q2HpCh62t4DG7gCaAt2EjTBDnmOPjisfmzsVlt2FHDH5XmKrzPPgi0r5OU11Flo0mMdqc
	 L6FECeCO8Rc6xh+7Fr4qkpLV/AWjNKJT0EiLF8FiDg1RWaWZVrYf1uho/HA8wmy41gvkT
	 MRrz5z0hDKNG/0bmZmeh6uyXGKdwPj8BRxqFH/QL88lW9Jiq4C606B77P199WSvznaT+c
	 e6qk8Skwp4FqqLJhV7OjKcGPWUYHxMUJJKtDBSWCgeTNUaB7GQEpn/nIxpyULUkKvKA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A16A21F000CA;
	Thu, 26 Nov 2026 00:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795654414;
	bh=e3GFvodZKb6NEBDMDdPL8w7ibtYBo+PSh4w+1SwCVaQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=kjOZ6qCc2fXWK0ACNZ9th5rhHTqmYpMU0Z8OWNixfPi/lrtFGosQDBX0jNNs0kw+H
	 c0F6mjLS3xa6zfcjLHkj+wNIdv8z70VedokJkel2k+y1uLWO81j0hjgXiejd5bAa3F
	 M/uNnfdNugmwHKJLkrX762ab6U6Hv1hDPKfR0MBtaMKYfdfpKeMsmBrpL5DGzb+zEE
	 i683avrpkgGLvYsjT68J3UsMt0CIFgKe9Tl/aAVpyR2/1eCmvBIE9fmOSn9TbyDHq2
	 syQ3erITGiFQUtEF73Xr0Y4JwXZ/sBW+xWnzJYESxp1eolJht+FhGBw5nLRqrFlU8z
	 3PE2e5x4ZIjeA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 292D84D138;
	Thu, 26 Nov 2026 00:53:23 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: daniel.lezcano@linaro.org, rafael@kernel.org, rui.zhang@intel.com, 
 lukasz.luba@arm.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] thermal/drivers/mediatek/lvts_thermal: avoid 32-bit
 overflow in lvts_temp_to_raw_mt7988() and INT_MAX trips
Date: Thu, 26 Nov 2026 00:53:23 +0000
Message-Id: <20261126005321.71799-3-iasnezhkov@gmail.com>
In-Reply-To: <20261126005321.71799-1-iasnezhkov@gmail.com>
References: <20261126005321.71799-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795654401; l=3303;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=psSr6KJdwfmb1wfsBNafw8vECeQMBdTkcT5VL1q598A=;
 b=AYmY1cNYhCNMV/zdOV2u3nU5P6SKNRf55XL2K3+T/JDXQRWC0haRg/IFRwRaNwZVRRyD59tf/
 F0l9FwfIjHABLyOW8s1+3hnNHD8yHAPRJd+fXU4gXm55p8Spys1p6dT
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
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
Reply-To: iasnezhkov@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ilia Snezhkov <iasnezhkov@gmail.com>

lvts_temp_to_raw_mt7988() subtracts two 32-bit ints before casting to
s64, shifts left by 14 bits, and immediately truncates the result to a
u32 before passing it to div_s64().

When golden_temp_offset - temperature >= 262144 (for example,
golden_temp = 60, temp_offset = 250460, temperature < 18316 mC, or even
LVTS_MINIMUM_THRESHOLD = 20000 mC when golden_temp >= 64), the shifted
value exceeds U32_MAX and silently wraps modulo 2^32, programming a
bogus low raw value (high temperature) into LVTS_OFFSETL/LVTS_OFFSETH.

In addition, lvts_set_trips() passes high == INT_MAX (used by the
thermal core when no upper trip exists) directly to lvts_temp_to_raw(),
which produces a negative quotient cast to u32 while leaving the sensor's
high-offset interrupt enabled.

Promote golden_temp_offset to s64 before subtracting, keep the shifted
numerator in s64, clamp negative results to 0, avoid converting
high == INT_MAX in lvts_set_trips(), and mask high_offset_inten when
high_thresh == INT_MAX.

Found and drafted with an AI coding assistant.

Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
Fixes: 2bba1acf7a4c ("thermal/drivers/mediatek/lvts_thermal: Manage threshold between sensors")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index e034c6c..9b8b653 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -322,11 +322,11 @@ static int lvts_raw_to_temp_mt7988(u32 raw_temp, int temp_factor)
 
 static u32 lvts_temp_to_raw_mt7988(int temperature, int temp_factor)
 {
-	u32 raw_temp = ((s64)(golden_temp_offset - temperature)) << 14;
+	s64 raw_temp = ((s64)golden_temp_offset - temperature) << 14;
 
 	raw_temp = div_s64(raw_temp, -temp_factor);
 
-	return raw_temp;
+	return raw_temp < 0 ? 0 : (u32)raw_temp;
 }
 
 static u32 lvts_temp_to_raw_mt8196(int temperature, int temp_factor)
@@ -409,12 +409,15 @@ static void lvts_update_irq_mask(struct lvts_ctrl *lvts_ctrl)
 			 * don't actually want to generate interrupts when
 			 * crossing it.
 			 */
-			if (lvts_ctrl->low_thresh == -INT_MAX) {
+			if (lvts_ctrl->low_thresh == -INT_MAX)
 				value &= ~low_offset_inten_masks[i];
+			else
+				value |= low_offset_inten_masks[i];
+
+			if (lvts_ctrl->high_thresh == INT_MAX)
+				value &= ~high_offset_inten_masks[i];
+			else
 				value |= high_offset_inten_masks[i];
-			} else {
-				value |= low_offset_inten_masks[i] | high_offset_inten_masks[i];
-			}
 		} else {
 			value &= ~(low_offset_inten_masks[i] | high_offset_inten_masks[i]);
 		}
@@ -447,7 +450,7 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
 	void __iomem *base = lvts_sensor->base;
 	u32 raw_low = lvts_temp_to_raw(low != -INT_MAX ? low : LVTS_MINIMUM_THRESHOLD,
 				       lvts_data);
-	u32 raw_high = lvts_temp_to_raw(high, lvts_data);
+	u32 raw_high = high != INT_MAX ? lvts_temp_to_raw(high, lvts_data) : 0;
 	bool should_update_thresh;
 
 	lvts_sensor->low_thresh = low;
-- 
2.54.0 (Apple Git-157)




