Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C402C77B60
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 11:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1+QiNq9msoojnY2Y3bLQkN17Z1RFKin3Ea5QLyYrSE=; b=I82F5I+3p+Pf82nDdkE9zjMu+H
	2W07EXmuMMTX1Hpd9IPHwJ8m5ia0J5Y6fmtmAoW5PcCvbaml8pwKQ0LH/cGtIzdd9g23K/zgQcKZd
	hjDNtCPr2+9h623t9c36PtsbeBjFQr2nryqlniXKEEIexsJDSQHt0PbDmNrZKKUEDfJRQzXS7hFF+
	eF3Kr+RCJevjctiCXAkorlcGb8cPOryaSxr9DEjQdJVcC55TbcdIvJoQkakF5LmScczdblbG1GxLe
	oppnkknD/CE7ElR3EHggtXwMbfo3+tXtss23VZORZ1MlNoVqSt+ElIXgjdyuq/W4Wdl1meWtH1tpE
	YWR7OLIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prdUv-003mzF-2h;
	Wed, 26 Apr 2023 11:39:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prdUu-003mx1-1Y
	for linux-mediatek@bombadil.infradead.org;
	Wed, 26 Apr 2023 11:39:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=U1+QiNq9msoojnY2Y3bLQkN17Z1RFKin3Ea5QLyYrSE=; b=Mx/Q7v+qbX3gLnzUzt3VabrFXM
	jm68w4WaN+DJyFpZ852sE+qfo8ulYGudqpPdNShOX1wVuWoNQFM5UkJyPFxw8ehB+AYaVTF/hebNo
	85qDUDGJeVfplTksTsQtaXsuN7Onzf15DTYk/4Z4hKYC5XN0DJHIOjE/9fa1xwHEoFR2xmrdQvpqh
	2ae418ISzjFVm2knJ8Gd6Z3FTtxdg1fGlRpInOSSTMwWoS3OmPdFQLtDVt+FMGHIY8fTRtO+YjiR8
	Q9PrM2A1bX4iBoVaZ6g71jgKW4Q+dpGGtBdlqDLGz2VSaGtDIGXy6lHKjhzQOh8QDRKVaxy3w9noC
	BeMAbSwQ==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prciY-00Awzs-19
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Apr 2023 10:49:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f19afc4fbfso47844695e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 03:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682506184; x=1685098184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1+QiNq9msoojnY2Y3bLQkN17Z1RFKin3Ea5QLyYrSE=;
        b=a2TXSe+vmPGJ8+wuRJgPhCxT/a4ko9q+HDrxapAIWIjfj7PiYb/YHfjmCl+ZInDTlt
         OyCj3LjaffNY127zvbnV71pCcAtSba25z4ZYqvL42CDBEzH0TUAxIi99eXVFzU5i4SKO
         ipkg+eqaGuKrQ9F84I3kzulxQtaisOgR5nTSNJkFQK/FG34+AWk9cuTByc2Exj+u2OJt
         27AAphWLIZs8T2NfJzKBvm8Aos9zyKczzOwjrCptxq80yVLAHhde/APzkPXdwhdrmOQZ
         qQax6WGtJ5Gqx/b4rlU8q4Wf8x1iARR9v/V4q8pP0qaxyn3lkdKcqldICCXtF9WKRN1N
         F9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682506184; x=1685098184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U1+QiNq9msoojnY2Y3bLQkN17Z1RFKin3Ea5QLyYrSE=;
        b=CO0Peme5qV+gvqNueXlZcLBH38d0vKitYO/zR3acsqCE87OhDPfd8l6o+BUVvCy2QS
         X/FBHc/b1rS7hdH5kUTI9lY61xNuYMKyUpxi8zX2uR9vLIEr7UnZcj1SJyTZx9y0OZrx
         oygXQ2ZilU46ds4uF8WLcq64JbthLynSPMPxdTEOtgVXZAyuQGZUZQwG6ILXmkyoPPaG
         CAuPnja9LVcBtdDIvdBW45MUm4OV/HN2oTbt6igoy41g+uri71rLwFR1Iqdrtjj/3V19
         oGDNsG+1MvOX+yZPlrNjgS4mwsQUkH0zDZKnAdA45VSXQaI/RVyMZpQo2PqG/3CKdTsD
         h4rw==
X-Gm-Message-State: AAQBX9ciLahwKvHO8RfZij+rADX4L6bTJ9+y6uh7demTclpYLjXKf6Up
	jBu32h1UlA27bM8b2ydIMxiTRg==
X-Google-Smtp-Source: AKy350YO3rCwkHdihHwCXjADB69g4u5IEusvmVJiBFvhLAKl5kiRPj0x7n0fICHOX0aKJWsTRc8LOQ==
X-Received: by 2002:adf:eccb:0:b0:304:6a26:1f6 with SMTP id s11-20020adfeccb000000b003046a2601f6mr8788211wro.59.1682506184497;
        Wed, 26 Apr 2023 03:49:44 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 25-20020a05600c025900b003ed2c0a0f37sm17601988wmj.35.2023.04.26.03.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 03:49:44 -0700 (PDT)
From: amergnat@baylibre.com
Date: Wed, 26 Apr 2023 12:49:07 +0200
Subject: [PATCH v6 07/12] arm64: dts: mediatek: set vmc regulator as always
 on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v6-7-8d6b1cfe7f29@baylibre.com>
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
 Fabien Parent <fparent@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=905; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=jb8Pa30ov2+ZPPhENOaqkgR5C98qawN6Ey/hi9N+dOQ=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkSQG/jd//PO4vFJocP906Qdo6v4ZswQDAyeTdApt/
 R4X1SoGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZEkBvwAKCRArRkmdfjHURQScEA
 DHYEzk/CAR3pKFVbUQzHScLV61Nj3ShHPazSgecJdtrcft/9wq+g3EHK0cOzlfC7s/wTED1onhKxMc
 T7oIjtnXeXQCKp1/4fFizhdHiVXaO/CYS6CPF0zRPdDUsGuNF08IGNUNV1c770cfdN9X9Vmequuhrn
 +i3FY1G+X3xKv+NViPH3RpoibdSDBOfDVJFKZ7cNUIVgGIQ5QyvRcVPEx148KXW2JoUyrpFk4r4R48
 UyuC+Ngb7VixvD3OvdRCDrAZMApjNMoZiujcjwH9kHRk/qSnBEsY5Z52gKPeRUsip2zSree7+nKpgY
 IcsQ/xFK1Qr9MkFDoeVwPmxCYlSC5w11j/PVBx7OIeAlpqNwQWhaIDoFWzN88rXn1p3M5rxQOKTxO1
 j4KZlyWRhzl4VSMRJH35kgAN9L5R985JO3Jwb8nCcq6ytl/X4c0hbZW0D24ocRvoag1bIeApCxvc5V
 +hAy3pv19vifqhfwSoXISMnw4Hi8f5LEgdzy/0r1QzDmitrNCVjtj3KaC1WQwgdr6vZsiTCVi8uiUZ
 MGfpIfkJiS15y2XDxlkgtPyguf8TPBf02RIztg97V1bUu29JEbWSSNP6GhLH/9Ma7S8mRvUsi7IScZ
 OKP/7tjYjZGCERYILTch31ueYPGhDtSFg0YTCDluwu6Rt3QsqcvO6eiFiddQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_114946_795899_5CB86657 
X-CRM114-Status: UNSURE (   9.94  )
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

On downstream, we observe that the MSDC IP (used by the emmc, the micro
SD card and the WiFi) isn't working properly if the VMC regulator is
shutdown.

Make sure it is always on.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index cd920d09c3fe..ceed6cb8152b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -137,6 +137,11 @@ &mt6357_pmic {
 	#interrupt-cells = <2>;
 };
 
+/* Needed by MSDC IP */
+&mt6357_vmc_reg {
+	regulator-always-on;
+};
+
 &pio {
 	gpio_keys: gpio-keys-pins {
 		pins {

-- 
2.25.1


