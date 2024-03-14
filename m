Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBBAC54E60
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Mar 2024 13:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6C3jO8eBOG5QFj7BJUWJ1O4619UwI1qVQ7+/t2fMVWc=; b=P2dmlKFyiGGikdyF47BNkg1j2q
	qypVe0P5Wf+M9cvjpUF5YSCb3EwGluXYsHqY7UkdGwiaf2jYpwd3AXbfZw/xfN8Z1+MLnThGm2J7d
	QCOgKFEdXlkylyG60AnAOR4MQ7pEy6rTY87UNXNdovuG8/ORaZidRSkKxiE/MrCHXJpAtyD+pKcgx
	nP1EKpT5yb7tuH8eb1shgQVGTdxU4gCOiAzrakWigUx21QzyzA9yWIOSeN9qbtefuSkzblZTGBXyW
	DDNSLrD0jcKIdZflxBDota+OyKO6tajnEHa+gK4R2XRnS4O5CGDN2sMazM0TxgBShu97ed2nGdB5D
	MoF/rcuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rklEq-0000000ERxm-33qg;
	Thu, 14 Mar 2024 13:35:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rklEm-0000000ERwK-0pOY;
	Thu, 14 Mar 2024 13:35:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8A837CE1474;
	Thu, 14 Mar 2024 13:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997ECC433F1;
	Thu, 14 Mar 2024 13:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710423309;
	bh=7MInMHtoGdehrIAJNogrxHccX5NMyWPQEacFTK2okTo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=LucOsMCKeLSixnva7ujYgxBrWw8Fb0J0XZmNy0PpGV6FvzJ2ZXLrxheRdhy+iPvUw
	 r96bOg4gCn1STEXXyQpdpJyqJR62RB0rOgBEVzw2bhsvBJf6mW8qdRVKGbLqZZHTkU
	 w85u8/WmhOZRiMGilPXWUbFbNoOq7S8u8YXlgJldYh9Dt384hUTREo3P2h6hHQ9O27
	 CmGsNTDRrlhCqhU9tNoNm4BLisK4GxLj+7eSEPyNh14ToY/s+JsukbO7nvQklGos5L
	 W1v0ucBQBg6peZSLQ8nWKsZhMBx5guUIdNJilF/y2FrqRDbn7/eBylLiFsZ9QHzuG2
	 neUHNxe0b2SpQ==
Date: Thu, 14 Mar 2024 07:35:08 -0600
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Amrit Anand <quic_amrianan@quicinc.com>
Cc: konrad.dybcio@linaro.org, linux-riscv@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 kernel@quicinc.com, conor+dt@kernel.org, agross@kernel.org, 
 devicetree@vger.kernel.org, caleb.connolly@linaro.org, 
 chrome-platform@lists.linux.dev, andersson@kernel.org, 
 linux-kernel@vger.kernel.org, peter.griffin@linaro.org, 
 krzysztof.kozlowski+dt@linaro.org
In-Reply-To: <1710418312-6559-3-git-send-email-quic_amrianan@quicinc.com>
References: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
 <1710418312-6559-3-git-send-email-quic_amrianan@quicinc.com>
Message-Id: <171042330739.2706595.14845037469137084350.robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: qcom: Update DT bindings for
 multiple DT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_063512_629626_E653A838 
X-CRM114-Status: GOOD (  15.77  )
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


On Thu, 14 Mar 2024 17:41:52 +0530, Amrit Anand wrote:
> Qualcomm produces a lot of "unique" boards with slight differences in
> SoC's and board's configuration. For eg, there can be SM8150v1 on MTPv1,
> SM8150v1 on MTPv2, SM8150v2 on MTPv2, SM8150v2 on MTPv2 with a different
> PMIC, SM8150v2 with no modem support and so on. For instance, suppose we
> have 3 SoC, each with 4 boards supported, along with 2 PMIC support for
> each case which would lead to total of 24 DTB files. Along with these
> configurations, OEMs may also add certain additional board variants. Thus
> a mechanism is required to pick the correct DTB for the corresponding board.
> 
> Introduce mechanism to select required DTB using newly introduced device
> tree properties "board-id" and "board-id-type". "board-id" will contain
> the list of values of "qcom,soc-id", "qcom,board-id", "qcom,pmic-id" or
> "qcom,oem-id". "board-id-types" contains the type of parameter which is
> entered. It can be either "qcom,soc-id", "qcom,board-id", "qcom,pmic-id"
> or "qcom,oem-id".
> 
> Qualcomm based bootloader will use these properties to pick the best
> matched DTB to boot the device with.
> 
> Signed-off-by: Amrit Anand <quic_amrianan@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 90 +++++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/qcom.yaml:1159:8: [warning] wrong indentation: expected 6 but found 7 (indentation)
./Documentation/devicetree/bindings/arm/qcom.yaml:1162:8: [warning] wrong indentation: expected 6 but found 7 (indentation)
./Documentation/devicetree/bindings/arm/qcom.yaml:1165:15: [warning] wrong indentation: expected 13 but found 14 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/1710418312-6559-3-git-send-email-quic_amrianan@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


