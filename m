Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C134DC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 15:53:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6897721707
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 15:53:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6897721707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7Au5nv3SN4L2NKUejRbg0PmEavlDhkGHQMSr+Q9Y0wM=; b=vmmBJmT798QaCFmKs/rYLQjUO
	56nzaTUy7MDS0QjfKzmunYicryI6pYiBd/ZPUvXPtzZ0LHeJu0Mg7FDvGt/3I2UJkSqc+Hnxojj6N
	afXeljFOqK0rBjkxGJf0jy/nWOJwGiDxsQY/s+A//EL4bcD3PUaoI7uLM+O0Nqvy1d6TjMoVr+mh4
	czd9d+yz/iZDiEYpFlkTzdrBIaiqvyI9wl/c+xibg/p/zXW8piA9uyFpjkJZ+zIBT5Quwvg8nRMTP
	668srfKZymNCb8yJNSYw2tsTUVhspivIGjhLzOMhbyM1cLIiT6prcbjfyXMGgo9bkarWG18dJK/ak
	LfBnPQC8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l44AV-0006on-JA; Mon, 25 Jan 2021 15:52:43 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l44AT-0006np-NM; Mon, 25 Jan 2021 15:52:42 +0000
Received: by mail-oi1-f175.google.com with SMTP id h6so13859618oie.5;
 Mon, 25 Jan 2021 07:52:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1yZ0c7rEGx6fs5prkxGM3bg0LRxfxDPD57XXjzl1Uts=;
 b=LXXby8LN+9cSgSlLGkq1FsvmHC5N5DaV5m0K8CakzJFznDdsShxvC9UDK30H3xpHOM
 eq2OoJi1QLRFJ0eZQUOqoUdDxphZ2DD6L7GXNaX4Yy4+sR5YikvnSN1mEDRcocdQdGo9
 xDAiSrITfSo9NVHq+yoMoIsKbi6rbmEHipMIBWfEqlJdVlEdOmDj8jp/+0WtDnPR/QnM
 5WrZbLuLwJ89OFDHgtokDYfm16hHyV6cmR1bqkFNMAKCCLLa/s83Bjww7bSaLT5m7d9m
 eGkYxjht4piNQAPApttCDntAEMxI0X/N/FMuZ4Vfbd35PBrg/hXBUlSHJCUODStPsaDw
 hSzQ==
X-Gm-Message-State: AOAM530xVYBfUbrgZZSOJn/JXUHN7D+DMRi7V3mZrCXZSUSV8f0VhikA
 vPyUhFHxBqrazD2lcd+uoA==
X-Google-Smtp-Source: ABdhPJyIyaU356Mk4aXZ1GdOShLRCqmFKrnVBcRmci0oX+onFDjf6FhTHcQuHXCioZHrCT+STr8gvw==
X-Received: by 2002:a05:6808:b3c:: with SMTP id
 t28mr502706oij.37.1611589960589; 
 Mon, 25 Jan 2021 07:52:40 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m185sm3570114oib.48.2021.01.25.07.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 07:52:39 -0800 (PST)
Received: (nullmailer pid 442514 invoked by uid 1000);
 Mon, 25 Jan 2021 15:52:33 -0000
Date: Mon, 25 Jan 2021 09:52:33 -0600
From: Rob Herring <robh@kernel.org>
To: DENG Qingfang <dqfext@gmail.com>
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: dsa: add MT7530 GPIO
 controller binding
Message-ID: <20210125155233.GA438031@robh.at.kernel.org>
References: <20210125044322.6280-1-dqfext@gmail.com>
 <20210125044322.6280-2-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210125044322.6280-2-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_105241_781047_ED8AB4FE 
X-CRM114-Status: GOOD (  12.72  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linus.walleij@linaro.org>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>,
 devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, Sean Wang <sean.wang@mediatek.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 25 Jan 2021 12:43:21 +0800, DENG Qingfang wrote:
> Add device tree binding to support MT7530 GPIO controller.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
> Changes v1 -> v2:
> 	No changes.
> 
>  Documentation/devicetree/bindings/net/dsa/mt7530.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
