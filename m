Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B37C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 05:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RVl6OvghmznqgtbRt4xhWg7gPToJDKqdOO4/JQistow=; b=yLKN89rua6O0eT
	/mFCtE77mVSgK6TWrxmKcBU3spQ5xA+0RvR/YJMvikcy6sDjTeiC0CJWXGeEeA6enXQa/+T0Pwlyb
	GuEnB6qtjkL/gvMNtAEsuIYePyKYp5n25GKwq4scFjos5RKwbS+/OHInOoIqnX2qSXL5iKfW4tguj
	AJqv77RLLmBsiFEGTNjTCVMVwqffNyQ9GAOVTAJt5lqxdLps81eCn7xCOBeu7FbnWuDhNF5swl5as
	Stqv2JjXQ9AywsA83pAaUIZll4vtgJCcjrW0UTxjwTJ4fGotOlzL65Jlyl6bLmZiqw7sXywUHYUYg
	fGuh4AMZp80JoezO31gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHJPu-00CYmd-9L; Tue, 08 Feb 2022 05:51:54 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHJPi-00CYkj-Ug; Tue, 08 Feb 2022 05:51:44 +0000
Received: by mail-pj1-x102a.google.com with SMTP id on2so6822588pjb.4;
 Mon, 07 Feb 2022 21:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+3ZcLJm27H8oLNAua0asYIW8shnjHdO4o7eaON3JmvI=;
 b=Utsof/n07Dwv/VAN0QG8C3UMpXsvFVUW5T873C1nhjJWvcGJJvT3Z8el2TgAX3GiFZ
 cuQfk1uHldSvLZucfShn4G2jJ3WrRCbr5Ca6l2A6+8HCcxT2T5ztNFmVO2p2roDNbd3/
 XyE/XWgT8hy5is8hITgRVUz0RwUp12j+8Jm8mbOxH/tLNBfo2HjypUpr5RCd1mo9ropv
 8YbEZzPtXgeeLDORVTlI7pK3LazDFh+JTkg6cx59SfANFbIv8JeZWKiC/BooY7/Sbk+W
 uCPF9TlPLiXIUXKHpZRbmSfdV3wZf7S6M2A0gmu8oVXuQZvzIErsK+5Kls7cTf1dKs6P
 F0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+3ZcLJm27H8oLNAua0asYIW8shnjHdO4o7eaON3JmvI=;
 b=jAThJ0cmYa5OqczA5KdpQ98wHdu0+r8JDapy8Yuu8OPxjCr0j+MV/+i1TEQDww/WTn
 w7uhX0D8OqQB3MU9tTTXIwND3tCK9vMHeOcF7nep+Zx2MhBluilblrRmMsGYKeDWaQPD
 7FV0DU6XtWwi8PDeDEaJklVLj/NTkLG2wsR5kQsarGBnj75Z0/uYiixEpbbblFo/BWcN
 Vf84PdKqOBfB5gfIJZ7/jStDHrqpPV5dBKuQmscDQhNkZWyQAzDONXTHgaOMjFU279NB
 dgSFl2AstlXP2rVrrt1MImHJFs9SXSCFONE/9ZVTkMli04jcwDA6t91hk6fEEN3qjFRV
 gCZg==
X-Gm-Message-State: AOAM533wHW/kn3k08Hkq3qNJXpsTcN/8KlZHAUMG6RhP89JWBWsTReJM
 pGCuHEIaFfcCB9+NzCfCr2I=
X-Google-Smtp-Source: ABdhPJzE85kiG+7OF7zdzg8yZmLKGSLdEq8VpQLCjB1TKj93dQ7lNK3LG1gtK6qTcVDD9IcAngcFaw==
X-Received: by 2002:a17:90a:348e:: with SMTP id
 p14mr2638034pjb.71.1644299501213; 
 Mon, 07 Feb 2022 21:51:41 -0800 (PST)
Received: from google.com ([2620:15c:202:201:7164:d581:d7ee:53bb])
 by smtp.gmail.com with ESMTPSA id mp12sm1204652pjb.17.2022.02.07.21.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 21:51:40 -0800 (PST)
Date: Mon, 7 Feb 2022 21:51:37 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Fabien Parent <fparent@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] Input: mtk-pmic-keys - use get_irq_byname()
 instead of index
Message-ID: <YgIE6ZVNFPS1ffUR@google.com>
References: <20220121140323.4080640-1-mkorpershoek@baylibre.com>
 <20220121140323.4080640-2-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220121140323.4080640-2-mkorpershoek@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_215143_018432_BEE1A5DB 
X-CRM114-Status: GOOD (  11.42  )
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

On Fri, Jan 21, 2022 at 03:03:20PM +0100, Mattijs Korpershoek wrote:
> Some pmics of the mt6397 family (such as MT6358), have two IRQs per
> physical key: one for press event, another for release event.
> 
> The mtk-pmic-keys driver assumes that each key only has one
> IRQ. The key index and the RES_IRQ resource index have a 1/1 mapping.
> 
> This won't work for MT6358, as we have multiple resources (2) for one key.
> 
> To prepare mtk-pmic-keys to support MT6358, retrieve IRQs by name
> instead of by index.
> 
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

Applied, thank you.

-- 
Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
