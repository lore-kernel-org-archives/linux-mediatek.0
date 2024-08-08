Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F32C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Aug 2024 09:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L6K1xKrigqLUKfosZWg5PePAmCLxQRgMDc7IWF6RGgE=; b=MqJs1/QLnTSmE9rPSrWJ8Wf7wJ
	c1SIoGSru8RTXrYq4C9AFpnfFQA9mFVrVcMUl1NcIGV3GSwQXc5GBPYXW5CA+cm8Xd9ZE9JM/aKm/
	Bl0mNafex6SpAfClmVLkiRIbsTEYSI43LMoE0RYF9FYrqS6bEfVG+paI54svQrHe51Xwwtxu/6JYS
	wx+GDor1g0fh1hRYNv+mfp9yMYfSsPSfCK3qFiTtVgd9FoxufHOOPmZEy1ALgYhASyyS/NVDmq40m
	bW/WzaGThcyydWRiTbQUMwFyMxHE0xsC1+fI0shRF4Y+sYN/jEEG5UAeLvPAVxPnd4252dkGe/C3V
	GPY7Bd4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbz9L-00000007fsk-2dX8;
	Thu, 08 Aug 2024 09:09:35 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbz9I-00000007frk-3kLn
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Aug 2024 09:09:34 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7a1be7b5d70so597435a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Aug 2024 02:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723108171; x=1723712971; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L6K1xKrigqLUKfosZWg5PePAmCLxQRgMDc7IWF6RGgE=;
        b=eI1VefowN3XYb+27Bv8RwHOyxtWnRktgvgQRi3hx85AAvYNgek0m71SPiy2P1n1U5g
         fY9o+6vHI01gQJeFHNER/1Nvy+69bMAr+kOoBJlczivKWBYqP06wbbWXykqeCKC2xB3x
         b6e5+C1eFozS44HRQ9H/3DpaC1i3sYl1nHbuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723108171; x=1723712971;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6K1xKrigqLUKfosZWg5PePAmCLxQRgMDc7IWF6RGgE=;
        b=P9Z5XEmvkojpIXScuT1hH6oTqJhLcNmTvU/driEiqn4bpLOxMaMO0NEQbAzcn3TJah
         pVUqFtEdIQ5HCIjmTViD+AF74D0HCQMSclLIWVB8HkcbV8mkyANOiui0XQsfCxFeZjS8
         0NPp8HZSSDE0WmbMSw/30nQiYlupNTfl5nTgpBuK04xdVp49WkQqjAgHuesHMbrJiWV9
         wYjf9cS+StgZzDh079M9iS7JIxoiSDNUQ+mr5vZEZViFdn04WRo9agYMkTaXS0iVdQbR
         9KDQJ0Q2UdVStTdZ/hOaK+iulpsPqq2RmX+snOQ0K0PxHWEGfyBHsM9RHKtZzj1jIpQV
         rnMA==
X-Forwarded-Encrypted: i=1; AJvYcCXkMzuyhyVfaWHAtWzpgfSoF1pMp6Fx3L89c088U7f1RkL0OWXOQyx7hmosNf1ikhFqi+4xHrEesWvCmwSL1Ta+jOw8J7cQmTt6zj5xbAlq6xEl
X-Gm-Message-State: AOJu0Ywz/JycTelr1gVP8rUQ8CVt0u6kWiTvmoKIwqBMbnK6+JupehTj
	Uf1pkzJzJiwrl28wJDcUeMEb1ett92dAXwGqMuf6n/qCGEItgwKPcytauXk7Jw==
X-Google-Smtp-Source: AGHT+IEpIPr/0CxKkHq6jZNXwMVmpNr4/DF3EQ3KKvxR+I1+GgdpapQxRaKB/YWa0tZ6ccU9yAFqBg==
X-Received: by 2002:a17:902:d488:b0:1fd:7ff5:c673 with SMTP id d9443c01a7336-200967f6b7cmr16916805ad.2.1723108170942;
        Thu, 08 Aug 2024 02:09:30 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (46.165.189.35.bc.googleusercontent.com. [35.189.165.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff5927f40dsm119661445ad.229.2024.08.08.02.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 02:09:30 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Thu, 08 Aug 2024 09:09:25 +0000
Subject: [PATCH] arm64: dts: mt8183-kukui: Add trip points to each thermal
 zone
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240808-kukui_trip-v1-1-6a73c8e0b79a@chromium.org>
X-B4-Tracking: v=1; b=H4sIAESLtGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCwND3ezS7NLM+JKizAJdMzMj02SDRFOTZFMDJaCGgqLUtMwKsGHRsbW
 1AEhUmk5cAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-37811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_020932_985839_DDE37E83 
X-CRM114-Status: GOOD (  11.16  )
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

Add trip points to the tboard1 and tboard2 thermal zones to ensure they
are registered successfully.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 6345e969efae..1593ea14f81f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -978,12 +978,38 @@ tboard1 {
 		polling-delay = <1000>; /* milliseconds */
 		polling-delay-passive = <0>; /* milliseconds */
 		thermal-sensors = <&tboard_thermistor1>;
+		trips {
+			tboard1_alert: trip-alert {
+				temperature = <85000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+
+			tboard1_crit: trip-crit {
+				temperature = <100000>;
+				hysteresis = <2000>;
+				type = "critical";
+			};
+		};
 	};
 
 	tboard2 {
 		polling-delay = <1000>; /* milliseconds */
 		polling-delay-passive = <0>; /* milliseconds */
 		thermal-sensors = <&tboard_thermistor2>;
+		trips {
+			tboard2_alert: trip-alert {
+				temperature = <85000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+
+			tboard2_crit: trip-crit {
+				temperature = <100000>;
+				hysteresis = <2000>;
+				type = "critical";
+			};
+		};
 	};
 };
 

---
base-commit: 21b136cc63d2a9ddd60d4699552b69c214b32964
change-id: 20240801-kukui_trip-6625c0a54c50

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


