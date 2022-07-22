Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC67C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 07:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9MEO6oqL2jt0ntOQCW8QuYjPPBYYC7GUwrm+hiU8uM=; b=4YssU77gX9Mv9Oxx2ikNapbWHm
	Fi1Zrlfmskr2CnND82r1uE1lO6072FMS2zWACa+fPSFKvN6Mx2ykNykDKWwVmLA7nImDg7f+iJ0rc
	fZx2hD3eJhHr2/Vmt5j+glkskO0Q5PJ/i+9yc5cfVpYxodmhfaMdgiD/6VFy4UIurAL909aBp7DPv
	d/OunL7ZBYy5C9ZyJ91uJou+XKEFGWDs78MYVdfTXFZXLHofHf94+AMVRCiEMOHdr7g53ukQ2woJ1
	mOOBhsxG+XPEUoZvz77NAshUTKn0kL4dL1ugyeVKR/gD9wD1JzN6iNnrPMJAETeA/EEpUVnT3JcN+
	88i1hIJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEn0L-000cDD-Ey; Fri, 22 Jul 2022 07:23:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEn0I-000c8n-3A; Fri, 22 Jul 2022 07:23:19 +0000
X-UUID: 504332d72e8846b880ce75d522a7f1be-20220722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=B9MEO6oqL2jt0ntOQCW8QuYjPPBYYC7GUwrm+hiU8uM=;
	b=kiQR001bmsLd2KFNvnygeICs7tqKBX3vrz38LAPDhAveW0h2doboB5DxK8j5n2zUfnXun8dTQeP1NjB9ODX1khCz3cKqo3MsSJWYFC0AKCB24e2j6K9ETFjt7fopjMBpLW7HE8+aqflJS6kmgIa1/Z8HdsCL0Z4cbjJV1UBGFno=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:326a873d-6902-45a5-98fc-d684569bf19e,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:40caab33-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 504332d72e8846b880ce75d522a7f1be-20220722
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <mingjia.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 287026333; Fri, 22 Jul 2022 00:23:06 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 22 Jul 2022 14:43:02 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 22 Jul 2022 14:43:00 +0800
Message-ID: <cf62ea99e74ea729a38fe7f806cbc06a0c549ddc.camel@mediatek.com>
Subject: Re: [RESEND] media: mediatek: vcodec: Add to support VP9 inner
 racing mode
From: "mingjia.zhang@mediatek.com" <mingjia.zhang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
	<acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
	<xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Fritz
 Koenig" <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
	<dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>, Steve
 Cho <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 22 Jul 2022 14:43:00 +0800
In-Reply-To: <6d8aeee4-9732-1c62-67e0-6e8f56373aa6@collabora.com>
References: <20220715064938.5812-1-mingjia.zhang@mediatek.com>
	 <6d8aeee4-9732-1c62-67e0-6e8f56373aa6@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_002318_162310_FA094ABB 
X-CRM114-Status: GOOD (  13.76  )
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

SGkgQW5nZWxvLA0KDQpUaGFua3MgZm9yIHlvdXIgcmVwbHkgYW5kIHVzZWZ1bCBjb21tZW50cy4N
Cg0KSW4gYWRkaXRpb24gdG8gcnVubmluZyBjdHMvZ3RzIHRlc3QsIEkgcmFuIHRoZSBmbHVzdGVy
IHRlc3Qgd2l0aA0KR1N0cmVhbWVyIGxvY2FsbHkuIFRoZSB0ZXN0IHJlc3VsdCBpcyAiUmFuIDI0
MC8zMDMgdGVzdHMgc3VjY2Vzc2Z1bGx5Ig0KDQoNClRoYW5rcywNCm1pbmdqaWENCg0KDQpPbiBG
cmksIDIwMjItMDctMTUgYXQgMTA6MzQgKzAyMDAsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25v
IHdyb3RlOg0KPiBJbCAxNS8wNy8yMiAwODo0OSwgTWluZ2ppYSBaaGFuZyBoYSBzY3JpdHRvOg0K
PiA+IEluIG9yZGVyIHRvIHJlZHVjZSBkZWNvZGVyIGxhdGVuY3ksIGVuYWJsZSBWUDkgaW5uZXIg
cmFjaW5nIG1vZGUuDQo+ID4gU2VuZCBsYXQgdHJhbnMgYnVmZmVyIGluZm9ybWF0aW9uIHRvIGNv
cmUgd2hlbiB0cmlnZ2VyIGxhdCB0byB3b3JrLA0KPiA+IG5lZWQgbm90IHRvIHdhaXQgdW50aWwg
bGF0IGRlY29kZSBkb25lLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IG1pbmdqaWEgemhhbmcg
PG1pbmdqaWEuemhhbmdAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+IENUUy9HVFMgdGVzdCBw
YXNzDQo+IA0KPiBDVFMvR1RTIHBhc3NpbmcgaXMgYSBnb29kIGluZGljYXRpb24gYnV0LCBwbGVh
c2UsIHRlc3Qgd2l0aCBHU3RyZWFtZXINCj4gKGFuZA0KPiBzaG93IHRoZSBvdXRwdXQsIGFzIHdl
bGwhKS4NCj4gDQo+IFRoYW5rcywNCj4gQW5nZWxvDQo+IA0KPiA+IC0tLQ0KPiA+ICAgLi4uL3Zj
b2RlYy92ZGVjL3ZkZWNfdnA5X3JlcV9sYXRfaWYuYyAgICAgICAgIHwgNjQgKysrKysrKysrKysr
DQo+ID4gLS0tLS0tLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDI0
IGRlbGV0aW9ucygtKQ0KPiA+IA0K


