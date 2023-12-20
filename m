Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B9FC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 23:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2yCVu6I1r+NRnz/AsvfCkzFQXXECY+E6K5qe+5haxTA=; b=ArBzxbMRDVo9NjgtEoiF5iG/Wu
	pj3doD9cDW5C9OofECyXbOTgGednUCx4gVx6sWPS1ftlC8KwMeghyMxX01byOWbGnD7Sg5F3gs18F
	tJj5RXf9Y5V18whWJHD+urDDAmzSiP9WJB18d51OlkdqpQq8mcq+CJ6wjgAoc0MeQwTjMgyyhyj6Y
	eOqMGAsnyetJumuSbcxlc2no8/wDorJaW2pNonZIku9pZBgl/Yf9KDnmo4X7oe1fCgWqIuo+Oz1A/
	PtCKVSL6Mz28He2uenAPf4tMjFj6CBGibaPml+rC6cHV8yRgZElM9G46xKXRmHC4Kg5wae4YK+9Xn
	4kC/+YXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rG6PT-001ISR-1z;
	Wed, 20 Dec 2023 23:55:31 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rG6PE-001ILJ-17
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Dec 2023 23:55:17 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-7b35d476d61so9604439f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Dec 2023 15:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703116515; x=1703721315; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2yCVu6I1r+NRnz/AsvfCkzFQXXECY+E6K5qe+5haxTA=;
        b=Y+4AtJ+xyQgWoFJhLoX1wd+h6nTIjgZCpRpHYD5tuvO5+BZ5XNT+KEgeTAJQ4ld1yX
         k4QdU8hMIwdHg2PRH8zjL0ZXbyBzd1v2a4asxUVnHDyoNXDHyORdDqJ12qDjst4h+Om0
         +46I6g5OSPDgV3UKiPgNhoMTXAajxjCIuxOQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703116515; x=1703721315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2yCVu6I1r+NRnz/AsvfCkzFQXXECY+E6K5qe+5haxTA=;
        b=PMZ50SX4fRBM9tuXVXTu3gPo3Gs65X9YtyrUwIj7dMnAAs+7Iu6SCrVUPVlNQQz9WT
         RHLMx3vTsmpyGka6544WNWv2O+x9yZwP2OTDjglQOb/Tt1IuGnn+TaC9dKuOXi37aTbU
         6NF81FyR+5D4ijVVnWIl9XwWO4sn1tL1rtHsiUTmLmWa/CIHmSZ8FZPk1r03NOUEckiM
         iDSeneEvUse69JHhEFFb7eiIGmGB6nwqEEkw8CTmR7CK7KoXyxnV5zn2aogPR2kitkiI
         qpKFfJfpZUzPadocnFOo0O2RTjlBiSZQm136K0piyV7PaH8U/L6I8c84KIEgH21cJt4U
         kxcw==
X-Gm-Message-State: AOJu0YytXfYiIET0HjSw9BsjKm3la/gM1d3sczpgkmaauSyYInLcLLDg
	0dIXCidb3LXbj0t2M/b4FeKTXA==
X-Google-Smtp-Source: AGHT+IGQS9ViCfOP9DV0BcBpVda4PiMnNXFrq7RZGrtBIBlYRUtl6txSB+SASJAG9M8UOIfTNMd85Q==
X-Received: by 2002:a5e:de46:0:b0:7ba:8b76:6f65 with SMTP id e6-20020a5ede46000000b007ba8b766f65mr67557ioq.9.1703116515275;
        Wed, 20 Dec 2023 15:55:15 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id bp22-20020a056638441600b0046b39a6f404sm177805jab.17.2023.12.20.15.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 15:55:14 -0800 (PST)
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
Subject: [PATCH v2 08/22] arm64: dts: mediatek: mt8173: Enable cros-ec-spi as wake source
Date: Wed, 20 Dec 2023 16:54:22 -0700
Message-ID: <20231220165423.v2.8.Ic09ebe116c18e83cc1161f4bb073fea8043f03f3@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231220235459.2965548-1-markhas@chromium.org>
References: <20231220235459.2965548-1-markhas@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_155516_390808_DBFCB8B0 
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

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 111495622cacd..190a3ffd81471 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -1163,6 +1163,7 @@ cros_ec: ec@0 {
 		interrupt-parent = <&pio>;
 		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
 		google,cros-ec-spi-msg-delay = <500>;
+		wakeup-source;
 
 		i2c_tunnel: i2c-tunnel0 {
 			compatible = "google,cros-ec-i2c-tunnel";
-- 
2.43.0.472.g3155946c3a-goog


