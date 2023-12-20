Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A942DC46CCD
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 23:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KIM4NQPVUw5XQPjNCJNZ+EzGM62sn2zFTK1BxHqm24=; b=DJ0GWonzEQ8VahnXe0U6JNQdrf
	ReXsRndAsXI1DtPq1swaCgbFz/1sNLDaKKY/LNISOIIpdoeaZFhJNkrlaNacrdDeHUtxgjFkSo+oh
	1XdP4i01FWpp0GoIQl8n3O8j5zaGNJOR7nvebMCoAjbZ9frVpAxL48UKXuGaSZ1l90wPD079+DXx/
	QjkvniWwXGL+FvhHfS4PTGpNcBGNvwVklTejnRRrkbq6Fvsrx8jmNGSLcqguFrYAdfWFluDz4foZm
	MhbJr67LmDfj7c5SKohzUfWvJpg1vXjhEuXpItEG2mmhR1kqzIWVXmE3ioZFKQBhcJM3QT9iWSr74
	KmTsXQDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rG6PU-001IT7-1u;
	Wed, 20 Dec 2023 23:55:32 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rG6PE-001IMK-38
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Dec 2023 23:55:18 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-7b7a9f90f34so11195439f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Dec 2023 15:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703116516; x=1703721316; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KIM4NQPVUw5XQPjNCJNZ+EzGM62sn2zFTK1BxHqm24=;
        b=CpsFHy9r2UPGNPkOpF04OImHebqClBlkbOS9v4D74BFgakl6gXmDDNp7cUGx0xE8kp
         EjTAyjQMevO8J3tMnL5PNwwPBOuvlXFMYcU7wfUao6Dhg+kNuDkF7ubBSpWl4JlCIg/8
         IKePhr3JrGg1EawSPBmFCqImeZdKMzy+uhgVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703116516; x=1703721316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KIM4NQPVUw5XQPjNCJNZ+EzGM62sn2zFTK1BxHqm24=;
        b=soiNTq6yyqLL6ryzNHju0p3UJE73TrpcV8iyYkZIyA2O5OWa1ga8sjQHT4OV74iSs3
         NtiW2oX153n4IooSwRcxWfbekV/D6mDfPqgQ/8ou7kkMlt0JgTQFMagvaTVL148LJomV
         RBnhHi95S3L19/OzD7UztAxLkbXxSfBDTK6GUo6cH0NxczMPpuuR5Q3RZ16x9OXFGs3B
         6ik1T5lVKQvoqKMpcd9NZkUW7iKdBHnD3rCDmHJfxXMas4TR5FZ2Qyk8SlfPOZAFukNz
         ChhdXCFsLuxr3tmN0Kp3eJ14MEzs5PuPf8FWsQYoxy6z2rO+XkWO4Qr4FtADJC1WMtrV
         q+2w==
X-Gm-Message-State: AOJu0YzA+CK0wBRsnhq8C1waApduOCnVCc7Hn6ktNDGNR9tUCfqGejeI
	YDjg1prlBo1B7/2D4cutC1j5ug==
X-Google-Smtp-Source: AGHT+IE5Fh0GQqdpS6aUnNljRA1kzY4Iqpzlbmpa89jfkHQhQpYtqbFAles2BemXZpQUZLiye2NH/Q==
X-Received: by 2002:a05:6e02:3205:b0:35f:7db1:3f9a with SMTP id cd5-20020a056e02320500b0035f7db13f9amr10498168ilb.34.1703116516382;
        Wed, 20 Dec 2023 15:55:16 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id bp22-20020a056638441600b0046b39a6f404sm177805jab.17.2023.12.20.15.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 15:55:15 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Raul Rangel <rrangel@chromium.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Mark Hasemeyer <markhas@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 09/22] arm64: dts: mediatek: mt8183: Enable cros-ec-spi as wake source
Date: Wed, 20 Dec 2023 16:54:23 -0700
Message-ID: <20231220165423.v2.9.Iba4a8b7e908989e57f7838a80013a4062be5e614@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231220235459.2965548-1-markhas@chromium.org>
References: <20231220235459.2965548-1-markhas@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_155517_033153_24F4D3C7 
X-CRM114-Status: UNSURE (   9.96  )
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

The cros_ec driver currently assumes that cros-ec-spi compatible device
nodes are a wakeup-source even though the wakeup-source property is not
defined.

Add the wakeup-source property to all cros-ec-spi compatible device
nodes to match expected behavior.

Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
---

Changes in v2:
-Split by arch/soc

 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 7881a27be0297..06cbf29d16215 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -922,6 +922,7 @@ cros_ec: cros-ec@0 {
 		interrupts = <151 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&ec_ap_int_odl>;
+		wakeup-source;
 
 		i2c_tunnel: i2c-tunnel {
 			compatible = "google,cros-ec-i2c-tunnel";
-- 
2.43.0.472.g3155946c3a-goog


