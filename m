Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80694C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 08:58:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C90B20735
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 08:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C90B20735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wevuWWlZRE2yWJjPcHiVfD2KqP6roEQHSKzcBtV/2jU=; b=2mDF4nFt4T5O5PtntWXLQqTaL
	rSo6+fKGHl/rO6vuN6Oks4iJqBz8OHSM6T+Ly8p2KbJX0VFZ4ungLnF5INs3Tc4ALQmq3fan0yknv
	HmXZQ8eJklfsoKojAlvn5IBYcXLOE1dy3b55zhZqyQ3jeKYqJiPyI6HyrIICpMvAc7MOaS4JwF1HH
	taNEJqfHpu4k27C55xBxrWcPbZcMA/cXAxhlQGhPtHf8s0+ZH6Bge32pB5nXWuGQaEUsX3e2JhAHr
	OSp1pmQFW+qSYpUDfUeBblt2JXPe8ymQ+a9wNnk5Ah6Yzdbm2GVHx+4IDGaZFqLYd5k22LurQP8UJ
	0qi3NP4DQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpSdS-0006R0-Rv; Wed, 16 Dec 2020 08:58:14 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpSdQ-0006QN-BQ
 for linux-mediatek@lists.infradead.org; Wed, 16 Dec 2020 08:58:13 +0000
Received: by mail-wm1-x331.google.com with SMTP id e25so1647526wme.0
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Dec 2020 00:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=CnyyKZ0Zx1BxINWxPqOgHgBA1hAyUh9nq8RAHfNkCus=;
 b=fZHU34jQlz1e2bWiS5yLio80iUB2pJw8FaGi9nwz3hsQAEpTTVFuu9ePjFreyn4sO7
 PU2DQMlqac65tisGoObkSRhMZ4Cv4e9ByEitpNNAKP/hiQWG7RDD0dj2+UFfc/CAQnxv
 SSQJOp35A9eG6Wlqwk8K+Kr0V7t/Y0MgdwLiSOG16X5h+WgldPpM43if+YUzeQST2qgf
 E7pW6z1bseE5Rrii/nSvWF/MAtRDgpnZbEzCSkjg2ZNyPJt0kzaOQoYV2gfSXTT09QZK
 GSAwtVf5/4BSe9+g1NS6PCDRqUxjeHG1JyCwIpryX0ejWqaq2+4gkfPXu+JE5erN0il6
 Yvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=CnyyKZ0Zx1BxINWxPqOgHgBA1hAyUh9nq8RAHfNkCus=;
 b=lJb7CfG+3Zdq96L4KNsD+pZ5p3Pu6wsf7qhu8ZXvd6V41QqsGN/5T+G370Q//LIkjt
 Lr23OzCMmEWtl97j9L89JpsjwuWGCXjhGMR3dwz716Tj9sQykUgHW0cBuOHAi2HdGoDr
 9dzDijozEWQJT+aWkNg+OLzAnysWAoQwPHt39tyg47BaoOnd0t/ZZojVPV+dOTiyeY5H
 eqHcrEDRhLSFV/+qW+WCDgSWbHghfzpIFwcoDWDhIwnHFuMgwEPwjErMMrTvkRMrB+pQ
 rkR5jY/I/hSxnDrhJD3vfXZ73Q8MfOerIoVc/YLHqq+O1IB7/ayrQ0/OdU4ww4SA4NON
 iYtw==
X-Gm-Message-State: AOAM533BQ1tT4d73dfeI6WgaGQDB0eyclmqTzVpzbwzzcEgsui1JoGti
 R6G9oYBk2Ev4IEPrwVLq9/3fSQ==
X-Google-Smtp-Source: ABdhPJxyD6igsMnOelb9CqTbNakrbhwN83NwuKQeIw5SBvQ4jSlkvgYwYSwyhS6HWPk299U6SE0Fsg==
X-Received: by 2002:a05:600c:2903:: with SMTP id
 i3mr2200622wmd.41.1608109089069; 
 Wed, 16 Dec 2020 00:58:09 -0800 (PST)
Received: from dell ([91.110.221.200])
 by smtp.gmail.com with ESMTPSA id w13sm2126803wrt.52.2020.12.16.00.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 00:58:08 -0800 (PST)
Date: Wed, 16 Dec 2020 08:58:06 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 5/5] dt-bindings: mfd: correct the node name of the panel
 led
Message-ID: <20201216085806.GJ4776@dell>
References: <20201204093813.1275-1-thunder.leizhen@huawei.com>
 <20201204093813.1275-6-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204093813.1275-6-thunder.leizhen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_035812_423505_F84662C7 
X-CRM114-Status: GOOD (  13.45  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Pawel Czarnecki <pczarnecki@internships.antmicro.com>,
 Mateusz Holenko <mholenko@antmicro.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-serial <linux-serial@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Karol Gugala <kgugala@antmicro.com>, linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAwNCBEZWMgMjAyMCwgWmhlbiBMZWkgd3JvdGU6Cgo+IEFjY29yZGluZyB0byB0aGUg
ZGVmaW5pdGlvbiBpbiBsZWRzLXB3bS55YW1sLCB0aGUgbm9kZSBuYW1lIG9mIGVhY2ggbGVkCj4g
bXVzdCBtYXRjaCB0aGUgcmVndWxhciBleHByZXNzaW9uICJebGVkKC1bMC05YS1mXSspPyQiLiAi
bGVkIiBvciAibGVkLSIKPiBmb2xsb3dlZCBieSBhIGRlY2ltYWwgb3IgaGV4YWRlY2ltYWwgSUQg
bnVtYmVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFpoZW4gTGVpIDx0aHVuZGVyLmxlaXpoZW5AaHVh
d2VpLmNvbT4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9p
cXM2MngueWFtbCB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpBcHBsaWVkLCB0aGFua3MuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNl
bmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBP
cGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sg
fCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
