Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E721AC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 13:06:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACCEB227C3
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 13:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACCEB227C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eMtFoskK30898oMuu3YOoGTeXrJ3euHphuqCE8xQHjk=; b=niFYmTobQOeQfCzfaboCO029f
	7vo9fHIsg6quH8i/gwouiBz4Hcf+hNG5YTbNIxHot9Ra9c78Z9c2dT9va/RUQQm2RgJNYBY0Ow8tX
	VhuNwIopIM3eTErMOrUCo6OtJuLX2ySl8JQXsrnAQTfPWftN03jolm1CLjXJF/5XstVfsUGDeohmS
	mJv/KynSiom1upYqsc6d2C5PcuuOQSZjLRPfUbeoOWmdw7KA5ZI8On6aIQq7VtNNIfWIf0PCWFkwF
	C/3HmomV3hnWSNfZTBi8rLY6O8KotvaJVUFOQflt1sSVez/rC+9GsOCRIrVmahQ4P2jcbUC9O1xuF
	YVSJtQvxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kywtR-0007te-2f; Mon, 11 Jan 2021 13:05:57 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kywtO-0007sj-Mu; Mon, 11 Jan 2021 13:05:55 +0000
Received: by mail-oi1-x22b.google.com with SMTP id w124so20038893oia.6;
 Mon, 11 Jan 2021 05:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=32AMbD7JqvqTfJOA6mRlZcATxY9GlJ290keV9DKYi+U=;
 b=vbavSgfTX5r4VBBQ1t8Rd07gUOcwgaEfa6MNLKd2ZpZVeAfq4hXNUIs04fPddsxEqf
 xEbYuZp6cuiwyB791fKV0/6sXkfJZXML0shJduwRXmw6LzB3SQgYa7TPL5i8fWIXUZ4v
 XKjic147rn8oinoh7mK2VVqxA5w/tpR1ZoUVSaf9OqHp7U4GOqyXT4TS/BXfOYLakJsA
 B3JHPxwQZtJsr06gslGh7g0pyT4dy3KHzSXbSV+yor/Y7W9P0B5IZ5cwnTd17AuUtfL0
 IniEfnbXREVDWK0mLq+BxhjdFpWdQYrPG9mPkXETHCsGPKscgIi6oPkzaeDoZRmiVonc
 n8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=32AMbD7JqvqTfJOA6mRlZcATxY9GlJ290keV9DKYi+U=;
 b=lzQO89rPKS+o2oh6hAuYzcIaZyu9Zg67w6bRzVqlfYoSzVADtpYtLE7rD32tagDZts
 2xJNUlHRCseTQO9FCU1PNwa28+kscCklfOv/pUuyJAUd2dG1HBGvzm/FdXDtJ/hidkVu
 cnGpf9qDoazPbAdwT9Ex1eH3U4YwGDnDXy+UV+geVVy0pR86XtPteAmDiNvLYTAR1V9/
 wRqOrkqL7FLkCn046oRXAXCpdfec06xJX/bck2jofbXR5LVFPNUHKayQiegGol3g7HEf
 /2LYXvTtZAAZ/qKqZbrx4+XTDFSjM4TAo3x/uNFFonxLkGrQgLrmubEpniQN63cU3pyX
 ww4Q==
X-Gm-Message-State: AOAM531BTHnKfOjEDWED3KxC2+c9ffEZgwVA9+W89W1WDH8pZCaSZQTU
 D1MsinzkUv/KjPeZujbA/75LIMoRqv9HUQMsKRM=
X-Google-Smtp-Source: ABdhPJzguLowuko/yV4hNw+yFJ+Sm5NdnIJqP1kdJJLYyr1yI3lUtDVXhN6ed6MvPjHm53SEwGDFTuDWE4dv0PUO0aE=
X-Received: by 2002:aca:c492:: with SMTP id u140mr9920851oif.51.1610370352601; 
 Mon, 11 Jan 2021 05:05:52 -0800 (PST)
MIME-Version: 1.0
References: <20210111123518.30438-1-matthias.bgg@kernel.org>
In-Reply-To: <20210111123518.30438-1-matthias.bgg@kernel.org>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Mon, 11 Jan 2021 21:05:41 +0800
Message-ID: <CAE+NS35Br8jgLfii=VPjFx+m+9=a=EQKYyoQMAyd7Zdo0K6n+A@mail.gmail.com>
Subject: Re: [PATCH] mfd: mt6360: Fix MFD cell names and compatibles
To: matthias.bgg@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_080554_759654_CBE4679D 
X-CRM114-Status: GOOD (  17.68  )
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
Cc: Gene Chen <gene_chen@richtek.com>, Matthias Brugger <mbrugger@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ChiYuan Huang <cy_huang@richtek.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgTGVlLAoKVGhpcyBjaGFuZ2UgZXhpc3RzIGluIFtQQVRDSCB2NyAwMy8xMV0gbWZkOiBtdDYz
NjA6IEluZGljYXRlIHN1Yi1kZXYKY29tcGF0aWJsZSBuYW1lIGJ5IHVzaW5nICItIi4KRG9lcyBw
YXRjaCB2NyBhbHNvIG1lcmdlIHRvZ2V0aGVyIHRvIG1mZC1uZXh0PwoKPG1hdHRoaWFzLmJnZ0Br
ZXJuZWwub3JnPiDmlrwgMjAyMeW5tDHmnIgxMeaXpSDpgLHkuIAg5LiL5Y2IODozNeWvq+mBk++8
mgo+Cj4gRnJvbTogTWF0dGhpYXMgQnJ1Z2dlciA8bWJydWdnZXJAc3VzZS5jb20+Cj4KPiBNRkQg
Y2VsbCBuYW1lcyBhbmQgY29tcGF0aWJsZXMgdXNlICdfJyBpbnN0ZWFkIG9mICctJywgd2hpY2gg
aXMgY29tbW9uCj4gcHJhY3RpY2UgZm9yIG5hbWVzIGFuZCB0aGUgc3RhbmRhcmQgZm9yIERUIGNv
bXBhdGlibGVzLgo+IFRoaXMgd2lsbCBhbHNvIGZpeCB0aGUgcHJvYmluZyBmb3IgdGhlIGRyaXZl
cnMgYWxyZWFkeSBpbXBsZW1lbnRlZAo+IChtdDYzNjAtYWRjIGFuZCBtdDYzNjAtdGNwYykuCj4K
PiBGaXhlczogN2VkZDM2MzQyMWRhICgibWZkOiBBZGQgc3VwcG9ydCBmb3IgUE1JQyBNVDYzNjAi
KQo+IEZpeGVzOiAxZjQ4NzcyMThmN2UgKCJpaW86IGFkYzogbXQ2MzYwOiBBZGQgQURDIGRyaXZl
ciBmb3IgTVQ2MzYwIikKPiBGaXhlczogZTFhZWZjZGQzOTRmICgidXNiIHR5cGVjOiBtdDYzNjA6
IEFkZCBzdXBwb3J0IGZvciBtdDYzNjAgVHlwZS1DIGRyaXZlciIpCj4gU2lnbmVkLW9mZi1ieTog
TWF0dGhpYXMgQnJ1Z2dlciA8bWJydWdnZXJAc3VzZS5jb20+Cj4KPiAtLS0KPgo+ICBkcml2ZXJz
L21mZC9tdDYzNjAtY29yZS5jIHwgMjQgKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jIGIvZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUu
Ywo+IGluZGV4IDQ2NjFjMWIyOWE3Mi4uMTRlNjQ5ZmZlNTBmIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvbWZkL210NjM2MC1jb3JlLmMKPiArKysgYi9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jCj4g
QEAgLTI5MiwxOCArMjkyLDE4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVzb3VyY2UgbXQ2MzYw
X2xkb19yZXNvdXJjZXNbXSA9IHsKPiAgfTsKPgo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG1mZF9j
ZWxsIG10NjM2MF9kZXZzW10gPSB7Cj4gLSAgICAgICBPRl9NRkRfQ0VMTCgibXQ2MzYwX2FkYyIs
IG10NjM2MF9hZGNfcmVzb3VyY2VzLAo+IC0gICAgICAgICAgICAgICAgICAgTlVMTCwgMCwgMCwg
Im1lZGlhdGVrLG10NjM2MF9hZGMiKSwKPiAtICAgICAgIE9GX01GRF9DRUxMKCJtdDYzNjBfY2hn
IiwgbXQ2MzYwX2NoZ19yZXNvdXJjZXMsCj4gLSAgICAgICAgICAgICAgICAgICBOVUxMLCAwLCAw
LCAibWVkaWF0ZWssbXQ2MzYwX2NoZyIpLAo+IC0gICAgICAgT0ZfTUZEX0NFTEwoIm10NjM2MF9s
ZWQiLCBtdDYzNjBfbGVkX3Jlc291cmNlcywKPiAtICAgICAgICAgICAgICAgICAgIE5VTEwsIDAs
IDAsICJtZWRpYXRlayxtdDYzNjBfbGVkIiksCj4gLSAgICAgICBPRl9NRkRfQ0VMTCgibXQ2MzYw
X3BtaWMiLCBtdDYzNjBfcG1pY19yZXNvdXJjZXMsCj4gLSAgICAgICAgICAgICAgICAgICBOVUxM
LCAwLCAwLCAibWVkaWF0ZWssbXQ2MzYwX3BtaWMiKSwKPiAtICAgICAgIE9GX01GRF9DRUxMKCJt
dDYzNjBfbGRvIiwgbXQ2MzYwX2xkb19yZXNvdXJjZXMsCj4gLSAgICAgICAgICAgICAgICAgICBO
VUxMLCAwLCAwLCAibWVkaWF0ZWssbXQ2MzYwX2xkbyIpLAo+IC0gICAgICAgT0ZfTUZEX0NFTEwo
Im10NjM2MF90Y3BjIiwgTlVMTCwKPiAtICAgICAgICAgICAgICAgICAgIE5VTEwsIDAsIDAsICJt
ZWRpYXRlayxtdDYzNjBfdGNwYyIpLAo+ICsgICAgICAgT0ZfTUZEX0NFTEwoIm10NjM2MC1hZGMi
LCBtdDYzNjBfYWRjX3Jlc291cmNlcywKPiArICAgICAgICAgICAgICAgICAgIE5VTEwsIDAsIDAs
ICJtZWRpYXRlayxtdDYzNjAtYWRjIiksCj4gKyAgICAgICBPRl9NRkRfQ0VMTCgibXQ2MzYwLWNo
ZyIsIG10NjM2MF9jaGdfcmVzb3VyY2VzLAo+ICsgICAgICAgICAgICAgICAgICAgTlVMTCwgMCwg
MCwgIm1lZGlhdGVrLG10NjM2MC1jaGciKSwKPiArICAgICAgIE9GX01GRF9DRUxMKCJtdDYzNjAt
bGVkIiwgbXQ2MzYwX2xlZF9yZXNvdXJjZXMsCj4gKyAgICAgICAgICAgICAgICAgICBOVUxMLCAw
LCAwLCAibWVkaWF0ZWssbXQ2MzYwLWxlZCIpLAo+ICsgICAgICAgT0ZfTUZEX0NFTEwoIm10NjM2
MC1wbWljIiwgbXQ2MzYwX3BtaWNfcmVzb3VyY2VzLAo+ICsgICAgICAgICAgICAgICAgICAgTlVM
TCwgMCwgMCwgIm1lZGlhdGVrLG10NjM2MC1wbWljIiksCj4gKyAgICAgICBPRl9NRkRfQ0VMTCgi
bXQ2MzYwLWxkbyIsIG10NjM2MF9sZG9fcmVzb3VyY2VzLAo+ICsgICAgICAgICAgICAgICAgICAg
TlVMTCwgMCwgMCwgIm1lZGlhdGVrLG10NjM2MC1sZG8iKSwKPiArICAgICAgIE9GX01GRF9DRUxM
KCJtdDYzNjAtdGNwYyIsIE5VTEwsCj4gKyAgICAgICAgICAgICAgICAgICBOVUxMLCAwLCAwLCAi
bWVkaWF0ZWssbXQ2MzYwLXRjcGMiKSwKPiAgfTsKPgo+ICBzdGF0aWMgY29uc3QgdW5zaWduZWQg
c2hvcnQgbXQ2MzYwX3NsYXZlX2FkZHJbTVQ2MzYwX1NMQVZFX01BWF0gPSB7Cj4gLS0KPiAyLjI5
LjIKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
