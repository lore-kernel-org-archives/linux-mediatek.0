Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AC6C3601A
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Apr 2025 10:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jM702IHJZgWY+bz6KCTgaeHyuuKyyx07sXK0MSiTh1k=; b=iHHNn78LwyrRqhZgM/o4YrFwWD
	W5YSaamB8XAnWie5hiJr70+he03wTTE1WXcVV3NZtHwczY+evy3e5zm28ZPPhIpsnLC0FY1zXHvZR
	ZbUA/c/uqTzVhXA3XF1WYRAs85nT6ez7JykgXJ7ceMazLEzvettL5ugRqZZjlAbQwF06XtEiGsr9u
	xLbNL4M4yNieMOXkW33jhD67Me9v6VMq1lmVc7ApemKTgUNQnmpbexsdaePK/yS50XRHEAQfUdvGl
	IFWCm6DTs8wlb/KW2UgSa2mn29Av9Uyn+tkro0230IEu2uo9gCrb1Dk4sh/TwoqvSktGRMMVrzYi+
	JHF7+gAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzviY-00000005qSm-2L23;
	Wed, 02 Apr 2025 10:53:10 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzvgp-00000005qIO-0802
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Apr 2025 10:51:24 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so1112171f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Apr 2025 03:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743591081; x=1744195881; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jM702IHJZgWY+bz6KCTgaeHyuuKyyx07sXK0MSiTh1k=;
        b=EiPahM50kfixUNrgWK/8Dawq9kcoZ2cL9MvtbvUMeC/A6m973pi0PMaOCJgXna/xMG
         0Hg93AFjFUPZP+umIi8Mh8BTNO1WjOub+MSHOvU4ETDeGOicBWDl18/QrQ7s+zrTFk3f
         Ywl4RKY8VcGPBXPdKb/EmVLP0w90DQjY30lit2S0oU/CHiaZ0iGsojRyJtwoVDcMCTZ8
         v7yNGRPq1lK4FqCRI/sQwVmG4d7LuetqLhiymPu+Qa8YZCzLj6upDdUq/b4MzWEmaTeK
         Tj3U26cbEO9h/gvTptzznQcmB3hrVhesZ8eGrYKcf98o/vpBw754ayKpWGZPocJSIlmS
         bD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743591081; x=1744195881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jM702IHJZgWY+bz6KCTgaeHyuuKyyx07sXK0MSiTh1k=;
        b=EusK34EhVobieDOSPDvM7TIurvZDt+QNbeHKXo3o5jypqD8rqd9S0Alrg4j4TXLdrG
         y9nZ4PqfO1hs/wOnctoT8yJt5bhRWVM2h4N6ekKkqhqcpJ8PF5avXr6aE6HxKR04oE/Y
         au+Tml895GB6TMH9d457wEbtsVCPncDPcJUchHVJ9ujAqBKCNseGgxPyzxjnSYyh2bgw
         uBS5gk27ne3CypPWvAJDaw+qaKvcZUu67NApuxgQSDHGFR0zG0PU600HrLLCsfeWPSwX
         BJb23hwWwUb3VPPBC8XePTl7egloS7Ovr3vquP5MqkYa6CKNGQAU6c+5bpPQZeGcn2Mp
         S8vw==
X-Forwarded-Encrypted: i=1; AJvYcCWDPOLasmFddy8tcyHaVwVb6Mhwd0T6QV7ozcLHJTDfIjXSbKN2lmmc8D+l7ZyBSGh4s20v+jaF6pjVFbaZSw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5u0jHa06vSAb/fG/g5Pgy5vBtzwXkYxYii5OksEvnOHED7J6E
	yE1LiVTDcyS5co4k2Mnh+4AAwq5MB45bayob2rls8+6tn8GQVeLB+CNqAuS5N5w=
X-Gm-Gg: ASbGnctdtLT4Cx6vRqZ5w0NVAkFmpI16uM0UBygX57BQQaktd2DvS8sViXSiWOhz1ba
	opv6pjbrAK0Mdi8v26nFLTSxlCqLO1DbmV+B8816Smg3qfxS34v/wT3Qzt2suzkOIlKHmOjJnJu
	+0wR43cg2l8HeeSgqBU569BuMriPCzqS1+x42GTO84BExO/A32LFOrSHHrbG8cYVvZwc5lwd1lM
	bDlcI5vXuJQzs/h3u5ZOAMCWTwJ5PG788n0AeeLlxh3+mMDzKvKPzSo4OuD4wab/I4LtE8gx79d
	uiPYTf3woV6yYhhnkNJ9gmVVxsJy0MlN+a11BzBgPDobhV7N
X-Google-Smtp-Source: AGHT+IHFX4ZEIcE1aZQVlgxdshZZ58qTruQoF7kCcWbrh4WBDQPX8/67a4gnRmDu7c4Qlr6lUUYk6g==
X-Received: by 2002:a5d:59a5:0:b0:391:3cb0:3d8d with SMTP id ffacd0b85a97d-39c120dc1b6mr11880056f8f.19.1743591081602;
        Wed, 02 Apr 2025 03:51:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:b96e:56b4:f317:73c1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4239sm16849484f8f.94.2025.04.02.03.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 03:51:21 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 02 Apr 2025 12:50:59 +0200
Subject: [PATCH v2 1/2] rtc: mt6359: add mt6357 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-enable-rtc-v2-1-d7ddc3e73c57@baylibre.com>
References: <20250109-enable-rtc-v2-0-d7ddc3e73c57@baylibre.com>
In-Reply-To: <20250109-enable-rtc-v2-0-d7ddc3e73c57@baylibre.com>
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=888; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=kapZgj+SJrEW/7vg45el3XbqPXPyGqqzv8dsBko1XSY=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn7Rak5IWC3xb2IP9/KDZQCL9AVG2vNEYj0BN1MrkE
 IftGCGeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ+0WpAAKCRArRkmdfjHUReV7D/
 0cLHSn10CwEySMB8HDoWMVHV7DniaF+s6ri1VtDU5Z90ujzhyoNjYpW6ocn5hkkDAQkovJc3mB9HV9
 MxyDr23liQEY4Ga7N1h3WHDkvSrd6qW6ZzRq33lUvEyOWk1jECxAQ4fax5e9/hNec/3DDWs/nYPI37
 YR2lz60otwSz+oiIL/lYOLNWW6Gb4uQgYQDSUDQt+o6w3OTlXf0oOsFd5Gjm5l3O9kuKeQqp5hAHlR
 XmyFEY2LQFiJWDT8M+zHZ2f8v/zpLYeCGv/yqMRmu5NKFOGem3EMNAqa9+TJfTtOvDS0rYKT9easi2
 JFi0A3hhjRLjNxit5UFBAp8N6RzWqDvxcEJ/Kw21mj01/TG4UfXeR6i4xLyF5+o33SLg17jLdXUb4w
 kVxYfL/t91biAZPmuALxMOayH7g3Sr7wc/x9s+mItMOPThVPIzzped18FRm+RWNpWs42LqkMTHJtd/
 +dc5cRwLiif403QHP+3umO/GXDA78qlt+vRVM7RnYz8EFQ8xFazthZLFEwLMJgNwST/BXzLStxlMGE
 VufnIuLKEyEtIcUvh88iVNxHtSso6EPQ/nKOkaDEW75LgQ7yeTKmozCg2pt7yUp7RPWvOoVk4b4YJi
 Cut172ovjm6QfkBBhF+bl6GvF1ELcd+fxbhLvP7W4RouCdJMvQJKX20jkuNQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_035123_075120_7B8310CD 
X-CRM114-Status: GOOD (  11.35  )
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

The MT6357 PMIC contains the same RTC as MT6358 which allows to add
support for it trivially by just complementing the list of compatibles.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/rtc/rtc-mt6397.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 6979d225a78e4..692c00ff544b2 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -332,6 +332,7 @@ static const struct mtk_rtc_data mt6397_rtc_data = {
 
 static const struct of_device_id mt6397_rtc_of_match[] = {
 	{ .compatible = "mediatek,mt6323-rtc", .data = &mt6397_rtc_data },
+	{ .compatible = "mediatek,mt6357-rtc", .data = &mt6358_rtc_data },
 	{ .compatible = "mediatek,mt6358-rtc", .data = &mt6358_rtc_data },
 	{ .compatible = "mediatek,mt6397-rtc", .data = &mt6397_rtc_data },
 	{ }

-- 
2.25.1


