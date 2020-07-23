Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C8EC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 16:21:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3017206D8
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 16:21:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jIlP6kmr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rNWywE0u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3017206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qiabf853bwcdx8sD5cpocueGXpr+NPOdMlAZBbdD/kk=; b=jIlP6kmrvZTt265hr5DoJscAt
	sCLR/GPG5NpSA6L/X6LtgBQh+RQEx5QoHQvphaLuqB8gdw/gniFVQRtACwADk1cCVRWK/D2DYnTSX
	4XFMaZ3Eau1Ft/RJJ2zSYi7/v35SLgxHw2Q+mJ1odh9VwjV0dpewaaHUEQLK3LLVPFtSnGJsqZag1
	RzxH+LbyBza4EIqJf/FlFGUXtkZR1ySPKQozpKZbZDOL7Gh2fTrK2+xZNmvRDl+HHXdHCaGG6Duml
	2XUzZJyVCGC9E5zgMAM/sokVKpyrINGkd905yDNW0My/r8V35NKcDNux6WgnlBT1r7uIoboryzrDZ
	Hw2+aaUYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jydyP-0002Kc-KY; Thu, 23 Jul 2020 16:21:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jydyK-0002IX-AI; Thu, 23 Jul 2020 16:21:29 +0000
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D3B3320714;
 Thu, 23 Jul 2020 16:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595521286;
 bh=6+0/elepkARkgOsTxARSEPfUsQ0kUT59TejC709DQOk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rNWywE0uqiF5fWYLgX1UMCbtbCYBJ1ob7Ojq6jMbqsECPSXnAhOywBkb/WEfBgHBe
 H6fiECXyUWpQuDsiI/Kxs2pWTCu57/keSneVpFJbQ0rCjfW1F7HcLSlR1rIz+j+yVQ
 DKmFF4ESoUQ+eoNmxiZZDozNkHR98UXo5Me86NHA=
Received: by mail-ej1-f50.google.com with SMTP id o18so6999916eje.7;
 Thu, 23 Jul 2020 09:21:25 -0700 (PDT)
X-Gm-Message-State: AOAM532zOmMiYyh8FCRfg//G1xNk9EK8fJM81UukTbHlemSBcT7sufUO
 B1JvMRlnCREuejTOwzB7S4ppDBaD+BZF9D6VhQ==
X-Google-Smtp-Source: ABdhPJwfk66abeK8oi/cVBHx5H7Gp1l6otQXnpopQ1fbIoD2End7rCWaLJQk2FAbvfBbzOPHRPtXGys6UdSJM+h5hMI=
X-Received: by 2002:a17:906:7857:: with SMTP id
 p23mr4119216ejm.260.1595521284362; 
 Thu, 23 Jul 2020 09:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
 <1595469798-3824-2-git-send-email-yongqiang.niu@mediatek.com>
 <CAFqH_50=MkBLHJ23hJo--RG=4560ttOUOjHuEwpevghFZ59xQQ@mail.gmail.com>
 <1595498644.13250.2.camel@mhfsdcap03>
In-Reply-To: <1595498644.13250.2.camel@mhfsdcap03>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 24 Jul 2020 00:21:13 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8SgNcAAch=AQazAG0z2wGte1Wa614bnAgG2eZQxCzL7A@mail.gmail.com>
Message-ID: <CAAOTY_8SgNcAAch=AQazAG0z2wGte1Wa614bnAgG2eZQxCzL7A@mail.gmail.com>
Subject: Re: [v7,
 PATCH 1/7] drm/mediatek: move ddp component defint into mtk_mmsys.h
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_122128_517261_B13C62DC 
X-CRM114-Status: GOOD (  23.83  )
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Enric Balletbo Serra <eballetbo@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

WW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+IOaWvCAyMDIw5bm0N+ac
iDIz5pelIOmAseWbmyDkuIvljYg2OjA25a+r6YGT77yaCj4KPiBPbiBUaHUsIDIwMjAtMDctMjMg
YXQgMTE6MzQgKzAyMDAsIEVucmljIEJhbGxldGJvIFNlcnJhIHdyb3RlOgo+ID4gSGkgWW9uZ3Fp
YW4gTml1LAo+ID4KPiA+IFRoYW5rIHlvdSBmb3IgeW91ciBwYXRjaAo+ID4KPiA+IE1pc3NhdGdl
IGRlIFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPiBkZWwgZGlhIGRq
LiwgMjMKPiA+IGRlIGp1bC4gMjAyMCBhIGxlcyA0OjA1Ogo+ID4gPgo+ID4gPiBtb3ZlIGRkcCBj
b21wb25lbnQgZGVmaW50IGludG8gbXRrX21tc3lzLmgKPiA+ID4KPiA+Cj4gPiBUaGVyZSBpcyBh
IHR5cG8sIHNob3VsZCBiZSAiZGVmaW5lcyIuIEJ1dCB3aHkgeW91IHNob3VsZCBtb3ZlIHRoZXNl
Cj4gPiBkZWZpbmVzIHRvIG10ay1tbXN5cz8KPiA+Cj4KPiBjayBkbyBub3QgbGlrZSB0aGlzIDoK
PiA+IC0jaW5jbHVkZSAiLi4vLi4vZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5oIgo+ID4g
LSNpbmNsdWRlICIuLi8uLi9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaCIKCkkg
dGhpbmsgbm8gb25lIGxpa2UgdGhpcy4KCj4KPiBhZnRlciByZW1vdmUgdGhpcywgd2UgbmVlZCBt
b3ZlIHRoZSBkZHAgY29tcG9uZW50IGRlZmluZQo+Cj4gdHlwZSBlcnJvciB3aWxsIGZpeGVkIGlu
IG5leHQgdmVyc2lvbi4KPgoKbW1zeXMgaXMgdGhlIGRyaXZlciB3aGljaCBjb250cm9sIHRoZSBy
b3V0aW5nIG9mIHRoZXNlIGRkcCBjb21wb25lbnQsCnNvIHRoZSBkZWZpbml0aW9uIG9mIG10a19k
ZHBfY29tcF9pZCBzaG91bGQgYmUgcGxhY2VkIGluIG10ay1tbXN5cy5oCgpSZWdhcmRzLApDaHVu
LUt1YW5nLgoKPgo+ID4KPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlv
bmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmggfCAzNCArLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+ID4gPiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMgICAgICAgICAg
ICB8ICA0ICstLS0KPiA+ID4gIGluY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5o
ICAgICAgfCAzMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ICAzIGZpbGVzIGNo
YW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmgKPiA+ID4gaW5kZXggZGVi
ZTM2My4uMTYxMjAxZiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZGRwX2NvbXAuaAo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kZHBfY29tcC5oCj4gPiA+IEBAIC03LDYgKzcsNyBAQAo+ID4gPiAgI2RlZmluZSBN
VEtfRFJNX0REUF9DT01QX0gKPiA+ID4KPiA+ID4gICNpbmNsdWRlIDxsaW51eC9pby5oPgo+ID4g
PiArI2luY2x1ZGUgPGxpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaD4KPiA+ID4KPiA+ID4g
IHN0cnVjdCBkZXZpY2U7Cj4gPiA+ICBzdHJ1Y3QgZGV2aWNlX25vZGU7Cj4gPiA+IEBAIC0zNSwz
OSArMzYsNiBAQCBlbnVtIG10a19kZHBfY29tcF90eXBlIHsKPiA+ID4gICAgICAgICBNVEtfRERQ
X0NPTVBfVFlQRV9NQVgsCj4gPiA+ICB9Owo+ID4gPgo+ID4gPiAtZW51bSBtdGtfZGRwX2NvbXBf
aWQgewo+ID4gPiAtICAgICAgIEREUF9DT01QT05FTlRfQUFMMCwKPiA+ID4gLSAgICAgICBERFBf
Q09NUE9ORU5UX0FBTDEsCj4gPiA+IC0gICAgICAgRERQX0NPTVBPTkVOVF9CTFMsCj4gPiA+IC0g
ICAgICAgRERQX0NPTVBPTkVOVF9DQ09SUiwKPiA+ID4gLSAgICAgICBERFBfQ09NUE9ORU5UX0NP
TE9SMCwKPiA+ID4gLSAgICAgICBERFBfQ09NUE9ORU5UX0NPTE9SMSwKPiA+ID4gLSAgICAgICBE
RFBfQ09NUE9ORU5UX0RJVEhFUiwKPiA+ID4gLSAgICAgICBERFBfQ09NUE9ORU5UX0RQSTAsCj4g
PiA+IC0gICAgICAgRERQX0NPTVBPTkVOVF9EUEkxLAo+ID4gPiAtICAgICAgIEREUF9DT01QT05F
TlRfRFNJMCwKPiA+ID4gLSAgICAgICBERFBfQ09NUE9ORU5UX0RTSTEsCj4gPiA+IC0gICAgICAg
RERQX0NPTVBPTkVOVF9EU0kyLAo+ID4gPiAtICAgICAgIEREUF9DT01QT05FTlRfRFNJMywKPiA+
ID4gLSAgICAgICBERFBfQ09NUE9ORU5UX0dBTU1BLAo+ID4gPiAtICAgICAgIEREUF9DT01QT05F
TlRfT0QwLAo+ID4gPiAtICAgICAgIEREUF9DT01QT05FTlRfT0QxLAo+ID4gPiAtICAgICAgIERE
UF9DT01QT05FTlRfT1ZMMCwKPiA+ID4gLSAgICAgICBERFBfQ09NUE9ORU5UX09WTF8yTDAsCj4g
PiA+IC0gICAgICAgRERQX0NPTVBPTkVOVF9PVkxfMkwxLAo+ID4gPiAtICAgICAgIEREUF9DT01Q
T05FTlRfT1ZMMSwKPiA+ID4gLSAgICAgICBERFBfQ09NUE9ORU5UX1BXTTAsCj4gPiA+IC0gICAg
ICAgRERQX0NPTVBPTkVOVF9QV00xLAo+ID4gPiAtICAgICAgIEREUF9DT01QT05FTlRfUFdNMiwK
PiA+ID4gLSAgICAgICBERFBfQ09NUE9ORU5UX1JETUEwLAo+ID4gPiAtICAgICAgIEREUF9DT01Q
T05FTlRfUkRNQTEsCj4gPiA+IC0gICAgICAgRERQX0NPTVBPTkVOVF9SRE1BMiwKPiA+ID4gLSAg
ICAgICBERFBfQ09NUE9ORU5UX1VGT0UsCj4gPiA+IC0gICAgICAgRERQX0NPTVBPTkVOVF9XRE1B
MCwKPiA+ID4gLSAgICAgICBERFBfQ09NUE9ORU5UX1dETUExLAo+ID4gPiAtICAgICAgIEREUF9D
T01QT05FTlRfSURfTUFYLAo+ID4gPiAtfTsKPiA+ID4gLQo+ID4gPiAgc3RydWN0IG10a19kZHBf
Y29tcDsKPiA+ID4gIHN0cnVjdCBjbWRxX3BrdDsKPiA+ID4gIHN0cnVjdCBtdGtfZGRwX2NvbXBf
ZnVuY3Mgewo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lz
LmMgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYwo+ID4gPiBpbmRleCBhNTVmMjU1
Li4zNmFkNjZiIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1z
eXMuYwo+ID4gPiArKysgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYwo+ID4gPiBA
QCAtNSwxMyArNSwxMSBAQAo+ID4gPiAgICovCj4gPiA+Cj4gPiA+ICAjaW5jbHVkZSA8bGludXgv
ZGV2aWNlLmg+Cj4gPiA+ICsjaW5jbHVkZSA8bGludXgvaW8uaD4KPiA+ID4gICNpbmNsdWRlIDxs
aW51eC9vZl9kZXZpY2UuaD4KPiA+ID4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2Uu
aD4KPiA+ID4gICNpbmNsdWRlIDxsaW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmg+Cj4gPiA+
Cj4gPiA+IC0jaW5jbHVkZSAiLi4vLi4vZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5oIgo+
ID4gPiAtI2luY2x1ZGUgIi4uLy4uL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5o
Igo+ID4gPiAtCj4gPiA+ICAjZGVmaW5lIERJU1BfUkVHX0NPTkZJR19ESVNQX09WTDBfTU9VVF9F
TiAgICAgIDB4MDQwCj4gPiA+ICAjZGVmaW5lIERJU1BfUkVHX0NPTkZJR19ESVNQX09WTDFfTU9V
VF9FTiAgICAgIDB4MDQ0Cj4gPiA+ICAjZGVmaW5lIERJU1BfUkVHX0NPTkZJR19ESVNQX09EX01P
VVRfRU4gICAgICAgICAgICAgICAgMHgwNDgKPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oIGIvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsv
bXRrLW1tc3lzLmgKPiA+ID4gaW5kZXggN2JhYjVkOS4uMjIyOGJmNiAxMDA2NDQKPiA+ID4gLS0t
IGEvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgKPiA+ID4gKysrIGIvaW5j
bHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgKPiA+ID4gQEAgLTksNiArOSwzOSBA
QAo+ID4gPiAgZW51bSBtdGtfZGRwX2NvbXBfaWQ7Cj4gPiA+ICBzdHJ1Y3QgZGV2aWNlOwo+ID4g
Pgo+ID4gPiArZW51bSBtdGtfZGRwX2NvbXBfaWQgewo+ID4gPiArICAgICAgIEREUF9DT01QT05F
TlRfQUFMMCwKPiA+ID4gKyAgICAgICBERFBfQ09NUE9ORU5UX0FBTDEsCj4gPiA+ICsgICAgICAg
RERQX0NPTVBPTkVOVF9CTFMsCj4gPiA+ICsgICAgICAgRERQX0NPTVBPTkVOVF9DQ09SUiwKPiA+
ID4gKyAgICAgICBERFBfQ09NUE9ORU5UX0NPTE9SMCwKPiA+ID4gKyAgICAgICBERFBfQ09NUE9O
RU5UX0NPTE9SMSwKPiA+ID4gKyAgICAgICBERFBfQ09NUE9ORU5UX0RJVEhFUiwKPiA+ID4gKyAg
ICAgICBERFBfQ09NUE9ORU5UX0RQSTAsCj4gPiA+ICsgICAgICAgRERQX0NPTVBPTkVOVF9EUEkx
LAo+ID4gPiArICAgICAgIEREUF9DT01QT05FTlRfRFNJMCwKPiA+ID4gKyAgICAgICBERFBfQ09N
UE9ORU5UX0RTSTEsCj4gPiA+ICsgICAgICAgRERQX0NPTVBPTkVOVF9EU0kyLAo+ID4gPiArICAg
ICAgIEREUF9DT01QT05FTlRfRFNJMywKPiA+ID4gKyAgICAgICBERFBfQ09NUE9ORU5UX0dBTU1B
LAo+ID4gPiArICAgICAgIEREUF9DT01QT05FTlRfT0QwLAo+ID4gPiArICAgICAgIEREUF9DT01Q
T05FTlRfT0QxLAo+ID4gPiArICAgICAgIEREUF9DT01QT05FTlRfT1ZMMCwKPiA+ID4gKyAgICAg
ICBERFBfQ09NUE9ORU5UX09WTF8yTDAsCj4gPiA+ICsgICAgICAgRERQX0NPTVBPTkVOVF9PVkxf
MkwxLAo+ID4gPiArICAgICAgIEREUF9DT01QT05FTlRfT1ZMMSwKPiA+ID4gKyAgICAgICBERFBf
Q09NUE9ORU5UX1BXTTAsCj4gPiA+ICsgICAgICAgRERQX0NPTVBPTkVOVF9QV00xLAo+ID4gPiAr
ICAgICAgIEREUF9DT01QT05FTlRfUFdNMiwKPiA+ID4gKyAgICAgICBERFBfQ09NUE9ORU5UX1JE
TUEwLAo+ID4gPiArICAgICAgIEREUF9DT01QT05FTlRfUkRNQTEsCj4gPiA+ICsgICAgICAgRERQ
X0NPTVBPTkVOVF9SRE1BMiwKPiA+ID4gKyAgICAgICBERFBfQ09NUE9ORU5UX1VGT0UsCj4gPiA+
ICsgICAgICAgRERQX0NPTVBPTkVOVF9XRE1BMCwKPiA+ID4gKyAgICAgICBERFBfQ09NUE9ORU5U
X1dETUExLAo+ID4gPiArICAgICAgIEREUF9DT01QT05FTlRfSURfTUFYLAo+ID4gPiArfTsKPiA+
ID4gKwo+ID4gPiAgdm9pZCBtdGtfbW1zeXNfZGRwX2Nvbm5lY3Qoc3RydWN0IGRldmljZSAqZGV2
LAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIG10a19kZHBfY29tcF9pZCBj
dXIsCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gbXRrX2RkcF9jb21wX2lk
IG5leHQpOwo+ID4gPiAtLQo+ID4gPiAxLjguMS4xLmRpcnR5Cj4KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdAo+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
