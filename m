Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E09F43683
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Apr 2026 10:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fE+qnOdm3zs6vETg/xjRcNv6wjpPT+qb+RS/sbJQMYo=; b=WpMoc3CMAwOSFAHg56lDLR4zkW
	i7qUYtLJbEMcIo3wo6EPm/XaH9shrBVyTqLEFnvf7KnV9WyeYGDndGKX6C8+p0fy9Qfs4QEHjg57J
	OULAoEY/ukAzrUJlTvTZaD95lQhVvh80mXjYpC8ZaQnnvYbsAGvOCNHOucxGFfF8cOg3d6/82yTd/
	RXaVqXpiDbE803cV/nNKkdnU3ng57gG68BfOoO7optYIooLA0b0ZnvwBPjSDgW8lHuh77Vw4UflDC
	l892VM+fp5Qf0zaWGIz1+CslRUGtkLUI5XMd+laRZAQ3p3d8XY2dBOI04pVqrhgUshZUwvwcWhVD7
	n8alZbxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDgRx-00000003uLH-0uVy;
	Fri, 17 Apr 2026 10:29:25 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDgRu-00000003uKx-3xV5
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Apr 2026 10:29:24 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so8221565e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Apr 2026 03:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776421760; x=1777026560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fE+qnOdm3zs6vETg/xjRcNv6wjpPT+qb+RS/sbJQMYo=;
        b=huLu5kyvhkyE+HSnU9W3Rk4yNbJ6MGEU78SXGbQ/h5z9UveZN7sjGF0Ph1nTLcpD/K
         WrtGDGjYezwPPemAi28Z1Hd4OTFCs9UNGl7rqrPbjoQFfqwstL0MZaMzxzPMoVSwURqD
         UUGvrW4ejE5B2r9Zi990sMeXc+LCLXCrnCArXzyJJ3B4YDfwRNQrsT4JLequJIypcP1a
         z0pxqJMOonRLMWw66L8HSQLb21StrjsPlM5bE9oXoJeeWVkdtgrcMsmI9Gi70Lr22iEm
         BCSDnT0WVIbMn07fiGKH/fKiUZObA3/16pAVLotC1OCp88R2mJ4n/ybZXo4mGJclA2Zc
         ILjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776421760; x=1777026560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fE+qnOdm3zs6vETg/xjRcNv6wjpPT+qb+RS/sbJQMYo=;
        b=Isd6BVuceTM3+vp5Kt8QgQF+USx3vJ+NJf226vqiHTS+z1ooq5/Ta6Iu+P0o8adgq7
         dH7SkO9FI4W3oULIMd8Y1VwcAyeyfWjR1mvVC39wWm5WEmvs62CSAjKFZzz+Y4jsnvDc
         v7oOjtxOX/Xwr/JFSj3nizQpOc8On8Ho5JIc+ZUevu6UsEJYhuOozQY6gzKh8kt06cJT
         wy2bN0Ea6SI3UnS1I6qj823cgfPryVv7t7ocMvLLtxbAcPBVeMUGdCheh5ZC/RszJ16/
         +r6ELs21GOxFEZhO9izuvImO+BO+GdTqYwAbsYOlIX8EwUAUXJCcr8du0lGcBf//PIG/
         g2KA==
X-Forwarded-Encrypted: i=1; AFNElJ/gzva7Qlsnv7vPaeSR6vZGIu/bwCyOekh3V9y/yIH+dLL9Fh3wvog49BX7jfk/qGX5uzpG+qhpzL9q2WstTA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4wFm0Wfi6hlplt8LQpz2X4N/3ISmZbrRzdv0MXdfWbtnKZVmc
	UdyGYyXkYMENLfBOzPdECHjJrmtmb/oRra118LKcmuzHaA1Tz2e0KRA=
X-Gm-Gg: AeBDieuGMr4f+ZxDp0iFUtk5tShm7cU3tG0AhPqU5nrdCkSNBW4aNeqzaF0ep5Oz/Hk
	fDIHK4AbHlHOv3jtdGzXcXyz3X1Gg38aqRuqp8pGby3aupaOv/ooUHz/eooX1wgC0fB17leB60N
	+bl8B4dTFmPqpMpoR4PvphuW7pSlnKYjfizW6IGG+R8kkXxcW+//TNKp9HvBSk/aYvhF0pr65H+
	VZdyjHObPH/mfmd1/yQGDGt3sf4j4VCl90m9KWV+8BqQpnyFP597e9mKb3QiX2dBH+ssArn5/Hf
	vZeSs4aF2+RvhCBlySEKMg9NQkK6DDqy4hYPpNi9gOKZEY6jCa1WJrg7E7ZFM6rCuuCZ7uV8yM0
	2Irt6v9zzbGkPmZd2Y9O6td9L61MF1nrlmy8a8jc7SWZ00ooyqgLgIOSIbEbx/aMwzi3DNbaRra
	Qnu5s=
X-Received: by 2002:a05:600c:c4a1:b0:488:c014:34da with SMTP id 5b1f17b1804b1-488fb77ed1bmr27199815e9.26.1776421760356;
        Fri, 17 Apr 2026 03:29:20 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7c0eacsm13854955e9.35.2026.04.17.03.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 03:29:19 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: luiz.dentz@gmail.com,
	marcel@holtmann.org,
	sean.wang@mediatek.com,
	mark-yw.chen@mediatek.com,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH v3] Bluetooth: btmtk: validate WMT event SKB length before struct access
Date: Fri, 17 Apr 2026 10:29:19 +0000
Message-ID: <20260417102919.2549352-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_032923_008513_FDA2108B 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

From: Tristan Madani <tristan@talencesecurity.com>

btmtk_usb_hci_wmt_sync() casts the WMT event response SKB data to
struct btmtk_hci_wmt_evt (7 bytes) and struct btmtk_hci_wmt_evt_funcc
(9 bytes) without first checking that the SKB contains enough data.
A short firmware response causes out-of-bounds reads from SKB tailroom.

Add length validation before each struct access to prevent OOB reads
from malformed WMT event responses.

Fixes: d019930b0049 ("Bluetooth: btmtk: move btusb_mtk_hci_wmt_sync to btmtk.c")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/bluetooth/btmtk.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 6fb6ca274..b1a96ebae 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -695,6 +695,12 @@ static int btmtk_usb_hci_wmt_sync(struct hci_dev *hdev,
 	if (data->evt_skb == NULL)
 		goto err_free_wc;
 
+	/* Validate SKB length before accessing WMT event structs */
+	if (data->evt_skb->len < sizeof(*wmt_evt)) {
+		err = -EINVAL;
+		goto err_free_skb;
+	}
+
 	/* Parse and handle the return WMT event */
 	wmt_evt = (struct btmtk_hci_wmt_evt *)data->evt_skb->data;
 	if (wmt_evt->whdr.op != hdr->op) {
@@ -712,6 +718,10 @@ static int btmtk_usb_hci_wmt_sync(struct hci_dev *hdev,
 			status = BTMTK_WMT_PATCH_DONE;
 		break;
 	case BTMTK_WMT_FUNC_CTRL:
+		if (data->evt_skb->len < sizeof(*wmt_evt_funcc)) {
+			err = -EINVAL;
+			goto err_free_skb;
+		}
 		wmt_evt_funcc = (struct btmtk_hci_wmt_evt_funcc *)wmt_evt;
 		if (be16_to_cpu(wmt_evt_funcc->status) == 0x404)
 			status = BTMTK_WMT_ON_DONE;
-- 
2.47.3


