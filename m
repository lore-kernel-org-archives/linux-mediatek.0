Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DC9C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 15:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g5k66xZUMXIwrDiH+3AsBYIGFpzWctixfOC7lk+Fmjo=; b=vYbOWMH4JLaJHE
	8Zm0Kr97MudtJhp/wnrUIoxPM4Eyp6f2ECjrZrDbxTEmhDvZuMN4TP9JPEDh7XSn+vHPpuInbrZ6t
	68RUcPniJnj3tYBBayGvwAkMimYLOmfl4zuE0ptZR0KVSZbCeVUfLidIBg+5f2Ntxy4SqJuQ0EBcW
	kNCfxmu3GIgCAniKRWX5xeBLQaNb1GGJoRYcwcm8oyfQadp6mLDSQNGWoHCgOm9QH/bMP3wK4LVDB
	FOhe8w9ASgwd/dqaGpzrBnn2gJVK/X4cuxg0/pYarFPLGFsFLfUqF8FOpeEhsyziyDk7AXxGg+Z6y
	Vze7UM7AI/WJlOOqPXVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKiW0-00BE4C-S5; Thu, 17 Feb 2022 15:16:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKiVn-00BE12-TQ; Thu, 17 Feb 2022 15:16:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2F80061E8A;
 Thu, 17 Feb 2022 15:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10EF4C340F5;
 Thu, 17 Feb 2022 15:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645110962;
 bh=ltIrHZ5kE+koRIY5ZxoTB2ezjOerynjz7q6O20tGhjk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mN5wEfgIdmp7WvMgItg/375+CzWUq3y/DG1UoUgNxSar3uCXmNRFT1j0ytnIPknj3
 Lvz7VjBLwb41kdBaQFcz30Je3OwD6x6f4Lfm3XVIvrpGH40riEzhRWs0mHPbRIpQ2n
 GPEcLYzKiXl/0uCxgOTVhogzjVZUxJy4JkqF6DcpPwaeNY6s8ykkTpA0tttHxipDP8
 Ix9ZmdMa1PjJBtJCGTQMQ8Ffre1IegmkFirwrDl1LLuTcGOF/nNss45Sm054rEhMSi
 UciSy5cfk+LdIXEzJPi3+yC2nXKJdw0f7+4AfYC+LL/30b5XL+/V+AwRuXmMYX2pac
 VAwRZ/S5cLwrw==
Received: by mail-ej1-f42.google.com with SMTP id hw13so8011535ejc.9;
 Thu, 17 Feb 2022 07:16:01 -0800 (PST)
X-Gm-Message-State: AOAM530/ec/pp1oGzEH2p83k3fE4fSrviUs35Lf2aREu/jyAlB8B8ZF6
 Oj0Hf/02fJygUlBRQSwKWxrryZG0/SSK27goEw==
X-Google-Smtp-Source: ABdhPJwWhmmbYUMUpT41cY1OCQWwTtA0ZK/OW2pNlNGzpnqu/sg0IPf8wGGwkq3V2cNbK5F8ACQlP6EYpC31RW+Gb1k=
X-Received: by 2002:a17:906:8143:b0:6cf:73c1:8a0 with SMTP id
 z3-20020a170906814300b006cf73c108a0mr2822909ejw.406.1645110960294; Thu, 17
 Feb 2022 07:16:00 -0800 (PST)
MIME-Version: 1.0
References: <20220214092742.3461587-1-jstephan@baylibre.com>
 <0a331caa-7578-60f5-cbd8-f6c8c29a629f@collabora.com>
In-Reply-To: <0a331caa-7578-60f5-cbd8-f6c8c29a629f@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 17 Feb 2022 23:15:47 +0800
X-Gmail-Original-Message-ID: <CAAOTY_82E2BK1cxwbsDsj5DURrY245Xnd-04N=4vevCRMjkZpw@mail.gmail.com>
Message-ID: <CAAOTY_82E2BK1cxwbsDsj5DURrY245Xnd-04N=4vevCRMjkZpw@mail.gmail.com>
Subject: Re: [PATCH v4] drm/mediatek: allow commands to be sent during video
 mode
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Julien STEPHAN <jstephan@baylibre.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>, 
 "moderated list:DRM DRIVERS FOR MEDIATEK" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_071604_067637_15A143D0 
X-CRM114-Status: GOOD (  27.34  )
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

IFsxSGksIEp1bGllbjoKCkFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2No
aW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+IOaWvAoyMDIy5bm0MuaciDE05pelIOmAseS4gCDk
uIvljYg1OjQz5a+r6YGT77yaCj4KPiBJbCAxNC8wMi8yMiAxMDoyNywgSnVsaWVuIFNURVBIQU4g
aGEgc2NyaXR0bzoKPiA+IE1pcGkgZHNpIHBhbmVsIGRyaXZlcnMgY2FuIHVzZSBtaXBpX2RzaV9k
Y3Nfe3NldCxnZXR9X2Rpc3BsYXlfYnJpZ2h0bmVzcygpCj4gPiB0byByZXF1ZXN0IGJhY2tsaWdo
dCBjaGFuZ2VzLgo+ID4KPiA+IFRoaXMgY2FuIGJlIGRvbmUgZHVyaW5nIHBhbmVsIGluaXRpYWxp
emF0aW9uIChkc2kgaXMgaW4gY29tbWFuZCBtb2RlKQo+ID4gb3IgYWZ0ZXJ3YXJkcyAoZHNpIGlz
IGluIFZpZGVvIE1vZGUpLgo+ID4KPiA+IFdoZW4gdGhlIERTSSBpcyBpbiBWaWRlbyBNb2RlLCBh
bGwgY29tbWFuZHMgYXJlIHJlamVjdGVkLgo+ID4KPiA+IERldGVjdCBjdXJyZW50IERTSSBtb2Rl
IGluIG10a19kc2lfaG9zdF90cmFuc2ZlcigpIGFuZCBzd2l0Y2ggbW9kZXMKPiA+IHRlbXBvcmFy
aWx5IHRvIGFsbG93IGNvbW1hbmRzIHRvIGJlIHNlbnQuCgpBcHBsaWVkIHRvIG1lZGlhdGVrLWRy
bS1uZXh0IFsxXSwgdGhhbmtzLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRy
bS1uZXh0CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKdWxp
ZW4gU1RFUEhBTiA8anN0ZXBoYW5AYmF5bGlicmUuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogTWF0
dGlqcyBLb3JwZXJzaG9layA8bWtvcnBlcnNob2VrQGJheWxpYnJlLmNvbT4KPgo+IFBsZWFzZSwg
bmV4dCB0aW1lLCBkb24ndCBkcm9wIHRoZSB0YWdzIHRoYXQgcmV2aWV3ZXJzIGFyZSBnaXZpbmcg
dG8geW91LCB1bmxlc3MKPiB0aGUgcGF0Y2ggY2hhbmdlcyByYWRpY2FsbHkuCj4KPiBSZXZpZXdl
ZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVn
bm9AY29sbGFib3JhLmNvbT4KPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIGluIHY0Ogo+ID4gICAgICAt
IGZpeCBtaXNzaW5nIHNwYWNlOiAgInJldCA6IHJlY3ZfY250OyIKPiA+IENoYW5nZXMgaW4gdjM6
Cj4gPiAgICAgIC0gaW5jcmVhc2UgcmVhZGFiaWxpdHkgb2YgY29kZSBhbmQgdXNlIGNvcnJlY3Qg
cmV0dXJuIHZhcmlhYmxlIChzZWUKPiA+ICAgICAgICBjb21tZW50Cj4gPiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1tZWRpYXRlay80OTA3YmRjMS1iNGE2LWU5YWQtNWNmYS0yNjZmYzIw
YzBiZWNAY29sbGFib3JhLmNvbS8pCj4gPgo+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+ICAgICAgLSB1
cGRhdGUgY29tbWl0IG1lc3NhZ2UgdG8gYmUgbW9yZSBkZXNjcmlwdGl2ZQo+ID4KPiA+ICAgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDMzICsrKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgOSBkZWxl
dGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiA+IGluZGV4IDVk
OTBkMmViMDAxOS4uYWJkZDljZGViZDg2IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kc2kuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kc2kuYwo+ID4gQEAgLTg5MSwyNCArODkxLDMzIEBAIHN0YXRpYyBzc2l6ZV90IG10a19kc2lf
aG9zdF90cmFuc2ZlcihzdHJ1Y3QgbWlwaV9kc2lfaG9zdCAqaG9zdCwKPiA+ICAgICAgIHU4IHJl
YWRfZGF0YVsxNl07Cj4gPiAgICAgICB2b2lkICpzcmNfYWRkcjsKPiA+ICAgICAgIHU4IGlycV9m
bGFnID0gQ01EX0RPTkVfSU5UX0ZMQUc7Cj4gPiArICAgICB1MzIgZHNpX21vZGU7Cj4gPiArICAg
ICBpbnQgcmV0Owo+ID4KPiA+IC0gICAgIGlmIChyZWFkbChkc2ktPnJlZ3MgKyBEU0lfTU9ERV9D
VFJMKSAmIE1PREUpIHsKPiA+IC0gICAgICAgICAgICAgRFJNX0VSUk9SKCJkc2kgZW5naW5lIGlz
IG5vdCBjb21tYW5kIG1vZGVcbiIpOwo+ID4gLSAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsK
PiA+ICsgICAgIGRzaV9tb2RlID0gcmVhZGwoZHNpLT5yZWdzICsgRFNJX01PREVfQ1RSTCk7Cj4g
PiArICAgICBpZiAoZHNpX21vZGUgJiBNT0RFKSB7Cj4gPiArICAgICAgICAgICAgIG10a19kc2lf
c3RvcChkc2kpOwo+ID4gKyAgICAgICAgICAgICByZXQgPSBtdGtfZHNpX3N3aXRjaF90b19jbWRf
bW9kZShkc2ksIFZNX0RPTkVfSU5UX0ZMQUcsIDUwMCk7Cj4gPiArICAgICAgICAgICAgIGlmIChy
ZXQpCj4gPiArICAgICAgICAgICAgICAgICAgICAgZ290byByZXN0b3JlX2RzaV9tb2RlOwo+ID4g
ICAgICAgfQo+ID4KPiA+ICAgICAgIGlmIChNVEtfRFNJX0hPU1RfSVNfUkVBRChtc2ctPnR5cGUp
KQo+ID4gICAgICAgICAgICAgICBpcnFfZmxhZyB8PSBMUFJYX1JEX1JEWV9JTlRfRkxBRzsKPiA+
Cj4gPiAtICAgICBpZiAobXRrX2RzaV9ob3N0X3NlbmRfY21kKGRzaSwgbXNnLCBpcnFfZmxhZykg
PCAwKQo+ID4gLSAgICAgICAgICAgICByZXR1cm4gLUVUSU1FOwo+ID4gKyAgICAgcmV0ID0gbXRr
X2RzaV9ob3N0X3NlbmRfY21kKGRzaSwgbXNnLCBpcnFfZmxhZyk7Cj4gPiArICAgICBpZiAocmV0
KQo+ID4gKyAgICAgICAgICAgICBnb3RvIHJlc3RvcmVfZHNpX21vZGU7Cj4gPgo+ID4gLSAgICAg
aWYgKCFNVEtfRFNJX0hPU1RfSVNfUkVBRChtc2ctPnR5cGUpKQo+ID4gLSAgICAgICAgICAgICBy
ZXR1cm4gMDsKPiA+ICsgICAgIGlmICghTVRLX0RTSV9IT1NUX0lTX1JFQUQobXNnLT50eXBlKSkg
ewo+ID4gKyAgICAgICAgICAgICByZWN2X2NudCA9IDA7Cj4gPiArICAgICAgICAgICAgIGdvdG8g
cmVzdG9yZV9kc2lfbW9kZTsKPiA+ICsgICAgIH0KPiA+Cj4gPiAgICAgICBpZiAoIW1zZy0+cnhf
YnVmKSB7Cj4gPiAgICAgICAgICAgICAgIERSTV9FUlJPUigiZHNpIHJlY2VpdmUgYnVmZmVyIHNp
emUgbWF5IGJlIE5VTExcbiIpOwo+ID4gLSAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+
ICsgICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsKPiA+ICsgICAgICAgICAgICAgZ290byByZXN0
b3JlX2RzaV9tb2RlOwo+ID4gICAgICAgfQo+ID4KPiA+ICAgICAgIGZvciAoaSA9IDA7IGkgPCAx
NjsgaSsrKQo+ID4gQEAgLTkzMyw3ICs5NDIsMTMgQEAgc3RhdGljIHNzaXplX3QgbXRrX2RzaV9o
b3N0X3RyYW5zZmVyKHN0cnVjdCBtaXBpX2RzaV9ob3N0ICpob3N0LAo+ID4gICAgICAgRFJNX0lO
Rk8oImRzaSBnZXQgJWQgYnl0ZSBkYXRhIGZyb20gdGhlIHBhbmVsIGFkZHJlc3MoMHgleClcbiIs
Cj4gPiAgICAgICAgICAgICAgICByZWN2X2NudCwgKigodTggKikobXNnLT50eF9idWYpKSk7Cj4g
Pgo+ID4gLSAgICAgcmV0dXJuIHJlY3ZfY250Owo+ID4gK3Jlc3RvcmVfZHNpX21vZGU6Cj4gPiAr
ICAgICBpZiAoZHNpX21vZGUgJiBNT0RFKSB7Cj4gPiArICAgICAgICAgICAgIG10a19kc2lfc2V0
X21vZGUoZHNpKTsKPiA+ICsgICAgICAgICAgICAgbXRrX2RzaV9zdGFydChkc2kpOwo+ID4gKyAg
ICAgfQo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIHJldCA8IDAgPyByZXQgOiByZWN2X2NudDsKPiA+
ICAgfQo+ID4KPiA+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBtaXBpX2RzaV9ob3N0X29wcyBtdGtf
ZHNpX29wcyA9IHsKPiA+IC0tCj4gPiAyLjM1LjEKPiA+Cj4KPgo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
