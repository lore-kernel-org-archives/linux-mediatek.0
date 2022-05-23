Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB7DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 10:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wp81njli0sURy6KARK3b4EJZwAk4OejOJXvi2sdtmYg=; b=wTDP3oJJo8VCoq
	exXYlLMj4EunboN1ABVtJn22jE2BbmCyxjqjecNzLZCcxUJfKw3iczn04Juf28wgki3EZj+PDUyME
	MD0w3u3LXNk2kT5+J66hQpbwaB4m8UAiM6ZRmJckh+ULsepKVNmTnWjE2yPvhhRD0Xu/CZYTQtoaA
	BECmJFt8Z5c6aBYl5/bva0YRiCGrYThRUQn4IHty04JN28MAuW/ReWkvnzg1YAPZAIS4E+xmORWg5
	NgbfiRJ7TK3tJwmHNauZiLOWBglm7NBokMSKtMcfDyBTYkE2BefkG5vt/xwdVnyfYBP/hVZ1PutdL
	tgYdssSp14c40oQjdVsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt5JX-003FeO-UZ; Mon, 23 May 2022 10:29:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt4Am-002lZz-GD; Mon, 23 May 2022 09:16:21 +0000
X-UUID: 5a1a8eec296748aa96751cc6678a1164-20220523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:8552312a-59d0-49ff-9ed7-87b7aa44f6f8, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:b832477a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 5a1a8eec296748aa96751cc6678a1164-20220523
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1561189453; Mon, 23 May 2022 02:16:14 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 02:16:12 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 23 May 2022 17:16:11 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 23 May 2022 17:16:11 +0800
Message-ID: <22cd7cd3be53bdb671c9774431ce0b78aaeac9a9.camel@mediatek.com>
Subject: Re: [PATCH v8 17/19] dt-bindings: reset: mediatek: Add infra_ao
 reset index for MT8186
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <p.zabel@pengutronix.de>, <nfraprado@collabora.com>,
 <chun-jie.chen@mediatek.com>, <wenst@chromium.org>,
 <runyang.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 23 May 2022 17:16:11 +0800
In-Reply-To: <be340e39-ffd4-63ec-ec91-ea4f7a475650@collabora.com>
References: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
 <20220523060056.24396-18-rex-bc.chen@mediatek.com>
 <be340e39-ffd4-63ec-ec91-ea4f7a475650@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_021620_576067_CC3FE555 
X-CRM114-Status: UNSURE (   8.86  )
X-CRM114-Notice: Please train this message.
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

T24gTW9uLCAyMDIyLTA1LTIzIGF0IDExOjA1ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToKPiBJbCAyMy8wNS8yMiAwODowMCwgUmV4LUJDIENoZW4gaGEgc2NyaXR0bzoK
PiA+IFRvIHN1cHBvcnQgcmVzZXQgb2YgaW5mcmFfYW8sIGFkZCB0aGUgaW5kZXggb2YgaW5mcmFf
YW8gcmVzZXQgb2YKPiA+IHRoZXJtYWwvc3ZzIGZvciBNVDgxODYuCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IFJleC1CQyBDaGVuIDxyZXgtYmMuY2hlbkBtZWRpYXRlay5jb20+Cj4gPiBBY2tlZC1i
eTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiA+IFJldmlld2VkLWJ5OiBOw61jb2xh
cyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+Cj4gPiBUZXN0ZWQtYnk6
IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KPiAKPiBS
ZXgsIHNvcnJ5IGJ1dCB5b3UndmUgcHJvYmFibHkgbWlzdW5kZXJzdG9vZCBOaWNvbGFzJyBUZXN0
ZWQtYnkuLi4gaGUKPiBoYXMKPiB0ZXN0ZWQgdGhlc2Ugb24gTVQ4MTkyLCBzbyBoaXMgVC1iIHRh
ZyBpcyBub3QgYXBwbGljYWJsZSB0byBNVDgxODYsCj4gTVQ4MTk1Lgo+IAo+IEFueXdheToKPiAK
PiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPAo+IGFuZ2Vsb2dpb2Fj
Y2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KPiAKCm9oLi4KU29ycnkgZm9yIHRoaXMuCkkg
d2lsIHJlc2VuZCB2OCB0byByZW1vdmUgdGhlbS4KCkJScywKUmV4CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
