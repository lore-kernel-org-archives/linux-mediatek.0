Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571DCC369DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Apr 2025 14:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bQYI98eNYPuBxf9D7Ml3+p+5IYpNd9AgbjcYArr6koc=; b=CLPAfLfXYIaaK1osJeL3AoC25T
	Tisz3bhhIhvp/1yHtnYRydePyCm105/qG0EexWleBWcho+aQIApO10/DeijqINBt0DNKLqtw6r7Aa
	aQte09/vI/oDSLdsWB0xH7+4omC6iU0CJxbDKWBQAfLx4FeSjckLWq4IEtQBmwetHZPe/VMhuFRou
	AO4v9IjjA2JjXk3NGMXo/nrBTRYIOCzCXmxmJKHFGZS5jTX9TR6rA2jUgM7FTik5MpxWfOcM55EPo
	6VJPq2wPIxEiJ3XfF2tostWw867VktY4Ag8OSUQNv31g9aYvRkCRxD6rPoWkh1iER9swKYgQ3Weyz
	vfhFcYuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9PXi-00000006e5z-0zVw;
	Mon, 28 Apr 2025 14:33:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9PUl-00000006djF-2IoI
	for linux-mediatek@bombadil.infradead.org;
	Mon, 28 Apr 2025 14:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=bQYI98eNYPuBxf9D7Ml3+p+5IYpNd9AgbjcYArr6koc=; b=jCU4hGxwoXxsPCrWqQsdopohg2
	aLJqc8yF2/TcpHyESN0sGBrQnMFLFyCmRhlBAClNpm0L6X8Dc4jVSsMVjS252Rtn9klwLBf8Ie4bY
	iDY/wugyKoUJBG0/Vut4bFfHhOvjNHXou8YhfLGEvbm5D5GllrUkxxp65b9tuAklaphWjZlDNQf91
	a9mBUY/3xTPWDveM8EVcQNRwujEiixWgnuhVLdnyDNTTr3KgwsRUn9gNEeuJi6ImlcS9syonbKEk6
	VMuKbkdzUREmYT7y5MsTZBM98sZ9VFNxFPdkvsfdysemw3KZQzXR8I22wGfjNYEt2cm+zv+t3nIp7
	/CTkS+kg==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9PUh-0000000Cny8-2qVQ
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Apr 2025 14:30:06 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cfe574976so33561905e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Apr 2025 07:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745850601; x=1746455401; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bQYI98eNYPuBxf9D7Ml3+p+5IYpNd9AgbjcYArr6koc=;
        b=FH/WYb/i3qXhJi17U158XRZIKKy0B5o01WHuxCkjQPgnlcKzMv6SPU9Iq1XKpWCeVM
         pV3G4tHzbwawj/r1u2rWdm6yCl4dtQf7nNwZGJwSpEsocBPPQ9rVyIhx79jZkwXjRF20
         5dLA+TaAUaWXWYsPWNb5pm4PT9KYz0I5TcdOG/Ts77uu8YwoMzvIFMcv1QDwed3UxGgU
         OMRXNN9YtrJsP4Ny8Jw/5LFJVT1P3XFuOb8NCMYzD+Na3MFqzKZiAWpVZfTjKpkdBIHc
         llE7bx8OvB5KfSRYKdePD43EQ7u0t00dhsADjFYHPOXUynGRd81N28Cr5tEZK2QGvBrn
         RUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745850601; x=1746455401;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQYI98eNYPuBxf9D7Ml3+p+5IYpNd9AgbjcYArr6koc=;
        b=KzlqiquQJOpA7DlyNkU/yIDxzbLWdN/uOSYa1KjeXIVUKfYE6N0ek6S1qrypOOyktv
         CrYglu6VViAGChzGfQPGitjXBTCuq2y5Wo43fcgyqkB1V/D0Qsp9oNTVybj/dHaTlCcW
         qZJ0Ip9NxYFMiEiFIi8g8mnU+mTjPugMAOhPZ/wFcvpc7B2l2u17XN88xb9mTFo5G51E
         QmyS3mhflxEbDQv24nWoe3WYYQKPQ4U70d8MwNcm5HL9Mg2LZsrOhtwmZSP9C5sYiKGq
         4WNdlun9Ho5hbImsQ+MaqmJmmKfLzzC22FvusOe4AVFLc9aIwPsKu24rV7G8PrplroXm
         aOFg==
X-Forwarded-Encrypted: i=1; AJvYcCX2yyP4IM1q4O317JlvT4s184v4P1Ln+NUK/k69QH/ilMz4ZXKuRc/xGd3co3NgNTqsWg3JT54WvkQkn+JTCw==@lists.infradead.org
X-Gm-Message-State: AOJu0YylzJMxaNuALLJN5B9I/yiT2/9/W71Mc6iwVb98jEZ5c19Nuo1y
	+Omp4ea3+1Y0D+HPI12YOO3tCEi480pp79JAd2Xr+PSYTIlGggU/ADd15BkgrEA=
X-Gm-Gg: ASbGncsLIqiWLk9qULfVBidWxZa3Pmo/83kCt+hunD7U7Vol2gbGm7/HX0FV435nvOV
	hoiJ8umBClicPO7ai8aavYQaXsCiJ9973/C8JqQNp/ESx4easAIgx3NJE32gXsf9Pb6VkN5r2QB
	+EKwYXznW1VgfXTx91iYIikRKLemn7iKGTjFdd17hiXjhMg0l+yjQi4+9618N+2NnB1rTxEeNsW
	CBiwGBi98Tt8ND/V8Z5H2bKnX5PTJuTL6bjLSKLpJO1KnMkJ0ew+33aUWtqUAripTs4f55av/la
	+XiccGU8nXsH+lvci8Ug4yrEk/EZAa9QgPWQxq0NZ0ui47iixiiqY4NNdUWIygbOqLrZ2RMcW1f
	6qcWZ
X-Google-Smtp-Source: AGHT+IFMzYA4rBwAp8XMm/VmBHtuPN7YejTTJCLHH0ds3UH44CvH+BTUCP1eWOoIxr4fWxmL+Mot/Q==
X-Received: by 2002:a05:600d:3:b0:43d:ed:ad07 with SMTP id 5b1f17b1804b1-440aa5c57d2mr71982045e9.29.1745850600617;
        Mon, 28 Apr 2025 07:30:00 -0700 (PDT)
Received: from [192.168.5.157] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-440a538f4aasm124616395e9.38.2025.04.28.07.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 07:30:00 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 28 Apr 2025 16:29:55 +0200
Subject: [PATCH] rtc: mt6359: Add mt6357 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-rtc-mt6357-v1-1-31f673b0a723@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAOKQD2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyML3aKSZN3cEjNjU3NdYxPDxBRDoyQTi+REJaCGgqLUtMwKsGHRsbW
 1AAzLrJhcAAAA
X-Change-ID: 20250428-rtc-mt6357-341ad12b48ca
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1456; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=ruIK2ZYu6lVtSOA1q39QxovEfdKMM9srBG4DrMyVUf8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBoD5DnDmynJWGB3fQ71YEwcfouWK8V/j+TJRIOazo6
 JTbxnCqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCaA+Q5wAKCRArRkmdfjHURdFbD/
 9SapbkaXzKJQv+9ANc35lhlI2QPX54DfEfjZjVAsUPn1ZRjXdtm9WR41IyzztGdGfpRmT6JitqlK2N
 XSue5F/P7bNCF1nboTy8/bssi5w2NdJIJv9onhgr8e+VJK2IWTWLATwdJ3IIdI8b/g9V06yUkOZr9A
 8PRLwmOu3hkFBqh279hQRA+DVclO6MhZbMUkEYkLoOrqCAnlSOoHW9XbFbbT/4/heej9DCwJLBBBdM
 KLJfufLks3tBLoU/e1jJwHenVVTAL2R5g29cnknxL2NsSMJOxM6giESU4jKrf6BP7pcIVB0YJpqzqt
 CxFysyaZEH916/YYkpj3XZ76uUfqFm7WzR8yVOXBLbgLaB/M51msZSyAVj0HDU2nmC3qaQ9NZ1sngL
 +2uiLVXZj2dhNFuj/VMFtojm3KI3Cjd6nIymlOOV8ZTU/OhHWMHYvPYEwlPpZ7nuH+nl2vj/JIhlyv
 cuVGNJai+xMc25fD6pJ4Tm78MCePjXxAORRDV3TWyF3KbAtyxTvyKwpnkS6Ghu7/hVw9ALCl3T2cDh
 wX/PiNYmdNqBLIhq2InUWrPfuyAhEnv6rhXW+b87E6u+FgMHTH+0CChOb2gno3JR21JwTYbj8o4+pf
 0GTaX6z2uIjtLHzQmQ5phDZVJ+ML70x25abikqmGttA4S3mTKaZzyVw9GOEA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_153004_104707_841DD939 
X-CRM114-Status: GOOD (  11.23  )
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
The `arch/arm64/boot/dts/mediatek/mt6357.dtsi` file already contains both
"mediatek,mt6357" and "mediatek,mt6357-rtc" which are documented in the
`Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml` file.

This serie come from another splitted serie [1]

[1]: https://lore.kernel.org/r/20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com
---
 drivers/rtc/rtc-mt6397.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 6979d225a78e47f73b7652159e73f70c43b4fcde..692c00ff544b22b471b51f115dded9fcea432de3 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -332,6 +332,7 @@ static const struct mtk_rtc_data mt6397_rtc_data = {
 
 static const struct of_device_id mt6397_rtc_of_match[] = {
 	{ .compatible = "mediatek,mt6323-rtc", .data = &mt6397_rtc_data },
+	{ .compatible = "mediatek,mt6357-rtc", .data = &mt6358_rtc_data },
 	{ .compatible = "mediatek,mt6358-rtc", .data = &mt6358_rtc_data },
 	{ .compatible = "mediatek,mt6397-rtc", .data = &mt6397_rtc_data },
 	{ }

---
base-commit: 424dfcd441f035769890e6d1faec2081458627b9
change-id: 20250428-rtc-mt6357-341ad12b48ca

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


