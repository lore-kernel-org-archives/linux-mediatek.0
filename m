Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C6BC433C1
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 01:41:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89DC461A3E
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 01:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89DC461A3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r3Liqfm02iSof/TvvSRih2ulMAHEREpMUcYa3iWKxT4=; b=AghDhtWrGN/oYbEGzpIVIEz41
	kFbW6i4Tzooq5BhYgx7+4c1nZW/g9N2Aw5El/PAupy5JXSJ4ZS78s4s1E68Tk6lo25Vg1sxWavwHW
	OCZPBXb7GC81SLhvqrOIzMOpmg2vB595Ro/AFRlJJYZGScZl2OGZ+kRN+7V5ACVIuJomOtFmAppQa
	Wpnr+YYHl5esCCVHK8WnN1LrnOtnI0u6wmkAN8ci7gIepmfPRIVga2x3RTjh/K77TWrANMotZRgIR
	l6aLKYe0wVEfAbkQ/fUP30LvnyloyPlF77QdI7u8Gh0amKLZ/GtDM0bep5LnxLwrB4CvBPeuUapjO
	O6gOQkISg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPbSx-002UlA-Ta; Fri, 26 Mar 2021 01:40:48 +0000
Received: from mail-io1-f52.google.com ([209.85.166.52])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPbSt-002Uk9-Sb; Fri, 26 Mar 2021 01:40:45 +0000
Received: by mail-io1-f52.google.com with SMTP id k25so3873770iob.6;
 Thu, 25 Mar 2021 18:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/nZtzn3g/vwJOpDb+ADfWdP64r2tBwJPkLaskVNDJhA=;
 b=fZrCTNuAFhZAkKbNOhB430G8NYanP5TOV922qgh9RNh/Lt1XMbFyIs9MMq21y6kpKW
 NZZAt0kSkYClVJzqBtIYpDuYx0B9/NVPYUnrvjDoZuCIeV+7x8aaDXq0r1Bu0lZ+Z/wx
 cCDYjhK3/XY1R39oLwPd5leIupbkPko22qXYRt+Cvo19qDBVL2qkc8GqHbfXWXQkMcjj
 KE7gnDoZyHiMilEwmAFZb11XeHiwXDvgZMpi/MsQy2gYjbJTpdbCOrK/DQxA4OKcELbv
 tt1Olu1WWnbDLvw87rgr1J2LDJXu6LoRvnHMK0tv3UISuMxyGbp6nlOEPVLxATHoVUjQ
 nmxA==
X-Gm-Message-State: AOAM531jF4/vKEYqbh38b9nC+TKU1gypnQtDAK+/hoRqHz9ibZtSUf/x
 i5mG6vU62/cyEt54k+yfxw==
X-Google-Smtp-Source: ABdhPJxT6+UsV+NLqh2ul/vKOfBtJQth8BzvthJhxtpfpmhgBPfXNzJsAHGTteI+WblAGq7BNiJNcQ==
X-Received: by 2002:a5d:818c:: with SMTP id u12mr8546949ion.81.1616722841515; 
 Thu, 25 Mar 2021 18:40:41 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id h2sm3394649ioj.30.2021.03.25.18.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 18:40:40 -0700 (PDT)
Received: (nullmailer pid 2145084 invoked by uid 1000);
 Fri, 26 Mar 2021 01:40:37 -0000
Date: Thu, 25 Mar 2021 19:40:37 -0600
From: Rob Herring <robh@kernel.org>
To: Seiya Wang <seiya.wang@mediatek.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 linux-watchdog@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 Thomas Gleixner <tglx@linutronix.de>, Wenbin Mei <wenbin.mei@mediatek.com>, 
 Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-iio@vger.kernel.org, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Cameron <jic23@kernel.org>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-kernel@vger.kernel.org, Stanley Chu <stanley.chu@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Vinod Koul <vkoul@kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 linux-serial@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: watchdog: Add compatible for
 Mediatek MT8195
Message-ID: <20210326014037.GA2144901@robh.at.kernel.org>
References: <20210319023427.16711-1-seiya.wang@mediatek.com>
 <20210319023427.16711-5-seiya.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210319023427.16711-5-seiya.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_014044_074861_074747B1 
X-CRM114-Status: GOOD (  11.24  )
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

On Fri, 19 Mar 2021 10:34:22 +0800, Seiya Wang wrote:
> This commit adds dt-binding documentation of watchdog for Mediatek MT8195 SoC
> Platform.
> 
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
