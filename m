Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9178FC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 17:08:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C04E207BC
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 17:08:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ChqMsv9z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C04E207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mDwBqRg3a0vYYnyBhQGKVIhriXCIA0+YfQmY+f+w1FY=; b=ChqMsv9znklUVkxmP56z8rns1
	Uevu8A4SB8JhiQeAWH/OjTHxTRZeP7Hd0grDuu6BmF59DXsvRzgmxHUvFl5AN33Old+7nTn0qBxEd
	BH/0QYnbbeMewUDgBhuS1LxM4tKgvLjhx8u7AaKrvKdGhmz/Oszmmct9+om8RKIYFpXvfeW4NT6oe
	ArmD1SzUXc73/PxNFQkBCxRas+9vo1cv0ePi/Ig2YM1VsQlDMiCR1i3BUZxtAoc4uEsHgpoM+I/x7
	Ol+glftZ8Be3wZFx4qswbHqLyRwtTLrxzlVi9tXXUA5J0kfahsmNo+bRir1Dnr1GlZPhDFUh5tDOn
	wS2uX6BJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kehzg-0005HH-2U; Mon, 16 Nov 2020 17:08:44 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kehzd-0005Gc-GD; Mon, 16 Nov 2020 17:08:42 +0000
Received: by mail-ot1-f65.google.com with SMTP id y22so16699743oti.10;
 Mon, 16 Nov 2020 09:08:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cpje3Ch1E7xsRe01ORBCqLDrqUWUK2vaTS9b/qGcoGw=;
 b=Bmof6BFhrpeUh6zdR6INt303FbXklvU09utgSWV5kjJkqMKKbjvKoPGCOMBxZgFOEZ
 3zT5ecMVo6MTGJWRujt54vp9rFE00zPm5GpoTzx3OugP/sSYhTy729BtyQXVaMwFIGHG
 wCvavUtIhVTPV8EkO//qfXShEwx6S65XDk7R/ABFxQBH4kZZZdgWxhGy5sPBTEHbP3TH
 wug3E8jBkMJ9v8m3ytssA+vkeJz5L3Qw0Ghgv4f9RairweYn4jOz44lUZSpzeqpIA5LH
 oKLvrdJdAW7Uxdu/xfeQpcbkyBub4P6TgMIIA6Ut4wXjQwEmcvftXgcpDUMOORA+ynAS
 +Tsg==
X-Gm-Message-State: AOAM533gBgPDPPcpdX7nBS/evbG/morQVH1yDJJVKnL3JLwiTObKMfqu
 AyXR77gp2IaLiomvi6bgJ7EmNgA61Q==
X-Google-Smtp-Source: ABdhPJwkLS4G7CmYy/+6uMtcAlryYwRd4L3Fhxdc+19D87FDBiWWkwziEXOXNjQzl1fO4w/qkF4kVA==
X-Received: by 2002:a9d:65c7:: with SMTP id z7mr195112oth.25.1605546521077;
 Mon, 16 Nov 2020 09:08:41 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r206sm4850030oih.14.2020.11.16.09.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:08:40 -0800 (PST)
Received: (nullmailer pid 1816812 invoked by uid 1000);
 Mon, 16 Nov 2020 17:08:39 -0000
Date: Mon, 16 Nov 2020 11:08:39 -0600
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH] dt-bindings: mediatek: mt8192: revert "add audio afe
 document"
Message-ID: <20201116170839.GA1816761@bogus>
References: <1605081920-11848-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1605081920-11848-1-git-send-email-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_120841_600571_B760D840 
X-CRM114-Status: GOOD (  11.42  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 tzungbi@google.com, broonie@kernel.org, linux-mediatek@lists.infradead.org,
 Trevor.Wu@mediatek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 11 Nov 2020 16:05:20 +0800, Jiaxin Yu wrote:
> This reverts commit 1afc60e00de3abbb6c559da409c5c1bb8c1d98ec.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  https://mailman.alsa-project.org/pipermail/alsa-devel/2020-November/176873.html
>  These dependency are continuing to upstream, I will revert this patch first.
>  After the dependencies are merged, I will send 'mt8192-afe-pcm.yaml' again.
> 
>  .../bindings/sound/mt8192-afe-pcm.yaml        | 100 ------------------
>  1 file changed, 100 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
