Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E843C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 14:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YKA+52Tft0TznR1sxri0GJoFLNAe4lf7xbUkZjrfW68=; b=G8M33l5j3ITpTD
	QiaiDsU5qPy6k7cVpvkt8Ipi2m1CZiUrnSXu7urWf4+VQQ3Mi3uvhY+m0GdDgA6RqwZrrAbeEHN7G
	aa8aqxuCWnzI6svGUKHWXxYVWv2U1DtUKuaFvrE4mxlDQCMTO1VVvu1pZhGUHafXnXYO4/Bp4oic9
	a3vRdLwU1y5wN3nJltdhxJ0/JUbldVhDxVl2r+omtuh7kBFlHjlYxxlJDlbZG2y7nk5/OXPUl5QIx
	DP1bOvyetBNZ3yAM5QHi5UXxodZv7EPff92HiPxSYFjNelHawEGmhYYWKtxp8XOq0dYjnj2S9/xVi
	FoirqP16xhfXNz7rn9hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzfxJ-008eKy-7T; Fri, 10 Jun 2022 14:49:45 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzfxF-008eIG-B0; Fri, 10 Jun 2022 14:49:43 +0000
Received: by mail-ed1-x52f.google.com with SMTP id v25so35617800eda.6;
        Fri, 10 Jun 2022 07:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zWkAvm2IXlDyGZ0UgWFThaY4qnPSU5U8Y+oJ0NIguu0=;
        b=SQ+LihYiWIuYf6xqulrMEnX++/IX2vzMGPc2QpqU6sFGBggJteUcsg+e3wUg27h//x
         KE+Hsar0BRNsd9L2t3Cj862Or2T+hnYT4oHaY0J3P82xWVD80vWLMfPpUB0p0eSBa5eE
         0NzM/B6W52r4Cq+96HjMg+yPYPvC1kr6mzUrI+gXXfAUa616v2nF2RhqV9ww2HAUj5+A
         z/YmwOhvJ7g/r4AKQ6ZandGjQ/rsURSmG39nAqoS0fadbBiYNsRL+vjiFG8xrvGOtElp
         TUoHq9EcF224pB2Y6vqt/Oli6tzumzS9HooVQzrNKbkbx1jYcyNf2p+MPTrw/DDrp+B2
         wNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zWkAvm2IXlDyGZ0UgWFThaY4qnPSU5U8Y+oJ0NIguu0=;
        b=s+gzPCbjkCAxG0w48dLkoHJBRnIVfpP7MYW4CFQUkxjPua6cI6WCqNnK1Ogeu1+ZlU
         33II23Fc+AWbIvrbWnz4gn+VyC4sfxCxxsjfGIB40OGbbdb/gFv1mxJwl4a+5hrMkeL7
         xH3MlsuIRrSCO6X9QJr1cuXdoef6+kI5lOrT7l5azk3gP1g9T7rfcfgDpAr0atPfybyh
         77vsQ/plPRWuu+BBYF77sAQgdq7UdXyFaXJhA4VCwopG6GNPJDWGcJuyHCGeI+eC9nqj
         av6VXzezuRuSADfgTU3ORyR0zSawTjsj5kRbRwGTMqmqrQg1/qXUX341ACQ1o6UgQakf
         UZvg==
X-Gm-Message-State: AOAM530udR2JpBiCHoYQshmWQu9sCUWmLby8DTt0ATArmwGk48RkbFSJ
	bmmmldPQyG8vJSd0nKQBg+8s8XtOWYVGd/FnkuU=
X-Google-Smtp-Source: ABdhPJy9gdpwBA5sThUt0tz3Y57F51s/85a/ySJS4TTKz4QCJy/P98K2AUNMQFxo/TDXBlL2r2NUMPWBYYbiis5yFko=
X-Received: by 2002:aa7:d303:0:b0:42d:d192:4c41 with SMTP id
 p3-20020aa7d303000000b0042dd1924c41mr52233345edq.178.1654872577673; Fri, 10
 Jun 2022 07:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-1-nuno.sa@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 Jun 2022 16:48:59 +0200
Message-ID: <CAHp75VfhRoDupB2rFS+hg1zFN3=8RhnBcXrg0O72bKJYQz+8Kg@mail.gmail.com>
Subject: Re: [PATCH 00/34] make iio inkern interface firmware agnostic
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
X-CRM114-CacheID: sfid-20220610_074941_445165_71F82514 
X-CRM114-Status: GOOD (  25.57  )
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

T24gRnJpLCBKdW4gMTAsIDIwMjIgYXQgMTA6NDUgQU0gTnVubyBTw6EgPG51bm8uc2FAYW5hbG9n
LmNvbT4gd3JvdGU6Cj4KPiBUaGUgbWFpbiBnb2FsIG9mIHRoaXMgcGF0Y2hzZXQgaXMgdG8gY29u
dmVydCB0aGUgaWlvIGlua2VybiBpbnRlcmZhY2UgdG8KPiBiZSBmaXJtd2FyZSBhZ25vc3RpYy4g
U29tZSBwcmV2aW91cyBkaXNjdXNzaW9uIHdhcyBkb25lIGluIGhlcmUgWzFdLgo+IFRob3VnaCBz
b21ldGhpbmcgb2RkIGhhcHBlbmVkIHdoaWxlIHNlbmRpbmcgdGhlIHBhdGNoZXMgYW5kIHRoZSBS
RkMKPiBhY3R1YWxseSBuZXZlciBsYW5kZWQgaW4gdGhlIElJTyBsaXN0IChob3BlZnVsbHkgbm93
IHdvcmtzKToKPgo+IEFzIHN1Z2dlc3RlZCBieSBBbmR5LCB0aGUgc2VyaWVzIGNhbiBiZSBzZWVu
IGluIHRocmVlIGJsb2NrczoKPgo+IDEpICJGaXgiIGFsbCBkcml2ZXJzIHRoYXQgd2VyZSByZWx5
aW5nIG9uIGlpby5oIGZvciBzcGVjaWZpYyBoZWFkZXIKPiBmaWxlcyAobWFpbmx5IG9mLmggYW5k
IG1vZF9kZXZpY2V0YWJsZS5oKS4gQWZ0ZXIgdGhhdCB3ZSBjYW4gZHJvcAo+IG9mLmggZnJvbSBp
aW8uaCBhbmQganVzdCBmb3J3YXJkIGRlY2xhcmUgd2hhdCB3ZSBuZWVkLgo+Cj4gMikgTW92ZSAi
bW9zdCIgb2YgdGhlIElJTyBpbiBrZXJuZWwgaW50ZXJmYWNlIHRvIEZXIEFQSS4gQXQgdGhpcyBw
b2ludCwKPiB0aGVyZSdzIHN0aWxsIHNvbWUgT0YgZGVwZW5kZW50IEFQSSBpbiBwbGFjZSBzbyB0
aGF0IHVzZXJzIGFyZSBub3QgYnJva2VuLgo+Cj4gMykgTW92ZSBhbGwgdXNlcnMgb2YgdGhlIElJ
TyBpbiBrZXJuZWwgaW50ZXJmYWNlIHRvIHRoZSBGVyBBUEkgYW5kIHdpdGgKPiB0aGF0LCBtYWtl
IElJTyBmaXJtd2FyZSBhZ25vc3RpYy4KPgo+IE9uIDMpLCB0aGUgcWNvbS1zcG1pLWFkYy10bTUu
YyBkcml2ZXIgd2FzIG9ubHkgY29udmVydGVkIHRvIHVzZSB0aGUgSUlPCj4gQVBJIHdoaWxlIG9u
IHRoZSBJSU8gZHJpdmVycyBhIGZ1bGwgZHJpdmVyIGNvbnZlcnNpb24gd2FzIGRvbmUuIFRoZQo+
IHRoZXJtYWwgb25lIHdvdWxkIGJlIHJlYWxseSBub24gdHJpdmlhbCBhcyB3ZSB3b3VsZCBhbHNv
IG5lZWQgdG8gdG91Y2ggdGhlCj4gc3Vic3lzdGVtLiBPbiB0aGUgSUlPIGRyaXZlcnMsIHRoZSBj
b252ZXJzaW9ucyB3ZXJlIG1vc3RseSBwZWFjZWZ1bGwKPiAoYXBwYXJlbnRseSkuIFNwZWNpYWwg
Y2FyZSBmb3IgdGhlIHN0bTMyLWFkYy5jIGRyaXZlciB0aG91Z2ggYXMgdGhhdCBvbmUKPiB3YXMg
ZmFyIGZyb20gYmVpbmcgc3RyYWlnaHQgOikuCj4KPiBMYXN0bHksIHRoaXMgaXMgb25seSBjb21w
aWxlIHRlc3RlZCB3aXRoIGFsbHllc2NvbmZpZyBmb3IgYXJtIGFuZCBhcm02NC4KPiBXaGlsZSBJ
IHN1cmVseSBjYW4gY29tZSB1cCB3aXRoIHNvbWUgZHVtbXkgZGV2aWNlcyB0byBtYWtlIHN1cmUg
SSBjYW4gc3RpbGwKPiBwcm9wZXJseSBnZXQgSUlPIGNoYW5uZWxzLCBoYXZpbmcgcHJvcGVyIHRl
c3RlZC1ieSB0YWdzIG9uIHBsYXRmb3Jtcwo+IHJlbHlpbmcgb24gdGhpcyBpbnRlcmZhY2Ugd291
bGQgYmUgdmVyeSBhcHByZWNpYXRlZCAoYW5kIEkgc3VzcGVjdCBKb25hdGhhbgo+IHdpbGwgcmVx
dWlyZSBpdCkuCgpGb3Igbm9uLWNvbW1lbnRlZCBwYXRjaGVzIDEtMTk6ClJldmlld2VkLWJ5OiBB
bmR5IFNoZXZjaGVua28gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+CgpZb3UgbWF5IGFkZCBp
dCBmb3IgdGhlIGNvbW1lbnRlZCBwYXRjaGVzIGluIHRoZSAxLTE5IHJhbmdlIGluIGNhc2UgeW91
CmFyZSBnb2luZyB0byBhZGRyZXNzIG15IGNvbW1lbnRzLgoKPiBbMV06IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LWlpby8yMDIyMDYwNDE0MTkyNS4xMjlmMGZmZUBqaWMyMy1odWF3ZWkv
VC8jbWZkNWNjZDc5Mzg0MTU2OTE4MmU0ZjgzMWYyYzQ2MDg5YjY2NWMzNDYKPgo+IE51bm8gU8Oh
ICgzNCk6Cj4gICBpaW86IGFkYzogYWQ3NjA2OiBleHBsaWNpdGx5IGFkZCBwcm9wZXIgaGVhZGVy
IGZpbGVzCj4gICBpaW86IGFkYzogYWQ3NjA2X3BhcjogZXhwbGljaXRseSBhZGQgcHJvcGVyIGhl
YWRlciBmaWxlcwo+ICAgaWlvOiBhZGM6IGJlcmxpbjItYWRjOiBleHBsaWNpdGx5IGFkZCBwcm9w
ZXIgaGVhZGVyIGZpbGVzCj4gICBpaW86IGFkYzogaW14N2RfYWRjOiBleHBsaWNpdGx5IGFkZCBw
cm9wZXIgaGVhZGVyIGZpbGVzCj4gICBpaW86IGFkYzogaW14OHF4cC1hZGM6IGV4cGxpY2l0bHkg
YWRkIHByb3BlciBoZWFkZXIgZmlsZXMKPiAgIGlpbzogYWRjOiBpbmdlbmljLWFkYzogZXhwbGlj
aXRseSBhZGQgcHJvcGVyIGhlYWRlciBmaWxlcwo+ICAgaWlvOiBhZGM6IG1wMjYyOV9hZGM6IGV4
cGxpY2l0bHkgYWRkIHByb3BlciBoZWFkZXIgZmlsZXMKPiAgIGlpbzogYWRjOiBtdDYzNjAtYWRj
OiBleHBsaWNpdGx5IGFkZCBwcm9wZXIgaGVhZGVyIGZpbGVzCj4gICBpaW86IGFkYzogbnBjbV9h
ZGM6IGV4cGxpY2l0bHkgYWRkIHByb3BlciBoZWFkZXIgZmlsZXMKPiAgIGlpbzogYWRjOiByemcy
bF9hZGM6IGV4cGxpY2l0bHkgYWRkIHByb3BlciBoZWFkZXIgZmlsZXMKPiAgIGlpbzogY29tbW9u
OiBjcm9zX2VjX2xpZF9hbmdsZTogZXhwbGljaXRseSBhZGQgcHJvcGVyIGhlYWRlciBmaWxlcwo+
ICAgaWlvOiBjb21tb246IGNyb3NfZWNfc2Vuc29yczogZXhwbGljaXRseSBhZGQgcHJvcGVyIGhl
YWRlciBmaWxlcwo+ICAgaWlvOiBkYWM6IHN0bTMyLWRhYzogZXhwbGljaXRseSBhZGQgcHJvcGVy
IGhlYWRlciBmaWxlcwo+ICAgaWlvOiBkYWM6IHZmNjEwX2RhYzogZXhwbGljaXRseSBhZGQgcHJv
cGVyIGhlYWRlciBmaWxlcwo+ICAgaWlvOiBodW1pZGl0eTogaHRzMjIxX2J1ZmZlcjogZXhwbGlj
aXRseSBhZGQgcHJvcGVyIGhlYWRlciBmaWxlcwo+ICAgaWlvOiBsaWdodDogY3Jvc19lY19saWdo
dF9wcm94OiBleHBsaWNpdGx5IGFkZCBwcm9wZXIgaGVhZGVyIGZpbGVzCj4gICBpaW86IHByZXNz
dXJlOiBjcm9zX2VjX2Jhcm86IGV4cGxpY2l0bHkgYWRkIHByb3BlciBoZWFkZXIgZmlsZXMKPiAg
IGlpbzogdHJpZ2dlcjogc3RtMzItbHB0aW1lci10cmlnZ2VyOiBleHBsaWNpdGx5IGFkZCBwcm9w
ZXIgaGVhZGVyCj4gICAgIGZpbGVzCj4gICBpaW86IGNvcmU6IGRyb3Agb2YuaCBmcm9tIGlpby5o
Cj4gICBpaW86IGlua2Vybjogb25seSByZWxhc2UgdGhlIGRldmljZSBub2RlIHdoZW4gZG9uZSB3
aXRoIGl0Cj4gICBpaW86IGlua2VybjogZml4IHJldHVybiB2YWx1ZSBpbiBkZXZtX29mX2lpb19j
aGFubmVsX2dldF9ieV9uYW1lKCkKPiAgIGlpbzogaW5rZXJuOiBvbmx5IHJldHVybiBlcnJvciBj
b2RlcyBpbiBpaW9fY2hhbm5lbF9nZXRfKigpIEFQSXMKPiAgIGlpbzogaW5rZXJuOiBzcGxpdCBv
Zl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZSgpCj4gICBpaW86IGlua2VybjogbW92ZSB0byBmd25v
ZGUgcHJvcGVydGllcwo+ICAgdGhlcm1hbDogcWNvbTogcWNvbS1zcG1pLWFkYy10bTU6IGNvbnZl
cnQgdG8gSUlPIGZ3bm9kZSBBUEkKPiAgIGlpbzogYWRjOiBpbmdlbmljLWFkYzogY29udmVydCB0
byBJSU8gZndub2RlIGludGVyZmFjZQo+ICAgaWlvOiBhZGM6IGFiODUwMC1ncGFkYzogY29udmVy
dCB0byBkZXZpY2UgcHJvcGVydGllcwo+ICAgaWlvOiBhZGM6IGF0OTEtc2FtYTVkMl9hZGM6IGNv
bnZlcnQgdG8gZGV2aWNlIHByb3BlcnRpZXMKPiAgIGlpbzogYWRjOiBxY29tLXBtOHh4eC14b2Fk
YzogY29udmVydCB0byBkZXZpY2UgcHJvcGVydGllcwo+ICAgaWlvOiBhZGM6IHFjb20tc3BtaS12
YWRjOiBjb252ZXJ0IHRvIGRldmljZSBwcm9wZXJ0aWVzCj4gICBpaW86IGFkYzogcWNvbS1zcG1p
LWFkYzU6IGNvbnZlcnQgdG8gZGV2aWNlIHByb3BlcnRpZXMKPiAgIGlpbzogYWRjOiBzdG0zMi1h
ZGM6IGNvbnZlcnQgdG8gZGV2aWNlIHByb3BlcnRpZXMKPiAgIGlpbzogaW5rZXJuOiByZW1vdmUg
T0YgZGVwZW5kZW5jaWVzCj4gICBpaW86IGlua2VybjogZml4IGNvZGluZyBzdHlsZSB3YXJuaW5n
cwo+Cj4gIGRyaXZlcnMvaWlvL2FkYy9hYjg1MDAtZ3BhZGMuYyAgICAgICAgICAgICAgICB8ICAy
NyArLQo+ICBkcml2ZXJzL2lpby9hZGMvYWQ3NjA2LmMgICAgICAgICAgICAgICAgICAgICAgfCAg
IDEgKwo+ICBkcml2ZXJzL2lpby9hZGMvYWQ3NjA2X3Bhci5jICAgICAgICAgICAgICAgICAgfCAg
IDEgKwo+ICBkcml2ZXJzL2lpby9hZGMvYXQ5MS1zYW1hNWQyX2FkYy5jICAgICAgICAgICAgfCAg
MzAgKy0tCj4gIGRyaXZlcnMvaWlvL2FkYy9iZXJsaW4yLWFkYy5jICAgICAgICAgICAgICAgICB8
ICAgMiArCj4gIGRyaXZlcnMvaWlvL2FkYy9pbXg3ZF9hZGMuYyAgICAgICAgICAgICAgICAgICB8
ICAgMSArCj4gIGRyaXZlcnMvaWlvL2FkYy9pbXg4cXhwLWFkYy5jICAgICAgICAgICAgICAgICB8
ICAgMSArCj4gIGRyaXZlcnMvaWlvL2FkYy9pbmdlbmljLWFkYy5jICAgICAgICAgICAgICAgICB8
ICAgOSArLQo+ICBkcml2ZXJzL2lpby9hZGMvbXAyNjI5X2FkYy5jICAgICAgICAgICAgICAgICAg
fCAgIDEgKwo+ICBkcml2ZXJzL2lpby9hZGMvbXQ2MzYwLWFkYy5jICAgICAgICAgICAgICAgICAg
fCAgIDEgKwo+ICBkcml2ZXJzL2lpby9hZGMvbnBjbV9hZGMuYyAgICAgICAgICAgICAgICAgICAg
fCAgIDEgKwo+ICBkcml2ZXJzL2lpby9hZGMvcWNvbS1wbTh4eHgteG9hZGMuYyAgICAgICAgICAg
fCAgNTggKystLS0KPiAgZHJpdmVycy9paW8vYWRjL3Fjb20tc3BtaS1hZGM1LmMgICAgICAgICAg
ICAgIHwgIDYzICsrKy0tCj4gIGRyaXZlcnMvaWlvL2FkYy9xY29tLXNwbWktdmFkYy5jICAgICAg
ICAgICAgICB8ICA0NCArKy0tCj4gIGRyaXZlcnMvaWlvL2FkYy9yemcybF9hZGMuYyAgICAgICAg
ICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvaWlvL2FkYy9zdG0zMi1hZGMuYyAgICAgICAg
ICAgICAgICAgICB8IDEyOCArKysrKy0tLS0tCj4gIC4uLi9jcm9zX2VjX3NlbnNvcnMvY3Jvc19l
Y19saWRfYW5nbGUuYyAgICAgICB8ICAgMSArCj4gIC4uLi9jb21tb24vY3Jvc19lY19zZW5zb3Jz
L2Nyb3NfZWNfc2Vuc29ycy5jICB8ICAgMSArCj4gIGRyaXZlcnMvaWlvL2RhYy9zdG0zMi1kYWMu
YyAgICAgICAgICAgICAgICAgICB8ICAgMiArCj4gIGRyaXZlcnMvaWlvL2RhYy92ZjYxMF9kYWMu
YyAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvaWlvL2h1bWlkaXR5L2h0czIy
MV9idWZmZXIuYyAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvaWlvL2lua2Vybi5jICAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDI0MSArKysrKysrKystLS0tLS0tLS0KPiAgZHJpdmVycy9p
aW8vbGlnaHQvY3Jvc19lY19saWdodF9wcm94LmMgICAgICAgIHwgICAxICsKPiAgZHJpdmVycy9p
aW8vcHJlc3N1cmUvY3Jvc19lY19iYXJvLmMgICAgICAgICAgIHwgICAxICsKPiAgZHJpdmVycy9p
aW8vdHJpZ2dlci9zdG0zMi1scHRpbWVyLXRyaWdnZXIuYyAgIHwgICAxICsKPiAgZHJpdmVycy90
aGVybWFsL3Fjb20vcWNvbS1zcG1pLWFkYy10bTUuYyAgICAgIHwgICAzICstCj4gIGluY2x1ZGUv
bGludXgvaWlvL2NvbnN1bWVyLmggICAgICAgICAgICAgICAgICB8ICAyOCArLQo+ICBpbmNsdWRl
L2xpbnV4L2lpby9paW8uaCAgICAgICAgICAgICAgICAgICAgICAgfCAgIDkgKy0KPiAgMjggZmls
ZXMgY2hhbmdlZCwgMzQ3IGluc2VydGlvbnMoKyksIDMxMiBkZWxldGlvbnMoLSkKPgo+IC0tCj4g
Mi4zNi4xCj4KCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
