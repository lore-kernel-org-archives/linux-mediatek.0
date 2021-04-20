Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F63C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 18:29:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4A4261077
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 18:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4A4261077
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yl551jf20YUylNBgly2Zy+3pvl9KTZfCHszGD3UC/qo=; b=K35wTveWP2lktMOKTD7da3oUn
	vvHV44IfLwpyKp75hOLcWaae5gzHqXvSeAvIoRxvh4mo5VDfPsrmtdDRGDs+4ok0rlkamgG+wwP4K
	q+qNloECr0TYwObZiNeG/w4UphILOx1BCvvT9l56r7ydIqBNkSMF9/E3baNmRt0oX9bwFw8Z+o+KN
	rPMKPhpjqnkvu663eVVtPjod7ts9f/UPxo91alKPK1nkf/k5XB2gYm8g5ur3fGiQwZZoqpFizG+1S
	DXjdJe7S4WooLYIuU0S6ec/Lo6mUfdodPTUhzH7AB2vPKCszOLjxQbX8vCnh4f/U/bBEeET4bTeob
	zFvCt6Nfg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYv7o-00Cpi6-CK; Tue, 20 Apr 2021 18:29:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYv7c-00CpZO-6X; Tue, 20 Apr 2021 18:29:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=D5MkXHWl0zc2TSHsinyPIxBJm93V7hB1LB+FDLNh37w=; b=MiKMLbh169RjEEdmQliaPxKTeW
 i6qDMtAR8V02q/yrW7cretvwnPggtBjTEbf8mhe1eqrbcKGpcNX0ghzIsISueLxc0QjXm1pWTrPvF
 6I01c2oxCn8IpagblwRIx3fb9IZQQSM7xvrBvIvu8P9jajoyn84BXg4JXZrBDq9Gox9olgbQBdCE4
 sWa/TWFO52WdFtuCoiWCMxXHlJMXszfmtnBk1iHrqLa3JiowvW9O0FAT4TBAKSsUP6+Fr7WMJDW06
 1Pmy1GU5ucbHmW71VRy2gm8GuXbNyVY4wn/NmpzVrxeuq/3fONfR5I2y+rIN1CSfQ0Pc8oslVgLq0
 1KVXeQSw==;
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYv7W-00CLTa-KX; Tue, 20 Apr 2021 18:29:14 +0000
Received: by mail-oi1-f177.google.com with SMTP id k18so34964500oik.1;
 Tue, 20 Apr 2021 11:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=D5MkXHWl0zc2TSHsinyPIxBJm93V7hB1LB+FDLNh37w=;
 b=dF0zGugMgjAJuMX/iqY3x2MRKDYmyayrgUOMpq9eIO8OwtPZHn2AYtZQ0GX3TvYST2
 3csWOpRrZ4wMDVXv0OUqQDezJo5FkCbnSKIzG8KOCDxUDnCvJGD8H7zhQY57BMK8vLcK
 qwa631xWwv4K9ugE/xKnSIOp+UUtmJ/EMUN3iY1rbpPMS7GG+mOlOyVSjzTOA6PHjfeh
 CNanV/2nFi7NKtJgFAgwi0ek06xDmkHpYGXj+rWjQhzApUIgiQwSOuiHmxBOqRS+JvoS
 dvBNlDmetBGABw2Wp10T8UY2H/LKLmw/170dT4Vvk71wtDST0F3w5M1yHIKSn4JwBllD
 aRlQ==
X-Gm-Message-State: AOAM532f7aELyPsb7EAMu6STqeMgbho/j0Y0pL4FnG956/6+IF5cLo5X
 /LppbJGXyykDpOJa2T9/fA==
X-Google-Smtp-Source: ABdhPJyWfQQTsfMzmr5Px8/cbjW5ZxSI3He90hBuTHgIf8csNl32Cm13WWv8w49Khb9CZtOOXpU5rQ==
X-Received: by 2002:a05:6808:b26:: with SMTP id
 t6mr3951139oij.74.1618943347884; 
 Tue, 20 Apr 2021 11:29:07 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q24sm3907334otg.81.2021.04.20.11.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 11:29:07 -0700 (PDT)
Received: (nullmailer pid 3595364 invoked by uid 1000);
 Tue, 20 Apr 2021 18:29:06 -0000
Date: Tue, 20 Apr 2021 13:29:06 -0500
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: devicetree@vger.kernel.org, Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-kappa
Message-ID: <20210420182906.GA3595334@robh.at.kernel.org>
References: <20210416164055.3223088-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416164055.3223088-1-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_112910_693571_C79C625C 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

On Sat, 17 Apr 2021 00:40:48 +0800, Hsin-Yi Wang wrote:
> Kappa is known as HP Chromebook 11a.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
