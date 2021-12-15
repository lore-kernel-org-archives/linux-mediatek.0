Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D821CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 16:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/HkRXsxsmGQFUaLTntwH2R058kumKGaplLxhRp/24xc=; b=VXq5nbr36FjR60
	eSWITBVTnrN56kmNRZAOWyjAB70EG6+IldAKqG2xksA0wiungjjwjIYKb76kkJShu0ax5EEzhv3TR
	O4SgkflDQ1PjrLbly47IBeenPC+4e9t3KfXqWiRfxqHS8bhKNJ9864kxYAhu4x3wUsqX+9hdbLCYq
	aYeSfVDH37325d62bPhtC6gVXymh8tYc0qkDsUoYWZxZ+aZwG3GUCHuEkNc8iiNjCSbO9CxvfVvSo
	mNCEz4HUc4+YYm64r/6Dncvw3MlUh+PFfBig8XiNm+x2QMkSSIlzfQp8BFIYD40wX2fEPQpixaduv
	k5bsDBkq6lk9dU6xgCyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxXHq-001m6n-SG; Wed, 15 Dec 2021 16:37:50 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxWvh-001d0v-1F; Wed, 15 Dec 2021 16:15:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 13A3BB81FC0;
 Wed, 15 Dec 2021 16:14:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF70FC36AE0;
 Wed, 15 Dec 2021 16:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639584893;
 bh=wo0crMKVlb7bmqaDIAvITIC848wu5jLZZ67Z80HKcRM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eNNwMRyTV221oRdj5G7UQ3XcsDP0G7RuGoRrkRZ8/lXE5fYOW59uAEH7VihbRwWxO
 rtb2Sx3uHnp5mBD933YemSHpayKk8aVSbhbS2kbp59RPunQhsSVllBTcTVxRaC+7vW
 LK2qW0jamydu8RrkXx6l9G5NH3CljOkpCbzelsgkQ+DbsD7UJZgwQN/fASuh112NmM
 U6qgHhfjUCfNgNxkWFW5Q4dO6fd1XNjIk25q+yElqtapX5MLBZakT3X8qjwoViNhkQ
 RY4ZSE4xqJravCkR194jmGdWpJY8xB6yXowVQwBYv9aqOFXzVRB/jv3/etMHkNSYGO
 1bwfUz3h+JsWA==
Received: by mail-ed1-f50.google.com with SMTP id z9so21556350edb.5;
 Wed, 15 Dec 2021 08:14:53 -0800 (PST)
X-Gm-Message-State: AOAM5328ohKv8K5rOSLrVc35GPahb+miX8MG7S8KFJ0wr8jOLMXG/GtF
 Fqc0gMxOCYIzU5zbUFytfe9gNio/4TQbSmx6nA==
X-Google-Smtp-Source: ABdhPJwb1dCWZnfzIsxAO7jQHE1+1kUJseuzbpP+YWd9CINPK/i/ENG5c75C9WxsfttHUDoyFH5Gb/7t73WX+PxlWKg=
X-Received: by 2002:a50:ef02:: with SMTP id m2mr15331810eds.172.1639584888656; 
 Wed, 15 Dec 2021 08:14:48 -0800 (PST)
MIME-Version: 1.0
References: <20211022172413.195559-1-markyacoub@chromium.org>
 <20211026011318.GF2515@art_vandelay>
 <CAJUqKUopyQEyLh7w32UnHfUJv0nNUoE_PHAdkEj8JOnkhVqbbQ@mail.gmail.com>
In-Reply-To: <CAJUqKUopyQEyLh7w32UnHfUJv0nNUoE_PHAdkEj8JOnkhVqbbQ@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 16 Dec 2021 00:14:36 +0800
X-Gmail-Original-Message-ID: <CAAOTY_84K_xCQE-H8zxWfBhn4kQF_kPsmaqDuRr8w2E4rti3QA@mail.gmail.com>
Message-ID: <CAAOTY_84K_xCQE-H8zxWfBhn4kQF_kPsmaqDuRr8w2E4rti3QA@mail.gmail.com>
Subject: Re: [PATCH] mediatek: Set default value for Panel Orientation
 connector prop.
To: Mark Yacoub <markyacoub@chromium.org>
Cc: Sean Paul <sean@poorly.run>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sean Paul <seanpaul@chromium.org>, 
 Mark Yacoub <markyacoub@google.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_081457_424926_319AE249 
X-CRM114-Status: GOOD (  22.26  )
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

SGksIE1hcms6CgpNYXJrIFlhY291YiA8bWFya3lhY291YkBjaHJvbWl1bS5vcmc+IOaWvCAyMDIx
5bm0MTLmnIgxNOaXpSDpgLHkuowg5LiL5Y2IMTE6MTPlr6vpgZPvvJoKPgo+IEhleSBDSywgY2Fu
IHdlIGhhdmUgdGhpcyBtZXJnZWQ/Cj4gVGhhbmsgeW91IQo+Cj4gT24gTW9uLCBPY3QgMjUsIDIw
MjEgYXQgOToxMyBQTSBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4gd3JvdGU6Cj4gPgo+ID4g
T24gRnJpLCBPY3QgMjIsIDIwMjEgYXQgMDE6MjQ6MDNQTSAtMDQwMCwgTWFyayBZYWNvdWIgd3Jv
dGU6Cj4gPiA+IEZyb206IE1hcmsgWWFjb3ViIDxtYXJreWFjb3ViQGNocm9taXVtLm9yZz4KPiA+
ID4KPiA+ID4gW1doeV0KPiA+ID4gQ3JlYXRpbmcgdGhlIHByb3AgdXNlcyBVTktOT1dOIGFzIHRo
ZSBpbml0aWFsIHZhbHVlLCB3aGljaCBpcyBub3QgYQo+ID4gPiBzdXBwb3J0ZWQgdmFsdWUgaWYg
dGhlIHByb3BzIGlzIHRvIGJlIHN1cHBvcnRlZC4KPiA+ID4KPiA+ID4gW0hvd10KPiA+ID4gU2V0
IHRoZSBwYW5lbCBvcmllbnRhdGlvbiBkZWZhdWx0IHZhbHVlIHRvIE5PUk1BTCByaWdodCBhZnRl
ciBjcmVhdGluZwo+ID4gPiB0aGUgcHJvcC4KPiA+Cj4gPiBSZXZpZXdlZC1ieTogU2VhbiBQYXVs
IDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Cj4gPgo+ID4gPgo+ID4gPiBUZXN0ZWQgb24gSmFjdXp6
aShNVEspCj4gPiA+IEZpeGVzIElHVEBrbXNfcHJvcGVydGllc0BnZXRfcHJvcGVydGllcy1zYW5p
dHkte2F0b21pYyxub24tYXRvbWljfQo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJrIFlh
Y291YiA8bWFya3lhY291YkBjaHJvbWl1bS5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDIgKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4g
PiA+IGluZGV4IDBhZDcxNTc2NjBhZmEuLmI3YzI1MjhhOGY0MWMgMTAwNjQ0Cj4gPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiA+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ID4gPiBAQCAtMTAzOSw2ICsxMDM5LDggQEAgc3Rh
dGljIGludCBtdGtfZHNpX2VuY29kZXJfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCBzdHJ1
Y3QgbXRrX2RzaSAqZHNpKQo+ID4gPiAgICAgICAgICAgICAgIERSTV9FUlJPUigiVW5hYmxlIHRv
IGluaXQgcGFuZWwgb3JpZW50YXRpb25cbiIpOwo+ID4gPiAgICAgICAgICAgICAgIGdvdG8gZXJy
X2NsZWFudXBfZW5jb2RlcjsKPiA+ID4gICAgICAgfQo+ID4gPiArICAgICBkcm1fY29ubmVjdG9y
X3NldF9wYW5lbF9vcmllbnRhdGlvbihkc2ktPmNvbm5lY3RvciwKPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRFJNX01PREVfUEFORUxfT1JJRU5UQVRJT05f
Tk9STUFMKTsKCkluIGRybV9jb25uZWN0b3Jfc2V0X3BhbmVsX29yaWVudGF0aW9uKCkgWzFdLCBJ
IGZpbmQgdGhhdCB0aGUKb3JpZW50YXRpb24gY291bGQgYmUgc2V0IG9ubHkgb25jZS4gT25jZSB5
b3Ugc2V0IGl0IHRvIG5vcm1hbCwgaXQKY291bGQgbm90IGJlIHNldCB0byBvdGhlciBvcmllbnRh
dGlvbi4gUmlnaHQ/CgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9ncHUvZHJtL2RybV9jb25u
ZWN0b3IuYz9oPXY1LjE2LXJjNSNuMjMwMgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gPiA+Cj4g
PiA+ICAgICAgIGRybV9jb25uZWN0b3JfYXR0YWNoX2VuY29kZXIoZHNpLT5jb25uZWN0b3IsICZk
c2ktPmVuY29kZXIpOwo+ID4gPgo+ID4gPiAtLQo+ID4gPiAyLjMzLjAuMTA3OS5nNmU3MDc3OGRj
OS1nb29nCj4gPiA+Cj4gPgo+ID4gLS0KPiA+IFNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIs
IEdvb2dsZSAvIENocm9taXVtIE9TCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
