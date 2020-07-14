Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB3FC433E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 20:35:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BC352072D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 20:35:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tp4Y/5he"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BC352072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k+4X+Gwd36tN4xMvWsg4LL9hPKMdYwADkZFE52fEU1s=; b=tp4Y/5he3mVBpuvFA2WGhX0TI
	uKc3U1dnIfzM5B0dXKpo2ZBBPVfHfzvSQYHr73Gb+fii0HDsRYZsGH8EYdkk2iu2OzMlVfSNjOdKV
	f3HSEh6lCRSSwZWsQIvA6Fvy71r9OGpvq91NCwZY2HLnVBAOhCE7jU+M0dUCJDhaNtF0Tekj1wzZo
	ntRm0YhuRXSO17KBz/rvofS/1vaDvRuK2BEvnKZ3YhzH8oeTNcOTN5i+UDnS7GngbxNaGnJzuC7QP
	TsMFDe2CQvewvPycFd01W5YskqW65PQ/3ey8pmqmaNatvE5RBNHBpQOgjANIwzIbeyYBP0qi+4t7x
	tY1rPNCcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvRdg-0006rM-Ml; Tue, 14 Jul 2020 20:34:56 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvRde-0006qi-2A; Tue, 14 Jul 2020 20:34:54 +0000
Received: by mail-io1-f66.google.com with SMTP id y2so18755163ioy.3;
 Tue, 14 Jul 2020 13:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uSvktDxrURDAPk1lcLpPbZnOgOU1nKqvNNzMxPxnjLA=;
 b=HgruR9+wS6pUzJM7MQjXX72YLwhH+W1S51FDWlj3hfRe0CnUBd+X5xkaIdJvtNJdgN
 bzq6y1PC0S05Ig9SMOca39dkQeXJYwtHDRPC564A7OaJjTMV3r8APo2tTef7AMT7Hcvc
 829p1u8ojBj/Fxiv8LaHi1w9w8HNR1jSZfczrcaVJxTanSv95w6Zm+k4Me4C/qMN0RMB
 ffzFtE/8By6eXeu2l9oJxyYoRZTYyP3odNpe/is/+IZ4LBhOUuO0bdIlhtSu5YKgHoyY
 rNHbRkiB2dnTzHdpsgRTFHsvMadNbXYC5JxN7XV6O7YfqmggWa7M5dhxpgVR3UVKVzHn
 ubag==
X-Gm-Message-State: AOAM533+nwqb1X8xDEhW992l/u1+gvEu4xvrR7c/CzFaNw+t3T1GADHv
 up0HNZoCvpNvWShRPKVz5g==
X-Google-Smtp-Source: ABdhPJwH2lS3w18l1/H8LJeXEvXmYUueiCeILVoYmOiLCul1iDA501lA6N+qA5gZHxI9+fpA0OfgLA==
X-Received: by 2002:a6b:1496:: with SMTP id 144mr6868679iou.6.1594758892683;
 Tue, 14 Jul 2020 13:34:52 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id k1sm17128ilr.35.2020.07.14.13.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 13:34:52 -0700 (PDT)
Received: (nullmailer pid 2874342 invoked by uid 1000);
 Tue, 14 Jul 2020 20:34:50 -0000
Date: Tue, 14 Jul 2020 14:34:50 -0600
From: Rob Herring <robh@kernel.org>
To: Hanks Chen <hanks.chen@mediatek.com>
Subject: Re: [PATCH v8 1/7] pinctrl: mediatek: update pinmux definitions for
 mt6779
Message-ID: <20200714203450.GA2874293@bogus>
References: <1594718402-20813-1-git-send-email-hanks.chen@mediatek.com>
 <1594718402-20813-2-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1594718402-20813-2-git-send-email-hanks.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_163454_121760_B6B994DE 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
 wsd_upstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 Sean Wang <sean.wang@kernel.org>, Loda Chou <loda.chou@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Mars Cheng <mars.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, mtk01761 <wendell.lin@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 14 Jul 2020 17:19:56 +0800, Hanks Chen wrote:
> Add devicetree bindings for Mediatek mt6779 SoC Pin Controller.
> 
> Acked-by: Sean Wang <sean.wang@kernel.org>
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> ---
>  include/dt-bindings/pinctrl/mt6779-pinfunc.h | 1242 ++++++++++++++++++
>  1 file changed, 1242 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/mt6779-pinfunc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
