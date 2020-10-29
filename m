Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E36C4363A
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 15:34:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5D3C20731
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 15:34:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pi91IGQ2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5D3C20731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pixYBcH28jYTdGz/kPND7ChbNbKJBwBPzC5PKdSqxWA=; b=Pi91IGQ2G3Wed7gZoD3m8ivSZ
	vhm4DCG61/uvILMmhyy+k3Udvx4e8i8Sxjra9CvSCBI85c+0uBsl7Uvls8hGDQuAyKypVlTSNuLoe
	7PE91PBLaCYmc1F4ev0Gzd9NLmuIlcFPBcKEjVpVriyLp+KC19jeLiinSA+TlKx7LrCEFECN+/s36
	nj0AoMAqEG9yB7yiIhGD1YTAelBGUyDnbrqCfFDXgm2yHcO999jQv74M8UOm6vx4eDPsvrxtXE0mc
	hGO7LbJSuyOxR3CFnUwC5Ui5Fy5mM3ZDzpeQf6Lj76HaxjXCKCEbSdItd3l/5egopmA1fWqKKZrWV
	sYCi5JXVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY9wJ-0002Hl-3w; Thu, 29 Oct 2020 15:34:11 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY9wE-0002GX-9w; Thu, 29 Oct 2020 15:34:07 +0000
Received: by mail-oi1-f194.google.com with SMTP id k65so3586254oih.8;
 Thu, 29 Oct 2020 08:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2aK/szC9cuz0dkwowt7HBz66qxgW7H05J1XCoOJdmtI=;
 b=I1uIpWH0KaIlkDj/t17lUE8c/fRLz+x+oHRUgth0Go5HyBzN1bXthbtpq1OF1ZIlkQ
 LqIRiYz2+rNCUMFdOCdyl/xlkzFtWWDS+fgBxo1V/3boZbJrqa6NP1BBkG8+WuqaYnhp
 F5fqTNHv4auCZQCmJVP9lpFY8bLLl1/IuzME0Kw1gSEY9oswS9of4W46kj08YNGcfRGx
 64wflBp+UYpFUurKqNIJgiLGwZER1mKr2xqn2bW9iEPbDm5A9KStp/RbyqJdthTqFQV2
 vQ89v9u5HAF5eHCDiZr8E1NngC20H3D6+aAW7h7SQBEMOAIbvqO+bwnkoYkQ4GOAxole
 R4Qg==
X-Gm-Message-State: AOAM531PJ0jdOa1C9OqvnBFwGTeN/XlRW1tDcO06VjM5lOv9U4JJB0Ll
 gkVmSbdUgbrcf5p3R68XFci9RKsdOQ==
X-Google-Smtp-Source: ABdhPJxG7ICq8C1FIbSZZtWag6ID+Jd5bh+2TxqPf8GogPBGE65XxoIbK5S1tuOukAIbQd3RCoMMEw==
X-Received: by 2002:aca:670b:: with SMTP id z11mr78596oix.116.1603985645332;
 Thu, 29 Oct 2020 08:34:05 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i18sm733762oik.7.2020.10.29.08.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 08:34:04 -0700 (PDT)
Received: (nullmailer pid 1912238 invoked by uid 1000);
 Thu, 29 Oct 2020 15:34:04 -0000
Date: Thu, 29 Oct 2020 10:34:04 -0500
From: Rob Herring <robh@kernel.org>
To: Chuanjia Liu <chuanjia.liu@mediatek.com>
Subject: Re: [PATCH v7 1/4] dt-bindings: pci: mediatek: Modified the Device
 tree bindings
Message-ID: <20201029153404.GB1911637@bogus>
References: <20201029081513.10562-1-chuanjia.liu@mediatek.com>
 <20201029081513.10562-2-chuanjia.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201029081513.10562-2-chuanjia.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_113406_371274_DC3697A6 
X-CRM114-Status: GOOD (  11.93  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, linux-pci@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, yong.wu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 29 Oct 2020 16:15:10 +0800, Chuanjia Liu wrote:
> Split the PCIe node and add pciecfg node to fix MSI issue.
> 
> Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  .../bindings/pci/mediatek-pcie-cfg.yaml       |  39 ++++++
>  .../devicetree/bindings/pci/mediatek-pcie.txt | 129 +++++++++++-------
>  2 files changed, 118 insertions(+), 50 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml:19:7: [warning] wrong indentation: expected 4 but found 6 (indentation)

dtschema/dtc warnings/errors:


See https://patchwork.ozlabs.org/patch/1389940

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
