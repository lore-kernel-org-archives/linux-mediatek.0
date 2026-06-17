Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD217CD98F3
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 02:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nliXYvoRQ3wSjHuqpNr9lxWmoUaal/xuLZ8F2phbi/s=; b=XyQ5AfsDWGjtyXKxUxtsjHlVTW
	TvdNCYp3uEPFzYAGzV0+i30FzO0uCo5d4SdGCqc62Hna8WHZcIDH56QY4TqeyUSqe8vv3cYkVLf3P
	yaa8QIGUKp5dBY/HdO5MTwljsY4sfiIcpf2e5oSvbCc2Nx0JSogtFaZqteUVI46zJml8jRp71rsJ/
	v6hb9YVVJfiBn/mbJQTsQyDShUtkSYUBQ33NNmdACjKIDGmkmZT87evttA2238/DX2L2JiaqEykTQ
	rfYwSAFILMB5ypoat90S1EKp9141IWQN2oIqnhkGNTaKmInCv5Llwq27JkJyiSCgTvEGI9/TxcRiN
	xF05XSvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZfsX-0000000GUW3-3vMk;
	Wed, 17 Jun 2026 02:19:45 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZfsV-0000000GUOf-0YGk
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 02:19:44 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-9157d3f2098so615239285a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 19:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781662782; x=1782267582; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nliXYvoRQ3wSjHuqpNr9lxWmoUaal/xuLZ8F2phbi/s=;
        b=sHQghSXxdbeT9q9PeNLuut6uwUkWuuPTf3LmqZl5ndnN2z7Te8Li59siDBu45JWhc+
         H81zRMuFc9AqANA4KQnYKjFnmRIo7Kwu/xhbdz/yGO692dO/ZX8NjyTnjZDoe3Kr0Ehz
         ZRKMRjFIWtI8ZIWpqhMS+ySdyiHdc1L7RxyGLjn0AGvjfiWhTPGOBVWLruEMUwM9eNw1
         OAcalc2C/PSR+yCguGW1AKSkxIvPghyjdbk/bfCwYZhUDXd3prCgxGmVVA1Cdiu7XBcj
         ky714okGpZ/tJJ76ujQW92nI2WMHsFVMZlAdLDWc2eOiwJCo0Qb8/xv63nB+6BS1/YOb
         rtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781662782; x=1782267582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nliXYvoRQ3wSjHuqpNr9lxWmoUaal/xuLZ8F2phbi/s=;
        b=Qp+697cOe6/dsXvjwIx9zyJ+DOLP0tlEB8WsnfaE6ZDUvZinQ/4wcAUYX9fZIT3uFl
         FNrfDIFLKL6A7aP2VhHT7p2h3C3kM4hU1HJBh/yZ3xSzcZgLBa7rL1qrHtc5V43E9F7r
         x0TtEBSY5pOsNXQIKMWWuwVZkJgg/hgyth6I3dQoRbQxSav2wmCHId7zF2Eww77ccmHm
         IlrhCMsZ3iDB7tyKj7ZIPYXyuFxuJN9peaB4EvGKTl5qeetza5zR0Q4m1dBTSV5aijo5
         waMbdMKDDUDQlJfM8T3fkoVR2wmxAhEpQQSM7yiyZDNAUFyuaLz6ndeVZQn9kY9sKqcv
         QJqQ==
X-Forwarded-Encrypted: i=1; AFNElJ84A9z4Ng36Fmzx6e2gNr3kqZsMAhgopnEbeg/5I0LJdMwD3ruElXwIOJyQU6u7+hGhVtAOiQmHNbT6mrSbVA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5J1c0G+XqqKrvRzAdae5USlkmFycmBqdgGS8CX7tsjlwnA8oF
	SD2SsgOONTn7UrS2+pULdpcS1Bohn0nJ9r4ZvTpIOviC1S1g7ApuTG0V
X-Gm-Gg: Acq92OHCIf+FwgIASAAWAs4IoW5nuQ4/5HkN/JgRHDhh2i9u0OZ9Frp+gSiTwi/RaQb
	UWCAPmqNujhxzLrGlaYyo/TGs82mpaoJ0tC/a2oyL+3NmaFa4Q/qAdpjP4ril5JR8d1eRacM6DZ
	JDPL0mghL87GVQGFLHXGYZ4Wd7EqZaLK5XU8p7jlpBaXpK0LGPjGhUgBygeW8mTHHaXIFmGLCA9
	6CH841c+tLyysn6NTJjk1bVBu3RXAJVZjo1jyO7oCoNTZCzSCzLrdkOOZadmsUOVRQ7Gpj/qT5O
	giJlt9Qm2tvrnFAX8NL2fKAjaGfCfzrSpkJ2+az9LA54op55NpqkUBgyl+PtfniTwJnHwKSbuUc
	BIwJw1lih3jCjSZflfoJ/TWCzwc/sCbl8T8GqpX6l17EIT4cHrQhd82FsKcfNMbazdQNlcSYsX0
	GB+ONVkpgwZsFQ6yGHk9TC4GGuQQcjrMLvr5Pu0r/DXQs92JSSa03huLacNCDlLh2VKLmpU4EeX
	Ywu4SC9ZL04YRyogQWBeV4EBpWF6irwhGmEtWejvKM=
X-Received: by 2002:a05:620a:258d:b0:915:8f76:8029 with SMTP id af79cd13be357-91dbc52d1b4mr268487985a.44.1781662782028;
        Tue, 16 Jun 2026 19:19:42 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006e35sm1657646285a.28.2026.06.16.19.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:19:41 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Heiko Stuebner <heiko@sntech.de>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 9/9] media: v4l2-ctrls: add KUnit tests for compound control tile validation
Date: Tue, 16 Jun 2026 22:19:06 -0400
Message-ID: <20260617021906.2746743-10-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617021906.2746743-1-michael.bommarito@gmail.com>
References: <20260617021906.2746743-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_191943_231029_2BEC0616 
X-CRM114-Status: GOOD (  18.78  )
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

Add KUnit coverage for the HEVC and AV1 tile-count checks in
std_validate_compound(): in-range counts pass, out-of-range per-dimension
counts and an AV1 grid whose product exceeds V4L2_AV1_MAX_TILE_COUNT are
rejected, and the zero-initialised AV1 frame control that userspace
submits still passes.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/media/v4l2-core/Kconfig               |  12 ++
 .../media/v4l2-core/v4l2-ctrls-core-test.c    | 145 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |   4 +
 3 files changed, 161 insertions(+)
 create mode 100644 drivers/media/v4l2-core/v4l2-ctrls-core-test.c

diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
index d50ccac9733cc..52c00dfe9322f 100644
--- a/drivers/media/v4l2-core/Kconfig
+++ b/drivers/media/v4l2-core/Kconfig
@@ -3,6 +3,18 @@
 # Generic video config states
 #
 
+config V4L2_CTRLS_KUNIT_TEST
+	bool "KUnit tests for V4L2 compound control validation" if !KUNIT_ALL_TESTS
+	depends on VIDEO_DEV && KUNIT=y
+	default KUNIT_ALL_TESTS
+	help
+	  This builds KUnit tests for the stateless-codec compound control
+	  validation in std_validate_compound(). They check that out-of-range
+	  HEVC and AV1 tile counts are rejected before the stateless decoders
+	  consume them as loop bounds and array indices.
+
+	  If unsure, say N.
+
 config VIDEO_V4L2_I2C
 	bool
 	depends on I2C && VIDEO_DEV
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core-test.c b/drivers/media/v4l2-core/v4l2-ctrls-core-test.c
new file mode 100644
index 0000000000000..c0141f3defa82
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core-test.c
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * KUnit tests for HEVC/AV1 tile-count validation in std_validate_compound().
+ * #included at the end of v4l2-ctrls-core.c to reach the static helper.
+ */
+
+#include <kunit/test.h>
+
+static int call_validate_compound(enum v4l2_ctrl_type type, void *payload,
+				  u32 elem_size)
+{
+	struct v4l2_ctrl ctrl = {
+		.type = type,
+		.elem_size = elem_size,
+	};
+	union v4l2_ctrl_ptr ptr = { .p = payload };
+
+	return std_validate_compound(&ctrl, 0, ptr);
+}
+
+/* HEVC PPS: num_tile_columns_minus1 / num_tile_rows_minus1 bounds. */
+static void v4l2_ctrls_hevc_pps_tile_cols(struct kunit *test)
+{
+	struct v4l2_ctrl_hevc_pps *pps;
+
+	pps = kunit_kzalloc(test, sizeof(*pps), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, pps);
+
+	pps->flags = V4L2_HEVC_PPS_FLAG_TILES_ENABLED;
+
+	/* In range: count == array capacity (minus1 == capacity - 1). */
+	pps->num_tile_columns_minus1 = ARRAY_SIZE(pps->column_width_minus1) - 1;
+	pps->num_tile_rows_minus1 = ARRAY_SIZE(pps->row_height_minus1) - 1;
+	KUNIT_EXPECT_EQ(test,
+			call_validate_compound(V4L2_CTRL_TYPE_HEVC_PPS, pps,
+					       sizeof(*pps)),
+			0);
+
+	/* Out of range: one past the column array. */
+	pps->num_tile_columns_minus1 = ARRAY_SIZE(pps->column_width_minus1);
+	pps->num_tile_rows_minus1 = 0;
+	KUNIT_EXPECT_EQ(test,
+			call_validate_compound(V4L2_CTRL_TYPE_HEVC_PPS, pps,
+					       sizeof(*pps)),
+			-EINVAL);
+
+	/* Out of range: maximal attacker value. */
+	pps->num_tile_columns_minus1 = 0xff;
+	pps->num_tile_rows_minus1 = 0xff;
+	KUNIT_EXPECT_EQ(test,
+			call_validate_compound(V4L2_CTRL_TYPE_HEVC_PPS, pps,
+					       sizeof(*pps)),
+			-EINVAL);
+}
+
+/* AV1 frame: tile_cols / tile_rows upper bounds. */
+static void v4l2_ctrls_av1_frame_tile(struct kunit *test)
+{
+	struct v4l2_ctrl_av1_frame *f;
+
+	f = kunit_kzalloc(test, sizeof(*f), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, f);
+
+	/*
+	 * Benign control: a zero-initialised frame (tile_cols == 0) must
+	 * still pass. Userspace and v4l2-compliance set the zeroed default,
+	 * and the divisor that a zero tile_cols would feed is guarded in the
+	 * consuming driver rather than rejected here.
+	 */
+	KUNIT_EXPECT_EQ(test,
+			call_validate_compound(V4L2_CTRL_TYPE_AV1_FRAME, f,
+					       sizeof(*f)),
+			0);
+
+	/* In range: a 1x1 tiling. */
+	f->tile_info.tile_cols = 1;
+	f->tile_info.tile_rows = 1;
+	KUNIT_EXPECT_EQ(test,
+			call_validate_compound(V4L2_CTRL_TYPE_AV1_FRAME, f,
+					       sizeof(*f)),
+			0);
+
+	/*
+	 * In range: total tiles == V4L2_AV1_MAX_TILE_COUNT with each
+	 * dimension at or below its per-dimension maximum (64 * 8 == 512).
+	 */
+	f->tile_info.tile_cols = V4L2_AV1_MAX_TILE_COLS;
+	f->tile_info.tile_rows = V4L2_AV1_MAX_TILE_COUNT / V4L2_AV1_MAX_TILE_COLS;
+	KUNIT_EXPECT_EQ(test,
+			call_validate_compound(V4L2_CTRL_TYPE_AV1_FRAME, f,
+					       sizeof(*f)),
+			0);
+
+	/*
+	 * Out of range: each dimension is legal on its own but the product
+	 * exceeds V4L2_AV1_MAX_TILE_COUNT (64 * 64 == 4096 > 512), which would
+	 * overflow the per-tile descriptor buffers.
+	 */
+	f->tile_info.tile_cols = V4L2_AV1_MAX_TILE_COLS;
+	f->tile_info.tile_rows = V4L2_AV1_MAX_TILE_ROWS;
+	KUNIT_EXPECT_EQ(test,
+			call_validate_compound(V4L2_CTRL_TYPE_AV1_FRAME, f,
+					       sizeof(*f)),
+			-EINVAL);
+
+	/* Out of range: tile_cols past the array. */
+	f->tile_info.tile_cols = V4L2_AV1_MAX_TILE_COLS + 1;
+	f->tile_info.tile_rows = 1;
+	KUNIT_EXPECT_EQ(test,
+			call_validate_compound(V4L2_CTRL_TYPE_AV1_FRAME, f,
+					       sizeof(*f)),
+			-EINVAL);
+
+	/* Out of range: maximal attacker value. */
+	f->tile_info.tile_cols = 0xff;
+	f->tile_info.tile_rows = 0xff;
+	KUNIT_EXPECT_EQ(test,
+			call_validate_compound(V4L2_CTRL_TYPE_AV1_FRAME, f,
+					       sizeof(*f)),
+			-EINVAL);
+
+	/* Out of range: tile_rows past the array. */
+	f->tile_info.tile_cols = 1;
+	f->tile_info.tile_rows = V4L2_AV1_MAX_TILE_ROWS + 1;
+	KUNIT_EXPECT_EQ(test,
+			call_validate_compound(V4L2_CTRL_TYPE_AV1_FRAME, f,
+					       sizeof(*f)),
+			-EINVAL);
+}
+
+static struct kunit_case v4l2_ctrls_test_cases[] = {
+	KUNIT_CASE(v4l2_ctrls_hevc_pps_tile_cols),
+	KUNIT_CASE(v4l2_ctrls_av1_frame_tile),
+	{}
+};
+
+static struct kunit_suite v4l2_ctrls_test_suite = {
+	.name = "v4l2-ctrls-compound",
+	.test_cases = v4l2_ctrls_test_cases,
+};
+
+kunit_test_suite(v4l2_ctrls_test_suite);
+
+MODULE_DESCRIPTION("KUnit tests for V4L2 stateless-codec compound control validation");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index fb20ad13dfec7..1409b06eee0a8 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -2860,3 +2860,7 @@ int v4l2_ctrl_new_fwnode_properties(struct v4l2_ctrl_handler *hdl,
 	return hdl->error;
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_fwnode_properties);
+
+#if IS_ENABLED(CONFIG_V4L2_CTRLS_KUNIT_TEST)
+#include "v4l2-ctrls-core-test.c"
+#endif
-- 
2.53.0


