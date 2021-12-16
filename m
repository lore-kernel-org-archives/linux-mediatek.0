Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25587C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 17:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1DTK6OLKqJ3pJdThoJE4xvaP69E3h0+XEiBrVEB++po=; b=iVtzF0MfkXQbs/
	Dr6S9lKm78RGdsSo/JWy9wFl5872VKp4qSvSKhvjslmI2L1IJT2F/ZyFiAK3em9EnLAK1sE7nF4oU
	DQe6jT4tS2x4A7wTg6VKFltZmd0NfvG/29tX1OwCwfoCMa3x2DElTdbFDC86bQRbkNXFpMC3dvhyN
	zJGbTzGLY+2xfuCDyZc1QdsnriWYv86+RokR6WfK6+5QTXPo2VW6doM7N9vHoeJl9pEa7dw83l8UB
	6W1Yvv79HpytAIaJ6bYVLvxSk+sDfhCJVTjKhEsfr3S8Ou+xk3FkdYXrbwBUPXNPo2ZKVcKBRb+xD
	92qOxHR5523HG720xZ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxuGq-006p0T-Tu; Thu, 16 Dec 2021 17:10:20 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxu0r-006kgE-TF; Thu, 16 Dec 2021 16:53:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A7B34B82524;
 Thu, 16 Dec 2021 16:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B3F2C36AE6;
 Thu, 16 Dec 2021 16:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639673626;
 bh=9HY2Gr+HhTGXlOap7cbaob8w2cXKS9jFtehhh4izEG8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WRgOo96UY32jO7LJaVjCqsDPFKI9+wDI56L1Mgwf6Zky2BpMKtlbpxJHnu1oHxkqY
 ihoWx3qwypRP/jKX59AFSQI0n+O0ZYqwD9TvgqyoHE7KfvLhGvZc4n/i74G5bc9Ymk
 mcRfIc9jBk3zFEmOKt0c+fxoCHVlNalW5cqoHij0ZaDlGZ57v2Nno/HtgQFVHpoZpQ
 /AEm7jJUfpw5f9ot6nk3p+viPFBLG+gjGEY6MJpCFhif25HCWxyGJLV+qFktGriSFG
 KP5ZLveIYXCUrLLcnn99HtSPaGTBT7gxS8oDAlsVX8x4PLb5H+GG4adzkdQzBaDwwL
 78mQOSHipMF9A==
Received: by mail-ed1-f46.google.com with SMTP id z7so27495000edc.11;
 Thu, 16 Dec 2021 08:53:46 -0800 (PST)
X-Gm-Message-State: AOAM533bOGFzKbJIxjFTRhKTkP5YZfonc8YJnmk2+oAeX0Ju36yAvkay
 LHgHyJEiAPx/TI/Sb+pa7zMyBT6kAfDlGbLdNg==
X-Google-Smtp-Source: ABdhPJxzD4lGwKbHzDmj/sZXRpKpudELV5UmRGTSzZLUVIZoScj+A0c3yEr8k9wRu+mnTBdtU4+OtRxzKcLNMh5ObfI=
X-Received: by 2002:a50:ef02:: with SMTP id m2mr21289306eds.172.1639673624750; 
 Thu, 16 Dec 2021 08:53:44 -0800 (PST)
MIME-Version: 1.0
References: <20211022172413.195559-1-markyacoub@chromium.org>
 <20211026011318.GF2515@art_vandelay>
 <CAJUqKUopyQEyLh7w32UnHfUJv0nNUoE_PHAdkEj8JOnkhVqbbQ@mail.gmail.com>
 <CAAOTY_84K_xCQE-H8zxWfBhn4kQF_kPsmaqDuRr8w2E4rti3QA@mail.gmail.com>
 <CAJUqKUrCibOCjPca_YaLpF2_zsb-85CbKbrs9KyGqWwGrWOGyg@mail.gmail.com>
In-Reply-To: <CAJUqKUrCibOCjPca_YaLpF2_zsb-85CbKbrs9KyGqWwGrWOGyg@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 17 Dec 2021 00:53:32 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-b=F+moHec9sx_o5jv7XhfSd9A2crHsWGtzBdRSoiwHw@mail.gmail.com>
Message-ID: <CAAOTY_-b=F+moHec9sx_o5jv7XhfSd9A2crHsWGtzBdRSoiwHw@mail.gmail.com>
Subject: Re: [PATCH] mediatek: Set default value for Panel Orientation
 connector prop.
To: Mark Yacoub <markyacoub@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sean Paul <sean@poorly.run>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sean Paul <seanpaul@chromium.org>, 
 Mark Yacoub <markyacoub@google.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_085350_301291_CF10FD17 
X-CRM114-Status: GOOD (  28.87  )
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
5bm0MTLmnIgxNuaXpSDpgLHlm5sg5LiK5Y2IMToyNeWvq+mBk++8mgo+Cj4gT24gV2VkLCBEZWMg
MTUsIDIwMjEgYXQgMTE6MTQgQU0gQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5v
cmc+IHdyb3RlOgo+ID4KPiA+IEhpLCBNYXJrOgo+ID4KPiA+IE1hcmsgWWFjb3ViIDxtYXJreWFj
b3ViQGNocm9taXVtLm9yZz4g5pa8IDIwMjHlubQxMuaciDE05pelIOmAseS6jCDkuIvljYgxMTox
M+Wvq+mBk++8mgo+ID4gPgo+ID4gPiBIZXkgQ0ssIGNhbiB3ZSBoYXZlIHRoaXMgbWVyZ2VkPwo+
ID4gPiBUaGFuayB5b3UhCj4gPiA+Cj4gPiA+IE9uIE1vbiwgT2N0IDI1LCAyMDIxIGF0IDk6MTMg
UE0gU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24g
RnJpLCBPY3QgMjIsIDIwMjEgYXQgMDE6MjQ6MDNQTSAtMDQwMCwgTWFyayBZYWNvdWIgd3JvdGU6
Cj4gPiA+ID4gPiBGcm9tOiBNYXJrIFlhY291YiA8bWFya3lhY291YkBjaHJvbWl1bS5vcmc+Cj4g
PiA+ID4gPgo+ID4gPiA+ID4gW1doeV0KPiA+ID4gPiA+IENyZWF0aW5nIHRoZSBwcm9wIHVzZXMg
VU5LTk9XTiBhcyB0aGUgaW5pdGlhbCB2YWx1ZSwgd2hpY2ggaXMgbm90IGEKPiA+ID4gPiA+IHN1
cHBvcnRlZCB2YWx1ZSBpZiB0aGUgcHJvcHMgaXMgdG8gYmUgc3VwcG9ydGVkLgo+ID4gPiA+ID4K
PiA+ID4gPiA+IFtIb3ddCj4gPiA+ID4gPiBTZXQgdGhlIHBhbmVsIG9yaWVudGF0aW9uIGRlZmF1
bHQgdmFsdWUgdG8gTk9STUFMIHJpZ2h0IGFmdGVyIGNyZWF0aW5nCj4gPiA+ID4gPiB0aGUgcHJv
cC4KPiA+ID4gPgo+ID4gPiA+IFJldmlld2VkLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9t
aXVtLm9yZz4KPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRlc3RlZCBvbiBKYWN1enppKE1U
SykKPiA+ID4gPiA+IEZpeGVzIElHVEBrbXNfcHJvcGVydGllc0BnZXRfcHJvcGVydGllcy1zYW5p
dHkte2F0b21pYyxub24tYXRvbWljfQo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IE1hcmsgWWFjb3ViIDxtYXJreWFjb3ViQGNocm9taXVtLm9yZz4KPiA+ID4gPiA+IC0tLQo+ID4g
PiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCAyICsrCj4gPiA+ID4g
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4gPiA+ID4KPiA+ID4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ID4gPiA+ID4gaW5kZXggMGFkNzE1NzY2MGFmYS4u
YjdjMjUyOGE4ZjQxYyAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHNpLmMKPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHNpLmMKPiA+ID4gPiA+IEBAIC0xMDM5LDYgKzEwMzksOCBAQCBzdGF0aWMgaW50IG10a19k
c2lfZW5jb2Rlcl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHN0cnVjdCBtdGtfZHNpICpk
c2kpCj4gPiA+ID4gPiAgICAgICAgICAgICAgIERSTV9FUlJPUigiVW5hYmxlIHRvIGluaXQgcGFu
ZWwgb3JpZW50YXRpb25cbiIpOwo+ID4gPiA+ID4gICAgICAgICAgICAgICBnb3RvIGVycl9jbGVh
bnVwX2VuY29kZXI7Cj4gPiA+ID4gPiAgICAgICB9Cj4gPiA+ID4gPiArICAgICBkcm1fY29ubmVj
dG9yX3NldF9wYW5lbF9vcmllbnRhdGlvbihkc2ktPmNvbm5lY3RvciwKPiA+ID4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9NT0RFX1BBTkVMX09SSUVO
VEFUSU9OX05PUk1BTCk7Cj4gPgo+ID4gSW4gZHJtX2Nvbm5lY3Rvcl9zZXRfcGFuZWxfb3JpZW50
YXRpb24oKSBbMV0sIEkgZmluZCB0aGF0IHRoZQo+ID4gb3JpZW50YXRpb24gY291bGQgYmUgc2V0
IG9ubHkgb25jZS4gT25jZSB5b3Ugc2V0IGl0IHRvIG5vcm1hbCwgaXQKPiA+IGNvdWxkIG5vdCBi
ZSBzZXQgdG8gb3RoZXIgb3JpZW50YXRpb24uIFJpZ2h0Pwo+ID4KPiBIZWxsbywKPiBZZWFoIHRo
aXMgbG9va3MgdHJ1ZSwgYW5kIG1ha2VzIHNlbnNlIGFjY29yZGluZyB0byB0aGUgZG9jdW1lbnRh
dGlvbjoKPiBodHRwczovLzAxLm9yZy9saW51eGdyYXBoaWNzL2dmeC1kb2NzL2RybS9ncHUvZHJt
LWttcy5odG1sIzp+OnRleHQ9b25lJTIwc3RhbmRhcmRpemVkJTIwcHJvcGVydHklM0EtLHBhbmVs
JTIwb3JpZW50YXRpb24lM0EsLU9uJTIwc29tZSUyMGRldmljZXMKPgo+IFBhbmVsIG9yaWVudGF0
aW9uIGhhcyB0byBkbyB3aXRoIHRoZSBob3cgdGhlIGhhcmR3YXJlIGlzIG1vdW50ZWQsIGluCj4g
Y29udHJhc3Qgd2l0aCB0aGUgUm90YXRpb24gcHJvcGVydHkuIEFsbCB0aGUgSFcgd2UgaGF2ZSBy
aWdodCBub3cgaGFzCj4gYSBub3JtYWwgcGFuZWwgb3JpZW50YXRpb24gc28gaXQgbWFrZXMgc2Vu
c2UgdG8gYmUgc2V0IHRoaXMgd2F5LiBBbW9uZwoKTWFueSBldmlkZW5jZSBbMV0sIFsyXSwgWzNd
LCBzaG93IHRoYXQgQ2hyb21lYm9vayBwbGFuIHRvIGhhdmUgb3RoZXIKb3JpZW50YXRpb24gb24g
bXQ4MTgzLCBzbyBJIHRoaW5rIHlvdSBzaG91bGQgY29uc2lkZXIgdGhpcy4KClsxXSBodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyMTA0
MDkwNDUzMTQuMzQyMDczMy0yLWhzaW55aUBjaHJvbWl1bS5vcmcvClsyXSBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJl
ZS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtYm9lLXR2MTAxd3VtLW5sNi5jP2g9djUuMTYt
cmM1I24xNDc0ClszXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVr
L210ODE4My1rdWt1aS1rcmFuZS1za3UxNzYuZHRzP2g9djUuMTYtcmM1I24yMgoKUmVnYXJkcywK
Q2h1bi1LdWFuZy4KCgoKPiBvdGhlciBkcml2ZXJzLCBwYW5lbCBvcmllbnRhdGlvbiBpcyBhbHdh
eXMgc2V0IHJpZ2h0IGFmdGVyIHRoZQo+IHByb3BlcnR5IGlzIGluaXRpYWxpemVkLgo+Cj4gPiBb
MV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFs
ZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYz9oPXY1LjE2
LXJjNSNuMjMwMgo+ID4KPiA+IFJlZ2FyZHMsCj4gPiBDaHVuLUt1YW5nLgo+ID4KPiA+ID4gPiA+
Cj4gPiA+ID4gPiAgICAgICBkcm1fY29ubmVjdG9yX2F0dGFjaF9lbmNvZGVyKGRzaS0+Y29ubmVj
dG9yLCAmZHNpLT5lbmNvZGVyKTsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAtLQo+ID4gPiA+ID4gMi4z
My4wLjEwNzkuZzZlNzA3NzhkYzktZ29vZwo+ID4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IC0tCj4g
PiA+ID4gU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
