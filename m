Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40160C04FDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Aug 2023 15:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJmTT5Birsmw3IffSKTzNizstUWs73hZ2XtnCyouma4=; b=FiaXDgY6QL4UvzzCkIEFStTu5s
	jyqFXRYP9Ch/U3x4ER3U3wfWJNNpTkBHC1hqSDaS7B19aMBnDJcrMnwAiUVHixYg358KaMCrCzj8k
	HJNKedj3/aN07458EzR4pkgaubywV2tCvszZHZI3MP7lrtQVcyqXBXcMOmEm2ssj3H/D3W15Q17sA
	v9ZNBbz3NzwgqyAnUEPB7BZrS+rQ/BgrPTXWngD0Kqv4gjTtNmkjAcowOHFRp1dx7CIJwErLp1v/l
	n3HP5p+ZE6OO7lwPiSxgnewx1Omqisshv6OX93+5dROuikJFKdAnLImRVkHIXCr6bY6wTdr8G3s/T
	i15T8W8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVwEI-001tKh-0P;
	Tue, 15 Aug 2023 15:45:10 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVwEA-001tFZ-1H
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Aug 2023 15:45:03 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6886d6895a9so369143b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Aug 2023 08:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692114302; x=1692719102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJmTT5Birsmw3IffSKTzNizstUWs73hZ2XtnCyouma4=;
        b=EmtRFWNxOZBhCSvbwn/tqeAcE99fLpxaVbN7woJu/mWoDOtjxym1jTZkxHhu07Rkyt
         aRrgPSp/P/3sucNU9SeuOykjKSQh3VlqmEj8eU7wU4xRqA6huNIOrfmc4oNT57mf+z5F
         6gU0Vk6XMHXfclV87Ur5S7pFb+TluJkDGSF1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692114302; x=1692719102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gJmTT5Birsmw3IffSKTzNizstUWs73hZ2XtnCyouma4=;
        b=b3MtNvZYap3+udsjyE3iY2ob10oP1a8UKjU0dgp/mPnk1huwnuxD+Kwi5IeXafipGr
         1MM7B1Q/4O6tCiQc42VfNQLpnBg3rh90yYN5GxpNJD47ZNl1wkSO5GKmqsDp67oMP97P
         8E9SS65peVNg0ImLTruNyWaIfBng/eedrfL5//+W7DNf/bGC3JFcYnx6Y7gUFzWhRxPg
         xDnSulXRmMgD4CVYJSea55r6wgHFZFoK128lMpdJ6zezscQGzF2JLLGFuNJaKr8HApQg
         i2os4jBBsoj1O3Lmq1r3on/sDtG6G9v4WoC8sVJPkVa/rueBmyXSjL9RPXGsovR/+XpH
         jWaA==
X-Gm-Message-State: AOJu0YzMHZtaS0meyMX/eRw6YpOPg7AxnpeftASRlQYS6gQOzpeDkwWq
	05BPiWQsVLskkxgLxB0qolWZGQ==
X-Google-Smtp-Source: AGHT+IF1i0bsPTgkJk9HYJHsQ+5ia/nkZZCBU7zl2is+oYE8IhKDNs3GjUWaIoKqVbHs5puDt5BuXg==
X-Received: by 2002:a05:6a00:10cb:b0:688:48be:50b4 with SMTP id d11-20020a056a0010cb00b0068848be50b4mr1899247pfu.16.1692114301925;
        Tue, 15 Aug 2023 08:45:01 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:40cf:3807:f8c8:2d76])
        by smtp.gmail.com with ESMTPSA id n13-20020aa78a4d000000b0065e154bac6dsm9431247pfa.133.2023.08.15.08.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 08:45:01 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	"Miquel Raynal )" <miquel.raynal@bootlin.com>,
	"Richard Weinberger )" <richard@nod.at>,
	"Vignesh Raghavendra )" <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	cros-qcom-dts-watchers@chromium.org,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 4/4] arm64: dts: qcom: sc7180: disable quad mode for spi nor
Date: Tue, 15 Aug 2023 23:31:55 +0800
Message-ID: <20230815154412.713846-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
In-Reply-To: <20230815154412.713846-1-hsinyi@chromium.org>
References: <20230815154412.713846-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_084502_440666_219E93B9 
X-CRM114-Status: GOOD (  10.10  )
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

Some of the SKUs are using gigadevice gd25lq64c flash chip. The chip
default enables quad mode, which results in the write protect pin set to
IO pin. In trogdor platforms, we won't use quad enable for all SKUs, so
apply the property to disable spi nor's quad mode.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 5a33e16a8b677..0806ce8e86bea 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -436,6 +436,7 @@ flash@0 {
 		spi-max-frequency = <37500000>;
 		spi-tx-bus-width = <2>;
 		spi-rx-bus-width = <2>;
+		disable-quad-mode;
 	};
 };
 
-- 
2.41.0.694.ge786442a9b-goog


