Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD19C433C1
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 01:45:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E15B661A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 01:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E15B661A02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gSoU0lBGBHpJu5aYjpwoJH3pqm9RENOKkdPXJKUl0s4=; b=Vnnkalq8RmOk1REM3VPTOz/fq
	aXHTUR5xDAqkheJzqaUtRyFAw4z1gvn4kwdFD9hGggmDV63gF6ljEL9BiV+phB5eyhoupxoKaRz6j
	m38QCGeLLqpT3lNxB+7U+35B318hxxJ0zMvPYAoTFEqLPp3uMU8wJSzFWiA0Li8GQeG8QcH8L2SaP
	plWhoxCffchmEdbLiOA24M3jlv8ToVKTCtZEE60O9siOm47ea9bVHka+rw2gsPaokr/hQW46i4VWJ
	uCJcyDjmHzE0enA+pm9/LMiaVF90p0HRfWasxfzWN8Jc0IQ7KL6AdS71JgdI4xEoUMz9QToEl69N3
	TFk/odcfA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPbXF-002VLA-FU; Fri, 26 Mar 2021 01:45:13 +0000
Received: from mail-il1-f178.google.com ([209.85.166.178])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPbX7-002VKL-Lk; Fri, 26 Mar 2021 01:45:08 +0000
Received: by mail-il1-f178.google.com with SMTP id 19so3820296ilj.2;
 Thu, 25 Mar 2021 18:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PZsXaMzEzAOeuTtz20TFhfalE//5yBaTZxTM2icf+t8=;
 b=SNUphFkY+pJgmFiub6xGOA6EG+x62bzEHVQJc+FJJ8R5BkKxk8X9xP57BObivj3C+n
 QNAbJunP55URME74mCkNJkk8N20V8DhkeCQY0Q/b/6hS/h8q+AE+eRmEj2nky4JrCfUj
 lC0at5jmIb2+fnftHQVRT2v8piBXb5iCrX2C556ln0IezQXCnTfrg2bA2XL9tW5jwu1W
 huKCo7l4OS23ZcHfHREpGhEGp9FaqDQ/kmhnoMP5o4jy4Rx8i2wjcPDkyvlbcFYxD5YB
 zWQvcnNuEzC3HbeOsVzcmTOnKx3Ug6CjdcwSDEjD/blJ3Fx25SateSrBneqHgQExnueb
 ZXUQ==
X-Gm-Message-State: AOAM5315PkJlnCyS2U9NNP5D3n+OKWpp6l+9Msac7H5/Y16M4WGpiP+U
 ItyIB0V2z/yO1u7b+xSUFqO9teMVXA==
X-Google-Smtp-Source: ABdhPJw2gR2TyVZd11y9iO8iab1634RMShjveSM1GjxFM4JuqXPhKrf2/Z0VPxLDBB7qy4BaghmQ0A==
X-Received: by 2002:a92:ca4b:: with SMTP id q11mr8989243ilo.272.1616723104674; 
 Thu, 25 Mar 2021 18:45:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id q8sm3443978ilv.55.2021.03.25.18.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 18:45:03 -0700 (PDT)
Received: (nullmailer pid 2151969 invoked by uid 1000);
 Fri, 26 Mar 2021 01:44:59 -0000
Date: Thu, 25 Mar 2021 19:44:59 -0600
From: Rob Herring <robh@kernel.org>
To: Seiya Wang <seiya.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-serial@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Fabien Parent <fparent@baylibre.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Sean Wang <sean.wang@mediatek.com>, Chaotian Jing <chaotian.jing@mediatek.com>,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 linux-iio@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 linux-watchdog@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, 
 linux-arm-kernel@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Vinod Koul <vkoul@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, Stanley Chu <stanley.chu@mediatek.com>,
 linux-kernel@vger.kernel.org, Wenbin Mei <wenbin.mei@mediatek.com>, 
 devicetree@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 5/8] dt-bindings: iio: adc: Add compatible for
 Mediatek MT8195
Message-ID: <20210326014459.GA2146095@robh.at.kernel.org>
References: <20210319023427.16711-1-seiya.wang@mediatek.com>
 <20210319023427.16711-7-seiya.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210319023427.16711-7-seiya.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_014506_818294_577733DA 
X-CRM114-Status: GOOD (  11.05  )
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

On Fri, 19 Mar 2021 10:34:24 +0800, Seiya Wang wrote:
> This commit adds dt-binding documentation of auxadc for Mediatek MT8195 SoC
> Platform.
> 
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
