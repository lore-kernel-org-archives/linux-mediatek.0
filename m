Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB82C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 15:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=El6pS7J3MqwUAprGJzuEl5rLAgEYGi4+389Wu0Zt8W4=; b=oVLEAbSYiY0CQX
	eLN7fmx8kkYfHkIDH4zyebG9gneoIlDwNBc8iThme/q7hClIZIKPg+rEAb5t/pvNj5tStfhPF1dOs
	snTGCy/q4WRl70qVGytDcrlGdWePvKc0i+rkxogQ3vDRhr6ntetcMApTjdvud+lV1q1PF186qSOg7
	95tzFTtt1/p8bZwB+t35L624L+Q4KZh7GHDbD5Dx2+2unfLqqVXNWK8BzXstaLqc6ilFVO3nsAM4O
	PS7FqHUyrmoXv9X+rvkrkEqsE5z8uOnse7KAo9Z/xwQDGyO5UpRxbn/Mc/eCCeLMJ/iPvkRCVTQkY
	hWKtnTzlYy0YPSWCHr1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzgDX-008hBH-74; Fri, 10 Jun 2022 15:06:31 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzgDT-008h9x-BH; Fri, 10 Jun 2022 15:06:28 +0000
Received: by mail-ej1-x629.google.com with SMTP id fu3so52537858ejc.7;
        Fri, 10 Jun 2022 08:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rmSZhFt+L2EkdTfA4PhCKlZgd+Ko2Rb6WSrQZb1cOCI=;
        b=qCr8IJLDkZnLtvz4aw+Xn5xelUdctRwoMbU2miyXWPJSzLZTJK2NeLG1JzUB9nU2nE
         5/RMCchvqx1ozjmNfNiBY4sJPZPjH7Ea5MpV7IYxt94+qFzIQuzmrr/zYYAP+dIEnmfQ
         0fNqjCzWxWfSnGY9kbiR2idz19Ic+Z0cFo4bKxJeyYNHmLilyZVs6SAOptiXPyxSMutY
         Q7ONB7ISiyNGWXXWBalOU8nD+18nZBZ9WdCwlSDCAAdrCEX08bVOGzs/5dUYND/pccgd
         ragBkS8mjJZY0gn+bjB5N+tuF1Ez2mGm8CSLoHNzEXhhSe1/Zmu/grPIAqadHgCBJWvt
         dswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rmSZhFt+L2EkdTfA4PhCKlZgd+Ko2Rb6WSrQZb1cOCI=;
        b=sntUOCaXxBqHZVtqCGF5V6LWKo2LVGjxH1p5pxcRU3Dc8jNv0LbcUx14jy+kVJ8pCq
         RSGXwYI/Zj1UASzh/jycq3D2PkDqKS+qnPw/139UWP7OF9zGbtg6syEBZaXiBKrgYS4e
         GC04xTTspE7tm0lxbLUMkvjJQK2HB6V4mo1W8yObNn2T0E6SwCi5/iNWjxd+/S0O1PlD
         1sMVutFgTehVOoh5QuwotAqP7WV4/WTz8BiLhPszOuqXKou04TXCRKfhLOrcQemNwKYg
         Z95BuiKFX6pKYiH+Pni7H1Cc8ofZrcdG90oaE6h2SJB5W8TBSC2NYd96UWxvK9RIcS64
         t5Vw==
X-Gm-Message-State: AOAM531ZMdppJ9EqWhfnJb4s3KFJXZZ6E912f62AftS/s9dg7ZQkDMnF
	+ToUgA6uF6Nu+4fa+66IY6EkzywYI+gx3g/wtEw=
X-Google-Smtp-Source: ABdhPJxLQGYHGj7gcyVcctXCwCgpnEr2cRyaoQ3/TTAEPMeK3HCToHy6/n79bgCvIjvr7StG2KRTs/e28PmBV+zKUAU=
X-Received: by 2002:a17:906:c7c1:b0:711:d2e9:99d0 with SMTP id
 dc1-20020a170906c7c100b00711d2e999d0mr23093435ejb.639.1654873582571; Fri, 10
 Jun 2022 08:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com> <20220610084545.547700-23-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-23-nuno.sa@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 Jun 2022 17:05:45 +0200
Message-ID: <CAHp75VcPoZ4FKTwDN_F76EZAcWYzAe1CHmuRuaP0wg3BgmPtfA@mail.gmail.com>
Subject: Re: [PATCH 22/34] iio: inkern: only return error codes in
 iio_channel_get_*() APIs
To: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, chrome-platform@lists.linux.dev, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cai Huoqing <cai.huoqing@linux.dev>, 
	Benjamin Fair <benjaminfair@google.com>, Jishnu Prakash <quic_jprakash@quicinc.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Amit Kucheria <amitk@kernel.org>, 
	Andy Gross <agross@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Benson Leung <bleung@chromium.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Christophe Branchereau <cbranchereau@gmail.com>, Patrick Venture <venture@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Nancy Yuen <yuenn@google.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Gwendal Grignou <gwendal@chromium.org>, 
	Saravanan Sekar <sravanhome@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Thara Gopinath <thara.gopinath@linaro.org>, Avi Fishman <avifishman70@gmail.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Jonathan Cameron <jic23@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Shawn Guo <shawnguo@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Eugen Hristev <eugen.hristev@microchip.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_080627_428358_2BFE6298 
X-CRM114-Status: GOOD (  16.11  )
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

T24gRnJpLCBKdW4gMTAsIDIwMjIgYXQgMTA6NDggQU0gTnVubyBTw6EgPG51bm8uc2FAYW5hbG9n
LmNvbT4gd3JvdGU6Cj4KPiBBUElzIGxpa2Ugb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUoKSBh
bmQgb2ZfaWlvX2NoYW5uZWxfZ2V0X2FsbCgpIHdlcmUKPiByZXR1cm5pbmcgYSBtaXggb2YgTlVM
TCBhbmQgZXJyb3IgcG9pbnRlcnMgYmVpbmcgTlVMTCB0aGUgd2F5IHRvCj4gIm5vdGlmeSIgdGhh
dCB3ZSBzaG91bGQgZG8gYSAic3lzdGVtIiBsb29rdXAgZm9yIGNoYW5uZWxzLiBUaGlzIG1ha2UK
PiBpdCB2ZXJ5IGNvbmZ1c2luZyBhbmQgcHJvbmUgdG8gZXJyb3JzIGFzIGNvbW1pdCBkYmJjY2Y3
YzIwYmYKPiAoImlpbzogaW5rZXJuOiBmaXggcmV0dXJuIHZhbHVlIGluIGRldm1fb2ZfaWlvX2No
YW5uZWxfZ2V0X2J5X25hbWUoKSIpCj4gcHJvdmVzLiBPbiB0b3Agb2YgdGhpcywgcGF0dGVybnMg
bGlrZSAnaWYgKGNoYW5uZWwgIT0gTlVMTCkgcmV0dXJuIGNoYW5uZWwnCj4gd2VyZSBiZWluZyB1
c2VkIHdoZXJlIGNoYW5uZWwgY291bGQgYWN0dWFsbHkgYmUgYW4gZXJyb3IgY29kZSB3aGljaAo+
IG1ha2VzIHRoZSBjb2RlIGhhcmQgdG8gcmVhZC4KCi4uLgoKPiAgICAgICAgICAgICAgICAgbnAg
PSBucC0+cGFyZW50Owo+ICAgICAgICAgICAgICAgICBpZiAobnAgJiYgIW9mX2dldF9wcm9wZXJ0
eShucCwgImlvLWNoYW5uZWwtcmFuZ2VzIiwgTlVMTCkpCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIE5VTEw7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGNoYW47CgpT
aG91bGRuJ3QgaXQgcmV0dXJuIGEgZGVkaWNhdGVkIGVycm9yIGNvZGUgYW5kIG5vdCBzb21lIGFy
Yml0cmFyeSBvbmU/Ckl0IG1heSBiZSBJIG1pc3NlZCBzb21ldGhpbmcgYW5kIGNoYW4gaGFzIGEg
Y29ycmVjdCBlcnJvciBjb2RlIGluIHRoaXMKY2FzZS4uLgoKLi4uCgo+ICsgICAgICAgaWYgKG51
bW1hcHMgPT0gMCkgICAgICAgLyogcmV0dXJuIC1FTk9ERVYgdG8gc2VhcmNoIG1hcCB0YWJsZSAq
LwoKQ29tbWVudCBpcyBzdXBlcmZsdW91cywgdGhlIG5leHQgbGluZSBpcyBzZWxmLWV4cGxhaW5p
bmcuCgo+ICsgICAgICAgICAgICAgICByZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKCi4uLgoKPiAt
ICAgICAgICAgICAgICAgaWYgKGNoYW5uZWwgIT0gTlVMTCkKPiArICAgICAgICAgICAgICAgaWYg
KCFJU19FUlIoY2hhbm5lbCkgfHwgUFRSX0VSUihjaGFubmVsKSA9PSAtRVBST0JFX0RFRkVSKQoK
QnR3LCBpbiB0aGUgR1BJTyBsaWJyYXJ5IHdlIGhhdmUgYSBtYWNybyBvciBpbmxpbmVyIChkb24n
dCByZW1lbWJlcikKdGhhdCByZXByZXNlbnRzIHN1Y2ggYSBjb25kaXRpb25hbC4KUGVyaGFwcyBt
YWtlIGl0IChpZiBpdCdzIGEgbWFjcm8pIGdsb2JhbCwgb3IgaW50cm9kdWNlIGFuIGlubGluZSBp
biBJSU8/CgpPa2F5LCBpdCdzIGhlcmU6Cmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4
L3Y1LjE5LXJjMS9zb3VyY2UvZHJpdmVycy9ncGlvL2dwaW9saWIuaCNMMTc5CgpJdCdzIHNpbWls
YXIsIGJ1dCBub3QgdGhlIHNhbWUsIHNvIGp1c3QgcGxheSB3aXRoIGFuIGlkZWEgdG8gaW50cm9k
dWNlCnNvbWV0aGluZyBpbiB0aGlzIGZpbGUsIG1heWJlIGl0J3Mgd29ydGggZG9pbmcgdGhpcywg
bWF5YmUgbm90LgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
