Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C02C36010
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Apr 2025 13:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKmdIz9yEkQAJPVrxeQ/9aE+lgCEA+KwLvSHeCD3Kzs=; b=fEtIyRD0csdfRhZz1efS1FkzAK
	yvsH7YYWBlkv3zo+cRhjVImKzUd8WrGOnUiPuTx5wLfwccw3QS/P+6GXqJL4wKkUp2wvoByM0uhg+
	ljDrIGlM8loX4dSpO4dj/Djntg6ua69lZxL9duQJ+R1SITb/79xccaTwroVSKj37X+AmmWlr32VmL
	ePPy6ncMTbVGLTs7rTWI8x+yoa1KLr5913uHCXb1ZKwbvBlbJBXvwacLFHwRZiGtQFg7nZllsCPWE
	WiQ+peS2i0RmqdiTJk3ZxXUgAn8nK0OV/igi0xg6f2+4aOAeHIVOAQ08QFbSoB7GK0DVKwDiQCjVv
	gRjXbAAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbxb-00000003UNJ-2wzI;
	Tue, 01 Apr 2025 13:47:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbxZ-00000003UMP-0OOK
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Apr 2025 13:47:22 +0000
X-UUID: d28d419a0eff11f0a1e849db4cc18d44-20250401
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=UKmdIz9yEkQAJPVrxeQ/9aE+lgCEA+KwLvSHeCD3Kzs=;
	b=WWZOM436Jk6Q9dmxySBQIakhw6B5B8pDFYyFaKlUtGSS8Z4138/iQ/NiBdd73A+EbKZDL5pX7QveuHwHML4eGVpFhc2FGhora6toGcrNCKbryx8w4j0Yrnbs8mulY2h8RiUpbo7YZ/l769AbJbHW4MmUSWmrK0RNHuIwScabrqI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:e451ede1-d5c8-4bb0-8be7-029b75d64cf8,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:da3e91a5-c619-47e3-a41b-90eedbf5b947,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d28d419a0eff11f0a1e849db4cc18d44-20250401
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1670918222; Tue, 01 Apr 2025 06:47:16 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 1 Apr 2025 21:47:13 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1258.39 via Frontend
 Transport; Tue, 1 Apr 2025 21:47:13 +0800
Message-ID: <29344a3f054368ae948415d6183365a09d1fe6d5.camel@mediatek.com>
Subject: Re: [PATCH 09/10] wifi: mt76: mt7996: rework background radar check
 for mt7990
From: Shayne Chen <shayne.chen@mediatek.com>
To: Ping-Ke Shih <pkshih@realtek.com>, Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>
Date: Tue, 1 Apr 2025 21:47:13 +0800
In-Reply-To: <59abf964667144b0ab10220e41b6b821@realtek.com>
References: <20250328055058.1648755-1-shayne.chen@mediatek.com>
	 <20250328055058.1648755-10-shayne.chen@mediatek.com>
	 <59abf964667144b0ab10220e41b6b821@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_064721_137918_95F82E77 
X-CRM114-Status: GOOD (  12.02  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDI1LTAzLTMxIGF0IDA1OjU1ICswMDAwLCBQaW5nLUtlIFNoaWggd3JvdGU6Cj4g
Cj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW50aWwKPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lgo+IAo+IAo+IFNoYXluZSBDaGVuIDxzaGF5bmUuY2hlbkBtZWRpYXRlay5jb20+IHdyb3Rl
Ogo+IAo+IFsuLi5dCj4gCj4gPiArCj4gPiArYm9vbCBtdDc5OTZfZWVwcm9tX2hhc19iYWNrZ3Jv
dW5kX3JhZGFyKHN0cnVjdCBtdDc5OTZfZGV2ICpkZXYpCj4gPiArewo+ID4gK8KgwqDCoMKgwqDC
oCBzd2l0Y2ggKG10NzZfY2hpcCgmZGV2LT5tdDc2KSkgewo+ID4gK8KgwqDCoMKgwqDCoCBjYXNl
IE1UNzk5Nl9ERVZJQ0VfSUQ6Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
ZGV2LT52YXIudHlwZSA9PSBNVDc5OTZfVkFSX1RZUEVfMjMzKQo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+ID4gK8KgwqDCoMKgwqDCoCBjYXNlIE1UNzk5
Ml9ERVZJQ0VfSUQ6Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZGV2LT52
YXIudHlwZSA9PSBNVDc5OTJfVkFSX1RZUEVfMjMpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGZhbHNlOwo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gPiArwqDCoMKgwqDCoMKgIGNhc2UgTVQ3OTkwX0RFVklD
RV9JRDogewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdTggcGF0aCwgcnhfcGF0
aCwgbnNzLCAqZWVwcm9tID0gZGV2LQo+ID4gPm10NzYuZWVwcm9tLmRhdGE7Cj4gPiArCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtdDc5OTZfZWVwcm9tX3BhcnNlX3N0cmVhbShl
ZXByb20sIE1UX0JBTkQxLCAmcGF0aCwKPiA+ICZyeF9wYXRoLCAmbnNzKTsKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIERpc2FibGUgYmFja2dyb3VuZCByYWRhciBjYXBhYmls
aXR5IGluIDNUM1IgKi8KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChwYXRo
ID09IDMgfHwgcnhfcGF0aCA9PSAzKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGJyZWFrOwo+ID4gK8KgwqDCoMKgwqDCoCB9Cj4gCj4gVGhlIGluZGVudGF0aW9uIG9m
IGNsb3NlIGJyYWNlIGxvb2tzIHdlaXJkLgoKV2lsbCBmaXggaXQsIHRoYW5rcy4KPiAKPiBTaW5j
ZSAtV2RlY2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVudCBpcyBkcm9wcGVkLCBJIHRoaW5rIGNvbXBp
bGVycwo+IHdpbGwgbm90Cj4gd2FybiB3aXRob3V0IHRoZSBicmFjZXMuIEJ1dCBub3RlIHRoYXQg
aXQgaXMgc3RpbGwgbm90IHJlY29tbWVuZGVkIHRvCj4gcHV0IGRlY2xhcmF0aW9ucyBpbiB0aGUg
bWlkZGxlLgo+IApTaW5jZSB0aG9zZSB2YXJpYWJsZXMgYXJlIGN1cnJlbnRseSBvbmx5IHVzZWQg
YnkgbXQ3OTkwIGNhc2UsIEkgdGhpbmsKdGhleSBjYW4gYmUgcHV0dGluZyB0aGVyZSBmb3IgdGhl
IG1vbWVudC4KCj4gPiArwqDCoMKgwqDCoMKgIGRlZmF1bHQ6Cj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7Cj4gPiArwqDCoMKgwqDCoMKgIH0KPiA+ICsKPiA+
ICvCoMKgwqDCoMKgwqAgcmV0dXJuIHRydWU7Cj4gPiArfQo+IAo+IAo+IAoK


