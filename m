Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7F0C433C1
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 01:45:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52B1861A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 01:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52B1861A02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BGV5DXKFGh/PAbiMMhggibcPrYpaLuhI/qmeRCJi0JU=; b=XsUHLjTkPwZiEUAH9bLcSfAPX
	CP7evycSn0qwGxo+NoT96NlNh6pLTCKOozd2aaTGH0IsSjbdEMBTfNNPjLnyaF0aj/1EZ4gtr/QAT
	gaCR1+hPVr1rvm3UO2gjYXw7SuKCuIL7sVCZIZWCJwHTycWFMerMow0b7Fyd/dz0OWjmo/lFh9M/A
	hlF99Dl6JelWmayVDvJGhx55iDkXKjwaXud+xSJRbOW4P247okJP4ZinldJuA1Z1BYLMCfxtroCVs
	0ay9PMkjxzbHncSZpeHlHHoI57k502VKlsC+RXox8IMjbC0iGi1roS65PN6OmJhLMbZd9lvJwT93P
	pHF9366MQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPbXe-002VNv-A6; Fri, 26 Mar 2021 01:45:38 +0000
Received: from mail-io1-f50.google.com ([209.85.166.50])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPbXa-002VN4-Jb; Fri, 26 Mar 2021 01:45:36 +0000
Received: by mail-io1-f50.google.com with SMTP id k25so3881915iob.6;
 Thu, 25 Mar 2021 18:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=27tbT4MS/CX8M2DbKhKUDnhJBUGOSfTJ+GBZzWZj5P4=;
 b=hwD+HbCKHSykX4zawFNk4X5i+DULqLZlc/sxs+o7d8BcLruOA8j87O8JnUNfR/m81K
 4z2XTbPXRBBxgMTfJYh36B+GbeHkFrBneIo2IecFnvUTb5OOn0U0e3zx055umQwRTdmd
 Xclhl+vYcTc0Qw6S7gSMVGuFheE77vIEoX6eL/63oxTuIUJo4Y7SAGL001RbBs0f9BAM
 JJcu8CTh9zD0//llCIylqYxKhkIwiNhhNc7PtiY4m7zFc1JGZC1LdSQZGY6237X2O49v
 pl8LRriEB1j+uF+SP0wx7mYMWyh2r7bdTrjioReRmKVtW+TNAWQBstg9nXixgxCX+jPF
 YfxQ==
X-Gm-Message-State: AOAM531Q0PdKubYRG/ZjaSM1tffb71MLodQB05vYfxLTCkbQiTdZDlrE
 UwvpYDMZMbrBinEE2DLlgg==
X-Google-Smtp-Source: ABdhPJy63j3fTYtBj6uDNf6/KdcuR4UeZ7pXuEFPEoBMCmHpBcCcxvdbbnYD9tK7aXReVE3phLEG5Q==
X-Received: by 2002:a02:9042:: with SMTP id y2mr10027352jaf.94.1616723133720; 
 Thu, 25 Mar 2021 18:45:33 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id h6sm3433426ild.79.2021.03.25.18.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 18:45:33 -0700 (PDT)
Received: (nullmailer pid 2152868 invoked by uid 1000);
 Fri, 26 Mar 2021 01:45:29 -0000
Date: Thu, 25 Mar 2021 19:45:29 -0600
From: Rob Herring <robh@kernel.org>
To: Seiya Wang <seiya.wang@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lars-Peter Clausen <lars@metafoo.de>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, linux-watchdog@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
 linux-iio@vger.kernel.org, linux-serial@vger.kernel.org, 
 srv_heupstream@mediatek.com, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 devicetree@vger.kernel.org, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>, 
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
 linux-mmc@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Cameron <jic23@kernel.org>, 
 Fabien Parent <fparent@baylibre.com>, Stanley Chu <stanley.chu@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Chaotian Jing <chaotian.jing@mediatek.com>
Subject: Re: [PATCH v2 6/8] dt-bindings: arm: Add compatible for Mediatek
 MT8195
Message-ID: <20210326014529.GA2152657@robh.at.kernel.org>
References: <20210319023427.16711-1-seiya.wang@mediatek.com>
 <20210319023427.16711-8-seiya.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210319023427.16711-8-seiya.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_014534_726157_938CC708 
X-CRM114-Status: GOOD (  11.73  )
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

On Fri, 19 Mar 2021 10:34:25 +0800, Seiya Wang wrote:
> This commit adds dt-binding documentation for the Mediatek MT8195
> reference board.
> 
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
