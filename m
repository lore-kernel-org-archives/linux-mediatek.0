Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B9BC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 23:32:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43EF4206B2
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 23:32:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RWFGiFiD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mdr2RIaV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43EF4206B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BhHSBX3Y2klOaRA3TPK74IpwmMqC3FYvybpfnDY5MS0=; b=RWFGiFiDN8Oc91L2YjPb/Bo+m
	PlMy+nWv7yr3pTXI83v4QME2i9RoSwDu4tRB/TQEPWcEZ8LtNMLqMoG5rmNuIEZomyIlA8hyEODU0
	0MW2YoNt2Ba2I8XxLpDMShKgNbobgKx9su3PEC9jNzxiZkXCnYg9BmGsjYTc2Cj9Nwc8XdfUlfbl2
	LSNVm0vSCnAZxeymEoflHhFkG3ksAn8h+dVU8+xX8ryTmffJa0yohKMNwW9Oq4tei6ATQdxsQ4fTD
	Qm1mTZNgKoooYr34G2Bm//i6LkvHBsQWkkoYfPadK1Jwv85Y02bt41IMbulpmBzaG9uF5hefnCxy7
	ljD9CuJfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcGdw-0006tO-6V; Mon, 09 Nov 2020 23:32:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcGdu-0006t0-AC
 for linux-mediatek@lists.infradead.org; Mon, 09 Nov 2020 23:32:11 +0000
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B994920789
 for <linux-mediatek@lists.infradead.org>; Mon,  9 Nov 2020 23:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604964728;
 bh=qEITAPMHJ7RcpcZ6fFQRVmfMg/2dltGWGmZBxVMFc4s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mdr2RIaVsFL5h20iTYlVWUcsRG2pEZ7we8XV+SZcKUJBfEXE/Blkf5uWZeB0Dq7fz
 1ssHFSzReWAaVh2tZTb5Cmk03lRCF+P+/tbGsgJCyE1foECPljXAuBYZhOeC0Ra6PL
 pb5U976e3nFnR1mysNV1QwYZoXoAS20zv+M84Bo8=
Received: by mail-ej1-f49.google.com with SMTP id o21so14813810ejb.3
 for <linux-mediatek@lists.infradead.org>; Mon, 09 Nov 2020 15:32:07 -0800 (PST)
X-Gm-Message-State: AOAM533F/0h8HtHRYnJAj/H5hHsNExjEAd0CYJU4QgGywrG6KTdX50IR
 +BA58ao2jb+LNJ2oLys+pl4ELudILEgQQVlQlw==
X-Google-Smtp-Source: ABdhPJziewFX90NL28wieZNoMnJARdYMTBTgOKpCDGql+LFfX3AEL+OAko+xKqH/oxUVC1M88npS/jxmi6rc6MXUhDE=
X-Received: by 2002:a17:906:5a96:: with SMTP id
 l22mr17259608ejq.303.1604964726295; 
 Mon, 09 Nov 2020 15:32:06 -0800 (PST)
MIME-Version: 1.0
References: <20201029152702.533-1-chunkuang.hu@kernel.org>
In-Reply-To: <20201029152702.533-1-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 10 Nov 2020 07:31:55 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-8hs2oMNZStNyyD0VmCfOnHTdeZ75L8+BTx6gMwQZOWQ@mail.gmail.com>
Message-ID: <CAAOTY_-8hs2oMNZStNyyD0VmCfOnHTdeZ75L8+BTx6gMwQZOWQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Move Mediatek MIPI DSI PHY driver from DRM folder to
 PHY folder
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_183210_492689_A3B66803 
X-CRM114-Status: GOOD (  14.15  )
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

Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAyMDIw5bm0MTDmnIgy
OeaXpSDpgLHlm5sg5LiL5Y2IMTE6Mjflr6vpgZPvvJoKPgo+IG10a19taXBpX2RzaV9waHkgaXMg
Y3VycmVudGx5IHBsYWNlZCBpbnNpZGUgbWVkaWF0ZWsgZHJtIGRyaXZlciwgYnV0IGl0J3MKPiBt
b3JlIHN1aXRhYmxlIHRvIHBsYWNlIGEgcGh5IGRyaXZlciBpbnRvIHBoeSBkcml2ZXIgZm9sZGVy
LCBzbyBtb3ZlCj4gbXRrX21pcGlfZHNpX3BoeSBkcml2ZXIgaW50byBwaHkgZHJpdmVyIGZvbGRl
ci4KCkFwcGxpZWQgdGhlIHdob2xlIHNlcmllcyBpbnRvIG1lZGlhdGVrLWRybS1uZXh0IFsxXS4K
ClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVu
a3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVnYXJkcywKQ2h1
bi1LdWFuZy4KCj4KPiBDaHVuLUt1YW5nIEh1ICgzKToKPiAgIGRybS9tZWRpYXRlazogU2VwYXJh
dGUgbXRrX21pcGlfdHggdG8gYW4gaW5kZXBlbmRlbnQgbW9kdWxlCj4gICBwaHk6IG1lZGlhdGVr
OiBNb3ZlIG10a19taXBpX2RzaV9waHkgZHJpdmVyIGludG8gZHJpdmVycy9waHkvbWVkaWF0ZWsK
PiAgICAgZm9sZGVyCj4gICBNQUlOVEFJTkVSUzogYWRkIGZpbGVzIGZvciBNZWRpYXRlayBEUk0g
ZHJpdmVycwo+Cj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAxICsKPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMyAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgICAgICAgICAgICAgICAgICAgICB8IDEgLQo+
ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuaCAgICAgICAgICAgICAgICAg
ICAgIHwgMSAtCj4gIGRyaXZlcnMvcGh5L21lZGlhdGVrL0tjb25maWcgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCA3ICsrKysrKysKPiAgZHJpdmVycy9waHkvbWVkaWF0ZWsvTWFrZWZp
bGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDUgKysrKysKPiAgLi4uL21lZGlhdGVr
L3BoeS1tdGstbWlwaS1kc2ktbXQ4MTczLmN9ICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAg
Li4uL21lZGlhdGVrL3BoeS1tdGstbWlwaS1kc2ktbXQ4MTgzLmN9ICAgICAgICAgICAgICAgICAg
ICB8IDIgKy0KPiAgLi4uL210a19taXBpX3R4LmMgPT4gcGh5L21lZGlhdGVrL3BoeS1tdGstbWlw
aS1kc2kuY30gICAgICB8IDUgKysrKy0KPiAgLi4uL210a19taXBpX3R4LmggPT4gcGh5L21lZGlh
dGVrL3BoeS1tdGstbWlwaS1kc2kuaH0gICAgICB8IDAKPiAgMTEgZmlsZXMgY2hhbmdlZCwgMjAg
aW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiAgcmVuYW1lIGRyaXZlcnMve2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX210ODE3M19taXBpX3R4LmMgPT4gcGh5L21lZGlhdGVrL3BoeS1tdGstbWlw
aS1kc2ktbXQ4MTczLmN9ICg5OSUpCj4gIHJlbmFtZSBkcml2ZXJzL3tncHUvZHJtL21lZGlhdGVr
L210a19tdDgxODNfbWlwaV90eC5jID0+IHBoeS9tZWRpYXRlay9waHktbXRrLW1pcGktZHNpLW10
ODE4My5jfSAoOTklKQo+ICByZW5hbWUgZHJpdmVycy97Z3B1L2RybS9tZWRpYXRlay9tdGtfbWlw
aV90eC5jID0+IHBoeS9tZWRpYXRlay9waHktbXRrLW1pcGktZHNpLmN9ICg5NyUpCj4gIHJlbmFt
ZSBkcml2ZXJzL3tncHUvZHJtL21lZGlhdGVrL210a19taXBpX3R4LmggPT4gcGh5L21lZGlhdGVr
L3BoeS1tdGstbWlwaS1kc2kuaH0gKDEwMCUpCj4KPiAtLQo+IDIuMTcuMQo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
