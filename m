Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3376DC433E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 17:22:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC54B25349
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 17:22:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ukkuvSkK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC54B25349
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rpt41PfnO+fQdKZpP4qFCgf1gza0nrvu2vQVBXdVC4U=; b=ukkuvSkKTyhZuzDafEIrwYJtT
	ExGni1cTWQHq0b0K4NVN6ZlRAqohRoEMkoF3F5yGYyrmkhcmPXoB7a5I0yIgsvmNfVwaKx1gcwDNF
	0GmavLTZlKvZs8SzmtjoOukZJhaLKDyf8KGtK2frkxmc4wEOrNroqGYy/Cz2yDVofcU/fFzvK9E26
	bl9B5wd2DXHePJ0ZvSbMmZMqiyPzXGi0cYPqcF1NAkB/wzrLWBxrJiXfPdKVFfE2zSoKtcweI+AwR
	65OvF8i5ZwWNgyekH22CQNeddgcVdwtVjc7J4oeHPfMoxcv35ISjJZfC+KVfYuQv3MTy61tuj3gPm
	pgWeb6Fqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSO0R-0002js-OQ; Tue, 13 Oct 2020 17:22:35 +0000
Received: from mail-oo1-f65.google.com ([209.85.161.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSO0O-0002ix-KF; Tue, 13 Oct 2020 17:22:33 +0000
Received: by mail-oo1-f65.google.com with SMTP id w25so62482oos.10;
 Tue, 13 Oct 2020 10:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VFYdK5eEI2q6HITSkcwdVxz4dDBhdqzWyeihWrwEJQY=;
 b=C/tq2Xn3TwiqgKelL00UpUtGpyKfk71d759zevc5cUfaURjuZkDP112qSYEkiRqSUh
 eP9b/i8E0nFZOC/aMs5FtQZ3baZHUl3QHZ7CFOTLbL6QsE7TwlqZ27r90/Bq12RRX0Ia
 A8SHsripDvXCbawlsH/NSHxRzOQxjOx46F5ejrn+5lLy40Qi8w9DS60KaM7kGy6Am6UN
 yTrmjNt3+z+icSrpcjecm8gUoUIZCfDq7q5Q8MvKFDzEXlBkeuZClK0sLs+5HcRcPY2K
 zBz3txSaYERbUXf5c6bW9JkOd4RNceNfvYhMwRPzJhttIiSeZRPT4wpFUnf0Xu12wBMS
 SYBg==
X-Gm-Message-State: AOAM530HNFQTP/5RTUuwkhTSLrBtJz5oS++6NYkEkL4YJlUIZcU/AwKu
 +aouBvFfuirhEICW2dQ/cQ==
X-Google-Smtp-Source: ABdhPJzsC/0Ak+zrtd70+RUds9C+1E9Lw/c+pMqT2nbpeqfiPZ/7HAznFBx2dTS3zyPXvelxW8tNZA==
X-Received: by 2002:a05:6820:30e:: with SMTP id
 l14mr297849ooe.57.1602609751366; 
 Tue, 13 Oct 2020 10:22:31 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y51sm131571otb.47.2020.10.13.10.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 10:22:30 -0700 (PDT)
Received: (nullmailer pid 3726622 invoked by uid 1000);
 Tue, 13 Oct 2020 17:22:30 -0000
Date: Tue, 13 Oct 2020 12:22:30 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: auxadc: add doc for MT8516 SoC
Message-ID: <20201013172230.GA3726592@bogus>
References: <20201012205218.3010868-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201012205218.3010868-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_132232_668255_FE13E2B2 
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
Cc: devicetree@vger.kernel.org, lars@metafoo.de, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, jic23@kernel.org, pmeerw@pmeerw.net,
 knaack.h@gmx.de, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 12 Oct 2020 22:52:17 +0200, Fabien Parent wrote:
> Add documentation for the auxadc binding for MT8516 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
