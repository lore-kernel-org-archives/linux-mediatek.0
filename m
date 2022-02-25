Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFF4C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 19:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HGDWP1AftyVBIdYtX7Drza/Y3RRR1hofUrmhYwaayv0=; b=RL9h4OTXescSg9
	7JOKG50TUN9lWEPGykQKuy0VxavWBezrSCFOG2hZg88lhU52lplyh8kGHmLMS5l6D5ggSw2IPXmnb
	NdX69Jb3nTr/1ILp7C2VgcekPdwXEGv4V2IiM0DXNqj/SA7YCJS3/Ig48/TfF8dei7nAP+W/7jRQ5
	z+jpfcVJV/PpIbSrM/DCjsXqpJVd+keupmiB1A9tGt4HOOR/kzRJLNAKWUidUqK3hmCF7d/DAPWhd
	3SiCMsKodA1TosyZbAsZk/Bzm+UZN7cS+Xxs2+w+7DagJ3BdtdfCEZ7R3I51veC2jHpfOiYoHXHVV
	2HDEb+vnFYRXf0Gw7R0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNgLf-006ou5-4e; Fri, 25 Feb 2022 19:33:51 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNgLc-006orm-99; Fri, 25 Feb 2022 19:33:49 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 j9-20020a9d7d89000000b005ad5525ba09so4305319otn.10; 
 Fri, 25 Feb 2022 11:33:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LXWgeu8+968e0Kmo1u41wpbvPdau1hEHUCnnzvatggs=;
 b=x2M3QpoGHTHzPegO5NF2tK0cRt3nVB66nLznCk7TnIs3dWE+Llwmt8y5E4uCTe9/+6
 vJPqn8hwjSh44qp0LXl5fuh/j8YVVZhWQ1YOueTdfHb1DDxSbCe/iuYNLALsHH5fT/bI
 K5f71JtUlpD06LScE3M4VtaG5/WrI0s7bsCcjGorCouKie76rmolFbzCpONE9I8Uguki
 N0c3fIBZZGIlFIN6ntMbvYYos/MdRBa95lwV9oMdkgQ1m2ua5TtuCIFbjZgQjE9szefr
 jEfSdVIvRFQJYsc5z6m4tUjKrKc0bt+oV19oGHt5TF9eyFqCWP97sEi40/FH9krIhje4
 QZzw==
X-Gm-Message-State: AOAM530h1v5Xdc8fx6tzYq9x3fznQcInh+bQ7nRwlB7FbRdmPJYhSoOp
 eXRES5YmjFbHT7CY7STR3Vn3TD6OuQ==
X-Google-Smtp-Source: ABdhPJzWS5GZdRiTixomm/Zw4NMpp3+A1z1Lq0uTL92KKpb/O56qwbzhuIIrXP/F+SlhamPdwaRolA==
X-Received: by 2002:a9d:b93:0:b0:5af:82ec:574e with SMTP id
 19-20020a9d0b93000000b005af82ec574emr3573389oth.209.1645817626861; 
 Fri, 25 Feb 2022 11:33:46 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 a27-20020a4ae93b000000b0031be7c7d2d3sm1524442ooe.0.2022.02.25.11.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 11:33:46 -0800 (PST)
Received: (nullmailer pid 1299041 invoked by uid 1000);
 Fri, 25 Feb 2022 19:33:45 -0000
Date: Fri, 25 Feb 2022 13:33:45 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Yaniv Gardi <ygardi@codeaurora.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Li Wei <liwei213@huawei.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Jan Kotas <jank@cadence.com>, Wei Xu <xuwei5@hisilicon.com>,
 Stanley Chu <stanley.chu@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org,
 Nishanth Menon <nm@ti.com>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v2 05/15] dt-bindings: ufs: qcom,ufs: convert to dtschema
Message-ID: <YhkvGS8dSA0Sh0nR@robh.at.kernel.org>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
 <20220222145854.358646-6-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220222145854.358646-6-krzysztof.kozlowski@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_113348_349850_43F29625 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 22 Feb 2022 15:58:44 +0100, Krzysztof Kozlowski wrote:
> Convert the Qualcomm Universal Flash Storage (UFS) Controller to DT
> schema format.
> 
> Except the conversion, add also properties already present in DTS:
> iommus, interconnects and power-domains.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../devicetree/bindings/ufs/qcom,ufs.yaml     | 241 ++++++++++++++++++
>  .../devicetree/bindings/ufs/ufshcd-pltfrm.txt |  90 -------
>  2 files changed, 241 insertions(+), 90 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
>  delete mode 100644 Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
