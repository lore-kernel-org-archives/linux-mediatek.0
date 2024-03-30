Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01E7CD1290
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Mar 2024 20:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gkvgtJfZLFYPx9yFQ6Zl+mYWhCt2xCc9NZAo+ZUMPsg=; b=P/t+8kkN4Kgvkd3K2U1wQV7YJX
	UdbGHX1h4VFvZEm6BRCV2RWUmCrPWRtHnOW63XEvDnIuA/GWAhilSORESOpsJbdr85r5ji8z7vDWy
	e9j31SVEeQrICuW5PL+UKBao3NQoFR6udzFAyLFSUf7mIdeJsAfhSxw+GYjcJ/TESFdlpDSsJH9J5
	YQCUXkIeipj2TUYk7M6cxN3KFdmHiI9sQHO9ouU/qtax3/S9Lv0Nr4oh4AJXihk7P44I/ObePnKcs
	ZTE7SmlqlErNy9a3TUil2L0jv8mjOVHCGHtgY2T8hrZZr/e6Q4IDAerV40SruDBSam7XdOlbSLnkS
	wdVaRswA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfYJ-00000004By2-3V0C;
	Sat, 30 Mar 2024 20:43:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfY9-00000004Br0-2hqH
	for linux-mediatek@bombadil.infradead.org;
	Sat, 30 Mar 2024 20:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gkvgtJfZLFYPx9yFQ6Zl+mYWhCt2xCc9NZAo+ZUMPsg=; b=LeZUrIQSJOttxLdqEn88HI1H3f
	kNnYN/u8g9B7A9bhZXdHy7eSPYjcsZyp6bxTQO/dH//4GDOvxls2vPw3V9SjhTTCd+sF5ag2lVhRb
	POGsyINLIxSQaOqg7DF1y3pNQK/MQAzr6GskV44G3hGH8WpmfGWuhEsVbY+MA/VugORwLYFsUHTRX
	d19uuC/FeqNFUgJMWDztVTjry0yCCuMFt55rOwcOLhaahYjK3/4+DxLqlF/X6yR+Am30t4kH4dRhT
	ph9HzfkdH0GyU9Kq9vsUWHmtWoZ0uLOLe7dowotxqWxkdiXxyHCOaGIZGcHqLIQpsNSOSOlj7i2a3
	Uf6gNSdw==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfY5-00000002EGT-2xRt
	for linux-mediatek@lists.infradead.org;
	Sat, 30 Mar 2024 20:43:36 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-341c7c8adf3so1993597f8f.0
        for <linux-mediatek@lists.infradead.org>; Sat, 30 Mar 2024 13:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711831411; x=1712436211; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkvgtJfZLFYPx9yFQ6Zl+mYWhCt2xCc9NZAo+ZUMPsg=;
        b=U7t/7dos5MQCbj4w4zibLQDCsOZLA5ZcuYdX5adw7CpiTPnaoqOCl18Sn4mUK+y59b
         UzMxuCrlbQ+Tkl9hi6mpKTncOTlWLWoMP1W4J9zXumlC6yllr4kGNU3QrjDt4lbMnUuc
         UC4djMVPbPpjHjf/wFdd6/qiDxOYpE8VwBtPfD2n3uKKq4oQw88L0BoXlYMfm3L+l9xt
         ysjtcIZwmvlkK/LsE09xRGFk0rCJ97x39ARdUyskfWH0A983XajYtkidxKXLGtxpKx5K
         K2daV1+OG8yMF90b41MnFtWr3aDcrwW4T60fDf5VVsiZxYuiC2WoQRbSz+eXpVQ+G1GJ
         vIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711831411; x=1712436211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkvgtJfZLFYPx9yFQ6Zl+mYWhCt2xCc9NZAo+ZUMPsg=;
        b=wnp+YJe9xAgyK5RCwGIsE89ONPfoKuxYkbkXYkzJqDL52H2tMUzwtP108Fm5hhIuav
         NcMvLvCU7e0V7XAhf2LIG+P17gEGWmczifvvbfanhvIPoAG3+uFecG1zDXevlaxv+G5p
         jm7A8vhS3LwpIYgp+xaYeDjdLJxd36yBWsdPsnZVwoY9GZNZRILIlj6hNT+nvXOntl6R
         8YnsDqkHvyQA3EhCTeh7DgtD+YJZNPPF8WKlDaq9OPLtACPmotDusJ4wTRcYZEK4DHp0
         GE9QKJQNHMpCTbc8k+UnhP6wpNZYMzj4SsfMjh14T533k8beLmKbQ4qU3bgx1TR8VHjh
         /6AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTekuuXJtowWC3iftBGdswvep1nLpnAMpdVzDuLc91S2N1U5XlUBSc6/tHn+rp//BXPyVsw6fgDqD+qBz0h3IVXKSBqBZj4+E2gMNwYAMiNF4/
X-Gm-Message-State: AOJu0Yy1GcxD9YHQnHuLtPu56Ocs/x+ffa7xh5IfxdAcYDlLo87XGkZE
	DqKsnPRaFMTtHY17DAHuX6DZ6KlNV0XdZSEoJ69JcEUvxL2khy9jJLBjNQjXRQQ=
X-Google-Smtp-Source: AGHT+IGWOdTkC7o9yGgejAofbZqEmlVeJu8V+2qwkD7lOHPc0dBfgw35/iSYGxJwzZWGT1QRUhFf8A==
X-Received: by 2002:a5d:6a8b:0:b0:341:c000:5f02 with SMTP id s11-20020a5d6a8b000000b00341c0005f02mr3680932wru.7.1711831410817;
        Sat, 30 Mar 2024 13:43:30 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d4a8c000000b0033e7b05edf3sm7231299wrq.44.2024.03.30.13.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 13:43:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:43:13 +0100
Subject: [PATCH 02/11] drm/mediatek: ccorr: drop driver owner
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-mediatek-v1-2-fd5c4b8d633e@linaro.org>
References: <20240330-b4-module-owner-drm-mediatek-v1-0-fd5c4b8d633e@linaro.org>
In-Reply-To: <20240330-b4-module-owner-drm-mediatek-v1-0-fd5c4b8d633e@linaro.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=857;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=4HTnieqsHHDdbgAvPLUTi22tPknvvwpSzFloyS9LJ90=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHllHnjO2IXgcN6miz8gttSZeT0bPKxGg+MN6
 ZrEhreFAzeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh5ZQAKCRDBN2bmhouD
 1zf0D/9oyBUNxb4yW5y+lYjzW+8hIB36xGGFf78Pk2cRxdk4fUZNyvxpadpNLMu0Pt5tVSvGiRA
 vCWgIwn2Y1Q0qaYqio07hjx47/wIUzpMqXiZrXEaFgy/hPcuVh5L9bLBhqK2evNoh1S/foRQUde
 t7Xr5ANtvslUmKkaBnxTMdhKkrxWHm0zwo4gTH9u6Zz8tZAiKPLimKC9cd2o6qTAHZONztgoDMj
 0X2+stZuG5HnDhixW52rogHLxTxGOfRT8IySNI4CShMOutaBORFmo48nVsCKOGs1Y0alef5vqDq
 saQR+JZktEwuqfrPOMYOL2Sd5hUzY2IWVFHBoFyYwnwnaR0f6wo7qkySwkHpVBqYsFCyrhS/fN2
 /mktuahx18Rf+zNlAruZJzoRZwuTl6Vu0E75RheuK0ahrSjV5P+IeIfmlZh9YzWLTuDdwst5BAm
 ijpg2rOpAVtKE4B/E+7+k7XjoYgKQpfA/dMP+YWR27kd/F4oEpjxcoeryrSEsPKPwK/19zrwzk0
 A6gHlTT4k+98Z49dJhkOgmHqAfbMoMceaLv1jwSzlVJ8iCHIoHu08hsmz3kTcAD6rZgor6Wa2W0
 ZtBPqX7oPOHeaI8XN2WZ5/DIrzq+NqCI5FLDYv/+6N4rFi0i+AoOc7M60jCvG3HPue2Cfkt7PuB
 WRWLu2iUpD5fhRQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240330_204334_126100_8D4DC9F0 
X-CRM114-Status: GOOD (  10.43  )
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

Core in platform_driver_register() already sets the .owner, so driver
does not need to.  Whatever is set here will be anyway overwritten by
main driver calling platform_driver_register().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 465cddce0d32..ff56c20d4e21 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -214,7 +214,6 @@ struct platform_driver mtk_disp_ccorr_driver = {
 	.remove_new	= mtk_disp_ccorr_remove,
 	.driver		= {
 		.name	= "mediatek-disp-ccorr",
-		.owner	= THIS_MODULE,
 		.of_match_table = mtk_disp_ccorr_driver_dt_match,
 	},
 };

-- 
2.34.1


