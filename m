Return-Path: <SRS0=9UGu=ET=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 749FAC4742C
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 09:13:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E57CC2078D
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 09:13:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iXZWUZgZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="f1bUvjmh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E57CC2078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vyKuUciZ/6NuAbWqpA/j35m4zAigPLKEzwdUpCsvbgA=; b=iXZWUZgZy1fwNxHgAsLpHSPZO
	XV0DLe6Pi5Xa/VZJW43VbHDX+dLraZRFtXDkq9Yo/t93l0sDlWIftdCYa2tw4TXGLmnor9M121YwX
	ANtsqdFWOAg7raZdeKjVxv2eXy4r/AdrlGs/u9f/T4qF9GNUaUMNOFkUuaq7ZGTUKOezyQmF8CwSl
	0GGRxeTIbvoht6Ohjo8Sw6nZS96UtewzIGV8zIKNGzqD9qYZnjYSKKt7g+OVGjxvSehUWiuGE3C4+
	NksVStRUY64Ahp8Vcq3waq/QC3pPddVEYUIvfPKfhMNXyWVty9I682Htjob1FTnDzDRRgOgl8eUFV
	19dnGgaYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdV8f-0007sj-8u; Fri, 13 Nov 2020 09:13:01 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdV8c-0007qp-99
 for linux-mediatek@lists.infradead.org; Fri, 13 Nov 2020 09:12:59 +0000
Received: by mail-ej1-x644.google.com with SMTP id cw8so12280023ejb.8
 for <linux-mediatek@lists.infradead.org>; Fri, 13 Nov 2020 01:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZEmt/VsFl2qImvUHyYQ40Mn9lV8wv5XsZxCOGudpurw=;
 b=f1bUvjmhfWE+ct5QqgGMY6/gkTD5psyD2wc7dPODO9KgsCqB0ixK2JPE4ApZME0L+f
 o+j/KQpgc+LGI+sy9NKih2qxrYPBpaQK80/YlKEIfiam5j6/jox/xl7S67zEJBgHRhL8
 cC2JAk2kdxb8hl2qPEL8s8diqprVyEXWPho7OWj77Yhoa/sErE0JYFAGOOaQ5cATUGKY
 F5Cjaa+3H9MMjuJX7ZjrIP+4lHKh1L9GJKuN6KYWlOjulGQ+fl9kGjcaX+U5ulY6njT2
 GONrmz7QkZvDGLaoc1q1EP8N6ae56fXmTlM6BM1RdxoaTw2tDzKkqRm1xqynDenDFr/+
 WHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZEmt/VsFl2qImvUHyYQ40Mn9lV8wv5XsZxCOGudpurw=;
 b=qm3hbndqG+jDeLLCeCknLbBusY91E6hsvEcvGgiV5wdpNGHRJ4YQMgG6VgcrhW1U10
 y+qiBVkFYRo+FENXdX7oYHrX95ulPo1SK9DLl0rLcUFx2Hrs9rcikMmru5JLBiAesMqx
 YIT0wXZe+o1hXkCyj/Q5iYRP+6To+YL5hvO1wKwm4aHgg+vjNIH3C/lNXGn+bmZWCEN2
 cWlUxOnlAMHr8f7DepTGco06Cs1eOYaWmTQPyfPvvKmcjyDZw4P3I4BlbV71sFYP1701
 IZX752RDxPkkqLworyDAcXkNirW0nlC65uJhEPwr6PTv6eDywSib5ryjbA2jUljJPfBk
 hE8A==
X-Gm-Message-State: AOAM532sHwfTpDTmyqwukCyvxLJ6LRyvzyLuBMBJ91ItWGY5OsLTbkyz
 DnXbd/d7nQSdIRRHin3UzfnuXSp2uTLVGjWMeRJf1A==
X-Google-Smtp-Source: ABdhPJxtT1qVgA2FoQk7OAdlmJdj+DkZw+qwoVg8AzHfWl781Sx239Ic//jhdSO4tEd0RKQpUy7u9kHYLDSFOZst3ZE=
X-Received: by 2002:a17:906:1c83:: with SMTP id
 g3mr989338ejh.168.1605258777288; 
 Fri, 13 Nov 2020 01:12:57 -0800 (PST)
MIME-Version: 1.0
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
 <20201112161346.gp5nenuagx5wmwl2@pengutronix.de>
 <20201112190649.GA908613@ulmo>
 <20201112211429.kfyqzkmmchjo6pll@pengutronix.de>
 <20201113070343.lhcsbyvi5baxn3lq@pengutronix.de>
In-Reply-To: <20201113070343.lhcsbyvi5baxn3lq@pengutronix.de>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Fri, 13 Nov 2020 10:12:46 +0100
Message-ID: <CAMpxmJXWqKwhNxgY7CKG6ZvszWLxrVo-JCy4riWoXN8y+bCLUA@mail.gmail.com>
Subject: Re: About devm_platform_ioremap_resource [Was: Re: [PATCH 01/32] pwm:
 sun4i: convert to devm_platform_ioremap_resource]
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_041258_398393_C2135078 
X-CRM114-Status: GOOD (  22.31  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Yangtao Li <tiny.windzz@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 shc_work@mail.ru, Kevin Hilman <khilman@baylibre.com>,
 Chen-Yu Tsai <wens@csie.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 bcm-kernel-feedback-list@broadcom.com, dl-linux-imx <linux-imx@nxp.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>, linux-pwm@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 linux-rpi-kernel@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Lee Jones <lee.jones@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Sascha Hauer <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, claudiu.beznea@microchip.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBOb3YgMTMsIDIwMjAgYXQgODowNCBBTSBVd2UgS2xlaW5lLUvDtm5pZwo8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IEhlbGxvLAo+Cj4gW0FkZGVkIGxr
bWwgYW5kIHRoZSBwZW9wbGUgaW52b2x2ZWQgaW4gY29tbWl0IDc5NDVmOTI5ZjFhNwo+ICgiZHJp
dmVyczogcHJvdmlkZSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UoKSIpIHRvIENjOi4g
Rm9yIHRoZQo+IG5ldyByZWFkZXJzOiBUaGlzIGlzIGFib3V0IHBhdGNoZXMgbWFraW5nIHVzZSBv
Zgo+IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpIGluc3RlYWQgb2Ygb3BlbiBjb2Rp
bmcgaXQuIEZ1bGwgY29udGV4dAo+IGF0IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMDEx
MTIxOTA2NDkuR0E5MDg2MTNAdWxtb10KPgo+IE9uIFRodSwgTm92IDEyLCAyMDIwIGF0IDEwOjE0
OjI5UE0gKzAxMDAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+ID4gT24gVGh1LCBOb3YgMTIs
IDIwMjAgYXQgMDg6MDY6NDlQTSArMDEwMCwgVGhpZXJyeSBSZWRpbmcgd3JvdGU6Cj4gPiA+IEkg
YWxzbyB0aGluayB0aGF0IGl0J3Mgb3Zlcmx5IG5hcnJvdyBpcyBzY29wZSwgc28geW91IGNhbid0
IGFjdHVhbGx5Cj4gPiA+ICJibGluZGx5IiB1c2UgdGhpcyBoZWxwZXIgYW5kIEkndmUgc2VlbiBx
dWl0ZSBhIGZldyBjYXNlcyB3aGVyZSB0aGlzIHdhcwo+ID4gPiB1bmtub3dpbmdseSB1c2VkIGZv
ciBjYXNlcyB3aGVyZSBpdCBzaG91bGRuJ3QgaGF2ZSBiZWVuIHVzZWQgYW5kIHRoZW4KPiA+ID4g
YnJva2UgdGhpbmdzIChiZWNhdXNlIHNvbWUgZHJpdmVycyBtdXN0IG5vdCBkbyB0aGUgcmVxdWVz
dF9tZW1fcmVnaW9uKCkKPiA+ID4gZm9yIGV4YW1wbGUpLgo+ID4KPiA+IFlvdSBoYXZlIGEgbGlu
ayB0byBzdWNoIGFuIGFjY2lkZW50Pwo+Cj4gSSBnb3QgYSBoaW50IGluIHByaXZhdGUgaGVyZTog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8xNTU1NjcwMTQ0LTI0MjIwLTEtZ2l0LXNlbmQtZW1h
aWwtYWlzaGVuZy5kb25nQG54cC5jb20KPgo+IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJj
ZSgpIGlzIHBsYXRmb3JtX2dldF9yZXNvdXJjZSgpICsKPiBkZXZtX2lvcmVtYXBfcmVzb3VyY2Uo
KSBhbmQgaGVyZSBpdCB3YXMgdXNlZCB0byByZXBsYWNlCj4gcGxhdGZvcm1fZ2V0X3Jlc291cmNl
KCkgKyBkZXZtX2lvcmVtYXAoKS4KPgo+IElNSE8gdGhlIHVubHVja3kgdGhpbmcgaW4gdGhpcyBz
aXR1YXRpb24gaXMgdGhhdCBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoKQo+IGFuZCBkZXZtX2lvcmVt
YXAoKSBhcmUgZGlmZmVyZW50IGJ5IG1vcmUgdGhhbiBqdXN0IGhvdyB0aGV5IGdldCB0aGUgYXJl
YQo+IHRvIHJlbWFwLiAoaS5lLiBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoKSBhbHNvIGRvZXMKPiBk
ZXZtX3JlcXVlc3RfbWVtX3JlZ2lvbigpLikKPgo+IFNvIHRoZSBwcm9ibGVtIGlzIG5vdCB0aGUg
YWRkZWQgd3JhcHBlciwgYnV0IHVuY2xlYXIgc2VtYW50aWNzIGluIHRoZQo+IGZ1bmN0aW9ucyBp
dCB1c2VzLiBJbiBteSBleWVzIGRldm1faW9yZW1hcCgpIGFuZAo+IGRldm1fcGxhdGZvcm1faW9y
ZW1hcF9yZXNvdXJjZSgpIHNob3VsZCBiZXR0ZXIgYmUgbmFtZWQKPiBkZXZtX3JlcXVlc3RfaW9y
ZW1hcCgpIGFuZCBkZXZtX3BsYXRmb3JtX3JlcXVlc3RfaW9yZW1hcF9yZXNvdXJjZSgpCj4gcmVz
cGVjdGl2ZWx5LiBJcyBpdCB3b3J0aCB0byByZW5hbWUgdGhlc2UgZm9yIGNsZWFyaXR5PwoKQnV0
IGRldm1faW9yZW1hcCgpIGRvZXNuJ3QgcmVxdWVzdCB0aGUgcmVnaW9uLiBEaWQgeW91IG1lYW4K
ZGV2bV9pb3JlbWFwX3Jlc291cmNlKCkgc2hvdWxkIGJlY29tZSBkZXZtX3JlcXVlc3RfaW9yZW1h
cF9yZXNvdXJjZSgpPwoKQmFydG9zegoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
