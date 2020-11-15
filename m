Return-Path: <SRS0=Y72t=EV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F7B6C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Nov 2020 23:13:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DB492223C
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Nov 2020 23:13:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v7rM40PA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2Fa/9ZiH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DB492223C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nBlC82I7v0xS6gAbMhUB1r5Mz1kXCpxF1CY4UkUXky4=; b=v7rM40PA7Bm57UtkyiiHkBWL/
	+ppnGQWSs9xBkqyj2sgqSemM6qPiEIdEsbryp6UwVO/YWuzKLbjNzQ0wIgcGd4kJ+1uzGu//MmT54
	+y1vftMRDF+NUraxgD5N4SF2XTbBc/rNjrKePJpvbHJ1rKfx1KOCg9ZlZjrPzpetrbaa+ldnuwwV1
	Nes7ggBtf7n3IJdbv31KcAxyQWDCvB6IpJX35umywxqi5GJA4IEdSnAmw8cxAoVr2sEtv0fS3dFth
	b9TZ0Qr5qwxmmV5qQHbSEirxYxAeEjN5rcseSuArNlFogPRIuNlrL9Mms4wKOoI2Kwaaxycx2YITS
	QRFtQK/VA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keRCr-00007E-0L; Sun, 15 Nov 2020 23:13:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keRCm-0008WV-Po
 for linux-mediatek@lists.infradead.org; Sun, 15 Nov 2020 23:13:10 +0000
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 63A992223C
 for <linux-mediatek@lists.infradead.org>; Sun, 15 Nov 2020 23:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605481987;
 bh=lk702/tUQXibGYdggCfUZgCdOzqj1Eu9ni298A0WYIY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2Fa/9ZiHQnc5BbU0XZDC3uAMemNwIsstR9qKiGMuNCt9Qj4Vz3Qb03lkXZ5P4m3LP
 94hqfd32fXJf0Y/9wy6nkz6popX+S300JgMACJh+ICLNvuIT77/glxBmqfn4UJmqkw
 BJfiiLWQTLleOY/WvL2Z0rbAfFBNQb4uQMsUlmbQ=
Received: by mail-ej1-f46.google.com with SMTP id cw8so21857123ejb.8
 for <linux-mediatek@lists.infradead.org>; Sun, 15 Nov 2020 15:13:07 -0800 (PST)
X-Gm-Message-State: AOAM533npr7P+gEiQQfilkJU2IwKlAxgGy77GTTkXZJVJRD9a0pqqpBe
 4+m2eqJVtgZ0D6ZTgKn3yxH6DjwSZxNnJxIreQ==
X-Google-Smtp-Source: ABdhPJyhR7yVa8OMs9CVMO4MXD46m7RyAQokGoT/HE9LB+f69Ko6msdZkOuu0dL0VOctbP5UKTEaLDUtX2zyBsS3qnw=
X-Received: by 2002:a17:906:a106:: with SMTP id
 t6mr11718404ejy.63.1605481985911; 
 Sun, 15 Nov 2020 15:13:05 -0800 (PST)
MIME-Version: 1.0
References: <20201115001403.7833-1-chunkuang.hu@kernel.org>
 <CAAOTY_-16s=NXg2kOJijhO+82nNsT9HkKj4PVh1qN8dKchBOBA@mail.gmail.com>
 <20201116002522.1a5c3736@a-VirtualBox>
In-Reply-To: <20201116002522.1a5c3736@a-VirtualBox>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 16 Nov 2020 07:12:55 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-_N9pcmao0FFtGs-qVLrvA-QBz5FJrSaYynuMZMe1Qhg@mail.gmail.com>
Message-ID: <CAAOTY_-_N9pcmao0FFtGs-qVLrvA-QBz5FJrSaYynuMZMe1Qhg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dsi: Calculate horizontal_backporch_byte by
 itself
To: Bilal Wasim <bilalwasim676@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201115_181308_994378_F8337128 
X-CRM114-Status: GOOD (  23.99  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEJpbGFsOgoKQmlsYWwgV2FzaW0gPGJpbGFsd2FzaW02NzZAZ21haWwuY29tPiDmlrwgMjAy
MOW5tDEx5pyIMTbml6Ug6YCx5LiAIOS4iuWNiDM6MjXlr6vpgZPvvJoKPgo+IEhpIENLLAo+Cj4g
T24gU3VuLCAxNSBOb3YgMjAyMCAwODo1MzoyNCArMDgwMAo+IENodW4tS3VhbmcgSHUgPGNodW5r
dWFuZy5odUBrZXJuZWwub3JnPiB3cm90ZToKPgo+ID4gSGksIEJpbGFsOgo+ID4KPiA+IFBsZWFz
ZSBoZWxwIHRvIHRlc3QgdGhpcyBwYXRjaCBvbiB5b3VyIENocm9tZWJvb2sgZWxtLCB0aGFua3Mu
Cj4gPgo+ID4gUmVnYXJkcywKPiA+IENodW4tS3VhbmcgSHUKPgo+IEp1c3QgdHJpZWQgdGhpcyBw
YXRjaCBvbiB0aGUgQ2hyb21lYm9vayBFbG0sIGFuZCBpdCBkb2Vzbid0IHdvcmsuIFRoZQo+IEhE
TUkgc2NyZWVuIHJlbWFpbnMgYmxhY2ssIHRob3VnaCB0aGUgcmVzdCBvZiB0aGUgc3lzdGVtIGtl
ZXBzIG9uCj4gb3BlcmF0aW5nIG5vcm1hbGx5LgoKQ291bGQgeW91IHByaW50IHRoaXMgaW5mb3Jt
YXRpb24sIHNvIEkgY291bGQgZmluZCBvdXQgdGhlIHNvbHV0aW9uIGZvcgpib3RoIHNtYWxsIGhi
cCBhbmQgZWxtLgoKdm0tPmhmcm9udF9wb3JjaCwgdm0tPmhiYWNrX3BvcmNoLCBkc2lfdG1wX2J1
Zl9icHAsCmRhdGFfcGh5X2N5Y2xlc19ieXRlLCBhbmQgdGhlIGZpbmFsIGhvcml6b250YWxfZnJv
bnRwb3JjaF9ieXRlLApob3Jpem9udGFsX2JhY2twb3JjaF9ieXRlLgoKUmVnYXJkcywKQ2h1bi1L
dWFuZy4KCj4KPiA+Cj4gPiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4g
5pa8IDIwMjDlubQxMeaciDE15pelIOmAseaXpQo+ID4g5LiK5Y2IODoxNOWvq+mBk++8mgo+ID4g
Pgo+ID4gPiBGcm9tOiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgo+ID4gPgo+ID4gPiBVc2lu
ZyB2bS0+aGZyb250X3BvcmNoICsgdm0tPmhiYWNrX3BvcmNoIHRvIGNhbGN1bGF0ZQo+ID4gPiBo
b3Jpem9udGFsX2JhY2twb3JjaF9ieXRlIHdvdWxkIG1ha2UgaXQgbmVndGl2ZSwgc28KPiA+ID4g
dXNlIGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUgaXRzZWxmIHRvIG1ha2UgaXQgcG9zaXRpdmUu
Cj4gPiA+Cj4gPiA+IEZpeGVzOiAzNWJmOTQ4ZjFlZGIgKCJkcm0vbWVkaWF0ZWs6IGRzaTogRml4
IHNjcm9sbGluZyBvZiBwYW5lbAo+ID4gPiB3aXRoIHNtYWxsIGhmcCBvciBoYnAiKQo+ID4gPgo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiA+ID4g
LS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgNTMKPiA+ID4g
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspLCAzNQo+ID4gPiBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RzaS5jIGluZGV4Cj4gPiA+IDRhMTg4YTk0MmMzOC4uMmE2NGZkYWVkOWE3
IDEwMDY0NCAtLS0KPiA+ID4gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jICsr
Kwo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgQEAgLTQ0NCw3ICs0
NDQsMTAgQEAgc3RhdGljCj4gPiA+IHZvaWQgbXRrX2RzaV9jb25maWdfdmRvX3RpbWluZyhzdHJ1
Y3QgbXRrX2RzaSAqZHNpKSB1MzIKPiA+ID4gaG9yaXpvbnRhbF9zeW5jX2FjdGl2ZV9ieXRlOyB1
MzIgaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0ZTsKPiA+ID4gICAgICAgICB1MzIgaG9yaXpvbnRh
bF9mcm9udHBvcmNoX2J5dGU7Cj4gPiA+ICsgICAgICAgdTMyIGhvcml6b250YWxfZnJvbnRfYmFj
a19ieXRlOwo+ID4gPiArICAgICAgIHUzMiBkYXRhX3BoeV9jeWNsZXNfYnl0ZTsKPiA+ID4gICAg
ICAgICB1MzIgZHNpX3RtcF9idWZfYnBwLCBkYXRhX3BoeV9jeWNsZXM7Cj4gPiA+ICsgICAgICAg
dTMyIGRlbHRhOwo+ID4gPiAgICAgICAgIHN0cnVjdCBtdGtfcGh5X3RpbWluZyAqdGltaW5nID0g
JmRzaS0+cGh5X3RpbWluZzsKPiA+ID4KPiA+ID4gICAgICAgICBzdHJ1Y3QgdmlkZW9tb2RlICp2
bSA9ICZkc2ktPnZtOwo+ID4gPiBAQCAtNDc0LDQyICs0NzcsMjIgQEAgc3RhdGljIHZvaWQgbXRr
X2RzaV9jb25maWdfdmRvX3RpbWluZyhzdHJ1Y3QKPiA+ID4gbXRrX2RzaSAqZHNpKSBkYXRhX3Bo
eV9jeWNsZXMgPSB0aW1pbmctPmxweCArIHRpbWluZy0+ZGFfaHNfcHJlcGFyZQo+ID4gPiArIHRp
bWluZy0+ZGFfaHNfemVybyArIHRpbWluZy0+ZGFfaHNfZXhpdDsKPiA+ID4KPiA+ID4gLSAgICAg
ICBpZiAoZHNpLT5tb2RlX2ZsYWdzICYgTUlQSV9EU0lfTU9ERV9WSURFT19CVVJTVCkgewo+ID4g
PiAtICAgICAgICAgICAgICAgaWYgKCh2bS0+aGZyb250X3BvcmNoICsgdm0tPmhiYWNrX3BvcmNo
KSAqCj4gPiA+IGRzaV90bXBfYnVmX2JwcCA+Cj4gPiA+IC0gICAgICAgICAgICAgICAgICAgZGF0
YV9waHlfY3ljbGVzICogZHNpLT5sYW5lcyArIDE4KSB7Cj4gPiA+IC0gICAgICAgICAgICAgICAg
ICAgICAgIGhvcml6b250YWxfZnJvbnRwb3JjaF9ieXRlID0KPiA+ID4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB2bS0+aGZyb250X3BvcmNoICogZHNpX3RtcF9idWZfYnBwIC0KPiA+
ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoZGF0YV9waHlfY3ljbGVzICogZHNp
LT5sYW5lcyArIDE4KQo+ID4gPiAqCj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdm0tPmhmcm9udF9wb3JjaCAvCj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgKHZtLT5oZnJvbnRfcG9yY2ggKwo+ID4gPiB2bS0+aGJhY2tfcG9yY2gpOyAtCj4gPiA+IC0g
ICAgICAgICAgICAgICAgICAgICAgIGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUgPQo+ID4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUg
LQo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChkYXRhX3BoeV9jeWNsZXMg
KiBkc2ktPmxhbmVzICsgMTgpCj4gPiA+ICoKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB2bS0+aGJhY2tfcG9yY2ggLwo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICh2bS0+aGZyb250X3BvcmNoICsKPiA+ID4gdm0tPmhiYWNrX3BvcmNoKTsKPiA+ID4g
LSAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIERS
TV9XQVJOKCJIRlAgbGVzcyB0aGFuIGQtcGh5LCBGUFMgd2lsbAo+ID4gPiB1bmRlciA2MEh6XG4i
KTsKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgaG9yaXpvbnRhbF9mcm9udHBvcmNoX2J5
dGUgPQo+ID4gPiB2bS0+aGZyb250X3BvcmNoICoKPiA+ID4gLQo+ID4gPiBkc2lfdG1wX2J1Zl9i
cHA7Cj4gPiA+IC0gICAgICAgICAgICAgICB9Cj4gPiA+ICsgICAgICAgZGVsdGEgPSBkc2ktPm1v
ZGVfZmxhZ3MgJiBNSVBJX0RTSV9NT0RFX1ZJREVPX0JVUlNUID8gMTggOgo+ID4gPiAxMjsgKwo+
ID4gPiArICAgICAgIGhvcml6b250YWxfZnJvbnRwb3JjaF9ieXRlID0gdm0tPmhmcm9udF9wb3Jj
aCAqCj4gPiA+IGRzaV90bXBfYnVmX2JwcDsKPiA+ID4gKyAgICAgICBob3Jpem9udGFsX2Zyb250
X2JhY2tfYnl0ZSA9IGhvcml6b250YWxfZnJvbnRwb3JjaF9ieXRlICsKPiA+ID4gaG9yaXpvbnRh
bF9iYWNrcG9yY2hfYnl0ZTsKPiA+ID4gKyAgICAgICBkYXRhX3BoeV9jeWNsZXNfYnl0ZSA9IGRh
dGFfcGh5X2N5Y2xlcyAqIGRzaS0+bGFuZXMgKyBkZWx0YTsKPiA+ID4gKwo+ID4gPiArICAgICAg
IGlmIChob3Jpem9udGFsX2Zyb250X2JhY2tfYnl0ZSA+IGRhdGFfcGh5X2N5Y2xlc19ieXRlKSB7
Cj4gPiA+ICsgICAgICAgICAgICAgICBob3Jpem9udGFsX2Zyb250cG9yY2hfYnl0ZSAtPSBkYXRh
X3BoeV9jeWNsZXNfYnl0ZSAqCj4gPiA+ICsKPiA+ID4gaG9yaXpvbnRhbF9mcm9udHBvcmNoX2J5
dGUgLwo+ID4gPiArCj4gPiA+IGhvcml6b250YWxfZnJvbnRfYmFja19ieXRlOyArCj4gPiA+ICsg
ICAgICAgICAgICAgICBob3Jpem9udGFsX2JhY2twb3JjaF9ieXRlIC09IGRhdGFfcGh5X2N5Y2xl
c19ieXRlICoKPiA+ID4gKwo+ID4gPiBob3Jpem9udGFsX2JhY2twb3JjaF9ieXRlIC8KPiA+ID4g
Kwo+ID4gPiBob3Jpem9udGFsX2Zyb250X2JhY2tfYnl0ZTsgfSBlbHNlIHsKPiA+ID4gLSAgICAg
ICAgICAgICAgIGlmICgodm0tPmhmcm9udF9wb3JjaCArIHZtLT5oYmFja19wb3JjaCkgKgo+ID4g
PiBkc2lfdG1wX2J1Zl9icHAgPgo+ID4gPiAtICAgICAgICAgICAgICAgICAgIGRhdGFfcGh5X2N5
Y2xlcyAqIGRzaS0+bGFuZXMgKyAxMikgewo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBo
b3Jpem9udGFsX2Zyb250cG9yY2hfYnl0ZSA9Cj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdm0tPmhmcm9udF9wb3JjaCAqIGRzaV90bXBfYnVmX2JwcCAtCj4gPiA+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKGRhdGFfcGh5X2N5Y2xlcyAqIGRzaS0+bGFuZXMg
KyAxMikKPiA+ID4gKgo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZtLT5o
ZnJvbnRfcG9yY2ggLwo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICh2bS0+
aGZyb250X3BvcmNoICsKPiA+ID4gdm0tPmhiYWNrX3BvcmNoKTsKPiA+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0ZSA9Cj4gPiA+IGhvcml6b250YWxf
YmFja3BvcmNoX2J5dGUgLQo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChk
YXRhX3BoeV9jeWNsZXMgKiBkc2ktPmxhbmVzICsgMTIpCj4gPiA+ICoKPiA+ID4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB2bS0+aGJhY2tfcG9yY2ggLwo+ID4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICh2bS0+aGZyb250X3BvcmNoICsKPiA+ID4gdm0tPmhiYWNr
X3BvcmNoKTsKPiA+ID4gLSAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gPiA+IC0gICAgICAgICAg
ICAgICAgICAgICAgIERSTV9XQVJOKCJIRlAgbGVzcyB0aGFuIGQtcGh5LCBGUFMgd2lsbAo+ID4g
PiB1bmRlciA2MEh6XG4iKTsKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgaG9yaXpvbnRh
bF9mcm9udHBvcmNoX2J5dGUgPQo+ID4gPiB2bS0+aGZyb250X3BvcmNoICoKPiA+ID4gLQo+ID4g
PiBkc2lfdG1wX2J1Zl9icHA7Cj4gPiA+IC0gICAgICAgICAgICAgICB9Cj4gPiA+ICsgICAgICAg
ICAgICAgICBEUk1fV0FSTigiSEZQICsgSEJQIGxlc3MgdGhhbiBkLXBoeSwgRlBTIHdpbGwgdW5k
ZXIKPiA+ID4gNjBIelxuIik7IH0KPiA+ID4KPiA+ID4gICAgICAgICB3cml0ZWwoaG9yaXpvbnRh
bF9zeW5jX2FjdGl2ZV9ieXRlLCBkc2ktPnJlZ3MgKyBEU0lfSFNBX1dDKTsKPiA+ID4gLS0KPiA+
ID4gMi4xNy4xCj4gPiA+Cj4KPiBUaGFua3MsCj4gQmlsYWwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
