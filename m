Return-Path: <SRS0=QQ5c=4T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64118C3F2CD
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2020 23:40:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30A4F2465E
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2020 23:40:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dqQms6Ss"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30A4F2465E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oYuL8aUBkeCAdeGI8GldkyIz+wpdhu3afawP2Pk3IOk=; b=dqQms6SsYyCZle
	vl0JmOufA+C4Oj6A4RxCxe/R53z5dOqT4Vj6Daf7sylPfWtTgVMlecL1KHFyOaQr3TRi5Df+qqkKH
	ZVCLABwPKEvXOyJv7v2jhBCqI56mAizafuL3OLwNx15kVTlC9oTZEeWDZjy1KDTZDpxk49h13DqcD
	8upISmDvfZGqB25CRnNz0zvs76A/kLQwO2O/gDzNz6Nu4mfD7OVALcw+QghVmj2Ot/oeWps/jigjI
	0dWz0ZtoUu7SRCKyVmk/ZItnOZqe3Fgo4v0R0eA0ZrcYRMKfEEqb4euY95Wlb29gkLWhGKcncjwH0
	95/OvUdopkXN72UPpv3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8ufo-00053j-If; Mon, 02 Mar 2020 23:40:32 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8ufm-00052o-1k; Mon, 02 Mar 2020 23:40:31 +0000
Received: by mail-oi1-f196.google.com with SMTP id d62so1073047oia.11;
 Mon, 02 Mar 2020 15:40:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9vV5PavoKMjDsMnqHBiR5ea2gdjD5MmrYM/2QvxafIs=;
 b=jykM9PS4rihbn2+TUMPsUnI/82AfHbIkUVZY3XpduSsAZGWxfeo+XGyV+mmcmb2jvK
 DcsIts5MyOHlMRUV640pNFicYkEqK3XL6ixRiJgVrcYsXYleoRvaFdwR8oDe16ED9Z9M
 GSW71wYKsdW2ARJyaLybepHTt+PExuRyZyRA3Uew1/V1VZaJbK5CcFW/85Okq5JgXBh7
 qWTwR2/qk7+0QvI4Pxa1E4fBu8eeGgbYk7xMPn+nqY4vILoJ+tq3xpRcl2sVWxZMVO5R
 PZ72w8VUkrDyK6AxSgrTyHM26+9glLTGXQgJuOeKTmNV22y1Vc/ol10loE35sdRLMDSq
 8G8w==
X-Gm-Message-State: ANhLgQ3QAzHDaR0K5vv7dHBd+YCVO6zdHy+GNAX/5JKwgzf20Jso21X7
 hQWnKDaajANcDVHaqC/0yg==
X-Google-Smtp-Source: ADFU+vtgcYVuJTNmsDp6or+nYg6nhWTDc+Rs/i0JWWu7H1wds1V1X0/hmCpu4JSt66QSVVmXpfJv+w==
X-Received: by 2002:aca:c709:: with SMTP id x9mr609649oif.130.1583192425557;
 Mon, 02 Mar 2020 15:40:25 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j4sm3556682otr.30.2020.03.02.15.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 15:40:24 -0800 (PST)
Received: (nullmailer pid 20489 invoked by uid 1000);
 Mon, 02 Mar 2020 23:40:22 -0000
Date: Mon, 2 Mar 2020 17:40:22 -0600
From: Rob Herring <robh@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v11 2/5] dt-bindings: mediatek: Update mmsys binding to
 reflect it is a system controller
Message-ID: <20200302234022.GA20424@bogus>
References: <20200302110128.2664251-1-enric.balletbo@collabora.com>
 <20200302110128.2664251-3-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302110128.2664251-3-enric.balletbo@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_154030_094784_52D327C4 
X-CRM114-Status: GOOD (  11.99  )
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
Cc: mark.rutland@arm.com, Kate Stewart <kstewart@linuxfoundation.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>, laurent.pinchart@ideasonboard.com,
 ulrich.hecht+renesas@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-clk@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, ck.hu@mediatek.com,
 mtk01761 <wendell.lin@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
 sean.wang@mediatek.com, Houlong Wei <houlong.wei@mediatek.com>,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Allison Randal <allison@lohutok.net>, Matthias Brugger <mbrugger@suse.com>,
 sboyd@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
 matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon,  2 Mar 2020 12:01:25 +0100, Enric Balletbo i Serra wrote:
> The mmsys system controller is not only a pure clock controller, so
> update the binding documentation to reflect that apart from providing
> clocks, it also provides routing and miscellaneous control registers.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
> 
> Changes in v11: None
> Changes in v10:
> - Update the binding documentation for the mmsys system controller.
> 
> Changes in v9: None
> Changes in v8: None
> Changes in v7: None
> 
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.txt    | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
