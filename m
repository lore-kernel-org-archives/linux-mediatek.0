Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1666C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 11:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPAz+gywsCJG4wlvnrBjEQMnn6vQdtdDdOzwRxLFFjQ=; b=MYrzCpoGasoedc
	+trnKITJplwTP+Quc4fz2xHBjNw6BP514twMuIJ0boHExlmfO+0ci+0flIPsPwzKoGQwRP0aqqfTm
	NIG14NEFyPEE8IYjwyfiuiXAQz9KkIthO5vACASVzSaf3/APpAKtBk4pUV+cT6CFCLEloUtFAmCPe
	nqXfnkiYLcZ7VpocoQjRp6+Cupfuv8QeioPFI1dY0wMEmrLbfUDgxI+MOQd+bmi8ebrbjlhY+qmb3
	cVSBciFCGu8l1+ttWaMlI6mT9mm5qmKlEUa7SV/wVOcwDb24e0LAPAXz+U7xdBDBU7wEchJqzjhvf
	OgI5L1sxCrP+2FQvq+Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVAzw-001Ssm-5j; Fri, 18 Mar 2022 11:42:24 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVAzW-001Sir-CL; Fri, 18 Mar 2022 11:42:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C64901F45EBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647603717;
 bh=38LWzYJDtDdvCT+rEuKuiIONjBDiSSh7TRAEYzRgbQA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LhYBoKjN1NdA3+zF6zvnERYP7YgAG1aMkjiCxnTw00yK87owK5SvAoZTgcbtGmsxS
 1Qdc9p77vNYwYKLtPC8liOtDnZ9hETH8zPKUB7ZIwYy2HWcH7ysngbvny4F/KODc1a
 A3AHI0uAeTvvgJbd9dj9exQYEY5BqGkfk+mrgCnAuBVLFyJoMsWKl/bcgfp8WS88Ye
 4xvYWEHvnqsUnO9M9gBDFiMXZHlacSu3PI8ngrLnmwgVNTJpD4DDDScW/hCbCdNm8E
 aeet8ZhJ3srH2vf5L/01UD9oL1K3IYHgJ90wL3GfcUaTQygjVsfgNEhUgi+CqWgRQA
 3AqYF3cbDx5Gw==
Message-ID: <07a02061-6528-a772-c91f-a658c6170a83@collabora.com>
Date: Fri, 18 Mar 2022 12:41:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v1 00/10] Introduce support for MediaTek MT8192 Google
 Chromebooks
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220316151327.564214-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220316151327.564214-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_044158_615649_BDC16BC5 
X-CRM114-Status: GOOD (  15.10  )
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

SWwgMTYvMDMvMjIgMTY6MTMsIE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIGhhIHNjcml0dG86Cj4g
Cj4gVGhpcyBzZXJpZXMgaW50cm9kdWNlcyBEZXZpY2V0cmVlcyBmb3IgdGhlIE1UODE5Mi1iYXNl
ZCBBc3VyYWRhIHBsYXRmb3JtCj4gYXMgd2VsbCBhcyBBc3VyYWRhIFNwaGVyaW9uIGFuZCBBc3Vy
YWRhIEhheWF0byBib2FyZHMuCj4gCj4gU3VwcG9ydCBmb3IgdGhlIGJvYXJkcyBpcyBhZGRlZCB0
byB0aGUgZXh0ZW50IHRoYXQgaXMgY3VycmVudGx5IGVuYWJsZWQKPiBpbiB0aGUgbXQ4MTkyLmR0
c2ksIGFzIHRvIG5vdCBhZGQgYW55IGRlcGVuZGVuY2llcyB0byB0aGlzIHNlcmllcy4KPiAKPiBB
ZnRlciB0aGUgc2VyaWVzIGFkZGluZyB2YXJpb3VzIG1pc3Npbmcgbm9kZXMgb24gTVQ4MTkyIFsx
XSBpcyBtZXJnZWQsIGEKPiBuZXcgc2VyaWVzIHdpbGwgYmUgc2VudCBlbmFibGluZyB0aGUgcmVt
YWluaW5nIGRldmljZXMgb24gdGhlIEFzdXJhZGEKPiBwbGF0Zm9ybS4KPiAKPiBXaGlsZSB0aGUg
ZHRzIGZpbGVzIGFkZGVkIGluIHRoaXMgc2VyaWVzIGludHJvZHVjZSBhIGNvdXBsZSBuZXcKPiBk
dGJzX2NoZWNrIHdhcm5pbmdzLCB0aGV5IGFyZSBmaXhlZCBieSBhbm90aGVyIHNlcmllcyBbMl0u
Cj4gCj4gVGhpcyBzZXJpZXMgd2FzIHBlZXItcmV2aWV3ZWQgaW50ZXJuYWxseSBiZWZvcmUgc3Vi
bWlzc2lvbi4KClRoaXMgc2VyaWVzIHdhcyBub3Qgb25seSBwZWVyLXJldmlld2VkIGludGVybmFs
bHksIGJ1dCBhbHNvIHRlc3RlZCBzbywgZm9yIHRoZQplbnRpcmUgc2VyaWVzLCBvdGhlciB0aGFu
IG15IFItYiwgaWYgdGhhdCdzIHJlbGV2YW50OgoKVGVzdGVkLWJ5OiBBbmdlbG9HaW9hY2NoaW5v
IERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgoKPiAK
PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWF0ZWsvMjAyMjAzMDQxMzA4
MDkuMTI5MjQtMS1hbGxlbi1raC5jaGVuZ0BtZWRpYXRlay5jb20vCj4gWzJdIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhdGVrLzIwMjIwMzE1MjExOTM2LjQ0MjcwOC0xLW5mcmFw
cmFkb0Bjb2xsYWJvcmEuY29tLwo+IAo+IAo+IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvICgxMCk6
Cj4gICAgYXJtNjQ6IGR0czogbWVkaWF0ZWs6IEludHJvZHVjZSBNVDgxOTItYmFzZWQgQXN1cmFk
YSBib2FyZCBmYW1pbHkKPiAgICBhcm02NDogZHRzOiBtZWRpYXRlazogYXN1cmFkYTogRG9jdW1l
bnQgR1BJTyBuYW1lcwo+ICAgIGFybTY0OiBkdHM6IG1lZGlhdGVrOiBhc3VyYWRhOiBBZGQgc3lz
dGVtLXdpZGUgcG93ZXIgc3VwcGxpZXMKPiAgICBhcm02NDogZHRzOiBtZWRpYXRlazogYXN1cmFk
YTogRW5hYmxlIGFuZCBjb25maWd1cmUgSTJDIGFuZCBTUEkgYnVzc2VzCj4gICAgYXJtNjQ6IGR0
czogbWVkaWF0ZWs6IGFzdXJhZGE6IEFkZCBDaHJvbWVPUyBFQwo+ICAgIGFybTY0OiBkdHM6IG1l
ZGlhdGVrOiBhc3VyYWRhOiBBZGQga2V5Ym9hcmQgbWFwcGluZyBmb3IgdGhlIHRvcCByb3cKPiAg
ICBhcm02NDogZHRzOiBtZWRpYXRlazogYXN1cmFkYTogQWRkIENyNTAgVFBNCj4gICAgYXJtNjQ6
IGR0czogbWVkaWF0ZWs6IGFzdXJhZGE6IEFkZCBFbGFuIGVLVEgzMDAwIEkyQyB0cmFja3BhZAo+
ICAgIGFybTY0OiBkdHM6IG1lZGlhdGVrOiBhc3VyYWRhOiBBZGQgSTJDIHRvdWNoc2NyZWVuCj4g
ICAgYXJtNjQ6IGR0czogbWVkaWF0ZWs6IHNwaGVyaW9uOiBBZGQga2V5Ym9hcmQgYmFja2xpZ2h0
Cj4gCj4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL01ha2VmaWxlICAgICAgICAgfCAg
IDIgKwo+ICAgLi4uL2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS1oYXlhdG8tcjEuZHRzIHwg
IDE4ICsKPiAgIC4uLi9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS1zcGhlcmlvbi1yMC5kdHMgICB8
ICAzMyArCj4gICAuLi4vYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaSAgICAg
fCA2MTYgKysrKysrKysrKysrKysrKysrCj4gICA0IGZpbGVzIGNoYW5nZWQsIDY2OSBpbnNlcnRp
b25zKCspCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRl
ay9tdDgxOTItYXN1cmFkYS1oYXlhdG8tcjEuZHRzCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJj
aC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS1zcGhlcmlvbi1yMC5kdHMK
PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5
Mi1hc3VyYWRhLmR0c2kKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
