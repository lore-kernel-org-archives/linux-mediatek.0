Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE74AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 13:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UMuklpdaV3Sc5CS/dMp7yBLBQ2FasrN3ztw1/18dKQQ=; b=nxmSDcUBRLlSVw
	3BkhDSFq47ZEMxvqbMiGm2XO4NsLw1fwd3bQ9pwS73rvUN6KksI3L7oi14fZzw9T8GmsOaJFtID+D
	qFdJcgAjF4sYPOp3fmV/XbBZFimEEr0LyWGcF4smHsqlFrdII+8Lbd2SUbYNnPCZp4c1/3UnWrP0X
	FYiLaYDYk/eN1zykZOF8RJnknpmmVSW7yJX03RP3WabaJcTzRlUBglKCRuq6zEVkLHRhwugg/fCQj
	U1E+fbiN4CVUro7TbmjHgpyM89CxGnX6cAJFLB/AboNNnv+AyAPSCxOcb9dN4BG4KGjsV7BoZI5mY
	FmlgRPcNqTV7cOX7MXtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMrnh-00EX1G-V2; Wed, 23 Feb 2022 13:35:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrnL-00EWqz-CC; Wed, 23 Feb 2022 13:35:08 +0000
X-UUID: 3119b1cdff834f01b759c8a27d8e2d4c-20220223
X-UUID: 3119b1cdff834f01b759c8a27d8e2d4c-20220223
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 482918474; Wed, 23 Feb 2022 06:34:58 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Feb 2022 05:34:56 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Feb 2022 21:34:55 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Feb 2022 21:34:55 +0800
Message-ID: <a3f13c65c4d36f447f2159fe46ba66b93031b97c.camel@mediatek.com>
Subject: Re: [PATCH v2 15/23] arm64: dts: mt8192: Add m4u and smi nodes
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, --to=Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Date: Wed, 23 Feb 2022 21:34:55 +0800
In-Reply-To: <20220222214822.3sxsbjrtm6ild6rx@notapiano>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-16-allen-kh.cheng@mediatek.com>
 <20220222214822.3sxsbjrtm6ild6rx@notapiano>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_053503_442588_7B76CB02 
X-CRM114-Status: GOOD (  11.79  )
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

T24gVHVlLCAyMDIyLTAyLTIyIGF0IDE2OjQ4IC0wNTAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToKPiBPbiBGcmksIEZlYiAxOCwgMjAyMiBhdCAwNToxNjoyNVBNICswODAwLCBBbGxl
bi1LSCBDaGVuZyB3cm90ZToKPiA+ICsJCWxhcmIxNjogbGFyYkAxYTAwZjAwMCB7Cj4gPiArCQkJ
Y29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItc21pLWxhcmIiOwo+ID4gKwkJCXJlZyA9IDww
IDB4MWEwMGYwMDAgMCAweDEwMDA+Owo+ID4gKwkJCW1lZGlhdGVrLGxhcmItaWQgPSA8MTY+Owo+
ID4gKwkJCW1lZGlhdGVrLHNtaSA9IDwmc21pX2NvbW1vbj47Cj4gPiArCQkJY2xvY2tzID0gPCZj
YW1zeXNfcmF3YSBDTEtfQ0FNX1JBV0FfQ0FNPiwKPiA+ICsJCQkJIDwmY2Ftc3lzX3Jhd2EgQ0xL
X0NBTV9SQVdBX0xBUkJYPjsKPiA+ICsJCQljbG9jay1uYW1lcyA9ICJhcGIiLCAic21pIjsKPiA+
ICsJCQltZWRpYXRlayxzbWktaWQgPSA8MTY+Owo+IAo+IFRoaXMgbWVkaWF0ZWssc21pLWlkIHBy
b3BlcnR5IGlzbid0IGhhbmRsZWQgaW4gdGhlIGRyaXZlciBvcgo+IG1lbnRpb25lZCBpbiB0aGUK
PiBkdC1iaW5kaW5nLCBhbmQgc2VlbXMgcmVkdW5kYW50IHRvIG1lZGlhdGVrLGxhcmItaWQuIFNv
IGp1c3QgZHJvcCBpdC4KPiAKPiBPdGhlciB0aGFuIHRoYXQsCj4gCj4gUmV2aWV3ZWQtYnk6IE7D
rWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KCkkgd2lsbCBk
cm9wIHRoaXMgZnJvbSBzZXJpZXMuIHRoYW5rcy4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
