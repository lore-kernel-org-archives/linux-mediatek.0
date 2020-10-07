Return-Path: <SRS0=2/VK=DO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B54B8C4363D
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 00:01:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4911C20739
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 00:01:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j8Z9c/6U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XtCOKVAp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4911C20739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0V/HY0coGj3ih231htwo/2nz5Nhr9TMa3LHEoXS8bwY=; b=j8Z9c/6Up34NOXT3FYLycpVG6
	SU5o/UueeDuBNaWqeTcbWNdgjaakuBraPWc+PaArsx7DliIxJcuoYopE8OKczBScalUZASJ59b/ph
	z4atJ6cCk6+v4JCnlUmUxUj5CEePY6Kp1XUaBe9NpBhezisv9+Y5LDI4l7eUXRrcxvOXEvy2GryCN
	VeAoHuSbzkgcOdwt4ZPR2hZNqnxoJVrZ150xbLMYHXqkHerADMEUt0k69yhkvquCDrZ5kxICxn/dX
	HEEvy7VLBeOg3dnYg/z1ut7Esjmz534p3vkRm1llMROqVRKUN5Lu8ZTNJlb/CecgmGag5W8+n2Mrc
	MZfeN9LUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPwtm-00010o-PN; Wed, 07 Oct 2020 00:01:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPwth-0000yj-1m; Wed, 07 Oct 2020 00:01:34 +0000
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CC1F021481;
 Wed,  7 Oct 2020 00:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602028892;
 bh=PIWMjyDxBBSKAjQ4wNtgwzJMwZRsueuvW+uTVHej3+Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XtCOKVAp4yXop17hJL2J3mI3nJFRfiXSVOY7vStDF+BGEWpKjG7+RDlb9CvEh4OjB
 /Ylg+7o8bGbd9FAdsNYgQBwst/5299n15U2uP5qX4pF/aZ39Ow1QImGfU5Jc0Bx2Go
 Op5GdYxFS0yh+yFAD6gHRxK0rdxWeSY/UZZejhqk=
Received: by mail-ej1-f47.google.com with SMTP id h24so363507ejg.9;
 Tue, 06 Oct 2020 17:01:31 -0700 (PDT)
X-Gm-Message-State: AOAM533uPD1U5m9y5sV2i8QuK5K2SGQy35NJ2vrA6CaHegWiFdscAiD2
 Od1UUZGT6oya9/r8Lp6oQJbtQHZ8mU98aKBYIQ==
X-Google-Smtp-Source: ABdhPJygN2AGMadvZ+V3mIFRzJGcI6JjBWXhECF41h8ERzSX9aHm2qUBFiQQdA6s/6/3bR9g83pZYE96kuyZLTrnuwg=
X-Received: by 2002:a17:906:9511:: with SMTP id
 u17mr566662ejx.194.1602028890413; 
 Tue, 06 Oct 2020 17:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <20201006193320.405529-1-enric.balletbo@collabora.com>
 <20201006193320.405529-3-enric.balletbo@collabora.com>
 <CAAOTY__NVjKW-WXekeZSb4RRR4G01LQrPN+m_g0EQJ9hLviN8g@mail.gmail.com>
In-Reply-To: <CAAOTY__NVjKW-WXekeZSb4RRR4G01LQrPN+m_g0EQJ9hLviN8g@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 7 Oct 2020 08:01:19 +0800
X-Gmail-Original-Message-ID: <CAAOTY__0i+WEnd1YYr7phOL+M-gxxjEpg7AcZaxFUtttqnNYYA@mail.gmail.com>
Message-ID: <CAAOTY__0i+WEnd1YYr7phOL+M-gxxjEpg7AcZaxFUtttqnNYYA@mail.gmail.com>
Subject: Re: [PATCH 2/4] soc: mediatek: mmsys: Use
 devm_platform_ioremap_resource()
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_200134_181794_9C888E94 
X-CRM114-Status: GOOD (  18.21  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAyMDIw5bm0MTDmnIg3
5pelIOmAseS4iSDkuIrljYg3OjIx5a+r6YGT77yaCj4KPiBFbnJpYyBCYWxsZXRibyBpIFNlcnJh
IDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPiDmlrwgMjAyMOW5tDEw5pyIN+aXpSDpgLHk
uIkg5LiK5Y2IMzozM+Wvq+mBk++8mgo+ID4KPiA+IEZvciB0aGUgY29tbW9uIHBsYXRmb3JtX2dl
dF9yZXNvdXJjZSgpK2Rldm1fcGxhdGZvcm1faW9yZW1hcCgpIGNvbWJpbmF0aW9uLAo+ID4gdGhl
cmUgaXMgYSBoZWxwZXIsIHNvIHVzZSBpdCBhbmQgbWFrZSB0aGUgY29kZSBhIGJpdCBtb3JlIGNv
bXBhY3QuCj4KPiBSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QG1lZGlh
dGVrLmNvbT4KPgoKU29ycnkgZm9yIHR5cG8sCgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8
Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEVucmljIEJh
bGxldGJvIGkgU2VycmEgPGVucmljLmJhbGxldGJvQGNvbGxhYm9yYS5jb20+Cj4gPiAtLS0KPiA+
Cj4gPiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMgfCA3ICsrLS0tLS0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYyBiL2RyaXZlcnMvc29j
L21lZGlhdGVrL210ay1tbXN5cy5jCj4gPiBpbmRleCAzNmFkNjZiYjIyMWIuLjE4ZjkzOTc5ZTE0
YSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jCj4gPiAr
KysgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYwo+ID4gQEAgLTMwNiwxNSArMzA2
LDEyIEBAIHN0YXRpYyBpbnQgbXRrX21tc3lzX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCj4gPiAgICAgICAgIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmNsa3M7Cj4gPiAgICAg
ICAgIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRybTsKPiA+ICAgICAgICAgdm9pZCBfX2lvbWVt
ICpjb25maWdfcmVnczsKPiA+IC0gICAgICAgc3RydWN0IHJlc291cmNlICptZW07Cj4gPiAgICAg
ICAgIGludCByZXQ7Cj4gPgo+ID4gLSAgICAgICBtZW0gPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2Uo
cGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOwo+ID4gLSAgICAgICBjb25maWdfcmVncyA9IGRldm1f
aW9yZW1hcF9yZXNvdXJjZShkZXYsIG1lbSk7Cj4gPiArICAgICAgIGNvbmZpZ19yZWdzID0gZGV2
bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOwo+ID4gICAgICAgICBpZiAoSVNf
RVJSKGNvbmZpZ19yZWdzKSkgewo+ID4gICAgICAgICAgICAgICAgIHJldCA9IFBUUl9FUlIoY29u
ZmlnX3JlZ3MpOwo+ID4gLSAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGlv
cmVtYXAgbW1zeXMtY29uZmlnIHJlc291cmNlOiAlZFxuIiwKPiA+IC0gICAgICAgICAgICAgICAg
ICAgICAgIHJldCk7Cj4gPiArICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJGYWlsZWQgdG8g
aW9yZW1hcCBtbXN5cyByZWdpc3RlcnM6ICVkXG4iLCByZXQpOwo+ID4gICAgICAgICAgICAgICAg
IHJldHVybiByZXQ7Cj4gPiAgICAgICAgIH0KPiA+Cj4gPiAtLQo+ID4gMi4yOC4wCj4gPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
