Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36445C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 23:37:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03EAC60F4B
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 23:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 03EAC60F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oxSc2gVlOz7y83Ha3HhjPv/W8YfiT7q7FCMBgn6A6FA=; b=wy8GGhHfiOQoca
	VnAhn4XW5lYKv10dmkvatnGkRUp8wCvnTIC94l32zZZseo3Zwx5kDW4hhoQdjDl1iD8qs/i06W/Jq
	4/VSKtQJ7XMINKOiHxO28H2PQ2uG9Lv+KAJwOR6TW7FluikAE+6qR++u+Psjf+u3R+4cdN+JgII8k
	1+Glqx7eW+VbGNVkBTQRXBVWhQX0q3xOBggY6hbQKEH5bYma0qdJvN68sEXodwrS0Qr2DgNobR3OF
	Fca3n56cFKAmcvTSOeYParnXA3q9qyAS5TTdnJ01BMyrkx4hW435MQg81ySuxXZj3UFWlPCX02F6A
	gJH53gT4u8xlLGboaOag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9FaQ-006Qup-8u; Thu, 29 Jul 2021 23:37:10 +0000
Received: from mail-io1-f49.google.com ([209.85.166.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9FaN-006Qty-Em; Thu, 29 Jul 2021 23:37:08 +0000
Received: by mail-io1-f49.google.com with SMTP id m13so9232210iol.7;
 Thu, 29 Jul 2021 16:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FYMjXCYj0p0tfB8Ya9eQk25kWYa4rjV97W3dcaDO+L0=;
 b=WdfBeNtFtyTpGJ6wXUtzMvNFqxz1nTWjal+kH72PtKsGhz1DHYkpq5f3Rjr0wsanb2
 01o+KU4iFSUX2XQRQXf6T93s4c/qE7GQCjwyjNI6x6Rml4S3EsCAUdaq1XMKm4Tmy9rG
 EDKjVKsTy9TYH7VO4qJ7n+fY9s1o9kI08a83b23s2M4Mz1jT9kBezTDfrC1I7GbFag0v
 cVCimmEVKWlThyLiRIreqmRSucwdvuefIoBB4iKBYTqvrbFlF9jFo21YrgG1KaZSKLJ/
 KgQTNTF2jzaQqbcobQyfGVPvqoJpyrSGEzXXA65aIdBTdwqKdsviDm0C3gz0QPTNDzS3
 iufw==
X-Gm-Message-State: AOAM533HQZFLox+yNp9e0P18Ue743/+X9cAI/serwi8nB/pxNx5OpmlY
 ObbAZrSMAxLLHgOVEKbLYg==
X-Google-Smtp-Source: ABdhPJzpBYSMtdtkgUy7KpA/xttDXHBSjSEdHjdAOESAbYOrlBvldUBW8ugRBd1lZmpS3Ff4u+7XNA==
X-Received: by 2002:a5d:87cc:: with SMTP id q12mr5998639ios.131.1627601826889; 
 Thu, 29 Jul 2021 16:37:06 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id w17sm3388415iom.20.2021.07.29.16.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 16:37:06 -0700 (PDT)
Received: (nullmailer pid 1124527 invoked by uid 1000);
 Thu, 29 Jul 2021 23:37:04 -0000
Date: Thu, 29 Jul 2021 17:37:04 -0600
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: mt8195: Use real world values for
 drive-strength arguments
Message-ID: <YQM7oDlooIVAQZ1i@robh.at.kernel.org>
References: <20210726111941.1447057-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210726111941.1447057-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_163707_542485_59833B5A 
X-CRM114-Status: GOOD (  16.12  )
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

On Mon, 26 Jul 2021 19:19:41 +0800, Chen-Yu Tsai wrote:
> The original binding submission for MT8195 pinctrl described the
> possible drive strength values in micro-amps in its description, but
> then proceeded to list register values in its device tree binding
> constraints.
> 
> However, the macros used with the Mediatek pinctrl bindings directly
> specify the drive strength in micro-amps, instead of hardware register
> values. The current driver implementation in Linux does convert the
> value from micro-amps to hardware register values. This implementation
> is also used with MT7622 and MT8183, which use real world values in
> their device trees.
> 
> Given the above, it was likely an oversight to use the raw register
> values in the binding. Correct the values in the binding. Also drop
> the description since the binding combined with its parent,
> pinctrl/pincfg.yaml, the binding is now self-describing.
> 
> Fixes: 7f7663899d94 ("dt-bindings: pinctrl: mt8195: add pinctrl file and binding document")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../devicetree/bindings/pinctrl/pinctrl-mt8195.yaml          | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
