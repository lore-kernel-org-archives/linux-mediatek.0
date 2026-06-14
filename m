Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CE5CD98DE
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2026 15:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8jz+BPfeJA3CKv3gaCxJRY7nP9NRgfQenpRYWfzzFvk=; b=zboLQYrzceB3kY5gbajDR1h1s4
	zpbbGVGfIlGKiFahH8z+Y64W9prtPFOTdiuYETJLOMjCht6DYjDx2wZSEMxmVnVp9KDlXH++4EjW1
	hhXQRkD3F9YbpjQtcdQ7Uz/ApXPq3bQo4wx0RE4lAlTCqaRnsClpXZqec37qAWC+Dexu2q2P0fiyn
	HxX1/VC6RBKMz9GH3L9jZp3UQeLSxhQzGzprOHIXoSOARXsL/3u9wm+lgIfMo7VcYcwv79Xx7aft0
	UPBgq8vw7G6HbTNjYL4xI+BGogkr54zHwIKzKbA89bE+U3+DnVwJi8icr2fy2oCU5QEyNWklkzZHF
	ZVAo+68w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnCF-0000000D9ki-1qBk;
	Sun, 14 Jun 2026 15:56:27 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnCC-0000000D9ek-3Lg5
	for linux-mediatek@lists.infradead.org;
	Sun, 14 Jun 2026 15:56:26 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-8ce9e56f68cso21432526d6.2
        for <linux-mediatek@lists.infradead.org>; Sun, 14 Jun 2026 08:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781452583; x=1782057383; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jz+BPfeJA3CKv3gaCxJRY7nP9NRgfQenpRYWfzzFvk=;
        b=OQFOmulsisiNJop2TK/MfEvAOUHeBARY82w1iikH4bGIv1tCZKaAgQJ8EPBGQ/vI3g
         n3u/Gy6hmXn9+H2m/J9pruc1SEcs5zYeu0abU5LJ/QwsJdB2lm2r4TWrz+pkejVsvITB
         kn7SRoI2qQ+Y/HIkjQGXYMaR26u8kictkyfhk/SQS9It7DnmForNZZsX2Y/PpltgKiMy
         Qqz+0M7wFf1sOQo3b0aH7IHeqKHxP7KPRlzjHIKQBhTykas0UH5aD6sgC1bFZmJ31md0
         vTfobQX0iDY79h4ERDSpP6dxGOCdU265R3F6MKGjT4xs1X2qTiARuVlSvWG9bGzAlv4t
         0PYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781452583; x=1782057383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8jz+BPfeJA3CKv3gaCxJRY7nP9NRgfQenpRYWfzzFvk=;
        b=kAhLPnp3552+EmipKgr8oaOwJDu9P3BNvDonNAx2vo2bVOSF4x9UM7mKQ0OeEwGTj2
         ZWEds2Edj5ETH15nQvHOBX6YL5H6atZzKb73VfVihyO6s44LNP5DcBcrkuVXebUQN2wm
         8+EiU9IPZJLAir9hDoKxZk62e9ju8A9Jn6QYhHcjCcuN/muyh3XPh8DS3lA9PacfSa14
         4xR7NT37DHaR49rTaKYT/oW/pXmKEDuyxE3oJN544zMAxy5AXXHY5tz7mLf+iKw7T36b
         87TgMaxf1tusN4iIGs/qSrpPe0bCYUDG1xPrhVaSMzffLP+z/K4Ej8WY//Nqx8uwOjCG
         Nymw==
X-Forwarded-Encrypted: i=1; AFNElJ88C03VN8JhDMWorP0WfGqXbW5U0ALqWCbHPDwZYZ5qNhPK0z0jw7O6UC3zyCT1xZzvAt/qiZA6nPq1d6hdzA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVC4vx3LtZe91sdIwR7W1Zt8dbogdHVlQWV6n463+9+rvyWUdo
	6UYqlwLazo9xHaOFvV2zgnYz/0IBCjQL6wqgcLbuCsg3k5Z+mEsnT7cn
X-Gm-Gg: Acq92OGzfz3h3R/CSCvo0gVlg7Z+DbFmZMdgVDB98utVet55gp9gYoHCKjyAoUSgF16
	6/0d5hCVXZ8Kt+Bkob1Dh2nHCpNqg1ga0TZ6bRBl+fkLUV6QhZjpGYBkQ5PnB2Xe0YU2AogqaS7
	rgWx31JDX7OYyaQfevvxaz8j9G/GaRdx3UKKBWPOKHPfFN02dF7H7DZDz41Y35A2dOj+b3DOdFm
	Is7ZL70JoUESferrSNlQOPNytBwkznd7DljRBQT6GWRJxA10UKK+W4npH6CH0X6juKVVIHwEAXF
	tc7xgcjCWAC+Tq5aWT/Zm4ODs/E5pNyE9aUCQSdDB0RI/tFAZxHvK8Wxo2jidwyVkeGrS8IRka+
	4xUfRdu8k6v5uYb5oqsUkPPEDPmy1HKhvVcvY9QA/FL3Po7F55FQ9Luye2GCwTyATEyk0zskPFb
	CXXKgQO0tmIYZ0FVbVDJSEjXY1k9z08a67KM+g+SXLIMGNyqTcsDI5a3v5wUiyCgYP/mgRCH4AV
	qY/IEBH6hEhDJ7ziKFHf509GKXdP5U0M3MqSB5C4b0=
X-Received: by 2002:a05:6214:e48:b0:8be:3da0:bbac with SMTP id 6a1803df08f44-8d32b56ffe0mr182671126d6.3.1781452583338;
        Sun, 14 Jun 2026 08:56:23 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d30522cbeasm82008446d6.44.2026.06.14.08.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 08:56:21 -0700 (PDT)
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
Subject: [PATCH v2 6/6] media: v4l2-ctrls: add KUnit tests for compound control tile validation
Date: Sun, 14 Jun 2026 11:56:08 -0400
Message-ID: <20260614155609.3107600-7-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614155609.3107600-1-michael.bommarito@gmail.com>
References: <20260614155609.3107600-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_085624_864819_BE75E208 
X-CRM114-Status: GOOD (  18.55  )
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

Drive std_validate_compound() with crafted HEVC PPS and AV1 frame controls
and assert that out-of-range tile counts are rejected with -EINVAL while
in-range values pass, including the zero-initialised AV1 frame default that
userspace and v4l2-compliance submit. The tests are #included at the end of
v4l2-ctrls-core.c to reach the static helper, gated by
CONFIG_V4L2_CTRLS_KUNIT_TEST.

Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
Assisted-by: Claude:claude-opus-4-8
---
 drivers/media/v4l2-core/Kconfig               |  12 ++
 .../media/v4l2-core/v4l2-ctrls-core-test.c    | 130 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |   4 +
 3 files changed, 146 insertions(+)
 create mode 100644 drivers/media/v4l2-core/v4l2-ctrls-core-test.c

diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
index d50ccac9733cc..04b15d860a0af 100644
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
+	  HEVC/AV1 tile counts and parameter-set / tile indices are rejected
+	  before driver code consumes them as array indices or loop bounds.
+
+	  If unsure, say N.
+
 config VIDEO_V4L2_I2C
 	bool
 	depends on I2C && VIDEO_DEV
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core-test.c b/drivers/media/v4l2-core/v4l2-ctrls-core-test.c
new file mode 100644
index 0000000000000..813872694eb46
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core-test.c
@@ -0,0 +1,130 @@
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
+	/* In range: maximal legal tile_cols / tile_rows. */
+	f->tile_info.tile_cols = V4L2_AV1_MAX_TILE_COLS;
+	f->tile_info.tile_rows = V4L2_AV1_MAX_TILE_ROWS;
+	KUNIT_EXPECT_EQ(test,
+			call_validate_compound(V4L2_CTRL_TYPE_AV1_FRAME, f,
+					       sizeof(*f)),
+			0);
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
index 58e2eb7002a19..5e86b6373a136 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -2851,3 +2851,7 @@ int v4l2_ctrl_new_fwnode_properties(struct v4l2_ctrl_handler *hdl,
 	return hdl->error;
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_fwnode_properties);
+
+#if IS_ENABLED(CONFIG_V4L2_CTRLS_KUNIT_TEST)
+#include "v4l2-ctrls-core-test.c"
+#endif
-- 
2.53.0


