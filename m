Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0253C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 01:41:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B97F61A3E
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 01:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B97F61A3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6KV+DRkhzqTJkiz4yt5crHKfunb1gQZQEK2nPxKXqAk=; b=OZ5t37CE30yUo0dkeY7yJuuSf
	Hnb2nK352RGdx6SpIXJcv5tXq291eZ6IFGlDd+TMSJxWjWHQdzoy6rHpI7RhwApNDphuGpVtZb1oL
	BYh6NArfsH8qy2zLc4Kj34aNfDyWfmAs38NYMpgHgxCcPl/ApQtmfhsgnwggE1jJA28JllN5cw7lB
	QZGb5OzUTTY8lTStMZD5pyy5Z+WK3tYlYYVmKDkOgjIfv5P/00TCnFFSF8wPvADw8R0z5PFozrlUp
	MEUQbLhhxwqfLdT4isgFE+5NQ4iUiTQTaOYGFVit7BH4zytsc9zoz8q/t3bysvEBxNCGy2so20237
	xMoxd46TQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPbTI-002Uoh-QY; Fri, 26 Mar 2021 01:41:09 +0000
Received: from mail-io1-f50.google.com ([209.85.166.50])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPbTC-002UnG-5V; Fri, 26 Mar 2021 01:41:03 +0000
Received: by mail-io1-f50.google.com with SMTP id k8so3841621iop.12;
 Thu, 25 Mar 2021 18:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gMo2wYI5WIZFOKgvRIYEXEE0SHkOrndB8fO1GfnbYPs=;
 b=ln74dDkKeXXeV78l88i2xyafexS0AsrNTRLzgb1NJJBEuvZ9yD6kbXbKPaFWFlBGHZ
 qHocZDZVOO0eJQQMVB0jNGkPcDlCkSaHHoByfpFFcdpJ2gfWUjbP/a2mCWVqSexUIb+d
 Hk+j2TxU/nXbbmgxY3QZvcU9MplPbg8JMKrKN/We910mvbvvwNYEJdLodTOoI8Z+lMEV
 FnJTodtfyyXYDIGkcQrYcDsVXmD4tCK4dNj5AKQ+fGHmOrVXNXby6RqlsH5xQPxXYjy1
 NEP2RnBHRvPNHpguOLk2zb3QC8uw+74409+Ygvv1/tSMR+PVRrDnQs9C3izGP0BRHCzo
 fsxQ==
X-Gm-Message-State: AOAM530+n4I3ohIIQTPoClsW/24SuWnVNmPB7ufJgK6kaomefiw9hOOD
 4eHd/cFP4Mv2AhgdZuWUMA==
X-Google-Smtp-Source: ABdhPJz5FVZ++NTUJD7Wn6RDi6sP7fKXypp+u+gjUuZiO53JxQ/M0L3EFD4Zq355yqI1vZBjS3n/+Q==
X-Received: by 2002:a6b:4109:: with SMTP id n9mr8231738ioa.43.1616722861120;
 Thu, 25 Mar 2021 18:41:01 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id y15sm3359412ilv.70.2021.03.25.18.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 18:41:00 -0700 (PDT)
Received: (nullmailer pid 2145304 invoked by uid 1000);
 Fri, 26 Mar 2021 01:40:45 -0000
Date: Thu, 25 Mar 2021 19:40:45 -0600
From: Rob Herring <robh@kernel.org>
To: Seiya Wang <seiya.wang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, 
 Fabien Parent <fparent@baylibre.com>, linux-kernel@vger.kernel.org, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, 
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 linux-iio@vger.kernel.org, linux-serial@vger.kernel.org, 
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 Ulf Hansson <ulf.hansson@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Stanley Chu <stanley.chu@mediatek.com>, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-watchdog@vger.kernel.org, 
 Jonathan Cameron <jic23@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Vinod Koul <vkoul@kernel.org>, 
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Wenbin Mei <wenbin.mei@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: timer: Add compatible for Mediatek
 MT8195
Message-ID: <20210326014045.GB2144901@robh.at.kernel.org>
References: <20210319023427.16711-1-seiya.wang@mediatek.com>
 <20210319023427.16711-3-seiya.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210319023427.16711-3-seiya.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_014102_393381_2C27C745 
X-CRM114-Status: GOOD (  11.13  )
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

On Fri, 19 Mar 2021 10:34:20 +0800, Seiya Wang wrote:
> This commit adds dt-binding documentation of timer for Mediatek MT8195 SoC
> Platform.
> 
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
