Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D82C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 22:47:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68F61221EB
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 22:47:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o9aBlkZU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68F61221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ozRi93P7kS5GAfMaZDAXbS0Yju7/2FVQsMjNZdGBk3k=; b=o9aBlkZUignOJ6dxBRS1mFQ3v
	gNzoDfPkMSiCoRx/XZMO3auOzPHh23Xs+lItum011pbdItf0aCsOZiMqtmHT9sXFYw/EV6GCbCM4K
	ezwxnPKXgOihqnWoYaZDN9c8HlqX1R37OmrQ7e3qG88CHiiR0fzCEBvuCnNqaWQO/I8mXqbjhaM6U
	tjbb9EeSqxqTLpqon+ZeYAg25iJckUPP7xrPpTcftdi0MTHqz4/YqjhuFhQng9dBXvdQU6bi6Eqnv
	dF9IIAYczIRU6uR0oCNha9osVesGfditjY9b4iUVXSRDh6Cgr3K2+oCIHc0n+4z6yfj5RRHOocGxj
	CFtraWu1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGrpH-0002K6-Cs; Fri, 11 Sep 2020 22:47:27 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGrpD-0002Iv-1c; Fri, 11 Sep 2020 22:47:23 +0000
Received: by mail-il1-f195.google.com with SMTP id x2so10468535ilm.0;
 Fri, 11 Sep 2020 15:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=toRK8zGv7TSJRoFMqCRYc0FnDU6AsE8wqo5QvqdD9Y0=;
 b=bFKzh2LjoahvGV9MnfhBeDv8duk+4CdYDCT/8+iBaF2ZNU1CMKE0QnjHtbGYG0n3xb
 h1JW3Y5WNZexJV3+2Tk9/d3yEGgnYxIYyqu61UCl1A6YnUKiaR4PrJf4LURdQuJfOnIa
 mwzaJ76BGv3UVnA3GBocDrH0220pKfcqW4mQbEYrSvspDvPYIq1PNhL41w11/1GCBVw1
 4OPO8t5uK2WfB8W5y5RfxmEBr3iemOcuUM7RKbW1Qz9+DPxtvXE5AckJ5L0/aM97Jm0N
 jAASXlhQrkT74H8PhmDx3tbuoRB+4pExo+u8up/rbyiOwoHPr92Gc83KqFBvj7z1acuQ
 pwNQ==
X-Gm-Message-State: AOAM532C3li767OVCx9rgQJJqzzpOEsuHLuY8wQEWsoadIUwvGLn/X4y
 XKjNxlrSyzlq+9Kx73lBmw==
X-Google-Smtp-Source: ABdhPJz2tzFgwdaI7kMcby20MLuKDjuwoCwCUru/3NSCPPsR6LUbfstzJwDVYDEEYeQEjRY4jj0a+A==
X-Received: by 2002:a05:6e02:eb0:: with SMTP id
 u16mr416324ilj.291.1599864442418; 
 Fri, 11 Sep 2020 15:47:22 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id i1sm1880771ilk.39.2020.09.11.15.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 15:47:21 -0700 (PDT)
Received: (nullmailer pid 2961743 invoked by uid 1000);
 Fri, 11 Sep 2020 22:47:09 -0000
Date: Fri, 11 Sep 2020 16:47:09 -0600
From: Rob Herring <robh@kernel.org>
To: Chuanjia Liu <chuanjia.liu@mediatek.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: pci: mediatek: Modified the Device
 tree bindings
Message-ID: <20200911224709.GA2960430@bogus>
References: <20200910061115.909-1-chuanjia.liu@mediatek.com>
 <20200910061115.909-2-chuanjia.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910061115.909-2-chuanjia.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_184723_108020_F1D9B439 
X-CRM114-Status: GOOD (  11.00  )
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
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 yong.wu@mediatek.com, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 10 Sep 2020 14:11:12 +0800, Chuanjia Liu wrote:
> Split the PCIe node and add pciecfg node to fix MSI issue.
> 
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
> ---
>  .../bindings/pci/mediatek-pcie-cfg.yaml       |  38 +++++
>  .../devicetree/bindings/pci/mediatek-pcie.txt | 144 +++++++++++-------
>  2 files changed, 129 insertions(+), 53 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.example.dt.yaml: example-0: pciecfg@1a140000:reg:0: [0, 437518336, 0, 4096] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml


See https://patchwork.ozlabs.org/patch/1361249

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
