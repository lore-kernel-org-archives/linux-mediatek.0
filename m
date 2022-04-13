Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF46C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 07:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K3SAAm55GxNSwl189X4MvFMCdVsp7LhClBZPp0kCQFY=; b=iCCXJ3nw3JEgWM
	JJGOAmFqbqoiZ5nJV74lLZmdkfE8Whuv7gZs91NWhOmnDs9N2h7c8qtV4V4vflB6nnGM1SB9s7vnY
	CIjnxPBvcjLrpYMuRdxyy9Z4h+nwPqkiV3TXkRnHQSMIN8x0RplQrZTEFx8rEYYr13EmvftA9n9LT
	acDS5pOFiI9OF0plMBzpnsKHGc0f4Be4+c2zQXj06pK9LyyAGCLKrceYrEbQSsjraEV5ewhr2+OgR
	v7ZS/FvqqbjRmNUt1+sEXtYbbVbQEOp1+/dyWLGIPrM1zwctpEsf5yuKS0IWD1mlFE8QKC2bVE9rf
	5YI+M7IfwC299B67TZ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neXt0-00HVJI-Fu; Wed, 13 Apr 2022 07:57:58 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neXsm-00HVEy-Sf; Wed, 13 Apr 2022 07:57:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D10231F44E9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649836663;
 bh=mzWuX58y4C68CcEn/a3a+EywObIenobNezPNhsxckgU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kmXqsesSLvWFXzGLTRqiWYSvGN5LlWNAB2FD23E8+ZrbGAW+o2zP1LzJNsSBPxhjg
 nZD50ua/mXxtL5FVp3MUxGXDKntSSHgUHVzv+8hZN9VsiSkBuW+aLxP3HcN7+qrpsp
 ZA4/7d8gH9NrJ4NCZsIMElGupIRW+KNTFSxc6sD4dSLglT75G1iWWAb/WDPiw/unGt
 Ptq5TZN3NIP95ftv0KTiPn+ZlxAYI1yBuNReJsIH39gIkOEQzmacvZq8/RGRGIZWUs
 YQ4tBIFxaakTc1bVA8nSmLlZFdlos8RfWTvoDvMg4WYfAXtZe7G1FEb2t+VnQa5OsO
 XD08QtZM8nlfg==
Message-ID: <1d9a6259-b1f6-5c4f-7e91-0529b77b6a44@collabora.com>
Date: Wed, 13 Apr 2022 09:57:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v8, 00/15] media: mtk-vcodec: support for M8192 decoder
Content-Language: en-US
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: George Sun <george.sun@mediatek.com>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220331024801.29229-1-yunfei.dong@mediatek.com>
 <fbfe4572296a133492310f13e3f41db56218fc17.camel@ndufresne.ca>
 <0f385e6e2d0687c3e6de12a576d1617af9504cee.camel@mediatek.com>
 <c5dc9f759054418082849233639f727e39329550.camel@ndufresne.ca>
 <cdcaf769ee162658e3bbb0c30bb8c4cbb168c6d6.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <cdcaf769ee162658e3bbb0c30bb8c4cbb168c6d6.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_005745_253523_C1DEE4DD 
X-CRM114-Status: GOOD (  28.01  )
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

SWwgMTMvMDQvMjIgMDk6MDMsIGFsbGVuLWtoLmNoZW5nIGhhIHNjcml0dG86Cj4gSGkgTmljb2xh
cywKPiAKPiBPbiBUdWUsIDIwMjItMDQtMTIgYXQgMTA6NDggLTA0MDAsIE5pY29sYXMgRHVmcmVz
bmUgd3JvdGU6Cj4+IExlIGx1bmRpIDExIGF2cmlsIDIwMjIgw6AgMTE6NDEgKzA4MDAsIHl1bmZl
aS5kb25nQG1lZGlhdGVrLmNvbSBhCj4+IMOpY3JpdCA6Cj4+PiBIaSBOaWNvbGFzLAo+Pj4KPj4+
IE9uIFRodSwgMjAyMi0wMy0zMSBhdCAxNjo0OCAtMDQwMCwgTmljb2xhcyBEdWZyZXNuZSB3cm90
ZToKPj4+PiBIaSBZdW5mZWksCj4+Pj4KPj4+PiB0aGFua3MgZm9yIHRoZSB1cGRhdGUsIEkgc2hv
dWxkIGJlIHRlc3RpbmcgdGhpcyByZWFsbHkgc29vbi4KPj4+Pgo+Pj4+IExlIGpldWRpIDMxIG1h
cnMgMjAyMiDDoCAxMDo0NyArMDgwMCwgWXVuZmVpIERvbmcgYSDDqWNyaXQgOgo+Pj4+PiBUaGlz
IHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIG10ODE5MiBoMjY0L3ZwOC92cDkgZGVjb2Rlcgo+Pj4+
PiBkcml2ZXJzLgo+Pj4+PiBGaXJzdGx5LCByZWZhY3Rvcgo+Pj4+PiBwb3dlci9jbG9jay9pbnRl
cnJ1cHQgaW50ZXJmYWNlcyBmb3IgbXQ4MTkyIGlzIGxhdCBhbmQgY29yZQo+Pj4+PiBhcmNoaXRl
Y3R1cmUuCj4+Pj4KPj4+PiBTaW1pbGFybHkgdG8gTVQ4MTczIGFuZCBNVDgxODMsIGEgc2hhcmVk
KiBmaXJtd2FyZSBpcyBuZWVkZWQgZm9yCj4+Pj4gdGhpcwo+Pj4+IENPREVDIHRvCj4+Pj4gd29y
ayAoc2NwLmltZykuIEkgbG9va2VkIGludG8gbGludXgtZmlybXdhcmVbMV0gaXQgaGFzIG5vdCBi
ZWVuCj4+Pj4gYWRkZWQKPj4+PiBmb3IgbXQ4MTkyCj4+Pj4geWV0LiBBcyB5b3VyIHBhdGNoZXMg
YXJlIGdldHRpbmcgY2xvc2UgdG8gYmUgcmVhZHksIGl0IHdvdWxkIGJlCj4+Pj4gaW1wb3J0YW50
IHRvCj4+Pj4gbG9vayBpbnRvIHRoaXMgc28gdGhlIHBhdGNoc2V0IGRvZXMgbm90IGdldCBibG9j
a2VkIGR1ZSB0byB0aGF0Lgo+Pj4+Cj4+Pj4gYmVzdCByZWdhcmRzLAo+Pj4+IE5pY29sYXMKPj4+
Pgo+Pj4+IFsxXQo+Pj4+Cj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Zpcm13YXJlL2xpbnV4LWZpcm13
YXJlLmdpdC90cmVlL21lZGlhdGVrX187ISFDVFJOS0E5d01nMEFSYnchenk0TjZKRHJvU1h0dW1Y
WGE3TXV4QWdZQVBBaW5rOHV5Vy05Nzh2cFdjdDhTM3ZPakJxWGlyRkU4dVRFSG9wSENvdmJTbDBG
TlA5TFBnV0NFQnJaZk1JY3ZRJAo+Pj4+ICAgCj4+Pj4gKiBTaGFyZWQgYXQgbGVhc3QgYmV0d2Vl
biBNRFAzIGFuZCBNVEsgVkNPREVDIGZyb20gbXkga25vd2xlZGdlCj4+Pj4KPj4+Cj4+PiBUaGFu
a3MgZm9yIHlvdXIgcmVtaW5kLgo+Pj4KPj4+IEkgaGF2ZSBhbHJlYWR5IHNlbnQgbXQ4MTkyIHNj
cC5pbWcgdG8gZ2l0aHViLgo+Pj4KPj4+Cj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0
dHBzOi8vZ2l0aHViLmNvbS95dW5mZWlkb25nbWVkaWF0ZWsvbGludXhfZndfc2NwXzgxOTIvY29t
bWl0LzNhYzJmYzg1YmM3ZGZjZWJkYjkyYjViNTgwOGIwMjY4Y2RmYjc3MmRfXzshIUNUUk5LQTl3
TWcwQVJidyF6eTRONkpEcm9TWHR1bVhYYTdNdXhBZ1lBUEFpbms4dXlXLTk3OHZwV2N0OFMzdk9q
QnFYaXJGRTh1VEVIb3BIQ292YlNsMEZOUDlMUGdXQ0VCcGY5Rl9uV0EkCj4+PiAgIAo+Pj4KPj4+
IFdhaXRpbmcgZm9yIHRvIGJlIG1lcmdlZC4KPj4KPj4gT24gYm9hcmRzIEkgaGF2ZSwgdGhlIGZp
cm13YXJlIGlzIGxvYWRlZCBmcm9tIC9saWIvZmlybXdhcmUvc2NwLmltZywKPj4gYnV0IHdpdGgK
Pj4gdGhpcyBzdWJtaXNzaW9uIGl0IHdpbGwgYmUgaW4gbGliL2Zpcm13YXJlL21lZGlhdGVrL210
ODE5Mi9zY3AuaW1nIC4KPj4gSSBoYXZlbid0Cj4+IGZvdW5kIGFueXRoaW5nIGFyb3VuZDoKPj4K
Pj4gICBkcml2ZXJzL3JlbW90ZXByb2MvbXRrX3NjcC5jOjgxMjogICAgICAgY2hhciAqZndfbmFt
ZSA9ICJzY3AuaW1nIjsKPj4KPj4gVGhhdCB3b3VsZCB1c2UgdGhlIHBsYXRmb3JtIHBhdGguIFRo
aXMgc2VlbXMgbGlrZSBhIHByb2JsZW0gdG8gbWUsCj4+IHRoZQo+PiB1cHN0cmVhbWluZyBvZiB0
aGUgZmlybXdhcmUgaXNuJ3QgYmVpbmcgYWxpZ25lZCB3aXRoIHRoZSB3ZXJlIHRoZQo+PiBmaXJt
d2FyZSBpcwo+PiBwaWNrZWQgYnkgdGhlIHVwc3RyZWFtIGRyaXZlci4gQ29ycmVjdCBtZSBpZiBJ
IGdvdCB0aGlzIHdyb25nLCBidXQKPj4gSSdkIHJlYWxseQo+PiBsaWtlIHRvIGNsYXJpZnkgdGhp
cy4KPj4KPj4gTmljb2xhcwo+Pgo+IAo+IEkgYW0gbm90IHN1cmUgd2h5IGl0J3MgYWNjZXB0ZWQg
dGhlIGZ3IHBhdGggb2Ygc2NwIGlzCj4gL2xpYi9maXJtd2FyZS9zY3AuaW1nIGluIG10ODE3My84
MTgzIGJ1dCB3ZSB1cGxvYWQgc2NwLmluZyBpbgo+IC9saWIvZmlybXdhcmUvbWVkaWF0ZWsvbXQ4
MTczKG10ODE4Mykvc2NwLmltZyB0bwo+IAo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L2Zpcm13YXJlL2xpbnV4LWZpcm13YXJlLmdpdC90cmVlL21lZGlh
dGVrCj4gCj4gQ3VycmVudGx5LCB0aGUgc2NwIGRyaXZlciB3aWxsIGxvYWQgZmlybXdhcmUgaW4g
L2xpYi9maXJtd2FyZS9zY3AuaW1nLgo+IHRoYXQgbWVhbnMgdGhlcmUgaXMgb25seSBvbmUgZmly
bXdhcmUgZm9yIGEgc3BlY2lmaWMgcGxhdGZvcm0uCj4gSSB0aGluayB3ZSBjYW4gc2VuZCBhIFBB
VENIIHRvIG1ha2UgZmlybXdhcmUgbmFtZSBvZiBzY3AgYmVpbmcgbW9yZQo+IGZsZXhpYmxlLgo+
IAo+IE1heWJlIGdldCBmaXJtd2FyZSBuYW1lIGZyb20gZHRzLiBlLmcuLAo+ICZzY3Agewo+IAlz
dGF0dXMgPSAib2theSI7Cj4gCWZpcm13YXJlLW5hbWUgPSAibWVkaWF0ZWsvbXQ4MXh4L3NjcC5p
bWciOwo+IH07Cj4gCj4gRG8geW91IHRoaW5rIGl0IGZlYXNpYmxlPwo+IElmIHlvdSBoYXZlIGFu
eSBjb25jZXJucywgcGxlYXNlIGxldCB1cyBrbm93Lgo+IAo+IFRoYW5rcywKPiBBbGxlbgo+IAoK
SGVsbG8gQWxsZW4sCgp3aGF0IHlvdSBwcm9wb3NlZCBpcyBleGFjdGx5IHdoYXQgaGFzIGJlZW4g
ZG9uZSBmb3Igb3RoZXIgcGxhdGZvcm1zIGJlY2F1c2Ugb2YKYm90aCBwZXItZGV2aWNlIGZpcm13
YXJlIGRpZmZlcmVuY2VzIChkaWZmZXJlbnQgc2lnbmF0dXJlcykgYW5kIHBlci1Tb0MgKGRpZmZl
cmVudApmaXJtd2FyZSBlbnRpcmVseSksIGZvdW5kIG9uIFRJIEszLCBpTVggRFNQLCBRdWFsY29t
bSBNU1MvRFNQIHJlbW90ZXByb2MgYW5kCm90aGVycy4KCk9mIGNvdXJzZSB0aGlzIGlzIGFuIGFj
Y2VwdGVkIHdheSB0byByZXNvbHZlIHRoaXMgc2l0dWF0aW9uOiBwbGVhc2UgZ28gb24hCgpDaGVl
cnMsCkFuZ2VsbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
