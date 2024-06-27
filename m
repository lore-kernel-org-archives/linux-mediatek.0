Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFD7C3064D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 10:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=moMeCjYqhEN2XITayIt62CdfKAiqtD6Tk3XXyMm1xxs=; b=lxtG5LkaDlWJ4uEIEtfsnO/6Op
	DsiK3baqjwsrMGLqX2CxXuTvIqPp2+hdoiyUKeZXOyoHMRTw592gvuz+QQsjHRiEt5b6eB9zhwr0R
	1sLBi/sKzZ8aV+Xjlxu3q24iQcSiNPURjVE+sfwqBIg3ZfShZ+2cxiPurKLgnSost3Id+aVZ+HvY4
	7rk6Jerm8JPKtpqN4U1kbQfp/njWlP78k6QmVvFKYhoZ1suwr1iy1lWZd/F9NVUYlmgPsm0BYB2qA
	iGTQSGXDy8zNHc7V+G4DZkkeCTpjlb+qa/C158cOsirrpZCVgxXHCEuxt2w6DtuS0WJWfQKk9tdkv
	zS12Vjkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmSF-00000009xpB-1nbw;
	Thu, 27 Jun 2024 10:34:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmQt-00000009xGG-1yxj
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jun 2024 10:33:06 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-425624255f3so6915285e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Jun 2024 03:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719484370; x=1720089170; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=moMeCjYqhEN2XITayIt62CdfKAiqtD6Tk3XXyMm1xxs=;
        b=uL2G1SNk2AQucAwQx9L60xxmtZW8fwt4vSA0N38T7PqWMiUu1SiLJ4zz8ANsYkdTJN
         Jb7BFUfChrGDevsQABxIdZ3yBR51enbGCk0PLPxvui3d1mWKGJ6EK3Ai0WzVrf1XLoVS
         aK7mIUDsOoU/dlhrRQ+xeVAL29H3t6y4EfY1d+/hBDWGrrHtj32P7PIXqhLMRSQpli70
         OLZAfG2AnrmqkmRln6e5yq7jFCoptpr/6tWoKStjP9mFARCvs08vM+szQwhBqWr8r8mc
         +QekWNbZ4nAe5BsHCg7nv7rOw8Ylc16SAaRxPS6d918BoIsoU6JQOAsQC033KP/2YfSx
         OEvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719484370; x=1720089170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=moMeCjYqhEN2XITayIt62CdfKAiqtD6Tk3XXyMm1xxs=;
        b=cfOBTuWETmeorZ+WDQnLoPLT9mkVW9BthtdujsY+GRS4bZTpH4XPN4+I6gTu21v8E6
         LbI9uUiJnScwmE5RyF0kFG3OvikubRwpLEGkkfzMUQbFuGTTnZ+YpMecnlIJjbgjP4tu
         3Ipet5zhPb65kd0+qcIQ0+v2ZCUv02cxd1tA0KLwhta8jKHzVHta44IWg00icii/GkMh
         6z34pfFadDA48sq5lMi4d9BLAE8SZZ5uzHsX6D4mPLv6BTrK4/vMVdQvQNpQobS40JRn
         dB2HOZqAzXGW5b3QqZmFIwPx9awF4Ei2MDDkwgCen9pLc3XpO9NowTdMd7+r9bc62Qek
         5rAg==
X-Forwarded-Encrypted: i=1; AJvYcCXpCySBFt7adh+rlDC5yI3WN9hdE+EM1wsIKCvdYbvneiUxhLuMN0beNU+TAG1zgizhA5GFbOUwGbykM1RuKnn+oV5LOoA4A+tIdKqu/R4LBY5j
X-Gm-Message-State: AOJu0YymfiZGUH7gh2vHDQxRECg+/DYn4uqnM7L4CWJg0QsxR47HuCJG
	/P55kJ+tqtsbQnRmO9LbnYDv0W2bnGLTh3Zf2OXeIm31qhKTk2q0X1WJv0Bm1Gg=
X-Google-Smtp-Source: AGHT+IHfThQWcTK8yhGvLnXD3SYkW/snFLoh2VKnBj7XvwVZXHgftyUMlS4e8tS9d8NirOXboCgLnA==
X-Received: by 2002:a05:600c:692:b0:421:7ab8:59c with SMTP id 5b1f17b1804b1-425630fced7mr22138845e9.10.1719484370073;
        Thu, 27 Jun 2024 03:32:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367435852afsm1384352f8f.53.2024.06.27.03.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 03:32:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 27 Jun 2024 12:32:23 +0200
Subject: [PATCH v4 7/7] dt-bindings: mfd: syscon: Add APM poweroff mailbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-dt-bindings-mfd-syscon-split-v4-7-dc6699a9f3e4@linaro.org>
References: <20240627-dt-bindings-mfd-syscon-split-v4-0-dc6699a9f3e4@linaro.org>
In-Reply-To: <20240627-dt-bindings-mfd-syscon-split-v4-0-dc6699a9f3e4@linaro.org>
To: Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, 
 Khuong Dinh <khuong@os.amperecomputing.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuanhua Lei <lchuanhua@maxlinear.com>, 
 Rahul Tanwar <rtanwar@maxlinear.com>, 
 Lars Povlsen <lars.povlsen@microchip.com>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Nishanth Menon <nm@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1201;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=eBkgDNh4pHGUWCoUfl/IlA17qsQPFNuKObA7QeUtfcs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmfT/AfKoJu5OgzBj46/nykZpwckUbMSiTIyPia
 OhyT1Qn0KiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZn0/wAAKCRDBN2bmhouD
 1+onD/kBwIHKwA1zJIARnF0HNDBQtLZo6xmpXFjybHv3nlswlF607d+riKqd5L8Z0a6lezEa8J/
 keLOo7ycWmGTfvOT4KBybbdkVmkXrtYQzfb2ywDZDC2VBrE1k3rUAnJKj3m3lgJE9chNn5BSzMq
 CfegzIPkGnmRmS6MZ2wE0M5rIqJILvswpNvTId+kxuqJLbYyX6rN5XbzoydB4+Xw6zSSZ4TjkzL
 KM6T6Xo7fpBog1/OR1XdSGjq9IuSNJQqQadSRzcC725RErseufXcUMZmEkU3tS+ag7J2dMnW/SU
 hZU7jE9+oBq/j0ZWSC9wiFZR++CHVYADbc943gioqncA7mi3gyNi8/TlEPHj92Ij26wQcwlgmwD
 kU9KDWDDv8Nu/QgDZx29PnbFtPyGXyhlselpcMLtUuEee+KJLAhXkH6M+CtpscQHQyYsbffEOli
 Sp9K6FKb5byhaeMnNsT/HUmtAg+TiU0rVl+4o8lm24qBSCFCqDVOPpT9eF6MpBAti2z5DZvDkoT
 AkqxW8HC34j5nCq/5bQIRtIqxqREhJEc8piHjTAsnzRSO8G0rtYejVqtaDAreVz4OS8tN7ek7iy
 8fTiTjpfERDYq1oymiG+Mdb6zW3VQO/24sGwFTCsMe+ZypYPaEpSjV0flXX+sx2c7IhX0tZNZyV
 UvU+hFFU/j96kdA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_033303_032763_AB6F48FE 
X-CRM114-Status: UNSURE (   7.80  )
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

Add compatible for an already used syscon poweroff/mailbox block in APM.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index aa1c2608d326..9dc594ea3654 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -41,6 +41,8 @@ select:
           - amlogic,meson8b-analog-top
           - amlogic,meson8-pmu
           - amlogic,meson8b-pmu
+          - apm,merlin-poweroff-mailbox
+          - apm,mustang-poweroff-mailbox
           - apm,xgene-csw
           - apm,xgene-efuse
           - apm,xgene-mcb
@@ -134,6 +136,8 @@ properties:
           - amlogic,meson8b-analog-top
           - amlogic,meson8-pmu
           - amlogic,meson8b-pmu
+          - apm,merlin-poweroff-mailbox
+          - apm,mustang-poweroff-mailbox
           - apm,xgene-csw
           - apm,xgene-efuse
           - apm,xgene-mcb

-- 
2.43.0


