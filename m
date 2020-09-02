Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED019C43461
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 14:58:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEC722078E
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 14:58:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yVIeK+Ie";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vvv9VrQO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEC722078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FKWi50ErH85LQNZiPXf9aLBinZl8QVsgNs9KOGslHhs=; b=yVIeK+IezAYJ1tVf3Vnt1Abja
	jO4KUfHl1Q0d5HF06AiLviTxNFlRjd1rt5Y+Tn1o/sr0GDw+QzHaEWaRBZvjwt079HIuG5ZrG+D01
	BVPomknJcd6wslJHGRr4db3EqtKyzz+sRcDX3rluItlJgGsx8poa27my/yZr9Q36SeXOLIl75So9q
	hvOtUDx2Hvs4mnaY5/zGD6Kex+VlMQXEwMy8vPV4u0A9BobKY0UPBxSB9g2O+Yu8bPFQKFUXXTY6h
	ySn1Zf35qWeLvKez7sCCFkVa1ioy/6zhsY6lSxreLsqzAVgXwMqrfXCValx1j3mDewb4BLETNKNcR
	HXM7PswOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDUDT-0002iu-W1; Wed, 02 Sep 2020 14:58:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDUDS-0002i5-FT
 for linux-mediatek@lists.infradead.org; Wed, 02 Sep 2020 14:58:27 +0000
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 95F1D2078E
 for <linux-mediatek@lists.infradead.org>; Wed,  2 Sep 2020 14:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599058705;
 bh=gBVOTaKneMMxgCAgGNfhmmESJjJgjZ9QwPp7zryvhx8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Vvv9VrQO6bAgn8luFm9R9vLPl4jT3Er12xrknUnKuH7s0mLDQU2npW7WpfS3lp9fT
 d4sqZlLyfPThi4M21T8Mknx+giVMK0V51cautJcqGVba+1gB1kezmgapcdeaLP+crj
 1IKtYbNzd2j7sKL0PTIIGPxoHh9JGIq6q3e3rk2g=
Received: by mail-ed1-f45.google.com with SMTP id l63so5236811edl.9
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2020 07:58:25 -0700 (PDT)
X-Gm-Message-State: AOAM532HSoEBys022KFtHQ0PuPOUceuhDu6JDbjQAe1yWYDCdqyAOi0s
 AIZRE0M66W8ImWIEKjKMaxBcYqkJuX753nz/TQ==
X-Google-Smtp-Source: ABdhPJxiUKeT463CKXMbKNOTTXvuh8ChtIWwveqT19sIFc5GWW6eJtVKFAP6EJWl77VhTt3QaOUa/DVGqW+rN6PfNI0=
X-Received: by 2002:a50:ef15:: with SMTP id m21mr474435eds.300.1599058704159; 
 Wed, 02 Sep 2020 07:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200823014830.15962-1-chunkuang.hu@kernel.org>
In-Reply-To: <20200823014830.15962-1-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 2 Sep 2020 22:58:12 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9ELMBK7zPeeBQ39QjJ9g4PsOhpHXsTBHgcq=kNk8bRxA@mail.gmail.com>
Message-ID: <CAAOTY_9ELMBK7zPeeBQ39QjJ9g4PsOhpHXsTBHgcq=kNk8bRxA@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] Move Mediatek HDMI PHY driver from DRM folder to
 PHY folder
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_105826_646455_E8A187A3 
X-CRM114-Status: GOOD (  15.99  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAyMDIw5bm0OOaciDIz
5pelIOmAseaXpSDkuIrljYg5OjQ45a+r6YGT77yaCj4KPiBtdGtfaGRtaV9waHkgaXMgY3VycmVu
dGx5IHBsYWNlZCBpbnNpZGUgbWVkaWF0ZWsgZHJtIGRyaXZlciwgYnV0IGl0J3MKPiBtb3JlIHN1
aXRhYmxlIHRvIHBsYWNlIGEgcGh5IGRyaXZlciBpbnRvIHBoeSBkcml2ZXIgZm9sZGVyLCBzbyBt
b3ZlCj4gbXRrX2hkbWlfcGh5IGRyaXZlciBpbnRvIHBoeSBkcml2ZXIgZm9sZGVyLgoKRm9yIHRo
aXMgc2VyaWVzLCBhcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1uZXh0IFsxXS4KClsxXSBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGlu
dXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4K
PiBDaGFuZ2VzIGluIHY1Ogo+IC0gRml4dXAgaW5kZW50IGluIEtjb25maWcuCj4gLSBSZWZpbmUg
Y29uZmlnIGhlbHAgbWVzc2FnZS4KPiAtIFJlZmluZSBNYWtlZmlsZS4KPgo+IENoYW5nZXMgaW4g
djQ6Cj4gLSBSZWJhc2Ugb250byA1LjktcmMxCj4gLSBSZW1vdmUgbXRrX2hkbWlfY29uZl9tdDgx
NzMuCj4KPiBDaGFuZ2VzIGluIHYzOgo+IC0gTW9kaWZ5IFtQQVRDSCB2MiAzLzRdIHByZWZpeC4K
Pgo+IENoYW5nZXMgaW4gdjI6Cj4gLSBpbmNsdWRlIG1vZHVsZS5oIGluIG10a19oZG1pLmMKPgo+
IENLIEh1ICgzKToKPiAgIGRybS9tZWRpYXRlazogTW92ZSB0el9kaXNhYmxlZCBmcm9tIG10a19o
ZG1pX3BoeSB0byBtdGtfaGRtaSBkcml2ZXIKPiAgIGRybS9tZWRpYXRlazogU2VwYXJhdGUgbXRr
X2hkbWlfcGh5IHRvIGFuIGluZGVwZW5kZW50IG1vZHVsZQo+ICAgcGh5OiBtZWRpYXRlazogTW92
ZSBtdGtfaGRtaV9waHkgZHJpdmVyIGludG8gZHJpdmVycy9waHkvbWVkaWF0ZWsKPiAgICAgZm9s
ZGVyCj4KPiBDaHVuLUt1YW5nIEh1ICgxKToKPiAgIE1BSU5UQUlORVJTOiBhZGQgZmlsZXMgZm9y
IE1lZGlhdGVrIERSTSBkcml2ZXJzCj4KPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZp
ZyAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFrZWZp
bGUgICAgICAgICAgICAgfCAgNSArLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2hkbWkuYyAgICAgICAgICAgfCAyMSArKysrKysrKysrKysrKystLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfaGRtaS5oICAgICAgICAgICB8ICAxIC0KPiAgZHJpdmVycy9waHkv
bWVkaWF0ZWsvS2NvbmZpZyAgICAgICAgICAgICAgICAgIHwgIDcgKysrKysrKwo+ICBkcml2ZXJz
L3BoeS9tZWRpYXRlay9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAgNSArKysrKwo+ICAuLi4v
bWVkaWF0ZWsvcGh5LW10ay1oZG1pLW10MjcwMS5jfSAgICAgICAgICAgfCAgMyArLS0KPiAgLi4u
L21lZGlhdGVrL3BoeS1tdGstaGRtaS1tdDgxNzMuY30gICAgICAgICAgIHwgIDIgKy0KPiAgLi4u
L21lZGlhdGVrL3BoeS1tdGstaGRtaS5jfSAgICAgICAgICAgICAgICAgIHwgIDMgKystCj4gIC4u
Li9tZWRpYXRlay9waHktbXRrLWhkbWkuaH0gICAgICAgICAgICAgICAgICB8ICAyIC0tCj4gIDEx
IGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+ICByZW5h
bWUgZHJpdmVycy97Z3B1L2RybS9tZWRpYXRlay9tdGtfbXQyNzAxX2hkbWlfcGh5LmMgPT4gcGh5
L21lZGlhdGVrL3BoeS1tdGstaGRtaS1tdDI3MDEuY30gKDk5JSkKPiAgcmVuYW1lIGRyaXZlcnMv
e2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210ODE3M19oZG1pX3BoeS5jID0+IHBoeS9tZWRpYXRlay9w
aHktbXRrLWhkbWktbXQ4MTczLmN9ICg5OSUpCj4gIHJlbmFtZSBkcml2ZXJzL3tncHUvZHJtL21l
ZGlhdGVrL210a19oZG1pX3BoeS5jID0+IHBoeS9tZWRpYXRlay9waHktbXRrLWhkbWkuY30gKDk4
JSkKPiAgcmVuYW1lIGRyaXZlcnMve2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfcGh5LmggPT4g
cGh5L21lZGlhdGVrL3BoeS1tdGstaGRtaS5ofSAoOTUlKQo+Cj4gLS0KPiAyLjE3LjEKPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
