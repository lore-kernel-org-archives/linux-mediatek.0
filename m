Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C374EC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 13:14:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77BCF2080A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 13:14:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vzNuCY00"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77BCF2080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wmSi8xcCa+MY+MdKGsQI9TrBX/5qnEggDHbZnHY+zYg=; b=vzNuCY00W/UOAaZyxXB8VOFNj
	sjF60w7opSbSpj2g+nGVcrNkXmoAJzRbUBsrZ0yE08bDnnluhcC3/CiKydgdxRHLJ07QUbGFJocY3
	WL4aqiq3sG5nlygKdewFXt+sewJUMEnYJhEoJGdDC4gYgX6tphT+60/xnRA7BcAMiWC545SilbQX1
	U4vWUAjzZxRHqy5U7YVtqaf2mxy2TIQeHItPsQpG2mPOeVa9TqBUOGF/wbwINqqv3AK8fN8tH+DgI
	3zmqR1GhXQW+Wl6DfrOm/g13dGHI9HyvOE3AE0sciuk0qsXANvqO3xJxSQo/5qFvXH4FodMHseYIC
	xg1mXXIWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX2K2-00030v-Ki; Mon, 26 Oct 2020 13:14:02 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX2Jz-0002zt-6s; Mon, 26 Oct 2020 13:13:59 +0000
Received: by mail-oi1-f196.google.com with SMTP id y186so3314823oia.3;
 Mon, 26 Oct 2020 06:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rmJekMJIbGl07zxWeiosPnkjYnZ4WMaPaye8OH8Xnfg=;
 b=MaztYrVr34250KfFZT9sLzQIqfA+x5UVbuUECuwKTEkIi6JixW1pebw6W0/irLOx3M
 1tjar/7ZvICEh+EA9ydRKBBOH5AqaVMljx6TjSWJXPbCYeCLcXHrUkdhzaSX/6Lf36u/
 73XLhYKIrR5brd8MzPoYGX/UvhzArMtb+3oQcRzYPWjchGTk9bxU4LzjYY9ve+XI6eu+
 qydlOGiW1TzK7RWtcmrtL8UEaYXIOBInO5R3x1y/qlICZSSimzmS/FiNj4BpruWJVhCb
 nfVQOs9YvJZDEaZ92E+J+rBAqR5M5mqPPFk4nGDV+l1Oy93xP+f5K4VRhFiayWYsU0xh
 2qUw==
X-Gm-Message-State: AOAM5312+IHp0y8Fg5CUnn4jishMU5ZFK67NmR6B7ahXOy7kHwvycOrW
 HxBI2s3U/72wKaK+Urz1wg==
X-Google-Smtp-Source: ABdhPJxZnw5CrxzzGKl682KAZOV7/6vCSY0bZk6f1XdhhjV5uYq2BaP8QK0LgRi1cGEe7IOnR23wMg==
X-Received: by 2002:aca:d487:: with SMTP id
 l129mr10305529oig.123.1603718036793; 
 Mon, 26 Oct 2020 06:13:56 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k13sm3841301ooi.41.2020.10.26.06.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 06:13:55 -0700 (PDT)
Received: (nullmailer pid 10906 invoked by uid 1000);
 Mon, 26 Oct 2020 13:13:55 -0000
Date: Mon, 26 Oct 2020 08:13:55 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: mtk-efuse: add documentation for
 MT8516 SoC
Message-ID: <20201026131355.GA10697@bogus>
References: <20201016171837.3261310-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201016171837.3261310-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_091359_262970_0E7464BB 
X-CRM114-Status: GOOD (  11.53  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 16 Oct 2020 19:18:36 +0200, Fabien Parent wrote:
> Add binding documentation for MT8516 SoCs.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/nvmem/mtk-efuse.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
