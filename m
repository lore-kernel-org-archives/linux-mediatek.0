Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4C5C7EE23
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 15:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sLmTrczoZ4J6h066r40/h6RRWtVqrmn9y6L7z99mhDA=; b=2+k91urArwLofrmRSQmTbbWB08
	5zBQ8M7FFHLXgdI+k8q9Vpn+CByGC1Arg9ZH11ZCGB5RbbRE3Nm+ImpER8rr0BaeP77yGfEQstpou
	e9FFsEKnUn8yiTi+Ve9xQQpJ/TQPClrFoUDEiS8WMiB+o98SYlABu1GN5T9uVl/GgpLfMM149Oj7l
	pcFnJdqiqKwZsz824Emk+Hwd9IGqoYBsNAfKiIdfpwGnxlkKkzBEmY8iIlY6kc2ItfWx8NBpBJ/jk
	KCYqCbDQ4IQV9kMOh/V14hyIorgcbsOxs/PwQMgos+uVm0UibYicM9g8+byLtQ3blQP9S0Ob+Vu9B
	gFedeSIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q17qT-0076Xj-1j;
	Mon, 22 May 2023 15:53:13 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q17qQ-0076WP-2l;
	Mon, 22 May 2023 15:53:12 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-7665e607d1bso91130039f.3;
        Mon, 22 May 2023 08:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684770789; x=1687362789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sLmTrczoZ4J6h066r40/h6RRWtVqrmn9y6L7z99mhDA=;
        b=lpf/KCk2o5YuPZx1QBrkgf1w2q7/f7AMacPCaayBzf0ydgnri8mN4UPzfhfTEkoH9g
         Hiv8S4T5u3nWXvti74xZiSj5Up4Q7GDop3mGqtiO87mKHzrWX5WznpPrPp0r0ynzZXZz
         pqMa/67Z5Nxj8aYsAeweBTxyes/LbbbPrjbZd1KRBcxwidCrTVz3vWow0avbSOsknIFt
         cwu/wuM2Oimy1eKg2Ksa3NHd0csEdRQClR+WZ769yhGOk8d2Top9MW544F3qyyD+ccqh
         IefbqvVrMmrA5hnsUsFyQD1toOeR0mtOHtCyg3npZWsab1uH3/2IZbhmh0NEjwyT9+qk
         KZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684770789; x=1687362789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLmTrczoZ4J6h066r40/h6RRWtVqrmn9y6L7z99mhDA=;
        b=N9CNXZw2YfzZykS7JT5ZkQ/I5qzWSUD30WaUfpAp56/Eq+iNJXL0k0o+zDdpUjh3qO
         h25DoYz5b/szuFwG8w3iIZcxcye33ige1TpEgzuDDrekR8DLuGmNfUxoVWWz0W235P7a
         9EhGkXhIAPCreil2iCwSYo3srDWUcrVFHDk0e+n23x67ZDtGFtvjeNefuoZ78WcyaIbR
         NTZ7jkGXPDyuCCVIVGh09P5SDNRVf33xc7cVqzSbJO1JkvMvfnleBlv92ZNdODC8r4eb
         HrER1gYGmlQlhv4YGagja6U6ClAfqE8MzHvVq1w6kCTMMkmKY7z3uqKre7yYk8Jlco9w
         4mAw==
X-Gm-Message-State: AC+VfDyUb5QO2DkL0d11epatu4TwaNbNvuDeGpz0whCTk1y9e0oLcBsv
	AoGw/m+4c0OPl9Dj8laNGqo=
X-Google-Smtp-Source: ACHHUZ7Oyjj1q6eLDUndWseC7ayiIC4Ona7A2tWc3SNYqjyQ+KripQZ9DB1twIxrC82af0kBQVhI2w==
X-Received: by 2002:a5d:8ac8:0:b0:763:a8a0:c7c0 with SMTP id e8-20020a5d8ac8000000b00763a8a0c7c0mr7033861iot.10.1684770788928;
        Mon, 22 May 2023 08:53:08 -0700 (PDT)
Received: from azeems-kspp.c.googlers.com.com (54.70.188.35.bc.googleusercontent.com. [35.188.70.54])
        by smtp.gmail.com with ESMTPSA id a1-20020a6b6601000000b007596db3874dsm2016483ioc.35.2023.05.22.08.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 08:53:08 -0700 (PDT)
From: Azeem Shaikh <azeemshaikh38@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-hardening@vger.kernel.org,
	Azeem Shaikh <azeemshaikh38@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm/mediatek: Replace all non-returning strlcpy with strscpy
Date: Mon, 22 May 2023 15:53:06 +0000
Message-ID: <20230522155306.2336889-1-azeemshaikh38@gmail.com>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_085310_893806_4DBF9A0D 
X-CRM114-Status: GOOD (  11.66  )
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

strlcpy() reads the entire source buffer first.
This read may exceed the destination size limit.
This is both inefficient and can lead to linear read
overflows if a source string is not NUL-terminated [1].
In an effort to remove strlcpy() completely [2], replace
strlcpy() here with strscpy().
No return values were used, so direct replacement is safe.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
[2] https://github.com/KSPP/linux/issues/89

Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
index 2fc9214ffa82..4d39ea0a05ca 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
@@ -295,7 +295,7 @@ static int mtk_hdmi_ddc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	strlcpy(ddc->adap.name, "mediatek-hdmi-ddc", sizeof(ddc->adap.name));
+	strscpy(ddc->adap.name, "mediatek-hdmi-ddc", sizeof(ddc->adap.name));
 	ddc->adap.owner = THIS_MODULE;
 	ddc->adap.class = I2C_CLASS_DDC;
 	ddc->adap.algo = &mtk_hdmi_ddc_algorithm;


