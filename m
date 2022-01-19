Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91E8C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 23:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iQJDrnages0r+GOY1krtMt1bhzgH/4kHneyeQncEzuI=; b=S+AQPTAPEAyevB
	lS//V95oaukHKU2JzcF9NYPnEA2Ttdk7Un5zreK8d8eDC5ZAd03UIHwWZQXnoW19h+TaDHWrIqjEr
	PnlHot31ekdFBJVpetUiW1x5yHdpg2lj8fA/Zgm/AmdMuVVPjm+sKYAw5ntSSvxmqhpD2Uoufl85j
	e/wG5oitaJnpeo7KxgSnXHr6cY//PTgSUaM6aeQXn9ui2uhm//xgg/8hy2Ykgwl12e36IXLnFk+0a
	wbpYvwQQwztqyv+y1XoewtH/EYHf6oXb1ZCvrZmT8m34Ir3w5op3cyDKC6K41n+Vr/1keE6NgyKbz
	P4MaJ4DihvjbrTQnyVEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAKEp-007oBX-CQ; Wed, 19 Jan 2022 23:19:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAKEc-007o8v-NK; Wed, 19 Jan 2022 23:19:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8D7FF61456;
 Wed, 19 Jan 2022 23:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B20C340E7;
 Wed, 19 Jan 2022 23:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642634361;
 bh=/VsvxrK8zyc2yNu4lRcxY8d4fLjYuopTGzFBWIpaZuU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WIzZvK3GtHo1SKGL3nZdobAbhHjEPpNeTEfI34CqWXsYRIBuTAruaBZVRj8jcx1Ds
 Y5H5up3k8FgNKOZSpqmDHRlwA4WRfNB8G9XLg0iwICGdDflSawqY+nCV3QY5z9MHVj
 JD313HNVbb+cF0UwToqBEv3Q8ktX1Xy7AEo3wojE/In9rIAbhSyFAn8N90R9qmHuD/
 pGNJsvYU0cD51Ig65oCM1IOfcyBf9uJqeoYzJabOulkddlDz6PHGOMvV320YwxVjOh
 t+116mj9rKdAeAFuce02xdM23Ln1eKKm3lAoxg6cd89Nz4ilJev+5lmaBO4Aldcok7
 QtlizF6lLYTGw==
Received: by mail-ed1-f45.google.com with SMTP id c24so18167593edy.4;
 Wed, 19 Jan 2022 15:19:20 -0800 (PST)
X-Gm-Message-State: AOAM530yyGrxHWFpnzFbuUZe+/vUmWFjrtaqi9TvZgYSSFzO4iq3ctJF
 /csjmiXMlxTWHu5yNKCptgsaCKoDzCzQ/NCUVg==
X-Google-Smtp-Source: ABdhPJwC0NWnP7oymINNszu43Ouc3/FDCJmqCWPyJrv0Hx/yq+CETJQGIdgZZ3LK4mRd6SWiVqRx6NjLUZo8svP5CpY=
X-Received: by 2002:a17:906:6c1:: with SMTP id
 v1mr25764169ejb.638.1642634359331; 
 Wed, 19 Jan 2022 15:19:19 -0800 (PST)
MIME-Version: 1.0
References: <20220119022543.26093-1-rex-bc.chen@mediatek.com>
 <20220119022543.26093-3-rex-bc.chen@mediatek.com>
In-Reply-To: <20220119022543.26093-3-rex-bc.chen@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 20 Jan 2022 07:19:05 +0800
X-Gmail-Original-Message-ID: <CAAOTY__xbhyOaL-4BZP0n_HdvYz3f6SZzh-WSw-gVv=Yufjy8A@mail.gmail.com>
Message-ID: <CAAOTY__xbhyOaL-4BZP0n_HdvYz3f6SZzh-WSw-gVv=Yufjy8A@mail.gmail.com>
Subject: Re: [v10,2/3] drm/mediatek: implement the DSI HS packets aligned
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 andrzej.hajda@intel.com, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Xin Ji <xji@analogixsemi.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, xinlei.lee@mediatek.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_151922_887237_0CDACBDF 
X-CRM114-Status: GOOD (  23.69  )
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

SGksIFJleDoKClJleC1CQyBDaGVuIDxyZXgtYmMuY2hlbkBtZWRpYXRlay5jb20+IOaWvCAyMDIy
5bm0MeaciDE55pelIOmAseS4iSDkuIrljYgxMDoyNuWvq+mBk++8mgo+Cj4gU29tZSBEU0kgUlgg
ZGV2aWNlcyAoZm9yIGV4YW1wbGUsIGFueDc2MjUpIHJlcXVpcmUgbGFzdCBhbGlnbm1lbnQgb2YK
PiBwYWNrZXRzIG9uIGFsbCBsYW5lcyBhZnRlciBlYWNoIHJvdyBvZiBkYXRhIGlzIHNlbnQuCj4g
T3RoZXJ3aXNlLCB0aGVyZSB3aWxsIGJlIHNvbWUgaXNzdWVzIG9mIHNoaWZ0IG9yIHNjcm9sbCBm
b3Igc2NyZWVuLgo+Cj4gVGFrZSBob3Jpem9udGFsX3N5bmNfYWN0aXZlX2J5dGUgZm9yIGEgZXhh
bXBsZSwKPiB3ZSByb3VuZHVwIHRoZSBIU0EgcGFja2V0IGRhdGEgdG8gbGFuZSBudW1iZXIsIGFu
ZCB0aGUgc3VidHJhY3Rpb24gb2YgMgo+IGlzIHRoZSBwYWNrZXQgZGF0YSB2YWx1ZSBhZGRlZCBi
eSB0aGUgcm91bmR1cCBvcGVyYXRpb24sIG1ha2luZyB0aGUKPiBsb25nIHBhY2tldHMgYXJlIGlu
dGVnZXIgbXVsdGlwbGVzIG9mIGxhbmUgbnVtYmVyLgo+IFRoaXMgdmFsdWUgKDIpIHZhcmllcyB3
aXRoIHRoZSBsYW5lIG51bWJlciwgYW5kIHRoYXQgaXMgdGhlIHJlYXNvbiB3ZQo+IGRvIHRoaXMg
b3BlcmF0aW9uIHdoZW4gdGhlIGxhbmUgbnVtYmVyIGlzIDQuCj4KPiBJbiB0aGUgcHJldmlvdXMg
b3BlcmF0aW9uIG9mIGZ1bmN0aW9uICJtdGtfZHNpX2NvbmZpZ192ZG9fdGltaW5nIiwKPiB0aGUg
bGVuZ3RoIG9mIEhTQSBhbmQgSEZQIGRhdGEgcGFja2V0cyBoYXMgYmVlbiBhZGp1c3RlZCB0byBh
bgo+IGludGVncmF0aW9uIG11bHRpcGxlIG9mIGxhbmUgbnVtYmVyLgo+IFNpbmNlIHRoZSBudW1i
ZXIgb2YgUkdCIGRhdGEgcGFja2V0cyBjYW5ub3QgYmUgZ3VhcmFudGVlZCB0byBiZSBhbgo+IGlu
dGVnZXIgbXVsdGlwbGUgb2YgbGFuZSBudW1iZXIsIHdlIG1vZGlmeSB0aGUgZGF0YSBwYWNrZXQg
bGVuZ3RoIG9mCj4gSEJQIHNvIHRoYXQgdGhlIG51bWJlciBvZiBIQlAgKyBSR0IgaXMgZXF1YWwg
dG8gdGhlIGxhbmUgbnVtYmVyLgo+IFNvIGFmdGVyIHNlbmRpbmcgYSBsaW5lIG9mIGRhdGEgKEhT
QSArIEhCUCArIFJHQiArIEhGUCksIHRoZSBkYXRhCj4gbGFuZXMgYXJlIGFsaWduZWQuCgpBY2tl
ZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gU2lnbmVk
LW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IFJleC1CQyBDaGVuIDxyZXgtYmMuY2hlbkBtZWRpYXRlay5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogWGlubGVpIExlZSA8eGlubGVpLmxlZUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCAxMiArKysrKysrKysrKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDEyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+
IGluZGV4IDVkOTBkMmViMDAxOS4uZTkxYjNmZmY0MzQyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RzaS5jCj4gQEAgLTUwMCw2ICs1MDAsMTggQEAgc3RhdGljIHZvaWQgbXRrX2RzaV9j
b25maWdfdmRvX3RpbWluZyhzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ICAgICAgICAgICAgICAgICBE
Uk1fV0FSTigiSEZQICsgSEJQIGxlc3MgdGhhbiBkLXBoeSwgRlBTIHdpbGwgdW5kZXIgNjBIelxu
Iik7Cj4gICAgICAgICB9Cj4KPiArICAgICAgIGlmICgoZHNpLT5tb2RlX2ZsYWdzICYgTUlQSV9E
U0lfSFNfUEtUX0VORF9BTElHTkVEKSAmJgo+ICsgICAgICAgICAgIChkc2ktPmxhbmVzID09IDQp
KSB7Cj4gKyAgICAgICAgICAgICAgIGhvcml6b250YWxfc3luY19hY3RpdmVfYnl0ZSA9Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcm91bmR1cChob3Jpem9udGFsX3N5bmNfYWN0aXZlX2J5dGUs
IGRzaS0+bGFuZXMpIC0gMjsKPiArICAgICAgICAgICAgICAgaG9yaXpvbnRhbF9mcm9udHBvcmNo
X2J5dGUgPQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJvdW5kdXAoaG9yaXpvbnRhbF9mcm9u
dHBvcmNoX2J5dGUsIGRzaS0+bGFuZXMpIC0gMjsKPiArICAgICAgICAgICAgICAgaG9yaXpvbnRh
bF9iYWNrcG9yY2hfYnl0ZSA9Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcm91bmR1cChob3Jp
em9udGFsX2JhY2twb3JjaF9ieXRlLCBkc2ktPmxhbmVzKSAtIDI7Cj4gKyAgICAgICAgICAgICAg
IGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUgLT0KPiArICAgICAgICAgICAgICAgICAgICAgICAo
dm0tPmhhY3RpdmUgKiBkc2lfdG1wX2J1Zl9icHAgKyAyKSAlIGRzaS0+bGFuZXM7Cj4gKyAgICAg
ICB9Cj4gKwo+ICAgICAgICAgd3JpdGVsKGhvcml6b250YWxfc3luY19hY3RpdmVfYnl0ZSwgZHNp
LT5yZWdzICsgRFNJX0hTQV9XQyk7Cj4gICAgICAgICB3cml0ZWwoaG9yaXpvbnRhbF9iYWNrcG9y
Y2hfYnl0ZSwgZHNpLT5yZWdzICsgRFNJX0hCUF9XQyk7Cj4gICAgICAgICB3cml0ZWwoaG9yaXpv
bnRhbF9mcm9udHBvcmNoX2J5dGUsIGRzaS0+cmVncyArIERTSV9IRlBfV0MpOwo+IC0tCj4gMi4x
OC4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVk
aWF0ZWsK
