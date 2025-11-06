Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E12CCFA13
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 23:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Message-Id:MIME-Version:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qSi4lhcoeovU0a2BfWKOwxA6Oh5Rnt06ISGW5gYuQ/I=; b=MtyKQdhez1zOtBMZVRLxcZ+BE9
	csRuf6Bj0Qr9q1EXPMsblU+AdV1rPUhsldnuF8LrzewhVLVZggpolA50rEJc5SjSgZV9zB04SWvK2
	U9ojraDoD6bfdRL2Y/HMeCfseAy5aEoNXKq941ECV7DP6I8jz91KADzW6EU2XHRg+xfxw3ZDozZvy
	eFDtzEnhx3LGbouT4so7OXVmug+s1Fk+U3b+jrKoaNBIP3HFFgsXArl9nIVTr3Oib8Qja7Cw9yOjD
	Urh37MnbOFq5vzJqJvhr1/XA559R+n+7YgkDFU7MyP/yhPR9xDIFHLfb1oVNeC+OhGDejZ3DOxime
	n5iBAIlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9bD-0000000GOz0-2R7F;
	Thu, 06 Nov 2025 23:41:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9b9-0000000GOy0-45di
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Nov 2025 23:41:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762472458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qSi4lhcoeovU0a2BfWKOwxA6Oh5Rnt06ISGW5gYuQ/I=;
	b=GRP8KxCquw7r46nDLGh6YpFNrrzI+OjMC+aXF5R/ou3Jd6lo5USxJlm7iXXywxeRV+eBii
	eGTGgvGI92ibhmHwn0+qn4jfwdLD+u1PtDhp7hR5RnWH+lGz16Ga13zZ+1LC2GfsmZjA5c
	gWRmI5lSEUfHQDQJOIU9dbzJ8d81Fq0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-BKcG7wDeNhWfvJsJDgXHuA-1; Thu, 06 Nov 2025 18:40:57 -0500
X-MC-Unique: BKcG7wDeNhWfvJsJDgXHuA-1
X-Mimecast-MFC-AGG-ID: BKcG7wDeNhWfvJsJDgXHuA_1762472457
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b12cde7f76so54161985a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Nov 2025 15:40:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762472457; x=1763077257;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSi4lhcoeovU0a2BfWKOwxA6Oh5Rnt06ISGW5gYuQ/I=;
        b=DM86ThsucDQmEs7EU3HQAeQxJw0MnoyHQRjO7iP4DMvnCPNr19Id0P+YvSL/hiHjMe
         8qnQrIdO2fXyqEx5dwybZEb8YxuW508bhtf266pZ0vOnV/v6xQmMpRWrUPxtKT2sCOQ0
         fq0dG47wENcnfj4Lt5xVDhC8+Cy3P0+d4fPMybIl7OyCFklZ2jObiRsxAR/iVq2RitrJ
         T9ffzT7ejIwfceC3StGAzuNfSNx/wLypZTsftK37/AVmcUSkGXyBoSj/5C+QtPVnQybd
         KWYlSY8pXWcVcfNS3QQvPRWWi3daJSz04uLzc48xBYHx4M1jC3eqtumn4lYB+cwuhTHJ
         +4Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUd0vLjMFF03EJwyVNCItmHjdMsmT+dncMxe69p9b9kSYG0MVfGq6Jrnu0SXLK/5WJpQwc00dvd0xiF9PoOxg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr8tYe4aw9iNfHqDZ/Fl3s4LQuE6d37QRVWmQBKj346YwpYVbP
	VfYWSR+Apc4voyrdpfdDlNj7VVod2y1ztnyA0CFAYpYjkAWjc+s76lps+LeJr+BfEvhEDfdg7NU
	Hn+Xz9HyxhBk6chmjBzgO4zHVzUE4SwYNkqegSP24EnE1z8TSorBpauoHoOWMR476cBbRnXnkew
	==
X-Gm-Gg: ASbGncv0tVkWR3TCQgn9x6EJNk1kZjPlCyRXSrdnMfjQmCxG9wKmsNXssvr4lGgy1wL
	R9odH5ZdMgXYzabl5tQv27wCZFFh+TGlwp4xEfqOqDIezU/EjqrT2m3Xre7CKoxkiaS+te9gOk1
	SGZ+pM6W5HUMY8Y1BehpoLuUY+hZQQQ6cNNj4B3LZ+x44gwtugHqF64aCldi7qMFGro7OGc/O9n
	9a8/FB5yv09sAUxYMUFT/+P/ooVGr16Tj+RGO+GL5T95lC4YQIfD69EZ9JWH3mGOZD3oVxCmSwj
	MhSClpo7cR9y0AJEp+vB+zWE7H0HCuB5gfXqxXDIBWFOkmq/To8xL0B6KJUzBMtI/+av7ErC+j6
	robJQ
X-Received: by 2002:a05:620a:d88:b0:892:234a:2b2b with SMTP id af79cd13be357-8b24529f2e5mr192099785a.12.1762472457255;
        Thu, 06 Nov 2025 15:40:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZT+H167P7va194juS5N/5Rv6J0nRNzshDMiBhjOQ3sW7gz8j6IeeYjW+L3gANSgDWIEeOcA==
X-Received: by 2002:a05:620a:d88:b0:892:234a:2b2b with SMTP id af79cd13be357-8b24529f2e5mr192097885a.12.1762472456852;
        Thu, 06 Nov 2025 15:40:56 -0800 (PST)
Received: from [10.197.115.224] ([2600:382:8110:2352:2c3:1cdc:5b7e:f260])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b235805139sm289359385a.40.2025.11.06.15.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:40:55 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:40:43 -0500
Subject: [PATCH] pmdomain: mediatek: convert from clk round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20251106-clk-pmdomain-mediatek-round-rate-v1-1-49441ea27f84@redhat.com>
X-B4-Tracking: v=1; b=H4sIAPoxDWkC/x2NQQ6CMBAAv0L27CYtKAS/Yjys7CIbbEu2QkgIf
 7fxNnOZOSCLqWS4VweYbJo1xSL+UsEwUXwLKheH2tU3712Lw2fGJXAKpBGDsNJXZrS0RkYrjO2
 1p/41dtw4gpJZTEbd/4vH8zx/6JthAnIAAAA=
X-Change-ID: 20251106-clk-pmdomain-mediatek-round-rate-649a9bf7d30a
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2324; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=9jMZC6UuuQ859ZjuOTCqEY6qe2p5U3lf+6XaIq1aSuM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ5jVh3Tb953fHtbe7Iucvuvtlo9X/DzsOGdqZLv/+TV
 svzYtnQ0FHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEeOUZGdadZkl9b/baRNZs
 97Tz9reK+u+yMl67wrmFf9aUB+8V1igzMqxKux40T++Tb9H/bQqnX0Qmb17m17p9rXzE9jNZVzp
 dbTgB
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mDAEI4LTnFk61uX9NUt_ulTpVyz957ii09X55FltdMA_1762472457
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_154100_218523_6F099EBD 
X-CRM114-Status: GOOD (  12.86  )
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

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's convert this driver so that
round_rate() can be removed from the clk core.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
index af20111067c02a5f9a0d6d751e9e0dc32c1a4d90..9bad577b3ae4bf1b83d4f782bb52f56f779a8974 100644
--- a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
+++ b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
@@ -309,11 +309,11 @@ static unsigned long mtk_mfg_recalc_rate_gpu(struct clk_hw *hw,
 	return readl(mfg->shared_mem + GF_REG_FREQ_OUT_GPU) * HZ_PER_KHZ;
 }
 
-static long mtk_mfg_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *parent_rate)
+static int mtk_mfg_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	/*
-	 * The round_rate callback needs to be implemented to avoid returning
+	 * The determine_rate callback needs to be implemented to avoid returning
 	 * the current clock frequency, rather than something even remotely
 	 * close to the frequency that was asked for.
 	 *
@@ -325,7 +325,7 @@ static long mtk_mfg_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * high current frequency, breaking the powersave governor in the process.
 	 */
 
-	return rate;
+	return 0;
 }
 
 static unsigned long mtk_mfg_recalc_rate_stack(struct clk_hw *hw,
@@ -338,12 +338,12 @@ static unsigned long mtk_mfg_recalc_rate_stack(struct clk_hw *hw,
 
 static const struct clk_ops mtk_mfg_clk_gpu_ops = {
 	.recalc_rate = mtk_mfg_recalc_rate_gpu,
-	.round_rate = mtk_mfg_round_rate,
+	.determine_rate = mtk_mfg_determine_rate,
 };
 
 static const struct clk_ops mtk_mfg_clk_stack_ops = {
 	.recalc_rate = mtk_mfg_recalc_rate_stack,
-	.round_rate = mtk_mfg_round_rate,
+	.determine_rate = mtk_mfg_determine_rate,
 };
 
 static const struct clk_init_data mtk_mfg_clk_gpu_init = {

---
base-commit: df5d79720b152e7ff058f11ed7e88d5b5c8d2a0c
change-id: 20251106-clk-pmdomain-mediatek-round-rate-649a9bf7d30a

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


