Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924BCCCD1AB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Oct 2025 12:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EBT8mdGkZMhubx3+PF0HBbvtvo57PUFO+I9TYpkyhbw=; b=tWTJ1nykOGgNWQ7U1x86BXMA3E
	XWhsBV8Z239z6KUXEagAyjcyP0JxpGH2DM92DTJJa/rTRrDNuscR2IsN4qhqH7Zu6c9HYPjCdYlqC
	MWky8BqNsSLY5LMZdrScrlGPZ3v0SQjYmN62cdhP7oyw1LlWW9zShx/g3Gvgu5VO73zIYTlbvh/k6
	54cJEVVy8o+bQOY6rs/7qHDGyMWc2I9xi4J2y37Z/KDTB96EHOWXV9U+WfPcSSpI+F8YIUivvtVok
	Sp3CEBrHg2Sa8X+tEhzz5Aeg8rLG+lqpzHzIrGT8BiriNs35iBztoyDFWguJmPWEbAqPReunkPv/O
	XM8GBi+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBXZV-00000002kD1-0lbB;
	Wed, 22 Oct 2025 12:04:05 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBXZR-00000002kBj-2H6x
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Oct 2025 12:04:03 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-471075c0a18so71355435e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Oct 2025 05:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761134639; x=1761739439; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EBT8mdGkZMhubx3+PF0HBbvtvo57PUFO+I9TYpkyhbw=;
        b=SxsSFhgG8NHU/WMmqdfXMq8owBnmbZTpq62L3gUmtyqM2JmyaLoBhahSGsVaacRXC4
         4jrylU/+FJVdLnS9E4rw72bUVEsJs0yeQ2OmzQWp2hZfyMdlwsE8haCRK0gIEETPskRl
         9KfU4HsJdxCDHoUchmoba2O8WnC4S7SzMCTWjrBkZG4gkkLAYKCpq58Unb0tVHzfrqMc
         k0xVio/DqUT53wereu24kRRbnk8/lHetrdvSu8D7cEspGglsFNagIsnY1OdMnr87jsHJ
         +rMrjk5Xbo0mPhdGt2yBUarfQ0Sk4qFW/O1B9ieGCjVGqOJaPDhdrCwK3S0iIe++5Cjd
         Rb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761134639; x=1761739439;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EBT8mdGkZMhubx3+PF0HBbvtvo57PUFO+I9TYpkyhbw=;
        b=FTqCPthS4NFgneH9OYifPnjwknK5furHJL/QxUuta9ltrsxdQWfpXDU42T2JqQcPlF
         AKKp56kQcOB430tnow/JPb4jY9mI2ZuHz59fN0Qa6jkaFwFNw3L9tgsP1ngXIJreAZf6
         1psKeb4Z7c6g7/Ayt/rfIKNyFS9seCh3Asy5U3laTQVSoVmKjkfhdfRvMASqA/1I8NmF
         zVbZ2SK9AASM/gRbGqFNcgyvVXhu5RmhLiPEx6pwx+am+nYnSOR+sP2N0VHpj49GfXo6
         UVHhFUNltorjnNhc2pWlFalxmM2OYiAjz4VgMJXWqVxEgF8MIMnWxRKDtbql+2BtIW17
         xx5g==
X-Forwarded-Encrypted: i=1; AJvYcCXq6+NTcbUl5DrsJU+Z/lQVPBJAd2w9e3q5HVyMuqgnr3xxilxWGnH67sKXhl7NoPEs1K0KuYCnXBSB0P2yuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywht2gBrm5kpwjOtc6EJSX3Jfnuc+XuJWpmXOSIGa63n8hXgg9H
	LdeJOQ7UlAmvpRU+twMZhxOHigdlXXxN0rWA972nUmZFahFdEbmJX2OJ79y6+xEjaLRGNULqeAV
	8LhsK
X-Gm-Gg: ASbGncvTP31mLSJ+nfMlUmWjVzHQWqkM2oYmlAfltT3zWoN3S5bTOOZZJR5hri2adpT
	4JhJDnDTaZeX+KvIzkMwgfwcwOKBL2b/gzqiuUdS/EkyZdXGoeOvkpbgz4YX8GiujvjH91gX50H
	P9YdxSnY45xmHlNL+JwqfOxxwDeFMVRl26LGEsMSz5nI1Eej/YoiS5X0SibZybe2wVqWagDZtGE
	XrfZ1YJHTMQAZCUoWKP2UbGtdWy0dlKem1wPsxGpvjJyof/Iuw35wb5lGsN+7et5DkIXdlw6OXX
	n6j3LJYozj6B8KdNwxISFGHOiMKQsfdwuZTX/YdWRpi1J+IB1QjxYMSzbOEQTT1lWvgdRJdwlCM
	BRsVdVe8OwJnCV2DkTo863wFiQLDCIy+Is3TNJ22Wk0UuTxZz6ufRtnytBL+NlSe1W0mSjnRVXq
	YKBEZv8A==
X-Google-Smtp-Source: AGHT+IGK45Cu7R7RqMblJ0H20sOThyXTHE0mGsTieR9rpgEJC68Mu7KEhV/qc0jaopljgaHcbYAevQ==
X-Received: by 2002:a05:6000:428a:b0:428:3cd7:a336 with SMTP id ffacd0b85a97d-4283cd7a3a7mr11330553f8f.63.1761134639094;
        Wed, 22 Oct 2025 05:03:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f009a78csm25019851f8f.26.2025.10.22.05.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 05:03:58 -0700 (PDT)
Date: Wed, 22 Oct 2025 14:05:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] remoteproc: mtk_scp:  remove unnecessary checking
Message-ID: <aPi6eBlFLH43A4C0@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_050401_609437_2432A235 
X-CRM114-Status: UNSURE (   9.63  )
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

The kernel implementation of snprintf() cannot return negative error
codes.  Also these particular calls to snprintf() can't return zero
and the code to handle a zero return is sort of questionable.  Just
delete this impossible code.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/remoteproc/mtk_scp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 10e3f9eb8cd2..9b624948a572 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1127,11 +1127,9 @@ static const char *scp_get_default_fw_path(struct device *dev, int core_id)
 		return ERR_PTR(-EINVAL);
 
 	if (core_id >= 0)
-		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
+		snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
 	else
-		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
-	if (ret <= 0)
-		return ERR_PTR(ret);
+		snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
 
 	/* Not using strchr here, as strlen of a const gets optimized by compiler */
 	soc = &compatible[strlen("mediatek,")];
-- 
2.51.0


