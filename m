Return-Path: <SRS0=UXZI=AU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E0CC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 20:04:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D7DB207DD
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 20:04:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vsvm/kkO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D7DB207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i/4OW67qY3to/s03XhUukWQQPd6+lf6PT6OlIVTPdRo=; b=vsvm/kkOyC+mV9YUzHy3wSJXQ
	EDsZRX5Dd4BuODfwaB8GeB1ZPoPXZ63uF8rHI7Sw5wDAjeQo2T/sokVPUBBu34xgYEAIgokxxLH0V
	kBLZGxqG7zfbHNbwcgXv/iyQZSJnqVdEM43SLsSeJ6wFKzvZbkUIbiNAyUQk56qjcC1vDDxX6LnSy
	TRW4B4YFL1Q+IpMX1sIEO/uqH172CHwGg+cebHNMeXmurW4YDgORWWM8CdSFwRwDF0xjl+hdqTRme
	ewbreOBF6jkW071r3EdvwUxlExwS+VawLEczdQPdHFakLcd3QXkYHS+AWMbxyYu9YbS+Plx9Hs+oU
	DPgawYkrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtcmF-0003EQ-Gl; Thu, 09 Jul 2020 20:04:15 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtcmD-0003Dj-UB; Thu, 09 Jul 2020 20:04:14 +0000
Received: by mail-io1-f65.google.com with SMTP id y2so3668156ioy.3;
 Thu, 09 Jul 2020 13:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ws0i2CrqY6pD3P73//8FyL2EApZ5BXXOhJZ2Q0taym4=;
 b=IFotm0zR7uh8QsBrvqDTAwRMeMLwQ+e+5HnUml9RKY+QH3rhLft7vUTLm9uWZ5ablI
 Yyu6Heu1ddWXnn/l2+mqbAiDEsBYwLZB5ZxbqZ5NcjYOw+FGLTfQiIfTEAVedSDteQcm
 lxmwoQUU4ULOZc8IKgT0rLIpxWqz4pURy2ST6/uZ+Ou62ST41+EJvBKaA3LLYbIOolDK
 GGcd5+t0Z17a1UsGqLd2TMGe2kXTglHnAhJD+D8OR5epkyS8CIA60h4dLHJRmWx8GU/a
 GMT6596tWPsLfmAdNU+u+Kp/dEq5weEf4tJNC7PhPaLHWVHTBiMKMyh74j9IJrxLnUx/
 /2mQ==
X-Gm-Message-State: AOAM530+k4O5On1A6gzwSWBf3Q+IRv92piBR3kUGoe3m0dHAqOAzfvda
 dIT2T5VxamNlmopaUzq80Q==
X-Google-Smtp-Source: ABdhPJy5U3mHVxmJOTUHKoiDc1k/A6c2wX0Pp1z/J6O2LJznpvgIyHxe7LJcVtvRNHWYjrLa6wChdA==
X-Received: by 2002:a6b:6c09:: with SMTP id a9mr43481210ioh.178.1594325053494; 
 Thu, 09 Jul 2020 13:04:13 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id z20sm2649443iot.15.2020.07.09.13.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 13:04:12 -0700 (PDT)
Received: (nullmailer pid 801025 invoked by uid 1000);
 Thu, 09 Jul 2020 20:04:11 -0000
Date: Thu, 9 Jul 2020 14:04:11 -0600
From: Rob Herring <robh@kernel.org>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [PATCH V12 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20200709200411.GA800946@bogus>
References: <20200702115223.21507-1-dongchun.zhu@mediatek.com>
 <20200702115223.21507-2-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200702115223.21507-2-dongchun.zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_160413_997439_406D8245 
X-CRM114-Status: UNSURE (   7.69  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
 srv_heupstream@mediatek.com, linus.walleij@linaro.org, drinkcat@chromium.org,
 shengnan.wang@mediatek.com, tfiga@chromium.org, bgolaszewski@baylibre.com,
 sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 louis.kuo@mediatek.com, matthias.bgg@gmail.com, bingbu.cao@intel.com,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 02 Jul 2020 19:52:22 +0800, Dongchun Zhu wrote:
> Add DT bindings documentation for OmniVision OV02A10 image sensor.
> 
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../bindings/media/i2c/ovti,ov02a10.yaml           | 172 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 179 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
