Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB35C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 13:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VLGDgTOzRfJp/JFItn0uAQ1CUY7cglLLPBxfRKyam50=; b=aC6X07xMYqzFMb93lltDDBl1Lr
	Mx354TJ75p4iliU+uFj3cu9Y+lUhzIrSD1M3I9FL+neJSzwzAcBqhzeaj2qY7glio9xHdI2BGAwkp
	ZpDIRfpKyypX72LwNqPY6tNM4DBl/YATqeLhmAUtTuTjG9+W4uvCjZ8MW+bbahJ/UpJ7v9xYRD7gk
	bTTkd2Tk+M/ZhgR0r3E145FKrnhLtPDVEDdaHfTAFREvEc7UaZOiQfeIrpTjMby+PZ15gOd13ouuB
	oi8ueQfQL+iYPF513SjY2Q1EIJ94P0fJzH5p2y0URxko0ngXVfwdQsp4RuGMToLntKMIrcF6HGdjR
	OQIgl1sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms34F-005JRO-Mh; Tue, 30 Nov 2021 13:21:07 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms341-005JO9-IH; Tue, 30 Nov 2021 13:20:55 +0000
Received: from [IPv6:2a01:e0a:120:3210:b422:9841:4afb:11b5] (unknown
 [IPv6:2a01:e0a:120:3210:b422:9841:4afb:11b5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: benjamin.gaignard)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8F1921F44745;
 Tue, 30 Nov 2021 13:20:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638278452; bh=ONtyTVbL9fzmae3u6JbAr4lLFBVbozE7teHyM5lzILY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=kl0ov2l5bz3CJRqCATSlOhgO7ZxikuoVtLKnBnQu8qEHSb3uuJzN5FNyTa0qdKW4V
 AcMIndG08QboHmeExDe9NApyEdmBMc5ltEAK3FA7YB2+kE32yHbk6VQdJPwN1w7xW1
 CCYEN/NvxOoiAQK3Lh9GX03SIFhhFc/8lG7fmS8q/QZPQrEo+bCFvFJyUIGWYymQ3k
 Lopycg7AwhdQCAw41zCUbZZHOPM4hi+xShh/zBHNmw/iKbBVT9ONjgnBO9KwvR/I4Q
 y/2w4scJXFxL3cTWd7465ewsyfGyCnamKFXvDvteyr+uFNnbZfxQFWFIQMMk6JEXwR
 0zV1hVgqIiByQ==
Subject: Re: [PATCH v11, 01/19] media: mtk-vcodec: Get numbers of register
 bases from DT
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20211129034201.5767-1-yunfei.dong@mediatek.com>
 <20211129034201.5767-2-yunfei.dong@mediatek.com>
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <5e350a02-eb4b-5080-8d13-fe01ccf5dd70@collabora.com>
Date: Tue, 30 Nov 2021 14:20:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211129034201.5767-2-yunfei.dong@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_052053_759230_3D7D4124 
X-CRM114-Status: GOOD (  27.58  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CkxlIDI5LzExLzIwMjEgw6AgMDQ6NDEsIFl1bmZlaSBEb25nIGEgw6ljcml0wqA6Cj4gRGlmZmVy
ZW50IHBsYXRmb3JtIG1heSBoYXMgZGlmZmVyZW50IG51bWJlcnMgb2YgcmVnaXN0ZXIgYmFzZXMu
IEdldHMgdGhlCj4gbnVtYmVycyBvZiByZWdpc3RlciBiYXNlcyBmcm9tIERUIChzaXplb2YodTMy
KSAqIDQgYnl0ZXMgZm9yIGVhY2gpLgo+Cj4gUmV2aWV3ZWQtYnk6IFR6dW5nLUJpIFNoaWg8dHp1
bmdiaUBnb29nbGUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFl1bmZlaSBEb25nIDx5dW5mZWkuZG9u
Z0BtZWRpYXRlay5jb20+Cj4gLS0tCj4gICAuLi4vcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNv
ZGVjX2RlY19kcnYuYyAgfCAzNyArKysrKysrKysrKysrKy0tLS0tCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMjggaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19kZWNfZHJ2LmMgYi9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19kZWNfZHJ2LmMKPiBpbmRl
eCBlNmU2YTgyMDNlZWIuLjU5Y2FmMjE2MzM0OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19kZWNfZHJ2LmMKPiArKysgYi9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19kZWNfZHJ2LmMKPiBAQCAtNzgs
NiArNzgsMzAgQEAgc3RhdGljIGlycXJldHVybl90IG10a192Y29kZWNfZGVjX2lycV9oYW5kbGVy
KGludCBpcnEsIHZvaWQgKnByaXYpCj4gICAJcmV0dXJuIElSUV9IQU5ETEVEOwo+ICAgfQo+ICAg
Cj4gK3N0YXRpYyBpbnQgbXRrX3Zjb2RlY19nZXRfcmVnX2Jhc2VzKHN0cnVjdCBtdGtfdmNvZGVj
X2RldiAqZGV2KQo+ICt7Cj4gKwlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2ID0gZGV2LT5w
bGF0X2RldjsKPiArCWludCByZWdfbnVtLCBpOwo+ICsKPiArCS8qIFNpemVvZih1MzIpICogNCBi
eXRlcyBmb3IgZWFjaCByZWdpc3RlciBiYXNlLiAqLwo+ICsJcmVnX251bSA9IG9mX3Byb3BlcnR5
X2NvdW50X2VsZW1zX29mX3NpemUocGRldi0+ZGV2Lm9mX25vZGUsICJyZWciLAo+ICsJCXNpemVv
Zih1MzIpICogNCk7CgpJdCBsb29rcyBzdHJhbmdlIGZvciBtZSB0byBoYXZlIGEgInJlZyIgc2l6
ZSBlcXVhbCB0byBzaXplb2YodTMyKSAqIDQuIFVzdWFsbHkKd2UgbW9yZSBzZWUgcmVnIHNpemUg
PSBzaXplb2YodTMyKS4KCj4gKwlpZiAocmVnX251bSA8PSAwIHx8IHJlZ19udW0gPiBOVU1fTUFY
X1ZERUNfUkVHX0JBU0UpIHsKCklmIHJlZ19udW0gPSBOVU1fTUFYX1ZERUNfUkVHX0JBU0UgeW91
IHdpbGwgaXRlcmF0ZSBvdXQgb2YgYm91bmRzIG9mIGRldi0+cmVnX2Jhc2UgYXJyYXkuClRoYXQg
bmV2ZXIgaGFwcGVucyBiZWNhdXNlIGRldi0+cmVnX2Jhc2Ugc2l6ZSBlcXVhbCBOVU1fTUFYX1ZD
T0RFQ19SRUdfQkFTRS4KVGhlIHF1ZXN0aW9uIGlzIHdoYXQgaXMgdGhlIHJlYWwgbmVlZGVkIHNp
emUgZm9yIGRldi0+cmVnX2Jhc2UgYXJyYXkgPyBOVU1fTUFYX1ZERUNfUkVHX0JBU0Ugb3IKTlVN
X01BWF9WQ09ERUNfUkVHX0JBU0UgPwoKUmVnYXJkcywKQmVuamFtaW4KCj4gKwkJZGV2X2Vycigm
cGRldi0+ZGV2LCAiSW52YWxpZCByZWdpc3RlciBwcm9wZXJ0eSBzaXplOiAlZFxuIiwgcmVnX251
bSk7Cj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwl9Cj4gKwo+ICsJZm9yIChpID0gMDsgaSA8IHJl
Z19udW07IGkrKykgewo+ICsJCWRldi0+cmVnX2Jhc2VbaV0gPSBkZXZtX3BsYXRmb3JtX2lvcmVt
YXBfcmVzb3VyY2UocGRldiwgaSk7Cj4gKwkJaWYgKElTX0VSUihkZXYtPnJlZ19iYXNlW2ldKSkK
PiArCQkJcmV0dXJuIFBUUl9FUlIoZGV2LT5yZWdfYmFzZVtpXSk7Cj4gKwo+ICsJCW10a192NGwy
X2RlYnVnKDIsICJyZWdbJWRdIGJhc2U9JXAiLCBpLCBkZXYtPnJlZ19iYXNlW2ldKTsKPiArCX0K
PiArCj4gKwlyZXR1cm4gMDsKPiArfQo+ICsKPiAgIHN0YXRpYyBpbnQgZm9wc192Y29kZWNfb3Bl
bihzdHJ1Y3QgZmlsZSAqZmlsZSkKPiAgIHsKPiAgIAlzdHJ1Y3QgbXRrX3Zjb2RlY19kZXYgKmRl
diA9IHZpZGVvX2RydmRhdGEoZmlsZSk7Cj4gQEAgLTIwNiw3ICsyMzAsNyBAQCBzdGF0aWMgaW50
IG10a192Y29kZWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgIAlzdHJ1
Y3QgcmVzb3VyY2UgKnJlczsKPiAgIAlwaGFuZGxlIHJwcm9jX3BoYW5kbGU7Cj4gICAJZW51bSBt
dGtfdmNvZGVjX2Z3X3R5cGUgZndfdHlwZTsKPiAtCWludCBpLCByZXQ7Cj4gKwlpbnQgcmV0Owo+
ICAgCj4gICAJZGV2ID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqZGV2KSwgR0ZQ
X0tFUk5FTCk7Cj4gICAJaWYgKCFkZXYpCj4gQEAgLTIzOCwxNCArMjYyLDkgQEAgc3RhdGljIGlu
dCBtdGtfdmNvZGVjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAJCWdv
dG8gZXJyX2RlY19wbTsKPiAgIAl9Cj4gICAKPiAtCWZvciAoaSA9IDA7IGkgPCBOVU1fTUFYX1ZE
RUNfUkVHX0JBU0U7IGkrKykgewo+IC0JCWRldi0+cmVnX2Jhc2VbaV0gPSBkZXZtX3BsYXRmb3Jt
X2lvcmVtYXBfcmVzb3VyY2UocGRldiwgaSk7Cj4gLQkJaWYgKElTX0VSUigoX19mb3JjZSB2b2lk
ICopZGV2LT5yZWdfYmFzZVtpXSkpIHsKPiAtCQkJcmV0ID0gUFRSX0VSUigoX19mb3JjZSB2b2lk
ICopZGV2LT5yZWdfYmFzZVtpXSk7Cj4gLQkJCWdvdG8gZXJyX3JlczsKPiAtCQl9Cj4gLQkJbXRr
X3Y0bDJfZGVidWcoMiwgInJlZ1slZF0gYmFzZT0lcCIsIGksIGRldi0+cmVnX2Jhc2VbaV0pOwo+
IC0JfQo+ICsJcmV0ID0gbXRrX3Zjb2RlY19nZXRfcmVnX2Jhc2VzKGRldik7Cj4gKwlpZiAocmV0
KQo+ICsJCWdvdG8gZXJyX3JlczsKPiAgIAo+ICAgCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJj
ZShwZGV2LCBJT1JFU09VUkNFX0lSUSwgMCk7Cj4gICAJaWYgKHJlcyA9PSBOVUxMKSB7CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
