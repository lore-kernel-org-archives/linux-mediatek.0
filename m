Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A0CD2444F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 21:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+l713dFhBMpKSXKC6Fm7N/NzG3LTu7+MrLDSBO7iRI=; b=3SVZ2U7MCoWnRW5BveUX40KU78
	7iuyXxhGJK4kNUb9wQIAOxxixtLiVFjDQq1EbSc9MhBxtlrHAtZvhvfocZ/GVnIwF1u/eodSA7arF
	cHvll0NalZ3M/U32LoPq4aKxcapEHzGMaoI1G1IVFRIIMBYh1Hx3BeOwOIErKailoOSqJOWU443x1
	waQyFB3KR11c7pZtG4UoKF7kXAUj/uvLJJuQsFaO5XgQfgsFnC2Yi5NK10f5j5Xg+PhHBFjWPrjhl
	y8l9PcOEGw18PowJyn5AxYLc3NW2ckycGrPy/kN9F/dsF7RA1QE5RCaUhVdXzprvWRlLP086ToQf6
	o4HUUnqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0us-0000000ER3I-050v;
	Thu, 10 Oct 2024 21:41:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0fz-0000000EPA5-3KtP;
	Thu, 10 Oct 2024 21:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0+l713dFhBMpKSXKC6Fm7N/NzG3LTu7+MrLDSBO7iRI=; b=BFrpG32UpvfG0u3yrjTGXGYLYt
	ue+yNS7nOPPJhRTVxL9ogUkO7jmZ2YwcRBiwcIEYlrQwJssTbiTSxjqrgjWy21eadLgewhCc1QZgD
	E4+Cg8UrdOuaHYR1iogEBh2yIOtPlREIlMa6EXL/aw0wHJ0XmqqyQS4KK7B2HSSN1I0IMRiwEmBVB
	R2W6WK/c4ronhrw38+PYTLkEJ+pPhTEIGtx78O5q9i2xQ/gq3fQMIf+h+hn+VLP2G2L1DmolyiG4x
	AbeI8A4ragNE23N8byRYqF0CmZzFG4ei1ycPh7t5i4T+r9f+GT6SdoIy5GXcrhBYn1jQDCCiqmJad
	PPo/R2uA==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0fw-00000005fg7-1eVs;
	Thu, 10 Oct 2024 21:26:26 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-42cb57f8b41so15127245e9.0;
        Thu, 10 Oct 2024 14:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595582; x=1729200382; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+l713dFhBMpKSXKC6Fm7N/NzG3LTu7+MrLDSBO7iRI=;
        b=BTV/YoV+Yj8LirDi5yZ4KW4t0sYCFAKPslcet4KPymGyF6DnBwemTlFEj8EjAbj8Vj
         L7TmPJ6BfwVJcyAgguaqzdYKj7FpbWnjNLZaY1jXUrdFS3Ycmy2Te7Ou29LgDQEp/dTK
         ha5YWfJhsVHGuTAvd6VsGdYGCRtDsTjuySje0eBYKTx7++75Gtzs0tlMphYSJ6WwQ2JJ
         5qNwLUj5bmEHFdAE87K92o0PoVkdtuPn73ii84kcI1uHWT9gWpA2pEuXts5EpWSxRBlU
         g6M63acm0cxbwYLsN+yhLttNwagBP/bx78PliAGKl7Fu3zRuOtHMEixuuhlepX8Z2Zul
         KK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595582; x=1729200382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+l713dFhBMpKSXKC6Fm7N/NzG3LTu7+MrLDSBO7iRI=;
        b=cnaYu+EbGYK0KaCKifarTNHomKNUAosjptd0/yD/cli7n2db9uGliAv8t6nCbnY9D8
         Gu+ES/w/I68UTzlVQkjL4R82qYP1diJN7PDwiXfZlFRBxcIVtJMBhELwdHGeki0CcvnQ
         PavSVFlV/wnYiCDr9GO8PUKWQSZpC99s0epsqQk10AqX5hEju/zAiXAvzgLt+GzSXabT
         r79Q80LTUpUJsBCXbJuhrJuTkOSIy/8Lt5IvtxFvMC8NWRLfCJ794Hx6uBfZtAhXes9e
         ZDrCI1SCNiGE/BBEnIL2XQrdmNzbaRLyF3ZAUPwIVMXKhjWUiIl427N2W6p9Xia+km6U
         U2/g==
X-Forwarded-Encrypted: i=1; AJvYcCUC9Toratg2T62IRzfG+6WANjvlVGokw0bQCZYm7ABbEW0Q3iTo9Ix4Zdsqega2b1PLBeiJ0jAj5w6tHzELWV8=@lists.infradead.org, AJvYcCUOUWCotyJ0qDtJGKdVngkio7Si2S7By2MK3AI7ffwzoSepV8G3yx/88yF5uXDYKHeHH0tTGXsS/DdCFUdCpc4TFg==@lists.infradead.org, AJvYcCVtMC5Do5nvAK26ON+S6nxhU1YzKADHY5ZlGz1+gv/0w6QhHjqQtGpFawmcmeij7ELoupMM/Zz8eH2kc1DYYGkN@lists.infradead.org
X-Gm-Message-State: AOJu0YxwN2tJo0PIu1xtX9z6lLUgeaYyGsF2/7SSbKfjFAzaZ91+hnhD
	kJDk/SxiZhGQP767HppVTpuBVguFk9JaHZ6j8wAdDXCgx65JFPzz
X-Google-Smtp-Source: AGHT+IEvJZkGPBj6pO8V1hiWxBTo3gFi3FsJ4y5Lja3Q/V2mIy4xGoBh/d2/6Gut5mAv35qY3Oj9lw==
X-Received: by 2002:a05:6000:1a8b:b0:37d:511b:aec1 with SMTP id ffacd0b85a97d-37d552adfacmr460647f8f.45.1728595581715;
        Thu, 10 Oct 2024 14:26:21 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:26:20 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 10 Oct 2024 23:26:00 +0200
Subject: [PATCH 10/10] Input: ts4800-ts - use cleanup facility for
 device_node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-input_automate_of_node_put-v1-10-ebc62138fbf8@gmail.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
In-Reply-To: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=1226;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=4o2z0ObAz6CPUNa+/NOKjLjAT/4Z8Sf5d/THzPhhJlQ=;
 b=8IHDkQJt0RQQZ7gzCWiCDhKjk3wcdMT+YxA0O1TzbbCR57WziNB1Lx4QOqe5AQsAbp1tPpiZm
 2LS//T4sNttBUuMfU0lGBv8RZk6/sRz5DdGS4tJGsn+V5T2XSOKEf+C
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_222624_641193_EFBC7A0C 
X-CRM114-Status: GOOD (  12.49  )
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

Use the '__free(device_node)' macro to automatically free the device
node, removing the need for explicit calls to 'of_node_put()' to
decrement its refcount.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/touchscreen/ts4800-ts.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/ts4800-ts.c b/drivers/input/touchscreen/ts4800-ts.c
index 6cf66aadc10e..98422d1e80d6 100644
--- a/drivers/input/touchscreen/ts4800-ts.c
+++ b/drivers/input/touchscreen/ts4800-ts.c
@@ -110,18 +110,17 @@ static int ts4800_parse_dt(struct platform_device *pdev,
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *syscon_np;
 	u32 reg, bit;
 	int error;
 
-	syscon_np = of_parse_phandle(np, "syscon", 0);
+	struct device_node *syscon_np __free(device_node) =
+		of_parse_phandle(np, "syscon", 0);
 	if (!syscon_np) {
 		dev_err(dev, "no syscon property\n");
 		return -ENODEV;
 	}
 
 	ts->regmap = syscon_node_to_regmap(syscon_np);
-	of_node_put(syscon_np);
 	if (IS_ERR(ts->regmap)) {
 		dev_err(dev, "cannot get parent's regmap\n");
 		return PTR_ERR(ts->regmap);

-- 
2.43.0


