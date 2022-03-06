Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20ABC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Mar 2022 11:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7jwAUrL0asONT7A2llXi6Xj7szvycxW+5FI550apUzY=; b=MBsehyCtN4v+qb
	iKXSRZhEw9SzTQiyq5nfKyY0E1oijEysB8h7CtEUpuS2vHFI9UHyaK4JocQ960do4uBJiauYSgoVa
	vTk2+tkmOjmzq1616jUd26y2FemT2VqtCiTrym91Rx3aEq4WzHvoEHTWfp2qyeILWNfIhH4GbUPA8
	wuWvGpEHhHF9TzbR0N0G5z7dXy3PNijBoyL4oO0M6dcwXvApfkRuEspRw2IBeVs3HDDtl74FYMnn1
	LoR+ve8+VWv8obz7wNrVoIuY6C4PtEfod+55AkKYwyCqsFzn1ZWnXGy9SmNrR2AOXNcbUiRWcB71X
	Bh9eM54aN6E0U1X6j5zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQonY-00EUqF-Cr; Sun, 06 Mar 2022 11:11:36 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQonV-00EUoI-7G
 for linux-mediatek@lists.infradead.org; Sun, 06 Mar 2022 11:11:35 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AB2E73F61F
 for <linux-mediatek@lists.infradead.org>; Sun,  6 Mar 2022 11:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646565090;
 bh=wIiMX0XUCkTo8b0ATD0IcXb9TBhD0CdDLNQdfZCqwBY=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=Oe53bVkt1hH9M+XmR2EfbgtG57S61Sn+7cVdUaf0Ay7Iun9QNNe7SUXFYIi/fM+vh
 1g+ZIyukcgvVczMqzkV+1eeBBsvKf7uh1o2BKU9PETS5Ng1qI4g5AEGUaVzPFrIlNd
 ZZ8hDYup8HTRC2bDMb81obKZWs7U/hCvTtlT9dmxYyzE7q3s0njTitDctFF/LGb+02
 rvDW+SE24vYvVk5MObR6k0tLpeHgu4JLL/1rVO58pNaA5RgUm1qBjKsRpk3LAksXiA
 MaAtTEtlmU514mesRIM9Fi2L8I1p/zUN3m49I9V2oOeSQR9MEtB2iKeHEQaqWSLZLn
 StIvNNx+r0f4A==
Received: by mail-ed1-f71.google.com with SMTP id
 r9-20020a05640251c900b00412d54ea618so6717930edd.3
 for <linux-mediatek@lists.infradead.org>; Sun, 06 Mar 2022 03:11:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wIiMX0XUCkTo8b0ATD0IcXb9TBhD0CdDLNQdfZCqwBY=;
 b=Q/hba3TJbKaRhhr2Rn+EMpc/yrNB0v2VL5sGmv9ppAE1LQDAGa536mQmMi6XWqsNKg
 qG/mUYwY0WOc0h9VsepH2uo7l308IpJ8bdgRcp+yGKx5tHpzIPtSVHtn5XJXm7dl5O2C
 GTy4zn4ZRkvi+kyTnVI6bdD3RT0XiX20uvBXiJUwhxUMhKnH8fIZGj1yTQcHJattUX0T
 r+cWdZZSfw7vhYg1SlKctw7lj6TkZvjFO4Gm/6XRDC3xexFT6aC1Th042xZbQ+mLXhce
 c2fhHdQwAcJ31gsU/lKkUd0I+loPelS9cpSzzFrvzdAIs5Q2YxZKilnUoydPbmg93+6Y
 +kGQ==
X-Gm-Message-State: AOAM532piU4AUUAHj5reQ+H4HlBiLX/ItKRYsJKQbZ6MYsA39rwPyatC
 WYSuG4y85ZiUtfIHDW6t+nP86IVYI9CK01kR5CyznwT4q5psDPxQKpT2ABwGJWkqj7pklBJb/40
 wUQUpU5scfp51uWB9QIigPTckHUxQox4NsARJFhab1qjjzc0B/A==
X-Received: by 2002:aa7:c80b:0:b0:416:463c:309c with SMTP id
 a11-20020aa7c80b000000b00416463c309cmr415359edt.413.1646565089814; 
 Sun, 06 Mar 2022 03:11:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzP9L+8xDUVkpWxiFjFj1GYgye5Xlluz6YMq3chqBtolnFZUO6sIbZcQekE9OTuQDMjNAfrdQ==
X-Received: by 2002:aa7:c80b:0:b0:416:463c:309c with SMTP id
 a11-20020aa7c80b000000b00416463c309cmr415331edt.413.1646565089569; 
 Sun, 06 Mar 2022 03:11:29 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 a9-20020a1709066d4900b006da888c3ef0sm3720444ejt.108.2022.03.06.03.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 03:11:28 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Wei Xu <xuwei5@hisilicon.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v3 00/12] dt-bindings: ufs: add common platform bindings +
 fixes
Date: Sun,  6 Mar 2022 12:11:13 +0100
Message-Id: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_031133_510518_EAC8AD55 
X-CRM114-Status: GOOD (  12.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

Not tested on hardware, so please kindly test.
Bindings maintainers might need checking - taken from git log.

Changes since v2
================
1. Do not deprecate freq-table-hz, but instead update dtschema to accept
   uint32-matrix. See:
   https://github.com/devicetree-org/dt-schema/pull/69
2. Drop patches and changes related to freq-table-hz -> freq-table conversion.
3. Add tags.
4. Change maintainer of qcom,ufs.

Changes since v1
================
1. Make freq-table as matrix of tuples (Nishanth).
2. New patches: convert all bindings and fix up DTS files.
3. Several minor fixes in UFS bindings.

Dependencies
============
None dependencies. The DTS patches can go independently via respective
maintainers. The dt-bindings patches could go via UFS tree.

Best regards,
Krzysztof

Krzysztof Kozlowski (12):
  dt-bindings: ufs: add common platform bindings
  dt-bindings: ufs: samsung,exynos-ufs: use common bindings
  dt-bindings: ufs: cdns,ufshc: convert to dtschema
  dt-bindings: ufs: drop unused/old ufs-qcom PHY bindings
  dt-bindings: ufs: qcom,ufs: convert to dtschema
  dt-bindings: ufs: hisilicon,ufs: convert to dtschema
  dt-bindings: ufs: mediatek,ufs: convert to dtschema
  dt-bindings: ufs: snps,tc-dwc-g210: convert to dtschema
  arm64: dts: hisilicon: align 'freq-table-hz' with dtschema in UFS
  arm64: dts: qcom: msm8996: drop unsupported UFS
    vddp-ref-clk-max-microamp
  arm64: dts: qcom: msm8996: correct UFS compatible
  arm64: dts: qcom: sm8350: drop duplicated ref_clk in UFS

 .../devicetree/bindings/ufs/cdns,ufshc.txt    |  32 ---
 .../devicetree/bindings/ufs/cdns,ufshc.yaml   |  68 +++++
 .../bindings/ufs/hisilicon,ufs.yaml           |  90 +++++++
 .../devicetree/bindings/ufs/mediatek,ufs.yaml |  67 +++++
 .../devicetree/bindings/ufs/qcom,ufs.yaml     | 242 ++++++++++++++++++
 .../bindings/ufs/samsung,exynos-ufs.yaml      |  13 +-
 .../bindings/ufs/snps,tc-dwc-g210.yaml        |  51 ++++
 .../bindings/ufs/tc-dwc-g210-pltfrm.txt       |  26 --
 .../devicetree/bindings/ufs/ti,j721e-ufs.yaml |   7 +-
 .../devicetree/bindings/ufs/ufs-common.yaml   |  82 ++++++
 .../devicetree/bindings/ufs/ufs-hisi.txt      |  42 ---
 .../devicetree/bindings/ufs/ufs-mediatek.txt  |  45 ----
 .../devicetree/bindings/ufs/ufs-qcom.txt      |  63 -----
 .../devicetree/bindings/ufs/ufshcd-pltfrm.txt |  90 -------
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi     |   4 +-
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi     |   4 +-
 .../boot/dts/qcom/msm8996-xiaomi-common.dtsi  |   1 -
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   3 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |   3 -
 20 files changed, 614 insertions(+), 320 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/ufs/cdns,ufshc.txt
 create mode 100644 Documentation/devicetree/bindings/ufs/cdns,ufshc.yaml
 create mode 100644 Documentation/devicetree/bindings/ufs/hisilicon,ufs.yaml
 create mode 100644 Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
 create mode 100644 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
 create mode 100644 Documentation/devicetree/bindings/ufs/snps,tc-dwc-g210.yaml
 delete mode 100644 Documentation/devicetree/bindings/ufs/tc-dwc-g210-pltfrm.txt
 create mode 100644 Documentation/devicetree/bindings/ufs/ufs-common.yaml
 delete mode 100644 Documentation/devicetree/bindings/ufs/ufs-hisi.txt
 delete mode 100644 Documentation/devicetree/bindings/ufs/ufs-mediatek.txt
 delete mode 100644 Documentation/devicetree/bindings/ufs/ufs-qcom.txt
 delete mode 100644 Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt

-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
