Return-Path: <SRS0=uRRy=DF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5AC5C2D0A8
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2020 15:55:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C7A3206B6
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2020 15:55:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q6208x+u";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UC+Urg/4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C7A3206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P4AfzjkMNJm95w43jY6rsRnxn3nmyKJE5xD3Uu2joy0=; b=Q6208x+uoTBV2cfZoPFb3siR+
	nxONcgBQSHHYc+wiTJW+V7h4ZX66N/E4h3XgRA7NAOKdzFF7ozlOwEXcIQa8WKKozwdzVd+TdAvmg
	UKzOpgDw/mIVagn1kQ0iDXiP5y1mmkkr353Hivw4d+tEU7j0FN8fClvt8GrEu6bpvx7OXOOoBLIEX
	uVeiqVUVroNGIAM1tO6BAgeR2F0dcru3L/uELahkkXfuYukoBD1c7w7WZZvN6vfFKpgBSGy5/jL3r
	5rUUPXajk8WAZarhzwJTg9qTFIakLnBLYewo5mAAdtLCXtaAsOwjkawjibYhKRVxxh9da+sxUu5Bw
	hlfGr5LTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMvUo-0001mf-Kl; Mon, 28 Sep 2020 15:55:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMvUm-0001mD-7i
 for linux-mediatek@lists.infradead.org; Mon, 28 Sep 2020 15:55:21 +0000
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3507A21924
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2020 15:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601308519;
 bh=aSV7ZH6xNk5TES2uXpq9qodN2hGgszJyb+Qy8dtrr9Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UC+Urg/4tXj0ESHccTXdy6Mn9iOb0dzqNdBA82i9sv+QgGUw/nzBtpd5sGCqnsAQd
 4GpISw3LiYghb0X9MMpVWP5jkFTPFgBxd2Rbzkn7OjRJpTzIFeXl82aJHVtpAfryaL
 +35qwXG6LAtgIARn1B2Ay7j2YOAmr2xy00rb/bqY=
Received: by mail-ed1-f54.google.com with SMTP id n13so1894743edo.10
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2020 08:55:19 -0700 (PDT)
X-Gm-Message-State: AOAM530WCLvf6HmNzq0e+nT9C18q4TgAf2otwzHaVt+rS9QcVxn/ia5f
 +Q2Wex0BchLx1OuZ31vh0N6Uu5O6tx8O/kOm5w==
X-Google-Smtp-Source: ABdhPJx4YanUWfNwGENzNdM53m6d3jHq61s+O+2C0Gkq0tQ8HJb7RSlQaQey6NWxQ/TyXJJ2f/dg/3N5SilLFir7BdQ=
X-Received: by 2002:a05:6402:d09:: with SMTP id
 eb9mr2465473edb.219.1601308517772; 
 Mon, 28 Sep 2020 08:55:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200914231227.30500-1-chunkuang.hu@kernel.org>
In-Reply-To: <20200914231227.30500-1-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 28 Sep 2020 23:55:07 +0800
X-Gmail-Original-Message-ID: <CAAOTY__u7AgKuLc6mVoVZrt1sQnu4vYyn8EwhK7B4dh7FoNAug@mail.gmail.com>
Message-ID: <CAAOTY__u7AgKuLc6mVoVZrt1sQnu4vYyn8EwhK7B4dh7FoNAug@mail.gmail.com>
Subject: Re: [GIT PULL] mediatek drm next for 5.10
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_115520_414159_FA6E848D 
X-CRM114-Status: GOOD (  20.02  )
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
Cc: Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chunfeng Yun <chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIERhdmUgJiBEYW5pZWw6CgpJIGRvZXMgbm90IHNlZSB0aGVzZSBwYXRjaGVzIGluIGRybS1u
ZXh0IGJyYW5jaC4gRG9lcyB0aGVzZSBwYXRjaGVzCmhhdmUgYW55IHByb2JsZW0/CgpSZWdhcmRz
LApDaHVuLUt1YW5nLgoKQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaW
vCAyMDIw5bm0OeaciDE15pelIOmAseS6jCDkuIrljYg3OjEy5a+r6YGT77yaCj4KPiBIaSwgRGF2
ZSAmIERhbmllbDoKPgo+IFRoaXMgaW5jbHVkZXM6Cj4KPiAxLiBNb3ZlIE1lZGlhdGVrIEhETUkg
UEhZIGRyaXZlciBmcm9tIERSTSBmb2xkZXIgdG8gUEhZIGZvbGRlcgo+IDIuIENvbnZlcnQgbXRr
LWRwaSB0byBkcm1fYnJpZGdlIEFQSQo+IDMuIERpc2FibGUgdG1kcyBvbiBtdDI3MDEKPgo+IFJl
Z2FyZHMsCj4gQ2h1bi1LdWFuZy4KPgo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21t
aXQgOTEyM2UzYTc0ZWM3YjkzNGE0YTA5OWU5OGFmNmE2MWMyZjgwYmJmNToKPgo+ICAgTGludXgg
NS45LXJjMSAoMjAyMC0wOC0xNiAxMzowNDo1NyAtMDcwMCkKPgo+IGFyZSBhdmFpbGFibGUgaW4g
dGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+Cj4gICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0IHRhZ3MvbWVkaWF0ZWst
ZHJtLW5leHQtNS4xMAo+Cj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDA5ZTg3MmQ1
NThiYTZhN2Y0NDY4YzRlOGNkZjBjZDVhOTliZmMxNzU6Cj4KPiAgIGRybS9tZWRpYXRlazogRGlz
YWJsZSB0bWRzIG9uIG10MjcwMSAoMjAyMC0wOS0xNCAyMzowNToyMyArMDgwMCkKPgo+IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiBNZWRpYXRlayBEUk0gTmV4dCBmb3IgTGludXggNS4xMAo+Cj4gMS4gTW92ZSBNZWRpYXRl
ayBIRE1JIFBIWSBkcml2ZXIgZnJvbSBEUk0gZm9sZGVyIHRvIFBIWSBmb2xkZXIKPiAyLiBDb252
ZXJ0IG10ay1kcGkgdG8gZHJtX2JyaWRnZSBBUEkKPiAzLiBEaXNhYmxlIHRtZHMgb24gbXQyNzAx
Cj4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4gQ0sgSHUgKDMpOgo+ICAgICAgIGRybS9tZWRpYXRlazogTW92ZSB0el9k
aXNhYmxlZCBmcm9tIG10a19oZG1pX3BoeSB0byBtdGtfaGRtaSBkcml2ZXIKPiAgICAgICBkcm0v
bWVkaWF0ZWs6IFNlcGFyYXRlIG10a19oZG1pX3BoeSB0byBhbiBpbmRlcGVuZGVudCBtb2R1bGUK
PiAgICAgICBwaHk6IG1lZGlhdGVrOiBNb3ZlIG10a19oZG1pX3BoeSBkcml2ZXIgaW50byBkcml2
ZXJzL3BoeS9tZWRpYXRlayBmb2xkZXIKPgo+IENodW4tS3VhbmcgSHUgKDEpOgo+ICAgICAgIE1B
SU5UQUlORVJTOiBhZGQgZmlsZXMgZm9yIE1lZGlhdGVrIERSTSBkcml2ZXJzCj4KPiBFbnJpYyBC
YWxsZXRibyBpIFNlcnJhICgyKToKPiAgICAgICBkcm0vbWVkaWF0ZWs6IG10a19kcGk6IFJlbmFt
ZSBicmlkZ2UgdG8gbmV4dF9icmlkZ2UKPiAgICAgICBkcm0vbWVkaWF0ZWs6IG10a19kcGk6IENv
bnZlcnQgdG8gYnJpZGdlIGRyaXZlcgo+Cj4gRnJhbmsgV3VuZGVybGljaCAoMik6Cj4gICAgICAg
ZHQtYmluZGluZ3M6IG1lZGlhdGVrOiBhZGQgbXQ3NjIzIGRpc3BsYXktbm9kZXMKPiAgICAgICBk
cm0vbWVkaWF0ZWs6IEFkZCBkZHAgcm91dGluZyBmb3IgbXQ3NjIzCj4KPiBTdHUgSHNpZWggKDEp
Ogo+ICAgICAgIGRybS9tZWRpYXRlazogZHBpL2RzaTogQ2hhbmdlIHRoZSBnZXR0aW5nIHBvc3Np
YmxlX2NydGMgd2F5Cj4KPiBjaHVuaHVpIGRhaSAoMSk6Cj4gICAgICAgZHJtL21lZGlhdGVrOiBE
aXNhYmxlIHRtZHMgb24gbXQyNzAxCj4KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgICAgICAgICAgICAgICAgICAg
fCAgMiArLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRp
YXRlay9tZWRpYXRlayxkcGkudHh0ICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRz
aS50eHQgICAgICAgICAgICAgICAgICAgIHwgIDQgKystLQo+ICBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxoZG1pLnR4dCAgICAgICAg
ICAgICAgICAgICB8ICA0ICsrKysKPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
MSArCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgNSArLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RwaS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDgwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgMzggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArKwo+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDIzICsrKysrKysrKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKy0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfaGRtaS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgMjEgKysrKysrKysrKysrKysrKystLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfaGRtaS5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDEgLQo+ICBkcml2ZXJzL3BoeS9tZWRpYXRlay9LY29uZmlnICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA3
ICsrKysrKysKPiAgZHJpdmVycy9waHkvbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArKysrKwo+ICBk
cml2ZXJzL3tncHUvZHJtL21lZGlhdGVrL210a19tdDI3MDFfaGRtaV9waHkuYyA9PiBwaHkvbWVk
aWF0ZWsvcGh5LW10ay1oZG1pLW10MjcwMS5jfSB8ICA0ICsrLS0KPiAgZHJpdmVycy97Z3B1L2Ry
bS9tZWRpYXRlay9tdGtfbXQ4MTczX2hkbWlfcGh5LmMgPT4gcGh5L21lZGlhdGVrL3BoeS1tdGst
aGRtaS1tdDgxNzMuY30gfCAgMiArLQo+ICBkcml2ZXJzL3tncHUvZHJtL21lZGlhdGVrL210a19o
ZG1pX3BoeS5jID0+IHBoeS9tZWRpYXRlay9waHktbXRrLWhkbWkuY30gICAgICAgICAgICAgICB8
ICA2ICsrKysrLQo+ICBkcml2ZXJzL3tncHUvZHJtL21lZGlhdGVrL210a19oZG1pX3BoeS5oID0+
IHBoeS9tZWRpYXRlay9waHktbXRrLWhkbWkuaH0gICAgICAgICAgICAgICB8ICAzICstLQo+ICAy
MCBmaWxlcyBjaGFuZ2VkLCAxNTkgaW5zZXJ0aW9ucygrKSwgNTkgZGVsZXRpb25zKC0pCj4gIHJl
bmFtZSBkcml2ZXJzL3tncHUvZHJtL21lZGlhdGVrL210a19tdDI3MDFfaGRtaV9waHkuYyA9PiBw
aHkvbWVkaWF0ZWsvcGh5LW10ay1oZG1pLW10MjcwMS5jfSAoOTklKQo+ICByZW5hbWUgZHJpdmVy
cy97Z3B1L2RybS9tZWRpYXRlay9tdGtfbXQ4MTczX2hkbWlfcGh5LmMgPT4gcGh5L21lZGlhdGVr
L3BoeS1tdGstaGRtaS1tdDgxNzMuY30gKDk5JSkKPiAgcmVuYW1lIGRyaXZlcnMve2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2hkbWlfcGh5LmMgPT4gcGh5L21lZGlhdGVrL3BoeS1tdGstaGRtaS5jfSAo
OTYlKQo+ICByZW5hbWUgZHJpdmVycy97Z3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9waHkuaCA9
PiBwaHkvbWVkaWF0ZWsvcGh5LW10ay1oZG1pLmh9ICg5NSUpCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
