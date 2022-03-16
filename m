Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6389BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 10:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZaebdO9T/8rCIsmbCMmqqGHxxq06Lc5ryStJO+IXUwE=; b=xeR7HtK0xqnKgC
	Xhm+VU2jFSpJ1/MdSpJiCzRF+G6AH9KK59yWns0Fb4EQxRgYHxUE3uQu5Pz5HON1JwaHByk45FJUY
	k4yWZHuxVaxhqp4D8TGcMcFRIXvqhxzE/tt4HXfMcCGpHqAmp7DuhXak2DGufKigeMYeiHsC5MznW
	PHEPj5rWxnPxXI1WgPmOfwvpIHXl0EelLKoD4ZmHZu2rpnC3Np/GXoLAw9FPkYedFfCDe/NdECFKf
	XzopqosY1DTCfX1jA0eFNHgQ99YkaK6X9UH17z00IdyeaoI3xl0H8kSU9Zs02FbO3xo7uzFg3JneL
	Fm/sIBg1/t0wOMGdl9LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUR54-00CVQw-HF; Wed, 16 Mar 2022 10:40:38 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUR4r-00CVNj-T6; Wed, 16 Mar 2022 10:40:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B255E1F4440A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647427222;
 bh=6HfrXX6kj8MJICTuM+ecnk15KUT574Z69o6G90jNQS8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IB8kfAy1h7y3n32fNOTs9ePoDLrvI3c5Hf412n+cTcSTTassKABkYo97j2exYIvji
 x7ANB9jdE6pPVFVQ4dvsyyuEQ3IIIeBIYfAqhhZMJLxDDFMQAeZRepNJmEDzfA8DN0
 d3kbzLQimiZjwhPZaU3vWxJslT5lw6bDu+I54oiEu03PkDdHZHFutjd3eF10Nu/423
 Xv+5iofl+b+Zpir7bzh+/Ma6wRQa9/O/nAnYkEaOznIOo+WhzvLIfya+NfroIJ0yjk
 wC6dq+VgYiOHu0PFXjRGPKaeedJj3JCkcGe/ONx5hkAd8d7TDAryVuj7sVrYZaZoaf
 15yHMQP3b6+8A==
Message-ID: <e4b16e67-ccb5-78d1-bbbb-a4a7f82b7c11@collabora.com>
Date: Wed, 16 Mar 2022 11:40:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 1/2] drm: mediatek: mtk_drm_plane: Use kmalloc in
 mtk_plane_duplicate_state
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Collabora Kernel ML <kernel@collabora.com>
References: <20220118133759.112458-1-angelogioacchino.delregno@collabora.com>
 <CAAOTY__59-tYZNAQqFytdZgAYs+hmFxHUrF1FAj4zphiguv12g@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAAOTY__59-tYZNAQqFytdZgAYs+hmFxHUrF1FAj4zphiguv12g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_034026_155464_F7A7C6A9 
X-CRM114-Status: GOOD (  12.64  )
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

SWwgMjUvMDEvMjIgMTc6MzYsIENodW4tS3VhbmcgSHUgaGEgc2NyaXR0bzoKPiBIaSwgQW5nZWxv
R2lvYWNjaGlubzoKPiAKPiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNj
aGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPiDmlrwKPiAyMDIy5bm0MeaciDE45pelIOmAseS6
jCDkuIvljYg5OjM45a+r6YGT77yaCj4+Cj4+IFRoZXJlIGlzIG5vIG5lZWQgdG8gemVybyBvdXQg
dGhlIG5ld2x5IGFsbG9jYXRlZCBtZW1vcnkgYmVjYXVzZSB3ZSBhcmUKPj4gZHVwbGljYXRpbmcg
YWxsIG1lbWJlcnMgb2Ygc3RydWN0IG10a19wbGFuZV9zdGF0ZTogc3dpdGNoIHRvIGttYWxsb2MK
Pj4gdG8gc2F2ZSBzb21lIG92ZXJoZWFkLgo+IAo+IFJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1
IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiAKPj4KPj4gU2lnbmVkLW9mZi1ieTogQW5nZWxv
R2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3Jh
LmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUu
YyB8IDIgKy0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPj4KCkhlbGxvLAoKdGhpcyBzZXJpZXMgd2FzIHNlbnQgYW5kIHJldmlld2VkIHR3byBtb250
aHMgYWdvLCBidXQgaXQgaGFzbid0IGJlZW4gcGlja2VkCmluIGFueSBtYWludGFpbmVyIHRyZWUu
CgpUaGlzIGlzIGEgZnJpZW5kbHkgcGluZyB0byBub3QgbGV0IHRoZXNlIHR3byBwYXRjaGVzIHRv
IGJlIGxvc3QgYW5kIGZvcmdvdHRlbi4KCkNoZWVycywKQW5nZWxvCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
