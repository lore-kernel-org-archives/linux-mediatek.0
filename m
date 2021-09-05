Return-Path: <SRS0=a7PR=N3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB8CC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Sep 2021 04:18:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73FE460F9F
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Sep 2021 04:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 73FE460F9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b6ZyXOdF8i6MJMe8o1NchGckyRRD3VGgFDKTjFjKRPI=; b=RDT5FpigUzP6Ed
	5m2duY+gdk2TwS1W/J9JsyH+a1W7dH0p65VvgzNSfreWO1XnZUsREum6B8+ggjot/VSd4/QsKyZc1
	9uaCxJUyFFF9JPmk+nBX6k8Rya5Kt3EDQNbxgeU67vFOVoq32SVI459pIqtsO83UX8/2mgxtSpcg0
	ai0/sqLLSG5SysPVVoFf0brnB5LyrU0pChItGZ1Veyzshd4LTtrIRgWuFaHQMWMYRR5l1Crch2s98
	YBA9it8JRlWEJmKx3pCR/aUcvHMn48nHDXZYWhXSqnxrG0vX0yvIqR6JbaJmg3jTRAF7pw8V3JJZK
	FijfBgyW630R2XVRyoug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMjcD-00FD4H-9r; Sun, 05 Sep 2021 04:18:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMjbz-00FD1V-VF; Sun, 05 Sep 2021 04:18:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 600D760F4A;
 Sun,  5 Sep 2021 04:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630815509;
 bh=hILamdUxAScAanWUq9dM9vg/cWHDnGZEiyiKkUJl9g4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tmZMQa+nwkbHtU6/6zmn2ClmmhDgxFNLclrztOmm1y5TsjbK3vdWV3trieA+hFI54
 2pVs0EPg4lHhsNWC8KCW5uHjPTSrzcxN6FaYa/aW5+oaoYbcdBZhqKTGD2tuJgr/8O
 sLGFJwSupP4j/ZO6a3ffhgfUiDVEIjvSaznm/leYQpsMrPwypWGRcu9QpyJyoYR+td
 ZUKuE2Q6CPoIV/t4tywRkKMcddeNVP6Zmy4O014hzggPrUox4Yn/0rRIvt7zTAzsxd
 mShAFNcH0lF/pUJc1S9XVLsPuEQ2q7iNjcN2Geb3jeLaQAmY7veAQphD9h+HpxWvfp
 DoYoo3ZxejBVg==
Received: by mail-ed1-f53.google.com with SMTP id u19so4637839edb.3;
 Sat, 04 Sep 2021 21:18:29 -0700 (PDT)
X-Gm-Message-State: AOAM530Q774a4KgdAkv+t+Vzs5CHKCqTJJWBv0plQdneaCQnvM8ybWN1
 gPXV1vLETrBv9Y5ySjIYc/fMd5B0tSStzZ5H1A==
X-Google-Smtp-Source: ABdhPJyhdyVAnNA0Mv4NieZnYZWl2o+UnL75b6sLcTvXxKX77z04lVP3xY3uwzh8aNDQCHuVhS+3EYQvEM8c/7Oj8dY=
X-Received: by 2002:a50:bb0f:: with SMTP id y15mr1727649ede.159.1630815507961; 
 Sat, 04 Sep 2021 21:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210825144833.7757-1-jason-jh.lin@mediatek.com>
 <20210825144833.7757-10-jason-jh.lin@mediatek.com>
In-Reply-To: <20210825144833.7757-10-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 5 Sep 2021 12:18:16 +0800
X-Gmail-Original-Message-ID: <CAAOTY__UuzKqNoTSQw9OwPCyQH7m9Sdf-CUvdcnr7jz5Hne-nA@mail.gmail.com>
Message-ID: <CAAOTY__UuzKqNoTSQw9OwPCyQH7m9Sdf-CUvdcnr7jz5Hne-nA@mail.gmail.com>
Subject: Re: [PATCH v9 09/14] drm/mediatek: remove unused define in
 mtk_drm_ddp_comp.c
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Fabien Parent <fparent@baylibre.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, fshao@chromium.org, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com, 
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210904_211832_085438_FF28F3CF 
X-CRM114-Status: GOOD (  11.95  )
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
MjAyMeW5tDjmnIgyNeaXpSDpgLHkuIkg5LiL5Y2IMTA6NDjlr6vpgZPvvJoKPgo+IFJlbW92ZSB0
aGUgdW5zZWQgZGVmaW5lIGluIG10a19kcm1fZGRwX2NvbXAuYwoKUmV2aWV3ZWQtYnk6IENodW4t
S3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPgo+IFNpZ25lZC1vZmYtYnk6IGph
c29uLWpoLmxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiByZWJhc2Ugb24g
WzFdIHNlcmllcwo+IFsxXSBkcm0vbWVkaWF0ZWs6IFNlcGFyYXRlIGFhbCBtb2R1bGUKPiAtIGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9saXN0Lz9z
ZXJpZXM9NTE2NDYzCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rk
cF9jb21wLmMgfCAxMCAtLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBf
Y29tcC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+IGlu
ZGV4IDk5Y2JmNDQ0NjNlNC4uNDg0MDgwYTBkZWZhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gQEAgLTIxLDggKzIxLDYgQEAKPiAgI2luY2x1
ZGUgIm10a19kcm1fY3J0Yy5oIgo+Cj4gICNkZWZpbmUgRElTUF9PRF9FTiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgMHgwMDAwCj4gLSNkZWZpbmUgRElTUF9PRF9JTlRFTiAgICAgICAgICAg
ICAgICAgICAgICAgICAgMHgwMDA4Cj4gLSNkZWZpbmUgRElTUF9PRF9JTlRTVEEgICAgICAgICAg
ICAgICAgICAgICAgICAgMHgwMDBjCj4gICNkZWZpbmUgRElTUF9PRF9DRkcgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgMHgwMDIwCj4gICNkZWZpbmUgRElTUF9PRF9TSVpFICAgICAgICAgICAg
ICAgICAgICAgICAgICAgMHgwMDMwCj4gICNkZWZpbmUgRElTUF9ESVRIRVJfNSAgICAgICAgICAg
ICAgICAgICAgICAgICAgMHgwMTE0Cj4gQEAgLTM5LDI2ICszNywxOCBAQAo+ICAjZGVmaW5lIERJ
VEhFUl9FTkdJTkVfRU4gICAgICAgICAgICAgICAgICAgICAgIEJJVCgxKQo+ICAjZGVmaW5lIERJ
U1BfRElUSEVSX1NJWkUgICAgICAgICAgICAgICAgICAgICAgIDB4MDAzMAo+Cj4gLSNkZWZpbmUg
TFVUXzEwQklUX01BU0sgICAgICAgICAgICAgICAgICAgICAgICAgMHgwM2ZmCj4gLQo+ICAjZGVm
aW5lIE9EX1JFTEFZTU9ERSAgICAgICAgICAgICAgICAgICAgICAgICAgIEJJVCgwKQo+Cj4gICNk
ZWZpbmUgVUZPX0JZUEFTUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKDIpCj4KPiAg
I2RlZmluZSBESVNQX0RJVEhFUklORyAgICAgICAgICAgICAgICAgICAgICAgICBCSVQoMikKPiAg
I2RlZmluZSBESVRIRVJfTFNCX0VSUl9TSElGVF9SKHgpICAgICAgICAgICAgICAoKCh4KSAmIDB4
NykgPDwgMjgpCj4gLSNkZWZpbmUgRElUSEVSX09WRkxXX0JJVF9SKHgpICAgICAgICAgICAgICAg
ICAgKCgoeCkgJiAweDcpIDw8IDI0KQo+ICAjZGVmaW5lIERJVEhFUl9BRERfTFNISUZUX1IoeCkg
ICAgICAgICAgICAgICAgICgoKHgpICYgMHg3KSA8PCAyMCkKPiAtI2RlZmluZSBESVRIRVJfQURE
X1JTSElGVF9SKHgpICAgICAgICAgICAgICAgICAoKCh4KSAmIDB4NykgPDwgMTYpCj4gICNkZWZp
bmUgRElUSEVSX05FV19CSVRfTU9ERSAgICAgICAgICAgICAgICAgICAgQklUKDApCj4gICNkZWZp
bmUgRElUSEVSX0xTQl9FUlJfU0hJRlRfQih4KSAgICAgICAgICAgICAgKCgoeCkgJiAweDcpIDw8
IDI4KQo+IC0jZGVmaW5lIERJVEhFUl9PVkZMV19CSVRfQih4KSAgICAgICAgICAgICAgICAgICgo
KHgpICYgMHg3KSA8PCAyNCkKPiAgI2RlZmluZSBESVRIRVJfQUREX0xTSElGVF9CKHgpICAgICAg
ICAgICAgICAgICAoKCh4KSAmIDB4NykgPDwgMjApCj4gLSNkZWZpbmUgRElUSEVSX0FERF9SU0hJ
RlRfQih4KSAgICAgICAgICAgICAgICAgKCgoeCkgJiAweDcpIDw8IDE2KQo+ICAjZGVmaW5lIERJ
VEhFUl9MU0JfRVJSX1NISUZUX0coeCkgICAgICAgICAgICAgICgoKHgpICYgMHg3KSA8PCAxMikK
PiAtI2RlZmluZSBESVRIRVJfT1ZGTFdfQklUX0coeCkgICAgICAgICAgICAgICAgICAoKCh4KSAm
IDB4NykgPDwgOCkKPiAgI2RlZmluZSBESVRIRVJfQUREX0xTSElGVF9HKHgpICAgICAgICAgICAg
ICAgICAoKCh4KSAmIDB4NykgPDwgNCkKPiAtI2RlZmluZSBESVRIRVJfQUREX1JTSElGVF9HKHgp
ICAgICAgICAgICAgICAgICAoKCh4KSAmIDB4NykgPDwgMCkKPgo+ICBzdHJ1Y3QgbXRrX2RkcF9j
b21wX2RldiB7Cj4gICAgICAgICBzdHJ1Y3QgY2xrICpjbGs7Cj4gLS0KPiAyLjE4LjAKPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
