Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6020EC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 12:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eYV4qOJG+RHuo4TjK9luGIaXxRZ1kQgGR7uFzGM98dQ=; b=f8Mors9Tn7nSBL
	7F3Lu5b/VFnLKAu5aL4+3wl+qHfZrPca5Hpk3NJAo9b9uoqiCcE9qSkHqFoWNNTjfK6e8dO8slogJ
	qwgPsXIkmnokD9jwE9HCSeAZA7wyy74ci519od2uKhhafyrobPBuXWzc/xSJJekl3MoV5wXS0suTS
	GPAScRL39cZC7T+Qk16AWzo5DCwH/JggbPYZIroIQUJ6F6Vj1JSb8CBRsExyt5DYSx0DGT3uDoIbX
	N5iQ/rkSemfapmKx7msgQA2X8iUTqLa1ATRepOUxqX0mMDRqnd3AmiOB3YqJRrizgjYVoUDzUdf5x
	RJw6SNJAJ2arTDOIgtWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmaUJ-00Fmls-AR; Thu, 05 May 2022 12:21:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmaU8-00Fmii-3Y; Thu, 05 May 2022 12:21:33 +0000
X-UUID: 72031bc9da4f4c4b83f66648512fca8c-20220505
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:0fc81f4a-678f-4dad-a814-e646de477abc, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:1,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:1
X-CID-META: VersionHash:faefae9, CLOUDID:18795216-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 72031bc9da4f4c4b83f66648512fca8c-20220505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1325839383; Thu, 05 May 2022 05:21:23 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 May 2022 05:21:22 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 5 May 2022 20:21:20 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 5 May 2022 20:21:20 +0800
Message-ID: <9f0d1d279c838bc46d499aa020a6b47a8a25f6f4.camel@mediatek.com>
Subject: Re: [PATCH v8 2/2] arm64: dts: Add MediaTek SoC MT8186 dts and
 evaluation board and Makefile
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 <hsinyi@chromium.org>
Date: Thu, 5 May 2022 20:21:20 +0800
In-Reply-To: <20220429213907.d2lwnukugoa7owxn@notapiano>
References: <20220428061717.11197-1-allen-kh.cheng@mediatek.com>
 <20220428061717.11197-3-allen-kh.cheng@mediatek.com>
 <20220428172736.qlkinujpxjxumsnx@notapiano>
 <20220429213907.d2lwnukugoa7owxn@notapiano>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_052132_189996_0F1FA224 
X-CRM114-Status: GOOD (  17.67  )
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

T24gRnJpLCAyMDIyLTA0LTI5IGF0IDE3OjM5IC0wNDAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToKPiBPbiBUaHUsIEFwciAyOCwgMjAyMiBhdCAwMToyNzo0MVBNIC0wNDAwLCBOw61j
b2xhcyBGLiBSLiBBLiBQcmFkbwo+IHdyb3RlOgo+ID4gSGkgQWxsZW4sCj4gPiAKPiA+IE9uIFRo
dSwgQXByIDI4LCAyMDIyIGF0IDAyOjE3OjE3UE0gKzA4MDAsIEFsbGVuLUtIIENoZW5nIHdyb3Rl
Ogo+ID4gPiArCQlzY3A6IHNjcEAxMDUwMDAwMCB7Cj4gPiA+ICsJCQljb21wYXRpYmxlID0gIm1l
ZGlhdGVrLG10ODE4Ni1zY3AiOwo+ID4gPiArCQkJcmVnID0gPDAgMHgxMDUwMDAwMCAwIDB4NDAw
MDA+LAo+ID4gPiArCQkJICAgICAgPDAgMHgxMDVjMDAwMCAwIDB4MTkwODA+Owo+ID4gPiArCQkJ
cmVnLW5hbWVzID0gInNyYW0iLCAiY2ZnIjsKPiA+IAo+ID4gVGhlIG10ayxzY3AgZHQtYmluZGlu
ZyBzaG91bGQgYmUgdXBkYXRlZCBhcyBpdCBjdXJyZW50bHkgZG9lc24ndAo+ID4gYWxsb3cgbDF0
Y20gdG8KPiA+IGJlIG1pc3NpbmcuIEFjY29yZGluZyB0byBjb21tZW50cyBpbiB0aGUgZHJpdmVy
IGNmZyBpcyBvcHRpb25hbCBhcwo+ID4gd2VsbCwgc28gYQo+ID4gcGF0Y2ggdG8gdGhlIGJpbmRp
bmcgbWFraW5nIGJvdGggb3B0aW9uYWwgd291bGQgYmUgZ3JlYXQuCj4gCj4gSGkgQWxsZW4sCj4g
Cj4gYWN0dWFsbHkgSSd2ZSBqdXN0IHNlbnQgYSBwYXRjaCBmb3IgdGhpcyBteXNlbGYgWzFdLCBh
cyBpdCB3YXMgYWxzbwo+IHJlcXVpcmVkIGZvcgo+IG10ODE5Mi1hc3VyYWRhLiBTb3JyeSBmb3Ig
dGhlIG5vaXNlLgo+IAo+IFRoYW5rcywKPiBOw61jb2xhcwo+IAo+IFsxXSAKPiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyMjA0MjkyMTExMTEuMjIxNDExOS0yLW5mcmFwcmFkb0Bjb2xs
YWJvcmEuY29tLwo+IAoKSGkgTsOtY29sYXMsCgpJIHRoaW5rIEkgY2FuIHJlbW92ZSBzY3Agbm9k
ZSBpbiBuZXh0IHZlcnNpb24gYW5kIHVwZGF0ZSB0aGlzIGluCmFub3RoZXIgUEFUQ0ggZm9yIFsx
XS4gCgp0aGFua3MsCgo+ID4gCj4gPiBUaGFua3MsCj4gPiBOw61jb2xhcwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
