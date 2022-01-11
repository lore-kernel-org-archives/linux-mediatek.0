Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54089C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 11:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iJhgbNLla4M5Nal6ZQS6CpN3ZMQULKqzHOX28Ap22Eo=; b=CKFBQMceK6wG9b
	FDYjn5f+S7g8rxLWw3x+UebLpPHcoI9UFQX3ABEprRSKI5yDMOEjl/unfEb2L/qJqrXMrZvctBXaH
	6FsnlFoNPQ8SQ9wKdqEav73ZM2gYBXme6qh5OpwWuF4exTQnuR3Yn3CiZJVf+mWQ5ufgyPjLrmcM+
	wSutywisRXMPqnMYDf9OggTI1UYnd02dTK6NAi7P5yExZa/1j1q0EnhQWpvD1h81VvTDtoSXwVvdt
	0gMx3omgfGeAY+5O/P7968l3mnyZJYJMQPuIAbJVVRiEtZKK0ZQ9CROfL4szxw0g44YGZ9U7jrZ/t
	eXES6EZ4dvgu4Jr+yYmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7FGP-00G0wd-Ak; Tue, 11 Jan 2022 11:24:29 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7FF0-00G0Dv-8j
 for linux-mediatek@lists.infradead.org; Tue, 11 Jan 2022 11:23:03 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so4661751pjj.2
 for <linux-mediatek@lists.infradead.org>; Tue, 11 Jan 2022 03:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1fEL/KVXQTE5AFQeTwaZaRarWCZCE1VjWBv8zykoqdY=;
 b=QvkvjmrvGZQq6KX1p+b9jRBnwdYwTHBqvdbuW/mMltZPFt0nG/YHdjgwUaIK+CXEbc
 RC96srRjO9HMfi5xOAbvokyZ4lS5um5OsYATwqKsAlnI0XrhDFMsS5udxTpXCST/JAio
 D5x9YVt4OjqNJiAHP0wwVs2J3PRVrLwrEPXjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1fEL/KVXQTE5AFQeTwaZaRarWCZCE1VjWBv8zykoqdY=;
 b=pkH0CR49irKeHwxWMQzlc4qB28Un/bd90QO63CGbNTaJwG0bBeh/2V2ekBUx2hWtX4
 hABCST0tz93FjPPT0HB0D3XdnCpqYTwfhLw/SjxuJZW2HcAtQsihrIQ/8+v4558xG87j
 87MIEwBfIk+rB6BYJ6oLL9nATdJ10rVWkG9K3lgOHV5pAzVLmxcLOgpD5EtMV5OJ53Nd
 bXxSKQ4K23MNGctyFKn/fRi+RE2CNGYHcLX2yjBEHwPihBTpnYdW+nk9nthx9q36yejS
 OdJpglOWyJlKPCi4wQMvhBXVSddM2hfcsiPOLmlVrpEKHNEj7UaGDswLvogLWaUaUzQJ
 QUEQ==
X-Gm-Message-State: AOAM531lJGRxXXVaTqQ3Ck7P+5rGOBX8xoCu8aGtIHwKD/mkGbfbyDSJ
 BZYFIRNslJKSUWmH0WfdDUOIzpx4oIIxnw==
X-Google-Smtp-Source: ABdhPJxDZb8hKxuj9Fyjpv8O0cKzuluDJhQ8YRywEa9PHkMM1/QHq5Y5ZmWv+lFYPzArvfca0QIniQ==
X-Received: by 2002:a17:903:110d:b0:149:a833:af21 with SMTP id
 n13-20020a170903110d00b00149a833af21mr4177450plh.14.1641900181239; 
 Tue, 11 Jan 2022 03:23:01 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:e7ee:1824:8575:bc5c])
 by smtp.gmail.com with ESMTPSA id f9sm2053845pjh.18.2022.01.11.03.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 03:23:00 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Guodong Liu <guodong.liu@mediatek.com>
Subject: [PATCH 5/7] pinctrl: mediatek: paris: Drop extra newline in
 mtk_pctrl_show_one_pin()
Date: Tue, 11 Jan 2022 19:22:42 +0800
Message-Id: <20220111112244.1483783-6-wenst@chromium.org>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
In-Reply-To: <20220111112244.1483783-1-wenst@chromium.org>
References: <20220111112244.1483783-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_032302_351694_BCB698A2 
X-CRM114-Status: GOOD (  10.68  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The caller of mtk_pctrl_show_one_pin() is responsible for printing the
full line. mtk_pctrl_show_one_pin(), called through mtk_pctrl_dbg_show(),
should only produce a string containing the extra information the driver
wants included.

Drop the extra newlines.

Fixes: 184d8e13f9b1 ("pinctrl: mediatek: Add support for pin configuration dump via debugfs.")
Fixes: fb34a9ae383a ("pinctrl: mediatek: support rsel feature")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index d259f075c62d..1bacabfbc183 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -639,12 +639,10 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 			pullup);
 
 	if (r1 != -1) {
-		len += scnprintf(buf + len, buf_len - len, " (%1d %1d)\n",
+		len += scnprintf(buf + len, buf_len - len, " (%1d %1d)",
 			r1, r0);
 	} else if (rsel != -1) {
-		len += scnprintf(buf + len, buf_len - len, " (%1d)\n", rsel);
-	} else {
-		len += scnprintf(buf + len, buf_len - len, "\n");
+		len += scnprintf(buf + len, buf_len - len, " (%1d)", rsel);
 	}
 
 	return len;
-- 
2.34.1.575.g55b058a8bb-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
