Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B33C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 23:19:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10CF961037
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 23:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 10CF961037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iaab+9c4QLNpZkfrjya3Jvr8kbmRZXsBM8QezV++Dyg=; b=AjoNMzPCWZSQDe
	3sezC3sjNNc+CgYe4elFVseK0E8J3AB2IDnxudfle5W4AkUCGQ3wIWdDLHL05eI6HMDrxDeEMLx9Z
	IDNTHRGmZoufHQzuuL9n2/dIh6qXCYIU4pk+gnd8oljGi0xRHhTcYvpzpQLyKQzY1ElOCfcANQOT3
	iUVeaACvtMwANf3S15ML6Uitq8059n7f3TdE97Psqo4aDd+1Fsf/eItFGVm99xhs72WOu6WsZgHyf
	KHT4YBOL1myGIZnUABCio2z8dJ76RlCarQ9uvd3ViKEuMzjji15EW2esIg30eiLWZXTM7Y6aN5bKN
	ZVcKCeKKb1cP4yPlUHXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1me3ot-00C6wi-UD; Fri, 22 Oct 2021 23:19:27 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1me3oh-00C6v8-Qd; Fri, 22 Oct 2021 23:19:17 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 s18-20020a0568301e1200b0054e77a16651so6223831otr.7; 
 Fri, 22 Oct 2021 16:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/k2usNEoGshbBmL0WitRf7k2ydrC5pjOBlb8rwsXyiA=;
 b=ZCiHPKwhLdzXzQ1WFwkBcPyD37liPFcbAkRhRNoB4Kf9V/Fee0iBS48WijvsXubq+f
 7PuAVe1C9D8i1sc+DZfHbNZ8bBgbtqnjNafA2BA3zbsP2D8/AwYRWe/MrmpnqkdvqjPN
 b4APoSX8vmz5itCIJ6fCAmQQSZA8gGjsdf8HnA0hNoj7IINz0W3eYXnzqWCwBjAQyUwv
 8VvIwLNVIgPn/3/6c83ILs75h10lO/IfyQS4Tvs7/lzqxTpf01A8m6m96RapyDUd8lcO
 G1wWL5dTNjeAwO4HSmHZlN0wsQq+V1rBgvqqP8SPo0Y3lAp7o7lyp+dnf0EhcNfF1vRB
 J0Ww==
X-Gm-Message-State: AOAM53340m59tJSsTbo9RIYVqpFFmkWpu5Fx5HyB181TVktfuMpDpRoW
 KunzQaP9ydOuW1OhbZL6Zw==
X-Google-Smtp-Source: ABdhPJyKjGOiqfYmevfk5jD8qcStva/zOLrdn+2YW5JzaLYiTmEg7mycrFTUR15qr1MLkOFVBbrjdg==
X-Received: by 2002:a9d:2235:: with SMTP id o50mr2178779ota.245.1634944754830; 
 Fri, 22 Oct 2021 16:19:14 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 187sm2056997oig.19.2021.10.22.16.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 16:19:14 -0700 (PDT)
Received: (nullmailer pid 3356287 invoked by uid 1000);
 Fri, 22 Oct 2021 23:19:13 -0000
Date: Fri, 22 Oct 2021 18:19:13 -0500
From: Rob Herring <robh@kernel.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v5 2/7] dt-bindings: mediatek, dp: Add Display Port binding
Message-ID: <YXNG8Qy5jAPdWbHY@robh.at.kernel.org>
References: <20211021092707.3562523-1-msp@baylibre.com>
 <20211021092707.3562523-3-msp@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211021092707.3562523-3-msp@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_161915_891959_1ADA298D 
X-CRM114-Status: GOOD (  12.92  )
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

On Thu, 21 Oct 2021 11:27:02 +0200, Markus Schneider-Pargmann wrote:
> This controller is present on several mediatek hardware. Currently
> mt8195 and mt8395 have this controller without a functional difference,
> so only one compatible field is added.
> 
> The controller can have two forms, as a normal display port and as an
> embedded display port.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
> 
> Notes:
>     Changes v4 -> v5:
>     - Removed "status" in the example
>     - Remove edp_tx compatible.
>     - Rename dp_tx compatible to dp-tx.
> 
>  .../display/mediatek/mediatek,dp.yaml         | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

But can't be applied without the dependent header (or remove the 
dependency).

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
