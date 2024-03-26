Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78927C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Mar 2024 16:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KkwALuuS9M9PSFBFc5tMoPkB9c/kjBr1oSlzVPQUlEY=; b=v6EJqHSZMQqEjM
	kWgNtMXDJ/QDYR3mJBmrfQmBFzQrD2McK3JUyf/lymwI4QI6oUL9HyM5hYPqRUgvmwcWqdVWBYqtx
	sil/1fZZ4vRpyw/jpOyAR+FWl0R0xzQClXSoF1XWg+pLaq/Xdlpyq8rP3n9cLQXp7PyoqV/z5BV3W
	Dzn1pkRDddD5dVFEukSbZeQH/Wxrm45ypFQedgcAc9Ar6WjxlTSgiz8go/KFuyQ2eKAoh/YInX1m8
	5nE+gZhcv0eWJQVxKIKpiTNNCNe4CeHDTuZgX8sp0oYpjsFimDDQBuYK3aSjLkIs/Z11Flitf1rwm
	SVeTsmgVTIFtohr5savQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp9fI-00000005SeZ-00HK;
	Tue, 26 Mar 2024 16:28:44 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp9fD-00000005SbJ-44SL
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Mar 2024 16:28:42 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a4a387ff7acso282505266b.2
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Mar 2024 09:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711470518; x=1712075318; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KkwALuuS9M9PSFBFc5tMoPkB9c/kjBr1oSlzVPQUlEY=;
        b=texkB86Gv12+JL25juI76qF1ute0Q6V1kzTajKwjVNJFW8iNqoNFQBw+erFSkizk+i
         DPWt2JuqI0L9VfUVlsaopLYdKvuPn1Wi5xzLej8NRh+TpNIYUI93pahnfHExtj4cowZd
         bM41at2/9Mpu62R0CiQ4WA8JoKFmdQNhExh8OinTeOIU3l9fvTexudOFuvRzDBPG8vVR
         3p/7Z07sgPjIR/+8Pe8bfZRC+zMKtdOthUp7YAsGkLGQgvEE9ZO718/tjQyjALUWPTmp
         Z2kSI5ydhSdcswWpbrQoULbNFu0Iadw77b2oNsEtojP5h2U4F0tYJofm7IQXwS5lsopX
         yrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711470518; x=1712075318;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KkwALuuS9M9PSFBFc5tMoPkB9c/kjBr1oSlzVPQUlEY=;
        b=sGB8mFBEBq97VZ+sEWcp0ghq7H+maAF+kWJVA8V8a7Z7Jag1hJuBxV/Z5zyjaBHRfP
         9U68iAX/+JGkjrm+tB5+G1nCcpF7+1b+XhcX+zCsvomSVaWfJwhyfoJa25fr9jr7OkFK
         9qQb1OUjB0Q65GLUNShU9WS+IuDCuhoJy/OvUh+rKLuUD0KnRIDgDaS2M/cFSWdiBKXW
         czoRC5pjsJclZr+e7rhf33GaMbBNkLd+hH+JAt9ZUQIkgMU7Zb0w8xBwbTli85lX5c7M
         4OEZptCFQoLSio2n9zhKM6rolH1XiC/wHJIVr/+GPzbtHdSuPSMJzFq0qmwk2BMmRHhJ
         KKUA==
X-Forwarded-Encrypted: i=1; AJvYcCWnJriQurOXUnWEAnhvDcv7rwDtxChlEeJr0/IKCVD2Ey4FUzkjIEmEwds+5Mh8poLdJPTLg9YtUKMG3tpS1UXh4WFBSQ5NbiLO2K8HLpK1NLWt
X-Gm-Message-State: AOJu0YwTMArwktVMY5/o5ZJi1/0m4qeMGFkkpe98gj0mmBnSL3FTVnnH
	ts+CNTocW6UzWv2TXdVz2xtjr2POy3B86gCprYtoXdYVMAA/guKBMUdD38h/Ydk=
X-Google-Smtp-Source: AGHT+IEcH7pTTbGeIspwegoS3I/u7NOPY+bwy0qZb8nOgdyqit1sI00HJEdOMspKPg9tuxOOnF6kNQ==
X-Received: by 2002:a17:906:6b8e:b0:a46:e595:f357 with SMTP id l14-20020a1709066b8e00b00a46e595f357mr1356863ejr.9.1711470517578;
        Tue, 26 Mar 2024 09:28:37 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id x20-20020a170906b09400b00a469e55767dsm4375051ejy.214.2024.03.26.09.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 09:28:37 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH RESEND v6 0/5] spmi: pmic-arb: Add support for multiple
 buses
Date: Tue, 26 Mar 2024 18:28:15 +0200
Message-Id: <20240326-spmi-multi-master-support-v6-0-1c87d8306c5b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3091; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=9rVzNTAAYXnMs7MfpROp5deA4r6Lb7fRQnEpmwvz2mE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmAvepPDyVUfUUZtm4dfjOycr6Z/f5hn2kGVvuL
 4y6blOW/s2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZgL3qQAKCRAbX0TJAJUV
 VlGWD/4zH6HSPOmzf6bU+wWagDRlb7hDTO9LEmNfOrC300XKD3q+opYulhKcAOf6rtJwYEmQLps
 CJXZZY7zAYqqx6QqCKnr4pc+j3fJS8nqWrREhFRUSfbHIKUx+kBK0ByvSFmDahe3pu17mB8pD3o
 wxf6DzWELEAmYbyWy2RJUsCOLdgGeT3KL57UN8QW5YR1xkyofcd5VmRzjyTj5cvw3W3wQ/LS7nb
 D3VHmMrDOvK3gPqb6fUseLHNZg4obl5Qo0ycIaCIOKv4ociq+r0QIdc9wl9Upl/D0ak7AIR9DOr
 zlIQN/nSBfwDVO76kwUug8bbjdwPjLJwNimPjj276DFq6vNFD1tTYAkd/Vk/okWeAI1zAzVOcXB
 iCuGFyoDDol8lziqz78FTnA8oCQLbbwovo7218g1ZcWnfpvnZ6pBmNWeL1pwMuHlrQBLATFfuM5
 KjlQ2NqptcBjxaoT0c4oVeoxFQppIsIpy3YN54mfA/1G6ALJPJIUZMaA/Oilj9KFqummEA0Day5
 sFZt1DZoiGsm7D5q+4EIQ553xKvrsr+YFBhDpealgdVodYtQtq32nCAtkKFTNv/5lptT0+H8GbH
 1O5iWE1MUgyul1a4dK8oKy+s5QPbbyrf+M9KqyqvR/C3PYTKCFrGLDRDSMG6Fxvy4sQJ7z5AX3d
 loxohzcnadyQh+Q==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_092840_167665_C18AA1F7 
X-CRM114-Status: GOOD (  13.27  )
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
Abel Vesa (5):
      dt-bindings: spmi: Add X1E80100 SPMI PMIC ARB schema
      dt-bindings: spmi: Deprecate qcom,bus-id
      spmi: pmic-arb: Make the APID init a version operation
      spmi: pmic-arb: Make core resources acquiring a version operation
      spmi: pmic-arb: Add multi bus support

 .../bindings/spmi/qcom,spmi-pmic-arb.yaml          |   1 +
 .../bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml | 136 +++
 drivers/spmi/spmi-pmic-arb.c                       | 948 +++++++++++++--------
 3 files changed, 715 insertions(+), 370 deletions(-)
---
base-commit: 4893c639cc3659cefaa675bf1e59f4e7571afb5c
change-id: 20240207-spmi-multi-master-support-832a704b779b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


