Return-Path: <SRS0=VhZj=D4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50DE2C388F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 15:05:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBBAB20BED
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 15:05:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ks+KM9yZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBBAB20BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XWialYZipw/fFS62/YtfuZEFKz0R6Ekyip1HtVbTp4A=; b=Ks+KM9yZlFB+tO/aL06t1AL9a
	iFc9prXKL+cU0Z/TUw+O9YbDotCgqs9DpotknTKE0rcH8IVo8nMlkr9B+mhihVbdVG1Xjo28eMWO6
	zB9awHro7ITvHrom3wj4a0um0DSTJfQASFMcZepRADoCtKjvLLU14CI6Y0zroqWjZxleXhioxw5Yv
	htGdhyDPefloaNY3ralwqqiLgXXQAq1yxItJUsWpmP70nuW6ehpuj54RH4KKHj+kIf1Wm4e1EXc/A
	9NSDf33PgSFvzG6oq2UZj79vD7yz/3ATYr4UINB3z+dij1D3FgEiYzQ4CgOU2G00qJU8pcQCacnCS
	gOdqw9EAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVFgB-0002pm-6h; Wed, 21 Oct 2020 15:05:31 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVFg8-0002nq-RE; Wed, 21 Oct 2020 15:05:29 +0000
Received: by mail-ot1-f68.google.com with SMTP id n15so2084519otl.8;
 Wed, 21 Oct 2020 08:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=j5vXzbajSvk2jPGnq190MC//0hHF/9k+3Xwub4lFqOk=;
 b=ZW6/YS2dL1ukqk6FpQ+Uh6Bxk2g/dLkNCLBANS9rc9ObC2WAtTzVcAz9znzI4PxRrU
 k+Y4LKnFxT86EfBHtyUA64DT1O76nUXP8F06XB/nEcote38T79pOYnb29oiKGuP0MeG6
 PaFFQS6GRczt4BhgmrbP4ygWViYh0BI4rHuuWVYUqOQc05fozSrHvPwuO0ZbwJf+qv8U
 JCFHmOgHSBFe8+FfOhMpzuQTxNcHaR/+kmPIwhA3FQZ9P9MP5oztjt1tDETkyJZ3bHSi
 NK8BR3g8o4eL6MOa8PEZLsUWBrPobBym1qgwaQWz+/yopNaum0cFfTyitcDDL88vh273
 /c0w==
X-Gm-Message-State: AOAM5300PohEZL5GC0B+suAZbGY9L0BlPWNmZrbh3YMYtp1SkgWQfRhO
 balZAAK01jb2ecbYVFf8mg==
X-Google-Smtp-Source: ABdhPJyBdffq8YFayXKBVbcSTDZtsjX1dHiZVOnDChBLmQ2MNXBFO87aO+PpqoH5j4nTyRzv+goqMA==
X-Received: by 2002:a9d:7993:: with SMTP id h19mr2830613otm.289.1603292723983; 
 Wed, 21 Oct 2020 08:05:23 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u140sm727527oie.41.2020.10.21.08.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 08:05:23 -0700 (PDT)
Received: (nullmailer pid 2798579 invoked by uid 1000);
 Wed, 21 Oct 2020 15:05:22 -0000
Date: Wed, 21 Oct 2020 10:05:22 -0500
From: Rob Herring <robh@kernel.org>
To: Neal Liu <neal.liu@mediatek.com>
Subject: Re: [PATCH v8 1/2] dt-bindings: devapc: add bindings for mtk-devapc
Message-ID: <20201021150522.GA2798521@bogus>
References: <1602732039-12179-1-git-send-email-neal.liu@mediatek.com>
 <1602732039-12179-2-git-send-email-neal.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1602732039-12179-2-git-send-email-neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_110528_906505_43265A34 
X-CRM114-Status: GOOD (  11.27  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, wsd_upstream@mediatek.com,
 devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 15 Oct 2020 11:20:38 +0800, Neal Liu wrote:
> Add bindings for mtk-devapc.
> 
> Signed-off-by: Neal Liu <neal.liu@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/devapc.yaml   |   58 ++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
