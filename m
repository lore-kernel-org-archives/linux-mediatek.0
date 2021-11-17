Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90401C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 23:52:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5036F60F9C
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 23:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5036F60F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N8Iz7QrBur5VLf9GLX34Allvo0ecjYCUu45tFKyPYr8=; b=cj12rjha9jRoHy
	JqPxSQzRe85a1o3byalPAuG2d56Rw0z6jKq59Ses/AnwnLDbC4IcybUpMnJ75X5c65J7szRIKVDt5
	hxbYzWsyEL5pamQVnj9t9hmrAcYEqD3tE1Jrfws1TsP7qaKuwiMcaSMif4IZNjlaKrzx9WIPcSHaH
	bKhq8MEFvjg9m39pct2bRM1rezw1Ik8S/Oe0++sCIHkoCrBgcjnjcXHmWfqhsM0iiCRbteh1hVY6f
	8gthCGtD0OeiZUOlxpea55aTa1YOOlKo47fpNw/mO9u5P8Ct8FxFxGtdLdm9CMmmZCN+k5vCFets6
	FA3nGsqyjmLUsgB8ZeJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnUid-006b2h-8o; Wed, 17 Nov 2021 23:51:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnUiP-006azM-WA; Wed, 17 Nov 2021 23:51:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3643F61BD3;
 Wed, 17 Nov 2021 23:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637193105;
 bh=ZIuBXznCZTHqa3nOAy53L5b5XyA4/YwjswwSJW5QWNU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gswTE0ACcQ/r+5MGUJl40onWeslOi99B5YCJGx59mn/WP+15Jvn3lNPb1R/E50Khg
 +EpK64tWg//+NhYiq9JINeaGBDm2IhwxQHTwPj1tZ8ZY9TmYOINwpGCbvmN9kXdeoB
 nitUJpwHuLctod25/VYhPSe9ANWusBZC6JCrrMS3zj29xT7zxjOT3ztRda3sEXvhY4
 ODOz+A5v4wweoG9I372h4NBS54owVuo/dU9WrAo7FR7YJMpVYc1FDTZX6UTHSmy476
 l9KG4SD6fBA1A7w+UubB8w0xDi7neOaW7vQQrN6u9x6GBJZEpBhtCCHBa+Neo+6rE4
 MErDiOLCYbOVg==
Received: by mail-ed1-f51.google.com with SMTP id y13so18350067edd.13;
 Wed, 17 Nov 2021 15:51:45 -0800 (PST)
X-Gm-Message-State: AOAM5326tvHi5qjauQKcsAQUL+HvmLnrwUs0bQ1Gat0gRapw7shbnnva
 P8LkaQYkAgbaWuyiptV3u9nKQIChpcdepmajog==
X-Google-Smtp-Source: ABdhPJzZpYIo+cd8wMcVpCye06DU1Qqc9x9xGxki7AWNJrrL9JgkZksVJDRb9AP2dnU2JZGb4+zU7elF+rs/DoPFF6k=
X-Received: by 2002:aa7:c347:: with SMTP id j7mr4277614edr.272.1637193103549; 
 Wed, 17 Nov 2021 15:51:43 -0800 (PST)
MIME-Version: 1.0
References: <20211027021857.20816-1-jason-jh.lin@mediatek.com>
 <20211027021857.20816-4-jason-jh.lin@mediatek.com>
 <CAC=S1ng2=XRV9s2t2dxQf1a2V2GsFwhfB8tRxnNDp-QD5eR_xQ@mail.gmail.com>
 <CAAOTY_9sCr-CM6WsZ6q7mtfqr9A5sNccC0bk1vq=Hdqr3rGkQw@mail.gmail.com>
 <CAC=S1njhuzPi6gOmGfqhtKMtDTsGPzZ7P=PoVbAviHt1o00U6w@mail.gmail.com>
In-Reply-To: <CAC=S1njhuzPi6gOmGfqhtKMtDTsGPzZ7P=PoVbAviHt1o00U6w@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 18 Nov 2021 07:51:32 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9eA3pzCDdXpjRUpd-zy2uzn_kVmeVnBwFT6hU=U5hZ-A@mail.gmail.com>
Message-ID: <CAAOTY_9eA3pzCDdXpjRUpd-zy2uzn_kVmeVnBwFT6hU=U5hZ-A@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] drm/mediatek: Detect CMDQ execution timeout
To: Fei Shao <fshao@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 "jason-jh.lin" <jason-jh.lin@mediatek.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_155146_119748_C80517D0 
X-CRM114-Status: GOOD (  33.21  )
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

SGksIEZlaToKCkZlaSBTaGFvIDxmc2hhb0BjaHJvbWl1bS5vcmc+IOaWvCAyMDIx5bm0MTDmnIgy
OOaXpSDpgLHlm5sg5LiK5Y2IMTE6MTnlr6vpgZPvvJoKPgo+IEhpIENodW4tS3VhbmcsCj4KPiBP
biBUaHUsIE9jdCAyOCwgMjAyMSBhdCA3OjQ3IEFNIENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5o
dUBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBIaSwgRmVpOgo+ID4KPiA+IEZlaSBTaGFvIDxm
c2hhb0BjaHJvbWl1bS5vcmc+IOaWvCAyMDIx5bm0MTDmnIgyN+aXpSDpgLHkuIkg5LiL5Y2INToz
MuWvq+mBk++8mgo+ID4gPgo+ID4gPiBIaSBKYXNvbiwKPiA+ID4KPiA+ID4gT24gV2VkLCBPY3Qg
MjcsIDIwMjEgYXQgMTA6MTkgQU0gamFzb24tamgubGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsu
Y29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IEZyb206IENodW4tS3VhbmcgSHUgPGNodW5rdWFu
Zy5odUBrZXJuZWwub3JnPgo+ID4gPiA+Cj4gPiA+ID4gQ01EUSBpcyB1c2VkIHRvIHVwZGF0ZSBk
aXNwbGF5IHJlZ2lzdGVyIGluIHZibGFuayBwZXJpb2QsIHNvCj4gPiA+ID4gaXQgc2hvdWxkIGJl
IGV4ZWN1dGUgaW4gbmV4dCAyIHZibGFuay4gT25lIHZibGFuayBpbnRlcnJ1cHQKPiA+ID4gPiBi
ZWZvcmUgc2VuZCBtZXNzYWdlIChvY2Nhc2lvbmFsbHkpIGFuZCBvbmUgdmJsYW5rIGludGVycnVw
dAo+ID4gPiA+IGFmdGVyIGNtZHEgZG9uZS4gSWYgaXQgZmFpbCB0byBleGVjdXRlIGluIG5leHQg
MyB2YmxhbmssCj4gPiA+ID4gdGllbW91dCBoYXBwZW4uCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBqYXNvbi1qaC5saW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+Cj4g
PiA+ID4gUmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3Jn
Pgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9j
cnRjLmMgfCAyMCArKysrKysrKysrKysrKysrKystLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MTggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiA+ID4gPiBpbmRleCBlMjNlMzIyNGFjNjcu
LmRhZDFmODVlZTMxNSAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9jcnRjLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9jcnRjLmMKPiA+ID4gPiBAQCAtNTQsNiArNTQsNyBAQCBzdHJ1Y3QgbXRrX2RybV9j
cnRjIHsKPiA+ID4gPiAgI2lmIElTX1JFQUNIQUJMRShDT05GSUdfTVRLX0NNRFEpCj4gPiA+ID4g
ICAgICAgICBzdHJ1Y3QgY21kcV9jbGllbnQgICAgICAgICAgICAgIGNtZHFfY2xpZW50Owo+ID4g
PiA+ICAgICAgICAgdTMyICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjbWRxX2V2ZW50Owo+
ID4gPiA+ICsgICAgICAgdTMyICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjbWRxX3ZibGFu
a19jbnQ7Cj4gPiA+ID4gICNlbmRpZgo+ID4gPiA+Cj4gPiA+ID4gICAgICAgICBzdHJ1Y3QgZGV2
aWNlICAgICAgICAgICAgICAgICAgICptbXN5c19kZXY7Cj4gPiA+ID4gQEAgLTIyNyw3ICsyMjgs
MTAgQEAgc3RydWN0IG10a19kZHBfY29tcCAqbXRrX2RybV9kZHBfY29tcF9mb3JfcGxhbmUoc3Ry
dWN0IGRybV9jcnRjICpjcnRjLAo+ID4gPiA+ICBzdGF0aWMgdm9pZCBkZHBfY21kcV9jYihzdHJ1
Y3QgbWJveF9jbGllbnQgKmNsLCB2b2lkICptc3NnKQo+ID4gPiA+ICB7Cj4gPiA+ID4gICAgICAg
ICBzdHJ1Y3QgY21kcV9jYl9kYXRhICpkYXRhID0gbXNzZzsKPiA+ID4gPiArICAgICAgIHN0cnVj
dCBjbWRxX2NsaWVudCAqY21kcV9jbCA9IGNvbnRhaW5lcl9vZihjbCwgc3RydWN0IGNtZHFfY2xp
ZW50LCBjbGllbnQpOwo+ID4gPiA+ICsgICAgICAgc3RydWN0IG10a19kcm1fY3J0YyAqbXRrX2Ny
dGMgPSBjb250YWluZXJfb2YoY21kcV9jbCwgc3RydWN0IG10a19kcm1fY3J0YywgY21kcV9jbGll
bnQpOwo+ID4gPiA+Cj4gPiA+ID4gKyAgICAgICBtdGtfY3J0Yy0+Y21kcV92YmxhbmtfY250ID0g
MDsKPiA+ID4gPiAgICAgICAgIGNtZHFfcGt0X2Rlc3Ryb3koZGF0YS0+cGt0KTsKPiA+ID4gPiAg
fQo+ID4gPiA+ICAjZW5kaWYKPiA+ID4gPiBAQCAtNDgzLDYgKzQ4NywxNSBAQCBzdGF0aWMgdm9p
ZCBtdGtfZHJtX2NydGNfdXBkYXRlX2NvbmZpZyhzdHJ1Y3QgbXRrX2RybV9jcnRjICptdGtfY3J0
YywKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY21k
cV9oYW5kbGUtPnBhX2Jhc2UsCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNtZHFfaGFuZGxlLT5jbWRfYnVmX3NpemUsCj4gPiA+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERNQV9UT19ERVZJQ0UpOwo+ID4gPiA+
ICsgICAgICAgICAgICAgICAvKgo+ID4gPiA+ICsgICAgICAgICAgICAgICAgKiBDTURRIGNvbW1h
bmQgc2hvdWxkIGV4ZWN1dGUgaW4gbmV4dCAzIHZibGFuay4KPiA+ID4gPiArICAgICAgICAgICAg
ICAgICogT25lIHZibGFuayBpbnRlcnJ1cHQgYmVmb3JlIHNlbmQgbWVzc2FnZSAob2NjYXNpb25h
bGx5KQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgKiBhbmQgb25lIHZibGFuayBpbnRlcnJ1cHQg
YWZ0ZXIgY21kcSBkb25lLAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgKiBzbyBpdCdzIHRpbWVv
dXQgYWZ0ZXIgMyB2YmxhbmsgaW50ZXJydXB0Lgo+ID4gPiA+ICsgICAgICAgICAgICAgICAgKiBJ
ZiBpdCBmYWlsIHRvIGV4ZWN1dGUgaW4gbmV4dCAzIHZibGFuaywgdGltZW91dCBoYXBwZW4uCj4g
PiA+ID4gKyAgICAgICAgICAgICAgICAqLwo+ID4gPiA+ICsgICAgICAgICAgICAgICBtdGtfY3J0
Yy0+Y21kcV92YmxhbmtfY250ID0gMzsKPiA+ID4gPiArCj4gPiA+ID4gICAgICAgICAgICAgICAg
IG1ib3hfc2VuZF9tZXNzYWdlKG10a19jcnRjLT5jbWRxX2NsaWVudC5jaGFuLCBjbWRxX2hhbmRs
ZSk7Cj4gPiA+ID4gICAgICAgICAgICAgICAgIG1ib3hfY2xpZW50X3R4ZG9uZShtdGtfY3J0Yy0+
Y21kcV9jbGllbnQuY2hhbiwgMCk7Cj4gPiA+ID4gICAgICAgICB9Cj4gPiA+ID4gQEAgLTQ5OSwx
MSArNTEyLDE0IEBAIHN0YXRpYyB2b2lkIG10a19jcnRjX2RkcF9pcnEodm9pZCAqZGF0YSkKPiA+
ID4gPgo+ID4gPiA+ICAjaWYgSVNfUkVBQ0hBQkxFKENPTkZJR19NVEtfQ01EUSkKPiA+ID4gPiAg
ICAgICAgIGlmICghcHJpdi0+ZGF0YS0+c2hhZG93X3JlZ2lzdGVyICYmICFtdGtfY3J0Yy0+Y21k
cV9jbGllbnQuY2hhbikKPiA+ID4gPiArICAgICAgICAgICAgICAgbXRrX2NydGNfZGRwX2NvbmZp
ZyhjcnRjLCBOVUxMKTsKPiA+ID4gPiArICAgICAgIGVsc2UgaWYgKG10a19jcnRjLT5jbWRxX3Zi
bGFua19jbnQgPiAwICYmIC0tbXRrX2NydGMtPmNtZHFfdmJsYW5rX2NudCA9PSAwKQo+ID4gPiBJ
IHRoaW5rIGF0b21pY19kZWNfYW5kX3Rlc3QoKSBkb2VzIHdoYXQgeW91IHdhbnQgdG8gZG8gaGVy
ZS4KPiA+Cj4gPiBJIHRoaW5rIHRoaXMgb3BlcmF0aW9uIGlzIG5vdCBuZWNlc3NhcnkgdG8gYmUg
YXRvbWljIG9wZXJhdGlvbiwgYW5kCj4gPiB0aGlzIHN0YXRlbWVudCBjb3VsZCBiZSByZWR1Y2Vk
IHRvCj4gPgo+ID4gZWxzZSBpZiAoLS1tdGtfY3J0Yy0+Y21kcV92YmxhbmtfY250ID09IDApCj4K
PiBJIHdhcyB0aGlua2luZyBhYm91dCB1c2luZyBleGlzdGluZyBoZWxwZXJzIHRvIHdyYXAgdXAg
dGhlIGNvdW50ZXIKPiBvcGVyYXRpb25zLCBidXQgSSBhZ3JlZSB0aGF0IGl0J3Mgbm90IG5lY2Vz
c2FyeS4KPiBKdXN0IGRyb3BwaW5nIHRoZSByZWR1bmRhbnQgY2hlY2sgd291bGQgYmUgZ29vZCBl
bm91Z2guCgpJIGZpbmQgb25lIHRoaW5nIHNvIHRoYXQgSSB3b3VsZCBsaWtlIHRoaXMgdmVyc2lv
bi4gSWYgd2UgZG8gbm90IGNoZWNrCm10a19jcnRjLT5jbWRxX3ZibGFua19jbnQgPiAwLCBtdGtf
Y3J0Yy0+Y21kcV92YmxhbmtfY250IHdvdWxkCmRlY3JlYXNlIHRvIG1pbnVzLiBBbmQgb25lIGRh
eSBpdCB3b3VsZCByb3VuZCB0byBwb3NpdGl2ZS4gU28gSSB3b3VsZApwaWNrIHRoaXMgdmVyc2lv
biBpbnN0ZWFkIG9mIHY2LgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPgo+ID4KPiA+ID4KPiA+
ID4gPiArICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJtdGtfY3J0YyAlZCBDTURRIGV4ZWN1dGUg
Y29tbWFuZCB0aW1lb3V0IVxuIiwKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIGRy
bV9jcnRjX2luZGV4KCZtdGtfY3J0Yy0+YmFzZSkpOwo+ID4gPiA+ICAjZWxzZQo+ID4gPiA+ICAg
ICAgICAgaWYgKCFwcml2LT5kYXRhLT5zaGFkb3dfcmVnaXN0ZXIpCj4gPiA+ID4gLSNlbmRpZgo+
ID4gPiA+ICAgICAgICAgICAgICAgICBtdGtfY3J0Y19kZHBfY29uZmlnKGNydGMsIE5VTEwpOwo+
ID4gPiA+IC0KPiA+ID4gPiArI2VuZGlmCj4gPiA+ID4gICAgICAgICBtdGtfZHJtX2ZpbmlzaF9w
YWdlX2ZsaXAobXRrX2NydGMpOwo+ID4gPiA+ICB9Cj4gPiA+ID4KPiA+ID4gPiAtLQo+ID4gPiA+
IDIuMTguMAo+ID4gPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
