Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4D8C48BC3
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Feb 2024 12:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yU16TocWugH7F4lfHsPz28YesZel7rWXS48tKsMAJ5g=; b=bynhEcyvnqUKLC
	P4yj20pSEP52veMDQ7XnS3sFT2+qplK755Y8rD0uvCRDDXiBc4ddtlI7+bEsI9RAWk7wm2TKRRWJy
	mVHNKVI5HnxCb7qo8EHjHrD7pD7iRYROErc2eBjenHutSE7shYJrWbIvMD4yy1ogmaneQNK4G2NgS
	gJTNORQJ3J7Uxspkv3XrPo00NT0dC0hNgLefklC8VnzjgYm1fnfxUSwUj3GI3ws4v1Vmyjnd0f1rD
	qIpOvorVLV0P7Kk47GnBsRKibhwiQp74897HMUUc/lAMm9F+hp/L0xi1hNspr9WS86KuGq7P0JYEb
	tuAhHLEV3hTY5rrz9NIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcm5n-00000000uW4-1d5X;
	Wed, 21 Feb 2024 12:52:55 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcm5j-00000000uT5-3JWq
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Feb 2024 12:52:53 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a26fa294e56so1035988066b.0
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Feb 2024 04:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708519969; x=1709124769; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yU16TocWugH7F4lfHsPz28YesZel7rWXS48tKsMAJ5g=;
        b=xWR57j18f0GEdJG3Du6qukDPA6T6gg6KaG8TkyF4qCIHTmxnfSfvYFHhLKrhHMq/Xw
         IkW/4pq+PF7AkZtPWP8QZKV6FVxRtnRk9sagBVzvCe0ZYzaL29W9psKfm21QhpzM+WAJ
         a69MlzT4eMy3nyl7k+dDO3eKN3yM+kk9wKg8Z3dCTCMOQYZTeBbe+Qge+fTsXl+sq3/U
         oKhtOcoy/i5B8ZtCTcX6SokgGm8Irr9+ZZEYUZJW/hDGEq0VIiF1Q+A0XEdp54IBbde0
         7r7HoTQEd6dr3pI4/0jgaO8L+SW0/C89P1g1p4cXKJCP/Kmm5Gqzae32rwZQNC9h97jE
         Bkzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708519969; x=1709124769;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yU16TocWugH7F4lfHsPz28YesZel7rWXS48tKsMAJ5g=;
        b=a0I4Tk1nw+eIz9Vr9qYYfpX/HNj4VjVKTD+13aay0fNBa3Es0nYvl3U/4ocCOf1ZYo
         NCiTrxVxE8QGectIPxyJIYrdLCs/oV05+bSBkYooNff4QTQ3VM2i6Oiprf5rQN9I2SL6
         0QpmFDL0Z5LO38tmQ3qC6LAE9LwPiwuMNuj0LHDNT1X/pdlALxLLfE7p22IHKJ+Xo9sY
         tLHkEbAuszVsC7yFiQ3RTlH3ZemObusAIO7h8iIR53w4NZbNtbJ0oyuFq9DLztk3Xo6u
         8kHFE3s2tbOlVaOuTOQ21Qb/CekR9KaZ7SpsHIl6L9Fj8X4G9Fax+KDCw9vd4ruFLjoU
         zNHw==
X-Forwarded-Encrypted: i=1; AJvYcCXFnolN2Y/JhXVIqfw7WmG8vczumb5Yvjg8rQLfjvfa8UNc1+sR9tAXfhYDB4hzkhx9b+vYv0WJrbwKwRlWRr2JxzE51ekAIFsLHKYHNZqxrseP
X-Gm-Message-State: AOJu0YybFganxwMeUKqi1INxlvxdhlxi26m8POk59rzUhzNgFoOHlIay
	Dn/ikbcydG4IWFJsZvtFYveLPZgMbYJLxfioKGx8zWfwhGaFPCypyBbY2VljqOM=
X-Google-Smtp-Source: AGHT+IFcB2F2zitmluQ/uveI8ML8aEnCYgJw0KcvTusx9XgiFPDOV8i9/APzWecwPwmV0bI5C/T6gg==
X-Received: by 2002:a17:906:d78b:b0:a3e:bd4e:c87e with SMTP id pj11-20020a170906d78b00b00a3ebd4ec87emr7103630ejb.36.1708519969563;
        Wed, 21 Feb 2024 04:52:49 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id tl23-20020a170907c31700b00a3da5bf34absm4930392ejc.207.2024.02.21.04.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 04:52:49 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v5 0/4] spmi: pmic-arb: Add support for multiple buses
Date: Wed, 21 Feb 2024 14:52:36 +0200
Message-Id: <20240221-spmi-multi-master-support-v5-0-3255ca413a0b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABTy1WUC/43OwWrDMAwG4FcpPk9Dlt3a7WnvMXqwHbk1tHGw0
 9BR8u5ze8oohF0Ev+D/pIeoXBJXcdg8ROEp1ZT7FrYfGxHOrj8xpK5lQUgaCQ3U4ZrgeruMbbo
 6coF6G4ZcRrCKnEHtjdl70fpD4ZjuL/v72PI51TGXn9epST63/1EnCQiBtyYqlMHE7uuSelfyZ
 y4n8WQnWlBSrVEEErzyEknRbo+7N0otKb1GqfYVesfIEXV08Y3SC4pwjdKN6oKVKlhjvbN/qHm
 efwE5yJ1JpAEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2489; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Q34MGmLpDzn2sDXIy+KyEQYaT3QoNxwJZUKti5Td7pk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1fIWhbMbxfrM0al5B9dNOsjis3EumNU0q+W3M
 w9TeiNRFgWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdXyFgAKCRAbX0TJAJUV
 VgSeEAC8iMXfJrtVgyn4QtEOKV6l5nLLS/EAEzrn513ua+9qM9RzXwshMgMJylvTBc43IGLTMGY
 vGJX/W0O/tcgtzs2qx7PrngIdAtMp1h/deuF0bXr1M3Xb9fdePoiqXWD/hdziP1bGezL2tmig54
 A4UIEMMDedGCpDANSB9v3wlU7db7p7Y51YR5ufCUZ/fmPK696jAzzhCQ3Cycrh616hEnAAsFI1i
 n+EShGTjGsK4b5WZqeJBwuIFSdfKcvjQvR888qXn9Un2oNstYd2h51vu1IMFcE5OnMXLk2enK8K
 0knFZycXr5LuSv3m9Tt0uyxCBmAXG7tpd8u3IplcoPNEZ8LhPA6UihTMfrGC9bjRPe76gC+dYqp
 4GI07UuYE+Hv4V2ZMpkz1bXnJ3rlZ0+AnvPT5PHluNJt3M0R0q3riT3fez/EK8ftPKt54fvgSs+
 tVPG1YkoPcfHSk880GeVWAZajciPviQlpXekRFArhuHq3Urg2SUhXMtsaZNTPX/xzhuRh+Feibh
 jkFrx67gs3KcrT2xCmu2FmsKHQQa27Y+TstufqB0Ex1eQbNxy8lwEPdFDZ8vZiuqGjgfX9Bmkkn
 r2d8PBO3uMVhVjNVdiIHabM0/iYfW4+5mwSWmovnNb2LfwXKrLBUV2Qgv5l+KIqDVFc1hiGlMx8
 fM5ifTQUbAw7q5w==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_045251_868554_2BA03BBD 
X-CRM114-Status: GOOD (  11.09  )
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
Abel Vesa (4):
      dt-bindings: spmi: Add PMIC ARB v7 schema
      spmi: pmic-arb: Make the APID init a version operation
      spmi: pmic-arb: Make core resources acquiring a version operation
      spmi: pmic-arb: Add multi bus support

 .../bindings/spmi/qcom,spmi-pmic-arb-v7.yaml       | 119 +++
 drivers/spmi/spmi-pmic-arb.c                       | 949 +++++++++++++--------
 2 files changed, 698 insertions(+), 370 deletions(-)
---
base-commit: 4893c639cc3659cefaa675bf1e59f4e7571afb5c
change-id: 20240207-spmi-multi-master-support-832a704b779b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


