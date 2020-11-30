Return-Path: <SRS0=DVVK=FE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0EC2C64E7B
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 17:34:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 635D32073C
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 17:34:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sOTrSBLH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 635D32073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FLQDf99bzWbxxD16L2xILjqvwpxznqg3dpReUdR0+ic=; b=sOTrSBLHACvq/QeuL2YK+mm6a
	d/nazHAG9PTnNomEZHMNKB4+p0IB7EqlflAP2dqtF7to8ifAMvGqrGVNaz2+LlyZ05QIvMQQ7tGg2
	74+lRCTuOHs8Fz2Z42cf5XdE0NvPf5t1m3bIbQceAmqkk2anYoVevQ2UxpsgSG+MDr6NMlZqQE/bO
	Kr6GxcMr4GMh+mCutH2B2b7CYsILinLgx4bNdUgKk+/LWomyKDR+/kOoNPiccZaZNxMP1mugqx5T5
	Zbu3hF1oqekB4w+9hTUH5+SB0QQekc629vw2kvJkuuf5x4RN6AJlQNSdgxOXorPq1kN5rXzMvUV5A
	gCQ2O/L0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjn3i-0002cr-A3; Mon, 30 Nov 2020 17:33:54 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjn3f-0002bp-94; Mon, 30 Nov 2020 17:33:52 +0000
Received: by mail-io1-f66.google.com with SMTP id r9so12619869ioo.7;
 Mon, 30 Nov 2020 09:33:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B8WQC1B/ybLTFuUDD6wQDsUH4CVJeOnw5YrNPlfBilM=;
 b=QSBdSfl27Vtl0xHGstOXx2IWqU3Y1II72DOmziVtPuSWLJnxBpc1KASKS60GQLvbmA
 Kh2K2mIyIj7GTT3YohS07rvVZ15q6ZRW7UuA0YtG66UXZ8y9jH8Ilg8ihIyoIPX11QSW
 pmSqYNijQY+zA0byefZe4cuUTNFnRl2P5yVhehOVop21APUi7PHtVLBqXYdYfdZu8fod
 FrThzSaiO+1IhnKfa7neVjy5yttDITyqFNCtd0SXBdCbP4IiPwlefGA55RySuH3BpgmP
 8yLSUzbiaJ0Hw7/21dnxlXzj+Y80WVMiMEHGsJwcMAnMzRVp0m3m2HqMHBdU1sAAFnQ7
 yXpw==
X-Gm-Message-State: AOAM531kgIIxd+8/p9zpMuVhR7EMqp/agY1MVLfXDGErbKB/RrZZumos
 q5j0fAMcpivgBA57RlFnQA==
X-Google-Smtp-Source: ABdhPJywT5iLKdkjFtGlm/c/VnI4j+umxG0XmUInig+hKMPcQAtPBEa0/BK6Xapdk9l+dq7ClqR6oQ==
X-Received: by 2002:a5d:9753:: with SMTP id c19mr17155179ioo.111.1606757630169; 
 Mon, 30 Nov 2020 09:33:50 -0800 (PST)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id q5sm7909850ilg.62.2020.11.30.09.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 09:33:48 -0800 (PST)
Received: (nullmailer pid 2679137 invoked by uid 1000);
 Mon, 30 Nov 2020 17:33:46 -0000
Date: Mon, 30 Nov 2020 10:33:46 -0700
From: Rob Herring <robh@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v10 5/6] dt-bindings: leds: Add bindings for MT6360 LED
Message-ID: <20201130173346.GA2678817@robh.at.kernel.org>
References: <1606447736-7944-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606447736-7944-6-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606447736-7944-6-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_123351_413979_8C51C3CB 
X-CRM114-Status: GOOD (  13.11  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, dmurphy@ti.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 cy_huang@richtek.com, benjamin.chao@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 matthias.bgg@gmail.com, Wilma.Wu@mediatek.com, linux-leds@vger.kernel.org,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 27 Nov 2020 11:28:55 +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings document for LED support on MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  .../devicetree/bindings/leds/leds-mt6360.yaml      | 164 +++++++++++++++++++++
>  1 file changed, 164 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/leds/leds-mt6360.yaml:57:2: [warning] wrong indentation: expected 2 but found 1 (indentation)

dtschema/dtc warnings/errors:


See https://patchwork.ozlabs.org/patch/1406971

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
