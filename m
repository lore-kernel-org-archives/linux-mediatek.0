Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358B0C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 07:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wnODhUsvYXeRUAom351EjrSv+bSNg1k6qF2w5MGDvcY=; b=Fo1uUPHdYLPho+
	eb3h3vKtdYDCYCbuj4bCKBB7pQonAxIkPAlyHFdcoEGHHTdoLGSHp8PR19enjiD4JH/O02ZPHS1Cs
	RivkMKUGPH31KZYRpJQydeHINw0Tp/shrHsfwWNFml0i3ORn3z7NTmxOi8xsOUBBkuWHz1utpbs/W
	jf3v8FGUtbGDQEbG2fDgqmTDEX530GPBfa4bS461V+oJqUmzLzuyKOTMOa2mQm3bfos0SwFORm5gh
	SWReEBs+vMu96CMwlnW65BUJfJN8+1PRhtaNXSzhCzH4+OS4yDcWPZh4pHUUrOGqCRb4VaQhe31ho
	v+WRjgeshFVIlUkAZgVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0eMP-001wK8-7x; Mon, 13 Jun 2022 07:19:41 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0eMM-001wJ3-G5; Mon, 13 Jun 2022 07:19:39 +0000
Received: by mail-qk1-x72a.google.com with SMTP id b142so3449820qkg.2;
        Mon, 13 Jun 2022 00:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=GB+StqyTCKj2HdFboJFVKMCJDxe3eEc2lGFDv1Opjlc=;
        b=X68PW8XVsxQon0pHG8Sz5eBs3OS4NqSoIFXXe/2G6Nvk/Ompk2l/aeSLop0xsWcJ5E
         r+imyj6yRhl2ZBY5gXu6epRIquTOxi5XRXkt8chNvQ9i2e6cKF0ixckJovb4CewVtw3a
         u7m+l85fbDcOwBkr5wl8/iEJyWb9SDi2BND4tt8QxC/8hYJ+QSWoTwQJlI3MpdiaP0TW
         6yNqcyKDvDSBqqDXyxsrnQmuDJ/Wm3MGqXQnOht4OpdpbeKyiQUmXcJUjIazEsf3nvgc
         erjP+lgqHr0T63epVk4DXJ3R/zBrJtNJPJZug+u1Hzggan083EJkQVJsbMGQXRTKtTRs
         dKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=GB+StqyTCKj2HdFboJFVKMCJDxe3eEc2lGFDv1Opjlc=;
        b=lPsar95a4DpeMUTU/4b8FqNa5QR04XGSwfmADmch/RKM8mtmmIFDN8vsn4UMiOClKy
         mkNTF6cDGNfP/+bBf0RWXjQuzN2YR9YZdrjbr7wc/d4QTTf4g8jM4n1pXY+4doUl9014
         OujaXT7QF/HrKrfRo+1BBP17HKNQoe6o9QtzP+Bhnec9sBQyzvTtlbm6cJVZz0ZAifbw
         typSSdClQuZzd7ks01FeSpAqvuWDBGjIEnsu4+5CgiZKvboNdT4MW+QIyEVFnKxkS2VQ
         cVrxcJGGDcXcX9SHIXgM86oBwE7Gqg8iNSsL+k1mjVZuaGxAgHi3FnPljozXGsZjZcrE
         L2bg==
X-Gm-Message-State: AOAM531RU/kGmxi8ht2EZ4M27Qu3VKuQtUkO+ytSZQbd8Z280J4a0OlJ
	mvQXLgeqm7kaTH7W10KD62s=
X-Google-Smtp-Source: ABdhPJzkwQ8Lh4v8HmiyNYZX3CyfRLZco1LI0RmoLkuXuUs3JtU60bnSz/zcTWm7wmCt5lo+xJyqEQ==
X-Received: by 2002:a37:4454:0:b0:69f:c339:e2dc with SMTP id r81-20020a374454000000b0069fc339e2dcmr36709053qka.771.1655104776463;
        Mon, 13 Jun 2022 00:19:36 -0700 (PDT)
Received: from p200300f6ef062c0090c03b551078f99d.dip0.t-ipconnect.de (p200300f6ef062c0090c03b551078f99d.dip0.t-ipconnect.de. [2003:f6:ef06:2c00:90c0:3b55:1078:f99d])
        by smtp.gmail.com with ESMTPSA id f8-20020a05620a408800b006a77e6df09asm4182070qko.24.2022.06.13.00.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 00:19:35 -0700 (PDT)
Message-ID: <5e81f73b996de80445c2e905c44ebb18c63a739b.camel@gmail.com>
Subject: Re: [PATCH 20/34] iio: inkern: only relase the device node when
 done with it
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>, dl-linux-imx <linux-imx@nxp.com>, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>, "open list:BROADCOM NVRAM DRIVER"
 <linux-mips@vger.kernel.org>, linux-arm Mailing List
 <linux-arm-kernel@lists.infradead.org>, chrome-platform@lists.linux.dev,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm
 <linux-arm-msm@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cai Huoqing
 <cai.huoqing@linux.dev>, Benjamin Fair <benjaminfair@google.com>, Jishnu
 Prakash <quic_jprakash@quicinc.com>, Linus Walleij
 <linus.walleij@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Amit Kucheria <amitk@kernel.org>,
 Andy Gross <agross@kernel.org>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Haibo Chen <haibo.chen@nxp.com>, Benson
 Leung <bleung@chromium.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,  Christophe Branchereau
 <cbranchereau@gmail.com>, Patrick Venture <venture@google.com>, Arnd
 Bergmann <arnd@arndb.de>, Nancy Yuen <yuenn@google.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Gwendal Grignou <gwendal@chromium.org>, Saravanan Sekar
 <sravanhome@gmail.com>, Tali Perry <tali.perry1@gmail.com>,  Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Thara Gopinath <thara.gopinath@linaro.org>, Avi Fishman
 <avifishman70@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Claudiu
 Beznea <claudiu.beznea@microchip.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tomer Maimon
 <tmaimon77@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,  Zhang Rui
 <rui.zhang@intel.com>, Shawn Guo <shawnguo@kernel.org>, Guenter Roeck
 <groeck@chromium.org>,  Fabio Estevam <festevam@gmail.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Eugen Hristev <eugen.hristev@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,  Mark Brown <broonie@kernel.org>
Date: Mon, 13 Jun 2022 09:20:26 +0200
In-Reply-To: <20220611155902.2a5a7738@jic23-huawei>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	 <20220610084545.547700-21-nuno.sa@analog.com>
	 <CAHp75VcdwjTYDF2c-StsL7-pLKtV3vGxinX8+1nJydqB_WNXiA@mail.gmail.com>
	 <ef73aa5801ae1c8078e6a930f22feb6214038176.camel@gmail.com>
	 <20220611155902.2a5a7738@jic23-huawei>
User-Agent: Evolution 3.44.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_001938_611769_FAC8528D 
X-CRM114-Status: GOOD (  43.38  )
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

T24gU2F0LCAyMDIyLTA2LTExIGF0IDE1OjU5ICswMTAwLCBKb25hdGhhbiBDYW1lcm9uIHdyb3Rl
Ogo+IAo+ICtDYyBNYXJrIEJyb3duIGZvciBhIHF1ZXJ5IG9uIG9yZGVyaW5nIGluIGRldmljZSB0
cmVlIGJhc2VkIFNQSQo+IHNldHVwLgo+IAo+IE9uIEZyaSwgMTAgSnVuIDIwMjIgMjI6MDg6NDEg
KzAyMDAKPiBOdW5vIFPDoSA8bm9uYW1lLm51bm9AZ21haWwuY29tPiB3cm90ZToKPiAKPiA+IE9u
IEZyaSwgMjAyMi0wNi0xMCBhdCAxNjo1NiArMDIwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+
ID4gPiBPbiBGcmksIEp1biAxMCwgMjAyMiBhdCAxMDo0OCBBTSBOdW5vIFPDoSA8bnVuby5zYUBh
bmFsb2cuY29tPgo+ID4gPiB3cm90ZTrCoCAKPiA+ID4gPiAKPiA+ID4gPiAnb2Zfbm9kZV9wdXQo
KScgY2FuIHBvdGVudGlhbGx5IHJlbGVhc2UgdGhlIG1lbW9yeSBwb2ludGVkIHRvCj4gPiA+ID4g
YnkKPiA+ID4gPiAnaWlvc3BlYy5ucCcgd2hpY2ggd291bGQgbGVhdmUgdXMgd2l0aCBhbiBpbnZh
bGlkIHBvaW50ZXIgKGFuZAo+ID4gPiA+IHdlCj4gPiA+ID4gd291bGQKPiA+ID4gPiBzdGlsbCBw
YXNzIGl0IGluICdvZl94bGF0ZSgpJykuIEFzIHN1Y2gsIHdlIGNhbiBvbmx5IHJlbGVhc2UKPiA+
ID4gPiB0aGUKPiA+ID4gPiBub2RlCj4gPiA+ID4gYWZ0ZXIgd2UgYXJlIGRvbmUgd2l0aCBpdC7C
oCAKPiA+ID4gCj4gPiA+IFRoZSBxdWVzdGlvbiB5b3Ugc2hvdWxkIGFuc3dlciBpbiB0aGUgY29t
bWl0IG1lc3NhZ2UgaXMgdGhlCj4gPiA+IGZvbGxvd2luZzoKPiA+ID4gIkNhbiBhbiBPRiBub2Rl
LCBhdHRhY2hlZCB0byBhIHN0cnVjdCBkZXZpY2UsIGJlIGdvbmUgYmVmb3JlIHRoZQo+ID4gPiBk
ZXZpY2UgaXRzZWxmPyIgSWYgaXQgc28sIHRoZW4gcGF0Y2ggaXMgZ29vZCwgb3RoZXJ3aXNlIHRo
ZXJlIGlzCj4gPiA+IG5vCj4gPiA+IHBvaW50IGluIHRoaXMgcGF0Y2ggaW4gdGhlIGZpcnN0IHBs
YWNlLgo+ID4gPiDCoCAKPiA+IAo+ID4gWWVhaCwgSSBtaWdodCBiZSB3cm9uZyBidXQgZnJvbSBh
IHF1aWNrIGxvb2suLi4geWVzLCBJIHRoaW5rIHRoZQo+ID4gbm9kZQo+ID4gY2FuIGJlIGdvbmUg
YmVmb3JlIHRoZSBkZXZpY2UuIFRha2UgYSBsb29rIG9uIHRoZSBzcGkgb3IgaTJjCj4gPiBvZl9u
b3RpZnkKPiA+IGhhbmRsaW5nIGFuZCB5b3UgY2FuIHNlZSB0aGF0IHRoZSBub2RlcyBhcmUgZ2V0
L3B1dCBvbiB0aGUKPiA+IGFkZC9yZW1vdmUKPiA+IG5vdGlmY2F0aW9uLiBNZWFuaW5nIHRoYXQg
dGhlIG5vZGUgbGlmZXNwYW4gaXMgbm90IHJlYWxseSBhdHRhY2hlZAo+ID4gdG8KPiA+IHRoZSBk
ZXZpY2UgbGlmZXNwYW4uIElmIGl0IHdhcywgSSB3b3VsZCBleHBlY3QgdG8gc2VlIG9mX25vZGVf
cHV0KCkKPiA+IG9uCj4gPiB0aGUgZGV2aWNlIHJlbGVhc2UoKSBmdW5jdGlvbi4uLgo+IAo+IEkg
aGFkIGEgbG9vayBhdCBzcGlfb2Zfbm90aWZ5KCkgYW5kIGluZGVlZCB2aWEKPiBzcGlfdW5yZWdp
c3Rlcl9kZXZpY2UoKQo+IHRoZSBub2RlIGlzIHB1dCBqdXN0IGJlZm9yZSBkZXZpY2VfZGVsKCkg
c28gSSBhZ3JlZSB0aGF0IGF0IGZpcnN0Cj4gZ2xhbmNlCj4gaXQgc2VlbXMgbGlrZSB0aGVyZSBt
YXkgYmUgYSByYWNlIHRoZXJlIGFnYWluc3QgdGhlIHVzZWFnZSBoZXJlLgo+IE1hcmsgKCtDQykg
b3V0IG9mIGludGVyZXN0IHdoeSBhcmUgdGhlIG5vZGUgZ2V0cyBiZWZvcmUgdGhlCj4gZGV2aWNl
X2FkZCgpCj4gaW4gc3BpX2FkZF9kZXZpY2UoKSBjYWxsZWQgZnJvbSBvZl9yZWdpc3Rlcl9zcGlf
ZGV2aWNlKCkgYnV0IHRoZQo+IG1hdGNoaW5nCj4gbm9kZSBwdXRzIGJlZm9yZSB0aGUgZGV2aWNl
X2RlbCgpIGluIHNwaV91bnJlZ2lzdGVyX2RldmljZSgpPwo+IFNlZW1zIGxpa2UgaW5jb25zaXN0
ZW50IG9yZGVyaW5nLi4uCj4gCj4gV2hpY2ggaXMgbm90IHRvIHNheSB3ZSBzaG91bGRuJ3QgZml4
IHRoZSBJSU8gdXNhZ2UgYXMgdGhpcyBwYXRjaAo+IGRvZXMhCj4gCgpKdXN0IHRvIGFkZCBzb21l
dGhpbmcgdGhhdCBjYW1lIHRvIG15IGF0dGVudGlvbi4gSW4gdGhlIElJTyBjYXNlLCBpdApkb2Vz
IG5vdCBldmVuIG1hdHRlciBpZiB0aGUgcGFyZW50IGRldmljZSBoYXMgdGhlIE9GIG5vZGUgbGlm
ZXRpbWUKImxpbmtlZCIgdG8gaXQgKGFzIGl0IGFjdHVhbGx5IGhhcHBlbnMgZm9yIHBsYXRmb3Jt
IGRldmljZXMpLiBUaGUKcmVhc29uIGlzIHRoYXQgaWlvX2RldiBvbmx5IGhhcyBhIHdlYWsgcmVm
ZXJlbmNlIHRvIGl0J3MgcGFyZW50IGFuZCAoSQp0aGluaykgdGhlIHBhcmVudCBjYW4gYWN0dWFs
bHkgZ28gYXdheSB3aGlsZSB0aGUgaWlvX2RldiBpcyBzdGlsbAphcm91bmQgKGVnOiBzb21lb25l
IGhhcyBhbiBvcGVuIGZkIHRvIHRoZSBpaW9fZGV2IGNkZXYpLgoKPiA+IAo+ID4gQWdhaW4sIEkg
bWlnaHQgYmUgd3JvbmcgYW5kIEkgYWRtaXQgSSB3YXMgbm90IHN1cmUgYWJvdXQgaW5jbHVkaW5n
Cj4gPiB0aGlzCj4gPiBwYXRjaCBiZWNhdXNlIGl0J3MgYSB2ZXJ5IHVubGlrZWx5IHNjZW5hcmlv
IGV2ZW4gdGhvdWdoIEkgdGhpbmssIGluCj4gPiB0aGVvcnksIGEgcG9zc2libGUgb25lLgo+IAo+
IFRoZSBwYXRjaCBpcyBjdXJyZW50bHkgdmFsaWQgZXZlbiBpZiBpdCdzIG5vdCBhICdyZWFsJyBi
dWcuCj4gR2l2ZW4gd2UgYXJlIGRvaW5nIGEgcHV0IG9uIHRoYXQgZGV2aWNlX25vZGUsIGl0IG1h
a2VzIHNlbnNlIGZvciB0aGF0Cj4gdG8gb2NjdXIgYWZ0ZXIgdGhlIGxvY2FsIHVzZSBoYXMgZmlu
aXNoZWQgLSB3ZSBzaG91bGRuJ3QgYmUgcmVseWluZwo+IG9uCj4gd2hhdCBoYXBwZW5zIHRvIGJl
IHRoZSBjYXNlIGZvciBsaWZldGltZXMgdG9kYXkuCj4gCj4gTm93LCBJIGRpZCB3b25kZXIgaWYg
YW55IGRyaXZlcnMgYWN0dWFsbHkgdXNlIGl0IGluIHRoZWlyIHhsYXRlCj4gY2FsbGJhY2tzLgo+
IE9uZSBkb2VzIGZvciBhbiBlcnJvciBwcmludCwgc28gdGhpcyBpcyBwb3RlbnRpYWxseSByZWFs
IChpZiB2ZXJ5Cj4gdW5saWtlbHkhKQo+IAo+IFRoaXMgaXNuJ3QgYSAnZml4JyBJJ2QgZXhwZWN0
IHRvIHJ1c2ggaW4sIG9yIG5lY2Vzc2FyaWx5IGJhY2twb3J0IHRvCj4gc3RhYmxlCj4gYnV0IEkg
dGhpbmsgaXQncyBhIHZhbGlkIGZpeC4KPiAKClNob3VsZCBJIGRyb3AgdGhlIGZpeGVzIHRhZz8K
Ci0gTnVubyBTw6EKCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
