Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC5DC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 19:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VjLd1nuoNWSuaeUtyWKtxDYpUbXn132wdkyXA1go//4=; b=fvclLbsyCAZkzQ
	w3plxdEV8kyPfkgys5qNNb/yDvow5RmIhQ+UDMXxB/ENV+VNXYrXJCifDCPVZgfONGt2Hfh7pRG/g
	/IU8B40h2UWzvgeaVjhWuIKS/ftl1FDHqmw+BZ0WOrTELv06b20zlPAJ9YOjPeX9LgTGMbKgGYrLD
	GKYeH2YIKSIqnBBxBCGHXwau0em+82vp2Sy6RM1tyNXzD3P0c8wxHVgjFfJTY7jD8AcDIVM4pKZuq
	VI1QTdoG9Zkn5Pe+cw6Dur1m+g4OQheiH8nGEBTFf+oeyLdBTY8wwBaURdrlnb4HvxOBImoSANiGf
	Q+s05YIPC3KhBnRhN8LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNgGB-006nSW-RV; Fri, 25 Feb 2022 19:28:11 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNgG8-006nRJ-Sv; Fri, 25 Feb 2022 19:28:10 +0000
Received: by mail-oo1-f41.google.com with SMTP id
 d134-20020a4a528c000000b00319244f4b04so7663845oob.8; 
 Fri, 25 Feb 2022 11:28:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X8XRKdsoUlIbeZX9Kbpo1u5/qExNk89LzO1FLWxirjo=;
 b=DCnwGMIkHCnRR+LsN6hWmQPtxcMNP3NGE+q0X/HQomLdmIGWZcxlJY1PKUaM2IBNsT
 GyFMHoKXDw+nhIMYATnG7KKrSaSaZsSBrfzlb54L+i+ptB/U0mrY7O6oR2ed7fLpLijt
 SVTBuzs5eOKdqoJcl0RmPDWusSWEG3nIgJfedMEMpsVyOR46pIiOi+sOJbY/kGN2uRZR
 JnIkR8ib6tOthpJlbLfONPnaKVmMl4LJEOZ7x/+9dd0EBAQwcXa0AcbOlGzTkD3IYmyA
 Hq8VKh1anFXgFIHYUuoVSzravkDKwypULQdPUDcWfu00wqIfUV0/ouoPt5qLBq38RQwJ
 l3wQ==
X-Gm-Message-State: AOAM530t4cl4PRfHM2RtX+sVnqdUkzcbyOxTO+uD+xdh4ANTbLJGjBCF
 jJrj1IOPCvhhGVyE3enPYA==
X-Google-Smtp-Source: ABdhPJwVEZM5rvnnqotGkma9eczMXnrGAG98XV+6DQsn54U1mLF0tgQPBBOVv1ou/CBU/cdgtlOpnw==
X-Received: by 2002:a4a:e656:0:b0:2e9:1181:18f with SMTP id
 q22-20020a4ae656000000b002e91181018fmr3404319oot.18.1645817287924; 
 Fri, 25 Feb 2022 11:28:07 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 g2-20020a056830160200b005af14cf9962sm1501112otr.32.2022.02.25.11.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 11:28:07 -0800 (PST)
Received: (nullmailer pid 1290648 invoked by uid 1000);
 Fri, 25 Feb 2022 19:28:06 -0000
Date: Fri, 25 Feb 2022 13:28:06 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Rob Herring <robh+dt@kernel.org>, Avri Altman <avri.altman@wdc.com>,
 Tero Kristo <kristo@kernel.org>, Stanley Chu <stanley.chu@mediatek.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Yaniv Gardi <ygardi@codeaurora.org>, Jan Kotas <jank@cadence.com>,
 linux-arm-msm@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, devicetree@vger.kernel.org,
 Wei Xu <xuwei5@hisilicon.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-scsi@vger.kernel.org, Nishanth Menon <nm@ti.com>,
 linux-mediatek@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Li Wei <liwei213@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v2 03/15] dt-bindings: ufs: cdns,ufshc: convert to dtschema
Message-ID: <YhktxjvbD8E+tRHV@robh.at.kernel.org>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
 <20220222145854.358646-4-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220222145854.358646-4-krzysztof.kozlowski@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_112808_956106_3AE969E4 
X-CRM114-Status: GOOD (  10.74  )
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

On Tue, 22 Feb 2022 15:58:42 +0100, Krzysztof Kozlowski wrote:
> Convert the Cadence Universal Flash Storage (UFS) Controlle to DT schema
> format.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../devicetree/bindings/ufs/cdns,ufshc.txt    | 32 ---------
>  .../devicetree/bindings/ufs/cdns,ufshc.yaml   | 68 +++++++++++++++++++
>  .../devicetree/bindings/ufs/ti,j721e-ufs.yaml |  7 +-
>  3 files changed, 71 insertions(+), 36 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/ufs/cdns,ufshc.txt
>  create mode 100644 Documentation/devicetree/bindings/ufs/cdns,ufshc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
