Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD53C56201
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 11:41:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08110206FB
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 11:41:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G5Q322AP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dqbKVY5k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08110206FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Sj59++totTl4XsTNz05uBaCDGmgQlM+UWb9lsYwdSnI=; b=G5Q322APOug3aJW4PrHuMUi3k
	MOg6gq1bz1J5svHw6+N81qnWr6Qk2qMZSCSwpn3EkW1uJgYOty+eFlAJrbIGEDuNqLWjWwQ6+Yayy
	OZsK4Vh4hV0IV29OVz0rf+Sw3HizNBPSRXxy/ksK6PEnC/OmzXuzA75quc4P5vziPDL2hoGCsXJQw
	Z+j/ssdg0ZA58W6QVfUpPU/54MADSL6NZGpayHmVtgXrKWvXK6j1cWanKIWJEloWPZdonrIvzPqGI
	OQBEwQhbimU8pAYkuVSbclYY1JzVRbGtrIcaVrYeLfDgXcn7kEiE2KkgnJdbbDZBZFLsguR8AwGaV
	rUGfUr8gw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdAy9-0005kr-92; Thu, 12 Nov 2020 11:40:49 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdAy5-0005jd-Vz
 for linux-mediatek@lists.infradead.org; Thu, 12 Nov 2020 11:40:47 +0000
Received: by mail-ed1-x544.google.com with SMTP id v4so5817989edi.0
 for <linux-mediatek@lists.infradead.org>; Thu, 12 Nov 2020 03:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IIySD8jHl2ntyqnjJAOFKaUih7w1tKAQSN79AIHZfZo=;
 b=dqbKVY5k33G1WoYnR62WXmoVtTMoFzHvqgC1qm9WJiYf+SRL//ogYuYTKCSHCfwD8v
 a7l+KLPdbh7jqpOLH57Ay87ksd3xUMo5DFIYS9VyC9/zJyn0PubVWxXCzfjBibTZbaFE
 hUVfIYxPPdBT6KLHD6EyFFUnoeUGMUFkdKeoFwoCLQsoiDFZf7MZTRMrNjsqU7INwS1l
 IQ52TQxxBK/9l1hYB+e3ZvRNzJLYFz91+84FGYeT99Dh6mrwKXMQriLBFJdSjQEhTIy7
 VTFAJiGwiW5KBQ2Fpro3akfU4dVOzIir9L7Q6Zsdz0rCsFH/zjQudmBBBeABReILJLA3
 5jjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IIySD8jHl2ntyqnjJAOFKaUih7w1tKAQSN79AIHZfZo=;
 b=nR6a79lnv8yMUju3qJ9rPk9cuRw1ZGcR7UatTt4ES9S0s9IMeqqZHui2vLr7qR83IL
 bFI2VAMnLeAcOt9W0lYaUSuLqB7euvUXJySLwgCcnOou4uQpmoS0PAVsR+kBSYpgrMAO
 QmlghohBbrZWQ0B4RaDhLkkkyKRqspzGJH5CJYkrjcPow7vYBN4JrnVBUtlDPnjkM1mv
 +kfX4PvMwU9H2R65TMmwrDYtfLQgDXkZsY5UtdrBRZW+s4DILd7kE227QLEcpCxNKyzO
 jtYyzgfOv30Ef1pRXPnyttGYsALOHPqjkO0bL/DPvz8vutbc9lrUyoPtpVepsdTyNbg0
 ztkQ==
X-Gm-Message-State: AOAM5325JsKLGX+qiK3PXi8+fQ0nUN+9v/j8vZPJydDu8U+ua/l82DXz
 sVG9Sp240jSsyrzpexSj1Cht75rzdXD+VkVldBbAOA==
X-Google-Smtp-Source: ABdhPJxtq2C8/Sp32xjRsm7unrZdZ2HhAmdm7V9p1LI14Tk4zl6dE5puqEGBsiXHGyN6RLJc7tHoMPBJfCsWylIeQhg=
X-Received: by 2002:a50:ab15:: with SMTP id s21mr4635654edc.88.1605181243548; 
 Thu, 12 Nov 2020 03:40:43 -0800 (PST)
MIME-Version: 1.0
References: <20201112084833.21842-1-vincent.stehle@laposte.net>
In-Reply-To: <20201112084833.21842-1-vincent.stehle@laposte.net>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 12 Nov 2020 12:40:32 +0100
Message-ID: <CAMpxmJWVSfZwukjWGMwBvPxcrWUeeMyyh+SpLAg6bNJdEiga7g@mail.gmail.com>
Subject: Re: [PATCH] net: ethernet: mtk-star-emac: return ok when xmit drops
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@laposte.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_064046_214942_8709108E 
X-CRM114-Status: GOOD (  16.25  )
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
Cc: netdev <netdev@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBOb3YgMTIsIDIwMjAgYXQgMTI6MzUgUE0gVmluY2VudCBTdGVobMOpCjx2aW5jZW50
LnN0ZWhsZUBsYXBvc3RlLm5ldD4gd3JvdGU6Cj4KPiBUaGUgbmRvX3N0YXJ0X3htaXQoKSBtZXRo
b2QgbXVzdCByZXR1cm4gTkVUREVWX1RYX09LIGlmIHRoZSBETUEgbWFwcGluZwo+IGZhaWxzLCBh
ZnRlciBmcmVlaW5nIHRoZSBzb2NrZXQgYnVmZmVyLgo+IEZpeCB0aGUgbXRrX3N0YXJfbmV0ZGV2
X3N0YXJ0X3htaXQoKSBmdW5jdGlvbiBhY2NvcmRpbmdseS4KPgo+IEZpeGVzOiA4YzdiZDVhNDU0
ZmYgKCJuZXQ6IGV0aGVybmV0OiBtdGstc3Rhci1lbWFjOiBuZXcgZHJpdmVyIikKPiBTaWduZWQt
b2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGxhcG9zdGUubmV0Pgo+IENj
OiBEYXZpZCBTLiBNaWxsZXIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+Cj4gQ2M6IEJhcnRvc3ogR29s
YXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbmV0
L2V0aGVybmV0L21lZGlhdGVrL210a19zdGFyX2VtYWMuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX3N0YXJfZW1hYy5jIGIvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvbWVkaWF0ZWsvbXRrX3N0YXJfZW1hYy5jCj4gaW5kZXggMTMyNTA1NTMyNjNiNS4uZTU2
YTI2Zjc5N2YyOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRlay9t
dGtfc3Rhcl9lbWFjLmMKPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRlay9tdGtf
c3Rhcl9lbWFjLmMKPiBAQCAtMTA1Myw3ICsxMDUzLDcgQEAgc3RhdGljIGludCBtdGtfc3Rhcl9u
ZXRkZXZfc3RhcnRfeG1pdChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLAo+ICBlcnJfZHJvcF9wYWNrZXQ6
Cj4gICAgICAgICBkZXZfa2ZyZWVfc2tiKHNrYik7Cj4gICAgICAgICBuZGV2LT5zdGF0cy50eF9k
cm9wcGVkKys7Cj4gLSAgICAgICByZXR1cm4gTkVUREVWX1RYX0JVU1k7Cj4gKyAgICAgICByZXR1
cm4gTkVUREVWX1RYX09LOwo+ICB9Cj4KPiAgLyogUmV0dXJucyB0aGUgbnVtYmVyIG9mIGJ5dGVz
IHNlbnQgb3IgYSBuZWdhdGl2ZSBudW1iZXIgb24gdGhlIGZpcnN0Cj4gLS0KPiAyLjI4LjAKPgoK
R29vZCBjYXRjaCwgdGhhbmtzIQoKQWNrZWQtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xh
c3pld3NraUBiYXlsaWJyZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
