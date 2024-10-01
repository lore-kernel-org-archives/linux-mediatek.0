Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C050CE7D12
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 11:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LkkLEEucgoW7bgbQKsmRzFtFQZp/ikQpw3ZnY6QygrQ=; b=1+lFq9JVoEQ2hR
	5mPc6sxwtiGSS6MObvAhO8ewzaWxElyYl+qssX0kChBfRaM0GKzl7x4rld5IQReVSVyV7X7Zc1c75
	W5frJ7opQ6XreH07l45fjedLAN14Fuy6arpg2KSWyClv1rpNfeznWe9weVOvH7mQZy0uvAsE54Nxp
	PBsqOJ49D4COEINZ6XuaJQe9wkdx717nhV0tUK4SlgK3h/PQJz7/eRdq+J0x2UX4v4xBgH6S35Zdy
	TUj+I2LvQl5HG5LfAw//fXJJTJvYs9k2Cp8Hpwnn3g/IztX9wnY1fV9HOYs8aHrDWMH++IHJIy1AG
	3l5GowWMcGeu2L1kLUPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svbIF-00000002Z7C-0CEE;
	Tue, 01 Oct 2024 11:43:51 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svb6L-00000002WOD-3aFn
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Oct 2024 11:31:35 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-71971d2099cso4356720b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Oct 2024 04:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727782293; x=1728387093; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LkkLEEucgoW7bgbQKsmRzFtFQZp/ikQpw3ZnY6QygrQ=;
        b=XE946Lp6tpMajEzMlSuHk4+WaHnfxhnldGA/T6GJGVyiIYr7ZzzA2K3XeHh8cCj7Qk
         j1Zx+4B06vWb4wYG20u+B/V8g/4ESi+2LHxKFTP6TfuhGCZ7uPtDhzYBgJNJPLseoVZo
         /EuBBS/6dnodQHxWt79imVfeiFgqyHsPO1DHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727782293; x=1728387093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LkkLEEucgoW7bgbQKsmRzFtFQZp/ikQpw3ZnY6QygrQ=;
        b=IvNWShLr8/m5yot+bYK0yWt7/GEjSeuZ/se12E+3vrRkS8aaV+2bZh9GCe7Sx/7r0A
         BuqwvIegnRCx49HeltA3IjsRXDAshg0mu4m+KF5a4T0nm/CHrgYVO5rr9OhJUKYPDqap
         77i69b9UmuLIXA+WZbKynQcDyhhStPwUl9E3Cw2ePE4EstS69dQ4KcjDZ56YlA/Y/rAL
         pDJVv/7QmrM4XAJZ19v9+I6xsMV8yO3eqsdR/piOBVCRV7nFpkAHtJitv8t7mSbMoKrS
         3N8AoaoJCIXv4nAnbKZ+i3KAmLmN5Ug1DmRfUg40QIUrR4R54n6PsIY0GPr171gWmnqg
         fv1g==
X-Forwarded-Encrypted: i=1; AJvYcCUt9U41uULm4jtiT36SAZmqijVTXFXlJ09Sd65wcSxKyeTZys6qR0BS3cwHXAtgBAjU5KCUdVcrtaD6ttLQcA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzI3fyb/xI5GY7HAT00x4xCu3etB/MW6Z9/Bmv2N1jO0ieDN+mX
	K1yi0e3kIPuCmeZ/qptfJGxNIipL75sP99kpIFYXwyvHhVl79RHz//MSVftVQAY8grVqVszSLK4
	=
X-Google-Smtp-Source: AGHT+IEgzRkoFd2sNCI4/vjWyPLOdY4pO3TPXtmTpmnMfuOP0TUArqKEjA+xqCTmER3Sm89xeggSoA==
X-Received: by 2002:a05:6a00:194f:b0:717:e01d:312f with SMTP id d2e1a72fcca58-71b26078cf5mr25062339b3a.27.1727782292819;
        Tue, 01 Oct 2024 04:31:32 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:e044:f156:126b:d5c6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264b63d9sm7810646b3a.52.2024.10.01.04.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 04:31:32 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 5/8] arm64: dts: mediatek: mt8188: Add missing dma-ranges to soc node
Date: Tue,  1 Oct 2024 19:27:23 +0800
Message-ID: <20241001113052.3124869-6-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20241001113052.3124869-1-fshao@chromium.org>
References: <20241001113052.3124869-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_043133_920671_368B02E3 
X-CRM114-Status: UNSURE (   9.63  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the missing dma-ranges property to the soc node, similar to how it
was done for MT8195 and MT8192.

This allows the entire 16GB of iova range to be used and enables
multimedia processing usages, like vcodec and MIPI camera.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index cd27966d2e3c..69390da9cfe0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -878,6 +878,7 @@ soc {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		compatible = "simple-bus";
+		dma-ranges = <0x0 0x0 0x0 0x0 0x4 0x0>;
 		ranges;
 
 		gic: interrupt-controller@c000000 {
-- 
2.46.1.824.gd892dcdcdd-goog


