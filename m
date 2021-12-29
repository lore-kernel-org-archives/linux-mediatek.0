Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9464DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Dec 2021 15:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+OuyBfixTZNse0zTK3g0yT5x1cxAl1HWVrPCudhYKbY=; b=eonEhNn211lhKS
	py8WpnXgkVwO5fjgL187vM4REuc4FpzeZsGQ766s+vDImULT1A0erVZtuF66scfnem49l8M0PDaZi
	rGCXzEfGpMorxQVb1wSCm+EfM5hxh7oaSoxKjegiOvZY/jtJvyarMXcYCo8qsYSB0vzk4gFoAYdbg
	QBlPk+D2zaIU00WEJGlZ6PcjB9fGZVsbaEmSkcjovwI2UDTUJ+1s1AD/G9v7sAd888OVxaaufGEXl
	0HBsrb7bhOe7+IWwkZT5Ru/5EZTO785G1Dy/nHji1DwOzVP2fshrNkCbxNOBZ4yVqiasiEDZxb/sg
	db3NAUO7oJN7CFdAZLXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2atJ-0031FI-4L; Wed, 29 Dec 2021 15:29:25 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2atG-0031Dp-1o
 for linux-mediatek@lists.infradead.org; Wed, 29 Dec 2021 15:29:23 +0000
Received: by mail-wr1-x432.google.com with SMTP id d9so45219304wrb.0
 for <linux-mediatek@lists.infradead.org>; Wed, 29 Dec 2021 07:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Esrph6oyYvc0PlFMTSVl4KFn0QN18H5CiN0RdTi0uho=;
 b=MMFE+DoHqzruyp0xhECuwx7sJylzgT7qQJk25ya0JZt84UlHHO7rwHNMhYGcKezNuW
 kblbkES+sHmyTCXrX8GozwV9kVGiRNxsC+dotZiA+JKD/6sR4MHiMJ9RbMc1OawZhM1P
 jGZIVE9DIX2haHgMeIJpjnOpgeXqPkTfqj67vJEHpYZT1Jo7GAopTyhVbenaXA7OrU63
 Y5x6nrvApffF97+u1LLP1bNB2vAPelywTl8bNln8BAXi0DWdUznbdk1WqrmLkL2g3Mug
 m2Gm4MOS0+gJ3u9sYnA0+yiaFLFGdZYUu5iId6JwmDJ+3FVoOyUoXb+ExIA4RzPu+Dfs
 r5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Esrph6oyYvc0PlFMTSVl4KFn0QN18H5CiN0RdTi0uho=;
 b=iRiJcdyh4VvSg6cmp/mnenzsoJwDg0x/LwvEOBUD9Rzk7dAs5Syxk3QTEzWKdd+2rD
 +i1NoshdvUTDZ33lMhM7LtgO4f6qoIj9VIWg+F5y0KVH+bH/WRghFqSWndU63jhvR7g8
 kQW3wcWpZo1pA4abFu/0ASE0XO3bPmucSWi6X5OtHoWoFFe2i/kqAjrgKn+TMKNZHaZ+
 vR/JKddp1gxiX91v0C6GqFlUA+4xv8rFGusnO8cQ9bdOZBrw77yfU8FC5RCxzg8Zt7H+
 BtZmMuhTdSkJANZCcZQpNHo5ooE5ZLRie1imZ/ksOZvZD11PwiS8sVPrNjlxzCUDvQ6S
 jpzw==
X-Gm-Message-State: AOAM533CqYHk1M6l2sZ5fXbA8HQLM6k4O+315WjzY1IZctQPCVyJ4qkO
 722SELnvUGbTTwgDsGVp+uBOYg==
X-Google-Smtp-Source: ABdhPJxUDpVp537KUcAr3eZlvz2pSfSMqV482z3oVEwQYc07xlN9iaMwVsJ9ScvRwOc5YhKHGNrT8g==
X-Received: by 2002:adf:ef0b:: with SMTP id e11mr20665685wro.621.1640791760744; 
 Wed, 29 Dec 2021 07:29:20 -0800 (PST)
Received: from google.com ([2.31.167.18])
 by smtp.gmail.com with ESMTPSA id e18sm25186071wrx.36.2021.12.29.07.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 07:29:20 -0800 (PST)
Date: Wed, 29 Dec 2021 15:29:18 +0000
From: Lee Jones <lee.jones@linaro.org>
To: matthias.bgg@kernel.org
Cc: robh+dt@kernel.org, bleung@chromium.org, groeck@chromium.org,
 matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH] mfd: google, cros-ec: fix property name for MediaTek rpmsg
Message-ID: <Ycx+zpPZUAeScoIf@google.com>
References: <20211218081543.3851-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211218081543.3851-1-matthias.bgg@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_072922_123651_0C5731C6 
X-CRM114-Status: GOOD (  10.90  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gU2F0LCAxOCBEZWMgMjAyMSwgbWF0dGhpYXMuYmdnQGtlcm5lbC5vcmcgd3JvdGU6Cgo+IEZy
b206IE1hdHRoaWFzIEJydWdnZXIgPG1icnVnZ2VyQHN1c2UuY29tPgo+IAo+IFRoZSBNZWRpYVRl
ayBycG1zZy1uYW1lIGlzIGRlZmluZWQgYXMgbWVkaWF0ZWsscnBtc2ctbmFtZSBpbgo+IG10ayxz
Y3AueWFtbC4gRml4IHRoZSBiaW5kaW5nIGRvY3VtZW50YXRpb24gdG8gbWF0Y2ggdGhlIG5ldyBw
cm9wZXJ0eQo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJn
Z0BnbWFpbC5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZmQvZ29vZ2xlLGNyb3MtZWMueWFtbCB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpBcHBsaWVkLCB0aGFua3MuCgotLSAKTGVlIEpvbmVzIFvm
nY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5h
cm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFy
bzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
