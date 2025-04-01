Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBABFC36010
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Apr 2025 13:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbI2Sl+AnnJwcp7yBNVtQ6ux8v9W3NtusM9HJJh1DXs=; b=lhiXfTd7LE1k1nNlwD2DNiKk6S
	/sjOrjN9/MO/XI5Hpw9Dfrel4wZdk6sqtzu8HrZlnNVNTf3ZKwHyOmzMbR/jlzry2JpEhzvMIYj5A
	J01sdFDuAxm/qc8x81ee9+CgTVCB7MU7a0Cy8Gzd9M54buvogDkA/V9dgfNs7hLgScbf3mb+XK5+O
	JEtdK0xrZO4lH1P/iOH5PNtKcQM3GeVvMfVwrTSqFtgWgZlMfbMffrXvsIC+ekhbJiA9Lg6AEtTNu
	7XynTohXDhwkPnNYanPpgH6v4gIu68zG5gA/UjUXCfSUvvYG23rnAaeD7fSO3GNfxZ1AMyF5QLr0D
	BJHDxX5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzblC-00000003S0D-3wCS;
	Tue, 01 Apr 2025 13:34:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbje-00000003Rpv-2EkJ
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Apr 2025 13:32:59 +0000
X-UUID: c8afcdf20efd11f0a1e849db4cc18d44-20250401
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=WbI2Sl+AnnJwcp7yBNVtQ6ux8v9W3NtusM9HJJh1DXs=;
	b=uqRpMQTTnIMDq/RVmF5XldtMGkfKTaCumGOlx32f6sNEwtJ3OFRoYozdVQyPDHffopRAavI1dbdkq6bnBdMwLugd2JnMRCSHWJ2Jlf+LKTciCIJGIPsjnnhB9Nd3wUGMAkbipzf/40aAcIg/mhRLCWEoYNzpec+oltWoBgmcjgk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:209adac0-c0de-4def-8ee9-177e6adcd21a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:bb5510c7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c8afcdf20efd11f0a1e849db4cc18d44-20250401
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 497999596; Tue, 01 Apr 2025 06:32:40 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 1 Apr 2025 21:32:38 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1258.39 via Frontend
 Transport; Tue, 1 Apr 2025 21:32:38 +0800
Message-ID: <66ad12add768fe0ee6936a8fff19c1dea76508cd.camel@mediatek.com>
Subject: Re: [PATCH 04/10] wifi: mt76: mt7996: rework DMA configuration for
 mt7990
From: Shayne Chen <shayne.chen@mediatek.com>
To: Ping-Ke Shih <pkshih@realtek.com>, Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Date: Tue, 1 Apr 2025 21:32:38 +0800
In-Reply-To: <2f4874d10d86432693c73bfcb76e56dc@realtek.com>
References: <20250328055058.1648755-1-shayne.chen@mediatek.com>
	 <20250328055058.1648755-5-shayne.chen@mediatek.com>
	 <2f4874d10d86432693c73bfcb76e56dc@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_063258_581763_C15B03CD 
X-CRM114-Status: GOOD (  10.61  )
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

T24gTW9uLCAyMDI1LTAzLTMxIGF0IDA1OjQ3ICswMDAwLCBQaW5nLUtlIFNoaWggd3JvdGU6Cj4g
Cj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW50aWwKPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lgo+IAo+IAo+IFNoYXluZSBDaGVuIDxzaGF5bmUuY2hlbkBtZWRpYXRlay5jb20+IHdyb3Rl
Ogo+IAo+IFsuLi5dCj4gCj4gPiAtwqDCoMKgwqDCoMKgIGlmIChpc19tdDc5OTYoJmRldi0+bXQ3
NikpIHsKPiA+ICvCoMKgwqDCoMKgwqAgc3dpdGNoIChtdDc2X2NoaXAoJmRldi0+bXQ3NikpIHsK
PiA+ICvCoMKgwqDCoMKgwqAgY2FzZSBNVDc5OTJfREVWSUNFX0lEOgo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgUlhRX0NPTkZJRyhNVF9SWFFfQkFORDFfV0EsIFdGRE1BMCwKPiA+
IE1UX0lOVF9SWF9ET05FX1dBX0VYVCwgTVQ3OTk2X1JYUV9NQ1VfV0FfRVhUKTsKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFJYUV9DT05GSUcoTVRfUlhRX0JBTkQxLCBXRkRNQTAs
Cj4gPiBNVF9JTlRfUlhfRE9ORV9CQU5EMSwgTVQ3OTk2X1JYUV9CQU5EMSk7Cj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPiA+ICvCoMKgwqDCoMKgwqAgY2FzZSBNVDc5
OTBfREVWSUNFX0lEOgo+IAo+IERvZXMgaXQgbWVhbiBNVDc5OTBfREVWSUNFX0lEXzIvTVQ3OTky
X0RFVklDRV9JRF8yIChzdWZmaXggd2l0aCBfMikKPiBoYXMgZGlmZmVyZW50Cj4gYmVoYXZpb3Ig
ZnJvbSBNVDc5OTBfREVWSUNFX0lEL01UNzk5Ml9ERVZJQ0VfSUQgPwo+IApUaG9zZSB3aXRoICJf
MiIgYXJlIG1haW5seSB1c2VkIGZvciB0aGUgcmVnaXN0cmF0aW9uIG9mIHNlY29uZGFyeSBQQ0ll
LgoKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFJYUV9DT05GSUcoTVRfUlhRX0JB
TkQxLCBXRkRNQTAsCj4gPiBNVF9JTlRfUlhfRE9ORV9CQU5EMSwgTVQ3OTk2X1JYUV9CQU5EMSk7
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBSWFFfQ09ORklHKE1UX1JYUV9UWEZS
RUVfQkFORDAsIFdGRE1BMCwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBNVF9JTlRfUlhfVFhGUkVFX0JBTkQwX01UNzk5MCwKPiA+IE1UNzk5
MF9SWFFfVFhGUkVFMCk7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZGV2
LT5oaWYyKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFJYUV9DT05GSUcoTVRfUlhRX1RYRlJFRV9CQU5EMSwgV0ZETUEwLAo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBN
VF9JTlRfUlhfVFhGUkVFX0JBTkQxX01UNzk5MCwKPiA+IE1UNzk5MF9SWFFfVFhGUkVFMSk7Cj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPiA+ICvCoMKgwqDCoMKgwqAg
Y2FzZSBNVDc5OTZfREVWSUNFX0lEOgo+ID4gK8KgwqDCoMKgwqDCoCBkZWZhdWx0Ogo+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIG10Nzk5NiBiYW5kMiAqLwo+ID4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUlhRX0NPTkZJRyhNVF9SWFFfQkFORDIsIFdGRE1BMCwK
PiA+IE1UX0lOVF9SWF9ET05FX0JBTkQyLCBNVDc5OTZfUlhRX0JBTkQyKTsKPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBSWFFfQ09ORklHKE1UX1JYUV9CQU5EMl9XQSwgV0ZETUEw
LAo+ID4gTVRfSU5UX1JYX0RPTkVfV0FfVFJJLCBNVDc5OTZfUlhRX01DVV9XQV9UUkkpOwo+ID4g
LcKgwqDCoMKgwqDCoCB9IGVsc2Ugewo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LyogbXQ3OTkyIGJhbmQxICovCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBSWFFf
Q09ORklHKE1UX1JYUV9CQU5EMSwgV0ZETUEwLAo+ID4gTVRfSU5UX1JYX0RPTkVfQkFORDEsIE1U
Nzk5Nl9SWFFfQkFORDEpOwo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUlhRX0NP
TkZJRyhNVF9SWFFfQkFORDFfV0EsIFdGRE1BMCwKPiA+IE1UX0lOVF9SWF9ET05FX1dBX0VYVCwg
TVQ3OTk2X1JYUV9NQ1VfV0FfRVhUKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFJYUV9DT05GSUcoTVRfUlhRX0JBTkQyLCBXRkRNQTAsCj4gPiBNVF9JTlRfUlhfRE9ORV9CQU5E
MiwgTVQ3OTk2X1JYUV9CQU5EMik7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBi
cmVhazsKPiA+IMKgwqDCoMKgwqDCoMKgIH0KPiA+IAo+ID4gwqDCoMKgwqDCoMKgwqAgaWYgKGRl
di0+aGFzX3Jybykgewo+IAo+IAo+IAoK


