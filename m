Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A254C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 01:50:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFBFA613C0
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 01:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFBFA613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BD909PVczJU3+in0819nQhDthH13kC5b+dVAyffAL98=; b=APe23XlXFfhewS/zNhsSdGzREW
	YeeR7sbPpzHMgUM5GP4N77OCOz4CbE3VZZKKA2I6As8SpCmidOs/6wLyhAB38M51e8bh+9IZn7ciB
	M7BplnmVV0RW4hoptn4vApony10zO3lkoxu8g0kwDK06vD1VRgxAWjiJqwz1rGGq8eseiq3HY13YH
	hmo26ZAsMheuIKtIDUU9hwwOJ5IlTyVhtY0LSMQPIfKBJNYTTMSN0Xru6ec2uv1xg+FCrNjXZrxTv
	XjIxw9aBYQBLYrlfvWSIeS7fZMNUjzjwbRqiWcsxqWUJ1KBuJwEefFwMfDfl2kWiSRUJsqS6jzr7P
	dSFUbG9Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWUfL-00B6Wg-Fq; Wed, 14 Apr 2021 01:50:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWUf0-00B6Ud-42; Wed, 14 Apr 2021 01:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:
 Subject:Message-ID:Sender:Content-ID:Content-Description;
 bh=FupmUWH8LIKhK1/JE8q0K7K7FyJglWX2Rt4xjp/RIXk=; b=ynN8970D8sxSPSCny9CTqyhIMp
 nmx8O/m+twXPtOiv8Ss/wR98BJIVCXT4BjxadFBV+KPTaTcu7MwV7tKZnWATaD3qF58I5rsIGyGtp
 kzbWBH+vBv81xUmUcfI997ysjwCi4inI/Hy9eS8nwxQ1sqx28oPfjSgXO2vWXKsA76G9O2KOoWXPF
 oh5ANl4ufkAhLLdIicBPOplk3A9cculwKun+/WphxuKNqBI8kVb2VVeqIH1ED1673s780V4tNbmh9
 eKQJBVCD+NItjyR0OrjpQ+nOt4p8TL8Uafu72mEmNg6m2nd5Uk3X0LR0ty23mQZ9dtykIR33l9LZY
 udk2qZwQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWUew-007QWq-Pr; Wed, 14 Apr 2021 01:49:40 +0000
X-UUID: 6ad89020e67845bda9688638a655c150-20210413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=FupmUWH8LIKhK1/JE8q0K7K7FyJglWX2Rt4xjp/RIXk=; 
 b=jjsb+UFiFl5eYuEPQ/Nn+gnH6yUIR1SKSYEwK6uORzy5i7LGRtRqMXMN7uvTddqB66+PK7sBV1fsmbF3UGpsBwlNZ6i/Y+5zDMZXXmgzb2mLQ3k9ZhPx0FtbJeyk5IZgLfXIaKpoVrPt8G1bzqDatGRy+InXBRpgMCKFLDYCpmA=;
X-UUID: 6ad89020e67845bda9688638a655c150-20210413
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1699781630; Tue, 13 Apr 2021 18:49:25 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Apr 2021 18:49:23 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs08n1.mediatek.inc
 (172.21.101.55) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 14 Apr 2021 09:49:19 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Apr 2021 09:49:18 +0800
Message-ID: <1618364957.9156.3.camel@mhfsdcap03>
Subject: Re: [PATCH v2, 3/5] Revert "dt-bindings: mailbox: mtk-gce: fix
 incorrect mbox-cells value"
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jassi Brar
 <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, "Dennis YC
 Hsieh" <dennis-yc.hsieh@mediatek.com>, DTML <devicetree@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, DRI Development
 <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 14 Apr 2021 09:49:17 +0800
In-Reply-To: <CAAOTY__zcdjA-tu4kNtWjy=37_HZV1U2fS6=k4OBAbjfNwC9Ow@mail.gmail.com>
References: <1618226325-31927-1-git-send-email-yongqiang.niu@mediatek.com>
 <1618226325-31927-4-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY__zcdjA-tu4kNtWjy=37_HZV1U2fS6=k4OBAbjfNwC9Ow@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_184938_862181_BE61AEAC 
X-CRM114-Status: GOOD (  22.20  )
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
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMDIxLTA0LTE0IGF0IDA3OjM4ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgWW9uZ3FpYW5nOg0KPiANCj4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIx5bm0NOaciDEy5pelIOmAseS4gCDkuIvljYg3OjE55a+r6YGT77ya
DQo+ID4NCj4gPiBUaGlzIHJldmVydHMgY29tbWl0IGY4M2IwM2ZjNzI3YWI1NmE3N2U2ODcxM2Q2
ZTQwMjk5Njk4ZjNjOWYuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5
b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21haWxib3gvbXRrLWdjZS50eHQgfCAyICstDQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94L210ay1nY2Uu
dHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21haWxib3gvbXRrLWdjZS50
eHQNCj4gPiBpbmRleCA3NzcxZWNhLi5jZjQ4Y2Q4IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94L210ay1nY2UudHh0DQo+ID4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21haWxib3gvbXRrLWdjZS50eHQNCj4g
PiBAQCAtNDcsNyArNDcsNyBAQCBFeGFtcGxlOg0KPiA+ICAgICAgICAgICAgICAgICBpbnRlcnJ1
cHRzID0gPEdJQ19TUEkgMTM1IElSUV9UWVBFX0xFVkVMX0xPVz47DQo+ID4gICAgICAgICAgICAg
ICAgIGNsb2NrcyA9IDwmaW5mcmFjZmcgQ0xLX0lORlJBX0dDRT47DQo+ID4gICAgICAgICAgICAg
ICAgIGNsb2NrLW5hbWVzID0gImdjZSI7DQo+ID4gLSAgICAgICAgICAgICAgICNtYm94LWNlbGxz
ID0gPDI+Ow0KPiA+ICsgICAgICAgICAgICAgICAjbWJveC1jZWxscyA9IDwzPjsNCj4gDQo+IEkg
dGhpbmsgd2Ugc2hvdWxkIG5vdCBjaGFuZ2UgdGhlIGJpbmRpbmcganVzdCB0byBmaXggc29mdHdh
cmUgYnVnLg0KPiBJIHRoaW5rIHRoZXJlIGFyZSBtYW55IHRlbXBvcmFyeSBzb2x1dGlvbiB0byBm
aXggZHJtIGJ1Zy4gSWYgZHJtIGJ1Zw0KPiBpcyBjYXVzZWQgYnkgY3Vyc29yIHBsYW5lLCB5b3Ug
Y291bGQgdGVtcG9yYXJpbHkgbGV0IGRybSBub3Qgc3VwcG9ydA0KPiBjdXJzb3IgcGxhbmUgdG8g
Zml4IGl0IChpbiBbMV0sIGRvIG5vdCByZXR1cm4gRFJNX1BMQU5FX1RZUEVfQ1VSU09SKS4NCj4g
QnV0IEkgd291bGQgbGlrZSB5b3UgdG8gZmluZCBvdXQgdGhlIGNvcnJlY3Qgc29sdXRpb24gcmF0
aGVyIHRoYW4gYQ0KPiB0ZW1wb3Jhcnkgc29sdXRpb24gYmVjYXVzZSB0aGlzIGJ1ZyBpcyBub3Qg
c28gdXJnZW50LiAoRm9yIG1lLCBidWcgb2YNCj4gYnVpbGQgZmFpbCwgYm9vdCBmYWlsLCBibGFj
ayBzY3JlZW4gaXMgdXJnZW50KS4NCj4gDQo+IFsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmM/aD12NS4xMi1yYzcjbjY5OQ0KPiANCj4gUmVn
YXJkcywNCj4gQ2h1bi1LdWFuZy4NCg0KdGhpcyBub3QgZHJtIGJ1ZywgYnV0IGNhdXNlZCBieSBj
bWRxIHBhdGNoDQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVk
aWF0ZWsvcGF0Y2gvMjAyMDAyMTQwNDMzMjUuMTY2MTgtMy1iaWJieS5oc2llaEBtZWRpYXRlay5j
b20vDQpiZWZvcmUgdGhpcyBwYXRjaCwgZHJtIGN1cnNvciBhbmQgdWkgd29ya3Mgd2VsbA0KYWZ0
ZXIgdGhpcyBwYXRjaCwgdWkgd2lsbCBmbGFzaCB3aGVuIG1vdmUgY3Vyc29yDQoNCnRoaXMgaXMg
Y3JpdGljYWwgaXNzdWUsDQoNCj4gDQo+ID4gICAgICAgICB9Ow0KPiA+DQo+ID4gIEV4YW1wbGUg
Zm9yIGEgY2xpZW50IGRldmljZToNCj4gPiAtLQ0KPiA+IDEuOC4xLjEuZGlydHkNCj4gPg0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
