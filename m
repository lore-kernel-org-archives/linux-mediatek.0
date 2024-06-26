Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7D7C30653
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 10:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59XlO8N85CHKMZTE14dutfLqTOocIO6QaYNJIqLDR0E=; b=ZbGEbeQSn6NtoFc5nnhHk/NiDK
	cMwrcKvGBSPCj4NlS7EzEW/ZgPeaVSNRXp/anAC5+xQEHFWDrJRLZjcmB1SHzBKOxoCUCUOf0k3Hu
	ij7KON/InjKYJ65nHLc8ES52a9v+huFAae6HwLgNrMpddFW1AU1dMuUuNkaO6HtDvwxk+o2azfI3y
	9rZB1Dzjn+5AMbUINaYUXGFhiqSvizMXYZ5hYDdKytcHJvhDNF/PphqPikKP2jvEazBBfiUe3A/6k
	IigSjvtE3caCJ9hG4DC3L9cd/hU+ek7FQ0Tv8Y7Pa/yf/AdSx1ZtD0xzED6hhhln/r7r0/+9tjnyw
	D0CsBcdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPcH-00000006FyP-1sgb;
	Wed, 26 Jun 2024 10:11:05 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPbX-00000006FQl-0uGZ
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jun 2024 10:10:23 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-7f3ca6869e8so40158139f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Jun 2024 03:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719396618; x=1720001418; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=59XlO8N85CHKMZTE14dutfLqTOocIO6QaYNJIqLDR0E=;
        b=vI9sZxDlHH69V104EfGd9gFmYiL9GK0ljC7pkH65BLXOrr1naW+J9a9yxKMu/pWq0i
         Ezc6+a2Dwp45ZWwAjEEk5L4QqZM2vEo5UdhxFMsvOd8B1q1YjFQ4LPD2/doVS+5rrYOu
         9DwH015HVrxSENFAj33/i+/wx0MvYtDmEIm6CjZCOxPSthY05H3VI8gXma3opIuHi7kp
         WQLt7Z2AFxU1JvPNCzL0jB0ueJ7QXgHxixDlxhHAB31yk3v1J2mfAHJnJzd1OLGqTGmJ
         OPNYs5YKgkekRIPtoxyY43ESgNzoy2DRaZFGClDwMWeE834ynGrnHyK+/ZjvePf/Inu3
         CEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396618; x=1720001418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59XlO8N85CHKMZTE14dutfLqTOocIO6QaYNJIqLDR0E=;
        b=D6HVjbn9kkxaSsNsij4hYKxbzpP+T7UREKnnRus1MFupK3A7qDPIvM3dhBNKF5zXib
         bLpJG4LRExQaIU564uwGYG0GCvoyLsX1rLprruR7WMpoavw2rG7v0dmAs+EJsrIYDf78
         z/KFXWl6WBNpwd/0a7l82NtYO7vXr3g6KcLBz0OZY3Yt2mJCeAf4ZFcc0vEez5G2FtZe
         NoRbcYAW5bTjqWwZdFqOuw7cDlpklHGQWas8asryr/bDpc1DbStdFQ6SWNKoapTdSvcW
         TJJLjZzKEtOS1LEwPYjMwjt+PCO3NqSAfMDcpYPXcSz/nm4yeXClRAPHOTHmt0gJFUNj
         LqFw==
X-Forwarded-Encrypted: i=1; AJvYcCVH8sq0JE8edlJ8fY4F1lxJrL776xuypAIwOCd9j+WQRI+lC7I6hEjg7OjLSQt+0QrSARBfdvsA0+cCWhs/4LBDzwnsY219WxEt0XHWmvJvCMxl
X-Gm-Message-State: AOJu0YxRTztWKmsy3rHyh4anszgS26ek8oWz3deBBNpyTMY86uqPaodx
	6yL0HqFNsEKCchKFmTkIYRFf0P9ZHghraTmdBXQ7lkISBMcWmEKlo6IrqArk35ANFLhdim/us0K
	A
X-Google-Smtp-Source: AGHT+IH5jBZh+2gfhC53GuIZJ8jCOVDi3reMK55I7AmQ0e+4wBYPfNvgxYCPjk0H5YJl3LjlcD09vQ==
X-Received: by 2002:a05:6602:1549:b0:7eb:776f:d970 with SMTP id ca18e2360f4ac-7f3a75d95e8mr1114379739f.14.1719396617514;
        Wed, 26 Jun 2024 03:10:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b9d121859csm3079108173.137.2024.06.26.03.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 03:10:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 26 Jun 2024 12:09:16 +0200
Subject: [PATCH v3 7/7] dt-bindings: mfd: syscon: Add APM poweroff mailbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-dt-bindings-mfd-syscon-split-v3-7-3409903bb99b@linaro.org>
References: <20240626-dt-bindings-mfd-syscon-split-v3-0-3409903bb99b@linaro.org>
In-Reply-To: <20240626-dt-bindings-mfd-syscon-split-v3-0-3409903bb99b@linaro.org>
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
 bh=lJ28Y3M24JoUrkT0kfRU9mVaVheUptQt841EFO3wEWg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBme+jTtrYuM01hjhHqNdEtBumYFIQAj1hCW6QmI
 qkgn/4bVjuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnvo0wAKCRDBN2bmhouD
 13oED/4w11Sz6XcfEYcb7aCh448tvr/mT1uzJWylaAQ7h0adW5pLvYy6V8VNcH50TcOFSNz8pKb
 mP+/8qYde/sPaCx26zuPBwf9DyMvVP20grTsTmieBrx8cBd7TaJxf8ZNnl8XOzIcdrqmhaPU+Pv
 MKiUdtVS6Vnj1c8jAj33lufxbePDWl8Ec2kE6cgwtSAj5f9p6cEgfVqA9LnXMpT3VLwt8hluNJ3
 ji1uiFDP2y0D4g6B6arahRnZw+GbNbx8LnjhOs8MIx5OEHYjifdnUCmLL+vs8BQc8NmXNvFUR9a
 O+HUnsCoVL7GMidD69z8RjZ6whWaLHuAp39caMXOLCrE5lopNm5bW+QPpQA2RjVEPPV4waQvzvu
 pnnLbom9fpB8aHVH7zTTqw6AEKFK/uphsxA+9X9MkHAQrsIKPBlali7VxEMAxImoWa7ysFU3Js0
 AsqI8MYxIjz1O5N8PugktWFU6vpSaRy8BvLkt9xlcux2+ln3EQHLzhBysHYX2vejfxON9tZVp/f
 SRV3pAPTp0rNPsfS0McAkplHYhkuDsiQJpL61gURK6MI7mMJCWFVMz7Kcrvk6/DhOH75asCYxdv
 WV8AqbpzacSECz3Vvdf2gb3rIEabhrJZVkJnCko5Qbl0IGYl0XiqRk/i2h1ubOh86X4ofL9PB9C
 Jy0rzXiiGk3H+HQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_031019_557592_0B2892F4 
X-CRM114-Status: UNSURE (   7.92  )
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
index d4e9533cf3fe..70e3a4465b4f 100644
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
@@ -133,6 +135,8 @@ properties:
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


