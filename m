Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3F0C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 10:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RaYkj2QML54vQkczIQWUzEtuoC/m95ngfwEcZlkwW6I=; b=xX8Qz5GkmHhTZMffMf0RXtuuP+
	P7dP7bl35oDQ/ALucDRH/CDHPf+CdZ6l07ALPPkrDuYAUU4Xcs7GIe+x8K+lOeB4gHxHuI+NY8/hl
	pcQUsDyjBBIUAjFbKjBexCFzrXbKvJNU6aB8bQdbyZ0dD7rj8PDv/J47CFDEODM0JX5VjOfSRJJw7
	hLOk2EhiF72D5mTANJsE/tp15Rrm4KXjDfrwHvluHIS2AHWg6h0/lyXBmQIs5/4/Va+IBCzsQ3G0G
	rAfcXwGC3QjpjDduuja5icNvpePM0oiDQca5MpwelwgbSsd/hxJ3dr0BFJoDaarMXTf3puDRI6VVv
	TgAVGSbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7wxR-005M0y-Nf; Thu, 13 Jan 2022 10:03:49 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7wwr-005Llw-1y; Thu, 13 Jan 2022 10:03:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 97D7D1F4585B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642068190;
 bh=G8nBdeF/R9SdmprCsahGrlU1tfz8CAidNVYiyTASIzA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=WBYPZlm7keYLMomihEqnfQu0VLd73SPqKjS9RHXRYo9CtWqPrz5+tITVoBKUYPS5z
 sROe8eK82u3u5Lx8PBKriAkmX9Beirv2zaxJfVb0BAAP1Ael0MeO73Ram4npmOjrGq
 OmOBEL8Hx0f3u0mSe2aayhWZ3J5ki4UJn/C6VoRbYmOEeJWtIMtBWpugYdwPgHZAo5
 OOVvWMzwhmAlT5NxDSyGK0NCrio1p+J+73XogSrreHnEW4Qt78T/Avc7307enK3mQV
 wgmEX9ixM308ChpNAZnOIBFimO9hyAS6LWkJycFKw5kEZ+XN95vSGkxXrCwf6F6pJh
 KRYxtFJVgY8tQ==
Subject: Re: [PATCH v4 3/5] arm64: dts: mediatek: Correct Nor Flash clock of
 MT8192
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 nfraprado@collabora.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 chun-jie.chen@mediatek.com, devicetree@vger.kernel.org,
 drinkcat@chromium.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, Chen-Yu Tsai <wenst@chromium.org>,
 Ryder Lee <ryder.lee@kernel.org>
References: <20220113065822.11809-1-allen-kh.cheng@mediatek.com>
 <20220113065822.11809-4-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <e9becd98-f9ea-3119-cfea-d94d04d5ebe6@collabora.com>
Date: Thu, 13 Jan 2022 11:03:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220113065822.11809-4-allen-kh.cheng@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_020313_275246_D9C57E7C 
X-CRM114-Status: GOOD (  13.95  )
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

SWwgMTMvMDEvMjIgMDc6NTgsIGFsbGVuLWtoLmNoZW5nIGhhIHNjcml0dG86Cj4gRnJvbTogQWxs
ZW4tS0ggQ2hlbmcgPEFsbGVuLUtILkNoZW5nQG1lZGlhdGVrLmNvbT4KPiAKPiBXaGVuIHRoZSBp
bml0aWFsIGRldmljZXRyZWUgZm9yIG10ODE5MiB3YXMgYWRkZWQgaW4gNDg0ODk5ODBlMjdlICgi
YXJtNjQ6Cj4gZHRzOiBBZGQgTWVkaWF0ZWsgU29DIE1UODE5MiBhbmQgZXZhbHVhdGlvbiBib2Fy
ZCBkdHMgYW5kIE1ha2VmaWxlIiksIHRoZQo+IGNsb2NrIGRyaXZlciBmb3IgbXQ4MTkyIHdhcyBu
b3QgeWV0IHVwc3RyZWFtLCBzbyB0aGUgY2xvY2sgcHJvcGVydHkgbm9kZXMKPiB3ZXJlIHNldCB0
byB0aGUgY2xrMjZtIGNsb2NrIGFzIGEgcGxhY2Vob2xkZXIuCj4gCj4gR2l2ZW4gdGhhdCB0aGUg
Y2xvY2sgZHJpdmVyIGhhcyBzaW5jZSBiZWVuIGFkZGVkIHRocm91Z2ggNzEwNTczZGVlMzFiICgi
Y2xrOgo+IG1lZGlhdGVrOiBBZGQgTVQ4MTkyIGJhc2ljIGNsb2NrcyBzdXBwb3J0IiksIGFzIHdl
bGwgYXMgaXRzIGR0LWJpbmRpbmdzCj4gdGhyb3VnaCBmMzVmMWEyM2UwZTEgKCJjbGs6IG1lZGlh
dGVrOiBBZGQgZHQtYmluZGluZ3Mgb2YgTVQ4MTkyIGNsb2NrcyIpIGFuZAo+IGRldmljZXRyZWUg
bm9kZXMgdGhyb3VnaCA1ZDJiODk3YmM2ZjUgKCJhcm02NDogZHRzOiBtZWRpYXRlazogQWRkIG10
ODE5Mgo+IGNsb2NrIGNvbnRyb2xsZXJzIiksIGZpeCB0aGUgTm9yIEZsYXNoIGNsb2NrIHByb3Bl
cnR5IHRvIHBvaW50IHRvIHRoZSBhY3R1YWwKPiBjbG9jay4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBB
bGxlbi1LSCBDaGVuZyA8QWxsZW4tS0guQ2hlbmdAbWVkaWF0ZWsuY29tPgo+IFJldmlld2VkLWJ5
OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+CgpSZXZp
ZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVs
cmVnbm9AY29sbGFib3JhLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
