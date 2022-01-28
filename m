Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34926C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 16:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rddCZao87R4xglilhMTkQSJoKARokTDHUHcMfDwliGM=; b=MiKGUr3BZtLARx
	EW0c5Wx/3JttKnuZ8vd1SrT/beLONNwNXrhLDVa5fWEVR59ernGuASiX63BnD9or+U9SiDBF0wLlz
	tgrkou9eYuYqkx1iLaC6niav0hz9ytLETHHDF4j4IZFEDvXjomTL+kCSRDkhpGJhVzM/uLQjk+3d2
	gzP30CqvmsjSJijyG9On3BaWshVnSELHus5y/QyxgNgYsa/2tYyMqQsaEmz8iIdM3aT8zlxAaWrS9
	hWKqlL3wP+ZfxxkNhxsMuSrmkuzvoEuA5vfE6eoU0pf6wMO1grw6g6m+gnb/wLkBK6J9JMLSUwnxN
	HO0lVOF3pGTb7vuyjCTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDUD0-0030k2-Fq; Fri, 28 Jan 2022 16:34:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDUCo-0030hr-2j; Fri, 28 Jan 2022 16:34:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BF4FAB80D6A;
 Fri, 28 Jan 2022 16:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F30C340E7;
 Fri, 28 Jan 2022 16:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643387671;
 bh=vKBJqy3HgSyoQ3Szu6K6a4NfdLf+ztljFywvbKYyDgg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cHj+EtmHQvt0dtQaFbWX4vq+C5Cv4L/AEIDvGjyxEz/pqmD2NVhCupOcsjEfXG8MA
 frmRpaigGKUUH6R7rntbgCkw3T7XQDp3zNK4vmFTDaeXHxchjicsMf5O3Et7Sk3ibv
 cInHQ3wlpVK2wrLxekxevlPickRXlJUmNkasKjFE3ZO3JqPkeQN4V5buTTnek7Yd8q
 j5poeCM9aClvFIqp20DqDa8GMLtddf9xwth/I939TS/cnAVuZYsLXkYU4tLwejvFSV
 RdNBNlECk+BZMW+VWoRIUB5IDd/IaJLqDj5GHWPk5zSyHNAHBzLqq5zTNGgvX/LOif
 U0YnKEKfh8fZA==
Received: by mail-ed1-f53.google.com with SMTP id n10so10908742edv.2;
 Fri, 28 Jan 2022 08:34:31 -0800 (PST)
X-Gm-Message-State: AOAM5309XnhgQHr0pXK6hTMvRHRWdtP2gEnfjjws8s+vup/smGMPqjBk
 WIb7qUj3nTLZgGP7fvU4kxNTtYkZGcg1aeVzFA==
X-Google-Smtp-Source: ABdhPJwpSggw7SdLa1FbKIZONU5K+W023Jtjz05zG88sY8zQp5+Q0ssZTlDRL2c2nppnnyauteddq6HH5n7jFN6IIxg=
X-Received: by 2002:a05:6402:4401:: with SMTP id
 y1mr8955863eda.215.1643387669820; 
 Fri, 28 Jan 2022 08:34:29 -0800 (PST)
MIME-Version: 1.0
References: <20220128120718.30545-1-yongqiang.niu@mediatek.com>
 <20220128120718.30545-4-yongqiang.niu@mediatek.com>
In-Reply-To: <20220128120718.30545-4-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 29 Jan 2022 00:34:18 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-c8CoPpT=4E9iR0fDiWfg9my=B7Oz1r4Vro80uHaGszg@mail.gmail.com>
Message-ID: <CAAOTY_-c8CoPpT=4E9iR0fDiWfg9my=B7Oz1r4Vro80uHaGszg@mail.gmail.com>
Subject: Re: [PATCH v1, 3/4] drm/mediatek: split postmask component
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, 
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_083434_421548_B03792DA 
X-CRM114-Status: GOOD (  18.78  )
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

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMuW5tDHmnIgyOOaXpSDpgLHkupQg5LiL5Y2IODowN+Wvq+mBk++8mgo+Cj4gYWRk
IHBvc3RtYXNrIHByaXZhdGUgZGF0YSBmb3IgZGlmZmVybnQgc29jIHN1cHBvcnQKPgo+IFNpZ25l
ZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgICAgICB8ICAgMSAr
Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9kcnYuaCAgICAgIHwgICA4ICsK
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3Bvc3RtYXNrLmMgfCAxNTUgKysr
KysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBf
Y29tcC5jICB8ICAzMCArLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Ry
di5jICAgICAgIHwgICAyICsKPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2
LmggICAgICAgfCAgIDEgKwo+ICA2IGZpbGVzIGNoYW5nZWQsIDE3MCBpbnNlcnRpb25zKCspLCAy
NyBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGlzcF9wb3N0bWFzay5jCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL01ha2VmaWxlIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxlCj4g
aW5kZXggMjkwOThkN2M4MzA3Li5mMjZmZTY0NmVlMmEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL01ha2VmaWxlCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L01ha2VmaWxlCj4gQEAgLTUsNiArNSw3IEBAIG1lZGlhdGVrLWRybS15IDo9IG10a19kaXNwX2Fh
bC5vIFwKPiAgICAgICAgICAgICAgICAgICBtdGtfZGlzcF9jb2xvci5vIFwKPiAgICAgICAgICAg
ICAgICAgICBtdGtfZGlzcF9nYW1tYS5vIFwKPiAgICAgICAgICAgICAgICAgICBtdGtfZGlzcF9v
dmwubyBcCj4gKyAgICAgICAgICAgICAgICAgbXRrX2Rpc3BfcG9zdG1hc2subyBcCj4gICAgICAg
ICAgICAgICAgICAgbXRrX2Rpc3BfcmRtYS5vIFwKPiAgICAgICAgICAgICAgICAgICBtdGtfZHJt
X2NydGMubyBcCj4gICAgICAgICAgICAgICAgICAgbXRrX2RybV9kZHBfY29tcC5vIFwKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2Rydi5oIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2Rydi5oCj4gaW5kZXggODZjMzA2ODg5NGIxLi5m
NGMyMTE5NWMzZWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
aXNwX2Rydi5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2Rydi5o
Cj4gQEAgLTgxLDYgKzgxLDE0IEBAIHZvaWQgbXRrX292bF9lbmFibGVfdmJsYW5rKHN0cnVjdCBk
ZXZpY2UgKmRldiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICp2YmxhbmtfY2Jf
ZGF0YSk7Cj4gIHZvaWQgbXRrX292bF9kaXNhYmxlX3ZibGFuayhzdHJ1Y3QgZGV2aWNlICpkZXYp
Owo+Cj4gK2ludCBtdGtfcG9zdG1hc2tfY2xrX2VuYWJsZShzdHJ1Y3QgZGV2aWNlICpkZXYpOwo+
ICt2b2lkIG10a19wb3N0bWFza19jbGtfZGlzYWJsZShzdHJ1Y3QgZGV2aWNlICpkZXYpOwo+ICt2
b2lkIG10a19wb3N0bWFza19jb25maWcoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQg
dywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBoLCB1bnNp
Z25lZCBpbnQgdnJlZnJlc2gsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBpbnQgYnBjLCBzdHJ1Y3QgY21kcV9wa3QgKmNtZHFfcGt0KTsKPiArdm9pZCBtdGtfcG9z
dG1hc2tfc3RhcnQoc3RydWN0IGRldmljZSAqZGV2KTsKPiArdm9pZCBtdGtfcG9zdG1hc2tfc3Rv
cChzdHJ1Y3QgZGV2aWNlICpkZXYpOwo+ICsKPiAgdm9pZCBtdGtfcmRtYV9ieXBhc3Nfc2hhZG93
KHN0cnVjdCBkZXZpY2UgKmRldik7Cj4gIGludCBtdGtfcmRtYV9jbGtfZW5hYmxlKHN0cnVjdCBk
ZXZpY2UgKmRldik7Cj4gIHZvaWQgbXRrX3JkbWFfY2xrX2Rpc2FibGUoc3RydWN0IGRldmljZSAq
ZGV2KTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3Bv
c3RtYXNrLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcG9zdG1hc2suYwo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5mYzA0YjQ0NWMyZWQK
PiAtLS0gL2Rldi9udWxsCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNw
X3Bvc3RtYXNrLmMKPiBAQCAtMCwwICsxLDE1NSBAQAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMC1vbmx5Cj4gKy8qCj4gKyAqIENvcHlyaWdodCAoYykgMjAyMSBNZWRpYVRl
ayBJbmMuCgoyMDIyCgo+ICsgKi8KPiArCj4gKyNpbmNsdWRlIDxsaW51eC9jbGsuaD4KPiArI2lu
Y2x1ZGUgPGxpbnV4L2NvbXBvbmVudC5oPgo+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4g
KyNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4KPiArI2luY2x1ZGUgPGxpbnV4L29mX2lycS5o
Pgo+ICsjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gKyNpbmNsdWRlIDxsaW51
eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaD4KPiArCj4gKyNpbmNsdWRlICJtdGtfZGlzcF9kcnYu
aCIKPiArI2luY2x1ZGUgIm10a19kcm1fY3J0Yy5oIgo+ICsjaW5jbHVkZSAibXRrX2RybV9kZHBf
Y29tcC5oIgo+ICsKPiArI2RlZmluZSBESVNQX1BPU1RNQVNLX0VOICAgICAgICAgICAgICAgICAg
ICAgICAweDAwMDAKPiArI2RlZmluZSBQT1NUTUFTS19FTiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIEJJVCgwKQo+ICsjZGVmaW5lIERJU1BfUE9TVE1BU0tfQ0ZHICAgICAgICAg
ICAgICAgICAgICAgIDB4MDAyMAo+ICsjZGVmaW5lIFBPU1RNQVNLX1JFTEFZX01PREUgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgQklUKDApCj4gKyNkZWZpbmUgRElTUF9QT1NUTUFTS19TSVpF
ICAgICAgICAgICAgICAgICAgICAgMHgwMDMwCgpJIHRoaW5rIHlvdSBzaG91bGQgJ21vdmUnIHRo
ZXNlIGRlZmluaXRpb24gbm90ICdjb3B5JyB0aGVtLCBzbwpyZW1lbWJlciB0byByZW1vdmUgdGhl
bSBpbiBtdGtfZHJtX2RkcF9jb21wLmMKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ICsKPiArc3Ry
dWN0IG10a19kaXNwX3Bvc3RtYXNrX2RhdGEgewo+ICsgICAgICAgdTMyIHJlc2VydmVkOwo+ICt9
Owo+ICsKPiArLyoKPiArICogc3RydWN0IG10a19kaXNwX3Bvc3RtYXNrIC0gRElTUF9QT1NUTUFT
SyBkcml2ZXIgc3RydWN0dXJlCj4gKyAqLwo+ICtzdHJ1Y3QgbXRrX2Rpc3BfcG9zdG1hc2sgewo+
ICsgICAgICAgc3RydWN0IGNsayAqY2xrOwo+ICsgICAgICAgdm9pZCBfX2lvbWVtICpyZWdzOwo+
ICsgICAgICAgc3RydWN0IGNtZHFfY2xpZW50X3JlZyBjbWRxX3JlZzsKPiArICAgICAgIGNvbnN0
IHN0cnVjdCBtdGtfZGlzcF9wb3N0bWFza19kYXRhICpkYXRhOwo+ICt9Owo+ICsKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
