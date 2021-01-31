Return-Path: <SRS0=AqdA=HC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65986C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 04:08:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D329564E21
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 04:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D329564E21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qrV6mZw5RwymYzajLGhyr8xeuTj9sM2mnT3KGJn7ZoI=; b=iizKSNo4HVdOK8DCFjt5Tt1gQ
	Rh51Rcx4OEtKV7Hi4EKb3ilvwiK9EhY6LNeMXzBrBo+9mO4FvFPnwyOcpw6yhhZpuXVwgzkK1iAUz
	rjCaRiVsHjNWMalEJvPMLH9MqZIJmCPb5d4Oh/wKuRc1KiaWG7jrUG2RRlUnypNNyY2vz5K3Wdvxg
	1tYhF3TDchYL/wi4bEz7G18siBHNZthEyUeMbyLDuwthSRzdLtk7u2GQIBSotaH/unyxmgVga4jR9
	1G7Kkx3KpkOHcxkmg6Pp6PeJGv/XF0plsoV070btyZIoYXgrK/71RBtWLD634OfMZcpJZT5PXKPM3
	lB3MJLmyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l641x-0002VQ-1Q; Sun, 31 Jan 2021 04:08:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l641s-0002U6-Bo; Sun, 31 Jan 2021 04:08:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2A0864E27;
 Sun, 31 Jan 2021 04:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612066081;
 bh=lKzleoYse1WWmJcEChAlbjscN0Xf+sfihtZYkKKf85s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eANJ+WQ+N7YZHr/p1Oyv+mx2R9bX6sjAL6HDNSPr+1sXq+ONAFZLaT8/6fFMbXMgu
 a3Y2Q30LMY7aMWZ5KXXIIluxUs9+1S27xvSHUAqjefABJ5bPf86aId6rJk4E04V+zD
 zAkeqYEl81sW21MS9MLhIYZ7zFuyY4/yU40sqRlcxE85lDdNHvcQthssLKhd9swknU
 goyz4ljwKvhCuBUoN97BLgu0+/y5hwBkOdLMe3qbiAZJdHWaBh/pl+NLhmbwwYDmjt
 Tgr5vHquc95v/D/7Kmhj758Lx4QtlTeEO/YzFr4mBMdbciyJqef95OrrBlucvBKWo0
 7QEnNtWx9UTiQ==
Received: by mail-ej1-f53.google.com with SMTP id l9so19018681ejx.3;
 Sat, 30 Jan 2021 20:08:00 -0800 (PST)
X-Gm-Message-State: AOAM531VZz9VWOpnANwC49GI6nPbltUY881n1ITw2mbzTSs9R47jDkVx
 h3nLKwNg+7Arvgckop1qatVMdfBtYqirDRQRBg==
X-Google-Smtp-Source: ABdhPJxQHiYJAWIUOtxU2P4rTwKUPjdQjw180RpM2UyZdDEwwxkcERAsh+oIHZQM95GqTQnSkSevj61XorkLzNvhgoY=
X-Received: by 2002:a17:906:a106:: with SMTP id
 t6mr11678160ejy.63.1612066079184; 
 Sat, 30 Jan 2021 20:07:59 -0800 (PST)
MIME-Version: 1.0
References: <20210129073436.2429834-1-hsinyi@chromium.org>
 <20210129073436.2429834-6-hsinyi@chromium.org>
In-Reply-To: <20210129073436.2429834-6-hsinyi@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 31 Jan 2021 12:07:47 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-e4CGXVfUdYBBx6ewEopZrfmuf2d6y77i=-hZ4P13N1g@mail.gmail.com>
Message-ID: <CAAOTY_-e4CGXVfUdYBBx6ewEopZrfmuf2d6y77i=-hZ4P13N1g@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] drm/mediatek: separate ccorr module
To: Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_230804_564984_B7744C7D 
X-CRM114-Status: GOOD (  13.81  )
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
5bm0MeaciDI55pelIOmAseS6lCDkuIvljYgzOjM15a+r6YGT77yaCj4KPiBGcm9tOiBZb25ncWlh
bmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPgo+IGNjb3JyIGN0bSBtYXRyaXgg
Yml0cyB3aWxsIGJlIGRpZmZlcmVudCBpbiBtdDgxOTIKPgo+IFNpZ25lZC1vZmYtYnk6IFlvbmdx
aWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEhz
aW4tWWkgV2FuZyA8aHNpbnlpQGNocm9taXVtLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL01ha2VmaWxlICAgICAgICAgICB8ICAgMyArLQo+ICBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2Rpc3BfY2NvcnIuYyAgIHwgMjIyICsrKysrKysrKysrKysrKysrKysrCj4g
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9kcnYuaCAgICAgfCAgIDkgKwo+ICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIHwgIDk1ICstLS0tLS0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyAgICAgIHwgICA4ICst
Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5oICAgICAgfCAgIDEgKwo+
ICA2IGZpbGVzIGNoYW5nZWQsIDI0MiBpbnNlcnRpb25zKCspLCA5NiBkZWxldGlvbnMoLSkKPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9jY29y
ci5jCj4KCltzbmlwXQoKPiArCj4gK3ZvaWQgbXRrX2Njb3JyX2NvbmZpZyhzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHVuc2lnbmVkIGludCB3LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgaW50IGgsIHVuc2lnbmVkIGludCB2cmVmcmVzaCwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGludCBicGMsIHN0cnVjdCBjbWRxX3BrdCAqY21kcV9wa3QpCj4g
K3sKPiArICAgICAgIHN0cnVjdCBtdGtfZGlzcF9jY29yciAqY2NvcnIgPSBkZXZfZ2V0X2RydmRh
dGEoZGV2KTsKPiArCj4gKyAgICAgICBtdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCB3IDw8IDE2IHwg
aCwgJmNjb3JyLT5jbWRxX3JlZywgY2NvcnItPnJlZ3MsCj4gKyAgICAgICAgICAgICAgICAgICAg
IERJU1BfQ0NPUlJfU0laRSk7CgpZb3UgY2hhbmdlIHcsIGggcG9zaXRpb24gaGVyZS4gU2VwYXJh
dGUgdGhpcyBtb2RpZmljYXRpb24gdG8gYW5vdGhlciBwYXRjaC4KCj4gKyAgICAgICBtdGtfZGRw
X3dyaXRlKGNtZHFfcGt0LCBDQ09SUl9FTkdJTkVfRU4sICZjY29yci0+Y21kcV9yZWcsIGNjb3Jy
LT5yZWdzLAo+ICsgICAgICAgICAgICAgICAgICAgICBESVNQX0NDT1JSX0NGRyk7Cj4gK30KPiAr
Cgpbc25pcF0KCj4gLXN0YXRpYyB2b2lkIG10a19jY29ycl9jb25maWcoc3RydWN0IGRldmljZSAq
ZGV2LCB1bnNpZ25lZCBpbnQgdywKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGludCBoLCB1bnNpZ25lZCBpbnQgdnJlZnJlc2gsCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBpbnQgYnBjLCBzdHJ1Y3QgY21kcV9wa3QgKmNtZHFfcGt0KQo+IC17
Cj4gLSAgICAgICBzdHJ1Y3QgbXRrX2RkcF9jb21wX2RldiAqcHJpdiA9IGRldl9nZXRfZHJ2ZGF0
YShkZXYpOwo+IC0KPiAtICAgICAgIG10a19kZHBfd3JpdGUoY21kcV9wa3QsIGggPDwgMTYgfCB3
LCAmcHJpdi0+Y21kcV9yZWcsIHByaXYtPnJlZ3MsIERJU1BfQ0NPUlJfU0laRSk7Cj4gLSAgICAg
ICBtdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCBDQ09SUl9FTkdJTkVfRU4sICZwcml2LT5jbWRxX3Jl
ZywgcHJpdi0+cmVncywgRElTUF9DQ09SUl9DRkcpOwo+IC19Cj4gLQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
