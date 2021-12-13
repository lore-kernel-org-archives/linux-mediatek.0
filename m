Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D530C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 20:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xzf7QTx82vM7ngA6j+LySCI4lzDavWAXRjZchs5cpV0=; b=xgxD32oyNTXCJZ
	EY/4ulVTNkNU0KN5xEL64mLzhIXLnmqTJjCuv+QALQTOUdnUXw68AVblXdX3T+I1pIvBLTEMXJiND
	Fm7cBI9OUFF0yhDfImNj841qWri7fNKPvnYyt6L2kAL8lhgNlbnk4bsaztNj9Z1i+hVoh0yVX5s/U
	V2PDZEhtHgjQl9kGQ+nAulqCvWifwJRlU0g5oeoN2h4NvJyCYLpbppkS40nra9OmATlWgt9PGBB22
	h2FPQj2VECSmn9g9wFg8mpjYQVGZg3+IhIdd3gAus9T9vG6pYveiV98VUGBCKiNjC3QWhxcWHdTOO
	8QPwfn1RzXoQ1jclQ9RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwrz7-00BKfo-Jm; Mon, 13 Dec 2021 20:31:45 +0000
Received: from mail-oo1-f45.google.com ([209.85.161.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwryt-00BKb3-8L; Mon, 13 Dec 2021 20:31:32 +0000
Received: by mail-oo1-f45.google.com with SMTP id
 a11-20020a4ad1cb000000b002c2657270a0so4453344oos.8; 
 Mon, 13 Dec 2021 12:31:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6Jz4O5bCit+lttjk1cWgGeasdedfgCU+0At2jS7RFSQ=;
 b=e4rxW2Qoe8YKadoZlCMtRkom+Dz2InlDVKDu4N8aK68UC88I8RUmkxhlKKFoMXTv7M
 SYPJAjtaYI9x7GVX+w0TVM3mtCN5aRLbq8oS528ML61+AlWKGzVcJV5HeW+OjX4ElBD4
 i06xZBy76QJOEtsRQqEo64j/BJZk+AsiGbm11rS4On9P+7Kq1mbaaCONvM3cZnhTPL+W
 rpa/JC9YIvQ4FYyekF7OiI6c/zi3rDQkJ8lzpYxB51eTlyA4/edlFCZhzGp3fN2W6IDN
 zbU4TRmzW40GtnwM9Pz8k2LpQQfpkhYzgBcOiHE6IOZor5cuzKzQY7SYcHJf9FzUOa/p
 EN6w==
X-Gm-Message-State: AOAM532BZ9sA1hSClavLvieN1FiQmqWR5LzYZKpcCzFq9SQU9Ha1y8du
 +IlAoNopCchQdOFKr6GGOA==
X-Google-Smtp-Source: ABdhPJx7lUq1A20jc5mI60hoJ2qUBaBDpxbjw29ueJ948efm/GYtUpX11ooAyBeEUo7gl9BXh/sNbQ==
X-Received: by 2002:a05:6820:151b:: with SMTP id
 ay27mr535785oob.22.1639427489902; 
 Mon, 13 Dec 2021 12:31:29 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id m22sm2534192ooj.8.2021.12.13.12.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 12:31:29 -0800 (PST)
Received: (nullmailer pid 1520651 invoked by uid 1000);
 Mon, 13 Dec 2021 20:31:28 -0000
Date: Mon, 13 Dec 2021 14:31:28 -0600
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: srv_heupstream@mediatek.com, Joerg Roedel <joro@8bytes.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 yi.kuo@mediatek.com, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 lc.kan@mediatek.com, linux-kernel@vger.kernel.org, youlin.pei@mediatek.com,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 anthony.huang@mediatek.com, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: memory: mediatek: Add mt8186 support
Message-ID: <YbetoA2JJtnXj7gm@robh.at.kernel.org>
References: <20211203064027.14993-1-yong.wu@mediatek.com>
 <20211203064027.14993-3-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211203064027.14993-3-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_123131_324615_0D5315DD 
X-CRM114-Status: GOOD (  11.30  )
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

On Fri, 03 Dec 2021 14:40:25 +0800, Yong Wu wrote:
> Add mt8186 smi support in the bindings.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  .../bindings/memory-controllers/mediatek,smi-common.yaml      | 4 +++-
>  .../bindings/memory-controllers/mediatek,smi-larb.yaml        | 3 +++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
