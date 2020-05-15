Return-Path: <SRS0=cOAS=65=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF09C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 12:56:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EC4D2074D
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 12:56:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tc/67lyV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="vQpa/V/2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EC4D2074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O3OMX9lg2t7skgx2OqiEwdBLB4ZqzKBkfenzTR9pSMw=; b=tc/67lyVNlkjyF
	oCANGe1nMUoCPN/q43bTke5QWdmBcrg/1dIpLlj2CbMvkmmOJrDFiBPFspXfOE5nyyc3VJhXOK5IU
	7wNWaCgxLZLvLMXeyA1p0WEcE5CJbmcziK+KTnfMm2iFs67t/My7Sz2My9Mq7bEku739iFEMN9i+1
	f6II/yroU6I+u96ELE3+Wmjz38/vAoeUHk72Bxe1truZusfZCAC8JoaftbC1G84obC9JsnWaXpYqj
	kkucgw2uhi8cwbWaP0+H2zX4bq95CN8M8Q7rQFP6zPbI9yEaTFmv1weAg9IV1x0ruC+nqE+wN0Q1R
	Kz9f3+zu2jPe1akqsskw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZZtA-0006AW-HR; Fri, 15 May 2020 12:56:32 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZZsy-0005vp-QB
 for linux-mediatek@lists.infradead.org; Fri, 15 May 2020 12:56:22 +0000
Received: by mail-il1-x141.google.com with SMTP id w18so2364817ilm.13
 for <linux-mediatek@lists.infradead.org>; Fri, 15 May 2020 05:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UKroOh2PouJyW9aIDGfDz6KjqY9gVQj12EPFSDublmA=;
 b=vQpa/V/2d27tMcZAv7Abd34xjhVsIEeZzrDrtJyVTfhsRI5XbTGjwCIO/aERLAuHrZ
 /IDDIp2Nyi2dbSZdL6+Ei9b5G3ZMuxLX9s5g4bydz+1ckRRkhVPa7wy6pmUCguarxPbh
 epoFYuHCZKmDhp6ZKwj5KTTRyS1Q0tbs+LrdiSIOPYHBYzINIkvLAHCEr5lqIFc76ZZb
 5e0do7Y2NA3anxjjEQ+kcNYGtmyW38wVsVqiIBJnGEzJucPGI8FbisgPd1XdjqPAcXQE
 VqOmfZPXnTlhqnPmebHsDCU0B2A3gx3qh3moPnlcGFqdaG/G3Psf36RCkMHMJmKYMYoU
 xLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UKroOh2PouJyW9aIDGfDz6KjqY9gVQj12EPFSDublmA=;
 b=gd/HT/Jik5jxXHZ65MoOdu+kXWxwJgyOq3RIEyDzgL+/NOUJn65vZKQCnAEsl5rtZu
 EzME8f99z0GGWGK9gY6MzNZ9QjYp+uSSGi1SRG7YKsoGGVusN+CV71TR5tJ9yjhPzgCe
 eZ+O9nM6ScTzXZG9CBVTx8XPKnyj7+hhwJUWu0eWe9d2QpsIRFxPuDOsE00h+/q5Z/ei
 bI3tQZR1FcR3RwppyBFdVfpf9QMy7+hprQAq+oCZMrfDvowkGcNZK639L5i5E84KpCGl
 K3Pgum88wCgKyvnLbTOixaY9yqKvzmVzap9cQWTtyWS/UwXYrx4w1AqYpDV/0ygezQ1X
 7N7w==
X-Gm-Message-State: AOAM531HdAvXqLaNu5YIpWKZhw1flQP2smVpYRtw1pMw3JV968zb5kHL
 LIcQYlNk28l1f2CKQ0LkE3IErRhSaFa4+5DpfkXwNw==
X-Google-Smtp-Source: ABdhPJwxlPUfGtzfy33AVJzkSkvw1FkcvOCUrRT614H0OzqvY7RE2DoHu5yieo8v50b5ATxQYMVDFbWOcCKbmYEaOxE=
X-Received: by 2002:a92:aa07:: with SMTP id j7mr3394310ili.40.1589547379907;
 Fri, 15 May 2020 05:56:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200514075942.10136-1-brgl@bgdev.pl>
 <20200514075942.10136-11-brgl@bgdev.pl>
 <CAK8P3a3=xgbvqrSpCK5h96eRH32AA7xnoK2ossvT0-cLFLzmXA@mail.gmail.com>
 <CAMRc=MeypzZBHo6dJGKm4JujYyejqHxtdo7Ts95DXuL0VuMYCw@mail.gmail.com>
 <CAK8P3a0u53rHSW=72CnnbhrY28Z+9f=Yv2K-bbj5OD+2Ds4unA@mail.gmail.com>
In-Reply-To: <CAK8P3a0u53rHSW=72CnnbhrY28Z+9f=Yv2K-bbj5OD+2Ds4unA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 May 2020 14:56:09 +0200
Message-ID: <CAMRc=Mf_vYt1J-cc6aZ2-Qv_YDEymVoC7ZiwuG9BrXoGMsXepw@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] net: ethernet: mtk-eth-mac: new driver
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_055620_923329_0AA13642 
X-CRM114-Status: GOOD (  28.74  )
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
Cc: Edwin Peer <edwin.peer@broadcom.com>, DTML <devicetree@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Jonathan Corbet <corbet@lwn.net>, Networking <netdev@vger.kernel.org>,
 Sean Wang <sean.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pedro Tsai <pedro.tsai@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

cHQuLCAxNSBtYWogMjAyMCBvIDE0OjA0IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+IG5h
cGlzYcWCKGEpOgo+Cj4gT24gRnJpLCBNYXkgMTUsIDIwMjAgYXQgOToxMSBBTSBCYXJ0b3N6IEdv
bGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPiB3cm90ZToKPiA+Cj4gPiBjencuLCAxNCBtYWogMjAy
MCBvIDE4OjE5IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+IG5hcGlzYcWCKGEpOgo+ID4g
Pgo+ID4gPiBPbiBUaHUsIE1heSAxNCwgMjAyMCBhdCAxMDowMCBBTSBCYXJ0b3N6IEdvbGFzemV3
c2tpIDxicmdsQGJnZGV2LnBsPiB3cm90ZToKPiA+ID4gPiArc3RhdGljIHVuc2lnbmVkIGludCBt
dGtfbWFjX2ludHJfcmVhZF9hbmRfY2xlYXIoc3RydWN0IG10a19tYWNfcHJpdiAqcHJpdikKPiA+
ID4gPiArewo+ID4gPiA+ICsgICAgICAgdW5zaWduZWQgaW50IHZhbDsKPiA+ID4gPiArCj4gPiA+
ID4gKyAgICAgICByZWdtYXBfcmVhZChwcml2LT5yZWdzLCBNVEtfTUFDX1JFR19JTlRfU1RTLCAm
dmFsKTsKPiA+ID4gPiArICAgICAgIHJlZ21hcF93cml0ZShwcml2LT5yZWdzLCBNVEtfTUFDX1JF
R19JTlRfU1RTLCB2YWwpOwo+ID4gPiA+ICsKPiA+ID4gPiArICAgICAgIHJldHVybiB2YWw7Cj4g
PiA+ID4gK30KPiA+ID4KPiA+ID4gRG8geW91IGFjdHVhbGx5IG5lZWQgdG8gcmVhZCB0aGUgcmVn
aXN0ZXI/IFRoYXQgaXMgdXN1YWxseSBhIHJlbGF0aXZlbHkKPiA+ID4gZXhwZW5zaXZlIG9wZXJh
dGlvbiwgc28gaWYgcG9zc2libGUgdHJ5IHRvIHVzZSBjbGVhciB0aGUgYml0cyB3aGVuCj4gPiA+
IHlvdSBkb24ndCBjYXJlIHdoaWNoIGJpdHMgd2VyZSBzZXQuCj4gPiA+Cj4gPgo+ID4gSSBkbyBj
YXJlLCBJJ20gYWZyYWlkLiBUaGUgcmV0dXJuZWQgdmFsdWUgaXMgYmVpbmcgdXNlZCBpbiB0aGUg
bmFwaQo+ID4gcG9sbCBjYWxsYmFjayB0byBzZWUgd2hpY2ggcmluZyB0byBwcm9jZXNzLgo+Cj4g
SSBzdXBwb3NlIHRoZSBvdGhlciBjYWxsZXJzIGFyZSBub3QgcGVyZm9ybWFuY2UgY3JpdGljYWwu
Cj4KPiBGb3IgdGhlIHJ4IGFuZCB0eCBwcm9jZXNzaW5nLCBpdCBzaG91bGQgYmUgYmV0dGVyIHRv
IGp1c3QgYWx3YXlzIGxvb2sgYXQKPiB0aGUgcXVldWUgZGlyZWN0bHkgYW5kIGlnbm9yZSB0aGUg
aXJxIHN0YXR1cywgaW4gcGFydGljdWxhciB3aGVuIHlvdQo+IGFyZSBhbHJlYWR5IGluIHBvbGxp
bmcgbW9kZTogc3VwcG9zZSB5b3UgcmVjZWl2ZSB0ZW4gZnJhbWVzIGF0IG9uY2UKPiBhbmQgb25s
eSBwcm9jZXNzIGZpdmUgYnV0IGNsZWFyIHRoZSBpcnEgZmxhZy4KPgo+IFdoZW4gdGhlIHBvbGwg
ZnVuY3Rpb24gaXMgY2FsbGVkIGFnYWluLCB5b3Ugc3RpbGwgbmVlZCB0byBwcm9jZXNzIHRoZQo+
IG90aGVycywgYnV0IEkgd291bGQgYXNzdW1lIHRoYXQgdGhlIHN0YXR1cyB0ZWxscyB5b3UgdGhh
dCBub3RoaW5nCj4gbmV3IGhhcyBhcnJpdmVkIHNvIHlvdSBkb24ndCBwcm9jZXNzIHRoZW0gdW50
aWwgdGhlIG5leHQgaW50ZXJydXB0Lgo+Cj4gRm9yIHRoZSBzdGF0aXN0aWNzLCBJIGFzc3VtZSB5
b3UgZG8gbmVlZCB0byBsb29rIGF0IHRoZSBpcnEgc3RhdHVzLAo+IGJ1dCB0aGlzIGRvZXNuJ3Qg
aGF2ZSB0byBiZSBkb25lIGluIHRoZSBwb2xsIGZ1bmN0aW9uLiBIb3cgYWJvdXQKPiBzb21ldGhp
bmcgbGlrZToKPgo+IC0gaW4gaGFyZGlycSBjb250ZXh0LCByZWFkIHRoZSBpcnEgc3RhdHVzIHdv
cmQKPiAtIGlycSByeCBvciB0eCBpcnEgcGVuZGluZywgY2FsbCBuYXBpX3NjaGVkdWxlCj4gLSBp
ZiBzdGF0cyBpcnEgcGVuZGluZywgc2NoZWR1bGUgYSB3b3JrIGZ1bmN0aW9uCj4gLSBpbiBuYXBp
IHBvbGwsIHByb2Nlc3MgYm90aCBxdWV1ZXMgdW50aWwgZW1wdHkgb3IKPiAgIGJ1ZGdldCBleGhh
dXN0ZWQKPiAtIGlmIHBhY2tldCBwcm9jZXNzaW5nIGNvbXBsZXRlZCBpbiBwb2xsIGZ1bmN0aW9u
Cj4gICBhY2sgdGhlIGlycSBhbmQgY2hlY2sgYWdhaW4sIGNhbGwgbmFwaV9jb21wbGV0ZQo+IC0g
aW4gd29yayBmdW5jdGlvbiwgaGFuZGxlIHN0YXRzIGlycSwgdGhlbiBhY2sgaXQKPgoKSSBzZWUg
eW91ciBwb2ludC4gSSdsbCB0cnkgdG8gY29tZSB1cCB3aXRoIHNvbWV0aGluZyBhbmQgc2VuZCBh
IG5ldwp2ZXJzaW9uIG9uIE1vbmRheS4KCj4gPiA+ID4gK3N0YXRpYyB2b2lkIG10a19tYWNfdHhf
Y29tcGxldGVfYWxsKHN0cnVjdCBtdGtfbWFjX3ByaXYgKnByaXYpCj4gPiA+ID4gK3sKPiA+ID4g
PiArICAgICAgIHN0cnVjdCBtdGtfbWFjX3JpbmcgKnJpbmcgPSAmcHJpdi0+dHhfcmluZzsKPiA+
ID4gPiArICAgICAgIHN0cnVjdCBuZXRfZGV2aWNlICpuZGV2ID0gcHJpdi0+bmRldjsKPiA+ID4g
PiArICAgICAgIGludCByZXQ7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgZm9yICg7Oykgewo+
ID4gPiA+ICsgICAgICAgICAgICAgICBtdGtfbWFjX2xvY2socHJpdik7Cj4gPiA+ID4gKwo+ID4g
PiA+ICsgICAgICAgICAgICAgICBpZiAoIW10a19tYWNfcmluZ19kZXNjc19hdmFpbGFibGUocmlu
ZykpIHsKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBtdGtfbWFjX3VubG9jayhwcml2
KTsKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+ID4gPiArICAgICAg
ICAgICAgICAgfQo+ID4gPiA+ICsKPiA+ID4gPiArICAgICAgICAgICAgICAgcmV0ID0gbXRrX21h
Y190eF9jb21wbGV0ZV9vbmUocHJpdik7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIGlmIChyZXQp
IHsKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBtdGtfbWFjX3VubG9jayhwcml2KTsK
PiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+ID4gPiArICAgICAgICAg
ICAgICAgfQo+ID4gPiA+ICsKPiA+ID4gPiArICAgICAgICAgICAgICAgaWYgKG5ldGlmX3F1ZXVl
X3N0b3BwZWQobmRldikpCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgbmV0aWZfd2Fr
ZV9xdWV1ZShuZGV2KTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICAgICAgICAgIG10a19tYWNf
dW5sb2NrKHByaXYpOwo+ID4gPiA+ICsgICAgICAgfQo+ID4gPiA+ICt9Cj4gPiA+Cj4gPiA+IEl0
IGxvb2tzIGxpa2UgbW9zdCBvZiB0aGUgc3R1ZmYgaW5zaWRlIG9mIHRoZSBsb29wIGNhbiBiZSBw
dWxsZWQgb3V0Cj4gPiA+IGFuZCBvbmx5IGRvbmUgb25jZSBoZXJlLgo+ID4gPgo+ID4KPiA+IEkg
ZGlkIHRoYXQgaW4gb25lIG9mIHRoZSBwcmV2aW91cyBzdWJtaXNzaW9ucyBidXQgaXQgd2FzIHBv
aW50ZWQgb3V0Cj4gPiB0byBtZSB0aGF0IGEgcGFyYWxsZWwgVFggcGF0aCBtYXkgZmlsbCB1cCB0
aGUgcXVldWUgYmVmb3JlIEkgd2FrZSBpdC4KPgo+IFJpZ2h0LCBJIHNlZSB5b3UgcGx1Z2dlZCB0
aGF0IGhvbGUsIGhvd2V2ZXIgdGhlIHdheSB5b3UgaG9sZCB0aGUKPiBzcGlubG9jayBhY3Jvc3Mg
dGhlIGV4cGVuc2l2ZSBETUEgbWFuYWdlbWVudCBidXQgdGhlbiBnaXZlIGl0Cj4gdXAgaW4gZWFj
aCBsb29wIGl0ZXJhdGlvbiBmZWVscyBsaWtlIHRoaXMgaXMgbm90IHRoZSBtb3N0IGVmZmljaWVu
dAo+IHdheS4KPgoKTWF5YmUgbXkgdGhpbmtpbmcgaXMgd3JvbmcgaGVyZSwgYnV0IEkgYXNzdW1l
ZCB0aGF0IHdpdGggYSBzcGlubG9jawppdCdzIGJldHRlciB0byBnaXZlIG90aGVyIHRocmVhZHMg
dGhlIGNoYW5jZSB0byBydW4gaW4gYmV0d2VlbiBlYWNoCml0ZXJhdGlvbi4gSSBkaWRuJ3QgYmVu
Y2htYXJrIGl0IHRob3VnaC4KCj4gVGhlIGVhc3kgd2F5IHdvdWxkIGJlIHRvIGp1c3QgaG9sZCB0
aGUgbG9jayBhY3Jvc3MgdGhlIGVudGlyZQo+IGxvb3AgYW5kIHRoZW4gYmUgc3VyZSB5b3UgZG8g
aXQgcmlnaHQuIEFsdGVybmF0aXZlbHkgeW91IGNvdWxkCj4gbWluaW1pemUgdGhlIGxvY2tpbmcg
YW5kIG9ubHkgZG8gdGhlIHdha2V1cCBhZnRlciB1cCBkbyB0aGUgZmluYWwKPiB1cGRhdGUgdG8g
dGhlIHRhaWwgcG9pbnRlciwgYXQgd2hpY2ggcG9pbnQgeW91IGtub3cgdGhlIHF1ZXVlIGlzIG5v
dAo+IGZ1bGwgYmVjYXVzZSB5b3UgaGF2ZSBqdXN0IGZyZWVkIHVwIGF0IGxlYXN0IG9uZSBlbnRy
eS4KPgoKTWFrZXMgc2Vuc2UsIEknbGwgc2VlIHdoYXQgSSBjYW4gZG8uCgpCYXJ0b3N6CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
