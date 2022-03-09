Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6BFC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Mar 2022 02:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iPYkP7p8nayTRELaqYlxno+oDoJ+RRN8ifraQemv4WQ=; b=4yqxsDXpJaKUUH
	Fkn+0LN9jV5fZeDfGkGw47ULFKYkINHO1Yh8Xuudhw5rM2bF3PQLsCqC3vIf4fn70ullxi/u5OD6E
	Czm3gCgS4pfeWHORVToA30AD6QenS9zQOVXIaycZFgcvgWJTx/w1nRwcSWFfvqLbSK4ZO1GthkgvK
	VZ6ZEq/EIsIyPlqbjrUIraxbe4C0qhglzENRdrZOY8Otn5PK6PbF8/my8z5K6KyNF8NedGtBwUqHz
	/CgRkLxxKL8ehFPgVV4gRMuRLdjdgOc1v5RZBR7My8rXnCRu7b2RiMn3AgBadYiqHJsLVCOcUfmzO
	pGKh/Tf1Iueml3qF59Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRlde-006s5o-Cz; Wed, 09 Mar 2022 02:01:18 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRldN-006s0N-U7; Wed, 09 Mar 2022 02:01:07 +0000
Received: by mail-oi1-f173.google.com with SMTP id j83so1239511oih.6;
 Tue, 08 Mar 2022 18:00:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mWEHy9bniNne88jJU8uXaag3F19iRbd78liIzCE7PTs=;
 b=HUgoTO2oLkkitI/zsD3O65dSDc0CUnrBCuY+XaPZ2i0diMalI2FiDHuF4AnTw+bV5q
 qE4p3HPccb+Z5iihuqute8HMpIpFZcfmZLDj8MxSeObdBjWpNEoeifgY38GXSwzl/DEd
 pcsI1EuZLr4L5pCs5QEDMKFBAEuVyCNgckrP0by9mt6/BpTn998DCkX6vq4LyNLm9dqp
 hzczmVcBCZiRcpVwNF6V5rLzuTyTEsM2ooJpFvI6ip1VyyrKQ7ac+E010rzY/DnLNKnf
 AzXVaXrQaCkv9+dLArGeTQFjJxbIUPRz4AfBf/cO4Ft0/qaZHI9/LJxUnKPJlHG3Ej6q
 K6ag==
X-Gm-Message-State: AOAM533t5ZHfvCeW+YC0TSikKNJmT0DVHnm9yw5ilL2scfH38a2lqTCs
 reh2JKKroFB9lHiLfHPZPA==
X-Google-Smtp-Source: ABdhPJyP4NIvcuJfaHjGGoZ6i+F9U7s3CMH3FV08j2d4EMWj+LpBXTOaiaseboj4DN2mhj42qVnlzQ==
X-Received: by 2002:a05:6808:1201:b0:2d9:a01a:48b8 with SMTP id
 a1-20020a056808120100b002d9a01a48b8mr4473119oil.259.1646791258942; 
 Tue, 08 Mar 2022 18:00:58 -0800 (PST)
Received: from rob (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
 by smtp.gmail.com with ESMTPSA id
 v37-20020a056830092500b005b1f7daf40asm241123ott.75.2022.03.08.18.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 18:00:58 -0800 (PST)
Received: (nullmailer pid 1765443 invoked by uid 1000);
 Wed, 09 Mar 2022 02:00:56 -0000
Date: Tue, 8 Mar 2022 19:00:56 -0700
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Wei Xu <xuwei5@hisilicon.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
 Stanley Chu <stanley.chu@mediatek.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 00/12] dt-bindings: ufs: add common platform bindings
 + fixes
Message-ID: <20220309020056.GA1764427@robh.at.kernel.org>
References: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_180106_117504_B7057189 
X-CRM114-Status: GOOD (  17.73  )
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

On Sun, Mar 06, 2022 at 12:11:13PM +0100, Krzysztof Kozlowski wrote:
> Hi,
> 
> Not tested on hardware, so please kindly test.
> Bindings maintainers might need checking - taken from git log.
> 
> Changes since v2
> ================
> 1. Do not deprecate freq-table-hz, but instead update dtschema to accept
>    uint32-matrix. See:
>    https://github.com/devicetree-org/dt-schema/pull/69
> 2. Drop patches and changes related to freq-table-hz -> freq-table conversion.
> 3. Add tags.
> 4. Change maintainer of qcom,ufs.
> 
> Changes since v1
> ================
> 1. Make freq-table as matrix of tuples (Nishanth).
> 2. New patches: convert all bindings and fix up DTS files.
> 3. Several minor fixes in UFS bindings.
> 
> Dependencies
> ============
> None dependencies. The DTS patches can go independently via respective
> maintainers. The dt-bindings patches could go via UFS tree.
> 
> Best regards,
> Krzysztof
> 
> Krzysztof Kozlowski (12):
>   dt-bindings: ufs: add common platform bindings
>   dt-bindings: ufs: samsung,exynos-ufs: use common bindings
>   dt-bindings: ufs: cdns,ufshc: convert to dtschema
>   dt-bindings: ufs: drop unused/old ufs-qcom PHY bindings
>   dt-bindings: ufs: qcom,ufs: convert to dtschema
>   dt-bindings: ufs: hisilicon,ufs: convert to dtschema
>   dt-bindings: ufs: mediatek,ufs: convert to dtschema
>   dt-bindings: ufs: snps,tc-dwc-g210: convert to dtschema

Patches 1-8 applied.

Rob

>   arm64: dts: hisilicon: align 'freq-table-hz' with dtschema in UFS
>   arm64: dts: qcom: msm8996: drop unsupported UFS
>     vddp-ref-clk-max-microamp
>   arm64: dts: qcom: msm8996: correct UFS compatible
>   arm64: dts: qcom: sm8350: drop duplicated ref_clk in UFS
> 
>  .../devicetree/bindings/ufs/cdns,ufshc.txt    |  32 ---
>  .../devicetree/bindings/ufs/cdns,ufshc.yaml   |  68 +++++
>  .../bindings/ufs/hisilicon,ufs.yaml           |  90 +++++++
>  .../devicetree/bindings/ufs/mediatek,ufs.yaml |  67 +++++
>  .../devicetree/bindings/ufs/qcom,ufs.yaml     | 242 ++++++++++++++++++
>  .../bindings/ufs/samsung,exynos-ufs.yaml      |  13 +-
>  .../bindings/ufs/snps,tc-dwc-g210.yaml        |  51 ++++
>  .../bindings/ufs/tc-dwc-g210-pltfrm.txt       |  26 --
>  .../devicetree/bindings/ufs/ti,j721e-ufs.yaml |   7 +-
>  .../devicetree/bindings/ufs/ufs-common.yaml   |  82 ++++++
>  .../devicetree/bindings/ufs/ufs-hisi.txt      |  42 ---
>  .../devicetree/bindings/ufs/ufs-mediatek.txt  |  45 ----
>  .../devicetree/bindings/ufs/ufs-qcom.txt      |  63 -----
>  .../devicetree/bindings/ufs/ufshcd-pltfrm.txt |  90 -------
>  MAINTAINERS                                   |   1 +
>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi     |   4 +-
>  arch/arm64/boot/dts/hisilicon/hi3670.dtsi     |   4 +-
>  .../boot/dts/qcom/msm8996-xiaomi-common.dtsi  |   1 -
>  arch/arm64/boot/dts/qcom/msm8996.dtsi         |   3 +-
>  arch/arm64/boot/dts/qcom/sm8350.dtsi          |   3 -
>  20 files changed, 614 insertions(+), 320 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/ufs/cdns,ufshc.txt
>  create mode 100644 Documentation/devicetree/bindings/ufs/cdns,ufshc.yaml
>  create mode 100644 Documentation/devicetree/bindings/ufs/hisilicon,ufs.yaml
>  create mode 100644 Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
>  create mode 100644 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
>  create mode 100644 Documentation/devicetree/bindings/ufs/snps,tc-dwc-g210.yaml
>  delete mode 100644 Documentation/devicetree/bindings/ufs/tc-dwc-g210-pltfrm.txt
>  create mode 100644 Documentation/devicetree/bindings/ufs/ufs-common.yaml
>  delete mode 100644 Documentation/devicetree/bindings/ufs/ufs-hisi.txt
>  delete mode 100644 Documentation/devicetree/bindings/ufs/ufs-mediatek.txt
>  delete mode 100644 Documentation/devicetree/bindings/ufs/ufs-qcom.txt
>  delete mode 100644 Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> 
> -- 
> 2.32.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
