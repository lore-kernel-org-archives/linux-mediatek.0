Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624AEC25B79
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 May 2024 18:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCQY2UwLMwXuUNNo6TcYvWSj/vr+JcFRqOkL1wG1t8o=; b=io9xBwq7e0Awi1cj/lSKtgkcI8
	JclCLa21r0NobKiMpLDBscaje6bli3IDBOLawWef/k9VgtoRtCjiIwz+cedNU2x7PAbN36M08mh0h
	5N+wLit5VX2qBUpqJHtGlQC2N0j1xRASABvU8st9sPBP0Xmma5ZDjXIJQh4jw3RdlZboaT+uDpJPa
	S4exro3etYy99XjIQknJs4kfD+OByOOlOHOYwuK8xhOXQhMZj+Z/UM5L5J5ALYZqEveNJr+wMOF6M
	jC5jdqL6d4eqWY7s6SCi4KWKmvvGKqpvIYkmV1qiG9yc6BLs7k39Bwsj4itVAqsSDM3P9/8q+qKok
	MwceutAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8lVP-0000000CWwB-2oBu;
	Sun, 19 May 2024 18:43:36 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8lUg-0000000CWOY-4Btz
	for linux-mediatek@lists.infradead.org;
	Sun, 19 May 2024 18:42:52 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5206a5854adso2314857e87.0
        for <linux-mediatek@lists.infradead.org>; Sun, 19 May 2024 11:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716144168; x=1716748968; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCQY2UwLMwXuUNNo6TcYvWSj/vr+JcFRqOkL1wG1t8o=;
        b=VFN9TFynGXvtHSb2/YucxZJf4YVndYO3R2OEgSJ7cLo50VUUC1c5WXYpuCw4OMYOXV
         g5r7ULV3OIcY+9J2fVp55eqsi7kUC9zEqjyPi4K3mcywnzS+zdIomdZXRBFPC7yIIM1d
         UOe0nLaJirDf0+QaXUoWk7bqOyjHd2x+B8teLn8hn8pIilvnTE2GUQnyPvasVvg6PUru
         ZsSadg9R7JzK/ViOGshQFxS7I9AkEU33UuvYl7NgiVbJv9KTI6SToF5uLBMWm6KvWmGD
         sDna7TGb0uTkO1OtmIF33Vr0Q/A3YwNH7gs/Cq2R4DW+BSITq5tQ9XdkfCLyBhiiy4FJ
         IlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716144168; x=1716748968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCQY2UwLMwXuUNNo6TcYvWSj/vr+JcFRqOkL1wG1t8o=;
        b=wDgtLfuJ2aaN5mujBD7fXlurDh2tH1iaQV7KuZVpEbFQTA+exVrAAFkzdYlrFW5YFn
         QZe/ZGcq3v1bL/xLi26lT3IG9gViQMOTtrsHsJpqoIqqEiIX6g+06nQK64pkRcUD0k99
         q6z52tK/noov1xO9MsUXEYeV20GR4OohaKW5b1fxIXp8Phlj1QD/t1ALJsKKmDIT5Lmm
         2ZlrDROKkDlnjf6Dz3wwi4EsayxM1id8bcGf987PK+0PfHYhNgoY7ACXwZjhlUrd2HXM
         jPrHUKbPgFok74cDAHT4KmYd34jy+ohYa9iuHjyocXS9j8YdrBwqBJZYLgvxYGjGMdW/
         t9eg==
X-Forwarded-Encrypted: i=1; AJvYcCUJAkUbApM/m5sfN+2+Q8T17RBu6iLfjZRmFLIyYnuIxayO5MvfnMdGE/TkuQ01qcj+jJtrj1CaQEt5FzjB7rQVWQcorjLIHoWpLsG/MKAxSvJr
X-Gm-Message-State: AOJu0YybR5TNyY2h3IX1iNuRFUEbJWsTA7nrw/mcKUvn9QQav87/iquJ
	qp7hhsT2td7StS3ysJ2Bpyp99UFEOrd+UG+Cr1Kj8fl9vzO1PGS5wT8vU/upOsw=
X-Google-Smtp-Source: AGHT+IHYPuihIXhluNHez3N+KuunvyY4tIr2+UXnoFENn1VT4VQP6VriJDbZ4RWRXYZ/YtPnfWtfrg==
X-Received: by 2002:a05:6512:39c9:b0:522:33dd:dcd9 with SMTP id 2adb3069b0e04-52233dddd7amr19396692e87.33.1716144168172;
        Sun, 19 May 2024 11:42:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-575313d97desm1789397a12.41.2024.05.19.11.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 11:42:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 19 May 2024 20:42:23 +0200
Subject: [PATCH 8/8] arm64: dts: apm: Add dedicated syscon poweroff
 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240519-dt-bindings-mfd-syscon-split-v1-8-aaf996e2313a@linaro.org>
References: <20240519-dt-bindings-mfd-syscon-split-v1-0-aaf996e2313a@linaro.org>
In-Reply-To: <20240519-dt-bindings-mfd-syscon-split-v1-0-aaf996e2313a@linaro.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lars Povlsen <lars.povlsen@microchip.com>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Nishanth Menon <nm@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=tAtKZ4eMAZIAat7ACERGaIxU5LkfrqC2mr48OZ1Too4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmSkgX9SOPpNnSuOTGPtZ7tkW+pTexnue70E836
 cEAIxN6+0yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZkpIFwAKCRDBN2bmhouD
 19O8D/9RgvRkGf482wMxtimAsqJZs01DLhPsX8MgpZLhHhdvZS+8pXsSJtMr8RgR37s/Ghi5Z3b
 GIRq951+2Tvo7qwXAag0Swg8b9Tz1+UJMcYZ5W4RztboXnT4ji7pZysMcP5c/5ACAGwQ1xxtRMp
 elXklhLNY/6GQAPVewLInWo15FY8zS3RJvO95h2HHt2RSz8ERWgdVHxlqSP7igcTJ0s8sNxXUdK
 X123rQ1t9iDKjYIyLEZ+WWur7CeG3tHOzmRcKdYBw9qi0X4/HAw74an7ZMKNonFhluX9XoZnwzt
 FbAOWj++6X9JY6YToPbW8qQIJZbNC1L8f8sSAKeDoDbFnTEAbIaztFMtmbwnPlyvKdOVkXrsFxo
 t+leHW5vgJgWcEFtU62nM+Meu3TQnjFlcm/K5AWqCK62waXbojT2O0F0WzTYu4Ett7u0W39eu5j
 F4z59+Akx2KQJYt/ZnREnnMHj2zMW73s8xceCT8apxzXYN28oLb/75vzPAFq9gIvoh6P7AxY7WG
 x28lY8X+eqY1fmNcDoCpz9RWkU+P+WrIQVQKVq+EdpvOfi0G8H5NJPn1H/xHtHkhBPFcEHfQ85k
 5vBwEkrqBmnXU4Hd7Fna0ULhrzbEG+jARNgN029Xzk8xTM+k/iu1Q+zCoGThTGosVywiBgEI/bg
 E5s1s7fwqw4hefQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240519_114251_152325_B4306AA3 
X-CRM114-Status: GOOD (  10.71  )
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

syscon nodes should always have dedicated compatible for full/accurate
hardware description.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/apm/apm-merlin.dts  | 2 +-
 arch/arm64/boot/dts/apm/apm-mustang.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/apm/apm-merlin.dts b/arch/arm64/boot/dts/apm/apm-merlin.dts
index 6e05cf1a3df6..b1160780a2a6 100644
--- a/arch/arm64/boot/dts/apm/apm-merlin.dts
+++ b/arch/arm64/boot/dts/apm/apm-merlin.dts
@@ -32,7 +32,7 @@ button {
 	};
 
 	poweroff_mbox: poweroff_mbox@10548000 {
-		compatible = "syscon";
+		compatible = "apm,merlin-poweroff-mailbox", "syscon";
 		reg = <0x0 0x10548000 0x0 0x30>;
 	};
 
diff --git a/arch/arm64/boot/dts/apm/apm-mustang.dts b/arch/arm64/boot/dts/apm/apm-mustang.dts
index e7644cddf06f..2ef658796746 100644
--- a/arch/arm64/boot/dts/apm/apm-mustang.dts
+++ b/arch/arm64/boot/dts/apm/apm-mustang.dts
@@ -32,7 +32,7 @@ button {
 	};
 
 	poweroff_mbox: poweroff_mbox@10548000 {
-		compatible = "syscon";
+		compatible = "apm,mustang-poweroff-mailbox", "syscon";
 		reg = <0x0 0x10548000 0x0 0x30>;
 	};
 

-- 
2.43.0


