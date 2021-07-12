Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 218C6C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 19:09:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E66DF61158
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 19:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E66DF61158
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4EdZ0GU6EZtAbQnoKNkuVdHCam9Ba/MG6LBULiMKkW8=; b=3zDirSqBkNsD46
	yqeZEscgzvrE3weKnBdcpDJbMesYcXA21cRFdh05kUKReBw1SUbd6JYqENXvKVi28KX15kA8Wsijm
	Ta7mymqNP2oobGopHtFW/y35Rj3oUlC2gfSKx/8Nq8aOqT+FAS6wPPOQKPHmcfqcCjUCp6iaWZyat
	Ek28dDaO2Tho4TDZDiq2vT2I4nA4r6PqzQw4W4+VsWyTcpW0UPsVAjHQlgYIJjOJ1POLFPCj9o8VZ
	SQ3ySjoc6pHda+Fr+f62wSbT1CQ6fX5eOKUdViLnI8L0t8qsbNGvXF2n6TxpYNfF94jJj2KRxqsum
	qbkuIP8qIHe4AVs3KKqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m31Ir-008Es6-Fp; Mon, 12 Jul 2021 19:09:17 +0000
Received: from mail-io1-f41.google.com ([209.85.166.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m31Im-008EpJ-FO; Mon, 12 Jul 2021 19:09:13 +0000
Received: by mail-io1-f41.google.com with SMTP id g22so24089797iom.1;
 Mon, 12 Jul 2021 12:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ryL66cZ8Fxa8J8T2kT+ROKwZPDNvqOBInHf/KU5Wb9Q=;
 b=soSBxj4sPQuQnHCgP8AxyJ0MNDp8TaRS852l3K0ACPYzSvAUlLvfwXj8eyf3oSZ/0g
 3S47/yBUXyxb3lAC7oJV1MrvstjYWBv1+fJkh4u3opcYbcmTVrmzsiDyZL43wD1Z2WKQ
 T9kM8ESe0qHcfVrzxRA0IyTQJiq3lXNjJO1kS4T8w9OyscHqpzRX+bs5zSkOO0323wAt
 N9JudN2CfXRbSZQlSTOgKmRNj57R00z2nkYHfLaL0qFxVEYvfZ44hin9u86eiXOMjNrS
 zdjILKvuxqQdFT6ZBd1WWbBtBPov8Mt4F3B9i+8HP/iU2geuGGSaQmb/kGwmLsTz6Jy5
 UQvw==
X-Gm-Message-State: AOAM530vng3Y+4Zq923eShe8tC2SYnhzhR8aNqdWXlBC+UDVARWeheg3
 NzAyh87fgQnTSzX3lwCUnQ==
X-Google-Smtp-Source: ABdhPJy39M69RtfgFiUmpHIfZOMl8DpTTtviRMPj97/AnkFI0/PdUC4voQTnLuHSilmE5r2HP20Wtg==
X-Received: by 2002:a6b:f013:: with SMTP id w19mr336514ioc.182.1626116951298; 
 Mon, 12 Jul 2021 12:09:11 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id 15sm8577700ilt.66.2021.07.12.12.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 12:09:10 -0700 (PDT)
Received: (nullmailer pid 2313419 invoked by uid 1000);
 Mon, 12 Jul 2021 19:09:07 -0000
Date: Mon, 12 Jul 2021 13:09:07 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-kernel@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 04/13] dt-bindings: usb: mtu3: add wakeup interrupt
Message-ID: <20210712190907.GA2313362@robh.at.kernel.org>
References: <1624008558-16949-1-git-send-email-chunfeng.yun@mediatek.com>
 <1624008558-16949-5-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1624008558-16949-5-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_120912_596614_F3F9A85C 
X-CRM114-Status: GOOD (  12.85  )
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

On Fri, 18 Jun 2021 17:29:09 +0800, Chunfeng Yun wrote:
> Add an dedicated interrupt which is usually EINT to support runtime PM,
> meanwhile add "interrupt-names" property, for backward compatibility,
> it's optional and used when wakeup interrupt exists
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: no changes
> ---
>  .../devicetree/bindings/usb/mediatek,mtu3.yaml      | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
