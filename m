Return-Path: <SRS0=DVVK=FE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A66C64E90
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 23:52:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 985A3207F7
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 23:52:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HZeaNjyv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="dNj7TJbK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 985A3207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EMEp6xDHBnK45VbuCypvsD186atkBCpnoPgyS/4Rps4=; b=HZeaNjyv+GLDxKK1O5v65eNMl
	x7FHmExA6pV+YrywZUIcJx0dZ1xOIBMXffMoJhdvYzuBA+m9dKRGYgj+Cl/yjEGiwXtutjbqcp9XG
	k6wx728LuedT8SAAXw3juXV7H53/8H4eJ4W2xXCgV1iTjFLuLQ4BihiDhRSdUKMg+LrgiDXIIdOze
	vePPeB6kXItPnnArxNJGZpuwfE+5sWKO1K8sNZZ8EI1KDgJv3VKkD9jxgy8DSz4awDA9PrFujvLqW
	vrYMIizGLXugKX8ZI3oTkWMvdTs8kIbeajQ0dzH4ds8FMawIW1sFFbehs+hEupGHqmvYLTjuYYi/G
	dLhK3lHRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjsyH-0004Cb-U9; Mon, 30 Nov 2020 23:52:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjsyE-0004By-9L
 for linux-mediatek@lists.infradead.org; Mon, 30 Nov 2020 23:52:40 +0000
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 52692207BB
 for <linux-mediatek@lists.infradead.org>; Mon, 30 Nov 2020 23:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606780357;
 bh=LOcDmEiyyubx/sa5xPQL50c/I/K8W1HaHNV8Uul68mQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dNj7TJbKhID1Xs/xydwREyDy++lk3c66UpQ9nenMjBgVAZklTTxj4hwai5UU2hyCG
 NC1fRKZMdi5Z2Nfnvr5pDA0spuBFCfl3KGaG2py0Sh1WN4hLeb0nOliyNCmn7q8Pxv
 NKMC+qpgJPSgjc+0ai+37qlDgeCMuL6GSnKRsHAQ=
Received: by mail-ej1-f42.google.com with SMTP id lt17so86833ejb.3
 for <linux-mediatek@lists.infradead.org>; Mon, 30 Nov 2020 15:52:37 -0800 (PST)
X-Gm-Message-State: AOAM531LeI2ZEedVZWPATHyj9UkFI1HuswXvjHy09hDveCCvHAatfhh0
 vq6dv4c1QQIihRfnmnzUC4xPBmkvFfzLxC7T0Q==
X-Google-Smtp-Source: ABdhPJxLHGWiMBURVIYQ+sMpozodVYSe0HYY+kVtzCaQRyTVwhikE19JU0xGxYI9Iv7ONDN2K4eox7/KpzJTeRjobyU=
X-Received: by 2002:a17:906:a106:: with SMTP id t6mr284369ejy.63.1606780355813; 
 Mon, 30 Nov 2020 15:52:35 -0800 (PST)
MIME-Version: 1.0
References: <20201129004351.16212-1-chunkuang.hu@kernel.org>
In-Reply-To: <20201129004351.16212-1-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 1 Dec 2020 07:52:24 +0800
X-Gmail-Original-Message-ID: <CAAOTY__xO7F3br1GVFpvsuSW8nqrOoFm1YEWvkRoBkh9PquwRQ@mail.gmail.com>
Message-ID: <CAAOTY__xO7F3br1GVFpvsuSW8nqrOoFm1YEWvkRoBkh9PquwRQ@mail.gmail.com>
Subject: Re: [GIT PULL] mediatek drm next for 5.11
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_185238_494553_9B7DCBFD 
X-CRM114-Status: GOOD (  19.44  )
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Lee Jones <lee.jones@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIERhdmUgJiBEYW5pZWw6CgpJJ3ZlIHNlbmQgYW5vdGhlciBwdWxsIHJlcXVlc3QgIm1lZGlh
dGVrIGRybSBuZXh0IGZvciA1LjExLTIiIHdoaWNoCmluY2x1ZGUgdGhpcyBhbmQgYWRkIG1vcmUg
cGF0Y2hlcywgc28geW91IGNvdWxkIGRpcmVjdGx5IHB1bGwgdGhhdApyZXF1ZXN0IGFuZCBpZ25v
cmUgdGhpcy4KClsxXSBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmkt
ZGV2ZWwvMjAyMC1Ob3ZlbWJlci8yODk2ODYuaHRtbAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCkNo
dW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPiDmlrwgMjAyMOW5tDEx5pyIMjnm
l6Ug6YCx5pelIOS4iuWNiDg6NDTlr6vpgZPvvJoKPgo+IEhpLCBEYXZlICYgRGFuaWVsOgo+Cj4g
VGhpcyBpbmNsdWRlczoKPgo+IDEuIEFkZCBNVDgxNjcgc3VwcG9ydAo+IDIuIENsZWFudXAgZnVu
Y3Rpb24KPiAzLiBDb252ZXJ0IHRoZSBkcGkgYmluZGluZ3MgdG8geWFtbAo+IDQuIERyb3AgbG9j
YWwgZG1hX3Bhcm1zCj4gNS4gRml4IGZvcm1hdHRpbmcgYW5kIHByb3ZpZGUgbWlzc2luZyBtZW1i
ZXIgZGVzY3JpcHRpb24KPiA2LiBJbnRyb2R1Y2UgR0VNIG9iamVjdCBmdW5jdGlvbnMKPiA3LiBG
aXggYWxpYXNlcyBuYW1lCj4KPiBSZWdhcmRzLAo+IENodW4tS3VhbmcuCj4KPiBUaGUgZm9sbG93
aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDM2NTBiMjI4ZjgzYWRkYTdlNWVlNTMyZTJiOTA0Mjlj
MDNmN2I5ZWM6Cj4KPiAgIExpbnV4IDUuMTAtcmMxICgyMDIwLTEwLTI1IDE1OjE0OjExIC0wNzAw
KQo+Cj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4KPiAgIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9s
aW51eC5naXQgdGFncy9tZWRpYXRlay1kcm0tbmV4dC01LjExCj4KPiBmb3IgeW91IHRvIGZldGNo
IGNoYW5nZXMgdXAgdG8gNDE0NTYyYjBlZjM2Y2U2NThmMGZmZWMwMGU3MDM5Yzc5MTFlNGNkYzoK
Pgo+ICAgZHJtL21lZGlhdGVrOiBVc2UgY29ycmVjdCBhbGlhc2VzIG5hbWUgZm9yIG92bCAoMjAy
MC0xMS0yOCAxNjo1Njo1NSArMDgwMCkKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBNZWRpYXRlayBEUk0gTmV4dCBm
b3IgTGludXggNS4xMQo+Cj4gMS4gQWRkIE1UODE2NyBzdXBwb3J0Cj4gMi4gQ2xlYW51cCBmdW5j
dGlvbgo+IDMuIENvbnZlcnQgdGhlIGRwaSBiaW5kaW5ncyB0byB5YW1sCj4gNC4gRHJvcCBsb2Nh
bCBkbWFfcGFybXMKPiA1LiBGaXggZm9ybWF0dGluZyBhbmQgcHJvdmlkZSBtaXNzaW5nIG1lbWJl
ciBkZXNjcmlwdGlvbgo+IDYuIEludHJvZHVjZSBHRU0gb2JqZWN0IGZ1bmN0aW9ucwo+IDcuIEZp
eCBhbGlhc2VzIG5hbWUKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBCZXJuYXJkIFpoYW8gKDEpOgo+ICAgICAgIGRy
bS9tZWRpYXRlazogT3B0aW1pemUgZnVuY3Rpb25zIHdoaWNoIGRvIG5vdCBuZWVkIHRvIHJldHVy
bgo+Cj4gRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSAoMSk6Cj4gICAgICAgZHJtL21lZGlhdGVrOiBV
c2UgY29ycmVjdCBhbGlhc2VzIG5hbWUgZm9yIG92bAo+Cj4gRmFiaWVuIFBhcmVudCAoMyk6Cj4g
ICAgICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IG1lZGlhdGVrOiBkaXNwOiBhZGQgZG9jdW1lbnRh
dGlvbiBmb3IgTVQ4MTY3IFNvQwo+ICAgICAgIGRybS9tZWRpYXRlazogQWRkIGRpc3AtY29sb3Ig
TVQ4MTY3IHN1cHBvcnQKPiAgICAgICBkcm0vbWVkaWF0ZWs6IEFkZCBERFAgc3VwcG9ydCBmb3Ig
TVQ4MTY3Cj4KPiBKaXRhbyBTaGkgKDEpOgo+ICAgICAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBt
ZWRpYXRlazogY29udmVydCB0aGUgZHBpIGJpbmRpbmdzIHRvIHlhbWwKPgo+IExlZSBKb25lcyAo
NCk6Cj4gICAgICAgZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWE6IEZpeCBmb3JtYXR0aW5nIGFu
ZCBzdXBwbHkgbWlzc2luZyBzdHJ1Y3QgbWVtYmVyIGRlc2NyaXB0aW9uCj4gICAgICAgZHJtL21l
ZGlhdGVrL210a19kcm1fZHJ2OiBTdGF0aWNpc2UgbG9jYWwgZnVuY3Rpb24gaW52b2tlZCBieSBy
ZWZlcmVuY2UKPiAgICAgICBkcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY29sb3I6IEZpeCBmb3JtYXR0
aW5nIGFuZCBwcm92aWRlIG1pc3NpbmcgbWVtYmVyIGRlc2NyaXB0aW9uCj4gICAgICAgZHJtL21l
ZGlhdGVrL210a19kaXNwX292bDogRml4IGZvcm1hdHRpbmcgYW5kIHByb3ZpZGUgbWlzc2luZyBt
ZW1iZXIgZGVzY3JpcHRpb24KPgo+IFJvYmluIE11cnBoeSAoMSk6Cj4gICAgICAgZHJtL21lZGlh
dGVrOiBEcm9wIGxvY2FsIGRtYV9wYXJtcwo+Cj4gVGhvbWFzIFppbW1lcm1hbm4gKDEpOgo+ICAg
ICAgIGRybS9tZWRpYXRlazogSW50cm9kdWNlIEdFTSBvYmplY3QgZnVuY3Rpb25zCj4KPiAgLi4u
L2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgICAgfCAgNCArLQo+
ICAuLi4vYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGkudHh0ICAgICB8IDQy
IC0tLS0tLS0tLS0KPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHBp
LnlhbWwgICAgfCA5OCArKysrKysrKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZGlzcF9jb2xvci5jICAgICAgICAgIHwgMTIgKystCj4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyAgICAgICAgICAgIHwgIDUgKy0KPiAgZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYyAgICAgICAgICAgfCAgNSArLQo+ICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyAgICAgICAgICAgICB8IDQ3ICsr
KysrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMg
ICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMg
ICAgICAgICAgICAgfCAzNiArKy0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kcnYuaCAgICAgICAgICAgICB8ICAyIC0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZ2VtLmMgICAgICAgICAgICAgfCAxMSArKysKPiAgZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19oZG1pLmMgICAgICAgICAgICAgICAgfCAyNyArKy0tLS0KPiAgMTIgZmlsZXMg
Y2hhbmdlZCwgMTg3IGluc2VydGlvbnMoKyksIDEwNCBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLGRwaS50eHQKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS55YW1sCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2
ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
