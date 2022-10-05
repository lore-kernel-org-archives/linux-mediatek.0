Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7422C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 03:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gTLLiFMlN3RC6w90pG5GW+lvM0z4OMepa/4HpuA97sI=; b=pA7xsD0NKr0KdoVtdwkF29XFRA
	FjTJ2SuiygOqhe0/rHn1dnfSnjL657npvn+jHUp2E3kub7mney/SMOiyMa90vn0PwOMkkilynbL/O
	vodHtqHsZNR+fiJVWnGv5elbYp5GsbPWrJLu2Ycte9JSRWikfx6tUK+Te448ABFXY1gC+vhE7LB9A
	DozC79fLRGC0yJLyTYJGTeIiuko5lyhByHZbZX+wOz7wfFNjEm8vGPboRjjbjUkmXzRv7yQlWYuKM
	Gg/USmsrKY6dqfs3dR2uZ8SF1ZQxznCiZxT+wfmGNtH4nxmciNCwEEGXYujfCT1OewOiG2rpxxtAH
	hPtIsW+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofvMb-00CGy5-Tr; Wed, 05 Oct 2022 03:46:29 +0000
Received: from maillog.itri.org.tw ([61.61.254.185] helo=MailR1.itri.org.tw)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofvMY-00CGx5-02
	for linux-mediatek@lists.infradead.org; Wed, 05 Oct 2022 03:46:28 +0000
Received: from msx.itri.org.tw (unknown [140.96.155.56])
	by MailR1.itri.org.tw (Postfix) with ESMTP id EBFE7E1F06;
	Wed,  5 Oct 2022 11:46:19 +0800 (CST)
Received: from EXMB11.ITRI.DS (140.96.155.55) by EXMB12.ITRI.DS
 (140.96.155.56) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Wed, 5 Oct
 2022 11:46:19 +0800
Received: from EXMB11.ITRI.DS ([fe80::e84e:22f3:d3d:a8e5]) by EXMB11.ITRI.DS
 ([fe80::e84e:22f3:d3d:a8e5%18]) with mapi id 15.00.1497.040; Wed, 5 Oct 2022
 11:46:12 +0800
From: <LinChinting@itri.org.tw>
To: <ryder.lee@mediatek.com>
CC: <linux-mediatek@lists.infradead.org>
Subject: Driver of MT7915 for Raspberry Pi Compute Module 4
Thread-Topic: Driver of MT7915 for Raspberry Pi Compute Module 4
Thread-Index: AdjYbQJVd5VSPT6bR06Ngy2wJlih1g==
Date: Wed, 5 Oct 2022 03:46:12 +0000
Message-ID: <0708ffbb3b404cf8b08e852e8083eb91@EXMB11.ITRI.DS>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.2.242.20]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_204626_192497_AAC8F6E9 
X-CRM114-Status: UNSURE (   5.24  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RGVhciBMZWUsDQoNCkFzIHRoZSB0aXRsZSwgSSB3YW50IHRvIHVzZSB0aGUgV2ktRmkgNiBjaGlw
IChBc2lhIFJGIEFXNzkxNS1OUDEgTVQ3OTE1QU4pIG9uIG15IHJhc3BiZXJyeSBwaSBjbTQuDQoN
CkkgdXNlZCB0aGUNClN5c3RlbTogVWJ1bnR1IDIyLjA0LjEgTFRTDQpLZXJuZWw6IExpbnV4IHVi
dW50dSA1LjE5LjAtMTAwMi1yYXNwaSAjNi1VYnVudHUgU01QIFBSRUVNUFQgV2VkIFNlcCAyOCAw
OToyMDozMiBVVEMgMjAyMiBhYXJjaDY0IGFhcmNoNjQgYWFyY2g2NCBHTlUvTGludXgNCg0KYW5k
IEkgaGF2ZSBlbmFibGVkIHRoZSBtdDc5MTVlIG1vZHVsZSB3aXRoICJtb2Rwcm9iZSBtdDc5MTVl
IiwgYW5kICJsc2NwaSIgc2hvd3MgYmVsb3c6DQpodHRwczovL2ZpbGVkbi5jb20vbHYyM0tjc3pt
bzc0cWV0d01nbWRQdzgvc2hhcmVkLzAwMS5wbmcNCg0KImRtc2ciIHNob3dzIGJlbG93Og0KaHR0
cHM6Ly9maWxlZG4uY29tL2x2MjNLY3N6bW83NHFldHdNZ21kUHc4L3NoYXJlZC8wMDIucG5nDQoN
Ckkgd2FudCB0byBhc2sgdGhhdCBhcmUgdGhlcmUgaGF2ZSBhbnkgc29sdXRpb24gZm9yIG15IHNp
dHVhdGlvbiwNCmp1c3QgbGlrZSBpbnRlbCdzIGRyaXZlciAoaHR0cHM6Ly93d3cuaW50ZWwuY29t
LnR3L2NvbnRlbnQvd3d3L3R3L3poL3N1cHBvcnQvYXJ0aWNsZXMvMDAwMDA1NTExL3dpcmVsZXNz
Lmh0bWwpIG9yIGFueSBlbHNlPw0KDQoNCk1hbnkgdGhhbmtzLg0KDQpTaW5jZXJlbHksDQpMaW4s
IENoaW4tdGluZyAyMDIyLjEwLjUNCg0KDQotLQ0KpburSKXzpWmv4KVdp3SkdazjsHy+97FLuOqw
VKFBq0Sr/Kl3pKemrKXzqsyhQb3QpMWoz6XOqc60psVTpburSKXzpLquZaFBqMO90L5Qt7SmuatI
pfOhQyBUaGlzIGVtYWlsIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbi4gUGxl
YXNlIGRvIG5vdCB1c2Ugb3IgZGlzY2xvc2UgaXQgaW4gYW55IHdheSBhbmQgZGVsZXRlIGl0IGlm
IHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQuDQo=

