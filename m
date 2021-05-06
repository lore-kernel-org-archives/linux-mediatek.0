Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60EBBC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 11:48:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE384613D6
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 11:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE384613D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gozOqwfxJjRyTHOTB6zuoKpMfbdH6p+lh43v0fyHxDw=; b=l1zWckx1UoDqagWp/wj6xB79K
	QHGXRZabaZZVjSJNQAGLCoEXqV6HqKKbuAA/vABqjF+ts/sCp2CIZAFT+Z0z4UaHk+Lj7X7mSlPIy
	XkSBFg+3vaRUicD+RkOaxgmQfLk+V+eRM22+IMpMjI2ZEAmVNN9z4NreAe8sEv/bHxkR4eSN2JUdb
	aIuCpg+P8lFfYJZxcRqdpG2buccf0SGAFpdfECIYrMQnNxsUEVSsTEzuqShnXgzSVPjV1zH6MGyXx
	k4yMJEod98LItWPg2bcDjip4V67q4OcEtMa0/I+A9CmcAm0Bjo1NO01hqOk2WLiGNvm73GB1GXgRs
	9zXppQPgA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lecUO-004AfL-A9; Thu, 06 May 2021 11:48:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lecUM-004Af1-18
 for linux-mediatek@desiato.infradead.org; Thu, 06 May 2021 11:48:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=AA7rwHKkDu014cTKd9NxKCpVNUL0Wnr6JWgERveJ2WY=; b=wG+mvKwREAjFfpNZcQlrkkYIfl
 oS6w1aIJ5IKegXZBYDNulSXzLHAvKlJzZBuSpCT1IkJuYGiBqe93kZqYU7XSXi/+j/Pf/K/qHSmUA
 b5w2kG8jYxu4F/0Zgzc++MbxTkWR4jaksb/T9O6emMRtVS2adR+NpTL8qdOcL3NfPIpN1GICfgQFA
 cnniUTEttiawF4Wxu8KgnPLJOV9E+uIbM+Pf4IVwvBCoxS7gWO+9e/EGjc2NCDwAD1xIlNr52Nq7S
 e7D0vqnDZXEJPFIDGj+Wm9mSBs7JYskmAsGA9xIK91IVzxr2vD9ymiGlvE0lAz8TgPaiWoT07iW3h
 IMlqf1PQ==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lecUJ-005zth-Ea
 for linux-mediatek@lists.infradead.org; Thu, 06 May 2021 11:48:16 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 b19-20020a05600c06d3b029014258a636e8so2888408wmn.2
 for <linux-mediatek@lists.infradead.org>; Thu, 06 May 2021 04:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AA7rwHKkDu014cTKd9NxKCpVNUL0Wnr6JWgERveJ2WY=;
 b=OqewioGX7zUn70JN2xPh43HBNTI/Zv48ATFcJW+HdY108QarLQEAfZcJL2NWwOIEQP
 HOuUgmAd3XhlL2UmAm7S1l3XGK/VyhFl+hFZST0ED6bQviLfefBPZkHXxC14J7kv2vhD
 D1+ArsYl3QaMlW1es1TH8qxPfKmykvOVL4mgmX7U3O0gJ2ILQ4VwgoTzNQxB5nR9BNOU
 lrRFITF0Ov3j7NqZX6/LvtH/kNJZqsNgzr+zwyQh2aiGaa0q9tLXq+Bk581Y8jpQLAkf
 OIVp3K6RxZHojjokGLMJxWf9QCdevtAogfaiEP1y4FjgZkr1F86xoW6S6uJ+XMhgUnBb
 hHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AA7rwHKkDu014cTKd9NxKCpVNUL0Wnr6JWgERveJ2WY=;
 b=gQl4Nw24PmSwEZ+D2QLAPjIt/5Bj5ym29E8EugYQAmc3l2LjQsXRj+9zUJ9dk+GXwa
 k4xwN28JNVhjL6EnkuAqSiFlzI/8sshNShkFTXBnmQNyPcj+z/XrLyjh3jzk9bMgBMPx
 mH2nIjIs1JMcxkayUtEw1PPmikiDBX6LhBp2i2c9DjLy4Zazldh+SMW/hhEeFZo6g7A5
 JUmOGqe5Q0W06nbNP879/fK7js2aIjHTXfo6c5JNx+iZIFk2Y6jQx43355HfBksW/mKV
 u8PGlZViM9uGLZrPZ6hjvWRzy0ng082fQJXMFdKqXwg2tbvVGB1t/DszB7WnVL8D+dX/
 kAeQ==
X-Gm-Message-State: AOAM533X8YOeRKDbXS05xBpdfkAZOq5aOZ3qbIqdNUGpogFdOWkOYbBt
 XW7J+1n1cwGDt2CRE1FEJ4w=
X-Google-Smtp-Source: ABdhPJxWaOHqxEYLD/SeMJjnnTA8VEuB+Mq8RR2XPlYvqhDNgJxpc53CtcIuVCbo8xpCa0OA9pxV7Q==
X-Received: by 2002:a05:600c:4f4d:: with SMTP id
 m13mr3610259wmq.4.1620301693518; 
 Thu, 06 May 2021 04:48:13 -0700 (PDT)
Received: from skbuf ([86.127.41.210])
 by smtp.gmail.com with ESMTPSA id u5sm3797210wrt.38.2021.05.06.04.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 04:48:13 -0700 (PDT)
Date: Thu, 6 May 2021 14:48:11 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Weijie Gao <weijie.gao@mediatek.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH net-next 4/4] staging: mt7621-dts: enable MT7530
 interrupt controller
Message-ID: <20210506114811.zkj7klujcqn54zun@skbuf>
References: <20210429062130.29403-1-dqfext@gmail.com>
 <20210429062130.29403-5-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429062130.29403-5-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_044815_529165_75C27E7E 
X-CRM114-Status: GOOD (  16.73  )
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

On Thu, Apr 29, 2021 at 02:21:30PM +0800, DENG Qingfang wrote:
> Enable MT7530 interrupt controller in the MT7621 SoC.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
> RFC v4 -> PATCH v1:
> - No changes.
> 
>  drivers/staging/mt7621-dts/mt7621.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
> index 16fc94f65486..0f7e487883a5 100644
> --- a/drivers/staging/mt7621-dts/mt7621.dtsi
> +++ b/drivers/staging/mt7621-dts/mt7621.dtsi
> @@ -447,6 +447,10 @@ switch0: switch0@0 {
>  				mediatek,mcm;
>  				resets = <&rstctrl 2>;
>  				reset-names = "mcm";
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +				interrupt-parent = <&gic>;
> +				interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
>  
>  				ports {
>  					#address-cells = <1>;
> -- 
> 2.25.1
> 

I don't remember if I mentioned this before, but a short-hand way of
expressing this is using:

	interrupts-extended = <&gic GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;

but the entire drivers/staging/mt7621-dts/mt7621.dtsi file uses
interrupt-parent, so this is fine.

Also, I panicked for a second thinking that this is the ARM GIC which
supports the GIC_SHARED flag, but I see that mt7621 is MIPS.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
