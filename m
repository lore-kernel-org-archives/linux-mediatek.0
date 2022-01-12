Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1DFC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 02:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BpZsoANQ2k5VLSqy8DWvVoFrka0HvKf762NsM97PINA=; b=VCDdQ2q+gb5tUo
	et12xBqoWzTD8iUJVOkv3vE8K6l5NWBQbmGxlvtI47KNOE+leHumwPjpuhbURRktscLy6J0fdbk2S
	xylNGVPwtFZ4c0vi5mVvmkjDwLxKUjIkvclNSP89Vs4tFQ/8uiKnKe3HkS9nlg7iVCdW5bzmys7wR
	LLX+LY1xWV9ETsne//8Qx7e9UukGTNueqNxsl6Srp6NY9N4qR1eNl8dMGQSh/ZmGceiifiZ8ZOXpR
	nKhamVuMgoX/DsYT0vysUZagbIxdkW4DvsJcJdhS5eFzxX2SLqdpx3w9wBwy0GEOjjCST2H/PC1HX
	Wl5p8EYwuTZOo35AXHAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7T0S-000mHg-4i; Wed, 12 Jan 2022 02:04:56 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7T0P-000mG0-IA; Wed, 12 Jan 2022 02:04:54 +0000
Received: by mail-oi1-f174.google.com with SMTP id s22so1533053oie.10;
 Tue, 11 Jan 2022 18:04:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mx5kM8/eFbEmj5GoTrBeZpE6D6++kND6itmYCnUWRS0=;
 b=fAqoCTSU7wBJfFHW3mDZeDIhQdXYU38Nv8nHLjzxZPg8j8zDeprwibUxcjHAP/aaKh
 WJ8hG/HHI6eKfX8aEAKiSqvNoq63L20IgMju9dhfpDq35EaCv3rzyqir2fGYXhLzi44Z
 qbRAidVXao9gWNkMtEJdgQF9RZowHxm2nnitY9ULUxgiSbIJX0StftyzvRxxmFE9JdbL
 zSn7dEkJ89jsib8ESxp54ZXeKw+QMaj8ksF9Vn18ovjqYAJJ+Y60J53KwNO9Nij5b+Yt
 5CgxY1V7I7idFCdWf3ROhMnLiqI6x09yIjaOCKCu6UmNeTN9gWHWHpP3we9cBjri5s3Y
 F3tw==
X-Gm-Message-State: AOAM5303/DD1Ei/pbPhxyWFK113ajrZ8GCm7sl8hzULBCjf2pcZqmUCV
 Pz9Ycdt5Q/LsX6gSX0Y9lw==
X-Google-Smtp-Source: ABdhPJynGAXr53l1wUKltZqr7h7zzdGD6GxIzBkcgKyEgLxkRVSe1Db0vrJMsEmFIWjnp27Sat1n9Q==
X-Received: by 2002:a05:6808:1a13:: with SMTP id
 bk19mr3783151oib.52.1641953089018; 
 Tue, 11 Jan 2022 18:04:49 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id k19sm2279660oot.32.2022.01.11.18.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 18:04:47 -0800 (PST)
Received: (nullmailer pid 3920282 invoked by uid 1000);
 Wed, 12 Jan 2022 02:04:46 -0000
Date: Tue, 11 Jan 2022 20:04:46 -0600
From: Rob Herring <robh@kernel.org>
To: Kewei Xu <kewei.xu@mediatek.com>
Cc: matthias.bgg@gmail.com, yuhan.wei@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, qii.wang@mediatek.com, ryan-jh.yu@mediatek.com,
 leilk.liu@mediatek.com, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-i2c@vger.kernel.org,
 housong.zhang@mediatek.com, robh+dt@kernel.org, wsa@the-dreams.de,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: update bindings for MT8186 SoC
Message-ID: <Yd43Ptp6dTxd93Ej@robh.at.kernel.org>
References: <20220108095418.16602-1-kewei.xu@mediatek.com>
 <20220108095418.16602-2-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220108095418.16602-2-kewei.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_180453_625503_30D47F98 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

On Sat, 08 Jan 2022 17:54:17 +0800, Kewei Xu wrote:
> Add a DT binding documentation for the MT8186 soc.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
