Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BB5C46CD3
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Dec 2023 19:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0O8RtIP4pYk/I1CB5YssfqNJgeBGU8rziw+9z/3E58g=; b=AxqrIS9AK+HKubatjJCwhC/+u8
	XNts33zJMtNf7eSh49yBNjtyNnWXHlLs7te4OhqvrmPFVhRKy0GBOBD4Mc0H2cImoGMmizRqj2pCF
	BLyP0NxiFb0mVvIChfKYJrqzJN6evKu15FBjClSrFnK40X4Nx1DCrEtlXl6YGDcL6ykjHOLmDkYWX
	Lz4YhjQqVTinyhhwBlrt2JvIQnliFFiT974SGgKiFbvbLKGKVWyzDO5YCJEXhYWNy4fKHwU/Yu+8T
	0Hsu3hwb6Gmc9qqH6QcwV5tw+UjgwEUfAlSVkBW9fSuoZfOk2Ufgc3R8K13o+4D2wXpIhcSJ+9z/1
	QT1s8qsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rID0n-00DQ5h-33;
	Tue, 26 Dec 2023 19:22:46 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rID0H-00DPl8-2N
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Dec 2023 19:22:17 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-35fe47edd2eso6971705ab.0
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Dec 2023 11:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703618532; x=1704223332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0O8RtIP4pYk/I1CB5YssfqNJgeBGU8rziw+9z/3E58g=;
        b=daZFaTYFqt/WrzOwCMvMoKgbfWXuG6+3vxzgIf5CicoDa6eXrcnYfg5UsL6IpWtLd6
         Xv6ua7HtD09Ey10qzIEOcrNpz7XmeC6v2rd3IR4/8QVFhc4n/xBOfSYNNlNnmsx6ZQNZ
         X07CxPnH9YFGd7uFZWBgjfraDqv9ohkJInVj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703618532; x=1704223332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0O8RtIP4pYk/I1CB5YssfqNJgeBGU8rziw+9z/3E58g=;
        b=RXMgyx9pIIhXTtJkRXK5chgT8i0ig2LhocW7q1zZ9Hqj+cYD4Vy1lh6pkmsnbrYapo
         QU2nBxeyz2uggaW4Ig1lfKAR2g/17YtEKPjNKJDShxodUbskkjbBKEof1htA1WOCs7Fe
         sqALKLHjDDYJOf/k66PtakTRGxbl32CUHnBtaayoYByk9RuKV1whMsXVJTWq/nIg5jNZ
         b6McsXdax9dbtwFVuFpG0ra00E4fVaXbwJYr0KtZkOiecnrA86+z7M07tKzzxbnfA8Ek
         j3vigCGIMqopMqq9t8fmYT0d+FcG/Jybntx8hwT2StwqzS28slRTcG7f6oq2kZhRlv7K
         TyFA==
X-Gm-Message-State: AOJu0Yx9tbL3UciatGK8VJady4yvhn3+OBXHk5/UvOkkhqMRXwt2vLon
	MSm4AlXf/8gv60u7/uT+6+a3bQWWc0NO
X-Google-Smtp-Source: AGHT+IEPvjdPgLWnim9CRScF1zgDLSQesNC/8qGs5BHhtwyK/zW05fi43O35+h7z9keU2BUHrJr/5Q==
X-Received: by 2002:a05:6e02:1a08:b0:35f:eceb:f845 with SMTP id s8-20020a056e021a0800b0035fecebf845mr4107785ild.8.1703618532594;
        Tue, 26 Dec 2023 11:22:12 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id gw3-20020a0566381ee300b0046b692e719esm3207609jab.150.2023.12.26.11.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 11:22:12 -0800 (PST)
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
Subject: [PATCH v3 12/24] arm64: dts: mediatek: mt8195: Enable cros-ec-spi as wake source
Date: Tue, 26 Dec 2023 12:21:16 -0700
Message-ID: <20231226122113.v3.12.Iee33a7f1f991408cef372744199026f936bf54e2@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231226192149.1830592-1-markhas@chromium.org>
References: <20231226192149.1830592-1-markhas@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231226_112213_799301_9184113B 
X-CRM114-Status: GOOD (  12.57  )
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

 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index bbdcd441c049d..2edb270d0bc2f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1149,6 +1149,7 @@ cros_ec: ec@0 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&cros_ec_int>;
 		spi-max-frequency = <3000000>;
+		wakeup-source;
 
 		keyboard-backlight {
 			compatible = "google,cros-kbd-led-backlight";
-- 
2.43.0.472.g3155946c3a-goog


