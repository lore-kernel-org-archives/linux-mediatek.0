Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7B4CD98E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 02:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZ9wck5P6r9OGqEQx9lSHX/yZ9cfcypeRcv1sXaGY/s=; b=Xzwi3qhOn4X+60fjK9OkW29Kfn
	bzpJa3PZjFOQlcD4IXY8ERRITnPEH9mpyHwX7opKhmH5TLeYwKf2zUTIqpKQHuIQgRUaFV10iJ4bt
	ITdYE8QS2hIsEMnYHDmaiEaGqZeuURrmIuetYmRSrWPCd/YOS3VUzv6s/gAhfZO6PJu2y6F/mHmiP
	4zTcUt3bivi8t16FZvvTBJNPvaWrBRNnaSInuCYygoUwjAUNaRJLWXef9fD60rnWMLW5acBTredpp
	5NaV+YsIxZZJ8LH3xqzD1js5DtIu+2NtILInyq4ZN6MnTqVAlnUGNZnuOBOwgDN3JwKt2Ru5z+Gx1
	VKEnDr2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZfsL-0000000GUAP-1M8G;
	Wed, 17 Jun 2026 02:19:33 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZfsG-0000000GU7M-3Vw0
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 02:19:30 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-5177945a22eso38632981cf.1
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 19:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781662767; x=1782267567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZ9wck5P6r9OGqEQx9lSHX/yZ9cfcypeRcv1sXaGY/s=;
        b=Vtz7TE9C4Bxx7p21OYMnluANdz11eEu76GO1rnhWEL4aMc5vsXBbomZauEJ9ZolY5S
         WVmOPS7bkHH4vabJwt/2bsMEQRu51+5GKqT8kYLOT65/xRuQbv33UDu+nxjVxQwDyG/y
         rzxpVOBefsMUphfXTAo5AKKIzPlaSie9CM9vR//E9PIrvB+mIi3S7MhgHN3aRKEhO8Z5
         n3xDgfB3zpxyqNH80XURM/qVwRZh3tegroMn6XH7uvOi35cK0TEe/9AcMyO27jPMQzh2
         Av24BqY3QDDlmgWJSPqYXA2zILKddiSuNGWd+7UcZNAQa7yAQ3RTL0NCx/jJvjdXQzZe
         WnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781662767; x=1782267567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XZ9wck5P6r9OGqEQx9lSHX/yZ9cfcypeRcv1sXaGY/s=;
        b=F83wMDb3A+v9SMI18QomB2crpx+Bfv515PVQE3A1X63a1mznwUuaXqUPf8wFM8I8Wh
         xAbNYhtZTCr2yiMmui71laiYfwCF55HKYTuEPogh8zMI+jHv13DKFNxCV7ap098+7BGw
         OUijMQEdc9oG2Gy+6vJ3ZFd7mYw+njlbkPNjxKATD1Q+xGyzdIBs6ipAtapdFQO2XivK
         ditJ7fxYM63GmxQ/ZQXCrhKwWxGF0bn8JTrLQkEhoI9s3jfOmzJCKMvSB58AuF45Yg6K
         bG4x/7NrbTNkpZJv/8hF6dH3gMf6KRp74owjyMJFINqmPvN9OQJog0m79TWwcfFuOFPk
         LEwQ==
X-Forwarded-Encrypted: i=1; AFNElJ8wmvp5Ab+X52Kab2nCOmlLSE5bQ1y1JKVKqXZ1sC0DD4rqvfq/48LyaNTOD1iqCOtk4sKd+9F7mw4Ueo8lMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXsWZGNVVUFlKJIc1ngK4cCV6TVX2FDs0bzeTXHmRH3e02Kbky
	KjtIHDP3FE4mK1+Ymp5AEyIfSBXZ5hi8VErmv/HQ0ZzuOfKLeHygLG5bUqVGN5qUgdA=
X-Gm-Gg: Acq92OEuT7XrGxpFgz5ETO8l9//uRVbRiYXnn1MmKim8MowyWs5u4ILGCTWNG2uoZqZ
	de88urtVlPnykhRrghc6iKEElaayuk6Kmv7W5jqqW2FK7z3dB1Xl0EadZTchLl56xrig7I++WvM
	7pJebtCQdpqXnN3nqihDuigHNR/A1H3UUOv82dsHsNbdKl6fQ6OaehXvCZBAOb0H2jI/R4snr63
	ZX5oLJyugxbTZqhm4s5yJHzK4IYIj3rclqvpFHonvARHsetlQNY3/MuskKpNHxv80iybBxmYkz5
	XKHuNWzlHrant2MVSfdmks2Zm3LtUVHMtrO2a6JFRSsIFWIWPJhMNU6agnrt6UXSKmsJftbl1Go
	Va/fxoqCDRiyOm3Kjt9UsWyUl77eKv06Bh8NulI6qGARKrpOtUz0jEcOpusjY7DIq+ES4Taww/d
	B9d3dxRhScyHoVTcG1oTsQK44Vd8niWKOBr5HTtOwUmxeOGAW6b9PNKO9c+U3gtmpKv6uCmgSgF
	v/HOd431O9KcWMM032vBgVlyJp++Btb
X-Received: by 2002:a05:620a:280a:b0:915:6504:2a11 with SMTP id af79cd13be357-91d8d7a6a6fmr417807285a.44.1781662767410;
        Tue, 16 Jun 2026 19:19:27 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006e35sm1657646285a.28.2026.06.16.19.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:19:26 -0700 (PDT)
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
Subject: [PATCH v3 1/9] media: v4l2-ctrls: validate HEVC tile counts
Date: Tue, 16 Jun 2026 22:18:58 -0400
Message-ID: <20260617021906.2746743-2-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617021906.2746743-1-michael.bommarito@gmail.com>
References: <20260617021906.2746743-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_191929_008351_755AC654 
X-CRM114-Status: GOOD (  10.65  )
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

The stateless HEVC decoders read num_tile_columns_minus1 + 1 entries from
column_width_minus1[] and num_tile_rows_minus1 + 1 from row_height_minus1[]
and use them as tile-loop bounds, but std_validate_compound() does not
bound these u8 counts. Reject a V4L2_CTRL_TYPE_HEVC_PPS with tiling
enabled whose tile counts exceed the uAPI array capacity, mirroring the
existing compound-control range checks.

Fixes: 256fa3920874 ("media: v4l: Add definitions for HEVC stateless decoding")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 6b375720e395c..6d478e1a5ef22 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -1242,6 +1242,18 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 
 			p_hevc_pps->flags &=
 				~V4L2_HEVC_PPS_FLAG_LOOP_FILTER_ACROSS_TILES_ENABLED;
+		} else {
+			/*
+			 * These count the entries the stateless HEVC drivers
+			 * read from column_width_minus1[] / row_height_minus1[]
+			 * and use as tile-loop bounds.
+			 */
+			if (p_hevc_pps->num_tile_columns_minus1 >=
+			    ARRAY_SIZE(p_hevc_pps->column_width_minus1))
+				return -EINVAL;
+			if (p_hevc_pps->num_tile_rows_minus1 >=
+			    ARRAY_SIZE(p_hevc_pps->row_height_minus1))
+				return -EINVAL;
 		}
 
 		if (p_hevc_pps->flags &
-- 
2.53.0


