Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C25FC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 04:55:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8CDB611CB
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 04:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8CDB611CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Cubq8c9e2VSKbBnyGEw9NXS+u7Vd+LmA77NVmzLHvto=; b=qLtWKLMJn3rNu5jJVdle3kk+v
	vtofKR6gn6K8AGMSufQzrsfyGPxIXTB6bitdhX+KeKm03VzRP/fhSKXjFZFCp4hLXbTC2dhu5Gv9k
	K9Fl+9A3Oez8KNxBsYTx3x/HsgCzs/qBISQ9pxPjPh0IfysgOBq5oU83p94hjKLM5Sm6czdXoNAxr
	8k9KukcfJMYKoClaZrkgHJWO8Dx/2iIs7ZrSutHVzi/7ny1MOdgK21uK0aCQzL1gniR5MXG72ySPr
	naiJesG+N4rpA+lQmcA/NAduEosJwOMOqTloA/wEFKt+QJhbf0f1vym4+acLhc55AX0pptzu5HJ9s
	cxOeNTIwA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leW1N-003C4D-Rf; Thu, 06 May 2021 04:54:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leVyr-003BtG-Ip; Thu, 06 May 2021 04:51:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=BkR8EzMQJSRdUTCzoWgn3x8ok1vavL42w7HcwP25SNc=; b=a57S4sL6NDIy9WVwAImqA8oiR1
 YquT9/rXUn+az1jdi6YEHwuxfAIdvRrLSLVU42TPDWhddMz5fxRFXt4Q1O0mnUccenyD5Glz6sB4G
 dYSnQhIHMllAu4ltC962WIceTfsBr4XbLYR3mQVJSjiX0DmvXJYuZMX/RragANcROUDALXv3gYStz
 QLx7QXXNkFqz/Fa24zSci5q16/tcohr3tE12iLJWImkUxsMLKtT+eohaREOzzNBqmzWEIJpqsgU6p
 8++zsxVfNANL08qCHmD3m85rUuPXko1nl7tM5WFX3fH19Hs1fjXPjyv3cmnsr9vimSsOBTrWFVdmB
 DPF4j/WA==;
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leVyo-005bYR-RB; Thu, 06 May 2021 04:51:20 +0000
Received: by mail-ot1-x32d.google.com with SMTP id
 g15-20020a9d128f0000b02902a7d7a7bb6eso3813295otg.9; 
 Wed, 05 May 2021 21:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BkR8EzMQJSRdUTCzoWgn3x8ok1vavL42w7HcwP25SNc=;
 b=AKS72qspds8ZGn6uyQ758fmEadTumeLpLvpwTPI2aGoyZViv4xqGFRghS9ylyVbYZh
 stktQwWC2RvQY1cde0m5Fas2rdCCT0MXQ39vHFrgWqyOaU3y8pPQUZTed31DOIBy0I6l
 cdOxXjNjWyd58FF/mk6WKVLbE82dnn5t4YTwX4moqntGyUJ2eyRjnJe/bOF1lmuOOWiZ
 zzOK65+PCOQMLYL0lOM/D8PoqmGOslwyEjnmiHMlKLpt5u1TtipMimZEbDgzwdO6EIi8
 AqmXvQm2gjgXTHhg84OhGtDfhKJFNhJjN4cVt1PV3HhPM85Yyv0aBujyShD1cfEI+k2t
 rC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=BkR8EzMQJSRdUTCzoWgn3x8ok1vavL42w7HcwP25SNc=;
 b=gGRDyF/VRqx6p4vgKgIQvmOkcJmXEOS7QFJk5q8UO8XE6ifR4TJhmtgx2TpH23OsTx
 EoNqaf7ZiK3TqzOH5cAZ49HqwBw/9nhWmSMZxYP37ZX5xSo+Ptksbl1PZ2kH4PLK7/ZH
 +bKVMkNcNX3ogO0duNNxUpv8JtqMcYZ4ee0HO0bafqZn/+AJvSfBcaf3YKbp2zyHzciS
 0jB1aXxxVtgjpGrIv40OAc/HDXLWv0mD852fqkxZkUconNsBsW69m0PMTWRglm9a/nwq
 oATlm31OSrdybFvmVgRRijhEZ9dJ9jFUFY517lTdVC9ATMs7F8tkv8RAqdQJKOE0dk0Q
 +AMA==
X-Gm-Message-State: AOAM530DW0v49RLIWSw2bl9S4yEHcC+jHR0Rh731cuvcB4pBBWFgHta/
 iTkz47pYwTLrkAwv22N3ZQc=
X-Google-Smtp-Source: ABdhPJy9PNmpSVm6f5o/j9WfXm1EkTWXxyRg3ZZdfU7fedQjxTyCpUl8W0IJgannFMMAVJWw4xbH2A==
X-Received: by 2002:a05:6830:1150:: with SMTP id
 x16mr1965608otq.294.1620276676992; 
 Wed, 05 May 2021 21:51:16 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id p1sm366549otk.58.2021.05.05.21.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 21:51:16 -0700 (PDT)
Date: Wed, 5 May 2021 21:51:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Roger Lu <roger.lu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Fan Chen <fan.chen@mediatek.com>,
 HenryC Chen <HenryC.Chen@mediatek.com>, YT Lee <yt.lee@mediatek.com>,
 Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>,
 Angus Lin <Angus.Lin@mediatek.com>,
 Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v16 3/7] soc: mediatek: SVS: introduce MTK SVS engine
Message-ID: <20210506045115.GA767398@roeck-us.net>
References: <20210428065440.3704-1-roger.lu@mediatek.com>
 <20210428065440.3704-4-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210428065440.3704-4-roger.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_215118_899789_BC59B5BA 
X-CRM114-Status: GOOD (  13.35  )
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

On Wed, Apr 28, 2021 at 02:54:36PM +0800, Roger Lu wrote:
> The Smart Voltage Scaling(SVS) engine is a piece of hardware
> which calculates suitable SVS bank voltages to OPP voltage table.
> Then, DVFS driver could apply those SVS bank voltages to PMIC/Buck
> when receiving OPP_EVENT_ADJUST_VOLTAGE.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> ---
>  drivers/soc/mediatek/Kconfig   |   10 +
>  drivers/soc/mediatek/Makefile  |    1 +
>  drivers/soc/mediatek/mtk-svs.c | 1723 ++++++++++++++++++++++++++++++++
>  3 files changed, 1734 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mtk-svs.c
> 
[ ... ]

> +
> +	svsp_irq = irq_of_parse_and_map(svsp->dev->of_node, 0);
> +	ret = devm_request_threaded_irq(svsp->dev, svsp_irq, NULL, svs_isr,
> +					svsp->irqflags, svsp->name, svsp);

0-day reports:

drivers/soc/mediatek/mtk-svs.c:1663:7-32: ERROR:
	Threaded IRQ with no primary handler requested without IRQF_ONESHOT

I would be a bit concerned about this. There is no primary (hard)
interrupt handler, meaning the hard interrupt may be re-enabled after
the default hard interrupt handler runs. This might result in endless
interrupts.

Guenter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
