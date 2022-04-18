Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CB0C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Apr 2022 04:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yVWU2kKscJvNnHYa53W0IGYkiqSxXcfnPJHOs2Uhmo8=; b=gpBaXPs6HWtRh+
	ntDFuU/kRkMiuZzRG2hGd7He5hqw5JKgK8yDYBm52mRDTHsX9xArXxpXW32oJgd5soQ9uPhjBd8QW
	MWw2vlwRfWaslG9VzBY+96rFDs7S/5z5Jo4Ly9aCHIUv+eaiBhzx+dJohYvtubRwP7HhIybWIc5KS
	9P7XBjUMe1dDkoURS+PNr4//f33cPIUAEJ5hC8MGv+M6pkUbnu4apFQvFa8E4yC4R88AzEFk1xdSB
	tNOFCSoYXKoYYYSFJ/dNrDpPAcW2EVaQtbykby61uxvbqwyU/Qoy+oT0WVT48DvM/k3Yjdz5FJtEc
	eEbPSSF38VbRLF6AUPYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngIbk-00FUYJ-Ji; Mon, 18 Apr 2022 04:03:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngIbQ-00FUUh-Ri; Mon, 18 Apr 2022 04:03:06 +0000
X-UUID: 1058cb0e5f1d4c74bef52ee7d787a7ec-20220417
X-UUID: 1058cb0e5f1d4c74bef52ee7d787a7ec-20220417
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 343113375; Sun, 17 Apr 2022 21:02:52 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 17 Apr 2022 21:00:14 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 18 Apr 2022 12:00:11 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 18 Apr 2022 12:00:11 +0800
Message-ID: <a6e827749d8b3bce059e4df7d84b524ebddcf20c.camel@mediatek.com>
Subject: Re: [PATCH v8, 00/15] media: mtk-vcodec: support for M8192 decoder
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "yunfei.dong@mediatek.com"
 <yunfei.dong@mediatek.com>, Alexandre Courbot <acourbot@chromium.org>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Fritz
 Koenig" <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 18 Apr 2022 12:00:11 +0800
In-Reply-To: <2031e84425f0aa8df03328057c394551c30a38f5.camel@ndufresne.ca>
References: <20220331024801.29229-1-yunfei.dong@mediatek.com>
 <fbfe4572296a133492310f13e3f41db56218fc17.camel@ndufresne.ca>
 <0f385e6e2d0687c3e6de12a576d1617af9504cee.camel@mediatek.com>
 <c5dc9f759054418082849233639f727e39329550.camel@ndufresne.ca>
 <cdcaf769ee162658e3bbb0c30bb8c4cbb168c6d6.camel@mediatek.com>
 <1d9a6259-b1f6-5c4f-7e91-0529b77b6a44@collabora.com>
 <2031e84425f0aa8df03328057c394551c30a38f5.camel@ndufresne.ca>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_210304_931042_6445F8DE 
X-CRM114-Status: GOOD (  44.20  )
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

SGksCgpPbiBXZWQsIDIwMjItMDQtMTMgYXQgMTQ6MzAgLTA0MDAsIE5pY29sYXMgRHVmcmVzbmUg
d3JvdGU6Cj4gTGUgbWVyY3JlZGkgMTMgYXZyaWwgMjAyMiDDoCAwOTo1NyArMDIwMCwgQW5nZWxv
R2lvYWNjaGlubyBEZWwgUmVnbm8gYQo+IMOpY3JpdCA6Cj4gPiBJbCAxMy8wNC8yMiAwOTowMywg
YWxsZW4ta2guY2hlbmcgaGEgc2NyaXR0bzoKPiA+ID4gSGkgTmljb2xhcywKPiA+ID4gCj4gPiA+
IE9uIFR1ZSwgMjAyMi0wNC0xMiBhdCAxMDo0OCAtMDQwMCwgTmljb2xhcyBEdWZyZXNuZSB3cm90
ZToKPiA+ID4gPiBMZSBsdW5kaSAxMSBhdnJpbCAyMDIyIMOgIDExOjQxICswODAwLCB5dW5mZWku
ZG9uZ0BtZWRpYXRlay5jb20KPiA+ID4gPiBhCj4gPiA+ID4gw6ljcml0IDoKPiA+ID4gPiA+IEhp
IE5pY29sYXMsCj4gPiA+ID4gPiAKPiA+ID4gPiA+IE9uIFRodSwgMjAyMi0wMy0zMSBhdCAxNjo0
OCAtMDQwMCwgTmljb2xhcyBEdWZyZXNuZSB3cm90ZToKPiA+ID4gPiA+ID4gSGkgWXVuZmVpLAo+
ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gdGhhbmtzIGZvciB0aGUgdXBkYXRlLCBJIHNob3VsZCBi
ZSB0ZXN0aW5nIHRoaXMgcmVhbGx5Cj4gPiA+ID4gPiA+IHNvb24uCj4gPiA+ID4gPiA+IAo+ID4g
PiA+ID4gPiBMZSBqZXVkaSAzMSBtYXJzIDIwMjIgw6AgMTA6NDcgKzA4MDAsIFl1bmZlaSBEb25n
IGEgw6ljcml0IDoKPiA+ID4gPiA+ID4gPiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIG10
ODE5MiBoMjY0L3ZwOC92cDkgZGVjb2Rlcgo+ID4gPiA+ID4gPiA+IGRyaXZlcnMuCj4gPiA+ID4g
PiA+ID4gRmlyc3RseSwgcmVmYWN0b3IKPiA+ID4gPiA+ID4gPiBwb3dlci9jbG9jay9pbnRlcnJ1
cHQgaW50ZXJmYWNlcyBmb3IgbXQ4MTkyIGlzIGxhdCBhbmQKPiA+ID4gPiA+ID4gPiBjb3JlCj4g
PiA+ID4gPiA+ID4gYXJjaGl0ZWN0dXJlLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gU2ltaWxh
cmx5IHRvIE1UODE3MyBhbmQgTVQ4MTgzLCBhIHNoYXJlZCogZmlybXdhcmUgaXMKPiA+ID4gPiA+
ID4gbmVlZGVkIGZvcgo+ID4gPiA+ID4gPiB0aGlzCj4gPiA+ID4gPiA+IENPREVDIHRvCj4gPiA+
ID4gPiA+IHdvcmsgKHNjcC5pbWcpLiBJIGxvb2tlZCBpbnRvIGxpbnV4LWZpcm13YXJlWzFdIGl0
IGhhcyBub3QKPiA+ID4gPiA+ID4gYmVlbgo+ID4gPiA+ID4gPiBhZGRlZAo+ID4gPiA+ID4gPiBm
b3IgbXQ4MTkyCj4gPiA+ID4gPiA+IHlldC4gQXMgeW91ciBwYXRjaGVzIGFyZSBnZXR0aW5nIGNs
b3NlIHRvIGJlIHJlYWR5LCBpdAo+ID4gPiA+ID4gPiB3b3VsZCBiZQo+ID4gPiA+ID4gPiBpbXBv
cnRhbnQgdG8KPiA+ID4gPiA+ID4gbG9vayBpbnRvIHRoaXMgc28gdGhlIHBhdGNoc2V0IGRvZXMg
bm90IGdldCBibG9ja2VkIGR1ZSB0bwo+ID4gPiA+ID4gPiB0aGF0Lgo+ID4gPiA+ID4gPiAKPiA+
ID4gPiA+ID4gYmVzdCByZWdhcmRzLAo+ID4gPiA+ID4gPiBOaWNvbGFzCj4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiBbMV0KPiA+ID4gPiA+ID4gCj4gPiA+IAo+ID4gPiAKaHR0cHM6Ly91cmxkZWZl
bnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2Zpcm13YXJlL2xpbnV4LWZpcm13YXJlLmdpdC90cmVlL21lZGlhdGVrX187ISFDVFJOS0E5
d01nMEFSYnchenk0TjZKRHJvU1h0dW1YWGE3TXV4QWdZQVBBaW5rOHV5Vy05Nzh2cFdjdDhTM3ZP
akJxWGlyRkU4dVRFSG9wSENvdmJTbDBGTlA5TFBnV0NFQnJaZk1JY3ZRJAo+ID4gPiA+ID4gPiAg
IAo+ID4gPiA+ID4gPiAqIFNoYXJlZCBhdCBsZWFzdCBiZXR3ZWVuIE1EUDMgYW5kIE1USyBWQ09E
RUMgZnJvbSBteQo+ID4gPiA+ID4gPiBrbm93bGVkZ2UKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiAK
PiA+ID4gPiA+IFRoYW5rcyBmb3IgeW91ciByZW1pbmQuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEkg
aGF2ZSBhbHJlYWR5IHNlbnQgbXQ4MTkyIHNjcC5pbWcgdG8gZ2l0aHViLgo+ID4gPiA+ID4gCj4g
PiA+ID4gPiAKPiA+ID4gCj4gPiA+IApodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6
Ly9naXRodWIuY29tL3l1bmZlaWRvbmdtZWRpYXRlay9saW51eF9md19zY3BfODE5Mi9jb21taXQv
M2FjMmZjODViYzdkZmNlYmRiOTJiNWI1ODA4YjAyNjhjZGZiNzcyZF9fOyEhQ1RSTktBOXdNZzBB
UmJ3IXp5NE42SkRyb1NYdHVtWFhhN011eEFnWUFQQWluazh1eVctOTc4dnBXY3Q4UzN2T2pCcVhp
ckZFOHVURUhvcEhDb3ZiU2wwRk5QOUxQZ1dDRUJwZjlGX25XQSQKPiA+ID4gPiA+ICAgCj4gPiA+
ID4gPiAKPiA+ID4gPiA+IFdhaXRpbmcgZm9yIHRvIGJlIG1lcmdlZC4KPiA+ID4gPiAKPiA+ID4g
PiBPbiBib2FyZHMgSSBoYXZlLCB0aGUgZmlybXdhcmUgaXMgbG9hZGVkIGZyb20KPiA+ID4gPiAv
bGliL2Zpcm13YXJlL3NjcC5pbWcsCj4gPiA+ID4gYnV0IHdpdGgKPiA+ID4gPiB0aGlzIHN1Ym1p
c3Npb24gaXQgd2lsbCBiZSBpbgo+ID4gPiA+IGxpYi9maXJtd2FyZS9tZWRpYXRlay9tdDgxOTIv
c2NwLmltZyAuCj4gPiA+ID4gSSBoYXZlbid0Cj4gPiA+ID4gZm91bmQgYW55dGhpbmcgYXJvdW5k
Ogo+ID4gPiA+IAo+ID4gPiA+ICAgZHJpdmVycy9yZW1vdGVwcm9jL210a19zY3AuYzo4MTI6ICAg
ICAgIGNoYXIgKmZ3X25hbWUgPQo+ID4gPiA+ICJzY3AuaW1nIjsKPiA+ID4gPiAKPiA+ID4gPiBU
aGF0IHdvdWxkIHVzZSB0aGUgcGxhdGZvcm0gcGF0aC4gVGhpcyBzZWVtcyBsaWtlIGEgcHJvYmxl
bSB0bwo+ID4gPiA+IG1lLAo+ID4gPiA+IHRoZQo+ID4gPiA+IHVwc3RyZWFtaW5nIG9mIHRoZSBm
aXJtd2FyZSBpc24ndCBiZWluZyBhbGlnbmVkIHdpdGggdGhlIHdlcmUKPiA+ID4gPiB0aGUKPiA+
ID4gPiBmaXJtd2FyZSBpcwo+ID4gPiA+IHBpY2tlZCBieSB0aGUgdXBzdHJlYW0gZHJpdmVyLiBD
b3JyZWN0IG1lIGlmIEkgZ290IHRoaXMgd3JvbmcsCj4gPiA+ID4gYnV0Cj4gPiA+ID4gSSdkIHJl
YWxseQo+ID4gPiA+IGxpa2UgdG8gY2xhcmlmeSB0aGlzLgo+ID4gPiA+IAo+ID4gPiA+IE5pY29s
YXMKPiA+ID4gPiAKPiA+ID4gCj4gPiA+IEkgYW0gbm90IHN1cmUgd2h5IGl0J3MgYWNjZXB0ZWQg
dGhlIGZ3IHBhdGggb2Ygc2NwIGlzCj4gPiA+IC9saWIvZmlybXdhcmUvc2NwLmltZyBpbiBtdDgx
NzMvODE4MyBidXQgd2UgdXBsb2FkIHNjcC5pbmcgaW4KPiA+ID4gL2xpYi9maXJtd2FyZS9tZWRp
YXRlay9tdDgxNzMobXQ4MTgzKS9zY3AuaW1nIHRvCj4gPiA+IAo+ID4gPiAKaHR0cHM6Ly91cmxk
ZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L2Zpcm13YXJlL2xpbnV4LWZpcm13YXJlLmdpdC90cmVlL21lZGlhdGVrX187ISFDVFJO
S0E5d01nMEFSYnchMG0wQ2I5VTZYZ25vZnc0Z2dKVWFNemttMmdzWjZ0aGpsdld1MHBWR2VlY2tZ
WGNuSWg3c3o3Q19OcU51OTZHQVVhUjFXQSQKPiA+ID4gIAo+ID4gPiAKPiA+ID4gQ3VycmVudGx5
LCB0aGUgc2NwIGRyaXZlciB3aWxsIGxvYWQgZmlybXdhcmUgaW4KPiA+ID4gL2xpYi9maXJtd2Fy
ZS9zY3AuaW1nLgo+ID4gPiB0aGF0IG1lYW5zIHRoZXJlIGlzIG9ubHkgb25lIGZpcm13YXJlIGZv
ciBhIHNwZWNpZmljIHBsYXRmb3JtLgo+ID4gPiBJIHRoaW5rIHdlIGNhbiBzZW5kIGEgUEFUQ0gg
dG8gbWFrZSBmaXJtd2FyZSBuYW1lIG9mIHNjcCBiZWluZwo+ID4gPiBtb3JlCj4gPiA+IGZsZXhp
YmxlLgo+ID4gPiAKPiA+ID4gTWF5YmUgZ2V0IGZpcm13YXJlIG5hbWUgZnJvbSBkdHMuIGUuZy4s
Cj4gPiA+ICZzY3Agewo+ID4gPiAJc3RhdHVzID0gIm9rYXkiOwo+ID4gPiAJZmlybXdhcmUtbmFt
ZSA9ICJtZWRpYXRlay9tdDgxeHgvc2NwLmltZyI7Cj4gPiA+IH07Cj4gPiA+IAo+ID4gPiBEbyB5
b3UgdGhpbmsgaXQgZmVhc2libGU/Cj4gPiA+IElmIHlvdSBoYXZlIGFueSBjb25jZXJucywgcGxl
YXNlIGxldCB1cyBrbm93Lgo+ID4gPiAKPiA+ID4gVGhhbmtzLAo+ID4gPiBBbGxlbgo+ID4gPiAK
PiA+IAo+ID4gSGVsbG8gQWxsZW4sCj4gPiAKPiA+IHdoYXQgeW91IHByb3Bvc2VkIGlzIGV4YWN0
bHkgd2hhdCBoYXMgYmVlbiBkb25lIGZvciBvdGhlciBwbGF0Zm9ybXMKPiA+IGJlY2F1c2Ugb2YK
PiA+IGJvdGggcGVyLWRldmljZSBmaXJtd2FyZSBkaWZmZXJlbmNlcyAoZGlmZmVyZW50IHNpZ25h
dHVyZXMpIGFuZAo+ID4gcGVyLVNvQyAoZGlmZmVyZW50Cj4gPiBmaXJtd2FyZSBlbnRpcmVseSks
IGZvdW5kIG9uIFRJIEszLCBpTVggRFNQLCBRdWFsY29tbSBNU1MvRFNQCj4gPiByZW1vdGVwcm9j
IGFuZAo+ID4gb3RoZXJzLgo+ID4gCj4gPiBPZiBjb3Vyc2UgdGhpcyBpcyBhbiBhY2NlcHRlZCB3
YXkgdG8gcmVzb2x2ZSB0aGlzIHNpdHVhdGlvbjogcGxlYXNlCj4gPiBnbyBvbiEKPiAKPiBMb29r
cyBnb29kIHRvIG1lISAoZG9uJ3QgZm9yZ2V0IHRvIGtlZXAgYSBmYWxsYmFjayB0bwo+IC9saWIv
ZmlybXdhcmUvc2NwLmltZyB0bwo+IG1haW50YWluIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkpLgo+
IAoKTm8gcHJvYmxlbS4gSSBoYXZlIHNlbnQgYW4gdXBzdHJlYW0gUEFUQ0ggZm9yIHNjcCBmaXJt
d2FyZSBwYXRoLgoKcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9s
aXN0Lz9zZXJpZXM9NjMyMjY4Cgp0aGFua3MgZm9yIHlvdXIgY29tbWVudHMsCkFsbGVuCgo+ID4g
Cj4gPiBDaGVlcnMsCj4gPiBBbmdlbG8KPiA+IAo+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
