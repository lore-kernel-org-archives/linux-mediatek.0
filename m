Return-Path: <SRS0=GIYZ=KT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9EAFC04FF3
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 May 2021 22:09:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8233561425
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 May 2021 22:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8233561425
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jy3wUzgUtEJNJdgQlVS0nh1yc5Zbw/CPm2CtwIKDmA8=; b=bK4kNR8l6cpdYPITq5sgvziOu
	G7ICYdNvwuR/ZtSN9XXM4QoD1I1PyX+KHZSw3TyGApA4zk4awVuqlKGIVdh8Xt6D0ZUN6SoZM8frs
	WQ1igN3JZ9B/ipvBVOy8mDCPyQUEk3PJTPeh9K/p2ptGxx5xKhLTGIfQQDQvFj1oc64JkdDA/0dHL
	W8Rw//vD9CCPoYtBrrQaJ1cU7duFPMQlFPyv1gOh541EvbQVucLEd8Dvgc3SWAMmTkKt/5ujz7MUH
	S3/DNpQ33uJvmv1qf9s/0Ul6i7Ip2O+oa+JBmzgAB4sOPvkJJq+3jHFqYVNCMrY103agM1TVVlNzM
	tEnz2rvIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llIlW-0023nU-So; Mon, 24 May 2021 22:09:38 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll5QE-000kpq-NU; Mon, 24 May 2021 07:54:48 +0000
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi
 [91.157.208.71])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0ABD71315;
 Mon, 24 May 2021 09:54:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1621842878;
 bh=nQQLNOZHnWiuc9bVbNIPySsUX8BVfY7zKLqSjjjmqow=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=eP/n0p6WGzQZageTDgh+AhAcs/g5Ue1NYt36d3FWKJQJaTvUMj3hrq8+fQwTDYsqg
 Qiwo2GzlBbrg64RXzSwS8WGOPR2HHdLSIbrjQa3SmUmIPz8qikHGRXxlQgTdAuSvZD
 m5qtsfBYdKDyEA1AOMNDxtttFSFlN8wpwtRhKuuM=
Subject: Re: [PATCH 06/11] drm/<driver>: drm_gem_plane_helper_prepare_fb is
 now the default
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Cercueil
 <paul@crapouillou.net>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <71ba0c85-be5d-21f9-6817-9848dafde6ea@ideasonboard.com>
Date: Mon, 24 May 2021 10:54:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_005446_927223_B3B2C5A4 
X-CRM114-Status: GOOD (  11.87  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMjEvMDUvMjAyMSAxMjowOSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBObyBuZWVkIHRvIHNl
dCBpdCBleHBsaWNpdGx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiBMYXVyZW50aXUgUGFsY3UgPGxhdXJlbnRpdS5wYWxj
dUBvc3MubnhwLmNvbT4KPiBDYzogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+
Cj4gQ2M6IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz4KPiBDYzogU2FzY2hhIEhhdWVy
IDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPgo+IENjOiBQZW5ndXRyb25peCBLZXJuZWwgVGVhbSA8
a2VybmVsQHBlbmd1dHJvbml4LmRlPgo+IENjOiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFp
bC5jb20+Cj4gQ2M6IE5YUCBMaW51eCBUZWFtIDxsaW51eC1pbXhAbnhwLmNvbT4KPiBDYzogUGhp
bGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiBDYzogUGF1bCBDZXJjdWVpbCA8
cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Cj4gQ2M6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBr
ZXJuZWwub3JnPgo+IENjOiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29t
Pgo+IENjOiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gQ2M6IEtl
dmluIEhpbG1hbiA8a2hpbG1hbkBiYXlsaWJyZS5jb20+Cj4gQ2M6IEplcm9tZSBCcnVuZXQgPGpi
cnVuZXRAYmF5bGlicmUuY29tPgo+IENjOiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1
bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgo+IENjOiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5k
ZT4KPiBDYzogU3RlZmFuIEFnbmVyIDxzdGVmYW5AYWduZXIuY2g+Cj4gQ2M6IFNhbmR5IEh1YW5n
IDxoamNAcm9jay1jaGlwcy5jb20+Cj4gQ2M6ICJIZWlrbyBTdMO8Ym5lciIgPGhlaWtvQHNudGVj
aC5kZT4KPiBDYzogWWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQGZvc3Muc3QuY29tPgo+
IENjOiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAZm9zcy5zdC5jb20+Cj4gQ2M6IEJl
bmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5hcm8ub3JnPgo+IENjOiBNYXhp
bWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+Cj4gQ2M6IEFsZXhhbmRyZSBU
b3JndWUgPGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+Cj4gQ2M6IE1heGltZSBSaXBhcmQg
PG1yaXBhcmRAa2VybmVsLm9yZz4KPiBDYzogQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3JnPgo+
IENjOiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPgo+IENjOiBKeXJp
IFNhcmhhIDxqeXJpLnNhcmhhQGlraS5maT4KPiBDYzogVG9taSBWYWxrZWluZW4gPHRvbWJhQGtl
cm5lbC5vcmc+Cj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENj
OiBsaW51eC1taXBzQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENj
OiBsaW51eC1yb2NrY2hpcEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPiBDYzogbGludXgtc3VueGlAbGlzdHMubGludXgu
ZGV2Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vaW14L2Rjc3MvZGNzcy1wbGFuZS5jICAgICAg
IHwgMSAtCj4gICBkcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLXBsYW5lLmMgICAgICAgICAgIHwg
MSAtCj4gICBkcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS1kcnYuYyAgIHwgMSAt
Cj4gICBkcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWlwdS5jICAgICAgIHwgMSAtCj4g
ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jICAgIHwgMSAtCj4gICBk
cml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fb3ZlcmxheS5jICAgICAgIHwgMSAtCj4gICBkcml2
ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fcGxhbmUuYyAgICAgICAgIHwgMSAtCj4gICBkcml2ZXJz
L2dwdS9kcm0vbXhzZmIvbXhzZmJfa21zLmMgICAgICAgICAgIHwgMiAtLQo+ICAgZHJpdmVycy9n
cHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYyB8IDEgLQo+ICAgZHJpdmVycy9ncHUv
ZHJtL3N0bS9sdGRjLmMgICAgICAgICAgICAgICAgICB8IDEgLQo+ICAgZHJpdmVycy9ncHUvZHJt
L3N1bjRpL3N1bjRpX2xheWVyLmMgICAgICAgICB8IDEgLQo+ICAgZHJpdmVycy9ncHUvZHJtL3N1
bjRpL3N1bjhpX3VpX2xheWVyLmMgICAgICB8IDEgLQo+ICAgZHJpdmVycy9ncHUvZHJtL3N1bjRp
L3N1bjhpX3ZpX2xheWVyLmMgICAgICB8IDEgLQo+ICAgZHJpdmVycy9ncHUvZHJtL3RpZHNzL3Rp
ZHNzX3BsYW5lLmMgICAgICAgICB8IDEgLQo+ICAgMTQgZmlsZXMgY2hhbmdlZCwgMTUgZGVsZXRp
b25zKC0pCgpGb3IgdGlkc3M6CgpBY2tlZC1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2Vp
bmVuQGlkZWFzb25ib2FyZC5jb20+CgogIFRvbWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
