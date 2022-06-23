Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E22C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 02:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdQVFFCM4VJCN6tT7EBnd24VTfdCWPR1wDj/KdeULf0=; b=A7dF8hwaS9lop0R1bLXHLXb8EO
	c0sD60EYOQVPsoDohbCTjSTxqkzxVrCgPiEX11ak0se0rTjGK+2x6M5z9kRBL4jKkYmyt41QMEyuV
	VkWxXz3jc+x8+MH2y6JRe7Js7NKkS3ZoOnZ1DgA7MAj0CKAz5vzEXagqQJN4y0dNXQppAbR3PgRO9
	C1JmAovxZThQAzAMQZb/CnJvEegzqzL0aWjB4ocLFJVV9rrUbSlKQXBZ7cCfiu9dT5aX1a8tEnvPK
	MRWrBviUyZ4pBbNnqhzSkXB7gldZPXvWX1IQ7SHxKzAMphaipIWTK1l6hiXPWMc9T5/1FJbUD0Ls/
	FQjeYGAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4CVu-00CyIJ-64; Thu, 23 Jun 2022 02:24:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4CQQ-00Cvx5-IS; Thu, 23 Jun 2022 02:18:34 +0000
X-UUID: b0ba08ac28834ddd8354e8bb46ae0a60-20220622
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=pdQVFFCM4VJCN6tT7EBnd24VTfdCWPR1wDj/KdeULf0=;
	b=uOFVGoq9dS/IVvZ1PufyO6Tc0sBFwRSGMsrdhxuq0vNbMYYRSAeohFlUnYC1irLiapAhRgBwFMDBtT4F94DOx/rkbSsSj877tKVQPaRsvyZJ9F2VNRKg7PbeGHcmDzwc/6rxDlkLjMbVJNY/nafC9Sce+Xa7Ed/Tx5rAtMGiRbw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:9e634e6b-fa1a-4abb-bd7f-8a224da6ab36,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:5d9a3938-5e4b-44d7-80b2-bb618cb09d29,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: b0ba08ac28834ddd8354e8bb46ae0a60-20220622
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 809407221; Wed, 22 Jun 2022 19:18:25 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jun 2022 19:12:34 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 23 Jun 2022 10:12:32 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jun 2022 10:12:31 +0800
Message-ID: <561adc680c9af8e8813baf698f2f6ba67ce046e9.camel@mediatek.com>
Subject: Re: [PATCH v2 2/5] iommu/mediatek: Add error path for loop of
 mm_dts_parse
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	<iommu@lists.linux-foundation.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<mingyuan.ma@mediatek.com>, <yf.wang@mediatek.com>, <libo.kang@mediatek.com>,
	<chengci.xu@mediatek.com>, <youlin.pei@mediatek.com>,
	<anan.sun@mediatek.com>, <xueqi.zhang@mediatek.com>, Guenter Roeck
	<groeck@chromium.org>, Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 23 Jun 2022 10:12:31 +0800
In-Reply-To: <22c40a7f-d759-5b4a-f554-cf679102d91f@gmail.com>
References: <20220616054203.11365-1-yong.wu@mediatek.com>
	 <20220616054203.11365-3-yong.wu@mediatek.com>
	 <22c40a7f-d759-5b4a-f554-cf679102d91f@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_191830_670727_EB7A4EC1 
X-CRM114-Status: GOOD (  18.66  )
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

T24gVGh1LCAyMDIyLTA2LTE2IGF0IDE1OjQ5ICswMjAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3Rl
Og0KPiANCj4gT24gMTYvMDYvMjAyMiAwNzo0MiwgWW9uZyBXdSB3cm90ZToNCj4gPiBUaGUgbXRr
X2lvbW11X21tX2R0c19wYXJzZSB3aWxsIHBhcnNlIHRoZSBzbWkgbGFyYnMgbm9kZXMuIGlmIHRo
ZQ0KPiA+IGkrMQ0KPiA+IGxhcmIgaXMgcGFyc2VkIGZhaWwocmV0dXJuIC1FSU5WQUwpLCB3ZSBz
aG91bGQgb2Zfbm9kZV9wdXQgZm9yIHRoZQ0KPiA+IDAuLmkNCj4gPiBsYXJicy4gSW4gdGhlIGZh
aWwgcGF0aCwgb25lIG9mX25vZGVfcHV0IG1hdGNoZXMgd2l0aA0KPiA+IG9mX3BhcnNlX3BoYW5k
bGUgaW4NCj4gPiBpdC4NCj4gPiANCj4gPiBGaXhlczogZDJlOWExMTAyY2ZjICgiaW9tbXUvbWVk
aWF0ZWs6IENvbnRhaW4gTU0gSU9NTVUgZmxvdyB3aXRoDQo+ID4gdGhlIE1NIFRZUEUiKQ0KPiA+
IFNpZ25lZC1vZmYtYnk6IFlvbmcgV3UgPHlvbmcud3VAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0K
PiA+ICAgZHJpdmVycy9pb21tdS9tdGtfaW9tbXUuYyB8IDIxICsrKysrKysrKysrKysrKystLS0t
LQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0p
DQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvbXRrX2lvbW11LmMgYi9kcml2
ZXJzL2lvbW11L210a19pb21tdS5jDQo+ID4gaW5kZXggM2IyNDg5ZThhNmRkLi5hYjI0MDc4OTM4
YmYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9pb21tdS9tdGtfaW9tbXUuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvaW9tbXUvbXRrX2lvbW11LmMNCj4gPiBAQCAtMTA3MSwxMiArMTA3MSwxMiBAQCBz
dGF0aWMgaW50IG10a19pb21tdV9tbV9kdHNfcGFyc2Uoc3RydWN0DQo+ID4gZGV2aWNlICpkZXYs
IHN0cnVjdCBjb21wb25lbnRfbWF0Y2ggKiptDQo+ID4gICANCj4gDQo+IERvbid0IHdlIG5lZWQg
dG8gY2FsbCB0aGUgZ290byBhbHNvIG9uIGVycm9yIGNhc2Ugb2Y6DQo+IA0KPiBsYXJibm9kZSA9
IG9mX3BhcnNlX3BoYW5kbGUoZGV2LT5vZl9ub2RlLCAibWVkaWF0ZWssbGFyYnMiLCBpKTsNCg0K
VGhhbmtzIHZlcnkgbXVjaC4NCg0KZXhhY3RseSByaWdodC4gSSB3aWxsIGFkZCBpbiBuZXh0IHZl
cnNpb24uDQoNCj4gUmVnYXJkcywNCj4gTWF0dGhpYXMNCg==


