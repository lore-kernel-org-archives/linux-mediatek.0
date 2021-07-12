Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04704C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 20:54:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBE1E60C3D
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 20:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBE1E60C3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RWsz0qOjAAU8XCRe4jf4vIBXoPlTSezVpxcB2q37oy4=; b=JJpxTiIx9+3+Pb
	3IYsSZOTwISVfc6y95LxZFcLhjJJAJTxFjPmR9rXPxdd1C+K1fqkiXHeGQeENGRaRmYG6xh8ONRMK
	byM1Bao22mUps8YF/eMbVoJ3A01G2AkLDvJtKaZzwd6UTwjspLXlm9M865FXt5/nke3ECRX3o1rn1
	objK1FLUOauW1J/5A9ymbJwlIeddBe1EoTzOGeu8g79VNWFdTkuyTD2naoneaey54N3APU1J8meyV
	LPXXV8opU0oW0N7rg1V4OP5fhIjIsNGILA1IAOExKq+4Dxzsw7DRm6fmw2PL7UN7zB8vuUjLLC8d1
	YHps7K1EP4UN/Z+os+hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m32wD-008S4M-Vw; Mon, 12 Jul 2021 20:54:02 +0000
Received: from mail-io1-f53.google.com ([209.85.166.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m32w1-008S2j-93; Mon, 12 Jul 2021 20:53:50 +0000
Received: by mail-io1-f53.google.com with SMTP id d9so24357584ioo.2;
 Mon, 12 Jul 2021 13:53:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eOVn4hA3XcLo5hvPVvRyEd7iIojIzdMm8LtEmlSR/84=;
 b=EsDO5qMEK5ZdPMQo5fJJvVq/oG0szekEthoMW953eEHBqr/qt+EWgUdXZbGwNUkHJU
 52X4geJbPgEgJejrObrzivac6oHeSXro++HmDu1YM0nFPLiZY74bOW5HWt2YJLYLDcyN
 WU3zFcin93xvmOs4cK4jiFU62ZVetruj8Fns8uVxZWPTdPqFxYtLfZ+0WufDDZHWDU72
 5HRVNfUxJvv0/QMDkPyIIIuZmwyX5xr9RpTYZWcTgYB/AOFLYtXkGzESAgS6oC/6QUEK
 Y+tZkkrpFcI2ztxwHHck9JzyurGKE42EKpJ7KV9yIR8fpkixFYlC3FxxRif2CU077s7g
 7eEg==
X-Gm-Message-State: AOAM530Il31rXR6cQfZ93tur/SoJwU+NNcSnh9vdq613ljrLrj5167RB
 qI2Ccek3KADMpHawRoyGyg==
X-Google-Smtp-Source: ABdhPJwqUa1CfxBrMOnwHB9uXjwz2JDz1H24g3dCOBUO4TodIeDiOydJJgS7BjTQhNPzdcVFfMPYgg==
X-Received: by 2002:a02:380c:: with SMTP id b12mr786194jaa.68.1626123224639;
 Mon, 12 Jul 2021 13:53:44 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id g1sm8309471ile.35.2021.07.12.13.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 13:53:43 -0700 (PDT)
Received: (nullmailer pid 2473956 invoked by uid 1000);
 Mon, 12 Jul 2021 20:53:42 -0000
Date: Mon, 12 Jul 2021 14:53:42 -0600
From: Rob Herring <robh@kernel.org>
To: kewei.xu@mediatek.com
Cc: wsa@the-dreams.de, bbrezillon@kernel.org, matthias.bgg@gmail.com,
 mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 leilk.liu@mediatek.com, qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 xinping.qian@mediatek.com, ot_daolong.zhu@mediatek.com
Subject: Re: [PATCH V3 2/3] dt-bindings: i2c: add attribute
 default-timing-adjust
Message-ID: <20210712205342.GA2469648@robh.at.kernel.org>
References: <1624271985-23591-1-git-send-email-kewei.xu@mediatek.com>
 <1624271985-23591-3-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1624271985-23591-3-git-send-email-kewei.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_135349_366067_59355887 
X-CRM114-Status: GOOD (  17.51  )
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

On Mon, Jun 21, 2021 at 06:39:44PM +0800, kewei.xu@mediatek.com wrote:
> From: Kewei Xu <kewei.xu@mediatek.com>
> 
> Add attribute default-timing-adjust for DT-binding document.
> 
> Fixes: be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust support")

You want to fix a kernel change with a DT change? That's not a 
compatible change (and I guess neither was the kernel change). Sounds 
like the above commit should be reverted and rethink how to add a new 
feature...

> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> index 7c4915bc..7b80a11 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> @@ -33,6 +33,8 @@ Optional properties:
>    - mediatek,have-pmic: platform can control i2c form special pmic side.
>      Only mt6589 and mt8135 support this feature.
>    - mediatek,use-push-pull: IO config use push-pull mode.
> +  - mediatek,default-timing-adjust: use default timing calculation, no timing
> +    adjustment.
>  
>  Example:
>  
> -- 
> 1.9.1
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
