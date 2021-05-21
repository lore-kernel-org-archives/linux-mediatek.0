Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3870AC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 01:48:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0417261246
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 01:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0417261246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBdDcYy7pwlfYX4zz02jEXXM1PV2QpuQOInkY8vUeos=; b=EtttDRzubEVtd+cKRPerLaD5NW
	rfYeNCvqSrGN1nJ57r2+zioEpfX06qCGnXoWtsmKlPHHyJpWNEiKLDG66BWDjcSQUbXVXO5kC+pCx
	Kw9brF1XXQd6n6ift0HaP9oq4/75jh9ePE/FLk15nUb9Negn7Wd1FoPnfx6NqvfmGBXWQUA5jevCT
	8K+1ZhXjmdO5xQXZNIKQWN5xDBnY7Ga+e3BNf3Qq9vEM2TV7BO03+NZqorzPeWS4uKGsgRIfgtQDO
	2yv/QHfnWCKl8ARebGJRFWmshSQ/69rYZCQeyAsDkUxhuyPOLBoqPtyip6BTDVzN0xpaRPCMin22U
	It+nYQWA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljuH1-003LUP-DZ; Fri, 21 May 2021 01:48:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljuGz-003LTc-1S; Fri, 21 May 2021 01:48:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=jmKAWY+ilzE9n7Zwbge048gHMsOHlB/JocEpo9sP+mI=; b=N9fFlPtESC4ow8v7y3zpcl5kqY
 VP3L0f85OrlbcWNHkec/VvInDGzT5bISPJrrgpiT7oJKvt8G9nhPcKC2rOHNbkPlCghWRL5QR4oCt
 N9blUoPX8SxjXebI3yOMhrx7c/mGOOsh/mcrVEqJ3qDD6LfrCCXKekof5a+fQWHsMArqpMdAj+cHN
 aeMM9kYTRms/qs6SKuymjqY1dFhAezvtE5yjtV97CLZfWcPmdi8GAEz2NOdNXZrY0VjAnSS3aumwk
 UofBlnFjoubXKc6b7UuHwOPDO7nYG3qrLEw3BYiIsWkheqq6FP3bAid976pXTOoX1MUk75hUVc7kS
 kPljiY5w==;
Received: from mail-ot1-f54.google.com ([209.85.210.54])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljuGw-00Gkvu-CX; Fri, 21 May 2021 01:48:19 +0000
Received: by mail-ot1-f54.google.com with SMTP id
 t10-20020a05683022eab0290304ed8bc759so16633578otc.12; 
 Thu, 20 May 2021 18:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jmKAWY+ilzE9n7Zwbge048gHMsOHlB/JocEpo9sP+mI=;
 b=sb8iszmXB05BOPKNX5AQ7bYFjdO5Bc85ETQRttDzBsfYLuge15fchoAWxqkLvB75T7
 1A0stKo61id6jpOcQ606DKaqkE3Q6g1H6v5ic+/ITfUAlX75wShlMGMrhQW6dJ07RHRW
 J24nl82K6yOKvWy1ivpryQnMUinX4N7+FPOkxkM6IFwm/5QV21ejhhG+SvtcKwzMys1N
 H5ultk/7RwccZT0JTFo21LXjGtNGI28NlrLxa7bs+23ESJjo7jgac57QSjcFWtAaS36h
 4hxkb1f4IH/MnX/8SpOJ6PYxpmWf9z5eZvrwI7HtvtA/myGZfF9p5Uy/jACbcauIAF4a
 jRzQ==
X-Gm-Message-State: AOAM532OXadyfe+Nbg/pv65QEcroHy7Ob1UiMdN3OdZ7RXOkj8KDwinB
 3JgRmdc58FgoOh8aUfi41g==
X-Google-Smtp-Source: ABdhPJwpOly0AdzhSkZhR+HO/LhEwVqZO/Cu3mihGksiE00ZNUpIOJwE81lyGZGnoqna4ai+qKLm9g==
X-Received: by 2002:a9d:6944:: with SMTP id p4mr6039375oto.157.1621561697448; 
 Thu, 20 May 2021 18:48:17 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t26sm1011673otc.23.2021.05.20.18.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 18:48:16 -0700 (PDT)
Received: (nullmailer pid 2476836 invoked by uid 1000);
 Fri, 21 May 2021 01:48:15 -0000
Date: Thu, 20 May 2021 20:48:15 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org, mkorpershoek@baylibre.com,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: mediatek: mmsys: convert to YAML
 format
Message-ID: <20210521014815.GA2476751@robh.at.kernel.org>
References: <20210519161847.3747352-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519161847.3747352-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_184818_445864_8F6A7435 
X-CRM114-Status: GOOD (  10.76  )
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

On Wed, 19 May 2021 18:18:44 +0200, Fabien Parent wrote:
> Convert the mmsys bindings to the YAML format.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  .../bindings/arm/mediatek/mediatek,mmsys.txt  | 31 ----------
>  .../bindings/arm/mediatek/mediatek,mmsys.yaml | 57 +++++++++++++++++++
>  2 files changed, 57 insertions(+), 31 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> 

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
