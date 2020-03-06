Return-Path: <SRS0=MFJx=4X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59693C10F25
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 22:10:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27FD8206CC
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 22:10:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ky/RjrhI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKCZnBbm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27FD8206CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=daE2h0ncX41KnC/sKsYGVGg8N8y0cYwOIonnU1uopJs=; b=Ky/RjrhISKDnw0
	Czygy0VtMjlmIaTXUe5V8dggk8Ym/WOpRlNC+w/SWvq+g9ZjypdyGOGTroQ18ZXAGq8rbPVJaSx1k
	fbrZIDGiTt9ZrGHUdCQeLokxtvYi51+m3RaOnTlK6lDaTs4DS/TiyzWrkPuNAhcmVp7jkUqqC0gtb
	kCkhSJiyiDWiImzvqlEmfgBSGh3JzKEvlLhEFB247iRogPrMw7/r5W85FsluUCLAZgg7QRqvewDRh
	71TIymDmDRn0C/QWdwz4YhJpf0CoiStzteLVbLx9GZ9ZggnriUWCAmP7AgZs9t44VbLH7/8uBd3YJ
	OSplZ5hth8cJ3SIOhzMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jALAe-0007XR-Pr; Fri, 06 Mar 2020 22:10:16 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jALAR-0006Bw-6p; Fri, 06 Mar 2020 22:10:05 +0000
Received: by mail-qk1-x741.google.com with SMTP id e16so3839157qkl.6;
 Fri, 06 Mar 2020 14:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wFFrwgrTxStIND0BgNhiakGXgdI5azKMO9yWmsMkrG8=;
 b=NKCZnBbmVyGbhvFm7vnXR6PZ+BT1xmXP57NsWVgP873FYSY6aYf7NSha8tNdM2KmN5
 OoPbsfr8MaqqPr8lVY3qnqCAE8FSHZHXVYN0acumv4Z9ZxEP3ZdDMMLIBoJXfyVofw/o
 xNDLTBB0VPC/1RYmTXPeu5j9+H0bfoqUNW3qtxQk4ir1fyRjb2X6pnMJSK/yU1YnKguP
 fOrokkh/gXgKCrodR7CQR/IVMPMCgNqKTUH2burIeWcuUcQbdbs3XjM1N/MI5Gy8Pxp9
 GjrUWTlJwrxF+ed3CwGrDTc7HgrmcZeg9Bsonugv8uf93Mgs2X22Az8mhBZwk2+8xWo7
 p6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wFFrwgrTxStIND0BgNhiakGXgdI5azKMO9yWmsMkrG8=;
 b=U6GJnmrgHc1kj7k+NDqP1SzhU/yTGYMWz23BI3Udey792V8fo2hc2xUvHcnLGQKdVX
 XlEvyAdRDkWa0d7l1MBFxJNmkuQKezqNPH5M0zDxt2gR+w8wiwM5PF1OpzHhBQ62er3W
 F8NQ7IzkhidPgJajwTgwLiq7Ep9a/yhdmseX1Pse7W1Ymbw+jzRMocBAn7N+JPbZuvvS
 bWh0oMF2yvVTaG1PAGyqVdSc/ucFS0xNj3XpC0E5F23WqXUpX0mQEY2KKYBNji/JuUK4
 VIi0g/ufMzgcL9nrbn1VPXoGwqGYbvgPEkPBgwntECfqtZRdQVg5UZKcZihek5mBYNkI
 KHdA==
X-Gm-Message-State: ANhLgQ1SIYeE74k2FZ7xZySd4y6e2vizSaEbcvPBfKYp8aQXQ8tBT113
 MCoeu6aKVbtp6BrHsW9YEw0hiMTNmc3ksDtUeSs=
X-Google-Smtp-Source: ADFU+vvcXU3XRqapQvaYZN7V2yeNnnl4nT5ZoW3I1T9V/N+yCxaa9tq5Y/hEoQ3l5n1pqdOzHig2VyLB92f6R+gT53I=
X-Received: by 2002:a37:9e8a:: with SMTP id h132mr4969237qke.314.1583532601568; 
 Fri, 06 Mar 2020 14:10:01 -0800 (PST)
MIME-Version: 1.0
References: <20200302110128.2664251-1-enric.balletbo@collabora.com>
 <20200302110128.2664251-4-enric.balletbo@collabora.com>
 <158344207340.7173.8369925839829696256@swboyd.mtv.corp.google.com>
 <8bfc4350-6e92-e657-18f2-3624a2558521@collabora.com>
 <158353062701.66766.10488072352849985568@swboyd.mtv.corp.google.com>
In-Reply-To: <158353062701.66766.10488072352849985568@swboyd.mtv.corp.google.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 6 Mar 2020 23:09:50 +0100
Message-ID: <CAFqH_51hL07c7z2mBSWMejKwZMkNHPVYiB7JpMPPgck0XycEug@mail.gmail.com>
Subject: Re: [PATCH v11 3/5] soc: mediatek: Move mt8173 MMSYS to platform
 driver
To: Stephen Boyd <sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_141003_308349_963F25FA 
X-CRM114-Status: GOOD (  32.17  )
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
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Richard Fontana <rfontana@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 ulrich.hecht+renesas@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-clk@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
 Chen-Yu Tsai <wens@csie.org>, Allison Randal <allison@lohutok.net>,
 CK HU <ck.hu@mediatek.com>, mtk01761 <wendell.lin@mediatek.com>,
 linux-media@vger.kernel.org,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
 sean.wang@mediatek.com, Houlong Wei <houlong.wei@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, fwll.ch@freedesktop.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <mbrugger@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, matthias.bgg@kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgU3RlcGhlbiwKCk1pc3NhdGdlIGRlIFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4g
ZGVsIGRpYSBkdi4sIDYgZGUgbWFyw6cKMjAyMCBhIGxlcyAyMjozNzoKPgo+IFF1b3RpbmcgRW5y
aWMgQmFsbGV0Ym8gaSBTZXJyYSAoMjAyMC0wMy0wNiAwODozMDoxNikKPiA+IEhpIFN0ZXBoZW4s
Cj4gPgo+ID4gT24gNS8zLzIwIDIyOjAxLCBTdGVwaGVuIEJveWQgd3JvdGU6Cj4gPiA+IFF1b3Rp
bmcgRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSAoMjAyMC0wMy0wMiAwMzowMToyNikKPiA+ID4+IEZy
b206IE1hdHRoaWFzIEJydWdnZXIgPG1icnVnZ2VyQHN1c2UuY29tPgo+ID4gPj4KPiA+ID4+IFRo
ZXJlIGlzIG5vIHN0cm9uZyByZWFzb24gZm9yIHRoaXMgdG8gdXNlIENMS19PRl9ERUNMQVJFIGlu
c3RlYWQgb2YKPiA+ID4+IGJlaW5nIGEgcGxhdGZvcm0gZHJpdmVyLgo+ID4gPgo+ID4gPiBDb29s
Lgo+ID4gPgo+ID4gPj4gUGx1cywgdGhpcyBkcml2ZXIgcHJvdmlkZXMgY2xvY2tzIGJ1dCBhbHNv
Cj4gPiA+PiBhIHNoYXJlZCByZWdpc3RlciBzcGFjZSBmb3IgdGhlIG1lZGlhdGVrLWRybSBhbmQg
dGhlIG1lZGlhdGVrLW1kcAo+ID4gPj4gZHJpdmVyLiBTbyBtb3ZlIHRvIGRyaXZlcnMvc29jL21l
ZGlhdGVrIGFzIGEgcGxhdGZvcm0gZHJpdmVyLgo+ID4gPj4KPiA+ID4+IFNpZ25lZC1vZmYtYnk6
IE1hdHRoaWFzIEJydWdnZXIgPG1icnVnZ2VyQHN1c2UuY29tPgo+ID4gPj4gU2lnbmVkLW9mZi1i
eTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4K
PiA+ID4+IFJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgo+ID4gPj4gLS0t
Cj4gPiA+Pgo+ID4gPj4gQ2hhbmdlcyBpbiB2MTE6IE5vbmUKPiA+ID4+IENoYW5nZXMgaW4gdjEw
Ogo+ID4gPj4gLSBSZW5hbWVkIHRvIGJlIGdlbmVyaWMgbXRrLW1tc3lzCj4gPiA+PiAtIEFkZCBk
cml2ZXIgZGF0YSBzdXBwb3J0IHRvIGJlIGFibGUgdG8gc3VwcG9ydCBkaWZlcmVudCBTb0NzCj4g
PiA+Pgo+ID4gPj4gQ2hhbmdlcyBpbiB2OToKPiA+ID4+IC0gTW92ZSBtbXN5cyB0byBkcml2ZXJz
L3NvYy9tZWRpYXRlayAoQ0spCj4gPiA+Pgo+ID4gPj4gQ2hhbmdlcyBpbiB2ODoKPiA+ID4+IC0g
QmUgYSBidWlsdGluX3BsYXRmb3JtX2RyaXZlciBsaWtlIG90aGVyIG1lZGlhdGVrIG1tc3lzIGRy
aXZlcnMuCj4gPiA+Pgo+ID4gPj4gQ2hhbmdlcyBpbiB2NzoKPiA+ID4+IC0gRnJlZSBjbGtfZGF0
YS0+Y2xrcyBhcyB3ZWxsCj4gPiA+PiAtIEdldCByaWQgb2YgcHJpdmF0ZSBkYXRhIHN0cnVjdHVy
ZQo+ID4gPj4KPiA+ID4+ICBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTczLmMgfCAxMDQg
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4+ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9LY29uZmln
ICAgICAgfCAgIDcgKysKPiA+ID4+ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9NYWtlZmlsZSAgICAg
fCAgIDEgKwo+ID4gPj4gIGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jICB8IDE1NCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4KPiA+ID4gQ2FuIHlvdSBnZW5lcmF0
ZSB3aXRoIC1NIHNvIHRoYXQgd2UgY2FuIHNlZSB3aGF0IGhhcyBhY3R1YWxseSBjaGFuZ2VkPwo+
ID4gPgo+ID4KPiA+IFN1cmUsIHNvcnJ5IGFib3V0IHRoYXQuCj4gPgo+ID4gPj4gIDQgZmlsZXMg
Y2hhbmdlZCwgMTYyIGluc2VydGlvbnMoKyksIDEwNCBkZWxldGlvbnMoLSkKPiA+ID4+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMKPiA+ID4+Cj4g
PiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvS2NvbmZpZyBiL2RyaXZlcnMv
c29jL21lZGlhdGVrL0tjb25maWcKPiA+ID4+IGluZGV4IDIxMTRiNTYzNDc4Yy4uN2ExNTY5NDRk
NTBlIDEwMDY0NAo+ID4gPj4gLS0tIGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvS2NvbmZpZwo+ID4g
Pj4gKysrIGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvS2NvbmZpZwo+ID4gPj4gQEAgLTQ0LDQgKzQ0
LDExIEBAIGNvbmZpZyBNVEtfU0NQU1lTCj4gPiA+PiAgICAgICAgICAgU2F5IHllcyBoZXJlIHRv
IGFkZCBzdXBwb3J0IGZvciB0aGUgTWVkaWFUZWsgU0NQU1lTIHBvd2VyIGRvbWFpbgo+ID4gPj4g
ICAgICAgICAgIGRyaXZlci4KPiA+ID4+Cj4gPiA+PiArY29uZmlnIE1US19NTVNZUwo+ID4gPj4g
KyAgICAgICBib29sICJNZWRpYVRlayBNTVNZUyBTdXBwb3J0Igo+ID4gPj4gKyAgICAgICBkZXBl
bmRzIG9uIENPTU1PTl9DTEtfTVQ4MTczCj4gPiA+Cj4gPiA+IERvZXMgaXQgbmVlZCBzb21lIGRl
ZmF1bHQgc28gdGhhdCBkZWZjb25maWcgdXBkYXRlcyBkb24ndCBicmVhayB0aGluZ3M/Cj4gPiA+
Cj4gPgo+ID4gUmlnaHQuCj4gPgo+ID4gPj4gKyAgICAgICBoZWxwCj4gPiA+PiArICAgICAgICAg
U2F5IHllcyBoZXJlIHRvIGFkZCBzdXBwb3J0IGZvciB0aGUgTWVkaWFUZWsgTXVsdGltZWRpYQo+
ID4gPj4gKyAgICAgICAgIFN1YnN5c3RlbSAoTU1TWVMpLgo+ID4gPj4gKwo+ID4gPj4gIGVuZG1l
bnUKPiA+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9NYWtlZmlsZSBiL2Ry
aXZlcnMvc29jL21lZGlhdGVrL01ha2VmaWxlCj4gPiA+PiBpbmRleCBiMDE3MzMwNzRhZDYuLjAx
ZjlmODczNjM0YSAxMDA2NDQKPiA+ID4+IC0tLSBhL2RyaXZlcnMvc29jL21lZGlhdGVrL01ha2Vm
aWxlCj4gPiA+PiArKysgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9NYWtlZmlsZQo+ID4gPj4gQEAg
LTMsMyArMyw0IEBAIG9iai0kKENPTkZJR19NVEtfQ01EUSkgKz0gbXRrLWNtZHEtaGVscGVyLm8K
PiA+ID4+ICBvYmotJChDT05GSUdfTVRLX0lORlJBQ0ZHKSArPSBtdGstaW5mcmFjZmcubwo+ID4g
Pj4gIG9iai0kKENPTkZJR19NVEtfUE1JQ19XUkFQKSArPSBtdGstcG1pYy13cmFwLm8KPiA+ID4+
ICBvYmotJChDT05GSUdfTVRLX1NDUFNZUykgKz0gbXRrLXNjcHN5cy5vCj4gPiA+PiArb2JqLSQo
Q09ORklHX01US19NTVNZUykgKz0gbXRrLW1tc3lzLm8KPiA+ID4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1t
bXN5cy5jCj4gPiA+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gPj4gaW5kZXggMDAwMDAwMDAw
MDAwLi40NzNjZGY3MzJmYjUKPiA+ID4+IC0tLSAvZGV2L251bGwKPiA+ID4+ICsrKyBiL2RyaXZl
cnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jCj4gPiA+PiBAQCAtMCwwICsxLDE1NCBAQAo+ID4g
Pj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKPiA+ID4+ICsvKgo+
ID4gPj4gKyAqIENvcHlyaWdodCAoYykgMjAxNCBNZWRpYVRlayBJbmMuCj4gPiA+PiArICogQXV0
aG9yOiBKYW1lcyBMaWFvIDxqYW1lc2pqLmxpYW9AbWVkaWF0ZWsuY29tPgo+ID4gPj4gKyAqLwo+
ID4gPj4gKwo+ID4gPj4gKyNpbmNsdWRlIDxsaW51eC9jbGstcHJvdmlkZXIuaD4KPiA+ID4+ICsj
aW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+Cj4gPiA+PiArI2luY2x1ZGUgPGxpbnV4L3BsYXRm
b3JtX2RldmljZS5oPgo+ID4gPj4gKwo+ID4gPj4gKyNpbmNsdWRlICIuLi8uLi9jbGsvbWVkaWF0
ZWsvY2xrLWdhdGUuaCIKPiA+ID4+ICsjaW5jbHVkZSAiLi4vLi4vY2xrL21lZGlhdGVrL2Nsay1t
dGsuaCIKPiA+ID4KPiA+ID4gV2h5IG5vdCB1c2UgaW5jbHVkZS9saW51eC9jbGsvPwo+ID4gPgo+
ID4KPiA+IEkgY2FuIG1vdmUgdGhlc2UgZmlsZXMgdG8gaW5jbHVkZSwgdGhpcyB3aWxsIGltcGFj
dCBhIGxvdCBtb3JlIG9mIGRyaXZlcnMgYnV0LAo+ID4geWVzLCBJIHRoaW5rIGlzIHRoZSByaWdo
dCB3YXkuCj4gPgo+ID4gPiBCdXQgSSBhbHNvIGRvbid0IHVuZGVyc3RhbmQgd2h5IHRoZSBjbGsg
ZHJpdmVyIGlzIG1vdmVkIG91dHNpZGUgb2YKPiA+ID4gZHJpdmVycy9jbGsvIGludG8gZHJpdmVy
cy9zb2MvLiBDb21taXQgdGV4dCBzYXlpbmcgdGhhdCBpdCBoYXMgc2hhcmVkCj4gPiA+IHJlZ2lz
dGVycyBkb2Vzbid0IG1lYW4gaXQgY2FuJ3Qgc3RpbGwga2VlcCB0aGUgY2xrIGRyaXZlciBwYXJ0
IGluIHRoZQo+ID4gPiBkcml2ZXJzL2Nsay8gYXJlYS4KPiA+ID4KPiA+Cj4gPiBBY3R1YWxseSBt
b3ZpbmcgdGhpcyB0byB0aGUgc29jIGRpcmVjdG9yeSBoYXMgYmVlbiByZXF1ZXN0ZWQgYnkgQ0sg
KG1lZGlhdGVrKSBhcwo+ID4gYSBjaGFuZ2UgaW4gdjguIFlvdSBjYW4gc2VlIHRoZSBkaXNjdXNz
aW9uIGluIFsxXQo+ID4KPgo+IEkgY2FuIHJlcGx5IHRoZXJlIGluIHRoYXQgdGhyZWFkIGlmIG5l
Y2Vzc2FyeSwgYnV0IHdlIHNob3VsZG4ndCBuZWVkIHRvCj4gZm9yY2Ugc2ltcGxlLW1mZCBpbnRv
IERUIGJpbmRpbmdzIHRvIHN1cHBvcnQgdGhpcy4gTWF0Y2ggdGhlIGNvbXBhdGlibGUKPiBzdHJp
bmcgaW4gZHJpdmVycy9zb2MvIGFuZCByZWdpc3RlciBkZXZpY2VzIGluIHNvZnR3YXJlIGZvciB0
aGUKPiBkaWZmZXJlbnQgcGllY2VzIG9mIHRoaXMgb3ZlcmFsbCBoYXJkd2FyZSBibG9jay4gSWYg
bmVjZXNzYXJ5LCBwYXNzIGRvd24KPiB0aGUgaW9yZW1hcHBlZCBhZGRyZXNzcyBkb3duIHRocm91
Z2ggZGV2aWNlIGRhdGEgdG8gZWFjaCBsb2dpY2FsIGRyaXZlcgo+IGluIHRoZSByZXNwZWN0aXZl
IHN1YnN5c3RlbS4KPgo+IFNvIHllcywgaXQgbG9va3MgbGlrZSBhbiBNRkQsIGJ1dCB0aGF0IGRv
ZXNuJ3QgbWVhbiB3ZSBoYXZlIHRvIGNoYW5nZQo+IHRoZSBEVCBiaW5kaW5nIG9yIHB1dCBpdCBp
biBkcml2ZXJzL21mZCB0byBzdXBwb3J0IHRoYXQuIEFuZCB3ZSBkb24ndAo+IGhhdmUgdG8gZml4
IGFueSBwcm9ibGVtcyB3aXRoIGFsbG93aW5nIHR3byBkcml2ZXJzIHRvIHByb2JlIHRoZSBzYW1l
Cj4gY29tcGF0aWJsZSBzdHJpbmcuCj4KClRoYXQgdGhyZWFkIG1heWJlIGhhcyB0b28gbXVjaCBp
bmZvcm1hdGlvbiBhbmQgdGhpbmdzIGV2b2x2ZWQgc2luY2UKdGhlbi4gTm90ZSB0aGF0IHRoZSBm
aW5hbCBzb2x1dGlvbiBpcyBub3QgYW4gTUZEIG5laXRoZXIgd2UgY2hhbmdlIHRoZQpiaW5kaW5n
cy4gSSBwb2ludGVkIHRvIHRoYXQgdGhyZWFkIGp1c3QgYmVjYXVzZSBDSyAoQ0sgcGxlYXNlIGNv
cnJlY3QKbWUgaWYgSSdtIHdyb25nKSB0aG91Z2h0IHRoYXQgdGhlIGRyaXZlciBpcyBub3QgYSBw
dXJlIGNsb2NrIGRyaXZlcgphbmQgaGUgcHJlZmVycmVkIHRvIG1vdmUgdG8gZHJpdmVycy9zb2Mv
bWVkaWF0ZWsgKGluIHRoYXQgdGhyZWFkLCBoZQpleHBvc2VzIGhpcyBvcGluaW9uIG9uIHRoYXQp
LiAgU29ycnkgdG8gaW50cm9kdWNlIG1vcmUgY29uZnVzaW9uLgoKWW91IHNlZW0gdG8gYmUgZmlu
ZSB3aXRoIHRoZSBhcHByb2FjaCAoanVzdCBtaW5vciBjaGFuZ2VzKSwgc28gaXQKbG9va3MgdG8g
bWUgdGhhdCB0aGUgb25seSBwcm9ibGVtIGlzIGlmIHRoaXMgc2hvdWxkIGJlIGluIGRyaXZlcnMv
Y2xrCm9yIGRyaXZlcnMvc29jLiBIb25lc3RseSwgdGhpcyBpcyBub3Qgc29tZXRoaW5nIEkgY2Fu
J3QgZGVjaWRlIGFuZApJJ2xsIGxldCB5b3UgKHRoZSBzb2MgYW5kIGNsayBtYWludGFpbmVycykg
ZGVjaWRlLiBJIGRvbid0IHJlYWxseSBoYXZlCmEgc3Ryb25nIG9waW5pb24gaGVyZS4gSSBkb24n
dCBtaW5kIG1vdmUgYWdhaW4gdG8gZHJpdmVycy9jbGsgaWYgdGhhdAppcyB3aGF0IHdlIHdhbnQg
YnV0IGxldCdzIGNvbWUgdG8gYW4gYWdyZWVtZW50LgoKVGhhbmtzLAogRW5yaWMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxp
bmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
