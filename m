Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D661CC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 06:08:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9089761A2C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 06:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9089761A2C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zjcpGgMLIrAvMSAmSq4Fo12CNskWbSSKy8L4NADtYSM=; b=ygRB5g+OnfSucc
	gR75XuecGl9esDkYwtTKfwG0eeZOeH1FagTytLCSLbwLr9FC/qYRCJk0HZcKcmvApKqVbMpkdGnT1
	cLsp2ANLa2+LGOH0nTc9z2Lo/b0vIlXkhBuGi386B2wKPKdH1i9NWaFyjQIRBUjrIC+hnSHTHAN3m
	f9pIeMxSh6v2hmN8qQZMKNEjNoJ4KucJHBortRfVrJ3qvSHGqv0vVVe/heHkOy4Q4bVkiZQSmp71a
	t9jNZzdAxgJ2mt02hgjIVGspdi5cOroI2dwm8IpYO9iWHJ90qKezhB4cLL62R1a6QQdUfkoY5NCdu
	tRt5bnHt/QHjOwj2H/1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFVmf-00GBGx-Lg; Mon, 16 Aug 2021 06:07:41 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFVmc-00GBFs-Hb
 for linux-mediatek@lists.infradead.org; Mon, 16 Aug 2021 06:07:40 +0000
Received: by mail-ed1-x532.google.com with SMTP id r19so21343628eds.13
 for <linux-mediatek@lists.infradead.org>; Sun, 15 Aug 2021 23:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bcOvsnlJT1d9dnAvkvlt9SnlAkz5cg5CVjHW24mnbcE=;
 b=AG+wHQzsAHB+HuRiJtUUMh7y6KP3xdzMNs92u+0qQvnW9mpHu3geRUFi0cGiJqCWVC
 lOQJe5gN75pXtd6xYHRmLlvBztwyxDTL4CnGtxFafb7/3/UaLsr8t15DFZTPYWQl5cOn
 gnj8ipGHgfMRcyk1CIYdHav+1KDPuPxsz4CjZ1w9Mdv82z35Apd4KTp+gS6e8lmmt1Th
 UF4yn9MU1hva5c+RW7SuiGELsWHRCCClOWj6hIZOllTG/+BoFXVTMVEzttUtlxHaWFuQ
 Ddw67WZsgCjHXxS50C3eymvErKj2R0YC9EaFF37EeUcZspV7CiVnjP1prNwn7rr13oDP
 8C1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bcOvsnlJT1d9dnAvkvlt9SnlAkz5cg5CVjHW24mnbcE=;
 b=lcfzfc7szMWHYpObEXUokn6wAmLM/h32Idk328mtA+/j9DBWEyqIaAVLmgZK1op8sS
 NIGc42KTzYCbUSc8qHIY0rIhw9reyC4C+kLjpQ3JHntBeEAJ7dpt5opX2ufTthGqRiRm
 y1boSeaHArOICYBZUxvQtbFtvI/GGPE2PRI4H+2odBXG1YqBFJ2fiBBLi5i9fOoDUPbI
 dxhypGlSeoChSANS9fyjXoEr73vkGS+N6tNu3YR/Q8oSjP8g6lUSAPGw18As0vhoWZyV
 b3T5XLXfbXmhqF/7GB3ACzjafUwTihfDziYh48RGkUZv82COS6Myk7YBG8SreNAPYwqk
 dt5A==
X-Gm-Message-State: AOAM531c8X5DsnfWXY9yyqmqKv6STE6gy+qIrQUobM6AwGDIH9ZSK3Fj
 jt27MfCOiesIsbZvocZ29QoCTKD1/QmSc/Xicx4=
X-Google-Smtp-Source: ABdhPJzjH/bcVlrWEjvOvIrfgzEulvl7moPHxOgh+Jw4+FFyxhZG6hKHe3xD8eHYYGlOK2PUPTLKfneuQhOPL7L1VrI=
X-Received: by 2002:aa7:d40f:: with SMTP id z15mr18018364edq.113.1629094056370; 
 Sun, 15 Aug 2021 23:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210815235510.6597-1-chunkuang.hu@kernel.org>
In-Reply-To: <20210815235510.6597-1-chunkuang.hu@kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 16 Aug 2021 16:07:24 +1000
Message-ID: <CAPM=9tzRt6vtxxWAcRThk9gSoqJoiTOq=j3obCdUjxGPumu=Dg@mail.gmail.com>
Subject: Re: [GIT PULL] mediatek drm next for 5.15
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Fabien Parent <fparent@baylibre.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_230738_649805_3EEAFAD4 
X-CRM114-Status: GOOD (  16.35  )
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

ICBDQyBbTV0gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9hYWwubwovaG9tZS9h
aXJsaWVkL2RldmVsL2tlcm5lbC9kaW0vc3JjL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2NydGMuYzoyNTc6MTM6Cndhcm5pbmc6IOKAmG10a19kcm1fY21kcV9wa3RfZGVzdHJveeKA
mSBkZWZpbmVkIGJ1dCBub3QgdXNlZApbLVd1bnVzZWQtZnVuY3Rpb25dCiAgMjU3IHwgc3RhdGlj
IHZvaWQgbXRrX2RybV9jbWRxX3BrdF9kZXN0cm95KHN0cnVjdCBtYm94X2NoYW4gKmNoYW4sCnN0
cnVjdCBjbWRxX3BrdCAqcGt0KQogICAgICB8ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fgovaG9tZS9haXJsaWVkL2RldmVsL2tlcm5lbC9kaW0vc3JjL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYzoyMjk6MTI6Cndhcm5pbmc6IOKAmG10a19kcm1fY21k
cV9wa3RfY3JlYXRl4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkClstV3VudXNlZC1mdW5jdGlvbl0K
ICAyMjkgfCBzdGF0aWMgaW50IG10a19kcm1fY21kcV9wa3RfY3JlYXRlKHN0cnVjdCBtYm94X2No
YW4gKmNoYW4sCnN0cnVjdCBjbWRxX3BrdCAqcGt0LAogICAgICB8ICAgICAgICAgICAgXn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn4KICBMRCBbTV0gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tZWRp
YXRlay1kcm0ubwoKV2FybmluZyB3aGVuIGJ1aWx0IHdpdGggQ09ORklHX01US19DTURRIHR1cm5l
ZCBvZmYuIENhbiB5b3UgcGxlYXNlIGZpeAp0aGF0IGFuZCByZXNlbmQ/CgpEYXZlLgoKT24gTW9u
LCAxNiBBdWcgMjAyMSBhdCAwOTo1NSwgQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gSGksIERhdmUgJiBEYW5pZWw6Cj4KPiBUaGlzIGluY2x1ZGVzOgo+
Cj4gMS4gTVQ4MTMzIEFBTCBzdXBwb3J0LCBhZGp1c3QgcmRtYSBmaWZvIHRocmVzaG9sZCBmb3Jt
dWxhLgo+IDIuIEltcGxlbWVudCBtbWFwIGFzIEdFTSBvYmplY3QgZnVuY3Rpb24uCj4gMy4gQWRk
IHN1cHBvcnQgZm9yIE1UODE2Ny4KPiA0LiBUZXN0IGNvbXBvbmVudCBpbml0aWFsaXphdGlvbiBl
YXJsaWVyIGluIHRoZSBmdW5jdGlvbiBtdGtfZHJtX2NydGNfY3JlYXRlLgo+IDUuIENNRFEgcmVm
aW5lbWVudC4KPgo+IFJlZ2FyZHMsCj4gQ2h1bi1LdWFuZy4KPgo+Cj4gVGhlIGZvbGxvd2luZyBj
aGFuZ2VzIHNpbmNlIGNvbW1pdCBlNzNmMGYwZWU3NTQxMTcxZDg5ZjJlMjQ5MTEzMGM3NzcxYmE1
OGQzOgo+Cj4gICBMaW51eCA1LjE0LXJjMSAoMjAyMS0wNy0xMSAxNTowNzo0MCAtMDcwMCkKPgo+
IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+Cj4gICBodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXgu
Z2l0IHRhZ3MvbWVkaWF0ZWstZHJtLW5leHQtNS4xNQo+Cj4gZm9yIHlvdSB0byBmZXRjaCBjaGFu
Z2VzIHVwIHRvIDZlN2RjZDkyNjQ0YmFlYmRiMTM3ZTNhZjkwMDA2NGNlZWJjYWNhMjM6Cj4KPiAg
IGRybS9tZWRpYXRlazogQ2xlYXIgcGVuZGluZyBmbGFnIHdoZW4gY21kcSBwYWNrZXQgaXMgZG9u
ZSAoMjAyMS0wOC0xMiAwODoxNjoyNCArMDgwMCkKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBNZWRpYXRlayBEUk0g
TmV4dCBmb3IgTGludXggNS4xNQo+Cj4gMS4gTVQ4MTMzIEFBTCBzdXBwb3J0LCBhZGp1c3QgcmRt
YSBmaWZvIHRocmVzaG9sZCBmb3JtdWxhLgo+IDIuIEltcGxlbWVudCBtbWFwIGFzIEdFTSBvYmpl
Y3QgZnVuY3Rpb24uCj4gMy4gQWRkIHN1cHBvcnQgZm9yIE1UODE2Ny4KPiA0LiBUZXN0IGNvbXBv
bmVudCBpbml0aWFsaXphdGlvbiBlYXJsaWVyIGluIHRoZSBmdW5jdGlvbiBtdGtfZHJtX2NydGNf
Y3JlYXRlLgo+IDUuIENNRFEgcmVmaW5lbWVudC4KPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBDaHVuLUt1YW5nIEh1
ICg0KToKPiAgICAgICBkcm0vbWVkaWF0ZWs6IFVzZSBtYWlsYm94IHJ4X2NhbGxiYWNrIGluc3Rl
YWQgb2YgY21kcV90YXNrX2NiCj4gICAgICAgZHJtL21lZGlhdGVrOiBSZW1vdmUgc3RydWN0IGNt
ZHFfY2xpZW50Cj4gICAgICAgZHJtL21lZGlhdGVrOiBEZXRlY3QgQ01EUSBleGVjdXRpb24gdGlt
ZW91dAo+ICAgICAgIGRybS9tZWRpYXRlazogQWRkIGNtZHFfaGFuZGxlIGluIG10a19jcnRjCj4K
PiBEYWZuYSBIaXJzY2hmZWxkICgxKToKPiAgICAgICBkcm0vbWVkaWF0ZWs6IFRlc3QgY29tcG9u
ZW50IGluaXRpYWxpemF0aW9uIGVhcmxpZXIgaW4gdGhlIGZ1bmN0aW9uIG10a19kcm1fY3J0Y19j
cmVhdGUKPgo+IEZhYmllbiBQYXJlbnQgKDIpOgo+ICAgICAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5
OiBtZWRpYXRlazogZHNpOiBhZGQgZG9jdW1lbnRhdGlvbiBmb3IgTVQ4MTY3IFNvQwo+ICAgICAg
IGRybS9tZWRpYXRlazogQWRkIHN1cHBvcnQgZm9yIG1haW4gRERQIHBhdGggb24gTVQ4MTY3Cj4K
PiBUaG9tYXMgWmltbWVybWFubiAoMSk6Cj4gICAgICAgZHJtL21lZGlhdGVrOiBJbXBsZW1lbnQg
bW1hcCBhcyBHRU0gb2JqZWN0IGZ1bmN0aW9uCj4KPiBZb25ncWlhbmcgTml1ICg0KToKPiAgICAg
ICBkcm0vbWVkaWF0ZWs6IEFkanVzdCByZG1hIGZpZm8gdGhyZXNob2xkIGNhbGN1bGF0ZSBmb3Jt
dWxhCj4gICAgICAgZHJtL21lZGlhdGVrOiBTZXBhcmF0ZSBhYWwgc3ViIGRyaXZlcgo+ICAgICAg
IGRybS9tZWRpYXRlazogQWRkIG10ODE4MyBhYWwgc3VwcG9ydAo+ICAgICAgIGRybS9tZWRpYXRl
azogQ2xlYXIgcGVuZGluZyBmbGFnIHdoZW4gY21kcSBwYWNrZXQgaXMgZG9uZQo+Cj4gIC4uLi9i
aW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQgICAgIHwgICAyICstCj4g
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9NYWtlZmlsZSAgICAgICAgICAgICAgICAgIHwgICAz
ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9hYWwuYyAgICAgICAgICAg
IHwgMTY3ICsrKysrKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZGlzcF9kcnYuaCAgICAgICAgICAgIHwgICA5ICsrCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGlzcF9yZG1hLmMgICAgICAgICAgIHwgICA2ICstCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyAgICAgICAgICAgIHwgMTczICsrKysrKysrKysrKysr
KysrLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jICAg
ICAgICB8ICA0MiArLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYu
YyAgICAgICAgICAgICB8ICA1OSArKysrKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2Rydi5oICAgICAgICAgICAgIHwgICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZ2VtLmMgICAgICAgICAgICAgfCAgNDQgKystLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5oICAgICAgICAgICAgIHwgICAzIC0KPiAgMTEgZmls
ZXMgY2hhbmdlZCwgMzg2IGluc2VydGlvbnMoKyksIDEyMyBkZWxldGlvbnMoLSkKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9hYWwuYwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
