Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F88C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 12:31:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA3F360240
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 12:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA3F360240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ivusMLSBuL2W2Vz127eXzDhorqzqfxKrUVf6g6Nj9A=; b=aZY9llja4efyiW
	MDt745aHIYjGq63QA0kL/s7PpWxD0Woa58rj3UOc/OIZWa5vXKt2GzoezwvBYFM0pP7tdrnqG5Sjt
	GpLXq/GSa2h4ov0eBxAeYMrWEI2FLzRRa1cpmfvcC+W1Dhpsw8SorW5Q+kDStAqJ3ir/iiTziUXdy
	0mhxPCjBRONBUxy5oV1CXyF6/MLpPbb1ax7+H/GIBUVYXra2QpeUtfPhh7S3hYmsHY5gbad4S4ooU
	ycVCHn8ogCoJJSnDdCX9fCgYyGgFIZ1siIAd2JsvF6VHodwdoofqKjMN0JuVK/CxIBwlhHH5T8Sn3
	NggDv/qWLWzUaFS79i3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL2v5-002DvN-OC; Tue, 31 Aug 2021 12:31:15 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL2v3-002DuQ-Ec
 for linux-mediatek@lists.infradead.org; Tue, 31 Aug 2021 12:31:15 +0000
Received: from smtpclient.apple (p5b3d2185.dip0.t-ipconnect.de [91.61.33.133])
 by mail.holtmann.org (Postfix) with ESMTPSA id 0EDE0CECDA;
 Tue, 31 Aug 2021 14:31:06 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 1/2] Bluetooth: btusb: Support public address
 configuration for MediaTek Chip.
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <SL2PR03MB4457513693916CBA07BE450BB3CC9@SL2PR03MB4457.apcprd03.prod.outlook.com>
Date: Tue, 31 Aug 2021 14:31:05 +0200
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 Sean Wang <Sean.Wang@mediatek.com>,
 "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "michaelfsun@google.com" <michaelfsun@google.com>,
 "mcchou@chromium.org" <mcchou@chromium.org>
Message-Id: <51A4788D-DDFD-4700-9D50-84F37ADD4883@holtmann.org>
References: <20210824154430.27689-1-mark-yw.chen@mediatek.com>
 <CF258C9C-BB3C-4C10-88B0-F6F3A03303D5@holtmann.org>
 <SL2PR03MB4457513693916CBA07BE450BB3CC9@SL2PR03MB4457.apcprd03.prod.outlook.com>
To: =?utf-8?B?Ik1hcmstWVcgQ2hlbiAo6Zmz5o+a5paHKSI=?=
 <Mark-YW.Chen@mediatek.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_053113_678538_9C481269 
X-CRM114-Status: GOOD (  11.00  )
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

SGkgTWFyaywKCj4+PiBUaGUgTWVkaWFUZWsgY2hpcCBzdXBwb3J0IHZlbmRvciBzcGVjaWZpYyBI
Q0kgY29tbWFuZCgweGZjMWEpIHRvCj4+PiBjaGFuZ2UgdGhlIHB1YmxpYyBhZGRyZXNzLiBBZGQg
aGRldi0+c2V0X2JkYWRkciBoYW5kbGVyIGZvciBNZWRpYVRlawo+Pj4gQ2hpcC4KPj4+IAo+Pj4g
U2lnbmVkLW9mZi1ieTogbWFyay15dy5jaGVuIDxtYXJrLXl3LmNoZW5AbWVkaWF0ZWsuY29tPgo+
Pj4gLS0tCj4+PiBkcml2ZXJzL2JsdWV0b290aC9idHVzYi5jIHwgMTggKysrKysrKysrKysrKysr
KysrCj4+PiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQo+Pj4gCj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ibHVldG9vdGgvYnR1c2IuYyBiL2RyaXZlcnMvYmx1ZXRvb3RoL2J0dXNi
LmMKPj4+IGluZGV4IDYwZDJmY2U1OWE3MS4uNDFlN2M5ZjI4ZDgyIDEwMDY0NAo+Pj4gLS0tIGEv
ZHJpdmVycy9ibHVldG9vdGgvYnR1c2IuYwo+Pj4gKysrIGIvZHJpdmVycy9ibHVldG9vdGgvYnR1
c2IuYwo+Pj4gQEAgLTIyMDAsNiArMjIwMCwyMyBAQCBzdHJ1Y3QgYnRtdGtfc2VjdGlvbl9tYXAg
ewo+Pj4gCX07Cj4+PiB9IF9fcGFja2VkOwo+Pj4gCj4+PiArc3RhdGljIGludCBidHVzYl9zZXRf
YmRhZGRyX210ayhzdHJ1Y3QgaGNpX2RldiAqaGRldiwgY29uc3QgYmRhZGRyX3QKPj4+ICsqYmRh
ZGRyKSB7Cj4+PiArCXN0cnVjdCBza19idWZmICpza2I7Cj4+PiArCWxvbmcgcmV0Owo+Pj4gKwo+
Pj4gKwlza2IgPSBfX2hjaV9jbWRfc3luYyhoZGV2LCAweGZjMWEsIHNpemVvZihiZGFkZHIpLCBi
ZGFkZHIsCj4+IEhDSV9JTklUX1RJTUVPVVQpOwo+Pj4gKwlpZiAoSVNfRVJSKHNrYikpIHsKPj4+
ICsJCXJldCA9IFBUUl9FUlIoc2tiKTsKPj4+ICsJCWJ0X2Rldl9lcnIoaGRldiwgImNoYW5naW5n
IE1lZGlhdGVrIGRldmljZSBhZGRyZXNzIGZhaWxlZAo+PiAoJWxkKSIsCj4+PiArCQkJICAgcmV0
KTsKPj4+ICsJCXJldHVybiByZXQ7Cj4+PiArCX0KPj4+ICsJa2ZyZWVfc2tiKHNrYik7Cj4+PiAr
Cj4+PiArCXJldHVybiAwOwo+Pj4gK30KPj4+ICsKPj4gCj4+IHRoaXMgaXMgbm90IGEgcGVybWFu
ZW50IGNoYW5nZSwgY29ycmVjdD8gTWVhbmluZyBhIHBvd2VyIGN5Y2xlIHdpbGwgYnJpbmcgYmFj
awo+PiB0aGUgb3JpZ2luYWwgQkRfQUREUj8KPj4gCj4gCj4gWWVzLCBpdCdzIG5vdCBhIHBlcm1h
bmVudCBjaGFuZ2UuCj4gQWZ0ZXIgZG9pbmcgYSBwb3dlciBjeWNsZSBvciBNZWRpYXRlayBzcGVj
aWZpYyBCbHVldG9vdGggcmVzZXQsIE1lZGlhdGVrIENoaXBzIHdpbGwgYnJpbmcgYmFjayB0aGUg
b3JpZ2luYWwgIEJEX0FERFJFU1MuCgpvaywgZ29vZC4gVGhlbiBwbGVhc2UgcmUtc3VibWl0IGFn
YWluc3QgbGF0ZXN0IGJsdWV0b290aC1uZXh0IHRyZWUuIFVuZm9ydHVuYXRlbHkgY3VycmVudCBw
YXRjaCBkb2VzbuKAmXQgYXBwbHkgYW55bW9yZS4KClJlZ2FyZHMKCk1hcmNlbAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
