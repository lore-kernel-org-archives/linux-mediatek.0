Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05283C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 01:50:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C41366135C
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 01:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C41366135C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZwZeYWVHNeYO+/BhlhuTNOIjOcY8unSeCPeDmkddmE=; b=ONEAWTZ/VX4OyBt6nsezYxCiHp
	j+5iiBduNr5aMVd+XMshcH0WXT7zuYWXn2guxxJk7ALrAR+WeXw5l144ichFMdrmo24tafaNJCkdz
	aM5WKr4RSQKTCNQC4p+Oy/2qtCkKQkqwDYoKL9YktP6Il56th3LjuxX54Yk/Pek/KwQ/tLFtM/0hW
	6P3na4CdcDghU9mXr7OnW60mvK2cameCshxgTt1IXDpZPW2F6gj9QUARce3mZSa+G5Npz/7ucaukk
	YyMhBIYHGynHAkjU3wMITvF7U8FoaLQHSvJMhKLKqwo8n4ria7cCXIlt9tkwu1hH5Rx+plIGWg0+B
	579smRlQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljuIq-003M1w-3y; Fri, 21 May 2021 01:50:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljuIm-003M0n-3y; Fri, 21 May 2021 01:50:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=vZu2oAAxpPszth+cdRs9YhSMHNjRhOXxb6YW8VoRug4=; b=M0MuhZ792SByCa5IYRYIo3h1Ap
 xaBXvNsPjq67jE6isRnEvnRzueMw9MFdBeKofarT5i0BVq58BxHduxIFMDaFBrr3sOTRHN54sDsm9
 SzsMOaXqFxDXi7jojk1xZYncbREUO5W0P7AAsq76EN/z0lDMdq76GbZnZOcAHSacla2LgmFH2GjAg
 COp/nFgO/wmtSrIE7l0ux1eYGjB9MOaHpUeSc6SaywLw5kivKrm1d5/+2M0dNrFIXWoztd4WSGUV+
 xiTmTSoqupndGPVdkyOHJjurmgzz82Eg2+0fQCISTq/t6/MrXTbdAlQMgmIDh84wWqgkQJDsB4qpc
 zOI1i0Qg==;
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljuIj-00GkxP-IT; Fri, 21 May 2021 01:50:10 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 80-20020a9d08560000b0290333e9d2b247so6110962oty.7; 
 Thu, 20 May 2021 18:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vZu2oAAxpPszth+cdRs9YhSMHNjRhOXxb6YW8VoRug4=;
 b=nqTSUv8RhT6yGXy3NIMlyoZ97fbl3Gpf/PSl2FjoD3NZzcyYWSgOy/LedRF+BYDeVL
 ycGsm5gLlWIQZR74PwwqsCyZoWu3wQwxd0UikI3/dJ/zZcEU0YMMoNSbNlo8zbo68mB7
 pZu+QYyjXzmJ2rCpL9OyV8oHjstp4BRRCkXJ2rUgeci9DeelrLBIX5M8C08PXXpPbSMh
 YV2S51VfxkSVWb1uMNdWjbTXn5R4iZoc+k31AyHPrGp5ZyJVnLG9nRZ/xZ3a9j9T9Qu8
 Oz5QYyNClimzkaEqNXTXlKYVQ4Zn1ElshojMFYeZ4Qs1pl8xZJ66cMQK2EH8E9ZFpewI
 npjQ==
X-Gm-Message-State: AOAM531FwS2HmrQWDfYW0iTDcKEheaT9S+BU79wqTtoBarF2FsmnSY7/
 XrMNdn8zPUUhHS6NXA5BRA==
X-Google-Smtp-Source: ABdhPJx3UWsDTpRkWnxh8VgBc2KRjPGHgHRS1pKtUlFQSUh/thlOVZUpiOfXySl4QlVq4E/6EKqTPA==
X-Received: by 2002:a9d:3ee:: with SMTP id f101mr6156037otf.343.1621561808976; 
 Thu, 20 May 2021 18:50:08 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i18sm905395oot.48.2021.05.20.18.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 18:50:07 -0700 (PDT)
Received: (nullmailer pid 2480084 invoked by uid 1000);
 Fri, 21 May 2021 01:50:06 -0000
Date: Thu, 20 May 2021 20:50:06 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 mkorpershoek@baylibre.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: mediatek: mmsys: add MT8365 SoC
 binding
Message-ID: <20210521015006.GA2479999@robh.at.kernel.org>
References: <20210519161847.3747352-1-fparent@baylibre.com>
 <20210519161847.3747352-2-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519161847.3747352-2-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_185009_629028_37ED7500 
X-CRM114-Status: GOOD (  10.17  )
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

On Wed, 19 May 2021 18:18:45 +0200, Fabien Parent wrote:
> Add the MMSYS binding documentation for the MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
