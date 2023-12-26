Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E60C4706F
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Dec 2023 19:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=72Y9hKrM6wg7C/dkdJ1azVBKmo9vO5yjLJYb3Lbo8g8=; b=M6nEm6cLcy5zAPlcavKDrbvtHS
	45wHkhbZcR6BEqjJ+kILMvPTBtFOY1GhzxwSlDG6FzREqeR1GWI/OFO9NEL9mDL8a3EKKdwzjxdqd
	23ui17tN+wuMVzH+M5c/kquw+Ltrq6/U17Ku7GuC+aVUJhCICUNtCQ8SHcACvdlGPoRASpyeUPTz2
	z2QuwaoCp9boFD5n8IAVuzT20gDpvARWhqhMl7bEJ6v6UZFydqmiEf0qutYOxRYZmIBqrrNDPlkfx
	UkITQzaMKKHWiY6sRrRv3WR2zZQHPkMAzR+q06JewmhhJpNrdjMRDIMvuCgzAjU6lHiD5zuHQUp1X
	IDG7XUdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rID0J-00DPnd-1n;
	Tue, 26 Dec 2023 19:22:15 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rID0E-00DPiz-1R
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Dec 2023 19:22:11 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-7b7fdde8b54so249161239f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Dec 2023 11:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703618530; x=1704223330; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72Y9hKrM6wg7C/dkdJ1azVBKmo9vO5yjLJYb3Lbo8g8=;
        b=E8kZ3h+jaPMk4CLZGtQEyZ+3mFaqyakfo6uZnsd9vPuvOoktZDAUK1tZurDEnTBVc0
         YoVY8K8MS2T4xR8TubJRwtpseaDLpcfsnfV3djKpWU7fJ4sYXNioqIrTRB0/QdvjS/+1
         IqA0ZmLX8a7H/O8rclSJKUlPMEt74iV1k0FR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703618530; x=1704223330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72Y9hKrM6wg7C/dkdJ1azVBKmo9vO5yjLJYb3Lbo8g8=;
        b=TCmfFHxj/zy6zVwx0m/lppuLu3cun8Rio/Nw/un0b/eHh6Yl8qPzvpFmSL3rh+8y0N
         crPIo+Go9cZSawPulRYlPxU4yrUIlC6WhLrj4ht2lay6vbG1v/TvhB9VSxarq9/ovU7o
         3vZEfZlnxs66hq7zTU4kjwmZeORttdqIhAlkqWn+1FPU4yXS/pg4kufe8GZaWG/8+7F1
         RWyS60PXfFkLJfU3nPdELHi2D/D2H4ut96lOpt7CzUDvnm/Mphh3DC/FypTPT/4L6fjo
         AkUFQteWHRubMuGH0KKM/ZM7sOVgpoIuJtCCJhYKTH1fuRK6NRQlKFbiQeX2icKtia41
         rlOg==
X-Gm-Message-State: AOJu0YywxnGsX4vbGrct0326awpHT9TkknCAzuhCcMfhb68jOOr7cloI
	GH/GPxqJUzsdILf8rq+iP/sbJwjgei9S
X-Google-Smtp-Source: AGHT+IF6JaIjJ+4nkw3XKAI7b2qhT+RLQRJF93my4pWqagV6xX2LpANA+cbIE30OOMeWGip9I5fCQg==
X-Received: by 2002:a6b:d807:0:b0:7ba:9ad0:657f with SMTP id y7-20020a6bd807000000b007ba9ad0657fmr10906914iob.0.1703618529969;
        Tue, 26 Dec 2023 11:22:09 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id gw3-20020a0566381ee300b0046b692e719esm3207609jab.150.2023.12.26.11.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 11:22:09 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Raul Rangel <rrangel@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Mark Hasemeyer <markhas@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 09/24] arm64: dts: mediatek: mt8173: Enable cros-ec-spi as wake source
Date: Tue, 26 Dec 2023 12:21:13 -0700
Message-ID: <20231226122113.v3.9.Ic09ebe116c18e83cc1161f4bb073fea8043f03f3@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231226192149.1830592-1-markhas@chromium.org>
References: <20231226192149.1830592-1-markhas@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231226_112210_485123_0049A6F4 
X-CRM114-Status: GOOD (  12.58  )
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

Some Chromebooks use a separate wake pin, while others overload the
interrupt for wake and IO. With the current assumption, spurious wakes
can occur on systems that use a separate wake pin. It is planned to
update the driver to no longer assume that the EC interrupt pin should
be enabled for wake.

Add the wakeup-source property to all cros-ec-spi compatible device
nodes to signify to the driver that they should still be a valid wakeup
source.

-Commit-changes: 3
-Update commit message to provide details of the motivation behind the
change

Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
---

(no changes since v2)

Changes in v2:
-Split by arch/soc

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 8d614ac2c58ed..335aed42dc9e3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -1155,6 +1155,7 @@ cros_ec: ec@0 {
 		spi-max-frequency = <12000000>;
 		interrupts-extended = <&pio 0 IRQ_TYPE_LEVEL_LOW>;
 		google,cros-ec-spi-msg-delay = <500>;
+		wakeup-source;
 
 		i2c_tunnel: i2c-tunnel0 {
 			compatible = "google,cros-ec-i2c-tunnel";
-- 
2.43.0.472.g3155946c3a-goog


