Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5E8C48BC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Feb 2024 12:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s+jWLQZPWAIdbIYTCxMRCQCGWqDgnyzVf1WiIb5Hkco=; b=CvE9mnGqZcfeke
	Lp2BrWcrhSjHA5ydCBCKtu7cdBPPw50l6gOmA0q8eoato33k/inwP4JtNu23sEpvGXUZqk/bsMSJj
	R1BUb3IQz3yD0LNODxeaJPALJpBs0OB3DGTwnUzNEN+PS+BkD6x4EF8A2v1E0iGSfS2Jtc7l8q8ND
	k9a2qne7GeLXHVNNBCa6cWVFjw3qtRfweZm9BD3QDaxkZnMx9s10rWdqz92n8gXoR0NkV/6zUvZ3o
	1FEevcC8SNAXDI4xrllO2Saw4WxykEwhYYu3vVBtu7QeEgBnAR5eCtcXSrEyYa1fO5CfulPQvnLYX
	A6DwWAyliSPgY+v7h8mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcPio-0000000ElZ0-3att;
	Tue, 20 Feb 2024 12:59:42 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcPik-0000000ElWu-3diJ
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Feb 2024 12:59:40 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-563f675be29so4802349a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Feb 2024 04:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708433977; x=1709038777; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s+jWLQZPWAIdbIYTCxMRCQCGWqDgnyzVf1WiIb5Hkco=;
        b=YmzuybaGQshbvaBL0et6EmuNENvR2PljbMXdN3jgnuAmDnyN1Q+ZRxP7B/tsIYILcx
         QAl+BmNyN3AyF622uH5bERlJBcO3W7E0UE+tWcZPk/ZY+QRx37b2enomD9s6+lLbDsvR
         YspDr0wO2L1j/LIorGgEcsKcKnYHX7+HnRroEigky+czJKi091DrkGkbPsCNbRkq8qCb
         kTQ0oxGkxyD1D3E48QQBNTo6eeASPODLRY0UVvISUR0B0vwhzt+/FPOnWcYqwiFVaCSb
         atZxI3OJ6l76SNntp0CNnsoY8dEGkoaLwCRjQbWCTK7C31y7u1DserAAgPp/usHQ6AIn
         /L6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708433977; x=1709038777;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+jWLQZPWAIdbIYTCxMRCQCGWqDgnyzVf1WiIb5Hkco=;
        b=VSiHA7LHSWI4TsYLp1dA2QP+JnFY4vZYpZHIk/SD/IoJzW7F8GDmFaiL2YjuAqrPF1
         7/bji0rYRqnA2SEBzEPAZJD0h2/V9aFerjOSiW+Jy/3GX2oAvqkDFTiSc/JbwbDTwX7N
         2+RPkituK4O9hqQ637Ep3j/LWnw719+rjP2RX+9brn6IMIkIDfPfYj0Y2CWpVojuvW9z
         22H5KrZWN6JPh4pUUTVT6eH2XyiGpun9Mdyr4o8Ee0FCNPkfAgjvoA4j4X5OsWzW8P09
         nI84100RxES1fzau3vLaQ9KVBg8Q3LGlNw50DAYIQGsMGkWI82Kg1SVWV1RVTwIoKktb
         pL0A==
X-Forwarded-Encrypted: i=1; AJvYcCUA8SfbRR1fmMl0C+ZpjHqduptDpCCyFRKLD987/mU3s2Me24QeTV2j+di0rjxA5HgSvJQNkZDhhl3Hr0UXZuxgGfJOuqPL5S81RWXIvemJ1PMp
X-Gm-Message-State: AOJu0Yzw7KQnHHmIaBWVmyd2+DtpeOHNDTietSklNwZEN3z7bsNPIroj
	Y8KdGqGSO/TOWY9uQs7xu8TKSpzHatl7BRtWblNrTGM+KuaH6un3FFQH40mNWVQ=
X-Google-Smtp-Source: AGHT+IGlmYaZY8dt7KP0Glwqbfa+qcbUIyMwpyJuJ1u3Zgl/t2BTHzGE3BEksImNAO5ykN7Wg/l3HA==
X-Received: by 2002:a17:906:bc8d:b0:a3e:6628:f70f with SMTP id lv13-20020a170906bc8d00b00a3e6628f70fmr3998963ejb.55.1708433976812;
        Tue, 20 Feb 2024 04:59:36 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id rf23-20020a1709076a1700b00a3ce36ce4f9sm3948802ejc.83.2024.02.20.04.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 04:59:36 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH RFC v4 0/4] spmi: pmic-arb: Add support for multiple buses
Date: Tue, 20 Feb 2024 14:59:20 +0200
Message-Id: <20240220-spmi-multi-master-support-v4-0-dc813c878ba8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACii1GUC/43OzQrCMAwH8FeRno2kH1rnSRB8AK/iod3SrTDX0
 c6hyN7dspMiiJfAPyG/5MkSRU+J7RZPFmn0yYcuB7VcsLIxXU3gq5yZQKFQoIbUXz1cb+2Qq0k
 DRUi3vg9xgK0URqOyWheW5f0+kvP32T6z0/HALrnZ+DSE+JjvjXwe/UGPHBBKWmsnkZfaVfvWd
 yaGVYj1zI7ijeLyFyWAg5WWo5BiU+Dmi5LvlPpFyfwVWkNIDpUz7oOapukF2ag4j14BAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2213; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=4kaUomWdFKTMnYewnlbW8ksZWZl5gVePGgFlT/90Ucw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1KIuXSH5UMGSA81CQbo8VMYCmVJwJzeoi106z
 O0yLBTZvWGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdSiLgAKCRAbX0TJAJUV
 Vh64D/9KA3g4aKNkyzLJfGpz/zWGhefbVTp3yqRNrZP4g+nMZkOm5oo1rqX1Y1a/QjaVijo7p8g
 870BF7ezB/UvwM6jfLZdWwDcKnJaHxHFKMVXYCMqlZVCgK6HokTp9ITYiOk4Q72F28jvFPgWvm2
 RbZKjI1hSDDnp9Yn7PsDS4c7BAOkJU/piefh/Krltgjs4jVTjKi7oa9TU8jh4+oTuerOL35nvxc
 p8yAcD/zxVBqv9IVpseLSjE0baZ7xV5pArTf3RKt6fisEcL0pC9adRLs98gKWIgmnC72s1TCwFu
 QnX+uwTntjlp43v+ufmFp43XJbjj4mncJC0H4Yi/ek3OCPSnfuh1owkE2iHe/6IJznVsVbgDtdN
 sIzz9xE0dsqpbRQexP4gZODy6YYpBGCzIXRC69dNwb3WpXc0wboBU9lRikNfLR0g5cBbNX3lLiV
 BzRG+qAWvbpNwdfc1//7zt0zjQmY9f64QTiYyEAQ9NA+6Svm0J1F8JJ5eo/7XNz3X5GDxmyd0Eb
 iVTWRKg+9HyVSWbMZmFWf2j8jfO1nK03PjhD0htQEiJhwdFhEVSt+D/2AT6ooPErrbLRkYv6aCx
 fPVWABAGmCxlZqxyry7WbfWKWNzVW/dt2oeD25MOMYQ44LFSWGOSMbC12mRiVWQ9WYjMIztQ+8e
 bBLylOZoBR4fGcg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_045939_132289_283A1F10 
X-CRM114-Status: GOOD (  10.90  )
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
Abel Vesa (4):
      dt-bindings: spmi: Add PMIC ARB v7 schema
      spmi: pmic-arb: Make the APID init a version operation
      spmi: pmic-arb: Make core resources acquiring a version operation
      spmi: pmic-arb: Add multi bus support

 .../bindings/spmi/qcom,spmi-pmic-arb-v7.yaml       | 119 +++
 drivers/spmi/spmi-pmic-arb.c                       | 951 +++++++++++++--------
 2 files changed, 700 insertions(+), 370 deletions(-)
---
base-commit: 2d5c7b7eb345249cb34d42cbc2b97b4c57ea944e
change-id: 20240207-spmi-multi-master-support-832a704b779b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


