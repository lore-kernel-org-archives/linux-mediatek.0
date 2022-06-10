Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006DEC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 19:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JHzs09XpsJLMAu82eXx88Wtg39vTWcjCcvMoi/HpNDk=; b=T3SEVNemgXq4MG
	tVGtCpL70gC5PfCCMd6xmZ6Fr//9XrE4jhos6Sf0TW0ke0YO/y6lV6cLt39nWlm4jI0HjeTmgW5Ll
	kYbwSYkR/ZKaDWDRzBQPUQgkzSm96pysyEBQc0pgQDkRtp/a7UB/FmJz1vSUopK1QS18fHaL3nVup
	F1VkPViLa/Z7bZl/eptwRU+1oShLZ5uuoZhlA+/CynZfb76XFOhcc/MHFoJxwTyd9Jp7QfuepURzy
	Tzpk2Wn03HQRy93pJRAfvRHjL6VG4VT6bBtLHbM9ESiwot42EePM84Q99U++u/IeMbl4dVGIATtnW
	tGnHByo+lveQ4pjSD7AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzkcR-009a0M-7i; Fri, 10 Jun 2022 19:48:31 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzkcN-009ZzV-HC; Fri, 10 Jun 2022 19:48:29 +0000
Received: by mail-wr1-x42d.google.com with SMTP id x17so37800623wrg.6;
        Fri, 10 Jun 2022 12:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Uw42AgxCz2OX29JjZrfK1zeziXwl4MAn7te6Qnb21ik=;
        b=VnmBwWKvliqZ17mqAO3YFUhuijHFVCA0X/6JoDEeNmtQ5fuB2ME76Abp7kguBl57K7
         M9/alivbnhSTovq/B//wCei53pyxQ+HtrJaffG1iGtF9Ndaudu7kcr9ovspAlwBkBSrl
         Qk8wAlB8QCS5xW3y97CMGT7D89Ky4udjBupXK19Q8pH4R+6TZMpKLOBEkE6ub91Xaf7Y
         S7oL2lI6/EzqlSBNis27lv8/Z8dTYnHGhUC0YHRirC4Dqxm1vVmg/6fapPeKzP00VvFU
         tNNMy6jrpva6Bk+UcwypSwoLQSKLiQbVV7FbXXq9G/VEvyzMlVefQmke6B2XscRqIWLl
         voDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Uw42AgxCz2OX29JjZrfK1zeziXwl4MAn7te6Qnb21ik=;
        b=WRVyxx2zdhjQBofZCRBq/wJUHjUwRu2Ndk3xciFah43JttxzmaoNKOrNcoz6auzcq4
         FGNK4zXsIx5UpKCrT9I9SrjdKztBRh09zK3GaZJsXaTIaUtDxjTzu18RZK64+d8CI/zR
         j+rru0++DtQGP+g733Zw/oKrHFUYXTx/ucbTs3LhKuFY6X0yGbpkob16P1ZZbqtI23sQ
         cvTrNewTSe1UwfWaxXuGu1iuf5pyDuUJJQu/FQJSxIP0uiSL3bWbeSSA0bnHQjneAdZW
         SwCm6k/2US+9Fq32K17g7cCKSCyaSEUfZxYjflHj/QyH/+YnoV0WxQOu4ayHsjn6HaDj
         R4Cw==
X-Gm-Message-State: AOAM533tcNJ/Ut5skc+77c7cwRKChKpoutLriV740o0psGUgK+/DTa/F
	FGhAsxklWV97ePH+VVpjvk4=
X-Google-Smtp-Source: ABdhPJy5G62/5XmSgGYkKL4gT5Hd/Ethb/qClZrbwW5M3Zb4SLtoP92M/h2fB9W3tywpi7sFv5O92A==
X-Received: by 2002:a5d:5983:0:b0:218:519e:78a5 with SMTP id n3-20020a5d5983000000b00218519e78a5mr20645990wri.718.1654890504947;
        Fri, 10 Jun 2022 12:48:24 -0700 (PDT)
Received: from ?IPv6:2001:a61:136e:3c01:8bd4:cf6f:76f1:a861? ([2001:a61:136e:3c01:8bd4:cf6f:76f1:a861])
        by smtp.gmail.com with ESMTPSA id x3-20020a5d6503000000b002103136623esm257905wru.85.2022.06.10.12.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 12:48:24 -0700 (PDT)
Message-ID: <25e286370d34419c3fc32a75896d5bfebc4128ea.camel@gmail.com>
Subject: Re: [PATCH 22/34] iio: inkern: only return error codes in
 iio_channel_get_*() APIs
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
Date: Fri, 10 Jun 2022 21:48:22 +0200
In-Reply-To: <CAHp75VcPoZ4FKTwDN_F76EZAcWYzAe1CHmuRuaP0wg3BgmPtfA@mail.gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	 <20220610084545.547700-23-nuno.sa@analog.com>
	 <CAHp75VcPoZ4FKTwDN_F76EZAcWYzAe1CHmuRuaP0wg3BgmPtfA@mail.gmail.com>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_124827_634082_28421DA1 
X-CRM114-Status: GOOD (  27.58  )
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

T24gRnJpLCAyMDIyLTA2LTEwIGF0IDE3OjA1ICswMjAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
Cj4gT24gRnJpLCBKdW4gMTAsIDIwMjIgYXQgMTA6NDggQU0gTnVubyBTw6EgPG51bm8uc2FAYW5h
bG9nLmNvbT4gd3JvdGU6Cj4gPiAKPiA+IEFQSXMgbGlrZSBvZl9paW9fY2hhbm5lbF9nZXRfYnlf
bmFtZSgpIGFuZCBvZl9paW9fY2hhbm5lbF9nZXRfYWxsKCkKPiA+IHdlcmUKPiA+IHJldHVybmlu
ZyBhIG1peCBvZiBOVUxMIGFuZCBlcnJvciBwb2ludGVycyBiZWluZyBOVUxMIHRoZSB3YXkgdG8K
PiA+ICJub3RpZnkiIHRoYXQgd2Ugc2hvdWxkIGRvIGEgInN5c3RlbSIgbG9va3VwIGZvciBjaGFu
bmVscy4gVGhpcwo+ID4gbWFrZQo+ID4gaXQgdmVyeSBjb25mdXNpbmcgYW5kIHByb25lIHRvIGVy
cm9ycyBhcyBjb21taXQgZGJiY2NmN2MyMGJmCj4gPiAoImlpbzogaW5rZXJuOiBmaXggcmV0dXJu
IHZhbHVlIGluCj4gPiBkZXZtX29mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKCkiKQo+ID4gcHJv
dmVzLiBPbiB0b3Agb2YgdGhpcywgcGF0dGVybnMgbGlrZSAnaWYgKGNoYW5uZWwgIT0gTlVMTCkg
cmV0dXJuCj4gPiBjaGFubmVsJwo+ID4gd2VyZSBiZWluZyB1c2VkIHdoZXJlIGNoYW5uZWwgY291
bGQgYWN0dWFsbHkgYmUgYW4gZXJyb3IgY29kZSB3aGljaAo+ID4gbWFrZXMgdGhlIGNvZGUgaGFy
ZCB0byByZWFkLgo+IAo+IC4uLgo+IAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IG5wID0gbnAtPnBhcmVudDsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
bnAgJiYgIW9mX2dldF9wcm9wZXJ0eShucCwgImlvLWNoYW5uZWwtcmFuZ2VzIiwKPiA+IE5VTEwp
KQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biBOVUxMOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiBjaGFuOwo+IAo+IFNob3VsZG4ndCBpdCByZXR1cm4gYSBkZWRpY2F0ZWQgZXJyb3Ig
Y29kZSBhbmQgbm90IHNvbWUgYXJiaXRyYXJ5Cj4gb25lPwo+IEl0IG1heSBiZSBJIG1pc3NlZCBz
b21ldGhpbmcgYW5kIGNoYW4gaGFzIGEgY29ycmVjdCBlcnJvciBjb2RlIGluCj4gdGhpcwo+IGNh
c2UuLi4KPiAKClNpbmNlIGluIHRoaXMgY2FzZSB3ZSB3b24ndCBsb29rIGZvciBjaGFubmVscyBp
biB0aGUgcGFyZW50IGRldmljZSwgSSdtCmp1c3QgaG9ub3JpbmcgdGhlIGNvZGUgcmV0dXJuZWQg
YnkgJ29mX2lpb19jaGFubmVsX2dldCgpJy4KCj4gLi4uCj4gCj4gPiArwqDCoMKgwqDCoMKgIGlm
IChudW1tYXBzID09IDApwqDCoMKgwqDCoMKgIC8qIHJldHVybiAtRU5PREVWIHRvIHNlYXJjaCBt
YXAKPiA+IHRhYmxlICovCj4gCj4gQ29tbWVudCBpcyBzdXBlcmZsdW91cywgdGhlIG5leHQgbGlu
ZSBpcyBzZWxmLWV4cGxhaW5pbmcuCj4gCgpXZWxsLCBJIGFncmVlLiBJIGp1c3Qga2VwdCBhcyBp
dCB3YXMgb24gdGhlIG9yaWdpbmFsIGNvZGUuIENhbiBoYXBpbGx5CnJlbW92ZSBpdCBpZiBubyBv
bmUgb2JqZWN0cyBhZ2FpbnN0IGl0LgoKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiBFUlJfUFRSKC1FTk9ERVYpOwo+IAo+IC4uLgo+IAo+ID4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKGNoYW5uZWwgIT0gTlVMTCkKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlmICghSVNfRVJSKGNoYW5uZWwpIHx8IFBUUl9FUlIoY2hhbm5lbCkgPT0g
LQo+ID4gRVBST0JFX0RFRkVSKQo+IAo+IEJ0dywgaW4gdGhlIEdQSU8gbGlicmFyeSB3ZSBoYXZl
IGEgbWFjcm8gb3IgaW5saW5lciAoZG9uJ3QgcmVtZW1iZXIpCj4gdGhhdCByZXByZXNlbnRzIHN1
Y2ggYSBjb25kaXRpb25hbC4KPiBQZXJoYXBzIG1ha2UgaXQgKGlmIGl0J3MgYSBtYWNybykgZ2xv
YmFsLCBvciBpbnRyb2R1Y2UgYW4gaW5saW5lIGluCj4gSUlPPwo+IAo+IE9rYXksIGl0J3MgaGVy
ZToKPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xOS1yYzEvc291cmNlL2Ry
aXZlcnMvZ3Bpby9ncGlvbGliLmgjTDE3OQo+IAo+IEl0J3Mgc2ltaWxhciwgYnV0IG5vdCB0aGUg
c2FtZSwgc28ganVzdCBwbGF5IHdpdGggYW4gaWRlYSB0bwo+IGludHJvZHVjZQo+IHNvbWV0aGlu
ZyBpbiB0aGlzIGZpbGUsIG1heWJlIGl0J3Mgd29ydGggZG9pbmcgdGhpcywgbWF5YmUgbm90Lgo+
IAoKSSB3b3VsZCBhbHNvIGFyZ3VlIHRoYXQgY291bGQgYmUgc29tZXRoaW5nIGRvbmUgYWZ0ZXIg
dGhpcyBzZXJpZXMgZ2V0cwphcHBsaWVkLi4uCgotIE51bm8gU8OhCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
