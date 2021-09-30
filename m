Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0771EC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 13:38:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6A7B6136A
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 13:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6A7B6136A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=72Ni/Km4nQrdlY36C4jPDv0kbos72Ahx6fQdezxiwvU=; b=qVyf+vVRDZ8oQT
	xZhKF7POpKTL/A5WHkw7lAUv2HS/697M8MfY3FA1oVfS8bhn2HY8qcWY+rPD0H4Dlw+zrkf+h+jBP
	6zwNb0gqmpPv5qj4yDLeu5isGjqiickDstOc4Xz9hNPcKnSzwqMNyIHDHwhrE66kcmhr5KwNR1x17
	eLCrOM37JG8gb8Y+gox9IeUS+Y78t4WkJnMEDH1tmw2kO7eyB/XaBBcmHCjfRzMXJPfuzGDHQ4DB5
	bluzXKZHL5bvBzRjyh0OUGgSpYxmJcjGDkxDLgrV/uxBGOoFU0A+ilDd+DLAuEzqsP+pQaroof7Gr
	7oe8h8nDxrzRDNHu5jww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVwG2-00EX4E-N3; Thu, 30 Sep 2021 13:37:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVwFT-00EWrw-4Q; Thu, 30 Sep 2021 13:37:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B5EAE61211;
 Thu, 30 Sep 2021 13:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633009038;
 bh=QYlLL3GDBPrVtkL8isJVyF2sdgxesbQ3gmGxtfmFI40=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sC49Wc0f3dRgeawqjDFy5eptV2aXdrCeTrYnmRJhsMpWUXhT1sTlwULeZb/6SxErp
 j1Ue71E0jVQEJGAOPo9ZVXcz//r9Rwd092n5YCkgtJ0lDf1+a7lZa8qJgOa2zAuCTR
 o92JMs6I588PloSXUlMtVzkcn9KK20yAxHo2pw2c51LOyKdQQ5DzSYmXewp0g5cGzC
 fmNcESn5APGOxInOrKQTzQMYuiM0Uo4dhDniARrkWK6DIbHaTJ3G+dkcCboijaBC4/
 kyCKDpFMPd7rsK6Jn4Mwi8Sp3mBmAXqZzmpxuwdB2C3eEq480o/qDA523e02m3y5Wp
 Ik1eWtkTdvqDw==
Received: by mail-ed1-f50.google.com with SMTP id v18so21972554edc.11;
 Thu, 30 Sep 2021 06:37:18 -0700 (PDT)
X-Gm-Message-State: AOAM5308vcZYt8k0kG20ERc8vXYU2hR0ItXtJ09zG6NFcM2kICx7S/IA
 vxv+X2H+5wy3/Z1J+vLC1SSI3J0TdYTJJ7IlQw==
X-Google-Smtp-Source: ABdhPJypDb2VkWrdf3paMX9Tqzf51KNdYw6dumy+pE04VPMjkYX0wM15CC9zyo395rIQ9HHurwSkXhmuwWRQT+vaaEg=
X-Received: by 2002:a17:906:3181:: with SMTP id
 1mr7127794ejy.388.1633009013939; 
 Thu, 30 Sep 2021 06:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210929094425.745-1-granquet@baylibre.com>
 <20210929094425.745-5-granquet@baylibre.com>
In-Reply-To: <20210929094425.745-5-granquet@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 30 Sep 2021 21:36:42 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9tWULx768c9pgnarVj6V1x6d5ZA9U2-hJ3+k2BW+vrAg@mail.gmail.com>
Message-ID: <CAAOTY_9tWULx768c9pgnarVj6V1x6d5ZA9U2-hJ3+k2BW+vrAg@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] drm/mediatek: add mt8195 hdmi TX support
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_063719_233142_4274C4D3 
X-CRM114-Status: GOOD (  23.39  )
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

SGksIEd1aWxsYXVtZToKClRoaXMgaXMgYSBiaWcgcGF0Y2gsIGFuZCBJJ20gbm90IGZhbWlsaWFy
IHdpdGggdGhpcyBkcml2ZXIsIHNvIHRoZQpyZXZpZXcgcHJvY2VzcyB3b3VsZCBiZSBsb25nLiBT
byBJIHRlbGwgeW91IGFib3V0IGhvdyBJIHJldmlldyB0aGlzCnBhdGNoLCBhbmQgaWYgeW91IGNv
dWxkIHByb2Nlc3MgYWNjb3JkaW5nIHRvIG15IHdheSwgdGhlIHByb2Nlc3Mgd291bGQKYmUgbW9y
ZSBzaG9ydC4KCjEuIEZpbmQgdGhlIGNvbW1vbiBwYXJ0IG9mIGFsbCBoZG1pIGRyaXZlci4KRXZl
biB0aG91Z2ggbXQ4MTk1IGhkbWkgaGFzIG1hbnkgZGlmZmVyZW5jZSB3aXRoIG90aGVyIG1lZGlh
dGVrIHNvYwpoZG1pIGRyaXZlciwgSSB3b3VsZCBsaWtlIHRvIGZpbmQgdGhlIGNvbW1vbiBwYXJ0
IGFuZCBoYXZlIGp1c3Qgb25lCmNvcHkgb2YgdGhlIGNvbW1vbiBwYXJ0LiBJIGV4cGVjdCB0aGVy
ZSB3b3VsZCB0aHJlZSBmaWxlIGZpbmFsbHk6CgptdGtfaGRtaS5jICAgICAgICAgICAgICAgKHRo
ZSBjb21tb24gcGFydCkKbXRrX2hkbWlfbXQ4MTczLmMgKGVhY2ggc29jIHNwZWNpYWwgcGFydCkK
bXRrX2hkbWlfbXQ4MTk1LmMgKGVhY2ggc29jIHNwZWNpYWwgcGFydCkKCkJ1dCB0aGlzIHdvdWxk
IGJlIGRpZmZpY3VsdCBpbiB0aGlzIHN0YWdlLCBzbyB5b3UgY291bGQgdGVtcG9yYXJpbHkKaGF2
ZSB0aGVzZSB0aHJlZSBmaWxlOgoKbXRrX2hkbWlfY29tbW9uLmMgKHRoZSBjb21tb24gcGFydCkK
bXRrX2hkbWkuYyAgICAgICAgICAgICAgICAgKGVhY2ggc29jIHNwZWNpYWwgcGFydCkKbXRrX2hk
bWlfbXQ4MTk1LmMgICAoZWFjaCBzb2Mgc3BlY2lhbCBwYXJ0KQoKV2hlbiByZXZpZXcgaXMgYWxt
b3N0IGRvbmUsIHRoZW4gY2hhbmdlIHRoZSBmaWxlIG5hbWUgYXMgSSB3aXNoLgoKMi4gVGhlIGZp
cnN0IHBhdGNoIGhhcyBvbmx5IGJhc2ljIGZ1bmN0aW9uLCBzZXBhcmF0ZSBhZHZhbmNlIGZ1bmN0
aW9uCnRvIGFub3RoZXIgcGF0Y2guCldoZW4gY29tcGFyaW5nIG10ODE5NSBoZG1pIGRyaXZlciB3
aXRoIG90aGVyIGhkbWkgZHJpdmVyLCBpZiBtdDgxOTUKaGRtaSBkcml2ZXIgaGFzIHNvbWUgZnVu
Y3Rpb24gdGhhdCBvdGhlciBoZG1pIGRvZXMgbm90IGhhdmUsIEkgd291bGQKdGhpbmsgdGhhdCBm
dW5jdGlvbiBpcyBhZHZhbmNlIGZ1bmN0aW9uIGFuZCBzaG91bGQgYmUgc2VwYXJhdGUgdG8KYW5v
dGhlciBwYXRjaC4KCklmIHlvdSBmb2xsb3cgdGhpcyB3YXksIEkgdGhpbmsgdGhlIHJldmlldyBw
cm9jZXNzIHdvdWxkIGJlIHNob3J0LgpCZWNhdXNlIHRoaXMgcGF0Y2ggaXMgYmlnLCBJIHdvdWxk
IGp1c3QgcmV2aWV3IHBhcnRpYWwgcGFydCBlYWNoIHRpbWUuCgpSZWdhcmRzLApDaHVuLUt1YW5n
LgoKCkd1aWxsYXVtZSBSYW5xdWV0IDxncmFucXVldEBiYXlsaWJyZS5jb20+IOaWvCAyMDIx5bm0
OeaciDI55pelIOmAseS4iSDkuIvljYg1OjQ35a+r6YGT77yaCj4KPiBBZGQgYmFzaWMgaGRtaSBU
WCBzdXBwb3J0IGZvciB0aGUgbWVkaWF0ZWsgbXQ4MTk1IFNvQ3MKPgo+IFNpZ25lZC1vZmYtYnk6
IEd1aWxsYXVtZSBSYW5xdWV0IDxncmFucXVldEBiYXlsaWJyZS5jb20+Cj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnICAgICAgICAgICAgICB8ICAgMTAgKwo+ICBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgICAgICAgfCAgICA0ICstCj4gIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQ4MTk1X2hkbWkuYyAgICB8IDIyOTMgKysrKysr
KysrKysrKysrKysKPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19tdDgxOTVfaGRtaS5o
ICAgIHwgIDEyOCArCj4gIC4uLi9ncHUvZHJtL21lZGlhdGVrL210a19tdDgxOTVfaGRtaV9kZGMu
YyAgICB8ICA1MzAgKysrKwo+ICAuLi4vZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQ4MTk1X2hkbWlf
ZGRjLmggICAgfCAgIDIwICsKPiAgLi4uL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210ODE5NV9oZG1p
X3JlZ3MuaCAgIHwgIDMyOSArKysKPiAgNyBmaWxlcyBjaGFuZ2VkLCAzMzEzIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfbXQ4MTk1X2hkbWkuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19tdDgxOTVfaGRtaS5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210ODE5NV9oZG1pX2RkYy5jCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210ODE5NV9oZG1pX2RkYy5o
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210ODE5
NV9oZG1pX3JlZ3MuaAo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9L
Y29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcKPiBpbmRleCAyOTc2ZDIx
ZTlhMzRhLi41MTdkMDY1ZjA1MTFiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcKPiBA
QCAtMjgsMyArMjgsMTMgQEAgY29uZmlnIERSTV9NRURJQVRFS19IRE1JCj4gICAgICAgICBzZWxl
Y3QgUEhZX01US19IRE1JCj4gICAgICAgICBoZWxwCj4gICAgICAgICAgIERSTS9LTVMgSERNSSBk
cml2ZXIgZm9yIE1lZGlhdGVrIFNvQ3MKPiArCj4gK2NvbmZpZyBEUk1fTUVESUFURUtfSERNSV9N
VDgxOTVfU1VTUEVORF9MT1dfUE9XRVIKPiArICAgICAgIHRyaXN0YXRlICJEUk0gSERNSSBTVVNQ
RU5EIExPVyBQT1dFUiBTdXBwb3J0IGZvciBNZWRpYXRlayBtdDgxOTUgU29DcyIKPiArICAgICAg
IGRlcGVuZHMgb24gRFJNX01FRElBVEVLX0hETUkKPiArICAgICAgIGhlbHAKPiArICAgICAgICAg
RFJNL0tNUyBIRE1JIFNVU1BFTkRfTE9XX1BPV0VSIGZvciBNZWRpYXRlayBTb0NzLgo+ICsgICAg
ICAgICBDaG9vc2UgdGhpcyBvcHRpb24gaWYgeW91IHdhbnQgdG8gZGlzYWJsZS9lbmFibGUKPiAr
ICAgICAgICAgY2xvY2sgYW5kIHBvd2VyIGRvbWFpbiB3aGVuIHBsYXRmb3JtIGVudGVyIHN1c3Bl
bmQsCj4gKyAgICAgICAgIGFuZCB0aGlzIGNvbmZpZyBkZXBlbmRzIG9uIERSTV9NRURJQVRFS19I
RE1JLgo+ICsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxl
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxlCj4gaW5kZXggMjkwOThkN2M4MzA3
Yy4uNzM2ZjA4MTYwODNkMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
TWFrZWZpbGUKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFrZWZpbGUKPiBAQCAt
MTgsNiArMTgsOCBAQCBvYmotJChDT05GSUdfRFJNX01FRElBVEVLKSArPSBtZWRpYXRlay1kcm0u
bwo+Cj4gIG1lZGlhdGVrLWRybS1oZG1pLW9ianMgOj0gbXRrX2NlYy5vIFwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgIG10a19oZG1pLm8gXAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
bXRrX2hkbWlfZGRjLm8KPiArICAgICAgICAgICAgICAgICAgICAgICAgIG10a19oZG1pX2RkYy5v
IFwKPiArICAgICAgICAgICAgICAgICAgICAgICAgIG10a19tdDgxOTVfaGRtaS5vIFwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgIG10a19tdDgxOTVfaGRtaV9kZGMubyBcCj4KPiAgb2JqLSQo
Q09ORklHX0RSTV9NRURJQVRFS19IRE1JKSArPSBtZWRpYXRlay1kcm0taGRtaS5vCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQ4MTk1X2hkbWkuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQ4MTk1X2hkbWkuYwo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwMC4uNDZjN2M4YWY1MjRhYwo+IC0tLSAvZGV2L251bGwK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
