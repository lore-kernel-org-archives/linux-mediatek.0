Return-Path: <SRS0=tJCI=6P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE9CC47257
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 May 2020 15:00:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3469B2166E
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 May 2020 15:00:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SmsXxRNh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3469B2166E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jIdPw/GmcPb2Pz39g1kjoFFYatopEZCmrRmLCwRCpDk=; b=SmsXxRNhGBHFOp
	Cu3oHtg9usoxpGAJEm6U3wtyov3IbtYoP0nfGO+/mn/82wOhUyGvgUDvQHipd1ABUgzKlO37LP7QN
	Crg5LIrhUMw/gDx2yaQc9cLUOC+MVY+8gkwzUtXjddaz1atwCoagI2HfvqPuZmg/fHueSmswnvZF4
	YUw3h1bH4Qm1gf3uvTgYzQIneYdUENHDtn3lRPUIPO8SLP5Pt/+KtsXIR6AXGQfVUmZzg9Q7sS1C+
	J8QWBgmGxNxNe9LpgtAosdx2NEyACmitjdyToAOXDCKvQPT7cjydRwXekSRkBKhJON0IqtRP04nPc
	Z3ZpYj9ZUZtQ7RRAbKXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUX8v-0008MC-EV; Fri, 01 May 2020 14:59:57 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUX8l-0008C3-K4; Fri, 01 May 2020 14:59:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 3C1082A30D9
Subject: Re: [PATCH v3 7/7] drm/mediatek: mtk_dsi: Create connector for bridges
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20200417150614.2631786-1-enric.balletbo@collabora.com>
 <20200417150614.2631786-8-enric.balletbo@collabora.com>
 <CAAOTY_8uWP80ZMO5ZQGLJ5YLFZcmGjZwc33Hi_oXsCPj5Yr89A@mail.gmail.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <0584a198-02f2-a8a3-676e-74365a697bd4@collabora.com>
Date: Fri, 1 May 2020 16:59:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAAOTY_8uWP80ZMO5ZQGLJ5YLFZcmGjZwc33Hi_oXsCPj5Yr89A@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_075947_791159_3C5FF97A 
X-CRM114-Status: GOOD (  18.12  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQ2h1bi1LdWFuZywKClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcuCgpPbiAxLzUvMjAgMTY6
MjYsIENodW4tS3VhbmcgSHUgd3JvdGU6Cj4gSGksIEVucmljOgo+IAo+IEVucmljIEJhbGxldGJv
IGkgU2VycmEgPGVucmljLmJhbGxldGJvQGNvbGxhYm9yYS5jb20+IOaWvCAyMDIw5bm0NOaciDE3
5pelIOmAseS6lCDkuIvljYgxMTowNuWvq+mBk++8mgo+Pgo+PiBVc2UgdGhlIGRybV9icmlkZ2Vf
Y29ubmVjdG9yIGhlbHBlciB0byBjcmVhdGUgYSBjb25uZWN0b3IgZm9yIHBpcGVsaW5lcwo+PiB0
aGF0IHVzZSBkcm1fYnJpZGdlLiBUaGlzIGFsbG93cyBzcGxpdHRpbmcgY29ubmVjdG9yIG9wZXJh
dGlvbnMgYWNyb3NzCj4+IG11bHRpcGxlIGJyaWRnZXMgd2hlbiBuZWNlc3NhcnksIGluc3RlYWQg
b2YgaGF2aW5nIHRoZSBsYXN0IGJyaWRnZSBpbgo+PiB0aGUgY2hhaW4gY3JlYXRpbmcgdGhlIGNv
bm5lY3RvciBhbmQgaGFuZGxpbmcgYWxsIGNvbm5lY3RvciBvcGVyYXRpb25zCj4+IGludGVybmFs
bHkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEVucmljIEJhbGxldGJvIGkgU2VycmEgPGVucmljLmJh
bGxldGJvQGNvbGxhYm9yYS5jb20+Cj4+IC0tLQo+Pgo+PiBDaGFuZ2VzIGluIHYzOgo+PiAtIE1v
dmUgdGhlIGJyaWRnZS50eXBlIGxpbmUgdG8gdGhlIHBhdGNoIHRoYXQgYWRkcyBkcm1fYnJpZGdl
IHN1cHBvcnQuIChMYXVyZW50IFBpbmNoYXJ0KQo+Pgo+PiBDaGFuZ2VzIGluIHYyOiBOb25lCj4+
Cj4+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgMTMgKysrKysrKysrKysr
LQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4+IGluZGV4IDE1NzA5N2M2M2IyMy4uODVm
NzZiMDFhZTRkIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rz
aS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPj4gQEAgLTE3
LDYgKzE3LDcgQEAKPj4KPj4gICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4KPj4g
ICNpbmNsdWRlIDxkcm0vZHJtX2JyaWRnZS5oPgo+PiArI2luY2x1ZGUgPGRybS9kcm1fYnJpZGdl
X2Nvbm5lY3Rvci5oPgo+PiAgI2luY2x1ZGUgPGRybS9kcm1fbWlwaV9kc2kuaD4KPj4gICNpbmNs
dWRlIDxkcm0vZHJtX29mLmg+Cj4+ICAjaW5jbHVkZSA8ZHJtL2RybV9wYW5lbC5oPgo+PiBAQCAt
MTgzLDYgKzE4NCw3IEBAIHN0cnVjdCBtdGtfZHNpIHsKPj4gICAgICAgICBzdHJ1Y3QgZHJtX2Vu
Y29kZXIgZW5jb2RlcjsKPj4gICAgICAgICBzdHJ1Y3QgZHJtX2JyaWRnZSBicmlkZ2U7Cj4+ICAg
ICAgICAgc3RydWN0IGRybV9icmlkZ2UgKm5leHRfYnJpZGdlOwo+PiArICAgICAgIHN0cnVjdCBk
cm1fY29ubmVjdG9yICpjb25uZWN0b3I7Cj4+ICAgICAgICAgc3RydWN0IHBoeSAqcGh5Owo+Pgo+
PiAgICAgICAgIHZvaWQgX19pb21lbSAqcmVnczsKPj4gQEAgLTk3NywxMCArOTc5LDE5IEBAIHN0
YXRpYyBpbnQgbXRrX2RzaV9lbmNvZGVyX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRybSwgc3Ry
dWN0IG10a19kc2kgKmRzaSkKPj4gICAgICAgICAgKi8KPj4gICAgICAgICBkc2ktPmVuY29kZXIu
cG9zc2libGVfY3J0Y3MgPSAxOwo+Pgo+PiAtICAgICAgIHJldCA9IGRybV9icmlkZ2VfYXR0YWNo
KCZkc2ktPmVuY29kZXIsICZkc2ktPmJyaWRnZSwgTlVMTCwgMCk7Cj4+ICsgICAgICAgcmV0ID0g
ZHJtX2JyaWRnZV9hdHRhY2goJmRzaS0+ZW5jb2RlciwgJmRzaS0+YnJpZGdlLCBOVUxMLAo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9CUklER0VfQVRUQUNIX05PX0NPTk5F
Q1RPUik7Cj4+ICAgICAgICAgaWYgKHJldCkKPj4gICAgICAgICAgICAgICAgIGdvdG8gZXJyX2Ns
ZWFudXBfZW5jb2RlcjsKPj4KPj4gKyAgICAgICBkc2ktPmNvbm5lY3RvciA9IGRybV9icmlkZ2Vf
Y29ubmVjdG9yX2luaXQoZHJtLCAmZHNpLT5lbmNvZGVyKTsKPj4gKyAgICAgICBpZiAoSVNfRVJS
KGRzaS0+Y29ubmVjdG9yKSkgewo+PiArICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJVbmFibGUg
dG8gY3JlYXRlIGJyaWRnZSBjb25uZWN0b3JcbiIpOwo+PiArICAgICAgICAgICAgICAgcmV0ID0g
UFRSX0VSUihkc2ktPmNvbm5lY3Rvcik7Cj4+ICsgICAgICAgICAgICAgICBnb3RvIGVycl9jbGVh
bnVwX2VuY29kZXI7Cj4+ICsgICAgICAgfQo+PiArICAgICAgIGRybV9jb25uZWN0b3JfYXR0YWNo
X2VuY29kZXIoZHNpLT5jb25uZWN0b3IsICZkc2ktPmVuY29kZXIpOwo+PiArCj4gCj4gSSdtIG5v
dCB2ZXJ5IGNsZWFyIGFib3V0IGhvdyBicmlnZS1jb25uZWN0b3Igd29ya3MsIGJ1dCB3aHkgY29u
bmVjdG9yCj4gZG9lcyBub3QgYXR0YWNoIHRvIHBhbmVsPwo+IAoKTGF1cmVudCBvciBvdGhlciBk
cm0gbWFpbnRhaW5lcnMgbWlnaHQgaGF2ZSBtb3JlIGRldGFpbHMgdGhhbiBtZSwgYnV0LCBBRkFJ
SyB0aGUKZHJtX2JyaWRnZV9jb25uZWN0b3JfaW5pdCBpbml0aWFsaXplcyBhIGNvbm5lY3RvciBm
b3IgYSBjaGFpbiBvZiBicmlkZ2VzIHRoYXQKc3RhcnRzIGF0IHRoZSBAZW5jb2Rlci4gQXQgdGhp
cyBwb2ludCB5b3UgZG9uJ3Qga25vdyB3aGljaCBicmlkZ2UgaXMgY29ubmVjdGVkCnRvIHRoZSBw
YW5lbCBwaHlzaWNhbGx5IGJ1dCBkb2Vzbid0IHJlYWxseSBtYXR0ZXIgYXMgd2hhdCB5b3Uga25v
dyBpcyB0aGF0IHdpbGwKYmUgb25seSBvbmUgY29ubmVjdG9yIGluIHRoZSAgY2hhaW4uCgpUaGFu
a3MsCiBFbnJpYwoKPiBSZWdhcmRzLAo+IENodW4tS3VhbmcuCj4gCj4+ICAgICAgICAgcmV0dXJu
IDA7Cj4+Cj4+ICBlcnJfY2xlYW51cF9lbmNvZGVyOgo+PiAtLQo+PiAyLjI1LjEKPj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
