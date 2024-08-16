Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E937C531DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 15:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMXjCi1nWSGJw2HEGXaKpvGQBWqmSFyvM6Rv3lJzOnk=; b=O0BYx6ww2spVBlTS2v/eKL9pTj
	S+icia+xmTLGf9yDvoGPn0aVbhalXZ7UxuLLkrIaguURtiMbUOd66Uxmby8lOIzia3Tut9/h0BHtB
	FZB1Hwkz2A1nX0JNunojleuEC9O8fXxLHaMbTUKtYdSLJkC2zXeUBwIgWtz/QfARWxgvyyf75gIce
	Ri3id3JAcb7sjyX+m9A7KInFLYUi4iQehEbyclPrprPxwxHJ8FkiUdddcOCYRMi/2boHM/L+vOp2s
	bgOv4nLPgxLDlWnXQSVPRr9ZJSoKL3CowsbXkMuLW9eFnrNTu+dTY5nbs6DwluxifWuOs46hQXXVf
	hTMW3+jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyyP-0000000DPVn-0bS4;
	Fri, 16 Aug 2024 15:34:41 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyvp-0000000DOXr-1fLo
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Aug 2024 15:32:03 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-428163f7635so16675875e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Aug 2024 08:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822319; x=1724427119; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CMXjCi1nWSGJw2HEGXaKpvGQBWqmSFyvM6Rv3lJzOnk=;
        b=FiCc1Uw08r3i8LRMgAxi4De0foD9OfCmRiW+Fs9mk/j3Psl43RBXZWVRRygxB3koC5
         R7mkbP40NBnXDXC4MWqANJxnTGt5tXdGUVI1NFBWE/K6opyKmXO+bzntghsCrRJ8wSUU
         5fW11VQr+F02Un4nBh7gEkIWYi1OsXNwrpSJu5wHqd9eeaL8ppHO+uZYiJwgzoAN49iS
         EAywutjWgh/Yhqu0qUbKreB6MFIK7/PCxJ5ttmqxKH/bobjcnxun7ul9lg+xjpgqgRSN
         ItI6A0FQjCYpx1W/ukkWRf4/0jdnMKD9mJQQorU5C6seLlf2DnrRnQ2DCmXmjxbTVfjN
         hFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822319; x=1724427119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CMXjCi1nWSGJw2HEGXaKpvGQBWqmSFyvM6Rv3lJzOnk=;
        b=N1+ARCaxzaE23pEVERiX8xkyZws/kIZXM9QUOu4oZWM7L/1vAGooe3pyyrG9+Cg1tR
         JrdPg87wiffk41LRMoMw4RY55Cj6DPlgR/mhdHi60z7l9a4yh8TdUCpWW0GmJFLc/1x5
         ScNMH0kMO5Z5hre6og24C+HiaPsJMDG8I5LSP55ye0rhJFv1VoqEQDyNU80LHR2Oi2ln
         CgvX1TpGAdkmIr3TjO+5Y6HORl7yFl/sKK3qsS4FFU2YGCOr3tum4GHMBJJR8cSBnhMo
         5CAbJR/XfuJXYKs+CIu3XTodDSLNK9ViKWzGg8nuqCqpIlxnpFwFyMBybeHkSjz0zct8
         n7QA==
X-Forwarded-Encrypted: i=1; AJvYcCVmu3Iy5rEOTTSyljax/5Jza167N2QJGcpGMEhf0Np0d5PKV7cwXG1I4AF1feG6JIR9IGpje/yQvO/pqFaO7vYJ6MTiWLXOO9p1+BQNYDL05zWT
X-Gm-Message-State: AOJu0YxJd61zTHqofHYce/I9faC/jx3IPk+xx0jkKQMyqc4QyqrZv4g5
	Gn/TjqdUpviMJJS0Faev9DFZ+kpzOhziaiTPOvSQbOCY10JWZYiv3U8brD3NUoo=
X-Google-Smtp-Source: AGHT+IHQVp9RMVKnFXRmolzPy8dcbt7NmXN/jroL6chg+fDJWYg7uMIzfeBfP3NPtNgAOQVI5RxN+w==
X-Received: by 2002:a05:600c:1987:b0:428:9ba:39f with SMTP id 5b1f17b1804b1-429ed79e212mr21385555e9.11.1723822318959;
        Fri, 16 Aug 2024 08:31:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:31:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:35 +0200
Subject: [PATCH 03/17] leds: max77693: add missing of_node_get for probe
 duration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-3-1d0292802470@linaro.org>
References: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
In-Reply-To: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Riku Voipio <riku.voipio@iki.fi>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1838;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5KMyb/0ghZiWoNxxGIN0+j8uXXpKKlWx7oozmJ4CEcs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3DbVDkrgpNCWbqNPXUp9YCFjKcR3EI+TV8pk
 PJEmPek6O2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w2wAKCRDBN2bmhouD
 16uRD/9jJHb7kLUKzwpJD2ZWds7O67ALfXb3ZP6DUa7effzfaE+ihgB7WVZpKDFSz4Ynnq+GhzC
 SD7hYFMiD1dlIU45EiowQ6w17hk6OGGckkc4oS5UDLJHqO38ddcLxZMtxjHDGR8DPAIRHYRRSCV
 aeJF3qb6rx4DHfiGx+7HuYGQahBxc5wQO7aUmpD+tKb30AdRIIpxWoRL34DC3QyNlAkpBwXC34u
 S8wYpbf1rQQxBswNLYYVojtvNJmVa+/7G4urNcX3L2t5N9Ocz78wJ2KXKaJ6PmByMd996E0Wi2c
 zM3+rJPt//QRSatrCP+YBcu9vxG86z9Ssu+7kV3vDNkYop/8zteJ8ZUPHPgVNxvBuFt0JLzL8QR
 39T+Se5p7DgKy2U7tH/cp8FZ8cwH87/8uXrGiwhgi5r6tn9THegbdFj1ZwKt6Q4phJpPKJxglY6
 bWKZfin1lyWgHMxA++9MV8mY7GtZ+lh8kRrvMJWq+Y9eva4qZJlXBk9O+Fu6OLzi+fHGL65R2LX
 JTUkAzxdPa/proprkZCnXopEdTizjxhet3j0QeFnBB5lAtMSuUttFIZKMxZg0OE96gq4JtVmGMy
 56lHesBi9ptFlDGB2uRlD2OAXJ0+NmuyD0GOY548/WByuED2YjR12ECGeD4jD7KlanlFHSgqIAE
 FqnXEfx8WMfK5ig==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_083201_674244_84D5FF56 
X-CRM114-Status: GOOD (  13.50  )
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

At beginning of probe() function, the driver iterates over OF children
and assigns found device node for later.  The code uses
for_each_available_child_of_node() which drops the references on
children on each successful pass, thus the probe function operates later
on the device node without holding the reference.

Fix this by increasing the reference count for found child node and
drop it at the end of the probe, because it is not needed further (the
V4L init code takes its own references).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/leds/flash/leds-max77693.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/flash/leds-max77693.c b/drivers/leds/flash/leds-max77693.c
index 9f016b851193..16b169e658de 100644
--- a/drivers/leds/flash/leds-max77693.c
+++ b/drivers/leds/flash/leds-max77693.c
@@ -649,7 +649,7 @@ static int max77693_led_parse_dt(struct max77693_led_device *led,
 			return -EINVAL;
 		}
 
-		sub_nodes[fled_id] = child_node;
+		sub_nodes[fled_id] = of_node_get(child_node);
 		sub_leds[fled_id].fled_id = fled_id;
 
 		cfg->label[fled_id] =
@@ -968,7 +968,7 @@ static int max77693_led_probe(struct platform_device *pdev)
 
 	ret = max77693_setup(led, &led_cfg);
 	if (ret < 0)
-		return ret;
+		goto err_setup;
 
 	mutex_init(&led->lock);
 
@@ -1000,6 +1000,8 @@ static int max77693_led_probe(struct platform_device *pdev)
 			else
 				goto err_register_led1;
 		}
+		of_node_put(sub_nodes[i]);
+		sub_nodes[i] = NULL;
 	}
 
 	return 0;
@@ -1013,6 +1015,9 @@ static int max77693_led_probe(struct platform_device *pdev)
 err_register_led1:
 	mutex_destroy(&led->lock);
 
+err_setup:
+	for (i = FLED1; i <= FLED2; i++)
+		of_node_put(sub_nodes[i]);
 	return ret;
 }
 

-- 
2.43.0


