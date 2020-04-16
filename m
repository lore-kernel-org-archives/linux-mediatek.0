Return-Path: <SRS0=NHOn=6A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D6EC352BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Apr 2020 08:51:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 726A121569
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Apr 2020 08:51:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="apy9/m5C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iTUUxmnx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 726A121569
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3TT1W1leh8Xa75/KOZI5iKSD2c8V+PDn3JfBSQbiyVU=; b=apy9/m5CznCEdV
	4F4bYkbnE2qleur97rMfoeEbAk9aRdMbyXgaJgfmfF9CNqiBB0xw7O0lW5mFrtdMgI+0xKtizfwu6
	ufTtYebMWleDRVxJZDmyN1u64W8FBdsnmyWCA52AQvG1mtbbL4ox5vAOGutlv7jfOKlWUkPxwksDk
	cnrMV18a9fLmShCqRLH0eTx/1FWtZAmiOkN6zv5YXQe4RvFREqo6D1vQKuLMymso0pzS+gklzpdUV
	RipHerVN9Dzewt9sjIMoEb9ZQjNZNEIYDw3mJeNQj/dAyKI1Ze0gnJI2/VvaLAlOlM37em/GGrPYa
	527W+H2MxZqwuf3fMwCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP0FE-0003hz-SR; Thu, 16 Apr 2020 08:51:36 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP0FC-0003eA-Kb
 for linux-mediatek@lists.infradead.org; Thu, 16 Apr 2020 08:51:35 +0000
Received: by mail-wm1-x343.google.com with SMTP id y24so3896018wma.4
 for <linux-mediatek@lists.infradead.org>; Thu, 16 Apr 2020 01:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=aQURq1REwHEPMxWj0A/UhXFxGHBPx1Zt6Uxv60umXok=;
 b=iTUUxmnxUoqM1iP5zj7BbzhwKQK2NqYbdVMK0rIh0CiAAy9/it6DIt1DL4Ooif9/bE
 Pul6F77qct+LdTVwj/1QFZe9JzU7U365RE9K2ngJq6+qZ15SxAPXTQR3XQRAdySjswRR
 9JYky000loQpUPX3wnZRvPFFa45uhJxKiqbju2/rslkJy7h3NmXl0ZIYzg2ZbfnCQ5dc
 AsNg7kMa9TiJe/4kUyOORB8GNBgxQrV21VfhsiPqvwyuyliDY3hqDbicfevTFn5hB8rm
 ++qfzQ5FGFbm9rT/GFdYCl8cOGCJR7Yj/AL+Xc5pcZgU+6DZeOb6aSyklfhfqZMu9KiT
 XbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=aQURq1REwHEPMxWj0A/UhXFxGHBPx1Zt6Uxv60umXok=;
 b=POsidI5geQlzoGs+UTgpAeC8+0Zfu47xAx1rteJOpf8TjAcNyD6ll7+B6z43UjNHfP
 JtmodPm3ruoxKT7GEnS9/RwIe1aC65i/iEtXFQocKceEO9vaRxAamMeg2gW11d2c4YU2
 o9tb3kwIRKkN7SpDVI+iBZCc+JhuJaSIJ0tTTwYcexRmC9D70dkq3APpHsCXMQPZvbvv
 xz8gAXzCPr/DtZqXTNEN6SbsP21a/xqB7E1ecjvbZxQEtmCodvKGiXtmPnuhD+3028yi
 pGXAmRLM6f0s+Edg86I3tXlRMvuRZPCl2sTn5laHUxIGK8qLuZ+EDrEmhAN94CCLf9F8
 hvTw==
X-Gm-Message-State: AGi0Pub9fjlQDDIjchqnC4Ax+ew+aXlEIpCTvP0y9G8jEwGA2uIUVzCs
 V5As4X+KCu5t0CAQxHsyHfLL7g==
X-Google-Smtp-Source: APiQypKU3qRZVCXuxnBOouk3e3DEAX4zubXTv+zywdpux61f+2SAQwvIpImS075eYrYQxApgGH0znw==
X-Received: by 2002:a7b:c147:: with SMTP id z7mr4036229wmi.52.1587027093347;
 Thu, 16 Apr 2020 01:51:33 -0700 (PDT)
Received: from dell ([95.149.164.124])
 by smtp.gmail.com with ESMTPSA id q8sm2740501wmg.22.2020.04.16.01.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 01:51:32 -0700 (PDT)
Date: Thu, 16 Apr 2020 09:52:33 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v12 2/6] mfd: mt6397: Trim probe function to support
 different chips more cleanly
Message-ID: <20200416085233.GY2167633@dell>
References: <1586333531-21641-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1586333531-21641-3-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586333531-21641-3-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_015134_673527_2AD19928 
X-CRM114-Status: UNSURE (   7.17  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, Richard Fontana <rfontana@redhat.com>,
 linux-rtc@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 Frank Wunderlich <frank-w@public-files.de>, Ran Bi <ran.bi@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Josef Friedl <josef.friedl@speed.at>, srv_heupstream@mediatek.com,
 Sebastian Reichel <sre@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAwOCBBcHIgMjAyMCwgSHNpbi1Ic2l1bmcgV2FuZyB3cm90ZToKCj4gQWRkIG5ldyBz
dHJ1Y3QgbWVtYmVycyBmb3IgbWZkLWNlbGxzIGFuZCBpcnEgaW5pdGlhbCBmdW5jdGlvbiwgc28g
d2UgY2FuCj4gY2FsbCBkZXZtX21mZF9hZGRfZGV2aWNlcygpIG9ubHkgb25jZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBIc2luLUhzaXVuZyBXYW5nIDxoc2luLWhzaXVuZy53YW5nQG1lZGlhdGVrLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9tZmQvbXQ2Mzk3LWNvcmUuYyB8IDM1ICsrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCsp
LCAyMSBkZWxldGlvbnMoLSkKCkZvciBteSBvd24gcmVmZXJlbmNlIChhcHBseSB0aGlzIGFzLWlz
IHRvIHlvdXIgc2lnbi1vZmYgYmxvY2spOgoKICBBY2tlZC1mb3ItTUZELWJ5OiBMZWUgSm9uZXMg
PGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8g
U2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdh
cmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
