Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 851DCC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 09:55:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E28DF2078A
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 09:55:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rqS+2ia8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="A4XIiW+z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E28DF2078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1CT6vA0EUWl5pk9c1JRjE4fMrIcA2No7kG7j+NgZL/A=; b=rqS+2ia8XoU9IlwFTxRsgrba/
	SlXJf8a26DqFVAiHQ8mE+GsTjWFUjIX8FK9FTSV2DZxlbz0nEH94HN67JXPTLfzZo+WWufPs5qCX/
	1hb5cAfsCC/+0pkW6CdjTNddb/6R9OjQrhDMnVwSP5pfwoV9oHrk4sOXwUb3J0in57Wn7n2q9THm7
	hI0qAXbFaVBiXPDoqi+g+qBKJAU30tEVfeGRd3fHpPpLt/H/n6V2CrHXaLLH4W9DMVCJHLuz3abXP
	hDkZ5rowa2OTnPS8Lu+opgR6R+ItMtFP7HXnid8GDrq+XVLbBLTCNll2BjwH6AaVNKK6SS2KWPFnQ
	DGFfXVglQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSH1j-00075I-FV; Tue, 13 Oct 2020 09:55:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSH1d-00073F-M8; Tue, 13 Oct 2020 09:55:22 +0000
X-UUID: f52505b94f07475caa11b607fd8eaed6-20201013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ErW8HdEIq/FdudMvL/XJKMQpzparYDyvJJpkVDGt/9I=; 
 b=A4XIiW+zG7s81RxaMdCDqufQdbZ2FjDXvL2CrFVN760zsODjdZ1mBJ2F+RNEwF2fMV0bP2jiwcFz1BWdD7NNKVuWxg14t8IgtOTRbMQqq9rUE/EkW7gudbCMBR+87GmORZOH0JEzQxqOmgoNtMbpJOUFdoTu86RNHF0z8lowHQ0=;
X-UUID: f52505b94f07475caa11b607fd8eaed6-20201013
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1022487791; Tue, 13 Oct 2020 01:55:10 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Oct 2020 02:55:08 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 13 Oct 2020 17:55:06 +0800
Received: from [10.16.6.141] (10.16.6.141) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 13 Oct 2020 17:55:03 +0800
Message-ID: <1602582900.10262.0.camel@mszsdaap41>
Subject: Re: [v4 PATCH 0/2] fix scrolling of panel with small hfp or hbp
From: Jitao Shi <jitao.shi@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 13 Oct 2020 17:55:00 +0800
In-Reply-To: <CAAOTY_-qZni-o11HJeymH74PAFSJw-0Awdz0wdjiQ0u7Ga1MGA@mail.gmail.com>
References: <20201010070910.11294-1-jitao.shi@mediatek.com>
 <CAAOTY_-qZni-o11HJeymH74PAFSJw-0Awdz0wdjiQ0u7Ga1MGA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9058B82AC9E991BE078B9380368DAEE655AD1DF6E08AD11FCBEC7D55ED3BBE992000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_055521_864260_C4AF7927 
X-CRM114-Status: GOOD (  17.83  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, cawa.cheng@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek
 SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDIwLTEwLTEyIGF0IDIzOjIyICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgSml0YW86DQo+IA0KPiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+IOaW
vCAyMDIw5bm0MTDmnIgxMOaXpSDpgLHlha0g5LiL5Y2IMzowOeWvq+mBk++8mg0KPiA+DQo+ID4g
Q2hhbmdlcyBzaW5jZSB2MzoNCj4gPiAgLSBSZXZlcnQgdjIsIGZvciB2MiB3aWxsIGNhdXNlIHNv
bWUgYnJpZGdlIGljIG5vIG91dHB1dC4gdGhlIGNhdXNlDQo+ID4gICAgdGhlIHZpZGVvIGxpbmV0
aW1lIGRvZXNuJ3QgbWF0Y2ggZGlzcGxheSBtb2RlIGZyb20gZ2V0IG1vZGUuDQo+ID4gIC0gTWFr
ZSBzdXJlIHRoZSBob3Jpem9udGFsX2Zyb250cG9yY2hfYnl0ZSBhbmQgaG9yaXpvbnRhbF9iYWNr
cG9yY2hfYnl0ZQ0KPiA+ICAgIGFyZSA+IDAuDQo+IA0KPiBCZWNhdXNlIHYyIGlzIG1lcmdlZCBp
bnRvIG1haW5saW5lLCBJIHRoaW5rIHlvdSBzaG91bGQgbWVyZ2UgMS8yIGFuZA0KPiAyLzIgdG8g
b25lIHBhdGNoIHdoaWNoIGZpeCB0aGUgcHJvYmxlbSBjYXVzZWQgYnkgdjIuDQo+IA0KPiBSZWdh
cmRzLA0KPiBDaHVuLUt1YW5nLg0KPiANCg0KVGhhbmtzIGZvciB5b3VyIHJldmlld2luZy4NCkkn
bGwgdXBkYXRlIG5leHQgdmVyc2lvbi4NCg0KQmVzdCBSZWdhcmRzDQpKaXRhbw0KDQo+ID4NCj4g
PiBKaXRhbyBTaGkgKDIpOg0KPiA+ICAgUmV2ZXJ0ICJkcm0vbWVkaWF0ZWs6IGRzaTogRml4IHNj
cm9sbGluZyBvZiBwYW5lbCB3aXRoIHNtYWxsIGhmcCBvcg0KPiA+ICAgICBoYnAiDQo+ID4gICBk
cm0vbWVkaWF0ZWs6IGRzaTogZml4IHNjcm9sbGluZyBvZiBwYW5lbCB3aXRoIHNtYWxsIGhmcCBv
ciBoYnANCj4gPg0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgNjUg
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDI1IGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gLS0NCj4gPiAy
LjEyLjUNCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KPiA+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
