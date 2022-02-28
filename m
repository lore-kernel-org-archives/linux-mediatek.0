Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F579C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 11:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=upx3R+28nJStMxs1LUI/Q5ERMFLxdD2jujPO4JvoDLM=; b=L9xQtlxId0/oS9
	LSMgmTDlZ17a6xMoePM+twPsTceEUHA+2uIQ4bonYWiPBxPVcNzbsbQKsNLIIBY/TsNzUoYRsJETD
	WbZdnLhHRsYzjQEu70FNueQIUUqLc4rUQTOCX8shP5J3ZSoXExrHXld/YqR6hscXHksENALw0gjIZ
	w7NHjJfrtFs/ef2zVXpU77y258ieAg0q2pVYyA0G1YTc2M50BCVwe0e5SK21HFjYUnrbL0baLgKZV
	wREeKx+BJIKJxjms7g0zK5BTRYVwLKH++jRkOxEO1CVCd05q8q3WXLMtv+8G/8Q4zaAA9XZfmq2zG
	IwCmQvjwnPfOiCcHoQ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOeBC-00BrLd-Co; Mon, 28 Feb 2022 11:27:02 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOdoA-00Bfjn-6m; Mon, 28 Feb 2022 11:03:16 +0000
Received: by mail-wr1-x42c.google.com with SMTP id x15so14772699wrg.8;
 Mon, 28 Feb 2022 03:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Zbcz7VnvPXSNCztHz9sMRX7epSbG59XZn9pyu61UWHk=;
 b=Oxj8JHlRz2mdVmoqigS0luCtmjoUGIdmOc0RrlMqAcNJkhut3cfH0O2mrE/ZN35eRA
 VJuMEYvoFGx3i6hUlAg9fNUzhIxxOX6t9Dknps+IjiCb1Nx5UamllnjQ/a4Es/oJ0MN/
 0gN1bg1skzYA+O+aGmN1eNJntgiA4r3vUMPtDYDE9F48W9BanaHaPErQ1DcKjaclTMkj
 jnrBkH0t/aYm1I8A3mgzP1WAG567o0wVuGR40v2RaLbN8akGMFYBAT8PwIpDSLCrD0U+
 my3H+o+iwrO4pyNafLkILq2XPN2ucabzpReR9CV8mW58yAKTRzMSYKjqdp30wWeaq4jp
 sQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Zbcz7VnvPXSNCztHz9sMRX7epSbG59XZn9pyu61UWHk=;
 b=kIOi8EQb9l3A7szQcKv2/XOoorkkxv64KL3yn70AfZfwn5w+q7VKP+yJWdHEssJX1k
 aiDoCssPxt7K17XHPYx1KmNbMsACezJzptdivBPc2SNLHUqHhro/qX01NjparCZusoQJ
 XTRnCGPynIQkeMCWxkwErCFmgavIpu4Kn7xHwQRkVynMOw+4bS858Gdohk/jEFwR2kPz
 xS3CndWNqp3dHGxIfJ9yVo439nP4AcyV0oJQysXCKcEXvZ4HVVywgJvjKRaqfCxJ7EIe
 +i3+c/n5lTh71J6c437n/iMtXRQt+6DvWoObnht5WgqpQx98SScW6AEqqMMDJisIaq6F
 Rapw==
X-Gm-Message-State: AOAM532oqJd+m8/Fz71eqHtmTRWGMZ7e8f1HmcwObnfDuCgAtpWNTtVD
 3TcLkiP+acaeIm/78e7Xhgw=
X-Google-Smtp-Source: ABdhPJyoSngUdbBN26xRaezsM/eDpcmtYGFW89dx6ojT/oBJ2L/ABdocEt8cEWhHXD5mzfXcpXS/dw==
X-Received: by 2002:adf:ea44:0:b0:1ef:6f00:cf47 with SMTP id
 j4-20020adfea44000000b001ef6f00cf47mr11507757wrn.460.1646046192880; 
 Mon, 28 Feb 2022 03:03:12 -0800 (PST)
Received: from [192.168.0.14] (static-63-182-85-188.ipcom.comunitel.net.
 [188.85.182.63]) by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037fa93193a8sm12557012wmp.44.2022.02.28.03.03.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 03:03:12 -0800 (PST)
Message-ID: <2f2d2d0f-3854-501d-e6dd-146f64d726d6@gmail.com>
Date: Mon, 28 Feb 2022 12:03:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [v7 0/5] Mediatek MT8195 power domain support
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220130012104.5292-1-chun-jie.chen@mediatek.com>
 <319d7236-292c-787f-4578-bffe75e33ba1@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <319d7236-292c-787f-4578-bffe75e33ba1@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_030314_338765_34482BB8 
X-CRM114-Status: GOOD (  15.90  )
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

CgpPbiAxNS8wMi8yMDIyIDEwOjA2LCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToK
PiBJbCAzMC8wMS8yMiAwMjoyMCwgQ2h1bi1KaWUgQ2hlbiBoYSBzY3JpdHRvOgo+PiBUaGlzIHBh
dGNoIHNlcmllcyBhZGRzIHBvd2VyIGRvbWFpbiBzdXBwb3J0IGZvciBNVDgxOTUKPj4gYW5kIGlz
IGJhc2VkIG9uIDUuMTctcmMxLgo+IAo+IEhlbGxvIE1hdHRoaWFzLAo+IAo+IHRoaXMgc2VyaWVz
IGhhcyBiZWVuIHRlc3RlZCBmb3IgYSB3aGlsZSBvbiBtdWx0aXBsZSBNZWRpYVRlayBwbGF0Zm9y
bXMsIGhlbmNlCj4gbmV3IHZlcnNpb25zIHdpbGwgbm90IGJlIG5lY2Vzc2FyeS4KPiAKPiBDYW4g
eW91IHBsZWFzZSBwaWNrIGl0IGZvciB2NS4xOD8KCldob2xlIHNlcmllcyBhcHBsaWVkLAoKVGhh
bmtzIQoKTWF0dGhpYXMKCj4gCj4gVGhhbmsgeW91LAo+IEFuZ2Vsbwo+IAo+Pgo+PiBjaGFuZ2Ug
c2luY2UgdjY6Cj4+IC0gcmViYXNlIHRvIDUuMTctcmMxCj4+Cj4+IGNoYW5nZSBzaW5jZSB2NToK
Pj4gLSByZWJhc2UgdG8gNS4xNi1yYzEKPj4gLSBhZGQgZG9tYWluIGNhcGFjaXR5IGluIG1mZyBw
b3dlciBkb21haW4KPj4KPj4gY2hhbmdlIHNpbmNlIHY0Ogo+PiAtIHJlYmFzZSB0byA1LjE1LXJj
MSAoZml4IGNvbmZsaWN0IGF0IHBhdGNoIDQgaW4gdGhpcyBzZXJpZXMpCj4+IC0gY2hhbmdlIGxp
Y2Vuc2UKPj4KPj4gY2hhbmdlIHNpbmNlIHYzOgo+PiAtIHJlbW92ZSByZWR1bmRhbnQgYnVzIHBy
b3RlY3Rpb24gc3RlcHMKPj4gLSByZW1vdmUgdW51c2VkIHBvd2VyIGRvbWFpbgo+Pgo+PiBjaGFu
Z2Ugc2luY2UgdjI6Cj4+IC0gbW92ZSBtb2RpZmljYXRpb24gb2Ygd2FrZXVwIGNhcGFjaXR5IHRv
IHNpbmdsZSBwYXRjaAo+Pgo+PiByZWFzb24gZm9yIHJlc2VuZCB2MjoKPj4gLSBtaXNzIHBhdGNo
IHZlcnNpb24gaW4gc2VyaWVzCj4+Cj4+IGNoYW5nZXMgc2luY2UgdjE6Cj4+IC0gZml4IHNpZ25l
ZC1vZmYgbmFtZQo+PiAtIGRlc2NyaWJlIG1vcmUgZGV0YWlsIGluIHBhdGNoIDMKPj4gLSBtb3Zl
IG1vZGlmaWNhdGlvbiBvZiByZW1vdmluZyByZWR1bmRhbnQgbWFjcm8gdG8gc2luZ2xlIHBhdGNo
Cj4+Cj4+IENodW4tSmllIENoZW4gKDUpOgo+PiDCoMKgIGR0LWJpbmRpbmdzOiBwb3dlcjogQWRk
IE1UODE5NSBwb3dlciBkb21haW5zCj4+IMKgwqAgc29jOiBtZWRpYXRlazogcG0tZG9tYWluczog
QWRkIHdha2V1cCBjYXBhY2l0eSBzdXBwb3J0IGluIHBvd2VyIGRvbWFpbgo+PiDCoMKgIHNvYzog
bWVkaWF0ZWs6IHBtLWRvbWFpbnM6IFJlbW92ZSB1bnVzZWQgbWFjcm8KPj4gwqDCoCBzb2M6IG1l
ZGlhdGVrOiBwbS1kb21haW5zOiBNb3ZlIHBvd2VyIHN0YXR1cyBvZmZzZXQgdG8gcG93ZXIgZG9t
YWluCj4+IMKgwqDCoMKgIGRhdGEKPj4gwqDCoCBzb2M6IG1lZGlhdGVrOiBwbS1kb21haW5zOiBB
ZGQgc3VwcG9ydCBmb3IgbXQ4MTk1Cj4+Cj4+IMKgIC4uLi9wb3dlci9tZWRpYXRlayxwb3dlci1j
b250cm9sbGVyLnlhbWzCoMKgwqDCoMKgIHzCoMKgIDIgKwo+PiDCoCBkcml2ZXJzL3NvYy9tZWRp
YXRlay9tdDgxNjctcG0tZG9tYWlucy5owqDCoMKgwqDCoCB8wqAgMTYgKy0KPj4gwqAgZHJpdmVy
cy9zb2MvbWVkaWF0ZWsvbXQ4MTczLXBtLWRvbWFpbnMuaMKgwqDCoMKgwqAgfMKgIDIyICstCj4+
IMKgIGRyaXZlcnMvc29jL21lZGlhdGVrL210ODE4My1wbS1kb21haW5zLmjCoMKgwqDCoMKgIHzC
oCAzMiArLQo+PiDCoCBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdDgxOTItcG0tZG9tYWlucy5owqDC
oMKgwqDCoCB8wqAgNDQgKy0KPj4gwqAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXQ4MTk1LXBtLWRv
bWFpbnMuaMKgwqDCoMKgwqAgfCA2MTMgKysrKysrKysrKysrKysrKysrCj4+IMKgIGRyaXZlcnMv
c29jL21lZGlhdGVrL210ay1wbS1kb21haW5zLmPCoMKgwqDCoMKgwqDCoMKgIHzCoCAxMiArLQo+
PiDCoCBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstcG0tZG9tYWlucy5owqDCoMKgwqDCoMKgwqDC
oCB8wqDCoCA4ICstCj4+IMKgIGluY2x1ZGUvZHQtYmluZGluZ3MvcG93ZXIvbXQ4MTk1LXBvd2Vy
LmjCoMKgwqDCoMKgIHzCoCA0NiArKwo+PiDCoCBpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9p
bmZyYWNmZy5owqDCoMKgwqDCoMKgwqDCoCB8wqAgODIgKysrCj4+IMKgIDEwIGZpbGVzIGNoYW5n
ZWQsIDg2MiBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKPj4gwqAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvc29jL21lZGlhdGVrL210ODE5NS1wbS1kb21haW5zLmgKPj4gwqAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvcG93ZXIvbXQ4MTk1LXBvd2VyLmgK
Pj4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVk
aWF0ZWsK
