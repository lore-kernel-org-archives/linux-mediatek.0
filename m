Return-Path: <SRS0=kfxU=PO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D448AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 16:18:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A14EF603E9
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 16:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A14EF603E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0vqRGPgJe3+oIySI8koQe4l+F4C1fHYBvhj9dwIremI=; b=D3SOFTp3oH5Ybc
	XrYUD7v5Srmfbes88eV7G3fUgZIlCnGQhHcjUUTz0Qd2NXaa135io8uZpJkgoyM53GTmNZPlkVIPx
	EdFmFtkp49jBKnrD5Lc9Gml/gf/EIKQrqTkuFi6lpU+UVc68TA3krIo1WtOr9LM2E53JRWwkr36oG
	1Dfr068JSYsflbKw4SWZYC0dDre5tS8MqtCWgDhif7zlqTOLh+eyVtgeU876QPAjb4nIsXNjzIncr
	gEGh7WJxQFC6H6H+7x6JgbNOZfdP+fJ7mPLplI8d8gXgoOUXOXimfKyBZ7BF/K5KPLB3bleN8Uu34
	4cKaJ1EzrxKG9wWC5s6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfP9N-002Qo5-Tn; Tue, 26 Oct 2021 16:18:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfP1m-002MKk-84; Tue, 26 Oct 2021 16:10:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 936C760527;
 Tue, 26 Oct 2021 16:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635264617;
 bh=R9XHfPiiMdHaMgonXhRNxe+si5OeI8KDpG4+6gMNnWo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NGv2x7gMlrY1LtLLl5c4bS2IWIvcFygiFo44ecA791g53f0X5XVJrgGqa2grNBXh7
 xXcTV+1AMQzYXohfsuDbynUK/A7hZfjkjTpdtI9cpkVvaTZqb3L7bMEkb70ooVMZme
 MIN88r3X6azLM1mzkY0ZhqvxMH0e0dZ2GhwSdx2h8SNorTIk2xPmx75+2xMG2P/MUT
 fB49fUw5ke+ZOjqKg/ce6K6yKNSghXu1W96ToczdtRrPN/Y4kuGXRaIeKJf0fYqu7R
 WqUmcL4p/DpEvfFMoEFVGIzgdJ6VlWfsQtmpZQMUnSHjoyLCczXuPzRyfI5uOJhYKP
 dWONfacNYHLaw==
Received: by mail-ed1-f52.google.com with SMTP id y12so17245836eda.4;
 Tue, 26 Oct 2021 09:10:17 -0700 (PDT)
X-Gm-Message-State: AOAM533wzBTSy4jbL1vLhSmkhg26FbFT/WziAGsg/sxdW4VCd3LSN2ex
 wkX1UFYBgBIV2ybNVmhKn2aMKJii4Bbo+tetSg==
X-Google-Smtp-Source: ABdhPJyFy2UYH5W8n5qxwQhKlt0rY0EVB0dXXDZyKeTXA7dBLlF7y1ifgfrW3G4thyWRnm7C7npA+36pHS87eytsgRk=
X-Received: by 2002:a17:907:6ea6:: with SMTP id
 sh38mr31993724ejc.388.1635264489262; 
 Tue, 26 Oct 2021 09:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211026052916.8222-1-jason-jh.lin@mediatek.com>
 <20211026052916.8222-6-jason-jh.lin@mediatek.com>
In-Reply-To: <20211026052916.8222-6-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 27 Oct 2021 00:07:58 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8Wz8+k+XyZaojzuGu3mkR2oidFh09eYarQA_63NFJ__g@mail.gmail.com>
Message-ID: <CAAOTY_8Wz8+k+XyZaojzuGu3mkR2oidFh09eYarQA_63NFJ__g@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] drm/mediatek: Clear pending flag when cmdq packet
 is done
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 fshao@chromium.org, 
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_091018_424321_2C5565A8 
X-CRM114-Status: GOOD (  17.74  )
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

SGksIEphc29uOgoKamFzb24tamgubGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPiDmlrwg
MjAyMeW5tDEw5pyIMjbml6Ug6YCx5LqMIOS4i+WNiDE6Mjnlr6vpgZPvvJoKPgo+IEZyb206IFlv
bmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+Cj4gSW4gY21kcSBtb2Rl
LCBwYWNrZXQgbWF5IGJlIGZsdXNoZWQgYmVmb3JlIGl0IGlzIGV4ZWN1dGVkLCBzbwo+IHRoZSBw
ZW5kaW5nIGZsYWcgc2hvdWxkIGJlIGNsZWFyZWQgYWZ0ZXIgY21kcSBwYWNrZXQgaXMgZG9uZS4K
ClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4K
PiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBqYXNvbi1qaC5saW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5j
b20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyB8IDUx
ICsrKysrKysrKysrKysrKysrKysrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQ2IGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
Y3J0Yy5jCj4gaW5kZXggMzFmMDVlZmMxYmMwLi5lYTI4NTc5NTc3NmYgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jCj4gQEAgLTI3NSw4ICsyNzUsNDIgQEAgc3Ry
dWN0IG10a19kZHBfY29tcCAqbXRrX2RybV9kZHBfY29tcF9mb3JfcGxhbmUoc3RydWN0IGRybV9j
cnRjICpjcnRjLAo+ICAjaWYgSVNfUkVBQ0hBQkxFKENPTkZJR19NVEtfQ01EUSkKPiAgc3RhdGlj
IHZvaWQgZGRwX2NtZHFfY2Ioc3RydWN0IG1ib3hfY2xpZW50ICpjbCwgdm9pZCAqbXNzZykKPiAg
ewo+ICsgICAgICAgc3RydWN0IGNtZHFfY2JfZGF0YSAqZGF0YSA9IG1zc2c7Cj4gICAgICAgICBz
dHJ1Y3QgY21kcV9jbGllbnQgKmNtZHFfY2wgPSBjb250YWluZXJfb2YoY2wsIHN0cnVjdCBjbWRx
X2NsaWVudCwgY2xpZW50KTsKPiAgICAgICAgIHN0cnVjdCBtdGtfZHJtX2NydGMgKm10a19jcnRj
ID0gY29udGFpbmVyX29mKGNtZHFfY2wsIHN0cnVjdCBtdGtfZHJtX2NydGMsIGNtZHFfY2xpZW50
KTsKPiArICAgICAgIHN0cnVjdCBtdGtfY3J0Y19zdGF0ZSAqc3RhdGU7Cj4gKyAgICAgICB1bnNp
Z25lZCBpbnQgaTsKPiArCj4gKyAgICAgICBpZiAoZGF0YS0+c3RhIDwgMCkKPiArICAgICAgICAg
ICAgICAgcmV0dXJuOwo+ICsKPiArICAgICAgIHN0YXRlID0gdG9fbXRrX2NydGNfc3RhdGUobXRr
X2NydGMtPmJhc2Uuc3RhdGUpOwo+ICsKPiArICAgICAgIHN0YXRlLT5wZW5kaW5nX2NvbmZpZyA9
IGZhbHNlOwo+ICsKPiArICAgICAgIGlmIChtdGtfY3J0Yy0+cGVuZGluZ19wbGFuZXMpIHsKPiAr
ICAgICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8IG10a19jcnRjLT5sYXllcl9ucjsgaSsrKSB7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9wbGFuZSAqcGxhbmUgPSAmbXRr
X2NydGMtPnBsYW5lc1tpXTsKPiArICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbXRrX3Bs
YW5lX3N0YXRlICpwbGFuZV9zdGF0ZTsKPiArCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcGxh
bmVfc3RhdGUgPSB0b19tdGtfcGxhbmVfc3RhdGUocGxhbmUtPnN0YXRlKTsKPiArCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcGxhbmVfc3RhdGUtPnBlbmRpbmcuY29uZmlnID0gZmFsc2U7Cj4g
KyAgICAgICAgICAgICAgIH0KPiArICAgICAgICAgICAgICAgbXRrX2NydGMtPnBlbmRpbmdfcGxh
bmVzID0gZmFsc2U7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgaWYgKG10a19jcnRjLT5wZW5k
aW5nX2FzeW5jX3BsYW5lcykgewo+ICsgICAgICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgbXRr
X2NydGMtPmxheWVyX25yOyBpKyspIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
ZHJtX3BsYW5lICpwbGFuZSA9ICZtdGtfY3J0Yy0+cGxhbmVzW2ldOwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBtdGtfcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlOwo+ICsKPiArICAg
ICAgICAgICAgICAgICAgICAgICBwbGFuZV9zdGF0ZSA9IHRvX210a19wbGFuZV9zdGF0ZShwbGFu
ZS0+c3RhdGUpOwo+ICsKPiArICAgICAgICAgICAgICAgICAgICAgICBwbGFuZV9zdGF0ZS0+cGVu
ZGluZy5hc3luY19jb25maWcgPSBmYWxzZTsKPiArICAgICAgICAgICAgICAgfQo+ICsgICAgICAg
ICAgICAgICBtdGtfY3J0Yy0+cGVuZGluZ19hc3luY19wbGFuZXMgPSBmYWxzZTsKPiArICAgICAg
IH0KPgo+ICAgICAgICAgbXRrX2NydGMtPmNtZHFfdmJsYW5rX2NudCA9IDA7Cj4gIH0KPiBAQCAt
NDMyLDcgKzQ2Niw4IEBAIHN0YXRpYyB2b2lkIG10a19jcnRjX2RkcF9jb25maWcoc3RydWN0IGRy
bV9jcnRjICpjcnRjLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXRl
LT5wZW5kaW5nX3ZyZWZyZXNoLCAwLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNtZHFfaGFuZGxlKTsKPgo+IC0gICAgICAgICAgICAgICBzdGF0ZS0+cGVuZGluZ19jb25m
aWcgPSBmYWxzZTsKPiArICAgICAgICAgICAgICAgaWYgKCFjbWRxX2hhbmRsZSkKPiArICAgICAg
ICAgICAgICAgICAgICAgICBzdGF0ZS0+cGVuZGluZ19jb25maWcgPSBmYWxzZTsKPiAgICAgICAg
IH0KPgo+ICAgICAgICAgaWYgKG10a19jcnRjLT5wZW5kaW5nX3BsYW5lcykgewo+IEBAIC00NTIs
OSArNDg3LDEyIEBAIHN0YXRpYyB2b2lkIG10a19jcnRjX2RkcF9jb25maWcoc3RydWN0IGRybV9j
cnRjICpjcnRjLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbXRrX2RkcF9jb21w
X2xheWVyX2NvbmZpZyhjb21wLCBsb2NhbF9sYXllciwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGxhbmVfc3RhdGUsCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNtZHFf
aGFuZGxlKTsKPiAtICAgICAgICAgICAgICAgICAgICAgICBwbGFuZV9zdGF0ZS0+cGVuZGluZy5j
b25maWcgPSBmYWxzZTsKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoIWNtZHFfaGFuZGxl
KQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGxhbmVfc3RhdGUtPnBlbmRpbmcu
Y29uZmlnID0gZmFsc2U7Cj4gICAgICAgICAgICAgICAgIH0KPiAtICAgICAgICAgICAgICAgbXRr
X2NydGMtPnBlbmRpbmdfcGxhbmVzID0gZmFsc2U7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAo
IWNtZHFfaGFuZGxlKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIG10a19jcnRjLT5wZW5kaW5n
X3BsYW5lcyA9IGZhbHNlOwo+ICAgICAgICAgfQo+Cj4gICAgICAgICBpZiAobXRrX2NydGMtPnBl
bmRpbmdfYXN5bmNfcGxhbmVzKSB7Cj4gQEAgLTQ3NCw5ICs1MTIsMTIgQEAgc3RhdGljIHZvaWQg
bXRrX2NydGNfZGRwX2NvbmZpZyhzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBtdGtfZGRwX2NvbXBfbGF5ZXJfY29uZmlnKGNvbXAsIGxvY2Fs
X2xheWVyLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwbGFuZV9zdGF0ZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY21kcV9oYW5kbGUpOwo+IC0gICAgICAgICAgICAg
ICAgICAgICAgIHBsYW5lX3N0YXRlLT5wZW5kaW5nLmFzeW5jX2NvbmZpZyA9IGZhbHNlOwo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGlmICghY21kcV9oYW5kbGUpCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwbGFuZV9zdGF0ZS0+cGVuZGluZy5hc3luY19jb25maWcgPSBmYWxz
ZTsKPiAgICAgICAgICAgICAgICAgfQo+IC0gICAgICAgICAgICAgICBtdGtfY3J0Yy0+cGVuZGlu
Z19hc3luY19wbGFuZXMgPSBmYWxzZTsKPiArCj4gKyAgICAgICAgICAgICAgIGlmICghY21kcV9o
YW5kbGUpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgbXRrX2NydGMtPnBlbmRpbmdfYXN5bmNf
cGxhbmVzID0gZmFsc2U7Cj4gICAgICAgICB9Cj4gIH0KPgo+IC0tCj4gMi4xOC4wCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
