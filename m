Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D52C64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 12:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Brecf3gTYVIGkh6Vg/ZrSy4fTcyL7LGy5CNuUxEbMY=; b=gl/R/f9gvVfFiWKB/vli47FdlS
	eaSd5K7HWlgm+w7GkIZOrFmh+j+EuuEEiKIiJkz0nJan4nUBerXsTPkkkPRKs4tqsMLJ+k7rm1ap/
	tzud3g2TAhwWwBgMTym899xCQUE5G0qyzZP2TZohFOPK2eeXut8ZjQvjIsmbcl/yMQqS83pqcxq84
	mtJJSU/QH8tJglYzeLCV7eG9n+tZS4nuVE/I09TJfTvjrFHQoX/SmY2q1vWB65lxgp/A9a1t0cMyV
	p1Z+FZV9ON6/t8AxRbendM4nCmM/TaCLqHv8ZAVYJuFrzHcaMqRdUBnz2POJiv1xx8TugxLAFA//l
	rDsJEjwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paFX3-009tps-GJ; Thu, 09 Mar 2023 12:38:05 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paFWs-009tlB-5r; Thu, 09 Mar 2023 12:37:55 +0000
Received: by mail-wm1-x32a.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso3510186wmb.0;
        Thu, 09 Mar 2023 04:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678365470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Brecf3gTYVIGkh6Vg/ZrSy4fTcyL7LGy5CNuUxEbMY=;
        b=WFH43aWuAcfWvR7AbnsKHlunddYyHWanGNqukKJo3kCwmXlSpGw5huJoVS4aQMMBSK
         O1TJFj3ppdJL4xU0vncuCPluO4qFqKrfpqgoYiQzOKiZwPbxS4twYJO6TtWsu6BkexfD
         axhtX3UU+LjyopE6v7IjZN5HygXJxsXn1t6VDHaPrTwT55y7TXSQH8CCOV+R9898awTS
         uRro90lHSyg9r0zYjVSVgTSZQTRTAkzIaB3uTj93y8jhtjgei+d/SgMBK1Mov885YsPu
         3f/IZCZEz1eYxGg1ykFmuQ6EKnIkkGjWuNg8Psd9faoA+3QeRlz5b/l/DOfes6gWGjgY
         8nLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678365470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Brecf3gTYVIGkh6Vg/ZrSy4fTcyL7LGy5CNuUxEbMY=;
        b=WkepDYMPqlfQ4XaP73ogIC1y1M4wkKcOE+fV+cPoEKTjIPr/8aSoTIzq2oS12Gir8+
         Wrwspwc4ifWt1JPw1qg66hAD9pVK4ojCtAAlBWD7oFPXE2iAPO8VtEu87qrWi+Yd2TOP
         Z/huOzK76Bgw8yntAnZll/BLMoQZUmG7UltylE6e98Dt6u20+QRKWVBLrmtsJlxhqFOY
         jtXut7VpMaULOmIcdg1eNiWJZ1+DUg3Yg6zV1TwqhPCHcHsGExxGEXU6bQ86rAfk0nUm
         Oo/1DTteDP3ygnWDTPsHnSfKES4HBZIJXahfQETKfMnVUvzTvM5jhLQ5X2Ivd+79f3XA
         Y07A==
X-Gm-Message-State: AO0yUKWZXqoDu1aFQE/6yeTLiZn9Eig0vcLvu5V1mTHrwXtpBc2ifCR+
	CBk4MumbavnAioTJYxkjtYA=
X-Google-Smtp-Source: AK7set8NuLLf3gUjtL31iDhK+a+vkBokvjRYPtxUk4Gb8Fzx6wRvPgpR8tkyNxjgL9KSx+TamE6Crw==
X-Received: by 2002:a05:600c:444a:b0:3e0:6c4:6a38 with SMTP id v10-20020a05600c444a00b003e006c46a38mr11247542wmn.33.1678365469515;
        Thu, 09 Mar 2023 04:37:49 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u16-20020a5d5150000000b002c559843748sm17909147wrt.10.2023.03.09.04.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 04:37:48 -0800 (PST)
Date: Thu, 9 Mar 2023 15:37:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: bchihi@baylibre.com, daniel.lezcano@linaro.org, rafael@kernel.org,
	amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org, ye.xingchen@zte.com.cn,
	p.zabel@pengutronix.de, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	khilman@baylibre.com, james.lo@mediatek.com,
	rex-bc.chen@mediatek.com
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: fix memcpy's
 number of bytes in lvts_calibration_init()
Message-ID: <58a1a694-8a9a-438b-a5cf-9299e7914973@kili.mountain>
References: <20230126161048.94089-1-bchihi@baylibre.com>
 <20230307134245.83599-1-bchihi@baylibre.com>
 <1af76fd0-ea27-da60-cd22-8a65a8ef369e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1af76fd0-ea27-da60-cd22-8a65a8ef369e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_043754_240410_E89DFA59 
X-CRM114-Status: GOOD (  11.70  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 08, 2023 at 10:10:34AM +0100, AngeloGioacchino Del Regno wrote:
> Il 07/03/23 14:42, bchihi@baylibre.com ha scritto:
> > From: Balsam CHIHI <bchihi@baylibre.com>
> > 
> > Replace memcpy 2 bytes by sizeof(int) bytes of LVTS calibration data.
> 
> sizeof(int) is architecture dependant...
> 

On Linux sizeof(int) is always 4.

I'm just so confused what you are talking about.  Are you thinking about
sizeof(long)?  Are you thinking about CPUs from the 1970s?  Linux wasn't
invented until the 90s so the old CPUs were already in museums at that
point.

> please use a fixed size type instead.

This is an unusual style opinion that I have not heard before.
Hopefully, you just got ints and longs confused so we can move on
without discussing it too much.  We're copying an int so sizeof(int) is
obviously correct.  It's hard to know how to respond.

> Also, shouldn't this be u16?!

What? Why would you think that?

regards,
dan carpenter


