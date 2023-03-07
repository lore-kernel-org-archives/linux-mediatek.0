Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACECAC678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 13:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZgziY/YB1+30FBJvKkNffG54YxezBqs7LSH3IaDCyE=; b=GZLhuvfTKoYI6lOKCsb0tYyC7e
	d6/87DR2kZ37VtDpAxFd2MH0bvEy6X5XQn0SiQoQby758Lh2KjLX4F1Hcs/4ecHCVbQzZOjLYS0UE
	bUfT6Os80GtKInk1xiGDiYhYeLdZSUyU6qsyRi8S6i+ek10fKHXGYLPVIU4f4RxZLUEuCKeIbS5zW
	SNy3bzwzTlVN/4w+aStY0UCeR17Qo4CRDF1B93vZl8BjOWwy4fbgw9r+Bu6fJ8VJUFVxqFZdPMReH
	xNJFYegXoRKRfTcg9FufRCIf0J4+1CHE6MhBDrtiSAhg3CU/johoTHrrlMgvKomOhNHWuNG5CSOaI
	uIrTpmSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXoH-000ZEf-C5; Tue, 07 Mar 2023 13:56:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXdG-000UaQ-L3
	for linux-mediatek@bombadil.infradead.org; Tue, 07 Mar 2023 13:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jZgziY/YB1+30FBJvKkNffG54YxezBqs7LSH3IaDCyE=; b=UleGmdTVDaOyn+y4pq7/bnS4Nz
	a4gdadwYMIENYLnG19toi3ZZXX9lzYsXbEMtatH9sOZNSHKalqHP2yzR50a4FnUdTnAJr+9lI2y4w
	FaFjsVQTgsLCQkfqVhqcHU5FMsJZ2WifLEUvraPZkjdl62W7gcMHDgsuEqyCwwV/9V/VkURLw0SEU
	gp4UJV2IcZcLuIDcpacYr7BrIrEDPN025iKHNTap94a0plJ3NXRJQYz8QtTdznAtK7aKpLlKGe+XE
	ObMoWX11JRWBidYgdDhjC3NM3bJrzb/MGEl+rF9gggTJnXTSeF5LNElUHvfj4rVCdxcRhaaaEuV84
	CR8QFNBQ==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pZXCo-00H3BS-1m
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Mar 2023 13:18:16 +0000
Received: by mail-wm1-x32b.google.com with SMTP id t25-20020a1c7719000000b003eb052cc5ccso10374215wmi.4
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 05:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678195092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZgziY/YB1+30FBJvKkNffG54YxezBqs7LSH3IaDCyE=;
        b=gC9PSU0EnIFVPXWsFxTNgWSf3tFnBCbUk5WHSo8XVliNlpnSfhfHxLrY/vctpUteoa
         7H70gjcACxeZu24f2wnZQ3FnrxiflSf4hpX8i9TSAnX7peuavPAgSCeEaQc0MKip0rXX
         51SsfpKERecVAVIYslCTABFn311ojZmsZwkPQUneoWV5UWNmy1Urf2wuGrpZf4QM5jpc
         lRVw/q5kLj8KFFD7w/29U5+7fh+Sfe84aFN8ddpGa8CANq0gXIPQ2a7YiQIMJbB7HfAb
         +GwjcLaCzswDeoZBTaBHt6lzOIiLh22CZq9YLIsV7H5+B3it+X8hCP6N3nTqOWri5kVC
         pFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZgziY/YB1+30FBJvKkNffG54YxezBqs7LSH3IaDCyE=;
        b=AcCtxsZA2c14PxIFmAbUqqmiK91aBKIrZUutttFxaTMBHne9H7l2UKiLytjVdRUKTa
         s3xZCDipe8RVgpXMs0l19k0qJXSSxxRDcbfoBHJ9c9aex2WlmJnKfoEpC3Nnkx7fFGg1
         gKX1ztpSSWeednVBAO5WHtzQh8zTtXcTd+QpdU/Njn5SMYZtwYLhgYnm0dT7Iop1pofh
         7467+ogR1n1h++JT/PneyptgEuWLO7SbLv1uYcnwHXU3V22SoN1657ffrf+HTr0gWMxe
         hcQqD/LgzdFbIih+wy/dVqeEbabOe+0i+oN/ZwknlaD/cib8fDFlSTy5dojvihkBFZo3
         u6Ng==
X-Gm-Message-State: AO0yUKXX/GuAJKg5zRtdOe5yy+2lDVssxHEyF19CNj6byLwD/yxJRIb5
	8SRBYA8M3X2gq1PBoTaRmwT+Aw==
X-Google-Smtp-Source: AK7set+cP8/xdPN2V+iIMBYICaK3cU0G05dWqNfqiPFVmOsPJ1f8OveQiZPLR8GCioSkk1VJkw7fEg==
X-Received: by 2002:a05:600c:3b11:b0:3df:fbc7:5b10 with SMTP id m17-20020a05600c3b1100b003dffbc75b10mr12361026wms.0.1678195092054;
        Tue, 07 Mar 2023 05:18:12 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id hu21-20020a05600ca29500b003eaee9e0d22sm12986242wmb.33.2023.03.07.05.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:18:11 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 14:17:40 +0100
Subject: [PATCH v2 11/18] arm64: dts: mediatek: set vmc regulator as always on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230203-evk-board-support-v2-11-6ec7cdb10ccf@baylibre.com>
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bernhard Rosenkränzer <bero@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chaotian Jing <chaotian.jing@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, devicetree@vger.kernel.org,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=736; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=zgAlVqRMW0cAokXo5nVY6t0rSDFpe2kI442mv7CbE8w=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBzmF882sWdKBKZfGLh7NQrzfuoy24HxuZignt4t3
 Mr+TuGCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAc5hQAKCRArRkmdfjHURXePD/
 wJMDLl6pvqakmMG8hz7aGqqdhwAuLq2j2nRK88uv/lChJvPbyXbOdPJfYAwAq0W3SPJPGnYWqRA+9o
 rlDRXzYwCyvUedBxvhKsS72XdiG7uA0YOymaQJmihtSk6UzWmwBrcK491iP2yacumgoab4t9ToGD0c
 2dHol88AH1muFHFGNJpeA5TO/mOYEqyJmtnCtnzD86of9FeRjYksMJGVQ2EUz0LMfifDsYYAF+AmPo
 4mxtGqA+ISGbodtvDPp7NhiNbxSB84kbNlb8Ft16SOq3M0S1QvPLXZ2zjFlVNqzfDSvjgkLhedmble
 z2WA1Y/BJWtyT0Hcv80fHnvKEF+uwcceS2/YaVpAvzD5EGvtYotu+KIQK6qayhkkEjin/sKWEsRrZR
 HLvqfcJnPQZqW+0Y611bzXu/IG65TKTFIe6L/vZ+DMYCzhJcc2XzgPs2+alXCi/f4pmEaPqrPE2uQR
 eGMwrF7hxQneTY2v222PrpxgPbPFq+c85ujrO3syV4OeMsJMTGcEyKCvWFhEYLLnSyVSNk+fcsrY1C
 txTFjGkUbQzJkCr1TJ1dmEGBC19Rr4BX7moQqlrnhqSak+ageMLJ4SbDWxoq8CnIGEyR+R+adkvugz
 zsR2OxBlrgVx2ODximRC3cr/4sH4CeYXEZK6uIUZKM5FiFYWWbap35eG4TTw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_131814_738671_2430E069 
X-CRM114-Status: UNSURE (   9.57  )
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

From: Fabien Parent <fparent@baylibre.com>

MSDC1 IP block is powered by VMC. Make sure it is always on.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index b5d018686cbe..22ec332fe9c9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -140,6 +140,11 @@ &mt6357_pmic {
 	#interrupt-cells = <2>;
 };
 
+/* Needed by MSDC1 */
+&mt6357_vmc_reg {
+	regulator-always-on;
+};
+
 &pio {
 	gpio_keys: gpio-keys-pins {
 		pins {

-- 
b4 0.10.1

