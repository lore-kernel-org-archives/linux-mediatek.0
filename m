Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB01C606A325
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 05:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FfBl13CO;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=K29dw5rh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6ed+ZpdLcvuNKLZa8bSVVf14gfJRXs7qehwJIFJLgxs=; b=FfBl13COvuYizL4KlFzVGfv92K
	oPiRt/STL63f93hr/AHsrHIRXs4kiv5aFoaZ1skI2l3oCAotEpQLpz08S/KKbxq4LrdmZsaP4+qAh
	V9tlEFwaGyopw7c/yIcaLrMWjZRB49rdBHL7QNh7XLzIcfvh8qA75cvmCougYYmWkqri7+ZaYTVlL
	R8R9m3pA/QBu7U/zoXY/ZE8ZfVa9mWiCaU4UoEG0IjpbiLbtsNrld8GhQtmnOj6JP+FuZuEDGafSq
	FLnDjAS7rXRUo3Dm5jdS/cyt0KfnONPRR8sTla3nvljQEPi13J7GixB35JSqyL7Me1grlGc1Gm8v9
	8pkwwkpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuli-0000000AuaK-1lVh;
	Thu, 19 Nov 2026 05:33:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTulg-0000000AuZe-2ccq
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Nov 2026 05:33:09 +0000
X-UUID: b0e12898e3da11f1acbe4559397dec65-20261118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=6ed+ZpdLcvuNKLZa8bSVVf14gfJRXs7qehwJIFJLgxs=;
	b=K29dw5rh08Vo+dp1Px+CLcCaw5V9ZUap2Fl3SDWFy699Ym+9dd4veXcLXvhT8zzo+op30ekvZ/ygVKRTbdaR880ZM4s/mKrXrJn5k1FOnGrLc3QP22huRLvrlrkCoNE/QQk4syQs2tTSHrXqBU9uQZ7uzb5xCxubor47X5On29Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:61300cd3-2bcb-41e7-8dc8-0091728cd8e5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:56fb7f66-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|836|865|888|898,TC:-5,Content:
	0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b0e12898e3da11f1acbe4559397dec65-20261118
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 752125862; Wed, 18 Nov 2026 22:33:03 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 19 Nov 2026 13:33:01 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Thu, 19 Nov 2026 13:33:01 +0800
Message-ID: <359c3c1f4b30aa837011788a847d5c2c1cb3880e.camel@mediatek.com>
Subject: Re: [PATCH v2 2/2] scsi: ufs-mediatek: keep mphy state in sync when
 va09 disable fails
From: Peter Wang <peter.wang@mediatek.com>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	<chaotian.jing@mediatek.com>
CC: <chu.stanley@gmail.com>, <alim.akhtar@samsung.com>, <bvanassche@acm.org>,
	<stanley.chu@mediatek.com>, <sashiko-bot@kernel.org>,
	<linux-scsi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Date: Thu, 19 Nov 2026 13:33:01 +0800
In-Reply-To: <20261118032015.974-3-laixiangwu@cmss.chinamobile.com>
References: <20261118032015.974-1-laixiangwu@cmss.chinamobile.com>
	 <20261118032015.974-3-laixiangwu@cmss.chinamobile.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.3-0ubuntu1.1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_213308_680513_0706EB47 
X-CRM114-Status: GOOD (  12.05  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCAyMDI2LTExLTE4IGF0IDExOjIwICswODAwLCBYaWFuZ3d1IExhaSB3cm90ZToKPiAK
PiBAQCAtNTQyLDYgKzU0MiwxNCBAQCBzdGF0aWMgaW50IHVmc19tdGtfbXBoeV9wb3dlcl9vbihz
dHJ1Y3QgdWZzX2hiYQo+ICpoYmEsIGJvb2wgb24pCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1ZnNfbXRrX3ZhMDlfcHdyX2N0cmwocmVzLCAwKTsKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IHJlZ3Vs
YXRvcl9kaXNhYmxlKGhvc3QtPnJlZ192YTA5KTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAqIFRoZSBNLVBIWSBpcyBvZmYgcmVnYXJkbGVzcyBvZiB0aGUg
dmEwOSByZXN1bHQsIHNvCj4ga2VlcAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
KiB0aGUgc3RhdGUgaW4gc3luYyB3aXRoIHRoZSBoYXJkd2FyZS7CoCBPdGhlcndpc2UKPiB0aGUg
bmV4dAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBwb3dlci1vbiBiYWlscyBv
dXQgdGhyb3VnaCB0aGUKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogIShvbiBe
IGhvc3QtPm1waHlfcG93ZXJlZF9vbikgY2hlY2sgd2l0aG91dAo+IHBvd2VyaW5nIHRoZQo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBNLVBIWSBiYWNrIG9uLgo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBob3N0LT5tcGh5X3Bvd2VyZWRfb24gPSBmYWxzZTsKCgpIaSBYaWFuZ3d1LAoKSWYgdGhlIFZB
MDkgcmVndWxhdG9yX2Rpc2FibGUgZmFpbHMsIGNvdWxkIHdlIGp1c3QgcmVzdG9yZQp0aGUgUEhZ
IHBvd2VyIHN0YXRlPwoKVGhhbmtzClBldGVyCgo=


