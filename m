Return-Path: <SRS0=/i6S=ZZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30207C432C3
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 13:26:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0791E2073B
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 13:26:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eb2IRHAO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="igkQQe78"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0791E2073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CWztfkag5CTXzpaa0LnBcJtkweQBzRxGSZZ4OenFYN8=; b=eb2IRHAOvFmlgk
	tNmMlCvlcr4+5wU+Qrb5SoP3EZM8XZD7zNd/UmHwdpcMSZVXOGeG31ZOjyrGopyfEumNsvZkeZnk5
	+W2eWeYpyD3G5gTsZ3Z23UO/BKWy3+7rptF/xyhIDEv/DbX2WCnPiLv51+ynJK2rZAmvFPzuSol8I
	ilj/FpyS+IYnnZvjh+7f3PopC1RIkP7HrJ5Dr8qE2mB42g3LmFufG/VoxheuFJY9ukJvzO9JHRmXs
	rmxKvFZXJOIALNBpH7qjcNSFTHH99LS6pveRucFwYnlv8AJWyG8m2rUH505Zhip+OALjo7biA++Wz
	hSd/tv7WbNpb6mIiPABg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic8Cf-0000LK-Lv; Tue, 03 Dec 2019 13:26:57 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic8Cc-0000K5-Cj
 for linux-mediatek@lists.infradead.org; Tue, 03 Dec 2019 13:26:56 +0000
Received: by mail-lf1-x142.google.com with SMTP id f16so2969495lfm.3
 for <linux-mediatek@lists.infradead.org>; Tue, 03 Dec 2019 05:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KgNg5NNZGR0exGpYVHoss0gt+wdaKyNS8ghAP3VHhsg=;
 b=igkQQe78pMODNDUT8UJdAPTI3XPGUsbvE7Z0opW/4i+YxWrghvsSkBxmC/Tg4MAZQg
 u5ZCPeygt2VJ078TncPJqyerJr+k4NUeqCpp7Dh0OBHp8gjo3k/DsH8Gr5VBesqs75a8
 E65Uzd9tnumQ0HmJBFOkIjpsE+qiAiBGNBWizShXH0BbhJI+OxD2k4x0VqoRCnn9RbFa
 ZgG6GyycqKiJ/HgewELwsHSwS1T7Fqca13xC4y9rCOnm72R0g4bAA3zklkZX8aF4tMoa
 yUOVp/SKpaE9qzr5p2jCe2+z5C1ENiqT8IY/mK0+zIndY7yy1I//Hzhfrt1rLvU8FUDS
 bmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KgNg5NNZGR0exGpYVHoss0gt+wdaKyNS8ghAP3VHhsg=;
 b=qA5LC7uqOqkeq7vzBJ8ERrCUFwya8hscojykOpetiz/4Vw+1OYHlWu1HPlNfcuA4GQ
 j3RhxcINmwlIvzdpZK/4flFZ2dpl3WdlQSWlUxcb3BhlnFr+PX7GaH65B4NorSGISSD+
 ynieFfx+No44R4dwnI/n/D5snLsR+4/hbyewm9aeZ40zVsdcZO7JFvLIcNQfApqDe6bk
 rL//KGvN+w0aHqG8dvTLd3ZkpueyQlrJGlDXWFdMxtor6Cd3M+Okl8G2n4za9Q9o1xsp
 OPWFUeHMQpj8rYfTTpHh8ej3Ms53RQQqVMF+Dfytj/5E0KHdROZaR3IMLiPwoheeCaPN
 K5zw==
X-Gm-Message-State: APjAAAVO37OqusHevcoq0Ihl2yGfXE14sKbym/WJck1B+NmzImaqOE3P
 O8tOzJpKz1dG+2j0KTV80rqAzEyPHa0B488YSfu14A==
X-Google-Smtp-Source: APXvYqzpK5xVCXuWnpb6zuvLbpHseb2a4Nv0GYrRiK24+O1ab7jDScclek+59Vfvj4nYCDMcLN7eKeirkaGez7A3MBw=
X-Received: by 2002:a19:c84:: with SMTP id 126mr2719867lfm.5.1575379612995;
 Tue, 03 Dec 2019 05:26:52 -0800 (PST)
MIME-Version: 1.0
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-7-sam@ravnborg.org>
In-Reply-To: <20191202193230.21310-7-sam@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 3 Dec 2019 14:26:41 +0100
Message-ID: <CACRpkdaCgWu2ZhHc2L=bVW8S4V+omaZZhitpSKE4n0y4J6bdQQ@mail.gmail.com>
Subject: Re: [PATCH v1 06/26] drm/panel: decouple connector from drm_panel
To: Sam Ravnborg <sam@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191203_052654_463936_B413B6CC 
X-CRM114-Status: GOOD (  15.77  )
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
Cc: Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Vincent Abriou <vincent.abriou@st.com>, Allison Randal <allison@lohutok.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Chen-Yu Tsai <wens@csie.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jagan Teki <jagan@amarulasolutions.com>, Rob Clark <robdclark@chromium.org>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Brian Masney <masneyb@onstation.org>, Maxime Ripard <mripard@kernel.org>,
 Inki Dae <inki.dae@samsung.com>, Alexios Zavras <alexios.zavras@intel.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Purism Kernel Team <kernel@puri.sm>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Shayenne Moura <shayenneluzmoura@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Kukjin Kim <kgene@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <seanpaul@chromium.org>, Icenowy Zheng <icenowy@aosc.io>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBEZWMgMiwgMjAxOSBhdCA4OjMzIFBNIFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4gd3JvdGU6Cgo+IFRvIGZhY2lsaXRhdGUgdGhhdCBjb25uZWN0b3IgY3JlYXRpb24gd2ls
bCBiZSBtb3ZlZAo+IHRvIGRpc3BsYXkgZHJpdmVycywgZGVjb3VwbGUgdGhlIGRybV9jb25uZWN0
b3IgZnJvbSBkcm1fcGFuZWwuCj4gQWRkIGEgY29ubmVjdG9yIGFyZ3VtZW50IHRvIGRybV9wYW5l
bF9nZXRfbW9kZXMoKQo+Cj4gQWxsIHVzZXJzIG9mIGRybV9wYW5lbF9nZXRfbW9kZXMoKSBhbHJl
YWR5IGhhZCB0aGUgY29ubmVjdG9yCj4gYXZhaWxhYmxlLCBzbyB1cGRhdGluZyB1c2VycyB3YXMg
dHJpdmlhbC4KPgo+IFdpdGggdGhpcyBwYXRjaCBkcm1fcGFuZWwgbm8gbG9uZ2VyIGtlZXAgYSBj
b3B5IG9mIHRoZSBkcm1fY29ubmVjdG9yLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3Jn
IDxzYW1AcmF2bmJvcmcub3JnPgo+IENjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdA
Z21haWwuY29tPgo+IENjOiBMYXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50LnBpbmNoYXJ0QGlkZWFz
b25ib2FyZC5jb20+Cj4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzog
QW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KPiBDYzogTmVpbCBBcm1zdHJvbmcg
PG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgo+IENjOiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2li
b28uc2U+Cj4gQ2M6IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BzaW9sLm5ldD4KPiBD
YzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4K
PiBDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgo+IENjOiBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KPiBDYzogSW5raSBEYWUgPGlua2kuZGFlQHNhbXN1bmcuY29tPgo+IENjOiBKb29ueW91bmcg
U2hpbSA8ankwOTIyLnNoaW1Ac2Ftc3VuZy5jb20+Cj4gQ2M6IFNldW5nLVdvbyBLaW0gPHN3MDMx
Mi5raW1Ac2Ftc3VuZy5jb20+Cj4gQ2M6IEt5dW5nbWluIFBhcmsgPGt5dW5nbWluLnBhcmtAc2Ft
c3VuZy5jb20+Cj4gQ2M6IEt1a2ppbiBLaW0gPGtnZW5lQGtlcm5lbC5vcmc+Cj4gQ2M6IEtyenlz
enRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KPiBDYzogU3RlZmFuIEFnbmVyIDxzdGVm
YW5AYWduZXIuY2g+Cj4gQ2M6IEFsaXNvbiBXYW5nIDxhbGlzb24ud2FuZ0BueHAuY29tPgo+IENj
OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgo+IENjOiBTaGF3biBHdW8g
PHNoYXduZ3VvQGtlcm5lbC5vcmc+Cj4gQ2M6IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRy
b25peC5kZT4KPiBDYzogUGVuZ3V0cm9uaXggS2VybmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25p
eC5kZT4KPiBDYzogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgo+IENjOiBOWFAg
TGludXggVGVhbSA8bGludXgtaW14QG54cC5jb20+Cj4gQ2M6IENLIEh1IDxjay5odUBtZWRpYXRl
ay5jb20+Cj4gQ2M6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+Cj4g
Q2M6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+IENjOiBUb21pIFZhbGtlaW5lbiA8dG9t
aS52YWxrZWluZW5AdGkuY29tPgo+IENjOiBLaWVyYW4gQmluZ2hhbSA8a2llcmFuLmJpbmdoYW0r
cmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgo+IENjOiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hp
cHMuY29tPgo+IENjOiAiSGVpa28gU3TDvGJuZXIiIDxoZWlrb0BzbnRlY2guZGU+Cj4gQ2M6IEJl
bmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5hcm8ub3JnPgo+IENjOiBWaW5j
ZW50IEFicmlvdSA8dmluY2VudC5hYnJpb3VAc3QuY29tPgo+IENjOiBDaGVuLVl1IFRzYWkgPHdl
bnNAY3NpZS5vcmc+Cj4gQ2M6IEpvbmF0aGFuIEh1bnRlciA8am9uYXRoYW5oQG52aWRpYS5jb20+
Cj4gQ2M6IFRvcnN0ZW4gRHV3ZSA8ZHV3ZUBsc3QuZGU+Cj4gQ2M6IFZhc2lseSBLaG9ydXpoaWNr
IDxhbmFyc291bEBnbWFpbC5jb20+Cj4gQ2M6IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy5p
bz4KPiBDYzogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Cj4gQ2M6IExpbnVzIFdh
bGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiBDYzogQm9yaXMgQnJlemlsbG9uIDxi
b3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiBDYzogSGFyaXByYXNhZCBLZWxhbSA8aGFy
aXByYXNhZC5rZWxhbUBnbWFpbC5jb20+Cj4gQ2M6IEFsZXhpb3MgWmF2cmFzIDxhbGV4aW9zLnph
dnJhc0BpbnRlbC5jb20+Cj4gQ2M6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3Jn
Pgo+IENjOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4gQ2M6IFRob21hcyBH
bGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+IENjOiBBbGxpc29uIFJhbmRhbCA8YWxsaXNv
bkBsb2h1dG9rLm5ldD4KPiBDYzogU2hheWVubmUgTW91cmEgPHNoYXllbm5lbHV6bW91cmFAZ21h
aWwuY29tPgo+IENjOiBBYmhpbmF2IEt1bWFyIDxhYmhpbmF2a0Bjb2RlYXVyb3JhLm9yZz4KPiBD
YzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LXNhbXN1
bmctc29jQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCj4gQ2M6IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51
eC1yb2NrY2hpcEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LXRlZ3JhQHZnZXIua2Vy
bmVsLm9yZwoKVGhpcyBpcyBhIGdvb2QgcmVmYWN0b3JpbmcuIEl0IG1ha2VzIGl0IGVhc2llciB0
byB1bmRlcnN0YW5kCndoZXJlIHRoaW5ncyBiZWxvbmcuCgpSZXZpZXdlZC1ieTogTGludXMgV2Fs
bGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
