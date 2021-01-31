Return-Path: <SRS0=AqdA=HC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 920C8C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 16:21:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 568BE64E25
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 16:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 568BE64E25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z+BRo37xcAlt8WbYGYnWsQHZ1Ay9lFBCcGD4Qyr5FQo=; b=z05o2jgi/nFJeMf2h1+j6u3Tq
	p4ywwhhztWT0hGrGKbaXTLcsqKntvvhntg2Z8eV9vNZA1kU46vxeJtcQMthlxF1ddWJoBOi+6OFvC
	Mz4s3Z/MuleF6r/fGylkhFxA+yYUgg45g3SGe4wXHKGNhacNIGFFsZDAT3gVX+mQNaD9Mfd+lZqJA
	7eBSN1nDuQ73O3qhh3jgPrfG0U/KK+ZvUDuovcudY6c8y1jTxFuE7C+Wy0bUy+Dag/mKpkVEn6LIM
	6IocR5VpnOuXKi5AhKKm4GgaiE3xxkhoV38LwtAbDsL1NEZ7YnxUjarP1DNxZxf+vx/WnGrKc616X
	BY8C6Tyvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6FTA-00079t-3Y; Sun, 31 Jan 2021 16:21:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6FT6-00079E-VX; Sun, 31 Jan 2021 16:20:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9561464E25;
 Sun, 31 Jan 2021 16:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612110055;
 bh=MrU6Vi8JuCoqO9YRVNPeZ2JGh39IKGnuyIBNPLOLlpQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bSKphpc5f1RE3nsNGu0Th4sqTbFqe7+G1XywfNams9eLs2ihyc1CLp+6osp7ID3E+
 Uaf/UpsZgHlqyVc/ksMcX5GPl1YCsRYgiRRduO3PraeII4UYto3+ToFIsE+q1k/WM8
 xrMnB0NYimu8EcfgttCYwS5Y7hOz03MJytvukx5kjDripldXUynCGFQ8iyR8XWmMFy
 j/GWUwUNZBacjNxqT9UykShIrTh+lMIcxDetoXfLya04XB1AvsDnzZuqrh8A5dUQMJ
 gCOBEkrOzZL6NA2+3EAkjaNIwlJErbD8frRHw9TBV3BeYuUpt8ndI9hWDOMBTsgEVm
 1imX1z9cThxpw==
Received: by mail-wm1-f51.google.com with SMTP id o10so9948552wmc.1;
 Sun, 31 Jan 2021 08:20:55 -0800 (PST)
X-Gm-Message-State: AOAM533vzFVuPr7f5jjcvgLBzUJUCgMA6i+UpyGit+I1RndihcFipU65
 UCodpOC587BmF4lodOpvJdtK3O7OWzo9teBvfA==
X-Google-Smtp-Source: ABdhPJwPCZFhPN5mUkyw6DKGu/bvbsLgmzrLkGSWwsvNAV5pWUO24vfzQYurKKwgol5AD4UqDe1BKiP6V7gKBbY/K0E=
X-Received: by 2002:a1c:7f94:: with SMTP id
 a142mr11433187wmd.145.1612110054247; 
 Sun, 31 Jan 2021 08:20:54 -0800 (PST)
MIME-Version: 1.0
References: <20210131051058.3407985-1-hsinyi@chromium.org>
In-Reply-To: <20210131051058.3407985-1-hsinyi@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 1 Feb 2021 00:20:41 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9kOnYDs=_22qBV7kOM74zcfKaobN0wBZaXzx31KsrG5Q@mail.gmail.com>
Message-ID: <CAAOTY_9kOnYDs=_22qBV7kOM74zcfKaobN0wBZaXzx31KsrG5Q@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: enable dither function
To: Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_112057_151546_6C9AE81B 
X-CRM114-Status: GOOD (  18.18  )
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
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEhzaW4tWWk6CgpIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+IOaWvCAyMDIx
5bm0MeaciDMx5pelIOmAseaXpSDkuIvljYgxOjEx5a+r6YGT77yaCj4KPiBGcm9tOiBZb25ncWlh
bmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPgo+IEVuYWJsZSBkaXRoZXIgZnVu
Y3Rpb24gdG8gaW1wcm92ZSB0aGUgZGlzcGxheSBxdWFsaXR5LgoKUmV2aWV3ZWQtYnk6IENodW4t
S3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPgo+IFNpZ25lZC1vZmYtYnk6IFlv
bmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IEhzaW4tWWkgV2FuZyA8aHNpbnlpQGNocm9taXVtLm9yZz4KPiAtLS0KPiBQcmV2aW91cyB2ZXJz
aW9uOgo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRl
ay9wYXRjaC8yMDIxMDEyOTA5MjIwOS4yNTg0NzE4LTctaHNpbnlpQGNocm9taXVtLm9yZy8KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyB8IDkgKysr
KysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2Nv
bXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiBpbmRl
eCBjNzMwMDI5YWM4ZmM3Li4wNDQ0YjQyOWRhZjAwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gQEAgLTUzLDYgKzUzLDcgQEAKPiAgI2RlZmlu
ZSBESVRIRVJfRU4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCSVQoMCkKPiAgI2RlZmlu
ZSBESVNQX0RJVEhFUl9DRkcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDAyMAo+
ICAjZGVmaW5lIERJVEhFUl9SRUxBWV9NT0RFICAgICAgICAgICAgICAgICAgICAgIEJJVCgwKQo+
ICsjZGVmaW5lIERJVEhFUl9FTkdJTkVfRU4gICAgICAgICAgICAgICAgICAgICAgIEJJVCgxKQo+
ICAjZGVmaW5lIERJU1BfRElUSEVSX1NJWkUgICAgICAgICAgICAgICAgICAgICAgIDB4MDAzMAo+
Cj4gICNkZWZpbmUgTFVUXzEwQklUX01BU0sgICAgICAgICAgICAgICAgICAgICAgICAgMHgwM2Zm
Cj4gQEAgLTMxNSw4ICszMTYsMTIgQEAgc3RhdGljIHZvaWQgbXRrX2RpdGhlcl9jb25maWcoc3Ry
dWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgdywKPiAgewo+ICAgICAgICAgc3RydWN0IG10
a19kZHBfY29tcF9kZXYgKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPgo+IC0gICAgICAg
bXRrX2RkcF93cml0ZShjbWRxX3BrdCwgaCA8PCAxNiB8IHcsICZwcml2LT5jbWRxX3JlZywgcHJp
di0+cmVncywgRElTUF9ESVRIRVJfU0laRSk7Cj4gLSAgICAgICBtdGtfZGRwX3dyaXRlKGNtZHFf
cGt0LCBESVRIRVJfUkVMQVlfTU9ERSwgJnByaXYtPmNtZHFfcmVnLCBwcml2LT5yZWdzLCBESVNQ
X0RJVEhFUl9DRkcpOwo+ICsgICAgICAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgaCA8PCAxNiB8
IHcsICZwcml2LT5jbWRxX3JlZywgcHJpdi0+cmVncywKPiArICAgICAgICAgICAgICAgICAgICAg
RElTUF9ESVRIRVJfU0laRSk7Cj4gKyAgICAgICBtdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCBESVRI
RVJfUkVMQVlfTU9ERSwgJnByaXYtPmNtZHFfcmVnLCBwcml2LT5yZWdzLAo+ICsgICAgICAgICAg
ICAgICAgICAgICBESVNQX0RJVEhFUl9DRkcpOwo+ICsgICAgICAgbXRrX2RpdGhlcl9zZXRfY29t
bW9uKHByaXYtPnJlZ3MsICZwcml2LT5jbWRxX3JlZywgYnBjLCBESVNQX0RJVEhFUl9DRkcsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRElUSEVSX0VOR0lORV9FTiwgY21kcV9wa3Qp
Owo+ICB9Cj4KPiAgc3RhdGljIHZvaWQgbXRrX2RpdGhlcl9zdGFydChzdHJ1Y3QgZGV2aWNlICpk
ZXYpCj4gLS0KPiAyLjMwLjAuMzY1LmcwMmJjNjkzNzg5LWdvb2cKPgo+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
