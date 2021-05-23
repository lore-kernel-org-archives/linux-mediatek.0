Return-Path: <SRS0=uBnB=KS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B27C47080
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 May 2021 12:18:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 539DC6135A
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 May 2021 12:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 539DC6135A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VeiH4motxn0crANzSVooiDhe8+Nq/45mtoFbxeFyutQ=; b=VURaabvT/0JKVDAqBYG8wSUtg9
	bdnpk/udIscyRGQTGieRQ2J7cGi8WttSBIb4xo3dFvL4Ohe+aANRrpa7XOXcz7seWUY/UIqxdjPoh
	e1MrtSqdNnyyRmPCX/+Le+SB+f3Q8ZlCJcDcx8VzF5d7NOLxOkOr109szxie/sqz4xc4WU1VSv1GC
	2sDWL/4l6Sisw+5MGp8ERHCPFEs4RsKkHkl+zC0/gTIItiUiEW9+DWJ3Pr4hZcykCvLR5tOBileTu
	VUOBJrlsGTpWxAjhCZlhtm4yeTah7aukuoy5k3vnvU7VXicTwzKT3xz2tyMvriRVc9PyxJkjyBAz4
	9YSuYIOQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkn3I-004NDp-BI; Sun, 23 May 2021 12:17:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkn2k-004NAl-7n; Sun, 23 May 2021 12:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=3tzEvnJ635tC2Suexfcwo2/SMYwrMnTRuJbRrXUefrg=; b=Hiv4tcLL+u7Q0sG76H6hmDA9Sr
 6Qy46PcVRpzo3XJa/H3Jv28xq1TJ92b3hX2bjsZko1pyCCwEKTh4NlQnxPAHbZjqYUslx6QeqCAjh
 QEr1CFOm26lkFak9FR3ncuijiyNwammc4gl9k0ZWFYl26ah9IrF+PyBq/8Boitk/53kj4yzTbTPCA
 caGTeyENY68Jd5T7AZaegmGsQPZNQ8T5zOZmby1HOvokdJatVv61XB9hFgkAu7QHB8+3Q7W1BL7v7
 HNh/1XzbrM9zDlHcTcrMj4p22zDH4rLUDhUI2ykOLdFq/8cGsRgtvpT7aeAym7WVvQsXk369w1BxI
 OZ7SGDSg==;
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkn2h-000R1N-Lc; Sun, 23 May 2021 12:17:17 +0000
Received: by mail-ed1-x534.google.com with SMTP id a25so28636383edr.12;
 Sun, 23 May 2021 05:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3tzEvnJ635tC2Suexfcwo2/SMYwrMnTRuJbRrXUefrg=;
 b=qLzt2Q8zgmZbiflD5+5P7ElMN2z5A5uPW8NRXtteO4uyLUUDRrn2IKkRaMvKWKF65W
 1cfWZUBsHQFj1InumAA50YINqUE+1gGMQa6vawhc32wnMK1JPFqy+ZWs+yK3N/lhIrZB
 tFzU7CEWgebc10cYE5ViNhI9KqJ0BhAzNgASIXHqW9Pvbic5Mbf7n+1hTPPnGTy2gyoF
 KIpNNID+LMnrZr9hOeF1GqZZFlAGZkUq4n5yICVxd5jeKSPa46Y9ikqlIlB9JT7xuTyE
 P+9+6vpZcRqQG7UUVVCq9WhiE6nWh3BKUbJrAhmJbHLt2xZ+1Xri6sMQDKQymr2NNUCG
 TF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3tzEvnJ635tC2Suexfcwo2/SMYwrMnTRuJbRrXUefrg=;
 b=jE+qzMz3v9e9kQMqW6QEaABMVHQjW0MWeE7PylhfDahMwH26pHDdla3r2xhpDAH5lH
 1nqjutB/yLA/aAML2R0hKnw+/SqpdWZUMvjpZHWNlZcXD+HdVHgCLBznCk3EpMGbLA9e
 Kkf3fmYvtKYzWFWkImMR99CTrKQAxT4Zg5ypkecWpBtYLtPcNYJldqAky7p/gDgPlYyW
 X88T6bi187iRh9Tcrs/lEE1tT4UcjwxyWjPmBS0ONV8d3PoSFnNZhe4CDEM4TurCnkM6
 ekESASnuNIQJiLaGDfYraHIF8Uh/UPL4Vj//zZYgSqeojtHdxtpe+9pmwQtRbkuEtwyh
 QsYA==
X-Gm-Message-State: AOAM5327ximwpDMDLEMZApE0X8nRMNfMfeVqz9Z4/vq0p0BuOwgvzRFG
 xbphB9hJGoJnm/OX52/Z5TxOeLm7EJtOX8mwNcg=
X-Google-Smtp-Source: ABdhPJwPxmA4JArahzruRum264WKfGGbHUJh6bex9S7VrYwga+yKcdKWZft9UnfQIVsWH4AZBM7E8wWiBet0Lx5Pf5o=
X-Received: by 2002:a50:fb17:: with SMTP id d23mr19981613edq.338.1621772233437; 
 Sun, 23 May 2021 05:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
In-Reply-To: <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 23 May 2021 14:17:02 +0200
Message-ID: <CAFBinCDXgjevHr9wRn8gQ8pJhiSpZb5A7ChhQqk17yK8Tooa3Q@mail.gmail.com>
Subject: Re: [PATCH 06/11] drm/<driver>: drm_gem_plane_helper_prepare_fb is
 now the default
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 NXP Linux Team <linux-imx@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Cercueil <paul@crapouillou.net>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomba@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_051715_764830_9A4D9822 
X-CRM114-Status: GOOD (  11.06  )
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

T24gRnJpLCBNYXkgMjEsIDIwMjEgYXQgMTE6MTAgQU0gRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4gd3JvdGU6Cj4KPiBObyBuZWVkIHRvIHNldCBpdCBleHBsaWNpdGx5Lgo+
Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+
Cj4gQ2M6IExhdXJlbnRpdSBQYWxjdSA8bGF1cmVudGl1LnBhbGN1QG9zcy5ueHAuY29tPgo+IENj
OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KPiBDYzogU2hhd24gR3VvIDxz
aGF3bmd1b0BrZXJuZWwub3JnPgo+IENjOiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9u
aXguZGU+Cj4gQ2M6IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJuZWxAcGVuZ3V0cm9uaXgu
ZGU+Cj4gQ2M6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KPiBDYzogTlhQIExp
bnV4IFRlYW0gPGxpbnV4LWlteEBueHAuY29tPgo+IENjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVs
QHBlbmd1dHJvbml4LmRlPgo+IENjOiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5l
dD4KPiBDYzogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gQ2M6IE1h
dHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+Cj4gQ2M6IE5laWwgQXJtc3Ry
b25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KPiBDYzogS2V2aW4gSGlsbWFuIDxraGlsbWFu
QGJheWxpYnJlLmNvbT4KPiBDYzogSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+
Cj4gQ2M6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFp
bC5jb20+Cj4gQ2M6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+IENjOiBTdGVmYW4gQWdu
ZXIgPHN0ZWZhbkBhZ25lci5jaD4KPiBDYzogU2FuZHkgSHVhbmcgPGhqY0Byb2NrLWNoaXBzLmNv
bT4KPiBDYzogIkhlaWtvIFN0w7xibmVyIiA8aGVpa29Ac250ZWNoLmRlPgo+IENjOiBZYW5uaWNr
IEZlcnRyZSA8eWFubmljay5mZXJ0cmVAZm9zcy5zdC5jb20+Cj4gQ2M6IFBoaWxpcHBlIENvcm51
IDxwaGlsaXBwZS5jb3JudUBmb3NzLnN0LmNvbT4KPiBDYzogQmVuamFtaW4gR2FpZ25hcmQgPGJl
bmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+Cj4gQ2M6IE1heGltZSBDb3F1ZWxpbiA8bWNvcXVl
bGluLnN0bTMyQGdtYWlsLmNvbT4KPiBDYzogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRv
cmd1ZUBmb3NzLnN0LmNvbT4KPiBDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3Jn
Pgo+IENjOiBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+Cj4gQ2M6IEplcm5laiBTa3JhYmVj
IDxqZXJuZWouc2tyYWJlY0BnbWFpbC5jb20+Cj4gQ2M6IEp5cmkgU2FyaGEgPGp5cmkuc2FyaGFA
aWtpLmZpPgo+IENjOiBUb21pIFZhbGtlaW5lbiA8dG9tYmFAa2VybmVsLm9yZz4KPiBDYzogbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LW1pcHNAdmdlci5r
ZXJuZWwub3JnCj4gQ2M6IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzog
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LXJvY2tjaGlwQGxp
c3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQo+IENjOiBsaW51eC1zdW54aUBsaXN0cy5saW51eC5kZXYKPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2lteC9kY3NzL2Rjc3MtcGxhbmUuYyAgICAgICB8IDEgLQo+ICBkcml2ZXJzL2dw
dS9kcm0vaW14L2lwdXYzLXBsYW5lLmMgICAgICAgICAgIHwgMSAtCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9pbmdlbmljL2luZ2VuaWMtZHJtLWRydi5jICAgfCAxIC0KPiAgZHJpdmVycy9ncHUvZHJtL2lu
Z2VuaWMvaW5nZW5pYy1pcHUuYyAgICAgICB8IDEgLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9wbGFuZS5jICAgIHwgMSAtCj4gIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNv
bl9vdmVybGF5LmMgICAgICAgfCAxIC0KPiAgZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3Bs
YW5lLmMgICAgICAgICB8IDEgLQpGb3IgZHJpdmVycy9ncHUvZHJtL21lc29uLyo6CkFja2VkLWJ5
OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
