Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE24C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 18:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JEoJt6PTt2qpbe2pE1qKEsmwN83YlKQDSAv770KyGdc=; b=TuRlmwC1dlBXPo
	RogfJuAr8AtWOGvvTqoobo+caAL/qcGrS1B5Wb/Qy1+u6o8eEMrpCdKooXFdYWKaeBmb1W97Oseuh
	/Yl5e7zDCrbkt8kNxtdgJVw1phN2oe3P5cWoB1MYQ7upK6SyS3ZWOVqdEeVxlZWmgGcCZJ0+rKuY+
	b8GtoVs9+v/MZKCxwW4FXcmrRO1Xt6cdbGJ59F2pdfIuk42nVQWvsANlOL2bdMo7qNQFRD2jIQBeg
	OFdxRUddup2dBiTQG2RvHuoGzCl1+PWV/aCOZ4A85tlM9xGFCeXu5J8dH2g1MtMzFaHDyB6IAvIuu
	DeNtgwtUSAkg3JfzjQ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqHNL-00000001f0j-2bQa;
	Fri, 29 Mar 2024 18:54:51 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqHNG-00000001eve-0VSX
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Mar 2024 18:54:48 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a4734ae95b3so299719266b.0
        for <linux-mediatek@lists.infradead.org>; Fri, 29 Mar 2024 11:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711738483; x=1712343283; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JEoJt6PTt2qpbe2pE1qKEsmwN83YlKQDSAv770KyGdc=;
        b=Q/OzvTt1TZv/SbdOAYwP+PIMyghYjVDzzJa5daEdmLQlKGbalKtk2LVY9vJRa5NIOa
         +ShZaHCKJkqDDuDt/N8M7ULMAlyxkjAKWEJrp0Fph9eKk6m7R7k+ks1hKVnAR5diZukp
         82dG1vjgqiH8nax5WlRaIrVMEeEs80h8xbAUAPk8Npp6CTYytLoN2UtBnEJu6glWFw9o
         2NqCewxJtiw3BbEFPDKnZG4IgU+i5+9I0nvXpVKkZla5JEct+nkdo0sc+vvHL1iBp4Ll
         rkeHtR60ARoMUCg9ZZ94Cr7HJPZyFGJJqXpkgZQmir5pdBXSv9M3aa69Z6zL6XS8M/bf
         IcVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711738483; x=1712343283;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEoJt6PTt2qpbe2pE1qKEsmwN83YlKQDSAv770KyGdc=;
        b=LI0YaPfe7nxufT4Yo1DJRt5NkbtqH6HLMbK3ZHRVBqMYUxBCRlxJ+m1VngfMSAIRL7
         1MF3gwCxPmPjo8tD/CQYetSOMQPbJqqwtkd4/qqFl6UwUsWsYexmW2TL0ePyIVpwuA6o
         s+7Frvv2dolDNsGbSQG6L9u13b9T+rQNsJPXOTdgjt7QgLpvGa3g63SBf/fFlpQ53CtV
         LxN7zndhQzuQd5eQhSWjC67sxhnjH8FfqOFWceNaOSzElMdDeHUaJFFUyUj4K5qmqNvk
         vHxMTUv3uWjU5QqtvtllH897e96v+tVuPloThxc/5cvcJpduZJCavtvtseBUPFZ00u8+
         yQMA==
X-Forwarded-Encrypted: i=1; AJvYcCUygweGzHr78aBl5C7IKzxJTLudOYbY9almwBy19wZ1pkJ6tZpcXWEHmXSifVsM2CLl5sple5MEsKIN+6FOQ56dq+sPyEvD3EAisrE6gzT7JGIk
X-Gm-Message-State: AOJu0YzXGWme5RYG79CUe9IN22pYAUNrcsunrBUTXpcejOASoa1WhiBn
	gSp1VIyxbIM7U15gfNejIBu/ywdVnhl/tYt//mbG911yi5XR1pVof57+Xi3TLpc=
X-Google-Smtp-Source: AGHT+IHiQbZaByTqx1a8yLXtEDMIaraAkghg/jn8TQ1vw3pG3HRmO5i2EtQWeRCNZLTt6veW2dJqgw==
X-Received: by 2002:a17:906:b288:b0:a4e:4441:1024 with SMTP id q8-20020a170906b28800b00a4e44411024mr370498ejz.68.1711738482866;
        Fri, 29 Mar 2024 11:54:42 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id gl20-20020a170906e0d400b00a46c39e6a47sm2235618ejb.148.2024.03.29.11.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 11:54:42 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v7 0/6] spmi: pmic-arb: Add support for multiple buses
Date: Fri, 29 Mar 2024 20:54:17 +0200
Message-Id: <20240329-spmi-multi-master-support-v7-0-7b902824246c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFkOB2YC/43OwWrDMAwG4FcpPs9Dluw46WnvMXaQHbs1tE2w0
 7BR8u5ze8oIhF0Ev+D/pIcoIadQxPHwEDnMqaThVoN9Owh/5tspyNTXLBBQA4KVZbwmeb1fpjq
 5TCHLch/HIU+yJWQL2lnbOVH7Yw4xfb/sz6+az6lMQ/55nZrVc/sfdVYSpA/GRgLlbew/LunGe
 Xgf8kk82RlXlKI9CqWSjpwCJGw6aDYUrSm9R1H9ChwHCBF05Lih9IpC2KN0pXrfKvKtbR23G8q
 sKbVHmUoRGuNZK2JwG6pZU7hHNZVynnTgzjSq5z/Usiy/44Uk4ToCAAA=
To: Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3899; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=3QA/wELDjfOly3SoK3JbqflTPPsTAzGm3BpN54bG+T0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmBw5lpJ0vA3Lm4pFAQDl5UcaM29FU6Ch6r0Qnj
 Sv/XR5jmjGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZgcOZQAKCRAbX0TJAJUV
 VnurEACg1vlmC9fBDZAwTHc4srOY5w9xZz0XOUprEVRhM0fxGhv05xLgLZN3ORmuoQAJ7MnX6WQ
 KFGlIjO6AL5PRe9HqwRK+zk5xomLrdxxgBTB4g2v8zreSdHikzd3MxYxiRea87m0jE6+C6cow38
 HKAH5nqmoZjn0/Fm30BXE+b19E3q7xXvtMU95De/QlW774pHjV6RLpvX+xR57/U7E9ycbR2ky/c
 LMrLyFVzWE1IkzjigaQ6+jogfFniCdLjgAeX6q3tI3Ech+zS0+iWOAvozP31gZ1SiDfBqHsVBwK
 8QCCGF5UZlBnMZp440OU2A1A6DEaH4a62TPiE2+4J4FmaJC2W/LXDEC5jVOiBbqyVreq1Fj3bIW
 ox6g6eW383GY10eVwFytxdF+RGwATmig8yqEO6sSYu2yoddYwsRD2WOWrlPWcJ+DuQvBhZGXVS+
 rsxROBVZarCwsK6FMVG44zldrB/sQfebZhpQLh2ClaAm9udC6fAPw7cGRKOaQsbsY1XGpxHURgO
 jZ/yA5k9PYuqpMWiLauFxJRmCmJxLquIb33TzUxrtUuTMwUMIBcioz/hWuUN12m2Rm9EjQ9olsP
 rfyEeG4tfUe8uta0/r2PvL8RLmeVDSuPDFVX1V2to5XRebN9pvxfXAZkFcrplqWeOcXpybor0fh
 5/chTNvcThq7a0g==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_115446_349520_254FC5F4 
X-CRM114-Status: GOOD (  14.86  )
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

This RFC prepares for and adds support for 2 buses, which is supported
in HW starting with version 7. Until now, none of the currently
supported platforms in upstream have used the second bus. The X1E80100
platform, on the other hand, needs the second bus for the USB2.0 to work
as there are 3 SMB2360 PMICs which provide eUSB2 repeaters and they are
all found on the second bus.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v7:
- This time really collected Krzysztof's R-b tags
- Added Neil's R-b tag to the 4th patch
- Split the multi bus patch into two separate patches, one for adding
  the bus object and one for the secondary bus, as per Neil's suggestion
- Fixed regression for single bus platforms triggered by casting to
  pmic_arb instead of bus in pmic_arb_non_data_cmd_v1
- Fixed bus object allocation by using ctrl drvdata instead
- Prefixed the spmi node property in x1e80100 schema with '^'
- Fixed struct and function documentation warnings reported by Neil

Changes in v6 (resend):
- Collected Krzysztof's R-b tags
- Link to v6: https://lore.kernel.org/r/20240222-spmi-multi-master-support-v6-0-bc34ea9561da@linaro.org

Changes in v6:
- Changed the compatible to platform specific (X1E80100) along with the
  schema. Fixed the spmi buses unit addresses and added the empty ranges
  property. Added missing properties to the spmi buses and the
  "unevaluatedProperties: false".
- Deprecated the "qcom,bus-id" in the legacy schema.
- Changed the driver to check for legacy compatible first
- Link to v5: https://lore.kernel.org/r/20240221-spmi-multi-master-support-v5-0-3255ca413a0b@linaro.org

Changes in v5:
- Dropped the RFC as there aren't any concerns about the approach anymore
- Dropped the unused dev and res variables from pmic_arb_get_obsrvr_chnls_v2
- Link to v4: https://lore.kernel.org/r/20240220-spmi-multi-master-support-v4-0-dc813c878ba8@linaro.org

Changes in v4:
- Fixed comment above pmic_arb_init_apid_v7 by dropping the extra "bus" word
- Swicthed to devm_platform_ioremap_resource_byname for obsrvr and chnls.
  The core remains with platform_get_resource_byname as we need the core size.
- Dropped comment from probe related to the need of platform_get_resource_byname
  as it not true anymore.
- Dropped the qcom,bus-id optional property.
- Link to v3: https://lore.kernel.org/r/20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org

Changes in v3:
- Split the change into 3 separate patches. First 2 patches are moving
  apid init and core resources into version specific ops. Third one is
  adding the support for 2 buses and dedicated compatible.
- Added separate bindings patch
- Link to v2: https://lore.kernel.org/r/20240213-spmi-multi-master-support-v2-1-b3b102326906@linaro.org

Changes in v2:
- Reworked it so that it registers a spmi controller for each bus
  rather than relying on the generic framework to pass on the bus
  (master) id.
- Link to v1: https://lore.kernel.org/r/20240207-spmi-multi-master-support-v1-0-ce57f301c7fd@linaro.org

---
Abel Vesa (6):
      dt-bindings: spmi: Add X1E80100 SPMI PMIC ARB schema
      dt-bindings: spmi: Deprecate qcom,bus-id
      spmi: pmic-arb: Make the APID init a version operation
      spmi: pmic-arb: Make core resources acquiring a version operation
      spmi: pmic-arb: Register controller for bus instead of arbiter
      spmi: pmic-arb: Add multi bus support

 .../bindings/spmi/qcom,spmi-pmic-arb.yaml          |   1 +
 .../bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml | 136 +++
 drivers/spmi/spmi-pmic-arb.c                       | 953 +++++++++++++--------
 3 files changed, 723 insertions(+), 367 deletions(-)
---
base-commit: a6bd6c9333397f5a0e2667d4d82fef8c970108f2
change-id: 20240207-spmi-multi-master-support-832a704b779b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


