Return-Path: <SRS0=EBBG=AP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD2CC433DF
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jul 2020 23:21:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A3CF20826
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jul 2020 23:21:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oJXQTph7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="yobnRxgP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A3CF20826
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hjFWJ/1uMnjv8nrAl87vTDNmu5vUv6wn8kBY2rNq+yE=; b=oJXQTph7xtzggcKNH+y0BCF15
	AG/Ypi2VUG0KEtCONWjUFx7AVwEQQOvXtZh3beDVkFtK7SXzopdGM7HNIVb7XHSftm+4HOQy9W/v1
	vHS3JqHIDVchNJ6DfiToCjNFjzH5514zyWW06cEiDI0fu3DfBTsAXMH0WeoQfDSXcDgeR1d9WA6BK
	LdkZOaXCoZdY0ovyKAGwBcMiGwVjoVACZR2IE+kUKC9yL7a2BrewXMdfYVXkAOidEC+img+w/vCti
	9Wj9tPfxUWDLvZLp2R80+7NDnFqDyPNJe63OJouaQyO4YlQ+A2nGqGC2S3qNNZNidCEZaNNQXpicM
	rOxXI7wGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrrTJ-0004ZK-Ei; Sat, 04 Jul 2020 23:21:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrrT7-0004YE-JR; Sat, 04 Jul 2020 23:21:19 +0000
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2EEC120936;
 Sat,  4 Jul 2020 23:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593904872;
 bh=jjLI1NVY4paYHUmIojobSDVFBbLlkvJZnfkgPCCD+YU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=yobnRxgPmq/BD478RO0cvpD+xb/0uvejoPSdBkq3UdFeQZXlXNWCbRavLRi7G5jXN
 sQzEMSW1ZjA5FGsVKMmotrnmqQjs3veB0rUTXS3WX/0QqQ3GXePLVhnFNp/qvg6VcM
 F6HZF0bXrQC8k6Ip8al9F+afQl6w//5t6MLwFunM=
Received: by mail-ej1-f44.google.com with SMTP id dp18so38532627ejc.8;
 Sat, 04 Jul 2020 16:21:12 -0700 (PDT)
X-Gm-Message-State: AOAM531t3H+erOLvrItrpMy/vV2jvPHdRBG3TI9+UbXQiXAHX59dwE0R
 ce5RLl1ju0uorpJdRU4yqWZ+jNJmzPLf+1h7Ww==
X-Google-Smtp-Source: ABdhPJzSJ1ZWbwUWJLnVTcfoYRxGdqUMKJzrzedJHWFE7nqUV7raFr7/mAlCkHNtCxHv7UjgUk/yH0v2MF8C9pKav+U=
X-Received: by 2002:a17:906:1e83:: with SMTP id
 e3mr23006232ejj.7.1593904870633; 
 Sat, 04 Jul 2020 16:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200615203108.786083-1-enric.balletbo@collabora.com>
 <20200615203108.786083-4-enric.balletbo@collabora.com>
In-Reply-To: <20200615203108.786083-4-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 5 Jul 2020 07:20:59 +0800
X-Gmail-Original-Message-ID: <CAAOTY_89jeRvdv01batww9+bY0XWabvQ8xnEOEVCgsPimJ6WWg@mail.gmail.com>
Message-ID: <CAAOTY_89jeRvdv01batww9+bY0XWabvQ8xnEOEVCgsPimJ6WWg@mail.gmail.com>
Subject: Re: [RESEND PATCH v4 3/7] drm/mediatek: mtk_dsi: Rename bridge to
 next_bridge
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200704_192117_954150_B63F550C 
X-CRM114-Status: GOOD (  20.92  )
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
Pgo+IFRoaXMgaXMgcmVhbGx5IGEgY29zbWV0aWMgY2hhbmdlIGp1c3QgdG8gbWFrZSBhIGJpdCBt
b3JlIHJlYWRhYmxlIHRoZQo+IGNvZGUgYWZ0ZXIgY29udmVydCB0aGUgZHJpdmVyIHRvIGRybV9i
cmlkZ2UuIFRoZSBicmlkZ2UgdmFyaWFibGUgbmFtZQo+IHdpbGwgYmUgdXNlZCBieSB0aGUgZW5j
b2RlciBkcm1fYnJpZGdlLCBhbmQgdGhlIGNoYWluZWQgYnJpZGdlIHdpbGwgYmUKPiBuYW1lZCBu
ZXh0X2JyaWRnZS4KPgoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0tbmV4dCBbMV0sIHRoYW5rcy4K
ClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVu
a3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVnYXJkcywKQ2h1
bi1LdWFuZy4KCj4gU2lnbmVkLW9mZi1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMu
YmFsbGV0Ym9AY29sbGFib3JhLmNvbT4KPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8
bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IEFja2VkLWJ5OiBTYW0gUmF2bmJv
cmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gUmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5r
dWFuZy5odUBrZXJuZWwub3JnPgo+IC0tLQo+Cj4gQ2hhbmdlcyBpbiB2NDogTm9uZQo+IENoYW5n
ZXMgaW4gdjM6Cj4gLSBSZXBsYWNlIHMvYnJpZGdlL25leHQgYnJpZGdlLyBmb3IgY29tbWVudC4g
KExhdXJlbnQgUGluY2hhcnQpCj4KPiBDaGFuZ2VzIGluIHYyOiBOb25lCj4KPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDExICsrKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHNpLmMKPiBpbmRleCAyNzBiZjIyYzk4ZmViLi4yMDhmNDliZjE0YTAxIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gQEAgLTE4Myw3ICsxODMsNyBAQCBzdHJ1Y3Qg
bXRrX2RzaSB7Cj4gICAgICAgICBzdHJ1Y3QgZHJtX2VuY29kZXIgZW5jb2RlcjsKPiAgICAgICAg
IHN0cnVjdCBkcm1fY29ubmVjdG9yIGNvbm47Cj4gICAgICAgICBzdHJ1Y3QgZHJtX3BhbmVsICpw
YW5lbDsKPiAtICAgICAgIHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2U7Cj4gKyAgICAgICBzdHJ1
Y3QgZHJtX2JyaWRnZSAqbmV4dF9icmlkZ2U7Cj4gICAgICAgICBzdHJ1Y3QgcGh5ICpwaHk7Cj4K
PiAgICAgICAgIHZvaWQgX19pb21lbSAqcmVnczsKPiBAQCAtODk0LDkgKzg5NCwxMCBAQCBzdGF0
aWMgaW50IG10a19kc2lfY3JlYXRlX2Nvbm5fZW5jKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHN0
cnVjdCBtdGtfZHNpICpkc2kpCj4gICAgICAgICAgKi8KPiAgICAgICAgIGRzaS0+ZW5jb2Rlci5w
b3NzaWJsZV9jcnRjcyA9IDE7Cj4KPiAtICAgICAgIC8qIElmIHRoZXJlJ3MgYSBicmlkZ2UsIGF0
dGFjaCB0byBpdCBhbmQgbGV0IGl0IGNyZWF0ZSB0aGUgY29ubmVjdG9yICovCj4gLSAgICAgICBp
ZiAoZHNpLT5icmlkZ2UpIHsKPiAtICAgICAgICAgICAgICAgcmV0ID0gZHJtX2JyaWRnZV9hdHRh
Y2goJmRzaS0+ZW5jb2RlciwgZHNpLT5icmlkZ2UsIE5VTEwsIDApOwo+ICsgICAgICAgLyogSWYg
dGhlcmUncyBhIG5leHQgYnJpZGdlLCBhdHRhY2ggdG8gaXQgYW5kIGxldCBpdCBjcmVhdGUgdGhl
IGNvbm5lY3RvciAqLwo+ICsgICAgICAgaWYgKGRzaS0+bmV4dF9icmlkZ2UpIHsKPiArICAgICAg
ICAgICAgICAgcmV0ID0gZHJtX2JyaWRnZV9hdHRhY2goJmRzaS0+ZW5jb2RlciwgZHNpLT5uZXh0
X2JyaWRnZSwgTlVMTCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
MCk7Cj4gICAgICAgICAgICAgICAgIGlmIChyZXQpIHsKPiAgICAgICAgICAgICAgICAgICAgICAg
ICBEUk1fRVJST1IoIkZhaWxlZCB0byBhdHRhY2ggYnJpZGdlIHRvIGRybVxuIik7Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgZ290byBlcnJfZW5jb2Rlcl9jbGVhbnVwOwo+IEBAIC0xMTc3LDcg
KzExNzgsNyBAQCBzdGF0aWMgaW50IG10a19kc2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKPiAgICAgICAgIH0KPgo+ICAgICAgICAgcmV0ID0gZHJtX29mX2ZpbmRfcGFuZWxf
b3JfYnJpZGdlKGRldi0+b2Zfbm9kZSwgMCwgMCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAmZHNpLT5wYW5lbCwgJmRzaS0+YnJpZGdlKTsKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmZHNpLT5wYW5lbCwgJmRzaS0+bmV4dF9i
cmlkZ2UpOwo+ICAgICAgICAgaWYgKHJldCkKPiAgICAgICAgICAgICAgICAgZ290byBlcnJfdW5y
ZWdpc3Rlcl9ob3N0Owo+Cj4gLS0KPiAyLjI3LjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
