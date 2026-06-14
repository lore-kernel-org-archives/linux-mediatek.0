Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D60CD98DC
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2026 13:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJpu5i70KzzzFRdB2RQuMRBjZ2Ekssr7dUppZeDYSDo=; b=RzTfHhT0BSCXuIW82SMFa8Kl98
	K4GfNT0fDsVA4G+fr8V/jA+/c2nUciuEjWWjokIYPuePxkE4qsu3tzB6f/C//BW70smAJhx4QEhwN
	0wfhPbK/2KGPCA4Sdwmtqjthxczuo+wDRJo1t6kLEUYfYgkp6L2V8CZCOLz7+RVB+9s1U/otZSEk4
	SNCCa2Av7n/r7vs3wAlEU/gB4QLtw3QpjuXz5fILPjIKcKcfiXuF/SMSsQSf1DDq1vW9ZEwX46j/o
	0bu4o+zpjh1o48NGuK2h30MOSWUQQ2Q9z4BlTQdCBnzU0t25KVPtvqnhHGpqeFiTxQHj6OopW8e0g
	3W3BjOlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYkbU-0000000D0Ni-3chO;
	Sun, 14 Jun 2026 13:10:20 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYkbR-0000000D0Hy-3Z6N
	for linux-mediatek@lists.infradead.org;
	Sun, 14 Jun 2026 13:10:19 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-9157b895c57so231963285a.3
        for <linux-mediatek@lists.infradead.org>; Sun, 14 Jun 2026 06:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781442617; x=1782047417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJpu5i70KzzzFRdB2RQuMRBjZ2Ekssr7dUppZeDYSDo=;
        b=lzn4gtLLsJPue3PBfAGUtC1o3k/qmClfdKT8am3nLUK/wQbJnbZuUVbEvku0Gai6V5
         Y2SH4p3cbhMiWS8pGQypVN/ueZGr9gLYp0mdcCBOCM6ORQmzjQyHrRFhjgtj7j/sWWU3
         xGlkS0/aYqpRl1UGkOtg4TKl4N3UUZq2ivScCFTboAq+ULBVJIW4w4gS3eCbMYCZGqJQ
         QVvCK0PfLeCPqq2vk46a2AW7yJeJ7h5N7xk0X6lvJBViSQj9aREBB9jRxEp8WZ8amIPC
         hQ26GsHKaZ/0sUIK0/3vhxC3Uiu/nRGpOc+dSyvm8pf0/BhokwF7pE/neDWeea1mDHAE
         tJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781442617; x=1782047417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eJpu5i70KzzzFRdB2RQuMRBjZ2Ekssr7dUppZeDYSDo=;
        b=VhZEijXxy+iyxGvv9BX8xau6FPWPe/KN5N+CuV+8YKOM2wTfycbVMIgVJHiPkD6+kp
         wAPFP7BEF3LdoHkcsgO/lxZpx3gUxU/6NXQUMDCvbyIspBhjalWDdF9OE8tr/70tz5w/
         uNk5x4292c2rHyg7IW9m/1+ymWRRskbC5M7063/5WWI6IGkj2aJVRpgNLFrDSGgcrjmg
         JltORwYHLg6sqjw0FeMkYVGv9tq35M5BaseP25btldKtx2exA8R1P6iqMTNNttq8Fyx5
         4lVmG26odu033xEZus/ilXicyusWLtMqfsCYn4Cvo1tqgGGVLjVpMa+A9BtMsrRaB44A
         Oiew==
X-Forwarded-Encrypted: i=1; AFNElJ/KXQ2Skw4uJDOx+Iz50oATpH05bjzYrFPQx04RpI0Am2aVJw7cppHR1clkoF3vu9cpoBPauYcN2Wfz7U+Q5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvCIW07NV9qoU7aIcilQNz3jQdw3Jm4hVeDR03fpkvEgYUO4Lm
	AFsyYL5AmWVMjZX/976d7kGW5khosOexJ02bVlhppkdY73qcn3YS2Z9K
X-Gm-Gg: Acq92OHW/1vsPViQvuXMYJaGhADr2Im8dm66smS7ZAldufILUIBJQHiiLpujB5TwVq0
	Ict2U1vy5pjZh8bU/Junbj6AsJSILck8YYvGFw8L/8N4FwEyUlUqk2zRqMvM54dcj3zGHpysFV/
	whwMK7etcJIgO9rmr2equ8oayVUXqVIb4ZyaiwVW8db1O8MQ1ENsEU2tqrZvUwv7jBVuOxCLodj
	lZTi3dHWH2hyHKbTZiCkEFLyXKB5vsBzZsJGzuDxrZLunooOHKpjL5uzKJrW4UpknFEq2kv2PTa
	0kXUhnzseoPO5vHQq8xtEzlWU6bvA1IPIOF5s+w0WSNExGbJRUtUWI300A/1xvOfeDaEB0c3YI4
	OL9x4x27OoAKFculnfc5De8OAntOtRoUQPp09XLJbJuCa2vAenZzXhZlyRzKSQc2A6WcNbnMXN5
	4JIdsRlsctHXtedbLk2mtjL25HbCqlo9Yqq+XPH/o4n4YqphJLHxovBc/fam1jx0awjIm7EDYkD
	FabsG4bcggA03cs3SgkBCiTVCOH2ReOkSgcthdjWqw=
X-Received: by 2002:a05:620a:414a:b0:915:6e30:5bd8 with SMTP id af79cd13be357-917ee4d8cf8mr1102847085a.11.1781442616705;
        Sun, 14 Jun 2026 06:10:16 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f1b400sm752878985a.15.2026.06.14.06.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 06:10:16 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>
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
Subject: [PATCH 6/6] media: v4l2-ctrls: add KUnit tests for compound control tile validation
Date: Sun, 14 Jun 2026 09:10:03 -0400
Message-ID: <20260614131003.2524025-7-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614131003.2524025-1-michael.bommarito@gmail.com>
References: <20260614131003.2524025-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_061017_918865_15543CAD 
X-CRM114-Status: GOOD (  17.35  )
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
and assert that out-of-range tile counts and a zero AV1 tile_cols are
rejected with -EINVAL while in-range values pass. The tests are #included
at the end of v4l2-ctrls-core.c to reach the static helper, gated by
CONFIG_V4L2_CTRLS_KUNIT_TEST.

Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
Assisted-by: Claude:claude-opus-4-8
---
The tests are #included at the end of v4l2-ctrls-core.c so they can reach
the static helper, gated by CONFIG_V4L2_CTRLS_KUNIT_TEST. Run under KASAN
on x86_64 they fail on the stock validator and pass after patch 1.

 drivers/media/v4l2-core/Kconfig               |  12 ++
 .../media/v4l2-core/v4l2-ctrls-core-test.c    | 119 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |   4 +
 3 files changed, 135 insertions(+)
 create mode 100644 drivers/media/v4l2-core/v4l2-ctrls-core-test.c

diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
index d50ccac..04b15d8 100644
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
index 0000000..6ec48fc
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core-test.c
@@ -0,0 +1,119 @@
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
+/* AV1 frame: tile_cols / tile_rows bounds and non-zero requirement. */
+static void v4l2_ctrls_av1_frame_tile(struct kunit *test)
+{
+	struct v4l2_ctrl_av1_frame *f;
+
+	f = kunit_kzalloc(test, sizeof(*f), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, f);
+
+	/* In range: a 1x1 tiling (a zeroed frame is otherwise valid). */
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
+	/* Divide-by-zero guard: tile_cols == 0 must be rejected. */
+	f->tile_info.tile_cols = 0;
+	f->tile_info.tile_rows = 1;
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
index 25227d9..8debd0e 100644
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


