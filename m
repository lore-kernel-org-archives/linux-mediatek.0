Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45106C12002
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 17:33:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2992613FD
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 17:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2992613FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bgJiscIByB+tIZTwex7D5LlSnFPTRs4Bo6f6RwAYFmA=; b=s8ikniKz+pGKf5
	/zmOWMGdU0ytgtHLmBH5n49bmtaa4q4++ADi4G/0XbBxFRrYGBRdAwRoULAJA8W1kx52QlUzFCV4O
	H8YjT1bi6P24ZsTdvC+ARrpEMHNCUXRTN4pYrRjVKdcQcQFF9waB3iRphOg3+1RnWrRUe1hXSJPBU
	Y3gI89WHasAvJDauozO21bBtCvEfKXIyV6Czj6iFIv082b4eDc2hyh7gMKVPQLTL9dnk9wWq+QnNI
	2tIJNpxYuhBICD+HPBXz5r8vs6PgPBtjlpeAN/ZaS7lT12I3g+8/XiwB4MBPZ2au8GOsUWA0Wnxq1
	DKFZ4LkFjx8oux7LcuUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4RiX-004ww4-Hq; Fri, 16 Jul 2021 17:33:41 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4RiV-004wve-4T; Fri, 16 Jul 2021 17:33:40 +0000
Received: by mail-io1-f45.google.com with SMTP id x10so11475079ion.9;
 Fri, 16 Jul 2021 10:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bBjy0/9KrCFc43pikW3DapYBnLJRP7OXLZVYWY+cmRw=;
 b=cp7Kva5n1gJmNUWNYbeKy5LITN6K4uozBXST53EqFkm7XvIBj5bzJ1cd/l9pnrn8Xw
 OEHGqzKmLEAdsLVXYizO9fNGNEj/G41VLFiIRMHtXjZW0wkZygOHrHd4LrtZTVqcCf0F
 cYwjhgrMPlK2hGXM6to9AUEgBYxNioszyHZfYqtmaTy1XQmGDyjq2V/fMcjMCYb4aXDN
 gAdOJFYRFMKOf0L4pRB0JamYUKdSBA9c5uJP240xRwC7YfNZ3XeouAqa6KSfLye9onbn
 t2uti0Sue05dBJHGIUbUTFytPPu4JDAO/E74meYluxuSOXJb0Ez9wex1Fv22nSxUbXCT
 leuw==
X-Gm-Message-State: AOAM532ETZjAzkW2Oic0KS8QX8rQAcft8qEONykAAmcuhAZkDTk6TeBD
 CfJ8PPLBDZe5hbXoe8pxWA==
X-Google-Smtp-Source: ABdhPJzCbDOWUkZnVdfikQrZKWQIRQPpnK2e+P3EobkMzcpWA9doURsO3jNZdUmZuJQDbGWnD2EtQw==
X-Received: by 2002:a02:a797:: with SMTP id e23mr9901120jaj.121.1626456817576; 
 Fri, 16 Jul 2021 10:33:37 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id i14sm4765382ilu.71.2021.07.16.10.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 10:33:36 -0700 (PDT)
Received: (nullmailer pid 3641673 invoked by uid 1000);
 Fri, 16 Jul 2021 17:33:33 -0000
Date: Fri, 16 Jul 2021 11:33:33 -0600
From: Rob Herring <robh@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, youlin.pei@mediatek.com,
 chuanjia.liu@mediatek.com, qizhong.cheng@mediatek.com, ot_jieyang@mediatek.com,
 drinkcat@chromium.org, Rex-BC.Chen@mediatek.com,
 Krzysztof Wilczyski <kw@linux.com>, Ryan-JH.Yu@mediatek.com
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: mediatek-gen3: Add property to
 disable dvfsrc voltage request
Message-ID: <20210716173333.GA3632722@robh.at.kernel.org>
References: <20210630024934.18903-1-jianjun.wang@mediatek.com>
 <20210630024934.18903-2-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210630024934.18903-2-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_103339_220198_22C1AC0B 
X-CRM114-Status: GOOD (  18.28  )
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

On Wed, Jun 30, 2021 at 10:49:33AM +0800, Jianjun Wang wrote:
> Add property to disable dvfsrc voltage request, if this property
> is presented, we assume that the requested voltage is always
> higher enough to keep the PCIe controller active.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>  .../devicetree/bindings/pci/mediatek-pcie-gen3.yaml       | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index e7b1f9892da4..3e26c032cea9 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -96,6 +96,12 @@ properties:
>    phys:
>      maxItems: 1
>  
> +  disable-dvfsrc-vlt-req:
> +    description: Disable dvfsrc voltage request, if this property is presented,
> +      we assume that the requested voltage is always higher enough to keep
> +      the PCIe controller active.
> +    type: boolean

What determines setting this property? Can it be implied by the 
compatible (which should be SoC specific).

Is this property specific to PCIe controller? 

Wouldn't the request be harmless to make the voltage request even if not 
needed?

I think this probably should be addressed in a common way as part of 
other QoS, devfreq, etc. requirements for devices.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
