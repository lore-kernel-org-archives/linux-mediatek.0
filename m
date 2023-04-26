Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0FFC77B60
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 10:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTMUBqSy4TNdyQBAp5j0UTas69JRH+59JZ3KQ1Hz96Y=; b=BBVJ1gj6Sph6GP+pZEm4cFkgr7
	gGbh8t+qcLVJXhrxfLwEBO2taRps8+ByUciya4MDX7iNhtnifOPiZC7MzMHgU9bGWedhO/SEzT9CM
	d16BhaXKqBrIDFJ0J1tMlafja6X/Sc3a5M8Ks7jTaQhlxAZkIgzt0dqfsgBjqPHcP9pEY4evbHnl3
	zUkTtVdldhGp++XcXtV3+dbRABKhg+WJK/kfpLWLc1rAjtbhUkwi8gxb6JS/lcD+VWvlQAr4rjgTU
	2cKDkqlq5yNLf1iZRh1eFpiQdRysMW3iQ5gbzX8KK1g8fvZy4NUxuIIx+4KMK0Bbdypoem+rWRpxk
	0DNMxXNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prcjQ-003exO-2K;
	Wed, 26 Apr 2023 10:50:40 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prcid-003eZS-2s
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Apr 2023 10:49:53 +0000
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f1950f569eso37449875e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 03:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682506189; x=1685098189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTMUBqSy4TNdyQBAp5j0UTas69JRH+59JZ3KQ1Hz96Y=;
        b=oaFAJ1Z+UkFi8STykLSvoTA+yBH9IhrrFwJno4E4FXVCIqpyltyYPOBmWgG7zc2Nxl
         ZXlLlynSViXhSTxDp8L3OO01ziE5M3uQZwDmuuJVqCo7ri0jPQVzGfUBPh5Lg4ilWoIz
         63ofTeWwbCoxld2+hX5IPaKSiv/xi2eMBZ7r9eJlbj7rHe9VyDKLhnAuuAQXccMrLcd2
         cm2QFkCYKEhXlFV3ZcddxkttUCaQ/54kdOZK0AYZTog/U9vldkvfBWQssKx/7zuOEd0p
         055HekU2L9hNM4XseYYL3r3ahh5Lz0yEx280ot9OQG5Jee23tkxMLHdyf6TbcLntoCDD
         tT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682506189; x=1685098189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTMUBqSy4TNdyQBAp5j0UTas69JRH+59JZ3KQ1Hz96Y=;
        b=J9UJZ9iLgVsfvjKriupbpFjpZSk2FNq81ROqeJ/Kz/uPQkXqPtZ094PB9gu4JFxYGw
         +eXfocvo0T/xnD85sOiaUNvpcqPEij75/KDqcPAXTXOOfSOATR5134Fr8iNbePq4JwGG
         JfYSY6RhLsEBw7qdbaZ21AZ1/BNcP/E26ZMVqiwgikm0lJq0hGMlSBzH+3Lrw8CSUjyZ
         mU521a6zEfG6SaYt1aE0eX8n8Q+tPyG7PxCXhMKyGWhA/LLrs9Pm9I82ZMOf4ATwwEno
         +L5jcopeG90huUGhvFF9VDVOB+LfNu3EuDaamZMv5TzSkoYeLG5qe5PxHLB/G49ktZP7
         vmiw==
X-Gm-Message-State: AAQBX9eGZnIZrZy3OxFimazht/cde1QQ7efMtM6ur3dnrjcPyOeoMYYp
	ucj5RiU4HmKxUvDXv8hTXQPdeA==
X-Google-Smtp-Source: AKy350aG1/9hyV9txuVsYBd7+UE6jXE3/4ZuQtl8npgHxVbLqNGI8xD1ZHiMTXf8qYOYE3L23Mh4Xw==
X-Received: by 2002:a7b:c3d1:0:b0:3ed:2e02:1c02 with SMTP id t17-20020a7bc3d1000000b003ed2e021c02mr12220664wmj.23.1682506188959;
        Wed, 26 Apr 2023 03:49:48 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 25-20020a05600c025900b003ed2c0a0f37sm17601988wmj.35.2023.04.26.03.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 03:49:48 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 26 Apr 2023 12:49:11 +0200
Subject: [PATCH v6 11/12] arm64: dts: mediatek: add cpufreq support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v6-11-8d6b1cfe7f29@baylibre.com>
References: <20230203-evk-board-support-v6-0-8d6b1cfe7f29@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v6-0-8d6b1cfe7f29@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1201; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=8Q6eOHc4c87inPFqFs4vtsSVYC3iqYyqZgc3XDzlolA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkSQG/hDpBoD878FPr2DkV8harEpFM3Ox7ZqJeskYq
 9y2/BeWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZEkBvwAKCRArRkmdfjHURWUlEA
 C94wxHgmvDD3U4pZ3Ktd3ZX2/i5srtf7rftX3B/ytiHYHT49oUP/UuynlO9pWFTtOH8ZWlb7Hk+fEZ
 DyMDMaHj/mpCHuwBANQ2Pt04d4ew1qTca2cf4ID+lnXWQM4aIasWl4r5Rh+cnM1JRRed8x1PNjOjlv
 OVNfEC4MBeHyw0YlEW7HDJH+kq4RVYLCN2+QkRpt4xskXNaxQD/XXNEx0GPQ5oZCz277E8JWqYsA2f
 cPosCul0HCa4wM9pmAYVUujX+eeYalKi3FANg8MWs3I2H3eQOIFBmdFyXi7hcKh0SCvSfB/jWxU+1/
 I6WIK9QvUZD2LVEEG54j87RQ8OztFDkl0trp9G9lhfa/GjEPJIvBYCJ/cT7houHIaTdsCT8vy0fI5R
 mtFi1Qfiuwcb2L5EYCLq6V/qb1zwCwYmYuqWdiP+Qn5WtxEviNNJZOlkBQS95eufcKGyVEC0Mt5j/k
 ipo0Evw2evQuNNecOvQBffQhK/+kaWBPCh5Vv1W5bGWJzZ2I+8+EuAWsoo0gN7fyRxhtJJTGJKnmtv
 xDNGXCzQ3m8OgrENG3z7xkUPWUvAyzZBsPrhdTNkYaM3izBPmVxvlZeopUIStu8ZIIEVnVRT4ggzXB
 JAdIy4lO4WxIiyPc12Kib1emWJ7E0jEP5Z1Hr/t/LM8NExAezS+2jqtInakg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_034951_929455_EB570D48 
X-CRM114-Status: UNSURE (   9.42  )
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

In order to have cpufreq support, this patch adds proc-supply and
sram-supply for each CPU.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 5a4c41dbd3a5..3ab897d5e468 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -88,6 +88,26 @@ optee_reserved: optee@43200000 {
 	};
 };
 
+&cpu0 {
+	proc-supply = <&mt6357_vproc_reg>;
+	sram-supply = <&mt6357_vsram_proc_reg>;
+};
+
+&cpu1 {
+	proc-supply = <&mt6357_vproc_reg>;
+	sram-supply = <&mt6357_vsram_proc_reg>;
+};
+
+&cpu2 {
+	proc-supply = <&mt6357_vproc_reg>;
+	sram-supply = <&mt6357_vsram_proc_reg>;
+};
+
+&cpu3 {
+	proc-supply = <&mt6357_vproc_reg>;
+	sram-supply = <&mt6357_vsram_proc_reg>;
+};
+
 &ethernet {
 	pinctrl-0 = <&ethernet_pins>;
 	pinctrl-names = "default";

-- 
2.25.1


