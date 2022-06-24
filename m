Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F3BCCA480
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 13:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3f2/bpQKtykjR5qjBidriE1zZ4iOBIpTZv8uRjxEFH0=; b=zRzDR9q/q1bhIGcwGHeTNA4WMR
	l/mNlE6+HNuY6S4TlqtjJ4Bd2JuPAdC1Uk+dQzul7Amf+jLrmlaOGxJltKjwxkA64fDQzeQylU+jj
	ys5WEYSEab6/uzF6/Xx9Y3KubLexPFU/CGnttLCZtawna376WYCj0bFbkuaWMxkr5qvjLu+wXv55g
	NOcACwwwbh+hsofgX1qUKtGPc5qtfEroAbezapi5I8VXMxE5GSy3FwizC0jveiR971Eg3cPPl41r3
	R7sjnzrots9TPb+XcNzzYjQAR5hyEye+HfN/saiY8OSutYxZt1eobIfsCMFEKOjT5aUKGW4VySgRA
	r34Eh++g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4jfh-002Ssh-Lf; Fri, 24 Jun 2022 13:48:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4jej-002SRC-Dl; Fri, 24 Jun 2022 13:47:35 +0000
X-UUID: c0e4019fd7cd47919272698101a95538-20220624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=3f2/bpQKtykjR5qjBidriE1zZ4iOBIpTZv8uRjxEFH0=;
	b=kzGdflhHkLSGzyq59ZZDJP4qFkl/wzmw/w4cjfk0zh2P2MMoBt89yjSbccnUPnSeQ3n4UVPZNINvEXAaxysHgBWbxvDMsaFaxh5oH8k8zu/AHprsRt3Qjc61Y/BCcf+JyrO623QX1qlSZPdsfSUnw2+Iv+oqg0wtpV3wPjr5Ym8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:fc8e1ba0-0d5a-4b5f-96dd-fb32eb6e5393,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:4991f82d-1756-4fa3-be7f-474a6e4be921,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:1,File:ni
	l,QS:nil,BEC:nil,COL:0
X-UUID: c0e4019fd7cd47919272698101a95538-20220624
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <guodong.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2048413901; Fri, 24 Jun 2022 06:47:13 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Jun 2022 06:42:05 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 24 Jun 2022 21:42:04 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Jun 2022 21:42:03 +0800
Message-ID: <26b47f385eb4148715aabe0184bd90cc32cdd42f.camel@mediatek.com>
Subject: Re: [PATCH v1 1/4] pinctrl: add generic driving setup property on
 mt8192
From: Guodong Liu <guodong.liu@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
	<sean.wang@kernel.org>, Sean Wang <sean.wang@mediatek.com>, Zhiyong Tao
	<zhiyong.tao@mediatek.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 24 Jun 2022 21:42:03 +0800
In-Reply-To: <20220609181658.s5qdm32f5vhwkkao@notapiano>
References: <20220608053909.1252-1-guodong.liu@mediatek.com>
	 <20220608053909.1252-2-guodong.liu@mediatek.com>
	 <20220609181658.s5qdm32f5vhwkkao@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_064729_612784_9F0C697A 
X-CRM114-Status: GOOD (  19.18  )
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRv
IDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4NClRvOiBHdW9kb25nIExpdSA8Z3VvZG9uZy5saXVA
bWVkaWF0ZWsuY29tPg0KQ2M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz4sIFJvYiBIZXJyaW5nIDwNCnJvYmgrZHRAa2VybmVsLm9yZz4sIE1hdHRoaWFzIEJydWdnZXIg
PG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+LCBTZWFuDQpXYW5nIDxzZWFuLndhbmdAa2VybmVsLm9y
Zz4sIFNlYW4gV2FuZyA8c2Vhbi53YW5nQG1lZGlhdGVrLmNvbT4sDQpaaGl5b25nIFRhbyA8emhp
eW9uZy50YW9AbWVkaWF0ZWsuY29tPiwgbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmcsIA0KZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZywgDQpsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnLCBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnLCANClByb2plY3RfR2xvYmFsX0Nocm9tZV9VcHN0cmVhbV9Hcm91cEBt
ZWRpYXRlay5jb20NClN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEgMS80XSBwaW5jdHJsOiBhZGQgZ2Vu
ZXJpYyBkcml2aW5nIHNldHVwIHByb3BlcnR5DQpvbiBtdDgxOTINCkRhdGU6IFRodSwgOSBKdW4g
MjAyMiAxNDoxNjo1OCAtMDQwMA0KDQpIaSBHdW9kb25nLA0KDQp0aGFuayB5b3UgZm9yIHRoZSBw
YXRjaC4NCg0KT24gV2VkLCBKdW4gMDgsIDIwMjIgYXQgMDE6Mzk6MDZQTSArMDgwMCwgR3VvZG9u
ZyBMaXUgd3JvdGU6DQo+IFRoaXMgcGF0Y2ggcHJvdmlkZXMgZ2VuZXJpYyBkcml2aW5nIHNldHVw
LCB3aGljaCBzdXBwb3J0DQo+IDIvNC82LzgvMTAvMTIvMTQvMTZtQSBkcml2aW5nLCBvcmlnaW5h
bCBkcml2ZXIganVzdCBzZXQNCj4gcmF3IGRhdGEgc2V0dXAgc2V0dGluZyB3aGVuIHVzZSBkcml2
ZS1zdHJlbmd0aCBwcm9wZXJ0eQ0KDQpZb3Ugc2hvdWxkIG1lbnRpb24gaW4gdGhlIGNvbW1pdCBt
ZXNzYWdlIHRoYXQgdGhlIGR0LWJpbmRpbmcgZXhwZWN0cw0KdGhhdA0KZHJpdmUtc3RyZW5ndGgg
YXJndW1lbnRzIGJlIHBhc3NlZCBpbiBtQSwgYnV0IHRoZSBkcml2ZXIgd2FzIGV4cGVjdGluZw0K
cmF3DQp2YWx1ZXMuIEFuZCB0aGF0IHRoaXMgY29tbWl0IGNoYW5nZXMgdGhlIGRyaXZlciBzbyB0
aGF0IGl0IGlzIGFsaWduZWQNCndpdGggdGhlDQpiaW5kaW5nLg0KDQpUaGFua3MsDQpOw61jb2xh
cw0KDQp3aWxsIGZpeCBpdCBpbiBuZXh0IHZlcnNpb24sdGhhbmtzIQ0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogR3VvZG9uZyBMaXUgPGd1b2RvbmcubGl1QG1lZGlhdGVrLmNvbT4NCj4gLS0tDQo+ICBk
cml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDgxOTIuYyB8IDQgKystLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDgxOTIuYw0KPiBiL2Ry
aXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ODE5Mi5jDQo+IGluZGV4IGFjY2NkZTky
NjJiYS4uOWZhZjcwMDEzNjlkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0
ZWsvcGluY3RybC1tdDgxOTIuYw0KPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGlu
Y3RybC1tdDgxOTIuYw0KPiBAQCAtMTM3Miw4ICsxMzcyLDggQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBtdGtfcGluX3NvYyBtdDgxOTJfZGF0YSA9IHsNCj4gIAkuZ3Bpb19tID0gMCwNCj4gIAkuYmlh
c19zZXRfY29tYm8gPSBtdGtfcGluY29uZl9iaWFzX3NldF9jb21ibywNCj4gIAkuYmlhc19nZXRf
Y29tYm8gPSBtdGtfcGluY29uZl9iaWFzX2dldF9jb21ibywNCj4gLQkuZHJpdmVfc2V0ID0gbXRr
X3BpbmNvbmZfZHJpdmVfc2V0X3JhdywNCj4gLQkuZHJpdmVfZ2V0ID0gbXRrX3BpbmNvbmZfZHJp
dmVfZ2V0X3JhdywNCj4gKwkuZHJpdmVfc2V0CT0gbXRrX3BpbmNvbmZfZHJpdmVfc2V0X3JldjEs
DQo+ICsJLmRyaXZlX2dldAk9IG10a19waW5jb25mX2RyaXZlX2dldF9yZXYxLA0KPiAgCS5hZHZf
cHVsbF9nZXQgPSBtdGtfcGluY29uZl9hZHZfcHVsbF9nZXQsDQo+ICAJLmFkdl9wdWxsX3NldCA9
IG10a19waW5jb25mX2Fkdl9wdWxsX3NldCwNCj4gIAkuYWR2X2RyaXZlX2dldCA9IG10a19waW5j
b25mX2Fkdl9kcml2ZV9nZXQsDQo+IC0tIA0KPiAyLjI1LjUNCj4gDQo=


