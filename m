Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B2AC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 20:17:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21C2361A13
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 20:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21C2361A13
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h8JyRrk7gJ3zwOgpn4ujXll0G3BF9cq3KCtQEi/cTlo=; b=T4xy0KuvIQMtKbML63dr8/598
	v/lxRHJlTtSaOICYaOPWupjdZE85raRttEKVOf9uie+s9JXDYSYn9SitE1syIq5qUV8xxJLOvswid
	Bizv/kiVWiHyDWBh6SIIwic4DTKt2rtcKeqh/p8QAnvE3U49ooraDNfnTGDaJ3pXQeJ/TPU3oc8ku
	D91K2bWjUkWzen66ZQtYhEsLnkNKfY1BN9Gu1xGtJaXsFGacuEG5hNFSd5RQgJVcIasv4bVSTLGXd
	jrw2GEngDArtL8xbmkBSA81fp85yGtf56d/7xIGe+CoxydlOba2EoSoPAvDWd6sfcCTMlPO/f3fH5
	KUdADfaLA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPstj-004IYM-5B; Fri, 26 Mar 2021 20:17:35 +0000
Received: from mail-io1-f48.google.com ([209.85.166.48])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPstd-004IXA-6A; Fri, 26 Mar 2021 20:17:30 +0000
Received: by mail-io1-f48.google.com with SMTP id f19so6669216ion.3;
 Fri, 26 Mar 2021 13:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/waVsYbxc/CEMfLtl1ZIVb7VmU/61u6EDNxRL9TvBpc=;
 b=Gm/ejx00ewr6dj28LDiBerQPPLfcKW90y4rnUzBV8e5v+hv/5YcY3QXKCQEbuixVKu
 NWx7EhKP3SHXebaHJEej7/Xab19xAo1FbS7ugGYRCh//4WRUkJjYImI7Qgkvsg3OV8Nr
 EBD+h8dg9eewJWgjhd8U+hTk6z2v+apDothL/7t7Rk977dXsTS7wB2axcEhXX3S8M1EP
 c2clcSQJlnq+UWj4oCQz8SPKTgGZHo+B7Z3mB/aD57WHPUTNRpIL/hXQJOWPZ4/8ekYS
 hpUf9rVR57/0GTfTTQiy6iixzGz0aGOIgVBKnNhmtt8WvbTZuehU4e/9FNErV1zu4uCg
 bdDQ==
X-Gm-Message-State: AOAM533ClAsw87dWkVmmOmSOYuokGW51GrufGL26V1MnF/My1pf7rIFI
 3F6d6BiMrP4v0tjei9Dj0A==
X-Google-Smtp-Source: ABdhPJxZzBaleRES7A/UrIChjERT4dMfo0japjM1iovfhStVjE/NXeNNsTYKiCfKKZqaLcowlCpFyw==
X-Received: by 2002:a5e:c809:: with SMTP id y9mr11900357iol.192.1616789847392; 
 Fri, 26 Mar 2021 13:17:27 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id 74sm4761952iob.43.2021.03.26.13.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 13:17:26 -0700 (PDT)
Received: (nullmailer pid 3797288 invoked by uid 1000);
 Fri, 26 Mar 2021 20:17:24 -0000
Date: Fri, 26 Mar 2021 14:17:24 -0600
From: Rob Herring <robh@kernel.org>
To: Chuanjia Liu <chuanjia.liu@mediatek.com>
Cc: ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
 linux-mediatek@lists.infradead.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 yong.wu@mediatek.com, bhelgaas@google.com, frank-w@public-files.de,
 linux-pci@vger.kernel.org, lorenzo.pieralisi@arm.com,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v8 1/4] dt-bindings: PCI: mediatek: Update the Device
 tree bindings
Message-ID: <20210326201724.GA3797259@robh.at.kernel.org>
References: <20210323033833.14954-1-chuanjia.liu@mediatek.com>
 <20210323033833.14954-2-chuanjia.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323033833.14954-2-chuanjia.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_201729_269653_607E6629 
X-CRM114-Status: GOOD (  12.77  )
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

On Tue, 23 Mar 2021 11:38:30 +0800, Chuanjia Liu wrote:
> There are two independent PCIe controllers in MT2712 and MT7622
> platform. Each of them should contain an independent MSI domain.
> 
> In old dts architecture, MSI domain will be inherited from the root
> bridge, and all of the devices will share the same MSI domain.
> Hence that, the PCIe devices will not work properly if the irq number
> which required is more than 32.
> 
> Split the PCIe node for MT2712 and MT7622 platform to comply with
> the hardware design and fix MSI issue.
> 
> Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  .../bindings/pci/mediatek-pcie-cfg.yaml       |  39 ++++
>  .../devicetree/bindings/pci/mediatek-pcie.txt | 201 ++++++++++--------
>  2 files changed, 146 insertions(+), 94 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
