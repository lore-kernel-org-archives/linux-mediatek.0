Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E596C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 15:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oi+h7u8PaYjSM+sp65qi80LPopT0yHPzdaO0Hzy6Jm8=; b=LcH1zX6m0lBsm2
	21ukN1wEpYxA2adAIglPudrTtgb05vqi8diRswqeXi6bcXeZ7VKAhAQyu4B9KNG/LrQYGjf70l2SP
	79dmKPtIe6DCw9XXkZQi88dIcKPpNjIb/hYD1zr8kbEwdcePt8Gt/nDNedGRG6akQK6dFDGfDAvOF
	hlj9Q3JNi98tHk84c94+uvt4LGtgst344qoOOJ76VZJQ9BQ/sgFFbvDErpQ7wWvqf+NyRV/fOS8s/
	Vs1alkgcgUu/3eMTkseU9qd4oDW5oN9TX9MM/zUPGHRxW/1OjyHyrBNV53kkS/jaGWrOBkNhPCM10
	0vS8pCakxwBVJQ7C2iog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMWh3-00A2CW-7b; Tue, 22 Feb 2022 15:03:09 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMWdx-00A08m-Nj
 for linux-mediatek@lists.infradead.org; Tue, 22 Feb 2022 15:00:00 +0000
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7B8B43FCA9
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 14:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645541994;
 bh=+TIgQRioLLZ9zOW6KKmdTDTPf4m59BMseVHbquTVcCc=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=O/3dGCz7AyphiXmKr8O4DzMqWk5A7RFY1L2v8r4dTqSjFABgolQ7Va4Qi74uA6HyK
 8i7rtzA9g5xtlyiSnfVkLsY5bclegrOsCv7z4X2ASb+GH1d8vyvf0YhYvi5gKDN3uQ
 ELBmHw9dbg0Ps5UMC3SwCb+drKNvYMISkIqiMgIzWd1Q1/1M4tIZXF6QmFtHmiG4BL
 Nq4sqCRD0eqFJU+y0k0hiWjo96FxjADhH9lc/hrFJWAWBk6cPLhSyE6GBeB9VepBAA
 APOX0232iEcV9MqLvw9/UqvNra4eR5wNZcMaYdTpcJWFF9pqqOFj6u/tCz3TDSCtI6
 KLsW3UqtzcZHw==
Received: by mail-lj1-f200.google.com with SMTP id
 v5-20020a2ea605000000b00246322afc8cso4006898ljp.4
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 06:59:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+TIgQRioLLZ9zOW6KKmdTDTPf4m59BMseVHbquTVcCc=;
 b=O7HDYahGxUDGQ/wpF/7omFQXritxc+Em5k0A6ajBeSui1QqXxWFZG0DozQFTI1enc6
 L9xG2AjZNHYQj5nkXUhwZLVUNqXlt8iZDtTeKFvaAmjuYkZZXhtLbPKND2UUlD+9Qru9
 ZnPaUs8yLXZ90xiEg+C4xNj4WWzN+QgUMGuzckbPfnGTvwXAuQrRP2Xv2+FERHGJMSbJ
 7x/bK3Mb1QlO7ob1EeMPQlAAJOSH9PnlKuI06EMvXkJagVcajuZzsKAQ9skMvNA16bwJ
 TkmY58WSajifcIr7DtOPyywNDEC7zqLY1CZmupfUuCpT5eNqgHJwReyMsLjp3nk2i8K3
 Doyw==
X-Gm-Message-State: AOAM530amAjnPHTClCuw7E4wtV/030F5JfdFIMDMSWvo/c1WYJPrPNzN
 k23/ES0boNsfQ7gVSez6KhaiZVKqAwV77Va3E8q2izWAc4Z3jopCNHyse/vERGL3uFn0bpTyh23
 ERedRZaLM9NEn3GNPzdEjeIHX7m0KC7QgcfEgjHRzfBdC0RefHQ==
X-Received: by 2002:aa7:c391:0:b0:410:83fb:abab with SMTP id
 k17-20020aa7c391000000b0041083fbababmr27025560edq.435.1645541980579; 
 Tue, 22 Feb 2022 06:59:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFDKifwtFFrCmwLKT4NC984SQd8SdrxWDXIgJnHsNvfVTg37pGq0CPqLSpORQdHqU3VFVDJQ==
X-Received: by 2002:aa7:c391:0:b0:410:83fb:abab with SMTP id
 k17-20020aa7c391000000b0041083fbababmr27025516edq.435.1645541980307; 
 Tue, 22 Feb 2022 06:59:40 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.06.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:59:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Wei Xu <xuwei5@hisilicon.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Yaniv Gardi <ygardi@codeaurora.org>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 00/15] dt-bindings: ufs: add common platform bindings +
 fixes
Date: Tue, 22 Feb 2022 15:58:39 +0100
Message-Id: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_065957_946513_0654BB34 
X-CRM114-Status: GOOD (  14.30  )
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

Changes since v1
================
1. Make freq-table as matrix of tuples (Nishanth).
2. New patches: convert all bindings and fix up DTS files.
3. Several minor fixes in UFS bindings.

Dependencies
============
1. The DTS patches (10-15) depend on scsi/ufs driver change (patch 9), so
   they should go in a following release, after merging driver.

   This is also might affect out-of-tree users of these DTSes (other
   projects, e.g. U-boot).

Best regards,
Krzysztof

Krzysztof Kozlowski (15):
  dt-bindings: ufs: add common platform bindings
  dt-bindings: ufs: samsung,exynos-ufs: use common bindings
  dt-bindings: ufs: cdns,ufshc: convert to dtschema
  dt-bindings: ufs: drop unused/old ufs-qcom PHY bindings
  dt-bindings: ufs: qcom,ufs: convert to dtschema
  dt-bindings: ufs: hisilicon,ufs: convert to dtschema
  dt-bindings: ufs: mediatek,ufs: convert to dtschema
  dt-bindings: ufs: snps,tc-dwc-g210: convert to dtschema
  scsi: ufs: deprecate 'freq-table-hz' property
  arm64: dts: hi3670: use 'freq-table' in UFS node
  arm64: dts: ti: use 'freq-table' in UFS node
  arm64: dts: qcom: use 'freq-table' in UFS node
  arm64: dts: qcom: msm8996: drop unsupported UFS
    vddp-ref-clk-max-microamp
  arm64: dts: qcom: msm8996: correct UFS compatible
  arm64: dts: qcom: sm8350: drop duplicated ref_clk in UFS

 .../devicetree/bindings/ufs/cdns,ufshc.txt    |  32 ---
 .../devicetree/bindings/ufs/cdns,ufshc.yaml   |  68 +++++
 .../bindings/ufs/hisilicon,ufs.yaml           |  90 +++++++
 .../devicetree/bindings/ufs/mediatek,ufs.yaml |  67 +++++
 .../devicetree/bindings/ufs/qcom,ufs.yaml     | 241 ++++++++++++++++++
 .../bindings/ufs/samsung,exynos-ufs.yaml      |  13 +-
 .../bindings/ufs/snps,tc-dwc-g210.yaml        |  51 ++++
 .../bindings/ufs/tc-dwc-g210-pltfrm.txt       |  26 --
 .../devicetree/bindings/ufs/ti,j721e-ufs.yaml |   9 +-
 .../devicetree/bindings/ufs/ufs-common.yaml   |  88 +++++++
 .../devicetree/bindings/ufs/ufs-hisi.txt      |  42 ---
 .../devicetree/bindings/ufs/ufs-mediatek.txt  |  45 ----
 .../devicetree/bindings/ufs/ufs-qcom.txt      |  63 -----
 .../devicetree/bindings/ufs/ufshcd-pltfrm.txt |  90 -------
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi     |   4 +-
 .../boot/dts/qcom/msm8996-xiaomi-common.dtsi  |   1 -
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   5 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |   5 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |   2 +-
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     |   4 +-
 drivers/scsi/ufs/ufshcd-pltfrm.c              |  21 +-
 26 files changed, 641 insertions(+), 335 deletions(-)
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
