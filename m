Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328A0C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 19:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n7f2ex6TZXgQc5F4j7Iik4jDwTzCMvKQiZFexS5O8/4=; b=CbFFaYyvCEUJsU
	lI1agXm0Zi6pNl919HlV5S1HNtmEYg6CnyNKtOkIH4we7ekumLA0VAK13agfg7sMRXYsXpObZG4IG
	smsrSqlGzMM/6b1HqgGDF7ViZUaJR+YGJVkTRC0a5jobb9VoJyM3ekEIh8Mu33ezwdw0iCilgGIz5
	LaBqLBgxfdyqUitX1X21rsmkIgzrGe3hCxrvv2YKlkC864IrfpawdvldkOCFw4rkuf3EbXbpn1710
	Tk1A2sovoKJUxXdrMFTeyQuOPheX2t6YfXC3JZAhB6ITCOD0/wm9ykeiZxULGogr1oUZaX867hpPI
	WOjS+YmSc+CT5n2zAtOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzkfC-009ajD-S2; Fri, 10 Jun 2022 19:51:22 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzkf9-009ahp-W3; Fri, 10 Jun 2022 19:51:21 +0000
Received: by mail-ej1-x633.google.com with SMTP id g25so8875921ejh.9;
        Fri, 10 Jun 2022 12:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=bNY4bb5ZsDGbijlscX/zWHp76bvVhoKTJQjCK2gLBow=;
        b=DTARzN9ZKxLbpM5DnF604iI8/F/84/wIKw08CbQfw05YnVX88YGW6HVfBxQNHvMu4T
         MLrV3I1t6KM5Qc6HlnyeXHSTGoq8+8DaWtqoRUwsLbX6Mzc8EpX122ha3qRBRoFfEqzN
         Jk0f/3X9FLtgjhjaqJKanWVijWyNNRgDw6pmj5+2xfApIvc2SRAwOjLitceTonJ4eGE1
         a1A9wbvVgJFRqD/0S50YXqjQh+yziCS7x5lzFW9SKapPD3uUc9it44OjhImJd8j2+oZt
         Butz14g0HcCbwqNDkTuGrH/EVS+NkDJB41ZnGmOfym00EegEpO7qNAqhl52gA+RezkJc
         GTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=bNY4bb5ZsDGbijlscX/zWHp76bvVhoKTJQjCK2gLBow=;
        b=sddw+N8cPlMMXpnwlhbCRyNaLgYU1lIomCz9oNQWZA53hfxnmP9CacgfPrmAikLM1h
         qC5SRnzWfy+TniXdLV436IivI5do2ax1P91kATovL0Hz8ICOMt64znHicVThRblfOOe4
         bivxuV7JJd2mSvb7LpSF8QXxVw94SuYzq2IITaL9aZvTE/ZGEeTVzNprGG0O86XDKIes
         AtgYR2ggfkghOSsI3HnaI4NKgoDsJJHo5+0SMJ3dwGD2HoaM2Voic/1NboOCbDEhCBm/
         D2KcLCK4vzHc76ThQgapAAjkLQwwQ3qHpybb8y2HZhrlSbAGFUla36nR7AjLhQQH4Jui
         1qRQ==
X-Gm-Message-State: AOAM533TQbiWp1bMvRI7JYiMnYOYZHn5XnOeo7vyFTuvXqTr+wFEyJ9Z
	3lfj/orCYgcUc8aNZ6ZawT0=
X-Google-Smtp-Source: ABdhPJxHRykgXinV3uoaEPm9Ud4a9M4gnh2v3qf5U98udrI7NhTVLe93fDw1Gnx05NF5PsnFjGIIwQ==
X-Received: by 2002:a17:906:51d6:b0:712:c9:8a1b with SMTP id v22-20020a17090651d600b0071200c98a1bmr10665567ejk.656.1654890677793;
        Fri, 10 Jun 2022 12:51:17 -0700 (PDT)
Received: from ?IPv6:2001:a61:136e:3c01:8bd4:cf6f:76f1:a861? ([2001:a61:136e:3c01:8bd4:cf6f:76f1:a861])
        by smtp.gmail.com with ESMTPSA id ck16-20020a170906c45000b006feb20b5235sm12715703ejb.84.2022.06.10.12.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 12:51:17 -0700 (PDT)
Message-ID: <d083dd2c7e9e6eefb32124648a06799a9ebe8dfd.camel@gmail.com>
Subject: Re: [PATCH 34/34] iio: inkern: fix coding style warnings
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Joe Simmons-Talbott <joetalbott@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?=
	 <nuno.sa@analog.com>
Cc: linux-imx@nxp.com, linux-renesas-soc@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 chrome-platform@lists.linux.dev, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm@vger.kernel.org, 
 linux-iio@vger.kernel.org, openbmc@lists.ozlabs.org, Cai Huoqing
 <cai.huoqing@linux.dev>, Benjamin Fair <benjaminfair@google.com>, Jishnu
 Prakash <quic_jprakash@quicinc.com>, Linus Walleij
 <linus.walleij@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Amit Kucheria <amitk@kernel.org>,
 Andy Gross <agross@kernel.org>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Haibo Chen <haibo.chen@nxp.com>, Benson
 Leung <bleung@chromium.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Christophe Branchereau
 <cbranchereau@gmail.com>,  Patrick Venture <venture@google.com>, Arnd
 Bergmann <arnd@arndb.de>, Nancy Yuen <yuenn@google.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Gwendal Grignou <gwendal@chromium.org>, Saravanan Sekar
 <sravanhome@gmail.com>, Tali Perry <tali.perry1@gmail.com>,  Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Thara Gopinath <thara.gopinath@linaro.org>, Avi Fishman
 <avifishman70@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Claudiu
 Beznea <claudiu.beznea@microchip.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,  Tomer Maimon <tmaimon77@gmail.com>, Bjorn
 Andersson <bjorn.andersson@linaro.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Jonathan Cameron <jic23@kernel.org>, Zhang
 Rui <rui.zhang@intel.com>, Shawn Guo <shawnguo@kernel.org>, Guenter Roeck
 <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Eugen Hristev <eugen.hristev@microchip.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 10 Jun 2022 21:51:15 +0200
In-Reply-To: <YqNo6U8r80aNFzUr@spruce>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	 <20220610084545.547700-35-nuno.sa@analog.com> <YqNo6U8r80aNFzUr@spruce>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_125120_074584_3A4CB4A9 
X-CRM114-Status: GOOD (  16.79  )
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

T24gRnJpLCAyMDIyLTA2LTEwIGF0IDExOjUzIC0wNDAwLCBKb2UgU2ltbW9ucy1UYWxib3R0IHdy
b3RlOgo+IE9uIEZyaSwgSnVuIDEwLCAyMDIyIGF0IDEwOjQ1OjQ1QU0gKzAyMDAsIE51bm8gU8Oh
IHdyb3RlOgo+ID4gSnVzdCBjb3NtZXRpY3MuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVk
Li4uCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+
Cj4gPiAtLS0KPiA+IMKgZHJpdmVycy9paW8vaW5rZXJuLmMgfCA2NCArKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAtLS0tCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAz
MiBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaWlvL2lua2Vybi5jIGIvZHJpdmVycy9paW8vaW5rZXJuLmMKPiA+IGluZGV4IDdlYjUz
NjU2MGRlZC4uNTI2NTE5Y2VmY2I5IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9paW8vaW5rZXJu
LmMKPiA+ICsrKyBiL2RyaXZlcnMvaWlvL2lua2Vybi5jCj4gPiBAQCAtNDUsMTMgKzQ1LDEzIEBA
IGludCBpaW9fbWFwX2FycmF5X3JlZ2lzdGVyKHN0cnVjdCBpaW9fZGV2Cj4gPiAqaW5kaW9fZGV2
LCBzdHJ1Y3QgaWlvX21hcCAqbWFwcykKPiA+IMKgwqDCoMKgwqDCoMKgwqBpbnQgaSA9IDAsIHJl
dCA9IDA7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGlpb19tYXBfaW50ZXJuYWwgKm1hcGk7
Cj4gPiDCoAo+ID4gLcKgwqDCoMKgwqDCoMKgaWYgKG1hcHMgPT0gTlVMTCkKPiA+ICvCoMKgwqDC
oMKgwqDCoGlmICghbWFwcykKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0
dXJuIDA7Cj4gPiDCoAo+ID4gwqDCoMKgwqDCoMKgwqDCoG11dGV4X2xvY2soJmlpb19tYXBfbGlz
dF9sb2NrKTsKPiA+IC3CoMKgwqDCoMKgwqDCoHdoaWxlIChtYXBzW2ldLmNvbnN1bWVyX2Rldl9u
YW1lICE9IE5VTEwpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoHdoaWxlICghbWFwc1tpXS5jb25zdW1l
cl9kZXZfbmFtZSkgewo+IAo+IFNob3VsZG4ndCB0aGlzIGJlPzoKPiB3aGlsZSAobWFwc1tpXS5j
b25zdW1lcl9kZXZfbmFtZSkgewo+IAoKVXBzLi4uIE5pY2UgY2F0Y2ghIEkgd2FzIHByb2JhYmx5
IGluIGJvdCBtb2RlIGFscmVhZHkuCgotIE51bm8gU8OhCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
