Return-Path: <SRS0=0J5R=7B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEE0C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2020 23:52:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D926620823
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2020 23:52:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nmpoNRuF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uORF1Inm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D926620823
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sEVLVjN+NYyff+9/G2p/0vovU7wy3/HsY/gw1BpJFC4=; b=nmpoNRuF1hMLVH
	+O08IcSMBzdTeUBXUCLjYFjr072vC+wrnpGJSxKnBI1Sc3zbr4jnO2O7IVLGu34ct2toNTtEDjYpi
	7ZC0LX+NrCGsnwL6swTikhXzoRnsOlAbfY1noleAynoU0NMsUIcx9kKAqLtJ/b5ZdraJHdE1Nvvty
	yCbKzRn8ZSC1CcKXaXeXl3VONTvfQ9Z97QZUtdt9QPSrF9ZKfLQSobMWspCzGuz2AVSqqPaofwF68
	OxzUI3xF3bAVUaE+l6Q5S0zoEu3OJa9XfTw8INry0oNEqZlLVqIPALF5GG2DW5veQqg05WRFBxr3V
	6j/AX5dGqJejFH0WInrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbC2C-0007jO-PB; Tue, 19 May 2020 23:52:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbC1z-0007ab-Ue; Tue, 19 May 2020 23:52:21 +0000
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D0D0D20823;
 Tue, 19 May 2020 23:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589932339;
 bh=OWt0CaD4Fsfw5siM0y6++CUzVEtsGrAx7EDLibWsgWo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uORF1InmUjSKZcuPCDnZOzdo8NwdP/wvwP56Tx9AFtNogyil+/J32dElpEfXwnRzY
 ANI5GiQyZ5bhMuRFcxkSo0oa7ffh+qS7mUlGM5tZaVPYxFFuGISChy2xxXAc/qZEmv
 C/JNe7TJUBeE6PWjNcmVHfBKOGADlfBzyiChf/8U=
Received: by mail-ej1-f43.google.com with SMTP id se13so1065910ejb.9;
 Tue, 19 May 2020 16:52:18 -0700 (PDT)
X-Gm-Message-State: AOAM531ra5B+84m9Zmc2EK0e/NVVHKWDdBzxjL1IXMCP0iM4Zdw0y+zb
 mu1aJcS02YVRgKHTxsOPj56HPZKF/OvQ2GoiBQ==
X-Google-Smtp-Source: ABdhPJw1JCDhqKXkvZGIM4WsoCnWJfa3YD2v8vdk6bmkEBqQMPaWHJWvH+7WhRBlcuyMD61jGwKRPu6WcVgmnxgJy44=
X-Received: by 2002:a17:906:abce:: with SMTP id
 kq14mr1448685ejb.187.1589932337214; 
 Tue, 19 May 2020 16:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200518113156.25009-1-matthias.bgg@kernel.org>
 <20200518113156.25009-3-matthias.bgg@kernel.org>
 <CAAOTY_80D6ZMM5_nEyf_XDjOLaWCOyi3mn9ibWhNX8_ozPK1BQ@mail.gmail.com>
 <3a8b3846-c399-2193-a203-8707d693dad8@suse.com>
In-Reply-To: <3a8b3846-c399-2193-a203-8707d693dad8@suse.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 20 May 2020 07:52:05 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-Puu4d2nLjxdYLr-zMyJag4cTdtX5oG+GE6fuG_Qphjw@mail.gmail.com>
Message-ID: <CAAOTY_-Puu4d2nLjxdYLr-zMyJag4cTdtX5oG+GE6fuG_Qphjw@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk/soc: mediatek: mt6779: Bind clock driver from
 platform device
To: Matthias Brugger <mbrugger@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_165220_029518_CDFF0F4A 
X-CRM114-Status: GOOD (  23.87  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Allison Randal <allison@lohutok.net>, matthias.bgg@kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, mtk01761 <wendell.lin@mediatek.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TWF0dGhpYXMgQnJ1Z2dlciA8bWJydWdnZXJAc3VzZS5jb20+IOaWvCAyMDIw5bm0NeaciDIw5pel
IOmAseS4iSDkuIrljYg1OjI25a+r6YGT77yaCj4KPgo+Cj4gT24gMTkvMDUvMjAyMCAxNzoxMCwg
Q2h1bi1LdWFuZyBIdSB3cm90ZToKPiA+IEhpLCBNYXR0aGlhczoKPiA+Cj4gPiA8bWF0dGhpYXMu
YmdnQGtlcm5lbC5vcmc+IOaWvCAyMDIw5bm0NeaciDE45pelIOmAseS4gCDkuIvljYg3OjMz5a+r
6YGT77yaCj4gPj4KPiA+PiBGcm9tOiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21h
aWwuY29tPgo+ID4+Cj4gPj4gVGhlIG1tc3lzIGRyaXZlciBpcyBub3cgdGhlIHRvcCBsZXZlbCBl
bnRyeSBwb2ludCBmb3IgdGhlIG11bHRpbWVkaWEKPiA+PiBzeXN0ZW0gKG1tc3lzKSwgd2UgYmlu
ZCB0aGUgY2xvY2sgZHJpdmVyIGJ5IGNyZWF0aW5nIGEgcGxhdGZvcm0gZGV2aWNlLgo+ID4+IFdl
IGFsc28gYmluZCB0aGUgTWVkaWFUZWsgRFJNIGRyaXZlciB3aGljaCBpcyBub3QgeWV0IGltcGxl
bWVudCBhbmQKPiA+PiB0aGVyZWZvciB3aWxsIGVycnJvciBvdXQgZm9yIG5vdy4KPiA+Pgo+ID4+
IFNpZ25lZC1vZmYtYnk6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+
Cj4gPj4gLS0tCj4gPj4KPiA+PiAgZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Njc3OS1tbS5j
IHwgOSArKy0tLS0tLS0KPiA+PiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMgICAg
IHwgOCArKysrKysrKwo+ID4+ICAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDcg
ZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsv
Y2xrLW10Njc3OS1tbS5jIGIvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Njc3OS1tbS5jCj4g
Pj4gaW5kZXggZmI1ZmJiOGUzZTQxLi4wNTljMWE0MWFjN2EgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJp
dmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Njc3OS1tbS5jCj4gPj4gKysrIGIvZHJpdmVycy9jbGsv
bWVkaWF0ZWsvY2xrLW10Njc3OS1tbS5jCj4gPj4gQEAgLTg0LDE1ICs4NCwxMSBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IG10a19nYXRlIG1tX2Nsa3NbXSA9IHsKPiA+PiAgICAgICAgIEdBVEVfTU0x
KENMS19NTV9ESVNQX09WTF9GQkRDLCAibW1fZGlzcF9vdmxfZmJkYyIsICJtbV9zZWwiLCAxNiks
Cj4gPj4gIH07Cj4gPj4KPiA+PiAtc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgb2Zf
bWF0Y2hfY2xrX210Njc3OV9tbVtdID0gewo+ID4+IC0gICAgICAgeyAuY29tcGF0aWJsZSA9ICJt
ZWRpYXRlayxtdDY3NzktbW1zeXMiLCB9LAo+ID4+IC0gICAgICAge30KPiA+PiAtfTsKPiA+PiAt
Cj4gPj4gIHN0YXRpYyBpbnQgY2xrX210Njc3OV9tbV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQo+ID4+ICB7Cj4gPj4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRl
di0+ZGV2Owo+ID4+ICsgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpub2RlID0gZGV2LT5wYXJl
bnQtPm9mX25vZGU7Cj4gPj4gICAgICAgICBzdHJ1Y3QgY2xrX29uZWNlbGxfZGF0YSAqY2xrX2Rh
dGE7Cj4gPj4gLSAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBwZGV2LT5kZXYub2Zf
bm9kZTsKPiA+Pgo+ID4+ICAgICAgICAgY2xrX2RhdGEgPSBtdGtfYWxsb2NfY2xrX2RhdGEoQ0xL
X01NX05SX0NMSyk7Cj4gPj4KPiA+PiBAQCAtMTA2LDcgKzEwMiw2IEBAIHN0YXRpYyBzdHJ1Y3Qg
cGxhdGZvcm1fZHJpdmVyIGNsa19tdDY3NzlfbW1fZHJ2ID0gewo+ID4+ICAgICAgICAgLnByb2Jl
ID0gY2xrX210Njc3OV9tbV9wcm9iZSwKPiA+PiAgICAgICAgIC5kcml2ZXIgPSB7Cj4gPj4gICAg
ICAgICAgICAgICAgIC5uYW1lID0gImNsay1tdDY3NzktbW0iLAo+ID4+IC0gICAgICAgICAgICAg
ICAub2ZfbWF0Y2hfdGFibGUgPSBvZl9tYXRjaF9jbGtfbXQ2Nzc5X21tLAo+ID4+ICAgICAgICAg
fSwKPiA+PiAgfTsKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9t
dGstbW1zeXMuYyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jCj4gPj4gaW5kZXgg
ZmVlNjRjOGQzMDIwLi5kYzE1ODA4Y2YzYTMgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9zb2Mv
bWVkaWF0ZWsvbXRrLW1tc3lzLmMKPiA+PiArKysgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGst
bW1zeXMuYwo+ID4+IEBAIC04OCw2ICs4OCwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19t
bXN5c19kcml2ZXJfZGF0YSBtdDI3MTJfbW1zeXNfZHJpdmVyX2RhdGEgPSB7Cj4gPj4gICAgICAg
ICAuY2xrX2RyaXZlciA9ICJjbGstbXQyNzEyLW1tIiwKPiA+PiAgfTsKPiA+Pgo+ID4+ICtzdGF0
aWMgY29uc3Qgc3RydWN0IG10a19tbXN5c19kcml2ZXJfZGF0YSBtdDY3NzlfbW1zeXNfZHJpdmVy
X2RhdGEgPSB7Cj4gPj4gKyAgICAgICAuY2xrX2RyaXZlciA9ICJjbGstbXQ2Nzc5LW1tIiwKPiA+
Cj4gPiBUaGlzIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUsIGJ1dCBJJ3ZlIG9uZSBxdWVzdGlvbjog
d2h5IGRybSBkcml2ZXIKPiA+IGp1c3QgdXNlIHNpbmdsZSAibWVkaWF0ZWstZHJtIiBmb3Igc3Vi
IGRyaXZlciBuYW1lLCBidXQgY2xvY2sgZHJpdmVyCj4gPiBoYXMgZGlmZmVyZW50IG5hbWUgZm9y
IGVhY2ggU29DPwo+ID4gQ291bGQgd2UganVzdCB1c2Ugc2luZ2xlIG5hbWUgZm9yIGNsb2NrIGRy
aXZlciBzdWNoIGFzICJtZWRpYXRlay1jbGstbW0iPwo+Cj4gQmVjYXVzZSB0aGUgRFJNIGZvciBh
bGwgU29DcyBhcmUgaGFuZGxlZCBpbiB0aGUgc2FtZSBkcml2ZXIsIHdoaWxlIHdlIGhhdmUgYQo+
IGRpZmZlcmVudCBjbG9jayBkcml2ZXJzIGZvciBlYWNoIFNvQy4gU28gd2UgbmVlZCB0byBzcGVj
aWZ5IHdoaWNoIGNsb2NrIGRyaXZlcgo+IHdlIHdhbnQgdG8gbG9hZC4KPgo+IElmIHdlIHdhbnQg
dG8gY2hhbmdlIHRoYXQsIHdlIHdvdWxkIG5lZWQgdG8gcmVmYWN0b3IgaGVhdmlseSB0aGUgY2xv
Y2sgZHJpdmVycwo+IGZvciBhbGwgTWVkaWFUZWsgU29Dcy4gSSBkb24ndCB0aGluayBpdCdzIHdv
cnRoIHRoZSBlZmZvcnQuCj4KCk9LLCBzbyBmb3IgdGhpcyBwYXRjaCwKClJldmlld2VkLWJ5OiBD
aHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4gUmVnYXJkcywKPiBNYXR0
aGlhcwo+Cj4gPgo+ID4gUmVnYXJkcywKPiA+IENodW4tS3VhbmcuCj4gPgo+ID4+ICt9Owo+ID4+
ICsKPiA+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfbW1zeXNfZHJpdmVyX2RhdGEgbXQ2Nzk3
X21tc3lzX2RyaXZlcl9kYXRhID0gewo+ID4+ICAgICAgICAgLmNsa19kcml2ZXIgPSAiY2xrLW10
Njc5Ny1tbSIsCj4gPj4gIH07Cj4gPj4gQEAgLTM0Myw2ICszNDcsMTAgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBvZl9kZXZpY2VfaWQgb2ZfbWF0Y2hfbXRrX21tc3lzW10gPSB7Cj4gPj4gICAgICAg
ICAgICAgICAgIC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcxMi1tbXN5cyIsCj4gPj4gICAg
ICAgICAgICAgICAgIC5kYXRhID0gJm10MjcxMl9tbXN5c19kcml2ZXJfZGF0YSwKPiA+PiAgICAg
ICAgIH0sCj4gPj4gKyAgICAgICB7Cj4gPj4gKyAgICAgICAgICAgICAgIC5jb21wYXRpYmxlID0g
Im1lZGlhdGVrLG10Njc3OS1tbXN5cyIsCj4gPj4gKyAgICAgICAgICAgICAgIC5kYXRhID0gJm10
Njc3OV9tbXN5c19kcml2ZXJfZGF0YSwKPiA+PiArICAgICAgIH0sCj4gPj4gICAgICAgICB7Cj4g
Pj4gICAgICAgICAgICAgICAgIC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10Njc5Ny1tbXN5cyIs
Cj4gPj4gICAgICAgICAgICAgICAgIC5kYXRhID0gJm10Njc5N19tbXN5c19kcml2ZXJfZGF0YSwK
PiA+PiAtLQo+ID4+IDIuMjYuMgo+ID4+Cj4gPj4KPiA+PiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dAo+ID4+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+PiBodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
