Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34403C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 20:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yoP+ngVgTfD4cmmVMZm/j4rsiGxBS/Ruvb871SZ8gDY=; b=oFTYLNNCc1Ex8O
	Q7xZwvG5rQ79ud5Geu7nJc6RTtesYqExfkXUy33bPIaDGCEIEnIcB3OGabvOmSk6sLsKF6q6ft3pE
	ngDdN1LMtjNiyuntJFjT0krff+Wl7UstYabo9/cpUmhnfANwMkk1tc9OAgSmX4+1+noYH9z/3k4zP
	Iv3bEXzZnLWU4ijsFdtsFacnSZD+ohlfXdLCpbv/8W+rftMhxgDgCc16x9WgoC+v3edOupHppXLAz
	ito9e6n6nb9D5lurfETni87fx3/gkOu2lKIAz+9rJLqIsNuy4c2lLfhYIrfse6zbuBRr6LtPNIA5t
	/yc1rptVcWdXqmHi4/Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzkwE-009eQu-Ay; Fri, 10 Jun 2022 20:08:58 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzkwA-009eO0-Rw; Fri, 10 Jun 2022 20:08:56 +0000
Received: by mail-wm1-x331.google.com with SMTP id o37-20020a05600c512500b0039c4ba4c64dso1636468wms.2;
        Fri, 10 Jun 2022 13:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=EYdxdXjqZnMfe3vNUEt1qvnu5edzLozRvBmutng2gcs=;
        b=CwmfAF6XHzbKO8jEH1gk+bM/1vpPQGL/FBas2sxdEfvaPOWCrmy31A4DGlV+qRbNLh
         EhE7R/0Apge67rflwIqv8xb8iI3MVz4tH/cjgvlR0njUgo8D/mQ1I7jC3EKVSvYMwwcI
         sbxI1wxllvZ09BnK2w2SbAc5pxLTidgyMANYo96BcCZ/obK1SZsjQnLrn4I8/dPp07XC
         G1yQR1Yy0wNiRGatiMcWPC3BBg8FGpQTCb/lIQdyvipx939yxhZ6fvPdX3cj8ChHvy5k
         k6USF7TyLBfpolWfhPNfaJpv5ZIkxehFF9XkoRvK3oVX5QPgU1PKY2VQfWO+6rp3rB/o
         VRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=EYdxdXjqZnMfe3vNUEt1qvnu5edzLozRvBmutng2gcs=;
        b=rRnM06PkQ2zNIJQJPA7bvPvqgv96aZNfActj/IjJT59yUFGKG/W2RiNhP/te0DdN1F
         ZARASOaeQa7IQO//5F3Qk+VWcYy3sQ493/K3/RwjVqHHZ2P1fTEJHcbUES7yP17RzwFB
         MUKtUekx0UU+O+hv/W6eeo9rF5+ul4wqaOOKXt61P+93yOYtKN6naEAWj6rJijWUzxf0
         EzYySf/PoCBO0B0iU4H1CIL7zWqvqG9vsDGkaycxXO2Y/kGkaYucS7OTrTYhemkPcBPn
         MVTJGt21Rw5EfPJVjX97Bx0y75chj1rlKLkIOVBsuJsIZxbDBb23AjBLRg0a8TKxlHhh
         2MFQ==
X-Gm-Message-State: AOAM5304UQsT5d97x6jtZHOhOG2KvGmovHuSieJNbNeX6lrFe2cD2hv+
	oVvt+60+6q0AHIRf1Z2n5pLWyvamMWnXHkQ9
X-Google-Smtp-Source: ABdhPJzFMI/kZj6Y7ZsIIRkgwHejQ91g4pjv9UVjVQoEdMHpUhK/4CORgOZeBhdrhfbjPGUylvA40Q==
X-Received: by 2002:a1c:f704:0:b0:39c:6684:b375 with SMTP id v4-20020a1cf704000000b0039c6684b375mr1346597wmh.66.1654891724476;
        Fri, 10 Jun 2022 13:08:44 -0700 (PDT)
Received: from ?IPv6:2001:a61:136e:3c01:8bd4:cf6f:76f1:a861? ([2001:a61:136e:3c01:8bd4:cf6f:76f1:a861])
        by smtp.gmail.com with ESMTPSA id e10-20020a5d4e8a000000b00210320d9fbfsm436482wru.18.2022.06.10.13.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 13:08:44 -0700 (PDT)
Message-ID: <ef73aa5801ae1c8078e6a930f22feb6214038176.camel@gmail.com>
Subject: Re: [PATCH 20/34] iio: inkern: only relase the device node when
 done with it
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?=
	 <nuno.sa@analog.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, Linux-Renesas
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
 Nicolas Ferre <nicolas.ferre@microchip.com>,  Jonathan Cameron
 <jic23@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Shawn Guo
 <shawnguo@kernel.org>, Guenter Roeck <groeck@chromium.org>, Fabio Estevam
 <festevam@gmail.com>, Olivier Moysan <olivier.moysan@foss.st.com>, Eugen
 Hristev <eugen.hristev@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Date: Fri, 10 Jun 2022 22:08:41 +0200
In-Reply-To: <CAHp75VcdwjTYDF2c-StsL7-pLKtV3vGxinX8+1nJydqB_WNXiA@mail.gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	 <20220610084545.547700-21-nuno.sa@analog.com>
	 <CAHp75VcdwjTYDF2c-StsL7-pLKtV3vGxinX8+1nJydqB_WNXiA@mail.gmail.com>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_130854_965027_6C628000 
X-CRM114-Status: GOOD (  21.58  )
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

T24gRnJpLCAyMDIyLTA2LTEwIGF0IDE2OjU2ICswMjAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
Cj4gT24gRnJpLCBKdW4gMTAsIDIwMjIgYXQgMTA6NDggQU0gTnVubyBTw6EgPG51bm8uc2FAYW5h
bG9nLmNvbT4gd3JvdGU6Cj4gPiAKPiA+ICdvZl9ub2RlX3B1dCgpJyBjYW4gcG90ZW50aWFsbHkg
cmVsZWFzZSB0aGUgbWVtb3J5IHBvaW50ZWQgdG8gYnkKPiA+ICdpaW9zcGVjLm5wJyB3aGljaCB3
b3VsZCBsZWF2ZSB1cyB3aXRoIGFuIGludmFsaWQgcG9pbnRlciAoYW5kIHdlCj4gPiB3b3VsZAo+
ID4gc3RpbGwgcGFzcyBpdCBpbiAnb2ZfeGxhdGUoKScpLiBBcyBzdWNoLCB3ZSBjYW4gb25seSBy
ZWxlYXNlIHRoZQo+ID4gbm9kZQo+ID4gYWZ0ZXIgd2UgYXJlIGRvbmUgd2l0aCBpdC4KPiAKPiBU
aGUgcXVlc3Rpb24geW91IHNob3VsZCBhbnN3ZXIgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIGlzIHRo
ZQo+IGZvbGxvd2luZzoKPiAiQ2FuIGFuIE9GIG5vZGUsIGF0dGFjaGVkIHRvIGEgc3RydWN0IGRl
dmljZSwgYmUgZ29uZSBiZWZvcmUgdGhlCj4gZGV2aWNlIGl0c2VsZj8iIElmIGl0IHNvLCB0aGVu
IHBhdGNoIGlzIGdvb2QsIG90aGVyd2lzZSB0aGVyZSBpcyBubwo+IHBvaW50IGluIHRoaXMgcGF0
Y2ggaW4gdGhlIGZpcnN0IHBsYWNlLgo+IAoKWWVhaCwgSSBtaWdodCBiZSB3cm9uZyBidXQgZnJv
bSBhIHF1aWNrIGxvb2suLi4geWVzLCBJIHRoaW5rIHRoZSBub2RlCmNhbiBiZSBnb25lIGJlZm9y
ZSB0aGUgZGV2aWNlLiBUYWtlIGEgbG9vayBvbiB0aGUgc3BpIG9yIGkyYyBvZl9ub3RpZnkKaGFu
ZGxpbmcgYW5kIHlvdSBjYW4gc2VlIHRoYXQgdGhlIG5vZGVzIGFyZSBnZXQvcHV0IG9uIHRoZSBh
ZGQvcmVtb3ZlCm5vdGlmY2F0aW9uLiBNZWFuaW5nIHRoYXQgdGhlIG5vZGUgbGlmZXNwYW4gaXMg
bm90IHJlYWxseSBhdHRhY2hlZCB0bwp0aGUgZGV2aWNlIGxpZmVzcGFuLiBJZiBpdCB3YXMsIEkg
d291bGQgZXhwZWN0IHRvIHNlZSBvZl9ub2RlX3B1dCgpIG9uCnRoZSBkZXZpY2UgcmVsZWFzZSgp
IGZ1bmN0aW9uLi4uCgpBZ2FpbiwgSSBtaWdodCBiZSB3cm9uZyBhbmQgSSBhZG1pdCBJIHdhcyBu
b3Qgc3VyZSBhYm91dCBpbmNsdWRpbmcgdGhpcwpwYXRjaCBiZWNhdXNlIGl0J3MgYSB2ZXJ5IHVu
bGlrZWx5IHNjZW5hcmlvIGV2ZW4gdGhvdWdoIEkgdGhpbmssIGluCnRoZW9yeSwgYSBwb3NzaWJs
ZSBvbmUuCgotIE51bm8gU8OhCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
