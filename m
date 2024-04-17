Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521A8C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 20:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mETcPG/0eQHUUp+Hu5ATZjovZfnlIP1p939gJWBqEiw=; b=WHj0fo7nHvqDPz
	bLhEWWLkKEfQg4sfSopcvU3NvJn/YsWRCzcmAxmL8Uvof495lgyrS4blNUVJtHm46mZK6G/TMsg75
	Mks7sYCe0zBndXv94NF00u1cn0p4wLEnEeiAXNCdwgs7xWwrTLtEnp2sLLMULlj1SNkOrLOeobvo7
	ufAlaTTsqKttgtO0R1yKl7DaX18c7kA2cnqoYfCCtezAVGGGWCa154zWMBIb8jDVR7Z/7fYOP1ECL
	7CznUUfYkx8TWabhC88vyDjK1au0qo9USST5fM1yQ6YjGatqEtWaPeLPWltpQcfjnyvDoTSUQvYRp
	M+ucYeY4c+ctP/AB7OJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxBUD-0000000HRLr-2Wie;
	Wed, 17 Apr 2024 20:02:29 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxBTf-0000000HQdY-0AB2
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Apr 2024 20:02:00 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a5568bef315so44803966b.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Apr 2024 13:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713384081; x=1713988881; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mETcPG/0eQHUUp+Hu5ATZjovZfnlIP1p939gJWBqEiw=;
        b=zGEILjcjPg5StYA7BPGK6oqi6X6WjL3EsiQfHljYnPYKMuAGR9hdLSSGw3Mof9bh/H
         C5mEgUdtRVipUec4I9/oMgcUxictLv6/ITkDbfQYniPMGVP+ePf8mD+TSf6VFwu3DUcw
         74i2or8Rdm+ZaPKEGieVLeUxiZH4KCBcp5H9QypXXLqwdPPUpzdcDx4e8zsq426pxBYX
         Sif4tzkBwB3UVh9dOKBi95Dnw1GGoZGe54OlFVT8oIQlw8Rmo0Dhk9S+gUJj1tL6IO49
         AETxDty0jUbbwWPrv5BKZrm5JGdq9ulu7yIOk0KJ1BfXodqrs4ai+V7DqBst+CT6XP7w
         9Gfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713384081; x=1713988881;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mETcPG/0eQHUUp+Hu5ATZjovZfnlIP1p939gJWBqEiw=;
        b=XnLOeQvEuBHTMSdr7sRfxrzZ9R0prBCYQWocC7QKlifaaEeZ7QTjCE9zezA29c1gJi
         Tyoe7x26o+XkARPe8KqeA19Y8BP981Gfgj0XQ8UBg2rvTmzCzxi8OX02yQa40TlH5uyO
         agCXfej5XSkZvdA7a2Wo8FJ7yoSJuc2xqU6wq74hTyo8mIi05a/u9ZbIZ8ATf1ar53+V
         4KCCyueHti2WKTjw7TwshfZHIEbtIQH+QpUZiCU8Jn9p2IB+YeKie6mIM3oo7+EMPDJF
         SY069CedGyjh8tfuSB9dhKhTis9YE8PyanxteNgp+Am8fWi3/yoKm3w0GNGESBJTcZdh
         lloA==
X-Forwarded-Encrypted: i=1; AJvYcCWFsMux9tqrMA5ZxEECFzk6C2uRSMO0Y0sL58BQzCkSPprbfaQefk4mRTbLifNiAPOT6f8gtDjdaSDDAIG3GOxKa+O5mW9APcMEExVStbCRgUYv
X-Gm-Message-State: AOJu0YzJ4bmAFdSIRS6GqMsKno9SGkmYLP3JhiaWSxvomzkljE8WysX6
	0WZwuz9rv4DboznJO7mNbqlI7j2j6qU83Ijy/ET3EhCPYLn0OH481CWXpj1meIQ=
X-Google-Smtp-Source: AGHT+IF9Wmh+7ejD/UAY2mFCTzIVUie+eVGe4rIzky1QrvxATELJQL/cGxzZCmHlaaiUR/qNIfpGZg==
X-Received: by 2002:a17:906:c9c8:b0:a55:690b:b696 with SMTP id hk8-20020a170906c9c800b00a55690bb696mr130195ejb.9.1713384080443;
        Wed, 17 Apr 2024 13:01:20 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id gs6-20020a170906f18600b00a555ef55ab5sm939981ejb.218.2024.04.17.13.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 13:01:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v10 0/7] spmi: pmic-arb: Add support for multiple buses
Date: Wed, 17 Apr 2024 23:00:52 +0300
Message-Id: <20240417-spmi-multi-master-support-v10-0-5bc6d322e266@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHQqIGYC/43SwWrDMAwA0F8pOc9Dku3Y7mn/MXawHbs1tE2w0
 7BR+u9ze2lGwOwikEBPQujWlZBTKN1+d+tyWFJJ46UmCG+7zh/t5RBYGmqhIyABBIqV6ZzY+Xq
 aa7RlDpmV6zSNeWaak1UgnFLGdbV/yiGm7yf++VXzYyrzmH+esxZ8VP+jLsiA+SBV5IBexeHjl
 C42j+9jPnQPdqEVhbxFEUPmuEMgTr2BfkPxNSVaFK9bgbMBQgQRbdxQYkURtChRqcFr5F4r7az
 eUHJNYYuSleIkpbcCuQW3ofo1RS2qr5TzXARrZI+D3VDqRXEyLUpVSjkDpEmQ6P2G0i+q7tWi9
 PMZ+kgDCgtyeyuzppp/ZSoVLUr0yA1G/oe63++/IuR3FhwDAAA=
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
 Johan Hovold <johan@kernel.org>, David Collins <quic_collinsd@quicinc.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4975; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=/39vaYwH6c7D7U1qbeYjMZX94n9RUUOZ4f2TEoJ2CdI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmICp3qYoyP08TixYiL5Stz6cy5MqL8iInUv6n9
 QINj7CRQwqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZiAqdwAKCRAbX0TJAJUV
 VkD5D/9FFrSAxuVX/hX3nme1VUm/HaTI/UCVGqgqPMxqn/UtLZnJZAxCKmAXsJPHy5QN8h3O/AH
 V/byADRaqLhEeG+KhK936mlLyO9UFeY9LUxKV9m9kRzr6/Fb1J4dRpkRaqtsSjkwwkAmBG2q1Jz
 /JiE0DgN2gQhDGlwkegec6nM4t/8LTt3cxoopXTIDm9OjYEEs4oJoaMP/FO6/LlUxKomRV6ZD0I
 UO1Sp0wIHl637ZUJ0EN+ycLR/5chAvpiRAYtu1oWqEHedpa/vrU1aCz+vay0DUjbC1Svzb/ZGW9
 pkfQ9eras9BTWeQy07rb+9nwL550vduT68VR4V2A+TNR9F/VitLknskF7wQvx44AgEeO9vBocAp
 KjF1P4NQQOwqmuMF5EWeBrwOCm09bBfE2HFRt1uD9V1iBWSZJr/YZGr0J2mFSNO725duJXbi6o/
 NWPJSl/l+TCQkab4McrMboFvPbVytGy4R3B4YjJ1XrekiYM5/eGnjdi02Ig7Lg+zjIRsJD+mlwm
 F8ZjqUTv+Z8BY/JL44RgGT1lIxyTaPL4s1XH6VmcJoS74rn9TUlXcP/vK4y0RS9VXvabEDMf2Bx
 /sp0IwUM6wrApmVbcdxzyqkpB09kEX6CFjH0fzg6CeKEfnJP5c6n+mnOTQxSL7B6TWi6GLKhSwL
 0EHcGHdaKvNdLzQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_130155_440230_CAFA81C6 
X-CRM114-Status: GOOD (  17.03  )
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

This patchset prepares for and adds support for 2 buses, which is supported
in HW starting with version 7. Until now, none of the currently
supported platforms in upstream have used the second bus. The X1E80100
platform, on the other hand, needs the second bus for the USB2.0 to work
as there are 3 SMB2360 PMICs which provide eUSB2 repeaters and they are
all found on the second bus.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v10:
- Updated the commit for the x1e80100 dedicated schema file to explain
  why the this platform specific compatible was used.
- Link to v9: https://lore.kernel.org/r/20240407-spmi-multi-master-support-v9-0-fa151c1391f3@linaro.org

Changes in v9:
- Use the proper number of buses on deregister, like David suggested
- Moved the lock from the arbiter to the bus, like David suggested
- Fixed type in schema file, pointed out by David
- Added Neil's R-b tag to patches #3, #6 and #7
- Link to v8: https://lore.kernel.org/r/20240402-spmi-multi-master-support-v8-0-ce6f2d14a058@linaro.org

Changes in v8:
- Added Neil's R-b tag to the 3rd patch
- Fixed compile warnings already existent by adding another patch
- Fixed compile warning about get_core_resources, reported by Neil
- Dropped and moved the spurious core removal changes, as suggested by Neil
- Link to v7: https://lore.kernel.org/r/20240329-spmi-multi-master-support-v7-0-7b902824246c@linaro.org

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
Abel Vesa (7):
      dt-bindings: spmi: Add X1E80100 SPMI PMIC ARB schema
      dt-bindings: spmi: Deprecate qcom,bus-id
      spmi: pmic-arb: Fix some compile warnings about members not being described
      spmi: pmic-arb: Make the APID init a version operation
      spmi: pmic-arb: Make core resources acquiring a version operation
      spmi: pmic-arb: Register controller for bus instead of arbiter
      spmi: pmic-arb: Add multi bus support

 .../bindings/spmi/qcom,spmi-pmic-arb.yaml          |   1 +
 .../bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml | 136 +++
 drivers/spmi/spmi-pmic-arb.c                       | 964 +++++++++++++--------
 3 files changed, 728 insertions(+), 373 deletions(-)
---
base-commit: 4eab358930711bbeb85bf5ee267d0d42d3394c2c
change-id: 20240207-spmi-multi-master-support-832a704b779b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


