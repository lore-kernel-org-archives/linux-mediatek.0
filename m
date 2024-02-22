Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2320BC54798
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Feb 2024 13:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KkwALuuS9M9PSFBFc5tMoPkB9c/kjBr1oSlzVPQUlEY=; b=PczZlvMvMEZnLh
	EopgTQCeZUCMBG7ikhotxoPTnXZSC0rdKAi8/vjPLciPZm33OPzLCGcVbJ8MoTAeecNOFGmK3K3Il
	ogHKkuTHQTn8aHeB+ImS4Vxiw6NxlUw/thPeqsGBSMew61B8ZeuV1afbEwBt5vn88FIZTmjxAfMP/
	leAgVr1xDBDi8ZP+BwXn7s0WuVRMP9ammcGgMtnPNcIPgrXfoJcI3q6g5eshJ6oD6IwFLvY7CDqoc
	977z9TkdN65lKnuf4gKz0mnm+rtRBtzd7syjuwxdDJGXMZBnstlkMbPuJe+d9+nztssCROtVbX7MI
	EQIGLNaCferDONqs4gJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd9Uw-000000056sJ-1yCb;
	Thu, 22 Feb 2024 13:52:26 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd9Us-000000056o1-3oIb
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Feb 2024 13:52:25 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a293f2280c7so1137059566b.1
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Feb 2024 05:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708609940; x=1709214740; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KkwALuuS9M9PSFBFc5tMoPkB9c/kjBr1oSlzVPQUlEY=;
        b=JT1tjDQBv+Ns+h618fzwhmkQl33g5/YDL1Z5vYFXpSkPPvB5d+JbdIA2dORF1KDa3B
         kvotPnMbnzPDktUXjPxp+IaFyidEV993zDwNspy9dVcSh3zv03xTtDZSoxweoqMOdvbf
         pYYj16naMahLlKGrBPjKzU63iRw37oau2VMPJV7pUF85W7SPAqqFwBuu2rvYpY6GNEIf
         Mf0u1p6yjtjDxqNpGsFaCI1mnU1bY9L6PTQ62oXVQlrhIn4zOBTchNXoPIbWRJkQ6ItS
         Yl7SdDKA0paRsjFoJQOzupnZtcwAcCpp6U25Uxoevwt+sExQJXo7r60Q0U8uMg91pgXu
         ZXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708609940; x=1709214740;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KkwALuuS9M9PSFBFc5tMoPkB9c/kjBr1oSlzVPQUlEY=;
        b=gt6e5ubjFi7T/rv36MjVzYSsgyThXYG4NDLeoCQKoRQil+Dvf/ZzxEiH4E9R3piMVp
         OLBebMxOUH+4EVxYmAqol0MhFVY9u5HzJtW1c3R4Va258ithcjf6Qw/9DGdK755azUpw
         uXpl9mU2Jn0Rcc1ENO9OwscEKUnZxTD5EyyYME9Z5ij+O0P+vUAbGTi+EmDtTb7V+BBm
         fmXsMc8KYk3XH77HsfwOryoQlk7PwpJAMyXqazpIhZQ7iXKFfbayd14JKrjku4jmwnmj
         GQecB1W0y5kfNKQoCs6O59i4/nlGifmGBtlDF265jkS+av1EwOoSmr91IAcp//d37nNN
         v7EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeEPbtrv6A4TFTn8xAVu6826oTP1FxICRgYjvu6s9wE3HRhEUDo+H1tdiBavYzGl6QAMPUJK1ZhDejV+S90GoXKrm7AxzRH4g9BX1G/zLtLLJF
X-Gm-Message-State: AOJu0YzuyOqeVHeqOnJp9MaM4awjxjpap1pc2lL54AYUpQXqqAX1I4QW
	mPsA+nPAVY8ylNC8VqqoDHU71U143n9Ndg5kAhphp40Sqveer4VvpDKoW0OVci0=
X-Google-Smtp-Source: AGHT+IEELfLxUsEw/wegIN32tw4xel6QaTJaQ7ZIgjPnVyn4Lso+bKU8EelVOd8FRy1aWXX1guCfWg==
X-Received: by 2002:a17:906:69b:b0:a3f:6302:1e61 with SMTP id u27-20020a170906069b00b00a3f63021e61mr2427516ejb.73.1708609940572;
        Thu, 22 Feb 2024 05:52:20 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id ot18-20020a170906ccd200b00a3ecdd0ba23sm3382839ejb.52.2024.02.22.05.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 05:52:20 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v6 0/5] spmi: pmic-arb: Add support for multiple buses
Date: Thu, 22 Feb 2024 15:52:01 +0200
Message-Id: <20240222-spmi-multi-master-support-v6-0-bc34ea9561da@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIJR12UC/43OwWrDMAwG4FcpPs9DluzY7WnvMXawHbs1tHGw0
 7BR8u5ze8oIhF0Ev+D/pAeroaRQ2enwYCXMqaY8tNC9HZi/2OEceOpbZggoAUHzOt4Sv92vU5u
 2TqHweh/HXCZuCK0G6bQ+Otb6Ywkxfb/sz6+WL6lOufy8Ts3iuf2POgsO3AelI4HwOvYf1zTYk
 t9zObMnO+OKErRHIRfckROAhN0Rug1Fa0ruUdS+AmcDhAgy2rih5IpC2KNko3pvBHmjjbNmQ6k
 1JfYo1ShCpbyVgiy4P9SyLL/Uqumg7wEAAA==
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
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl11GH+c4If4nAE5FyaKTtc/3NCAvH3/McfFiQ0
 EdOWR2irGGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZddRhwAKCRAbX0TJAJUV
 ViZ0D/4oKGeePCJ4orbhRWOkHQQ3C76zvhHTi62Jnmh/9BH295YEYcH8MfACfkUgDBlS71WKaEq
 cWDTuob8hQ4ZlSjTBmMEG9SKPvSYUIwgOKO2RQZcaJnoCtNcT1hIswNSLS9v3PnO4gjX8XWbXpW
 nGro6zGnkOc+yRDyrBw5I2gG4azgiGVdRPplw9nyj96gnGxBxkE8KFNBA55Kg8C/shBTy9FrYcO
 JrDzlP1ApPjJcknVOqjen+dvQys5DuWeTYk3W0uiXgD8OTrTCC81mO7RZk9FCOk/Ub1ehu/OGJW
 iHDUErCFD91TvYnd/hng5/w6jUPqT+Pq9ltSO8W67gpK8XMsRAaYN5EEb7D6mHoZarJdVbFJqGj
 W+347CHkmCK9OpGTheyBRNVy2+BhGj/kDfeejdR5bqQ6z1mxkswp9/s4HkvOlF6pQgQd4olkul6
 WZ9alv9v3yRRqzGcczy3iD+7r+5WS5tn+/qH19ZMKtpboUW/8PY0LEm6aarESXi/pA5n638rN56
 wRq8U0cxMV8G3P+v/wdgnnpXRp0u9IF2+Fr2jasXGVua5aky9FhmEdNdYpF2mBPfKKJDJhFsw7O
 YJ0S/7DfmcAJpR8UcrvdYzX4KXWom6yWz+goyKx9B3GNT/bAAv+eRrs6GnFWN58vFP0QkOpQT3g
 7VXgTcLlQ8TTVRw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_055223_255081_DC293F6A 
X-CRM114-Status: GOOD (  13.29  )
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


