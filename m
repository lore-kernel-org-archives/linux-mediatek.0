Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C4ECD11C2
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Apr 2024 16:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RoyDltWihBKIzrhhfRZNvpBdWOALrOH+RVXfhsGRse8=; b=4par0/Ylqy8VAd
	h6vcpXj/OO9P/sAxYIb7NJNbunlvkOjfZXV8xmgwnS1WSMwCW8OisP9FsqL1pz1UaWLLVBGFpfMSe
	at2Ib59gD5MQQ6ct1YbRP58Ude27f1TjYmunlAQehZXYjt7mPl5DWP/xWMMcATlxNEh58CLPhyGFn
	Y+gWDbzqyt7zcXmV+4YP6IFiG6ZM5j6/2crECIPLuixTQUyULL3Nu79t4FopUlRGnDfLF3ugDW64r
	YY55/qSegvW4cq4ecxrRMVZ3xP+V8uKgv0nC+g8ZU/XKMmDaagHa6k1MBLkoJj9gQPYxobjVLEnnJ
	gXdRnwqidGkOKYj54R8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtVJ5-0000000CzMQ-2LES;
	Sun, 07 Apr 2024 16:23:47 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtVJ1-0000000CzKO-2M7D
	for linux-mediatek@lists.infradead.org;
	Sun, 07 Apr 2024 16:23:45 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a51c37a5025so107601466b.1
        for <linux-mediatek@lists.infradead.org>; Sun, 07 Apr 2024 09:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712507021; x=1713111821; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RoyDltWihBKIzrhhfRZNvpBdWOALrOH+RVXfhsGRse8=;
        b=pKU44uTZuWzt90jGooisJ6kA4d0oSy8ziMaFFAjQ6FshW56ctqowwInBopESGOU55L
         ELzbQZ4XHc04RFfh1WtDRkdXonxErXmy2ij8/qtS5bmINhWxoXUPu8nkSjdVfimzHxgR
         VTd8HDk5c61VtuUClafRfLWjGLPJElmlEC3WTUjbUq85olSIb3cxquOHwfSi/bBKeJ2z
         NqYaVeJzCWl/spPlwNZ303VQJRCpXt88se/k5zspq31YJzPp6elxBlgJdvRLUD8cid/Z
         kBeRPHt1sIXxVyOBsV/9l7xcI3CYWEyaOXwVYmtLFaKT89DyRihStZjDdF8fO86CBEVf
         DiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712507021; x=1713111821;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RoyDltWihBKIzrhhfRZNvpBdWOALrOH+RVXfhsGRse8=;
        b=L9okbrpvLIcMwSJ6s7v7ebf8Bl/jpuYFxWD7ULAXN5Ek2gmCU4sTHb1fLdu1FWCxUL
         dqnhf7DQeh38NLPW2V/MNnfsgTTtSG38ahzMrMs0V4YS5JC4zkqucJXxTnQR2exRChV/
         8hA+I6En5rKo9GfmERTlcvdhth8umAfQuSwCJzOtMTgrhEME0fhezQjpdeo/XWOqkWKG
         7GPTm0mz6/T1MdE6PFYORGJUqmj2ellTemBi+bwah8CuRHHcnhTTPNGM/F2zx6qh44RW
         RGcwYk/qaqtAU4O91CelSXL914xcEmZKZbPNhhHGlJVh/GSHsTucpsu77UCFmcSOy8gX
         g3qA==
X-Forwarded-Encrypted: i=1; AJvYcCXl+wjCdcPnuqOYr14PokUDdL6+60jxpCulhszB2N3bLyCrvS0WZGFk+OFxUZrVdbzIW0fiuCu7jlOYerjMiAKQhD9/+9xsg+J2NypkWNQRUzHa
X-Gm-Message-State: AOJu0YyMLq/GTFqfZ1751byHKLxiVp2y9xdbGylUFT1XQdwv6IknpW1o
	BCUnW7zb+jJ/7gtaChsKhfy5mk1syVrD1Oqtcpej9/YWeNf5yT3KGIAckNxr5vQ=
X-Google-Smtp-Source: AGHT+IGvtq6B6DgJjFpXiyD9utmhbjeYTJB/ZFXF/IunsqChQiIhkDhZ23IBmIeDJKt/RGcF7yglcg==
X-Received: by 2002:a17:906:6813:b0:a51:aed0:cbc with SMTP id k19-20020a170906681300b00a51aed00cbcmr3002874ejr.15.1712507020510;
        Sun, 07 Apr 2024 09:23:40 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id qs28-20020a170906459c00b00a51bed388a4sm1811626ejc.139.2024.04.07.09.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 09:23:40 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v9 0/7] spmi: pmic-arb: Add support for multiple buses
Date: Sun, 07 Apr 2024 19:23:20 +0300
Message-Id: <20240407-spmi-multi-master-support-v9-0-fa151c1391f3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHjIEmYC/43S32rDIBQG8FcpXs9xPP5Nr/YeYxdqtBXaJmgaN
 krefTY3zQjIboRPOD8/5DxICTmFQo6HB8lhTiUNtxq6twPxZ3s7BZr6mgkCCkDQtIzXRK/3y1R
 PW6aQabmP45AnajhaDcJp3TlS58ccYvpe7c+vms+pTEP+WZ+a2fP2P+rMKFAfpI4cmNex/7ikm
 83D+5BP5MnOuKEYb1FIGXXcMUCOqgO1o/iWEi2K11bgbIAQQUQbd5TYUAgtSlSq94Zxb7Rx1uw
 ouaVYi5KV4iilt4JxC25HqS2FLUpVynkugu2kYr3dUfpFcexalK6Udh2gQYFC+R1lXlTt1aLMu
 gwqYs+EBfn3r5Zl+QU+Lacv0AIAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4724; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=6q63pSnhy6J2Sr6QSskYSjoSl2pYXtfJQJp23ed/YYY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmEsh9w7TRJLDY7EA+ru9fb2gPOEpYg/1MEqV+U
 9S0i6N3Eb+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZhLIfQAKCRAbX0TJAJUV
 VjvFD/4tbOMo4zLbPuYKkIt0zkVEijfvI2ky2BJD7dhVNV5QqC5Fntl1UNwARGMP1k8QyMx6IE1
 zF/wXLh6U1hUeZY11qQ63hJlbOGYyDKjtNZCmUpdpi2IbfwRe32B+eJBrldjqgJIaty4By01wlk
 vqLK5oTEoZZyv0+EUxYSKgZIId57Bd7mIsS1hmlPX6rfNqbPC6epcTN3cmMA81h1ccAVDejXTAD
 shKxF6NyyoLG3odqWZQ4kMfR6BU0IoaGVpylzlkILyAnvjQQli8G7gGOSJ/v8CwyomkOb/CiCQz
 eM8Lee/y/whzE6PPJBnYV0eUv4+GBf7p9iIr8cKWQxUCxiuYp+u6IUwAu3um+kQRWPSabLQbPdh
 91HWCvyCVf/7Q9xJL00+c65Uu6k8n+RPKRLfDQd56KnFLKPbBk3bPvSdtSefrLmVM0y4TSXG5dC
 eX7aFVXs3ikVpkKXbNrqRdjaJhssyao6NTaMcMX3tNbN8IwUPStFQ8nShN0Gr4UmwHmn9dixym0
 eHDG2bPu6BERKSsmSO1J34n8I+/Ygjbst1dNZX8u/WEoRKIA6YhbF0E3Pa3Pf7PoRQAhL93LNlg
 IB7y19nkISyFEHEj33N1/ZHip+nVE5YrPCMleib8V3VFOTFBZLq3fF2JfSlb2bvXBHqzFucbC7y
 38TcUiD7D1l8AyQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_092343_970078_6759DC79 
X-CRM114-Status: GOOD (  16.21  )
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
base-commit: 8568bb2ccc278f344e6ac44af6ed010a90aa88dc
change-id: 20240207-spmi-multi-master-support-832a704b779b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


