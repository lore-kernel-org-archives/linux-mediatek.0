Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B69DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 01:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5OnTgaCzqtOZUxBXalCdWWh6qq+Ogz/Aj2hGfQgxGlk=; b=tkuupIYKk+Ix+8rb920DuStF8I
	rBJyEe0ojIFwERdXEuouaGox33lgjmGPY5hlNUKTPv5B5fli3w0XkMXDlpnH1naPoZzO2ftf+l9DU
	9NrB9cHa9N/Vl+j0YCdh4qGwN22k9iLbYrXCr81jq4pIkug7mgVNimSKgmwCU/HL0Nsmj7wR3iDbn
	etHPuy80AEKxlI26G1PWvMs/lanVw4/kpmkbDS5aat39eSP3yfWtinrX8Li6SZgZcsjLNyiFQtSYL
	/oZ8Tnbnsx8bhRohoTVFIYK8EUN1Fazg4tW5QnP7tK3diY3wqLRxKE945fKS4QC0mOzQrxtHlVt2P
	dT4BG3VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3pEq-0080JV-4L; Wed, 22 Jun 2022 01:33:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3pEf-0080Hd-5u; Wed, 22 Jun 2022 01:32:50 +0000
X-UUID: 00a1e724d8444d4f97ba2d842f8f1530-20220621
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=5OnTgaCzqtOZUxBXalCdWWh6qq+Ogz/Aj2hGfQgxGlk=;
	b=jtxNc2yZxLYBSdDZydJ7YbmttUrZm85XIOhi1o4F4dljhUPpKftNNyxQUH+DdQpSxvKIc6whCmOoTUbF0Md2wuK+w9CC2YMrchtGwyooTreQaPtcPwsAdp5Bhwx1dRlbA0DFJPbZrnOB8v/+D5iMRoaEX4I+WdsBcopK+9KozCQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:cf200fde-6659-4fee-8b94-33528a4babeb,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:10,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:15
X-CID-META: VersionHash:b14ad71,CLOUDID:42b227ea-f7af-4e69-92ee-0fd74a0c286c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:3,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 00a1e724d8444d4f97ba2d842f8f1530-20220621
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1345533518; Tue, 21 Jun 2022 18:32:41 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jun 2022 18:28:58 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 22 Jun 2022 09:28:56 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 22 Jun 2022 09:28:55 +0800
Message-ID: <1ce1947984043bc4284abe94b53888c11a072345.camel@mediatek.com>
Subject: Re: [PATCH v10 1/2] iommu/io-pgtable-arm-v7s: Add a quirk to allow
 pgtable PA up to 35bit
From: Yong Wu <yong.wu@mediatek.com>
To: <yf.wang@mediatek.com>, Will Deacon <will@kernel.org>, Robin Murphy
	<robin.murphy@arm.com>
CC: <wsd_upstream@mediatek.com>, Libo Kang <Libo.Kang@mediatek.com>, "Miles
 Chen" <miles.chen@mediatek.com>, Ning Li <ning.li@mediatek.com>, "Joerg
 Roedel" <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Isaac
 J. Manjarres" <isaacm@codeaurora.org>, Georgi Djakov
	<quic_c_gdjako@quicinc.com>, Sven Peter <sven@svenpeter.dev>, "moderated
 list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, "open
 list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, open list
	<linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
	<linux-mediatek@lists.infradead.org>
Date: Wed, 22 Jun 2022 09:28:55 +0800
In-Reply-To: <20220616120713.12728-2-yf.wang@mediatek.com>
References: <20220616120713.12728-1-yf.wang@mediatek.com>
	 <20220616120713.12728-2-yf.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_183249_267130_4F9E9866 
X-CRM114-Status: GOOD (  15.57  )
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

T24gVGh1LCAyMDIyLTA2LTE2IGF0IDIwOjA3ICswODAwLCB5Zi53YW5nQG1lZGlhdGVrLmNvbSB3
cm90ZToNCj4gRnJvbTogWXVuZmVpIFdhbmcgPHlmLndhbmdAbWVkaWF0ZWsuY29tPg0KPiANCj4g
U2luZ2xlIG1lbW9yeSB6b25lIGZlYXR1cmUgd2lsbCByZW1vdmUgWk9ORV9ETUEzMiBhbmQgWk9O
RV9ETUEgYW5kDQo+IGNhdXNlIHBndGFibGUgUEEgc2l6ZSBsYXJnZXIgdGhhbiAzMmJpdC4NCj4g
DQo+IFNpbmNlIE1lZGlhdGVrIElPTU1VIGhhcmR3YXJlIHN1cHBvcnQgYXQgbW9zdCAzNWJpdCBQ
QSBpbiBwZ3RhYmxlLA0KPiBzbyBhZGQgYSBxdWlyayB0byBhbGxvdyB0aGUgUEEgb2YgcGd0YWJs
ZXMgc3VwcG9ydCB1cCB0byBiaXQzNS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5pbmcgTGkgPG5p
bmcubGlAbWVkaWF0ZWsuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBZdW5mZWkgV2FuZyA8eWYud2Fu
Z0BtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9pb21tdS9pby1wZ3RhYmxlLWFybS12
N3MuYyB8IDY3ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0NCj4gLS0NCj4gIGluY2x1ZGUv
bGludXgvaW8tcGd0YWJsZS5oICAgICAgICAgfCAxNSArKysrLS0tDQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDYzIGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQ0KDQpbLi4uXQ0KDQo+ICAJLyog
VFRCUiAqLw0KPiAtCWNmZy0+YXJtX3Y3c19jZmcudHRiciA9IHZpcnRfdG9fcGh5cyhkYXRhLT5w
Z2QpIHwNCj4gQVJNX1Y3U19UVEJSX1MgfA0KPiArCXBhZGRyID0gdmlydF90b19waHlzKGRhdGEt
PnBnZCk7DQo+ICsJY2ZnLT5hcm1fdjdzX2NmZy50dGJyID0gcGFkZHIgfCBBUk1fVjdTX1RUQlJf
UyB8DQo+ICAJCQkJKGNmZy0+Y29oZXJlbnRfd2FsayA/IChBUk1fVjdTX1RUQlJfTk9TDQo+IHwN
Cj4gIAkJCQkgQVJNX1Y3U19UVEJSX0lSR05fQVRUUihBUk1fVjdTX1JHTl9XQlcNCj4gQSkgfA0K
PiAgCQkJCSBBUk1fVjdTX1RUQlJfT1JHTl9BVFRSKEFSTV9WN1NfUkdOX1dCVw0KPiBBKSkgOg0K
PiAgCQkJCShBUk1fVjdTX1RUQlJfSVJHTl9BVFRSKEFSTV9WN1NfUkdOX05DKQ0KPiB8DQo+ICAJ
CQkJIEFSTV9WN1NfVFRCUl9PUkdOX0FUVFIoQVJNX1Y3U19SR05fTkMpDQo+ICkpOw0KPiArDQo+
ICsJaWYgKGNmZy0+cXVpcmtzICYgSU9fUEdUQUJMRV9RVUlSS19BUk1fTVRLX1RUQlJfRVhUKQ0K
PiArCQljZmctPmFybV92N3NfY2ZnLnR0YnIgPSAocGFkZHIgJiBHRU5NQVNLKDMxLCA3KSkgfA0K
PiArCQkJCQl1cHBlcl8zMl9iaXRzKHBhZGRyKTsNCg0KSWYgd2Uga2VlcCB0dGJyIHUzMiwgd2Ug
aGF2ZSB0byBwdXQgdGhlIHNwZWNpYWwgbG9naWMgaGVyZS4gVGhpcyBsaW5lDQppcyBvayBmb3Ig
YWxsIHRoZSBNZWRpYVRlayBjYXNlcywgbm90IG9ubHkgZm9yIHRoaXMgcXVpcmsuIEl0IG1lYW5z
Og0KDQogICAgaWYgKGFybV92N3NfaXNfbXRrX2VuYWJsZWQoY2ZnKSkNCiAgICAgICAgICAgY2Zn
LT5hcm1fdjdzX2NmZy50dGJyID0gKHZpcnRfdG9fcGh5cyhkYXRhLT5wZ2QpICYNCkdFTk1BU0so
MzEsIDcpKSB8IHVwcGVyXzMyX2JpdHMocGFkZHIpOw0KICAgIGVsc2UNCiAgICAgICAgICAgeHh4
DQogDQogICAgIFRoZW4gd2UgZG9uJ3QgbmVlZCBhZGQgIiYgTU1VX1BUX0FERFJfTUFTSyIgaW4g
bXRrX2lvbW11LmMgc2luY2UNCnlvdSBoYXZlIGRvbmUgaXQgaGVyZS4NCg0KPiArDQo+ICAJcmV0
dXJuICZkYXRhLT5pb3A7DQo+ICANCg==


