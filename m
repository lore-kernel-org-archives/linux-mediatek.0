Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCABCD1294
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 12:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m69UUoZHVCQbx+lpC9u1HsJi4g+Q71GhA5bw8lUD+Ps=; b=WdQrb+7Vb74neG
	MroH3gg5vhztN70f4qn6T9W85Bz5cfNt2SLO4l8ZCaSSxmhW3A2T0Wkz0YTTTsS88j+tSRyBfH4EZ
	eOHFNjoyPFH6hvm0L9Rogz2dlX9TbDC8zGrFwcEabXw0CKFRA+IcdPhKE8ysqJQck0hV89QUlfKAL
	y6f2VdhtlORmNx5R1MVBb1qwSK5e7XaMSXkTNDooigXDEjANktzrwlynNNTf5ivMJp1GJE26ZRcFz
	NOBZv7ysmOSR8RR3WQPnVZEM+68AQvuEpnb3ph+hvgYWzU1PTaLZ/uG2OQWDIEuCXB9YAKt0k5SJx
	Y3Ab03nbzHOOAjap36hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrcw3-0000000Ayaw-1AA3;
	Tue, 02 Apr 2024 12:08:15 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrcvs-0000000AyQl-4ALS
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 12:08:09 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a4e60a64abcso314259066b.1
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Apr 2024 05:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712059677; x=1712664477; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m69UUoZHVCQbx+lpC9u1HsJi4g+Q71GhA5bw8lUD+Ps=;
        b=qaEplDwpiN/wu9sGQ76GmmLLdlSdmubE0ZMKHtQ/H3Y3EsmhnvnnWs5Jip1Bh1KUSY
         B1PbGE21MZstCTFqOAuuZ7WBbHmQg7xsG+2aj0HaKbZxiAyN+Nk434UxR7a4kEs+U6cD
         4ZFLluSxlbFbvav5XMm2RaBup+4hrBQuD36mEnXIJ1yvlHduJVSMR/BqyZBNaPfRZXA8
         MeJ4Yc4ACeK9wAFb3082eIOkh75s1WvD0RVjYa/T6QH56he+Gx2muI+bD9LHqakH4R4D
         HVF8ZZtduQu0J1LHAEH7cQ0eoBcSPYj/0M9Y4KJ+PkXIXe1zWSeDSdUN6DFL+pAkk2Go
         0JTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712059677; x=1712664477;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m69UUoZHVCQbx+lpC9u1HsJi4g+Q71GhA5bw8lUD+Ps=;
        b=SnJShpD/fmF3wJwwm1yniSDQUt6Sf8sjJDdI8zSAfQBXtVlSYVVXsnydqpk3zvFlDO
         kDE+HO8iKhTG+GeYOT0pyhOjBQsP5XbvKGek/JgsGUJV2RfbQFIBwTG/RYkgrD9emIBR
         NPHIoCqwZONG2cLZ7OGj9OKjonRnlmT4pdRX6Vv7/MsRM+oXqp9S4IEBsV0ccwMxgdIJ
         oOytvma0Z2c1XynTiZBAlw0v4b/0hUhBMmANYepq7VaUCp+EWcmrL9kClqZ3HeEUQq7W
         0CMKryPHHjgOleCUn2llJZbo53mh8N5p45ci6u2boYx2NHcH2GmBK+TmiAP7nYaZNk2X
         mcsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkGSUcLyh6nsuuACobHBea6pmYpWjjV6gWPPqJ17OQ4XTOMfl2nk83wBU14x5A4ZsaCBbOFOMdhcAJlkX1Fss+a0OW5JIEkiSaBPjkjEsvDoVD
X-Gm-Message-State: AOJu0YzDtfBN5moTTeMQMQBH8BtNT6vYnbjuQmWeXaL0Zo3P4GN7K74f
	R4WPqYr0OItON+3iHzSawnsAfW7o2Y7AdJv99SG+YhDDrY548FG/yrDiloEwRYPsvbzm52hs47S
	9
X-Google-Smtp-Source: AGHT+IHKukewzmJeKeo/a024DcR5+ftEC1nxaYgSzsfyeI5YLN2EgwKvBiCBODNT3VgQ0pOifNR46Q==
X-Received: by 2002:a17:906:fb86:b0:a4e:8da0:8646 with SMTP id lr6-20020a170906fb8600b00a4e8da08646mr1172255ejb.29.1712059676318;
        Tue, 02 Apr 2024 05:07:56 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id l13-20020a1709065a8d00b00a4df251a601sm6519384ejq.77.2024.04.02.05.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 05:07:55 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v8 0/7] spmi: pmic-arb: Add support for multiple buses
Date: Tue, 02 Apr 2024 15:07:29 +0300
Message-Id: <20240402-spmi-multi-master-support-v8-0-ce6f2d14a058@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAH1C2YC/43OwWrDMAwG4FcpPs9Dlhzb2WnvMXawHbs1tE2w0
 7BR8u5ze1lGwOwi+AX/J91ZCTmFwt4Od5bDkkoarzWYlwPzJ3s9Bp6GmhkCSkDQvEyXxC+381y
 nLXPIvNymacwzN4RWg3Ra947V/pRDTF9P++Oz5lMq85i/n6cW8dj+R10EB+5DpyOB8DoO7+d0t
 Xl8HfORPdgFN5SgFoVccEdOABKqHtSOoi0lWxTVr8DZACGCjDbuKLmhEFqUrNTgjSBvtHHW7Kh
 uS4kW1VWKsOu8lYIsuB2lthS2KFUp50kG23dKDHZH6V+KsG9RulLa9YAGJUrl/1Druv4AyCGlR
 YUCAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4363; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=RdYy7z5iachCEuuENa519b3wQiF8DXGK8dF2mdWEPQQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmC/UJKxCvuxK99yI3i9bYhRKNUKoVmH16XdiKc
 Yx2QXkMatWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZgv1CQAKCRAbX0TJAJUV
 VrKjEADJnnbCbiAmLGLCu/YYNS6HVgsakDJBEmQpta9WcQ2seK8Wo5V1pSRzDWhTuNRYDWKL+t7
 +3EA3HJC6a8iQPjbspAI0K1Fe6jOJCzMATd+WX1xvhevZdZuvXQc56thYTLdPphGhg95l3xultN
 q9v42ydzLYkVvAUQ5iA/vlPIvRjBgPctHBxKULKER3MuYLcQ9hJX1574xamT3y0gJSafmDW8FIK
 KHuezQDrSeqBl4on05kEHL9Jy/7rWigX0gXZ+jQM5T6MfRQe5fmlCaBSsSQj8IIX+ZlFeFjXg65
 2mn2aNmDaYh0aonniu2wWVpAVIxSHk5WjgDMnkVrK+5KTXWEfQuG56gMeHST+HMa7qrVQ0mnNkS
 4Mrlq2P+GjDstmEBNJBk1ThyYoOV0kAs2RexUCt1Fv19e3JZCQBZbpmphln6P+joCWks96ZbBKS
 GoWQ3sNKMGKGhsmVveuTUJ2I6Gv5eKeom/sfbepIzedsLSREk/tz6npMZZFc2gwtHTxykNLe8E6
 EA1wZcZw097on8AjRCsF0f6Zp22u66tcQ6A/XzZ/VOpnpNCMTCl4kEGxiNWH2n7XVvKJHpwwgWP
 POYKoZ4utU2QPSxdr6YCHZphQct7mqQDyXgcGMuZASdUt/uJEYak+kx5Q1ovnYDwX7NzxHFAxBo
 rXLq61FEdxc5fvQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_050805_303087_73F2DA1D 
X-CRM114-Status: GOOD (  15.67  )
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
 drivers/spmi/spmi-pmic-arb.c                       | 952 +++++++++++++--------
 3 files changed, 723 insertions(+), 366 deletions(-)
---
base-commit: c0b832517f627ead3388c6f0c74e8ac10ad5774b
change-id: 20240207-spmi-multi-master-support-832a704b779b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


