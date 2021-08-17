Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98406C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 18:35:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6986261051
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 18:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6986261051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gv9Hiw3v97v01Aq1pK+GsBEj37CU1FH7isq7Plevs3E=; b=01f/Y86dIbi3Xt
	jDE9sJOOi3lhtdz7Iy4ZcC2PrMI9Kmq1AlFnUHUx+3DsclE7kzyh3MrwSF9QkV6dO8Df4i4dmDtIC
	dAZFCjUbud5fIBBiHXeG9pZ52ujcWZHq4xHUhMguxEsXOKW1wN9qVl29dqNrxE0n/A6YdV+4/cY1q
	VDzGwJAVKxGeJxjnhOm7hyiXQXsfT4oBMfqsgg791Krjawh5GWRKdUMHv6f1PTiYABC6FXI3Kvpu0
	+ZLkoEQezk7SikdEqtgTCqqI9OVKKHrLlMMWAsWJR+u9/eeb1wkr/QIpKoeQpikf19ypCuyL3K5yo
	CY/QZPP97KpvbaoqJqjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG3vl-003Eh5-93; Tue, 17 Aug 2021 18:35:21 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG3vg-003Efi-7s; Tue, 17 Aug 2021 18:35:19 +0000
Received: by mail-oi1-f179.google.com with SMTP id bf25so450345oib.10;
 Tue, 17 Aug 2021 11:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/UUvHVstpSmeWABSjaVWOHHhgWPHGVYAwroY70/1r94=;
 b=OhRjFjZJa+TiJjXJadySgQa7yKMYQPsEC2vWnH9H5P0Vm4TZwFr5s8nQLBC5tPtjsZ
 neWmgf1X0xva5CaBY2elz/kvFfBu5hnWKYAjQ32UU9KHlFrg5mMBGZdaG1zKTymBDExq
 8J3XnwW4lGzrEu3LSSMb8CCGEmHjPPvsA7XbsxGc5HymbdCZ9CvDJpDvSu8c8xQqbT/h
 xkEphu9TJB+8o/Lzk8EA5i9mT8pCZwq8iPY+B+J9/mogJLgrZDEsTE+3ZkYM9xPS9OPN
 XGgmjcKgm17w+fLsJ3I9CheaM6CxBpPI9O9/Tnk739F3VISeNfY6qBnhEL404oD+FAjy
 23Rg==
X-Gm-Message-State: AOAM532lRaDRJHjJVUsncB0VlEk1FqrH2oRUtOtJpMqYG2XZoQqKq54h
 Xinaqb5ATLCsFx0UiwweLg==
X-Google-Smtp-Source: ABdhPJxHDyYdGDQTyFagNlU1mVrzpbwIf8BHui2z91Z+R5Jv1ubcn+BSVtrJieSjNOPPeBcp9iqtag==
X-Received: by 2002:a05:6808:1807:: with SMTP id
 bh7mr3621195oib.52.1629225314988; 
 Tue, 17 Aug 2021 11:35:14 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p2sm634161oip.35.2021.08.17.11.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 11:35:14 -0700 (PDT)
Received: (nullmailer pid 618703 invoked by uid 1000);
 Tue, 17 Aug 2021 18:35:12 -0000
Date: Tue, 17 Aug 2021 13:35:12 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Shih <sam.shih@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Matt Mackall <mpm@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Seiya Wang <seiya.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-clk@vger.kernel.org, John Crispin <john@phrozen.org>,
 Ryder Lee <Ryder.Lee@mediatek.com>
Subject: Re: [v2,08/12] dt-bindings: rng: mediatek: add mt7986 to mtk rng
 binding
Message-ID: <YRwBYJmfAQ/3hGuI@robh.at.kernel.org>
References: <20210817074557.30953-1-sam.shih@mediatek.com>
 <20210817074557.30953-9-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817074557.30953-9-sam.shih@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_113516_325469_CD87BBF1 
X-CRM114-Status: UNSURE (   9.43  )
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

On Tue, Aug 17, 2021 at 03:45:53PM +0800, Sam Shih wrote:
> Add RNG binding for MT7986 SoC.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> 
> ---
> v2: patch v1 has been applied

Then don't send the patch again.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
