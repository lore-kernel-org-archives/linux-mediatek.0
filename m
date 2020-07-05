Return-Path: <SRS0=Yo4y=AQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D684EC433E0
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2020 00:15:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4EDB20870
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2020 00:15:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xfhfQev3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fo/T8nV8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4EDB20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JS1aSr1oenEshI5k9LvrDmnMFGTMS7LWHkw77mGEu1U=; b=xfhfQev3uaoN0xVfi6qGA3E2Z
	bgc5TCWg8VgArLJTeRzGSH5udUWdfjZn/6cCbBRhGKd/KGyUGDbq1wvdM++VbtYGjIfENunvBBIOI
	7koXLvZjeMfrY+yYzSjiyfm1k5MwZBYn5lZ3R0+YCve2vKQTx8D+B0dNJ55P1aIjxjROZ1nSSTAXm
	QvO2ol15U2dD8j/tZBQ7RucdUaskPZSaIY/SslC8kCg9Uu9WhKHn1BABImW2RK6rKSiPuT4aDAllj
	+MJTivrlIESDSprUHYOuJ6IY+U1hzNTnBG4e36NHhe85b1q7YIw3kq7I/RMrwEZzKEWKg7sAKI8Jv
	5sp24XU9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrsJn-0007Wb-2n; Sun, 05 Jul 2020 00:15:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrsJj-0007W1-JR; Sun, 05 Jul 2020 00:15:36 +0000
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4CEDB214D8;
 Sun,  5 Jul 2020 00:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593908134;
 bh=iH3aDb4sdbfsSHuXjwPQYPJDHIzy2wXOVaJjcjHJR7g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Fo/T8nV8UTUf3nPFZcibQZ67/VzukqzyFnAcDMStbL5s7VdtB5HV5cZ6Qj6U4Wbrx
 0PXAfaa611CB5ksiokKPx83nI5/emE1xVDTgqmmY76bzRtjyclvLJdLq6axogE0qmN
 8Dl5YoLtQStEYxfv2PWmvSgHsQ/ii7Mta8rH98EI=
Received: by mail-ej1-f46.google.com with SMTP id dr13so38742451ejc.3;
 Sat, 04 Jul 2020 17:15:34 -0700 (PDT)
X-Gm-Message-State: AOAM5304CFZv0ubJ8x1qJQqWL+YL3xWU94l7lmPVHx1BQw+TB629AvMx
 f/kKXmpQ68iub6j3Am42zuseWC4HYWoYq0L9EA==
X-Google-Smtp-Source: ABdhPJxQ+wC/XJRg4BJi7j8MwPEO2LRrUvPEFsb+AncSiOFdIMEvNbByzzgnJE/FF0ztSDbqe10F4PqIjLWZrCH2az8=
X-Received: by 2002:a17:906:1e83:: with SMTP id
 e3mr23125845ejj.7.1593908132783; 
 Sat, 04 Jul 2020 17:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200615203108.786083-1-enric.balletbo@collabora.com>
 <20200615203108.786083-8-enric.balletbo@collabora.com>
In-Reply-To: <20200615203108.786083-8-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 5 Jul 2020 08:15:21 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9i-ForE-kWfdi5A9QNRT2JjrFwAPYk25KupQeWwFDVSg@mail.gmail.com>
Message-ID: <CAAOTY_9i-ForE-kWfdi5A9QNRT2JjrFwAPYk25KupQeWwFDVSg@mail.gmail.com>
Subject: Re: [RESEND PATCH v4 7/7] drm/mediatek: mtk_dsi: Create connector for
 bridges
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200704_201535_795824_D175A43F 
X-CRM114-Status: GOOD (  19.00  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4g5pa8IDIwMjDlubQ25pyIMTbml6Ug6YCx5LqMIOS4iuWNiDQ6MzHlr6vpgZPvvJoK
Pgo+IFVzZSB0aGUgZHJtX2JyaWRnZV9jb25uZWN0b3IgaGVscGVyIHRvIGNyZWF0ZSBhIGNvbm5l
Y3RvciBmb3IgcGlwZWxpbmVzCj4gdGhhdCB1c2UgZHJtX2JyaWRnZS4gVGhpcyBhbGxvd3Mgc3Bs
aXR0aW5nIGNvbm5lY3RvciBvcGVyYXRpb25zIGFjcm9zcwo+IG11bHRpcGxlIGJyaWRnZXMgd2hl
biBuZWNlc3NhcnksIGluc3RlYWQgb2YgaGF2aW5nIHRoZSBsYXN0IGJyaWRnZSBpbgo+IHRoZSBj
aGFpbiBjcmVhdGluZyB0aGUgY29ubmVjdG9yIGFuZCBoYW5kbGluZyBhbGwgY29ubmVjdG9yIG9w
ZXJhdGlvbnMKPiBpbnRlcm5hbGx5LgoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0tbmV4dCBbMV0s
IHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVn
YXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNl
cnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPgo+IEFja2VkLWJ5OiBTYW0gUmF2bmJv
cmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gLS0tCj4KPiBDaGFuZ2VzIGluIHY0OiBOb25lCj4gQ2hh
bmdlcyBpbiB2MzoKPiAtIE1vdmUgdGhlIGJyaWRnZS50eXBlIGxpbmUgdG8gdGhlIHBhdGNoIHRo
YXQgYWRkcyBkcm1fYnJpZGdlIHN1cHBvcnQuIChMYXVyZW50IFBpbmNoYXJ0KQo+Cj4gQ2hhbmdl
cyBpbiB2MjogTm9uZQo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCAx
MyArKysrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
c2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBpbmRleCA0ZjNiZDA5
NWMxZWVlLi40NzFmY2FmZGYzNDg4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5j
Cj4gQEAgLTE3LDYgKzE3LDcgQEAKPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVy
Lmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX2JyaWRnZS5oPgo+ICsjaW5jbHVkZSA8ZHJtL2RybV9i
cmlkZ2VfY29ubmVjdG9yLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX21pcGlfZHNpLmg+Cj4gICNp
bmNsdWRlIDxkcm0vZHJtX29mLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX3BhbmVsLmg+Cj4gQEAg
LTE4Myw2ICsxODQsNyBAQCBzdHJ1Y3QgbXRrX2RzaSB7Cj4gICAgICAgICBzdHJ1Y3QgZHJtX2Vu
Y29kZXIgZW5jb2RlcjsKPiAgICAgICAgIHN0cnVjdCBkcm1fYnJpZGdlIGJyaWRnZTsKPiAgICAg
ICAgIHN0cnVjdCBkcm1fYnJpZGdlICpuZXh0X2JyaWRnZTsKPiArICAgICAgIHN0cnVjdCBkcm1f
Y29ubmVjdG9yICpjb25uZWN0b3I7Cj4gICAgICAgICBzdHJ1Y3QgcGh5ICpwaHk7Cj4KPiAgICAg
ICAgIHZvaWQgX19pb21lbSAqcmVnczsKPiBAQCAtOTc3LDEwICs5NzksMTkgQEAgc3RhdGljIGlu
dCBtdGtfZHNpX2VuY29kZXJfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCBzdHJ1Y3QgbXRr
X2RzaSAqZHNpKQo+ICAgICAgICAgICovCj4gICAgICAgICBkc2ktPmVuY29kZXIucG9zc2libGVf
Y3J0Y3MgPSAxOwo+Cj4gLSAgICAgICByZXQgPSBkcm1fYnJpZGdlX2F0dGFjaCgmZHNpLT5lbmNv
ZGVyLCAmZHNpLT5icmlkZ2UsIE5VTEwsIDApOwo+ICsgICAgICAgcmV0ID0gZHJtX2JyaWRnZV9h
dHRhY2goJmRzaS0+ZW5jb2RlciwgJmRzaS0+YnJpZGdlLCBOVUxMLAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgRFJNX0JSSURHRV9BVFRBQ0hfTk9fQ09OTkVDVE9SKTsKPiAgICAg
ICAgIGlmIChyZXQpCj4gICAgICAgICAgICAgICAgIGdvdG8gZXJyX2NsZWFudXBfZW5jb2RlcjsK
Pgo+ICsgICAgICAgZHNpLT5jb25uZWN0b3IgPSBkcm1fYnJpZGdlX2Nvbm5lY3Rvcl9pbml0KGRy
bSwgJmRzaS0+ZW5jb2Rlcik7Cj4gKyAgICAgICBpZiAoSVNfRVJSKGRzaS0+Y29ubmVjdG9yKSkg
ewo+ICsgICAgICAgICAgICAgICBEUk1fRVJST1IoIlVuYWJsZSB0byBjcmVhdGUgYnJpZGdlIGNv
bm5lY3RvclxuIik7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IFBUUl9FUlIoZHNpLT5jb25uZWN0
b3IpOwo+ICsgICAgICAgICAgICAgICBnb3RvIGVycl9jbGVhbnVwX2VuY29kZXI7Cj4gKyAgICAg
ICB9Cj4gKyAgICAgICBkcm1fY29ubmVjdG9yX2F0dGFjaF9lbmNvZGVyKGRzaS0+Y29ubmVjdG9y
LCAmZHNpLT5lbmNvZGVyKTsKPiArCj4gICAgICAgICByZXR1cm4gMDsKPgo+ICBlcnJfY2xlYW51
cF9lbmNvZGVyOgo+IC0tCj4gMi4yNy4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
