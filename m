Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E69CC4363A
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 13:53:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE4BB2071A
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 13:53:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RtOWAclG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE4BB2071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jpx7pP8xZKAtxjRh57CXz7pbkff3sFlJZ6MySlA4iJ8=; b=RtOWAclGfkUJlmWb44ojvumiO
	jSuz+A8uLNorzDIug25wmDI3k6183+CHF86nAeLXpgrQbi6YLMDp9XxKomJz0wFNT5YNr91ZjyfCi
	eKf2nhrTdIIOJVG/vv6TeRBTEEMpIg3yQet2M3CiMrbWKZUedCMIooySfZMg36HQOSwpbiVpjJEfz
	8c/hachUinqh9qCPX1mlkWQYau+1UshgQhiamW57sCvCxUtG/SPg1lpjN8ehakaVr/PHYcS7aZyDr
	fx4BCAa+LcPTXcEfRDozYiGV8mZoBnqCWAWwrVasK/1vpsHJQQOxDsu0luRDiBEj8Fk7MomqO6Btg
	znhZeMPFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYUq6-0002vO-Go; Fri, 30 Oct 2020 13:53:10 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYUq4-0002uY-5X; Fri, 30 Oct 2020 13:53:09 +0000
Received: by mail-ot1-f68.google.com with SMTP id a6so5574754otp.10;
 Fri, 30 Oct 2020 06:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ggiAUaruNw1YhH2l2hRk36w59nO1Oq/R58cjSZ0WsS0=;
 b=IfzLrP3LWbnkjzHvr49Q1th8vqtX7YH8/pvKXBOmAmgSlXqsxVIpxvuAfCwE+KWULr
 QQwOvq/WXJIPFlNH/Lj9eSXEkPb8XLuj7b3s1JPQROf1x9NsxoOdYWPviQ7oULVL6w0t
 xEjZWbyOxyvLrkr1s+lrLSMoPR7Lkb0i9a0fy98B6/z4RSHn8hs3DBYs+jaJekbgdcwp
 FxYEMRgs11obZBoGQZwEmo6YB+kPQ7e28oA5usvn6fm0U45o37ALOtxPO8zTeygpXSJB
 kU3qRXguT/Ot6owbt1s7gCEytjTH+EIYTXUgFVEgQa56JV/KCOMZm3kT58PB2oiMp/XL
 H/4g==
X-Gm-Message-State: AOAM533iAMsRexxm9T1MlOuuy3BDTgPv8Tw/fzrNnLzJDE02KNrXBkHa
 tRzTqGCvoRkKs16+P8oPoSTMZi+Ryg==
X-Google-Smtp-Source: ABdhPJxq/KhYrqN/T8NyxVmXEavGpBaGULf6IaWMFkIEntoJ3gOZgHkdXrgULkZisLkAOY1u63cuMg==
X-Received: by 2002:a9d:75d6:: with SMTP id c22mr1672627otl.213.1604065987144; 
 Fri, 30 Oct 2020 06:53:07 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j184sm1386766oih.8.2020.10.30.06.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 06:53:06 -0700 (PDT)
Received: (nullmailer pid 3747758 invoked by uid 1000);
 Fri, 30 Oct 2020 13:53:05 -0000
Date: Fri, 30 Oct 2020 08:53:05 -0500
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: memory: mediatek: Convert SMI to DT
 schema
Message-ID: <20201030135305.GA3746616@bogus>
References: <20201030091254.26382-1-yong.wu@mediatek.com>
 <20201030091254.26382-2-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201030091254.26382-2-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_095308_262888_A6C1907E 
X-CRM114-Status: GOOD (  12.93  )
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
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Tomasz Figa <tfiga@google.com>, devicetree@vger.kernel.org,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Fabien Parent <fparent@baylibre.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 30 Oct 2020 17:12:52 +0800, Yong Wu wrote:
> Convert MediaTek SMI to DT schema.
> 
> CC: Fabien Parent <fparent@baylibre.com>
> CC: Ming-Fan Chen <ming-fan.chen@mediatek.com>
> CC: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  .../mediatek,smi-common.txt                   |  50 -------
>  .../mediatek,smi-common.yaml                  | 140 ++++++++++++++++++
>  .../memory-controllers/mediatek,smi-larb.txt  |  50 -------
>  .../memory-controllers/mediatek,smi-larb.yaml | 129 ++++++++++++++++
>  4 files changed, 269 insertions(+), 100 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml:84:8: [warning] wrong indentation: expected 6 but found 7 (indentation)
./Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml:98:13: [warning] wrong indentation: expected 10 but found 12 (indentation)
./Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml:41:8: [warning] wrong indentation: expected 6 but found 7 (indentation)

dtschema/dtc warnings/errors:


See https://patchwork.ozlabs.org/patch/1390887

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
