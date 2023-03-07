Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699A3C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 13:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFcU9KG6Zg/OwCxrVxpIEJDr843T9tY66MGLrcJxIIY=; b=RICU+S5/cR6C5C/59SGd+5WoiU
	ekgo0qEmgLmlQWDJfOjIRsk6drbgQUN67kSrT3ECMI6kSVGAnflJhgM+vhJI+oVrgnO/S/LB3E12m
	5b1DQaXtfRf+Ck7+IMDPgiveauDUVJvdQbm8S3ss7ZFczTaMHbg3aB8ljy2BLNsQnorovQUx69YPt
	MUS/mVhpe/xCqMUc4Jx7kbNtElwoEmhA+uDluUnxe5Ic1C+Z83ja7Q9vXaXwJrdJPDu4+hsGyxYWd
	24EO/CV9tTEF5utanGJwUcrJm4oJgs/jrUzVGyA+HEmO2OYXL2lZYJ7EQ049ZbRDyXP5sCEUlp95i
	bXgyh6eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXLD-000Nc1-4f; Tue, 07 Mar 2023 13:26:55 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXCs-000Jhq-CQ
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 13:18:19 +0000
Received: by mail-wm1-x32b.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso7194884wmo.0
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 05:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678195098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hFcU9KG6Zg/OwCxrVxpIEJDr843T9tY66MGLrcJxIIY=;
        b=tbc33T+K3AbDWEpbHaS/EEljIYli/jIUo5W4+2Dwk8Tib63VnEzO8JixwdCddTLCc4
         x3FohOqXrx9H7pfqY+eYPcgcr440I7kVKI61I9Z/gp7cfvn07yyqfp7KITurHbxYpuAt
         sKe+JCBwu2549mb4cpZRT1lRioo4rVzABd9I3Oi2CmyzH/nIRiSgGKTevdRvmPBmusmj
         bNrucEXcSlVYeCoayRIUU7I1ALAjnVwUVR5vGmVdhpTrRE3fKvu/3W41B+o0yqG/llhU
         A/XtwFXc59yBYaSede9TBt/S4Eifx2crAqU4yhL8ifZtotSyeT/LT7A4MzlZ/Krwabvj
         i/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFcU9KG6Zg/OwCxrVxpIEJDr843T9tY66MGLrcJxIIY=;
        b=KrkJ6w30rHkJ5xJpvg+9bwEgUCgK12YdPfOlux4rxhqLE9m4T4dlBOWU+2I3KQfC6n
         RTNBIbq7O64J874e8MRnHoyLC6UdIGT0cCkK2F19UDAfDkWO6rPZ/SNo9jf/6bFcEmDT
         A+aOQFsCP687tIldLp57CcDZz2wSEU+t9X67sf84rFQ/bXVnPrdL+8IAlPay22LyX12F
         XMKZkvzWxC+17+kC+DkpS+IJMF9bYlKT4Dde7lsQg5/Bri4CccRjqlvwuAcxCkllaA+U
         HTLBng7vwntpdroWXg9LuFx3AB7G2J6LNc084Re/3WG1uyqIhjgbghC2vtZhb1cNJJQX
         317w==
X-Gm-Message-State: AO0yUKXzyUAV5d+56iFfoKR3d0RGWj6/gOKZfT4aWXuD4hImVmtUO4OF
	hyMTpjw7hE9jHjOkYhzlHxoPuA==
X-Google-Smtp-Source: AK7set/4+fHlzf3ssVu4dQFFBLnNl7pr8Mqu0WfZgkWYEHPSaGzcMn40iQ8L7JEloGyYE3bH+LzxEg==
X-Received: by 2002:a05:600c:4ec9:b0:3eb:2da4:f304 with SMTP id g9-20020a05600c4ec900b003eb2da4f304mr11618999wmq.17.1678195097952;
        Tue, 07 Mar 2023 05:18:17 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id hu21-20020a05600ca29500b003eaee9e0d22sm12986242wmb.33.2023.03.07.05.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:18:17 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 14:17:45 +0100
Subject: [PATCH v2 16/18] arm64: dts: mediatek: add cpufreq support for mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230203-evk-board-support-v2-16-6ec7cdb10ccf@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Y4L/p189NH3SAVW+4HN4eciI82eYHFCxYrkIH+HpMQA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBzmF7wCSDr+Hb9Hj41DRSfR+NA3e5/YZy+L+V2X5
 cbhN3EWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAc5hQAKCRArRkmdfjHURddmEA
 CZP7USN8+ewJ5/hPAB71aQM/MDCXizoneBZIDTyyayggRrWtd8o3jQPANBQ+JdrbYfVGKS0QLqiSsG
 CAwBNbeJlb129nPQdm+9rYTYZRAIiqeBWRWhV1TIxdHX4g9Nf1tTmCrPSXvk7uWsL6un2cJLeuz8dQ
 oNzJVyoQi83jsat63vHwma+CBDKkAi4I+QY3PBlWyNZMrd063jYMLts9QFEN79vsMmPv2wgYYi3B/M
 wNTZIu7jyhYatJXDS5mcSilqOUyaskIelA5xYkvt8iQGxHYIesLuHCCsBc2U9OJcgm1Q1eu5JXTIj3
 NWZGWJSbe0VMyVMoEjeVVCzsKjXw9F6AeY7HFf4/00wE+7lK0OnzEUBbR6ONC2hGHT/4bSM36wfXG9
 ftX3Y+oWCF3SJkImT5/EGIR5tk8PbNzqkrNVkOC90uJHdfIiNLtBfykYsJBRRDcz8JQpEhywG4Ghk8
 3bhwkAp+WKgZtDdRi5VyuGY2ogHE2GZPl9jj31DLwHibcqAjrEVF5BC7/R+GRBRGVKpT8VsXh5eL9y
 4FJbb626i8rCPmnERbuLk8skagHEfw5h83SEINMmpdl4sshX/eY0GvO1dJVagF2/zR+bi/tmdT2LdS
 TsH87WbhngZIfaqP8bFgT5g4+fsZa8S63bGHVGTEU8RJBRJ+K8GRz9q5A8EQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_051818_480047_BF315B8A 
X-CRM114-Status: UNSURE (   9.41  )
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

In order to have cpufreq support, this patch adds proc-supply and sram-supply
for each CPU.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 1820daad6da3..edf3a4b6a76e 100644
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
 	pinctrl-names = "default";
 	pinctrl-0 = <&ethernet_pins>;

-- 
b4 0.10.1

