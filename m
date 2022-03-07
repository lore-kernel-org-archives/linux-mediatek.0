Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31761C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 23:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lFVGeFC1f/b6GpBJUCnC0w0B2Z/ExL97psmYLI2Ouuk=; b=SyAXORmLrGyTwR
	A9+jsngHcUT31t0Og6dRUbCSgokDVeZw5M8rYqSw68PjnUr+K7gCMVv7aI50VbzMwzNO8lXlQUoqg
	I7lnPxJD/ifIoPvLjlpfds/tYg59XLblz/690TnaMKt2cT/W/IBnYbCksDDYYulWfP6u4O6ULVUcL
	MuUA6nwXRJ6JsIzclSVN+sbvei3C2/hdXHjKmFzGOOUkU2+kYGZczdzq4JWkFYcdq5osMaCndCS1F
	CHMf8RHrvrfjIUar7/SnE9mkMyNoOuyOX6X5va7hnsuTuXlvUt2cgBS5BU8K8YVR0F8Yqum/LuYLk
	xOrCI4U1qQlagQR8aoBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRMU1-001uPk-E3; Mon, 07 Mar 2022 23:09:41 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRMTm-001uIz-W8; Mon, 07 Mar 2022 23:09:28 +0000
Received: by mail-oo1-f51.google.com with SMTP id
 l24-20020a4a8558000000b00320d5a1f938so7193481ooh.8; 
 Mon, 07 Mar 2022 15:09:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DEjj6mipEEYLP33vOJE2V/BDkDeTRAuZ0r17MrEk9aE=;
 b=butzmqL1gMY5YU173wxOoCGx9TOs+fcTE+qVVk9APIA3V1il3BAm2qBP5D2o+Q6HtR
 3tyADyhJ+yUE8Rz1B6stP52mLYEPOJXKsfUQ2tQ2KdzkUSJlr9seJmMnDM8wpthRZ9vr
 pIf4nwQT9ZQf0tiSfpr93llpPV6gflizr88zb3b1Juyjhhz25m5hjy21oqyrmBcyH9qr
 vyazWDuf7Iz4WysYyh6qjUePX5PlXNs7aIz3iKqAt7zCaYSeT38bQIwYjUwhF587IM+j
 4onreYQK5uVUfJhzVyGSvlK1C4yfgyxLCFGWIi6LH6u0t/XtvqoEG2n234nTfGGEWqLk
 3zmA==
X-Gm-Message-State: AOAM530+rmAq9qk84/nfGShOGugtn5gvrR0wZdmhpI8VJITO89SoJWx5
 Et1gv9Uu2sl8GywI+RvR/6GS7Xt7Zw==
X-Google-Smtp-Source: ABdhPJyDVQwg3MsMXAkIeGiYt7mgMtzwhkpaixFw/cjv49b8I42KVzQxkNn5uMKaxpWqXbqHoOiGZQ==
X-Received: by 2002:a05:6870:70a5:b0:da:b3f:2b20 with SMTP id
 v37-20020a05687070a500b000da0b3f2b20mr753668oae.191.1646694566133; 
 Mon, 07 Mar 2022 15:09:26 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 bq3-20020a05680823c300b002d4f8fe4881sm7328738oib.39.2022.03.07.15.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 15:09:25 -0800 (PST)
Received: (nullmailer pid 3432748 invoked by uid 1000);
 Mon, 07 Mar 2022 23:09:24 -0000
Date: Mon, 7 Mar 2022 17:09:24 -0600
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: robh+dt@kernel.org, jassisinghbrar@gmail.com, p.zabel@pengutronix.de,
 daniel@ffwll.ch, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 matthias.bgg@gmail.com, fparent@baylibre.com, chunkuang.hu@kernel.org,
 yongqiang.niu@mediatek.com, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [RESEND V6 3/5] dt-bindings: display: mediatek: change to use
 enum for mutex
Message-ID: <YiaQpKN3JawgEl/A@robh.at.kernel.org>
References: <20220303065725.23384-1-rex-bc.chen@mediatek.com>
 <20220303065725.23384-4-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220303065725.23384-4-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_150927_054944_6D4212E9 
X-CRM114-Status: UNSURE (   9.62  )
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

On Thu, 03 Mar 2022 14:57:23 +0800, Rex-BC Chen wrote:
> All single entry cases in mutex can be merged as a single enum.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../display/mediatek/mediatek,mutex.yaml      | 24 +++++++------------
>  1 file changed, 9 insertions(+), 15 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
