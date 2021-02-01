Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27762C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 13:37:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B06B764EA2
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 13:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B06B764EA2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ofPAGawgrIkBevb3VRtC236FF93GFflO6/gAM3S+qo4=; b=oxkzDjtLwAo5J7gYMU2fjOs+d
	FeEvusPM/dlz9sSwJ1ldvipDrf51wqdgQ7qCQmqFNvHpOIlNTZmTbk5PHK6gNpYCSogXp4eiKZhXv
	6o2kqJ9epBcYBVXGLnrj+ixsHIqNNMCjU9e/SDfwfE5VJOTGy5ZY9vTK5nDjFIY3B+TlzITf786XI
	HPKj/aMfou8qnaia9/3Fvh38rWevY3Puser3/u1GwnBfC3+E7DJZRGM/h0RGGzzvtFr1sKK8Ycpy8
	UtDzwBFBBxR5TF4PBOIu3qynl6577EntlJQa0+7McoGC3sgydzWmKx36rrFSGAvKk4S/hc2gdFfun
	/eJfIW88g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6ZOD-0001Kv-0D; Mon, 01 Feb 2021 13:37:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6ZO8-0001Jm-Js; Mon, 01 Feb 2021 13:37:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F6D864EA2;
 Mon,  1 Feb 2021 13:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612186626;
 bh=Ca6sILXG4fwyLv608fCB+3JeQwCE0JDKDmcvJPplyMU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DJoURk34n0YciPkLBEB/HLl5teASMw3/8D5guNHy2/4AWTlRPsPlbOyTtTxqv/JQI
 twGh8K3UyvJa0iw/r0pIgWUupPGnhwUP8nGitTMcE1OqDklYy84WpCVCWzObD875bQ
 UoRbNKcb1Jlg/SPR84N582sptjrkRFOfJDRDi3cTiM7FW4PSJG2qYxdSenzVuSconV
 tIILhKfBvno9HpNFkk16OMqhzD9EbfOdfkvD51sln8ypurLxLY+Ny++oKjZCqmY0NS
 DF4ag/f3zMNl0zQW2aq2jhAk6VPEq0yoHl4tqda8kd1j+htoCbmn4ln5FBndAZlNiB
 aEfA0R62VVZig==
Received: by mail-wr1-f43.google.com with SMTP id 6so16595151wri.3;
 Mon, 01 Feb 2021 05:37:06 -0800 (PST)
X-Gm-Message-State: AOAM531fN/rod5cHdOe5pTeIkq5043y5G2yo4Z6/JLmvFDqGrROhfYyq
 m4cQNvmS66T/V7vDCy6AY0XhvhokFhlKUnDcVg==
X-Google-Smtp-Source: ABdhPJwGbLbPXA9ztMTVXLGo0SWhr8NHgerLg6mdo4pyBi7dlYyviEPBb6aW4ApZKN9NnopTRVp50+8iSm8fx35JTCw=
X-Received: by 2002:a5d:524a:: with SMTP id k10mr18325193wrc.394.1612186625106; 
 Mon, 01 Feb 2021 05:37:05 -0800 (PST)
MIME-Version: 1.0
References: <20210131051058.3407985-1-hsinyi@chromium.org>
 <CAAOTY_9kOnYDs=_22qBV7kOM74zcfKaobN0wBZaXzx31KsrG5Q@mail.gmail.com>
In-Reply-To: <CAAOTY_9kOnYDs=_22qBV7kOM74zcfKaobN0wBZaXzx31KsrG5Q@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 1 Feb 2021 21:36:51 +0800
X-Gmail-Original-Message-ID: <CAAOTY__VKeP0Z-Up5gpaB9SwcCbwQdB5cHXfssQB77s_G1U63w@mail.gmail.com>
Message-ID: <CAAOTY__VKeP0Z-Up5gpaB9SwcCbwQdB5cHXfssQB77s_G1U63w@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: enable dither function
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_083708_824205_03CF4A7A 
X-CRM114-Status: GOOD (  19.31  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 CK Hu <ck.hu@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEhzaW4tWWk6CgpDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4g5pa8
IDIwMjHlubQy5pyIMeaXpSDpgLHkuIAg5LiK5Y2IMTI6MjDlr6vpgZPvvJoKPgo+IEhpLCBIc2lu
LVlpOgo+Cj4gSHNpbi1ZaSBXYW5nIDxoc2lueWlAY2hyb21pdW0ub3JnPiDmlrwgMjAyMeW5tDHm
nIgzMeaXpSDpgLHml6Ug5LiL5Y2IMToxMeWvq+mBk++8mgo+ID4KPiA+IEZyb206IFlvbmdxaWFu
ZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+ID4KPiA+IEVuYWJsZSBkaXRoZXIg
ZnVuY3Rpb24gdG8gaW1wcm92ZSB0aGUgZGlzcGxheSBxdWFsaXR5Lgo+Cj4gUmV2aWV3ZWQtYnk6
IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+CgpBcHBsaWVkIHRvIG1l
ZGlhdGVrLWRybS1uZXh0IFsxXSwgdGhhbmtzLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1l
ZGlhdGVrLWRybS1uZXh0Cgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlv
bmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogSHNpbi1ZaSBXYW5n
IDxoc2lueWlAY2hyb21pdW0ub3JnPgo+ID4gLS0tCj4gPiBQcmV2aW91cyB2ZXJzaW9uOgo+ID4g
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNo
LzIwMjEwMTI5MDkyMjA5LjI1ODQ3MTgtNy1oc2lueWlAY2hyb21pdW0ub3JnLwo+ID4gLS0tCj4g
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyB8IDkgKysrKysr
Ky0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRw
X2NvbXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiA+
IGluZGV4IGM3MzAwMjlhYzhmYzcuLjA0NDRiNDI5ZGFmMDAgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gPiBAQCAtNTMsNiArNTMsNyBA
QAo+ID4gICNkZWZpbmUgRElUSEVSX0VOICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklU
KDApCj4gPiAgI2RlZmluZSBESVNQX0RJVEhFUl9DRkcgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDB4MDAyMAo+ID4gICNkZWZpbmUgRElUSEVSX1JFTEFZX01PREUgICAgICAgICAgICAg
ICAgICAgICAgQklUKDApCj4gPiArI2RlZmluZSBESVRIRVJfRU5HSU5FX0VOICAgICAgICAgICAg
ICAgICAgICAgICBCSVQoMSkKPiA+ICAjZGVmaW5lIERJU1BfRElUSEVSX1NJWkUgICAgICAgICAg
ICAgICAgICAgICAgIDB4MDAzMAo+ID4KPiA+ICAjZGVmaW5lIExVVF8xMEJJVF9NQVNLICAgICAg
ICAgICAgICAgICAgICAgICAgIDB4MDNmZgo+ID4gQEAgLTMxNSw4ICszMTYsMTIgQEAgc3RhdGlj
IHZvaWQgbXRrX2RpdGhlcl9jb25maWcoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQg
dywKPiA+ICB7Cj4gPiAgICAgICAgIHN0cnVjdCBtdGtfZGRwX2NvbXBfZGV2ICpwcml2ID0gZGV2
X2dldF9kcnZkYXRhKGRldik7Cj4gPgo+ID4gLSAgICAgICBtdGtfZGRwX3dyaXRlKGNtZHFfcGt0
LCBoIDw8IDE2IHwgdywgJnByaXYtPmNtZHFfcmVnLCBwcml2LT5yZWdzLCBESVNQX0RJVEhFUl9T
SVpFKTsKPiA+IC0gICAgICAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgRElUSEVSX1JFTEFZX01P
REUsICZwcml2LT5jbWRxX3JlZywgcHJpdi0+cmVncywgRElTUF9ESVRIRVJfQ0ZHKTsKPiA+ICsg
ICAgICAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgaCA8PCAxNiB8IHcsICZwcml2LT5jbWRxX3Jl
ZywgcHJpdi0+cmVncywKPiA+ICsgICAgICAgICAgICAgICAgICAgICBESVNQX0RJVEhFUl9TSVpF
KTsKPiA+ICsgICAgICAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgRElUSEVSX1JFTEFZX01PREUs
ICZwcml2LT5jbWRxX3JlZywgcHJpdi0+cmVncywKPiA+ICsgICAgICAgICAgICAgICAgICAgICBE
SVNQX0RJVEhFUl9DRkcpOwo+ID4gKyAgICAgICBtdGtfZGl0aGVyX3NldF9jb21tb24ocHJpdi0+
cmVncywgJnByaXYtPmNtZHFfcmVnLCBicGMsIERJU1BfRElUSEVSX0NGRywKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIERJVEhFUl9FTkdJTkVfRU4sIGNtZHFfcGt0KTsKPiA+ICB9
Cj4gPgo+ID4gIHN0YXRpYyB2b2lkIG10a19kaXRoZXJfc3RhcnQoc3RydWN0IGRldmljZSAqZGV2
KQo+ID4gLS0KPiA+IDIuMzAuMC4zNjUuZzAyYmM2OTM3ODktZ29vZwo+ID4KPiA+Cj4gPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0Cj4gPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
