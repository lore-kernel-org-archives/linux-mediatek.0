Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A35C36010
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Apr 2025 12:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jM702IHJZgWY+bz6KCTgaeHyuuKyyx07sXK0MSiTh1k=; b=TCdiUu5ABnxIpyM+RnlkaoBO6f
	56YptBRhwjSQQyfgluvcnm0iqf0MiASFlSDWQq+pLZY4R+14MAnvvGvhOUlSgB1MQoi/lQHEL0rmF
	qSbDSDtW+0nO2Ieg2B0mkl/rCMbCjAJSJVKfo9HDvVCbXQ5dLVf3I21JaGKawl++o7SiUitES2+lS
	Jq5S8Ld4070OwqXO+EAlXfSHVurB72EUMF+nE2tmc7o/ZTDdGRESEa55+0IiIaj+MEOrgJ5BqObmL
	3FYletaGKAkoLlJXDCCM61CdDnaUiPhUIPE2lwpmBV8sPXN6gRoKnAkmoFq+s45i7XwW5RcbFCo83
	JaIVzJOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DjW-0000000Dmfr-3f2R;
	Fri, 11 Apr 2025 12:43:46 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DcT-0000000DlE8-15Dl
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Apr 2025 12:36:30 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-739be717eddso1441327b3a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 11 Apr 2025 05:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744374988; x=1744979788; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jM702IHJZgWY+bz6KCTgaeHyuuKyyx07sXK0MSiTh1k=;
        b=Y5UBk9uTo2gbjABcC6U6Xn99numHPfDC836nOtG6Sr8Jg+7JrL24wpnOdikKLTSBju
         2raYsh5LxtYq+47NX0tm3bMW+dv3mqUokBkPIvzYe6o5N8s1dokUlNKd70LrnL8lb3YI
         k+njEIB9Hi9PrYOYmicEsYOb4fuW5Tb5fGhiMI6Zgi3JBjvSjskNtZHIeNHW2rdh1rt9
         pkAJUCKVC/+DkXYEuGJiEQrn47PfEMjq3q0niKuzQ3WFmmlDRT7nEar25+Ug3sPEm/zO
         7nGr4gch2qXDXgL4bFJjeFWj0tqRQU85fLGyQQ1N/NlJyG7oBnckXQswOHNni+rP5klr
         +IOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744374988; x=1744979788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jM702IHJZgWY+bz6KCTgaeHyuuKyyx07sXK0MSiTh1k=;
        b=p7KokTlEhRIYMBYst+RTecAOZITv9UhUZK5Cw6KyhiHYph0QNQ9t0Gf2gWGi9S66sh
         LHQzYr8U13W6fZnjT88O7bPxRKKvcNHG/Od5IOSP3dHtrdvUDipi6sc+eR+e97TIXPtk
         K58WiLdpUduxxfa4pk0+UQINVns/mqENhzYNvoYmeoHtkGUuqC6izaFTQ1qrrVrnSjcA
         GO3C+gFqYXayO6/PFBmcfFI+a1fN9yqDt/p7xujSBj0x4MR/ZJ6c73qKvw2mhWzI6y15
         fS7iqCE0F1m/3saQTvo8HrZRbC25Ufxz/DUy0bFBFsUrVqgqD7G3KrlLB2fuk55tJmtc
         0Hfw==
X-Forwarded-Encrypted: i=1; AJvYcCWAKKNlj7PVE4DvgWj8tqX0OjYWXejfXolREyzhTYY/h4floAfIuWjQuF8Kj4WymkivPLTxTLtfbceQVChDYw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+Tv5yAD6tVMH4uruJKJap+R9Nvu9V9WmJiH6ZaINTsLDE4Vd5
	keOtTkYp6+f5nN8Ret3xs+NND/9fKlFJrYgVH3TOwHli5s9oPX/QLSt/ytCqThw=
X-Gm-Gg: ASbGncsET5ZAFVtGPFDizewvOfQreYLOIjiUl6ejWejT8OwEs4bX/faReSzUGMHi930
	p4dv9qGpMuy1m+w8fu8cNq6uUdg77XnScfdF783Q6r08T/Xa2v0hqViK3OQjJXNRHj6nEQ3z/T0
	cMR+juL3JskSLtTwVKDBR2y92A5eJCdSUy8HNxpxOI+ulpJSj1Hox3lxK18g3+inQbLqlIrcAc2
	MF8a3B/9TX9AuVE5EMG8mwTOiEKiwSSmqoOh9kdq2EnhMPCV62yywtQxcx4bi1U41UQU85PMxgO
	NnqgiszkV9xCT1RugEJn3tpTqMEyqUAWSTEDThqrVcQ=
X-Google-Smtp-Source: AGHT+IHQwIeS61ZHw7ELcaetMk1hxBxZhzt/gB3vL7AAjlG4usbaBhvHS6AeD5lvUMBQjtxiLN9JMg==
X-Received: by 2002:a05:6a20:2d0e:b0:1f5:6b36:f574 with SMTP id adf61e73a8af0-201799908cemr4162219637.38.1744374988404;
        Fri, 11 Apr 2025 05:36:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:cf9d:bb30:5951:692])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73bd22f8253sm1408292b3a.93.2025.04.11.05.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:36:28 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 11 Apr 2025 14:35:54 +0200
Subject: [PATCH v3 1/5] rtc: mt6359: Add mt6357 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-enable-rtc-v3-1-f003e8144419@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=888; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=kapZgj+SJrEW/7vg45el3XbqPXPyGqqzv8dsBko1XSY=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn+Qy+TYlfRYrK9qBDtMoT67TK2uUDW65YoKt+VK8q
 GnOGMrmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ/kMvgAKCRArRkmdfjHURR2DD/
 4yLxGKl9OOCFSJeMkLVMWu8AstKcIkMWXfnsYBqGiG0y70mV141mnz9uA1Wc0q0e436oYHlfRwILuj
 8vaI3DBOZWPdM/vUXhxbr06wjzwcYlTSrvVEQD9mwFWuVcRma8pnf7iinuqfOQAl0xsdZ4vs/gn2//
 5Fxxc8ddmo2NGUZlrxrgFhYrn5FZe7ICGucwwYbHE6aJQVKSCv7ndCXIBFUs6hUZ0ZU9a2tPcmOemT
 WTVdyPhr+e/DT0LtIPnaqlgRaFEepcVsClWO2gD/TNvOoEakEuhUryURlyDJkApbyRme6GolKf4mCG
 pOT6Tf1mgbrGy1+NfTixaf58L0ePsfbhAUBXYotRpddCYUzbSTjLrFNmT1fpVzSfUvb4Bt6QzarYJC
 iiSUZwUappYupYyPDSPVV9jq17rxTtlRmXCEdJEjSBUmjaIt+0D2hPmSoJVwG2vhvSk6I99CJpRkKF
 IGQiqU9unaNRqaO1LK2nUKL9o5OoWDgs8QzyPglItnNxE3AdyMqLysqQENtPq3zEpQJq6QznOFOS5g
 D5bVbSKVNMxItR+mw5dlkJ5V5UuIleFlsoTvFThtHRjdfUQ5pFM5Pogs7PR435ybYQp7/MZwKStj2L
 y23u5rPPoMo2O0aFe0vMVu2TUB37HGnrKMbmKoVXX9l61d7LzZQfDbpfD1Bw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_053629_303585_594517B3 
X-CRM114-Status: GOOD (  11.15  )
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


