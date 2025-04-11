Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E1CC36010
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Apr 2025 12:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSHsj9E7pEVKPo/XiZbiTbb5aejzBmBA8Mzu2UJ7TSE=; b=JzZ2eA6K1tuR40+XvEjaA6uGeW
	8kxg/5NTTXS7sJssYJktl8uDYsItdX+u4Y4dTaLzSoPQ5uLmEbsSiMtuZWBMtVJujaB68A5ACCIwT
	2m+D3yyoWuMee52WaMut2ud1XyngvqdXxOK8Hfhn7AT/NxX52nDNiTYSbQCnSMCTdEa3sV5h5hZN5
	+shYAbnWFDNyLckMxvTP8E/MOWAGSYlN7w8z2kilL6lE2ZMsJbAmIZs6ogZt0C+fiL+5WiJa60YQ8
	W09Qjpm+7uJGuAp/nf0xPUn3zV3LqktlGEKdgrnrxbgzQZuWpJt+ahmu6iu2RUfRxY8ZMH3BlSCqu
	luLA8gRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Dqf-0000000DoCq-1GoV;
	Fri, 11 Apr 2025 12:51:09 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Dcp-0000000DlM9-3oPm
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Apr 2025 12:36:53 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-736c3e7b390so1731977b3a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 11 Apr 2025 05:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744375011; x=1744979811; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wSHsj9E7pEVKPo/XiZbiTbb5aejzBmBA8Mzu2UJ7TSE=;
        b=L7Nx/iDXo3FHL+oEA7JVlfYdjRvNYWBccVqgq6GIDF+fwZ+WcIvOU8q4vGBAXxo7xk
         ZjuiRXPj82AHFAwzSgGXglMAOO8kCdUNLUs07g5/FN4nDc5/IIkFHWCI1nkvpZhHA7d4
         I38uw5u0jEqzplBRiNZQbZxpCrDf64dDq/s4WRn3vAR25bAv8h3YYHKmJT5AvPmdzlQh
         VEVlkSZ5QXjzfpmuvsqvZz9st7JzI8lU6RROY/GzF+b88TY/L00DglTyB24p2cSbBMch
         gumFYPXRn4YfVQrDy7Ixw65gu6PnljrDTLgHjo7jOUla1ZvPpi2uYB7Py+grvI0eocOk
         uhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744375011; x=1744979811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wSHsj9E7pEVKPo/XiZbiTbb5aejzBmBA8Mzu2UJ7TSE=;
        b=LBzipqm4xOYAA4NVKHlngGRUOmSw5+LIQ8tu39FgkOoByCRgiwtw7bSTyuWLOMdwEq
         sl+N/hgkDXsD6NW8miy3Q5nb7tF9hj9avxtRL5yu+Jrg+6CSdtfX2mXGPFVXFz1z/e+v
         7UqIbI/IxdnVKi6rSbo8whuHEhIfLbszzqqgXfT50a5S9Nrf+dA/3vyfIuYy1SxEfWgk
         X9NIoWPFILLGhZsLQj2uKDkLddh8VtF9+bE/i2d4FBnMWOgWBd8re0rtmpSTUU8Hl5Wx
         SnfG1v5uCz/+5jeJkNuCuJbDMQh0DIHgNX4PjZbpz1v21/GBH4UjnR5fK0LRRF6NXpHW
         enaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV/EhwMSLTcXS9QE/5mfsb/SFv3P7W9l82RpPHG0+JwJ5y8W/dDwC5y1dX2klo67cOu0XjUAZPzCWiXAqAqA==@lists.infradead.org
X-Gm-Message-State: AOJu0YySnYzS8HNzMc11pJa6gG5LIZg1qfz/6S7Vs/YTfsBcvujWHjTo
	8fyXZS6pbt2ngSjZZv0yFi+cwhSXb3oDctqLaijATNQ5yiWuKgYnuAQ5WF9A4Eo=
X-Gm-Gg: ASbGncsF/55Av4LVOrg6TPIuVlxKI2IldCurykm91AUiPFFsJDzMaCJ1UdkJRGsfR5A
	O+dUcH9KJrIWOxXpkLe9DqeJYy3ZhSlc/gXuVWpSpYjPvfLM1SIMt99m7SXsBqvWDw95gQMFmN3
	LyBGg4BlCyBzs3t2+BtL8mg2KAGuyZHMKgpzkElnsIhmt/j7MDGkMEV25p7HIVcx3pA4qRqIEIl
	16vw+vyazSuYXl8RorOTqd/RBD73FJoznHJXhKmhClZ3RNn2lCZg4SrIouq4nHwf6ZnQla4IHfZ
	I7H9by+6DzwPOxXpI7MjIkFFDiKZc1F/RC+fHbHAQ+A=
X-Google-Smtp-Source: AGHT+IFfX3ot/L43d0QBZxG633pc/hZyXtl8UpByDyVjAeqVDIhCDU73ulTwgr/AGiuYBQtmE0nzNw==
X-Received: by 2002:aa7:8895:0:b0:736:3d7c:2368 with SMTP id d2e1a72fcca58-73bd11dc695mr3255714b3a.7.1744375010978;
        Fri, 11 Apr 2025 05:36:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:cf9d:bb30:5951:692])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73bd22f8253sm1408292b3a.93.2025.04.11.05.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:36:50 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 11 Apr 2025 14:35:57 +0200
Subject: [PATCH v3 4/5] rtc: mt6397: Remove start time parameters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-enable-rtc-v3-4-f003e8144419@baylibre.com>
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
In-Reply-To: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1012; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=trGJ+81hvgNk61JAyUi09epqF3tLwjd5H58jiE8ssKI=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn+Qy+LNjqc2TQncoR/fu21kLb3B4nDnpKBpYpF3u7
 K+vKNHeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ/kMvgAKCRArRkmdfjHURUBLEA
 CAC42jhzXF95nwzYaBzqk8pqi2wLrVXoH4PBA0deKY2gEdZoIl9sAOEFMAke8ktBZFrY8zyD3Iilcs
 oByCGpN9m/wQ5S2Ih3Us5gmmwCkWz1CcqvUeMk6aOzqC6tnV+SUW/WHutDoEzQrS+Y3hbbq8SCf628
 TxVPv8tc1AaQc1RRi29L97urd+zi8P2/ucYydlvR0VnVd5BEd9ve7obWrjiwfWA22tckQTsOCO2sAB
 z+j+DbUM3nWqNIVBRj+hlyQOkgxl2NMLlZYfY4uSdJjl42PBffIMp2plpK2m2DZwO2b9LqYtEu33Xv
 qKE/nKDGQK3kUPIQqDkgZpXsg8YdsCSkn09ne3NOpGaw4S8q306wT4gViU2OyQbq2jDy/+5X3WyH6r
 bswFi1Fwgg1sefTSK+B7S/NhI8rhjGYcRxNj7YvLRwGEu2bzNW8KwkcQWYjlF5FAo7lfeuIizrxfqA
 OLV8tKAgl8ncXWKuHgzKKtYqaJzfA2aJXrD6yK5u3U9aNlVe5qbOd3r10sFURDisAhtuCm7fURJqHx
 JC+aHpfgCVZUB/fiWVkYOXBkyeKLsx++ZOoMa2Wi8/mg1CSRWFX0MERFX6a/9stWB7mb3L0L4McAod
 KlRc9GKCciMymJ4QFkvBsy0p0HLsmyvqgdUvtv0sgoLe96aZBCXhM1PiaHFQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_053651_949954_34A1C342 
X-CRM114-Status: GOOD (  11.27  )
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

The start time parameters is currently hardcoded to the driver, but
it may not fit with all equivalent RTC that driver is able to support.

Remove the start_secs and set_start_time value setup because it
will be handled by the rtc_device_get_offset function using the
start-year DTS property.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/rtc/rtc-mt6397.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 692c00ff544b2..d47626d47602f 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -291,8 +291,6 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	rtc->rtc_dev->ops = &mtk_rtc_ops;
 	rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
 	rtc->rtc_dev->range_max = mktime64(2027, 12, 31, 23, 59, 59);
-	rtc->rtc_dev->start_secs = mktime64(1968, 1, 2, 0, 0, 0);
-	rtc->rtc_dev->set_start_time = true;
 
 	return devm_rtc_register_device(rtc->rtc_dev);
 }

-- 
2.25.1


