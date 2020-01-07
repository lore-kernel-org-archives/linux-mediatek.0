Return-Path: <SRS0=GJVM=24=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885F5C33C99
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2020 11:05:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5907D2081E
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2020 11:05:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dHd3R6IY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5907D2081E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tb5PtyIKp+lhclomKCQ3j6+f2M4y8hefUnNmNzVklSI=; b=dHd3R6IYkMCupL
	WEfhef4CRN7wSrzuTCSr1preLAiHrPNMohKAzRXbRQBwquSXLkFJQ5247ZqLixoNXc5npBhtXBoyg
	aheBslmJ89LCkCLM/xFcTR07Aa6pZY6+ylrFZKxqnmN/5U37fuS4l7YSJi/pz+dRFHSWhq8pjKx3m
	jgcKLBR3zLVu+xyl5FtvBaP8asRrmQt+gxzFr7zcFLCLu6CedT07d39CkJ0y7RYkNntTDEYMJ19tN
	mZ6lRxe0lkr7JoMw+RUWj6HinXUEsTyUxh/GZ8qfgo2rQ7x9hTibbFvh/cn2NebjKXM7JuZN81DCZ
	CyO3EPPQIG2Y6UiO/Gnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iomfS-00029G-RH; Tue, 07 Jan 2020 11:04:58 +0000
Received: from mail-ed1-f66.google.com ([209.85.208.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iomeb-0001k9-0u; Tue, 07 Jan 2020 11:04:27 +0000
Received: by mail-ed1-f66.google.com with SMTP id f8so6455391edv.2;
 Tue, 07 Jan 2020 03:04:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ptBtaLfSefXKIlF4+ATcVDfD9CqQtKSIYDSRdZx4Dts=;
 b=BwJVVduBH3q5Qid9RMG1kwAuBOHtUdNILi2maNtcgQ/OQjX1rDriFARyJRvLvE5Usq
 OAszbfkYwNctlu2FUMjzcODdNzi4/lFPWIuoM3Wflj0bKf1Jryp0yQY6mf6P2qTXy1uY
 CEVHMZrW8oowdBqjRY6nO8crthkphvfsxdAyLXTjgeuP5nU07pRogFbUPqgJRLs1cCfP
 AX1w1xrv1PW6tECFnzTyR2AiCNuVH66E+KUpCOy8To306eFKKRmOFtPdRlRxxRCWYpvR
 jy3ZoKNhF4mgx8bdzy6CYYZncD+AjaeEcHiXXjhUZe9VaL6tY2qjtj++jstfYZ4XBlxr
 +a6A==
X-Gm-Message-State: APjAAAXOAvR0iEtdRQgyNfMnIDG+zFYrRG0eqxYCwSZ3mDYGWREHNjRX
 f9e4ETjRi7y2MBuWLJug+88=
X-Google-Smtp-Source: APXvYqzKoAnAzDFoVmt8WsrTLEo61oVGbLtxhYn9w1G9R8M+n/U0qKkIJnksdqHSF0YmF+wOzkLZyQ==
X-Received: by 2002:a17:906:c4d:: with SMTP id
 t13mr112159727ejf.198.1578395042449; 
 Tue, 07 Jan 2020 03:04:02 -0800 (PST)
Received: from pi3 ([194.230.155.149])
 by smtp.googlemail.com with ESMTPSA id x8sm7492342eds.88.2020.01.07.03.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 03:04:01 -0800 (PST)
Date: Tue, 7 Jan 2020 12:03:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/2] pwm: Enable compile testing for some of drivers
Message-ID: <20200107110359.GA32423@pi3>
References: <20191230172113.17222-1-krzk@kernel.org>
 <20191230172113.17222-2-krzk@kernel.org>
 <20200107072645.ko247bwhh3ibdu73@pengutronix.de>
 <20200107082539.GA31827@pi3>
 <20200107104234.wq74fska3szrg4ii@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200107104234.wq74fska3szrg4ii@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_030424_657276_6201ADA7 
X-CRM114-Status: GOOD (  19.14  )
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
Cc: linux-pwm@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Thierry Reding <thierry.reding@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 kernel@pengutronix.de, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKYW4gMDcsIDIwMjAgYXQgMTE6NDI6MzRBTSArMDEwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gPiBJIGd1ZXNzIG90aGVyIHNvbHV0aW9uIHdvdWxkIGJlIHRvIGFkZCBzdHVi
cyBmb3IgZmV3IGNsayBmdW5jdGlvbnMuLi4KPiA+IAo+ID4gPiBBbHNvIEhBU19JT01FTSBpcyBh
IHR5cGljYWwgcmVxdWlyZW1lbnQsIGJ1dCBJIHRlc3RlZCB3aXRoIGFuIEFSQ0g9dW0KPiA+ID4g
Y29uZmlnICh3aGljaCBkb2VzJ3QgaGF2ZSBIQVNfSU9NRU0pIGFuZCB0aGV5IGFsbCBjb21waWxl
IGZpbmUuCj4gPiAKPiA+IEJlY2F1c2Ugb2YgIUhBU19JT01FTSwgc2luY2Ugc29tZSB0aW1lIEFS
Q0g9dW0gZG9lcyBub3Qgc3VwcG9ydAo+ID4gQ09NUElMRV9URVNULiBUaGVyZWZvcmUgSEFTX0lP
TUVNIGRlcGVuZGVuY3kgaXMgbm90IG5lZWRlZCBmb3IgY29tcGlsZQo+ID4gdGVzdGluZyAoYW5k
IGZvciByZWd1bGFyIGJ1aWxkIGl0IGlzIHNlbGVjdGVkIGJ5IEFSQ0gpLgo+IAo+IEhlaGUsIEkg
ZGlkbid0IG5vdGljZSBiZWNhdXNlIGZvciB0ZXN0aW5nIEkganVzdCBkcm9wcGVkIHRoZSAiZGVw
ZW5kcyBvbgo+IC4uLiIgbGluZXMgaW4gS2NvbmZpZyBpbnN0ZWFkIG9mIGFkZGluZyAifHwgQ09N
UElMRV9URVNUIiA6LSkgU3RpbGwgdGhleQo+IGNvbXBpbGUgZmluZSBvbiBVTUwuCj4gCj4gQWgs
IHNpbmNlIGJjMDgzYTY0YjZjMCAoImluaXQvS2NvbmZpZzogbWFrZSBDT01QSUxFX1RFU1QgZGVw
ZW5kIG9uCj4gIVVNTCIpID09IHY0LjgtcmMxfjUyXjJ+ODMgQ09NUElMRV9URVNUIGNhbm5vdCBi
ZSBlbmFibGVkIG9uIFVNTCwgYnV0Cj4gbGF0ZXIgMWJjYmZiZmRlYjAwICgidW06IGFkZCBkdW1t
eSBpb3JlbWFwIGFuZCBpb3VubWFwIGZ1bmN0aW9ucyIpCj4gPT0gdjQuMTMtcmMxfjheMn42IFVN
IGdvdCBhIGR1bW15IGltcGxlbWVudGF0aW9uLiBTbyBtYXliZSB3ZSBjb3VsZAo+IHJldmVydCBi
YzA4M2E2NGI2YzAgdG9kYXk/IChBbmQgaWYgbm90LCBhIGNvbW1lbnQgYWJvdXQgd2h5IG5lYXIg
dGhlCj4gImRlcGVuZHMgb24gIVVNTCIgaW4gaW5pdC9LY29uZmlnIHdvdWxkIGJlIGdyZWF0LikK
PiAKPiBPcnRob2dvbmFsIHRvIHRoYXQsIEkgd29uZGVyIGlmIGRlcGVuZGluZyBvbiBIQVNfSU9N
RU0gaXMgcmlnaHQgZXZlbgo+IHRob3VnaCB0aGUgY29tcGlsZSB0ZXN0ZXJzIHdvbid0IG5vdGlj
ZSBpdCBtaXNzaW5nLiBPciBzaG91bGQgSEFTX0lPTUVNCj4gYmUgZHJvcHBlZD8KCkkgdGhpbmsg
eWVzLCBpdCBjYW4gYmUgZHJvcHBlZCwgYnV0IHRoaXMgd291bGQgcmVxdWlyZToKMS4gRml4aW5n
IGFueSBkZXBlbmRlbmNpZXMgb24gSEFTX0lPTUVNLCBlLmcuOgogICAgV0FSTklORzogdW5tZXQg
ZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3RlZCBmb3IgTUZEX1NZU0NPTgogICAgICBEZXBlbmRz
IG9uIFtuXTogSEFTX0lPTUVNIFs9bl0KICAgICAgU2VsZWN0ZWQgYnkgW3ldOgogICAgICAtIFBI
WV9EQThYWF9VU0IgWz15XSAmJiAoQVJDSF9EQVZJTkNJX0RBOFhYIHx8IENPTVBJTEVfVEVTVCBb
PXldKQoKMi4gQ2hlY2tpbmcgaWYgYWxsIG9mIHN0dWJzIGFyZSBpbXBsZW1lbnRlZCAobm90IG9u
bHkgSU9NRU0gYnV0IG1heWJlCiAgIERNQSBhcyB3ZWxsKS4gQWxzbyAxYmNiZmJmZGViMDAgYnJv
dWdodCBvbmx5IGZldyBzdHVicy4gU3RpbGwgd2UKICAgbmVlZCBkZXZtX2lvcmVtYXBfcmVzb3Vy
Y2UoKSBhbmQgb3RoZXJzLgoKUXVpY2sgdGVzdCBzaG93cyBtZW50aW9uZWQgInVubWV0IGRpcmVj
dCBkZXBlbmRlbmNpZXMiIGFuZDoKICAgIHBoeS1weGEtdXNiLmM6KC50ZXh0KzB4MmY1KTogdW5k
ZWZpbmVkIHJlZmVyZW5jZSB0byBgZGV2bV9pb3JlbWFwX3Jlc291cmNlJwogICAgZG1hLWlvbW11
LmM6KC50ZXh0KzB4MTc5KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZG1hX3BncHJvdCcKCj4g
Cj4gPiA+ID4gQEAgLTMxOCw3ICszMTksNyBAQCBjb25maWcgUFdNX01FRElBVEVLCj4gPiA+ID4g
IAo+ID4gPiA+ICBjb25maWcgUFdNX01YUwo+ID4gPiA+ICAJdHJpc3RhdGUgIkZyZWVzY2FsZSBN
WFMgUFdNIHN1cHBvcnQiCj4gPiA+ID4gLQlkZXBlbmRzIG9uIEFSQ0hfTVhTICYmIE9GCj4gPiA+
ID4gKwlkZXBlbmRzIG9uIChBUkNIX01YUyAmJiBPRikgfHwgQ09NUElMRV9URVNUCj4gPiA+ID4g
IAlzZWxlY3QgU1RNUF9ERVZJQ0UKPiA+ID4gPiAgCWhlbHAKPiA+ID4gPiAgCSAgR2VuZXJpYyBQ
V00gZnJhbWV3b3JrIGRyaXZlciBmb3IgRnJlZXNjYWxlIE1YUy4KPiA+ID4gPiBAQCAtMzI4LDcg
KzMyOSw4IEBAIGNvbmZpZyBQV01fTVhTCj4gPiA+ID4gIAo+ID4gPiA+ICBjb25maWcgUFdNX09N
QVBfRE1USU1FUgo+ID4gPiA+ICAJdHJpc3RhdGUgIk9NQVAgRHVhbC1Nb2RlIFRpbWVyIFBXTSBz
dXBwb3J0Igo+ID4gPiA+IC0JZGVwZW5kcyBvbiBPRiAmJiBBUkNIX09NQVAgJiYgT01BUF9ETV9U
SU1FUgo+ID4gPiA+ICsJZGVwZW5kcyBvbiAoQVJDSF9PTUFQICYmIE9NQVBfRE1fVElNRVIpIHx8
IENPTVBJTEVfVEVTVAo+ID4gPiA+ICsJZGVwZW5kcyBvbiBPRgo+ID4gPiAKPiA+ID4gSSdtIHN1
cnByaXNlZCB0aGF0IE9GIGlzbid0IHJlcXVpcmVkIGZvciBQV01fTVhTIGJ1dCBpcyBpcyBmb3IK
PiA+ID4gUFdNX09NQVBfRE1USU1FUi4gcHdtLW14cyBjb21waWxlcyB3aXRob3V0IENPTkZJR19P
RiwgZGlkbid0IHRlc3QKPiA+ID4gcHdtLW9tYXAtZG10aW1lci4KPiA+IAo+ID4gU2luY2Ugc29t
ZSB0aW1lICFPRiBoYXMgYWxsIG5lY2Vzc2FyeSBzdHVicyBzbyBPRiBpcyBhY3R1YWxseSBuZWVk
ZWQKPiA+IG9ubHkgZm9yIGJpbmRpbmcsIG5vdCBjb21waWxpbmcuCj4gCj4gVGhhdCBkb2Vzbid0
IGV4cGxhaW4gd2h5IHlvdSBoYW5kbGUgUFdNX01YUyBhbmQgUFdNX09NQVBfRE1USU1FUgo+IGRp
ZmZlcmVudGx5IHRob3VnaC4KCllvdSdyZSByaWdodCwgSSBtaXNzZWQgdGhpcy4gTm9uZSBvZiB0
aGVtIHJlcXVpcmUgT0YgZm9yIGJ1aWxkaW5nIHNvCnNlcGFyYXRlICJkZXBlbmRzIG9uIE9GIiBt
YWtlcyBzZW5zZSBvbmx5IGZvciByZWFkYWJpbGl0eSBvZiB0aGlzLiAgTGV0Cm1lIHNlbmQgdjIg
dG8gbWFrZSBpdCBzaW1pbGFyIHRvIFBXTV9NWFMuCgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
