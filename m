Return-Path: <SRS0=WnB0=5U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBFFBC2BA15
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Apr 2020 15:47:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A058E206C3
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Apr 2020 15:47:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gle4DS27";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="JmO/Vfwu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A058E206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3IMfDR3c+DumhkGK1ATfSCyV92kWAUv4dBg9flnHlnc=; b=Gle4DS27+mCzlB
	yft0P4Cuf7IbuE5GEIwVvmI/MoXJaDZyNaw73cjF4mC0Tog+i9jHypaZ2UZVoDK/vQGu11tgaMsCE
	dU+unjylNdbU572t4ff0lkrF/0qGgi5SJ4G9KIY6+y2aEj7OUvxnpoJqQGRc3HhBDFm405EpK2jD4
	6Jq6VcIIH1uitmVznn7+8A+e78vZXLSxOpxWg3dupTMoksHy/1gjPUq5Yo+FS8QxD9YXofCKnTtl0
	qEM4dDwvYkShEea7IvgaDQ/iYw+DmSrRb7ZmMZdBKsft6QBlC+oioLg7Dkpz9ViWokU9tYB46wk+r
	RivdYibzCZSzj6IET5vg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKl0g-0005Qe-Gg; Sat, 04 Apr 2020 15:47:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKl0Y-0005Hn-9o; Sat, 04 Apr 2020 15:46:55 +0000
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B0C9220787;
 Sat,  4 Apr 2020 15:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586015214;
 bh=WJRemwJCqzpDcI6pJ9JuFYK2/3qEZkXB/hThgp1+WDs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JmO/Vfwule7YlfedMUk0yMIkxxFIk36ZVfPzmmujhVE1MYQ5BkNLuSjR0x3466YVX
 CyFZlVgMrzNnlpdne2s0Mamh/wVfndPpFEJG7FpNx1c/VMPbPTqU2SL3oEkyda8MO3
 V1CcxEhS1uZ+eGOQuYhnc86uFNBh3gqOLcePHh+c=
Received: by mail-ed1-f50.google.com with SMTP id z65so13168777ede.0;
 Sat, 04 Apr 2020 08:46:53 -0700 (PDT)
X-Gm-Message-State: AGi0PuY8s/eAtcnm7ELmmfgeoSNA9NxmHUhaD15nRDFVOMp7OWlqcvxx
 GWPcR57zHkvO2Z0OIePCvHmDf7bD3JGL2RkZkQ==
X-Google-Smtp-Source: APiQypK7z+HsfAmBbW8fRL2j4biTCkMbLc7PDBmY54QJwJhjpBtAQh3RlWcMHGlQ9VeMeZHePyRCYJTqhyjeIPOpuk0=
X-Received: by 2002:a05:6402:335:: with SMTP id
 q21mr3140080edw.47.1586015212120; 
 Sat, 04 Apr 2020 08:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200331082725.81048-1-jitao.shi@mediatek.com>
 <20200331082725.81048-4-jitao.shi@mediatek.com>
In-Reply-To: <20200331082725.81048-4-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 4 Apr 2020 23:46:40 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9=uyfSYms_F=T8guvB9Bx9V=Pjo1TtmmfihMgSj1dt9Q@mail.gmail.com>
Message-ID: <CAAOTY_9=uyfSYms_F=T8guvB9Bx9V=Pjo1TtmmfihMgSj1dt9Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] drm/mediatek: add the mipitx driving control
To: Jitao Shi <jitao.shi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200404_084654_374108_523D27BD 
X-CRM114-Status: GOOD (  18.05  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>, cawa.cheng@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5
tDPmnIgzMeaXpSDpgLHkuowg5LiL5Y2INDoyOOWvq+mBk++8mgo+Cj4gQWRkIGEgcHJvcGVydHkg
aW4gZGV2aWNlIHRyZWUgdG8gY29udHJvbCB0aGUgZHJpdmluZyBieSBkaWZmZXJlbnQKPiBib2Fy
ZC4KClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4K
Cj4KPiBSZXZpZXdlZC1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbWlwaV90eC5jICAgICAgICB8IDE0
ICsrKysrKysrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbWlwaV90eC5o
ICAgICAgICB8ICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19tdDgxODNfbWlw
aV90eC5jIHwgIDcgKysrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX21pcGlfdHguYyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbWlwaV90eC5jCj4gaW5kZXggZTRkMzQ0ODRl
Y2M4Li5lMzAxYWY2NDgwOWUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19taXBpX3R4LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX21pcGlf
dHguYwo+IEBAIC0xMjUsNiArMTI1LDIwIEBAIHN0YXRpYyBpbnQgbXRrX21pcGlfdHhfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJl
dDsKPiAgICAgICAgIH0KPgo+ICsgICAgICAgcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIoZGV2
LT5vZl9ub2RlLCAiZHJpdmUtc3RyZW5ndGgtbWljcm9hbXAiLAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgJm1pcGlfdHgtPm1pcGl0eF9kcml2ZSk7Cj4gKyAgICAgICAvKiBJ
ZiBjYW4ndCBnZXQgdGhlICJtaXBpX3R4LT5taXBpdHhfZHJpdmUiLCBzZXQgaXQgZGVmYXVsdCAw
eDggKi8KPiArICAgICAgIGlmIChyZXQgPCAwKQo+ICsgICAgICAgICAgICAgICBtaXBpX3R4LT5t
aXBpdHhfZHJpdmUgPSA0NjAwOwo+ICsKPiArICAgICAgIC8qIGNoZWNrIHRoZSBtaXBpdHhfZHJp
dmUgdmFsaWQgKi8KPiArICAgICAgIGlmIChtaXBpX3R4LT5taXBpdHhfZHJpdmUgPiA2MDAwIHx8
IG1pcGlfdHgtPm1pcGl0eF9kcml2ZSA8IDMwMDApIHsKPiArICAgICAgICAgICAgICAgZGV2X3dh
cm4oZGV2LCAiZHJpdmUtc3RyZW5ndGgtbWljcm9hbXAgaXMgaW52YWxpZCAlZCwgbm90IGluIDMw
MDAgfiA2MDAwXG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICBtaXBpX3R4LT5taXBpdHhf
ZHJpdmUpOwo+ICsgICAgICAgICAgICAgICBtaXBpX3R4LT5taXBpdHhfZHJpdmUgPSBjbGFtcF92
YWwobWlwaV90eC0+bWlwaXR4X2RyaXZlLCAzMDAwLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgNjAwMCk7Cj4gKyAgICAgICB9Cj4gKwo+ICAgICAg
ICAgcmVmX2Nsa19uYW1lID0gX19jbGtfZ2V0X25hbWUocmVmX2Nsayk7Cj4KPiAgICAgICAgIHJl
dCA9IG9mX3Byb3BlcnR5X3JlYWRfc3RyaW5nKGRldi0+b2Zfbm9kZSwgImNsb2NrLW91dHB1dC1u
YW1lcyIsCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbWlwaV90
eC5oIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19taXBpX3R4LmgKPiBpbmRleCA0MTNm
MzVkODYyMTkuLmVlYTQ0MzI3ZmU5ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX21pcGlfdHguaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
bWlwaV90eC5oCj4gQEAgLTI3LDYgKzI3LDcgQEAgc3RydWN0IG10a19taXBpX3R4IHsKPiAgICAg
ICAgIHN0cnVjdCBkZXZpY2UgKmRldjsKPiAgICAgICAgIHZvaWQgX19pb21lbSAqcmVnczsKPiAg
ICAgICAgIHUzMiBkYXRhX3JhdGU7Cj4gKyAgICAgICB1MzIgbWlwaXR4X2RyaXZlOwo+ICAgICAg
ICAgY29uc3Qgc3RydWN0IG10a19taXBpdHhfZGF0YSAqZHJpdmVyX2RhdGE7Cj4gICAgICAgICBz
dHJ1Y3QgY2xrX2h3IHBsbF9odzsKPiAgICAgICAgIHN0cnVjdCBjbGsgKnBsbDsKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19tdDgxODNfbWlwaV90eC5jIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19tdDgxODNfbWlwaV90eC5jCj4gaW5kZXggOTFmMDhh
MzUxZmQwLi5lNGNjOTY3NzUwY2IgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19tdDgxODNfbWlwaV90eC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19tdDgxODNfbWlwaV90eC5jCj4gQEAgLTE3LDYgKzE3LDkgQEAKPiAgI2RlZmluZSBSR19E
U0lfQkdfQ09SRV9FTiAgICAgICAgICAgICAgQklUKDcpCj4gICNkZWZpbmUgUkdfRFNJX1BBRF9U
SUVMX1NFTCAgICAgICAgICAgIEJJVCg4KQo+Cj4gKyNkZWZpbmUgTUlQSVRYX1ZPTFRBR0VfU0VM
ICAgICAweDAwMTAKPiArI2RlZmluZSBSR19EU0lfSFNUWF9MRE9fUkVGX1NFTCAgICAgICAgICAg
ICAgICAoMHhmIDw8IDYpCj4gKwo+ICAjZGVmaW5lIE1JUElUWF9QTExfUFdSICAgICAgICAgMHgw
MDI4Cj4gICNkZWZpbmUgTUlQSVRYX1BMTF9DT04wICAgICAgICAgICAgICAgIDB4MDAyYwo+ICAj
ZGVmaW5lIE1JUElUWF9QTExfQ09OMSAgICAgICAgICAgICAgICAweDAwMzAKPiBAQCAtMTIzLDYg
KzEyNiwxMCBAQCBzdGF0aWMgdm9pZCBtdGtfbWlwaV90eF9wb3dlcl9vbl9zaWduYWwoc3RydWN0
IHBoeSAqcGh5KQo+ICAgICAgICAgbXRrX21pcGlfdHhfY2xlYXJfYml0cyhtaXBpX3R4LCBNSVBJ
VFhfRDNfU1dfQ1RMX0VOLCBEU0lfU1dfQ1RMX0VOKTsKPiAgICAgICAgIG10a19taXBpX3R4X2Ns
ZWFyX2JpdHMobWlwaV90eCwgTUlQSVRYX0NLX1NXX0NUTF9FTiwgRFNJX1NXX0NUTF9FTik7Cj4K
PiArICAgICAgIG10a19taXBpX3R4X3VwZGF0ZV9iaXRzKG1pcGlfdHgsIE1JUElUWF9WT0xUQUdF
X1NFTCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFJHX0RTSV9IU1RYX0xET19S
RUZfU0VMLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKG1pcGlfdHgtPm1pcGl0
eF9kcml2ZSAtIDMwMDApIC8gMjAwIDw8IDYpOwo+ICsKPiAgICAgICAgIG10a19taXBpX3R4X3Nl
dF9iaXRzKG1pcGlfdHgsIE1JUElUWF9DS19DS01PREVfRU4sIERTSV9DS19DS01PREVfRU4pOwo+
ICB9Cj4KPiAtLQo+IDIuMjEuMAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
