Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6753DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 08:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Kq/rpq58T6DPBxV6itCWczWNlr4MnGpat7z+69Y72g=; b=thkNtl/3KO4Gzp
	gd/wgfGnjv/2uLPh3U6MLnLySIlmKcdw9P2E81flnv9EuuGyOfL2ybWbxXbG95554BPUW+odUw4bM
	2pbSfoEzbVRl6SDq6OU3oi+iKHpmz05mMnoVs1DYV9GS1Ubrfrl0OrYt4+GKNAK2l5DUgvoUnApVo
	FbUC0ee/02azklDKY0LPMyBsI4qB5bWPmwGa1QgWIQue3aKb38+tz1bdY+t87+5H87VCmNyoG3kkG
	yocIrHRD4BSVWgvd4s24nEyT4rmx6MnMvVIiqaHoytXZBInY/Wb76KdPK7tlcemOm4IKHGRmWJAWe
	/nYUPVEdgYTrJzj5nAOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvatx-005wix-N7; Mon, 30 May 2022 08:37:25 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvatT-005wWc-T5; Mon, 30 May 2022 08:37:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: kholk11)
	with ESMTPSA id 1421C1F426C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1653899814;
	bh=QXMptDFhVLDAZ07/57pWnVM0NdwQo1qtAyHj2BDt4F8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n0xiApnA0e8UvIxSWTqERaumNNNm8/b06GVD7/p9fWcUcapEn+C63xTjDfz8KAnnG
	 LhNUq94LFyG1Rdr2NKCc4I8nh4Sg2V9I4RFWDkcRx0AGvFHzSg5IJgOgtr2WP8wc2G
	 sE1JP6y2pP9vzshKi48iKYWcwJ8ubqyUe+pdIzPatXHI9qH1pSdk6GYu5pnkwzmuXQ
	 /RLJPZbsiSDjdvAB1FMiA8mwchMaK5uKf2rIM7LlOdSriZP/CI3qDXVEsobQAxGmX8
	 0sw9ZETCj736BXuidmBCvjFMiT123esoVNO7yOoMEGSvbnm3D945Gkq6FVHbHwkjuq
	 stq1W0osDjqCA==
Message-ID: <3e977bb3-7d4d-8d11-8779-62ae72d2c117@collabora.com>
Date: Mon, 30 May 2022 10:36:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v1 2/2] dt-bindings: pinctrl: mt8192: Use generic bias
 instead of pull-*-adv
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220525155714.1837360-1-nfraprado@collabora.com>
 <20220525155714.1837360-3-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220525155714.1837360-3-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_013656_128315_D9C90ED7 
X-CRM114-Status: GOOD (  11.58  )
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

SWwgMjUvMDUvMjIgMTc6NTcsIE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIGhhIHNjcml0dG86Cj4g
Q29tbWl0IGNhZmUxOWRiNzc1MSAoInBpbmN0cmw6IG1lZGlhdGVrOiBCYWNrd2FyZCBjb21wYXRp
YmxlIHRvIHByZXZpb3VzCj4gTWVkaWF0ZWsncyBiaWFzLXB1bGwgdXNhZ2UiKSBhbGxvd2VkIHRo
ZSBiaWFzLXB1bGwtdXAgYW5kIGJpYXMtcHVsbC1kb3duCj4gcHJvcGVydGllcyB0byBiZSB1c2Vk
IGZvciBzZXR0aW5nIFBVUEQvUjEvUjAgdHlwZSBiaWFzIG9uIG10ay1wYXJpcwo+IGJhc2VkIFNv
QydzLCB3aGljaCB3YXMgcHJldmlvdXNseSBvbmx5IHN1cHBvcnRlZCBieSB0aGUgY3VzdG9tCj4g
bWVkaWF0ZWsscHVsbC11cC1hZHYgYW5kIG1lZGlhdGVrLHB1bGwtZG93bi1hZHYgcHJvcGVydGll
cy4KPiAKPiBTaW5jZSB0aGUgYmlhcy1wdWxsLXt1cCxkb3dufSBwcm9wZXJ0aWVzIGFscmVhZHkg
aGF2ZSBkZWZpbmVzIGFzc29jaWF0ZWQKPiB0aHVzIGJlaW5nIG1vcmUgZGVzY3JpcHRpdmUgYW5k
IGlzIG1vcmUgdW5pdmVyc2FsIG9uIE1lZGlhVGVrIHBsYXRmb3JtcywKPiBhbmQgZ2l2ZW4gdGhh
dCB0aGVyZSBhcmUgbm8gbWVkaWF0ZWsscHVsbC17dXAsZG93bn0tYWR2IHVzZXJzIG9uIG10ODE5
Mgo+IHlldCwgcmVtb3ZlIHRoZSBjdXN0b20gYWR2IHByb3BlcnRpZXMgaW4gZmF2b3Igb2YgdGhl
IGdlbmVyaWMgb25lcy4KPiAKPiBOb3RlIHRoYXQgb25seSBtZWRpYXRlayxwdWxsLXVwLWFkdiB3
YXMgbWVyZ2VkIGluIHRoZSBiaW5kaW5nLCBidXQgbm90Cj4gaXRzIGRvd24gY291bnRlcnBhcnQu
Cj4gCj4gRml4ZXM6IGVkYmFjYjM2ZWE1MCAoImR0LWJpbmRpbmdzOiBwaW5jdHJsOiBtdDgxOTI6
IEFkZCBtZWRpYXRlayxwdWxsLXVwLWFkdiBwcm9wZXJ0eSIpCj4gU2lnbmVkLW9mZi1ieTogTsOt
Y29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgoKUmV2aWV3ZWQt
Ynk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9jY2hpbm8uZGVscmVnbm9A
Y29sbGFib3JhLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
