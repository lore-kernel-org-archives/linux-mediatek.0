Return-Path: <SRS0=VEyR=IR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F9D6C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 12:50:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 298F464E5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 12:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 298F464E5B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l7jGmVW7sjS08R30PNRugMpNalx3dQwNQI9fkUyWqQc=; b=kdR27p88FZa5of5WU1DhfhDwr
	PrgNNi9nEEQa8/+r395qSsUzade5Mg8q/xnRLkrh6cq/ofqOM8gTejOQO9MGB/y1AMxvq0SI6cSbB
	Gf9zfM6Qjrec2RIe4+kjAjlCdeQFCnPgTPOcjSSo0FydA9qT558Lj2u4xZUMTNj4wHkgNjK+dV78h
	V5P6XgP6pvB9N9sa4uMBhy7FfP5Clz87Kn1VkJbSN+X6cOTmkkV3AHzEfh2glLfFMR6y+/7mUs021
	kmDhnBYkGZeTQ7zEuPzcpFqfONJtrKVaM2i+MMe7j0g0yT6K8kU0xXUxkb8rw/xXOm4VA6A9PD5cq
	DW3sHkzVA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNEa8-007QKY-Ue; Fri, 19 Mar 2021 12:50:25 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNEY0-007QCg-II; Fri, 19 Mar 2021 12:50:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616158048;
 bh=ot4zJ0YuFv09BC6CagdPaeT+OYONcIZl47TymXx88oU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=f2qapYJzSWlVnyvJLaAEjGu/FV4sjedoiWHftbP1ZK7Gk+ZUs8z8bM8PryEAa2t91
 RqC617lRde/Mx/5xQ1AKL7fIewqxAd1AerVJiZaMNiZww69TJYDMSzT8yfhLnF1l49
 K61lNQomEGcuP7B61+1TmanY8gFp6JVCWz14WRl4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.73.76] ([80.245.73.76]) by web-mail.gmx.net
 (3c-app-gmx-bs45.server.lan [172.19.170.97]) (via HTTP); Fri, 19 Mar 2021
 13:47:28 +0100
MIME-Version: 1.0
Message-ID: <trinity-9ff2d2c2-6be1-415f-bf29-a04849cb74dc-1616158048677@3c-app-gmx-bs45>
From: Frank Wunderlich <frank-w@public-files.de>
To: =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>, Ilya Lipnitskiy
 <ilya.lipnitskiy@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao
 <Landen.Chao@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot
 <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Russell
 King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, sander@svanheule.net,
 tsbogend@alpha.franken.de, john@phrozen.org
Subject: Aw: Re: [PATCH net,v2] net: dsa: mt7530: setup core clock even in
 TRGMII mode
Date: Fri, 19 Mar 2021 13:47:28 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20210319102555.Horde.jeA-oYm4tfkVqKj-gnqxRoo@www.vdorst.com>
References: <20210311012108.7190-1-ilya.lipnitskiy@gmail.com>
 <20210312080703.63281-1-ilya.lipnitskiy@gmail.com>
 <20210319102555.Horde.jeA-oYm4tfkVqKj-gnqxRoo@www.vdorst.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:/JAMS70hSO9E7auBQoy+PTUBMdwWO0tyCT8wAfsetNDbfDHgPvU7tbc0r0PIuEcowSMgT
 xTdjSvHjU16y6W89NE74x/aTprgLupH69qoBxMeFaV3fxUz6dPgECWZIcSwrYEqaGVQjhUIGgen2
 yZoxPW6KanP0jFrsJLWk94/LB83i9oL+xiqbnHmQYvsypCj3IQQsSf5QC2NU6iwACnAsqG2e8wVI
 p+RgMx9cCprlXwfE25xKX5WMS0jqdqbZC6yO6g2ixNbmmFMxWFGT0YLl4n0j0p9jwObtc5FwJHID
 dE=
X-UI-Out-Filterresults: notjunk:1;V03:K0:jOGlQcFy+kU=:0RPXl9xNbwbLzaRkWYWvlA
 iHmSaOHaEx/n24sZPVQK+3za81nbBWRMt8bL4GfZWl0fTSpbdwap1u15g4enG+fDzOwZL+2im
 JndOB1gK5wOCV96G5RbNjJfkxwtmfuTRJWpOBt9Ry2hLQzvsH5HwdnssvCwXHN44skvdAtfkT
 urZf+luh5EpSOYjDoub+pYUvWgB3fZq130rHtN2zdBjYEJpZfmsP5MOAWo0H+XKS/7ZGxbU4t
 DH9mcwqE1O00ZiKFhCSRsfpOOAAEm5h74nv1d9GA8wi8oLVgz5wAvExSGeIY7rWUq3RKQIKkR
 gX7RvqY1U7ieBtl4f5KAnUyfvqNv8im/zWMHCM3ZkXn4LPyyVv06gYBfwBy5Y7sGvUEqT7AIB
 QrMKBHQyzV8OOVLSk+9ox7TbwODwajKYf1xg3XdTLTxnYTTiGkruLkCli4vOZoi1J4CqCVWyd
 M5Mtp8U4NSI/nLTwPOcvXs0HPQidXhU9O+iC5TonQUTQdVQcKKQyJwfATy7Ia+gPU9HfdkWeq
 95VZ6WhTnMAFoeCF7MjIBsRhLihKFzRusKsL/5xcpRhpv0rwXPnIJoa6ya7pgiYfJ6RJiTPVx
 sfvJUiNdRLfVWJ0UwuiFA2o1qaoTpzRzjKyXaHWN9wNM9NlU24UUCxbJrA4RuXO31dpyr7JI7
 6uEr0ZfyG+5f+1iyMGL3PXWcRPj9uwRDFuewZf4Kxgf/7GGNsHNXGmzB5IbMz4u+YMPMZoVjl
 dN+XI5nrO9T7PJ8zK7OpDDQ6e3VzBN52hAIeB+tcyYsJ0zsXUqrdhzOe09EOd+hYTIi75XHJQ
 WIp6lUDrdtvDUUkwOcHK4nrzpUsXFb0r9lsO/YY63KrNiKf9m5ILXKZ7G/tQwbFEqkYg3/exk
 p6agWNQx4yb8Nt6WbZ5ZJVYPy1Z3r3HACdF4c+Dul+s7mp3nosQ+9pCthjXjHPIm4aOdVDeFf
 JbYlzXRD9tw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_125012_815524_40E787E8 
X-CRM114-Status: GOOD (  12.29  )
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

SGkgUmVuw6ksSWx5YQoKPiBHZXNlbmRldDogRnJlaXRhZywgMTkuIE3DpHJ6IDIwMjEgdW0gMTE6
MjUgVWhyCj4gVm9uOiAiUmVuw6kgdmFuIERvcnN0IiA8b3BlbnNvdXJjZUB2ZG9yc3QuY29tPgo+
IEhpIElseWEsCj4gCj4gVGhhbmtzIGZvciBmaXhpbmcgdGhpcyBpc3N1ZS4KPiAKPiBJIHJlbWVt
YmVyIHRoYXQgRnJhbmsgYWxzbyBoYWQgYW4gaXNzdWUgd2l0aCBUUkdNSUkgb24gaGlzIE1UNzYy
MyBBUk0gYm9hcmQuCj4gSSBuZXZlciBmb3VuZCB3aHkgaXQgZGlkIG5vdCB3b3JrIGJ1dCB0aGlz
IG1heSBiZSBhbHNvIGZpeCBoaXMgaXNzdWUgIAo+IG9uIHRoZSBNVDc2MjMgZGV2aWNlcy4KPiAK
PiBBZGRlZCBGcmFuayB0byBDQy4KCnRoYW5rcyBmb3IgcG9pbnRpbmcgbWUgaGVyZS4gbXkgaXNz
dWUgd2FzIGFmdGVyIGdldHRpbmcgdHJnbWlpIHdvcmtpbmcgd2l0aCBwaHlsaW5rLXBhdGNoZXMg
KDUuMykgdGhhdCBpIG9ubHkgZ290IG9ubHkgOTQwTWJpdCBvdmVyIHRoZSBzd2l0Y2gvZ21hYzAg
KHVzaW5nIG11bHRpcGxlIGNsaWVudHMgdG8gb25lIGlwZXJmMy1zZXJ2ZXIpLCB0cmdtaWkgYWZh
aXIgc3VwcG9ydHMgfjIuMSBHYml0L3MsIHNvIG5lYXJseSB0d2ljZSBiYW5kd2lkdGggcG9zc2li
bGUgaW4gdGhlb3J5LiB0aGlzIG1heWJlIGNhbiBjbG9jay1yZWxhdGVkCgpJJ20gbm90IHN1cmUg
aWYgaXQgaXMgdGhlIHNhbWUgaXNzdWUgaWx5YSBmaXhlcyBoZXJlLCBidXQgaSB0cnkgdG8gdGVz
dCB0aGlzIG9uIG15IGJhbmFuYXBpLXIyCgpyZWdhcmRzIEZyYW5rCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
