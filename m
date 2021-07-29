Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE93C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 23:00:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D133760F4A
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 23:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D133760F4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bMHUo+X+q9uL+riz6olIQDFrv6fqaEwHQHD7LfcaPu4=; b=xFzZ6b1fhP/tCe
	e8V1hb93Xt8qcEOUOLqkILC7MOITYzXjoZU0wPNxcp9P0+I/BkoTdcMeG0nCrV9EhYwziyx/Z6eLO
	p/SMADOKPdeZODSyw9k3GShfDxsW9R4kZWktHn5NCLOvLFfGLMaqYk86Emh9gz4BH2l1kU6PzRsKt
	TIKs3vkVu+LVskoGNpWfWpqhgzQjVOIOtUFnNunIBdbxAId1Hmog2fPzjPe55Y2unWlruJiZn3uCH
	IS3DDFVkUVdILaAGdWev0V2LBQv8CYYRyLi3YsQibE7qNN+dB1OogqqirviUxc1jdsITB/7Vpl+Aw
	nb8jM3+kPW6NT+EiIumQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9F11-006LdP-7j; Thu, 29 Jul 2021 23:00:35 +0000
Received: from mail-io1-f49.google.com ([209.85.166.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Eub-006J3B-BM; Thu, 29 Jul 2021 22:53:58 +0000
Received: by mail-io1-f49.google.com with SMTP id m13so9132443iol.7;
 Thu, 29 Jul 2021 15:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GzKTEl+aI5e4Vr90e7NxH6ppG4Jl145GBZiGyVIci40=;
 b=DuZ4gDQ2ph57obndSd5i7FjVosqMs1i2cMa6+TKHKPO4NPsEihVEiRBO5Fn1Ia+ZXP
 WqUAZeVSwoPASzT2KPRDfKSZJ1/0P3jNjoW2ttvQ2RpUgCdD9jGfg+bhUN0B6kjJtsxn
 4/3OfbSDYuBQoRolIt1zJNXztlVYi4qIK4gx45VOVAlplcE0joWvimfAYMYnFjwNhLTs
 orhBMrgSIMSODwUV8hcZjqsjhOZhKHZyLYVxmvHFlBJuLFyeA+qXPhAW57zJi4OBhUEy
 tKC54G/Rbb9ScEQdQGorHwZo1IguLMnxFVdEfUX31QmD91j/YDlvfq5at5V9lIDpCraG
 hwbg==
X-Gm-Message-State: AOAM5302iMl6Q0PTdGzAnWfmzirQLYyvjDocMRWbphjBeNdVDZKDU16I
 M5YiojnWQNTVzWb/NssKEQ==
X-Google-Smtp-Source: ABdhPJzhnT9o0KLHaaYhPruzpf12C4zNGzZkdtuvfbTedRgXSgZ4Vk/8rud1Rrd5UFQNmEltOmu1vw==
X-Received: by 2002:a02:a999:: with SMTP id q25mr6518689jam.16.1627599236588; 
 Thu, 29 Jul 2021 15:53:56 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id l9sm2408722ilv.31.2021.07.29.15.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 15:53:56 -0700 (PDT)
Received: (nullmailer pid 1057877 invoked by uid 1000);
 Thu, 29 Jul 2021 22:53:53 -0000
Date: Thu, 29 Jul 2021 16:53:53 -0600
From: Rob Herring <robh@kernel.org>
To: Sam Shih <sam.shih@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-kernel@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
 Sean Wang <sean.wang@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, Matt Mackall <mpm@selenic.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
 John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>,
 Seiya Wang <seiya.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 10/12] dt-bindings: watchdog: Add compatible for Mediatek
 MT7986
Message-ID: <YQMxgbD4j+SrXaSQ@robh.at.kernel.org>
References: <20210726071439.14248-1-sam.shih@mediatek.com>
 <20210726071439.14248-11-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210726071439.14248-11-sam.shih@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_155357_490415_EC0441C2 
X-CRM114-Status: GOOD (  10.87  )
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

On Mon, 26 Jul 2021 15:14:37 +0800, Sam Shih wrote:
> This commit adds dt-binding documentation of watchdog for Mediatek MT7986
> SoC Platform.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
