Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FB1CEACEF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Nov 2025 09:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9QRjyk/cjVzZE8w18YoaMyF20fk/O9vAFKuOFyC2bNs=; b=dwi70rY21lZGHSCF+yGjSxK58k
	W83jZKGX+Fc3SLjaExzX09DA6CxKh72+qdgPD0mHrzE5VM6sW0G2m3ffoci9BQI1aQvXuWxLcEXHE
	S//Xu0A7VutLJE4OCS2xNzPaONgrdtJxPXN2WRpDE7yJhN+z3I3Se39YBxONHvkAksI21YOwfTf4e
	L3EROgZMWJ9yWMYNShiQOrR7MDla0fRakUkW4nax0N0kVlP5GA4JK0G1zP0xAQDxCbZgXoh16H52G
	H1dLsvjX99QpkuDULwQKHvtj5LHxcWr3qv0AqxU4PGDYAjOSd2TEb7NJXkrmGTOHhO29t8Gfm6D2i
	xjqKB4Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvZq-0000000Fnea-3qPR;
	Mon, 17 Nov 2025 09:31:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvZp-0000000Fndz-0290
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Nov 2025 09:31:14 +0000
X-UUID: 259e02bec39811f09f706fa2197c6ceb-20251117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID; bh=9QRjyk/cjVzZE8w18YoaMyF20fk/O9vAFKuOFyC2bNs=;
	b=ALUf/nVbClnlwJd00bWlGw87jFoXT0+QmKJ4rS7Uhc29n17qjsyREXeaaSpoI13BsSsvXplAQah08pvhOd+koCth0GwqXbjskSnK+rlc3lWZT/oDcsopAKThK4bs3K93Xh12cSpnbOoN6ZEkLpos8XScWdjcoXHcdCpnRtSDe7s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:7cad2586-3fd1-425d-aec2-2861a13e332c,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:f842fb57-17e4-43d2-bf73-55337eed999a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 259e02bec39811f09f706fa2197c6ceb-20251117
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <ya-jou.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1721960241; Mon, 17 Nov 2025 02:31:08 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 17 Nov 2025 17:31:04 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1748.26 via Frontend
 Transport; Mon, 17 Nov 2025 17:31:05 +0800
Message-ID: <70b25dca6f8c2756d78f076f4a7dee7edaaffc33.camel@mediatek.com>
Subject: [REGRESSION] PM / sleep: Unbalanced suspend/resume on late abort
 causes data abort
From: Rose Wu <ya-jou.wu@mediatek.com>
To: <rafael.j.wysocki@intel.com>, <linux-pm@vger.kernel.org>,
	<regressions@lists.linux.dev>
CC: <saravanak@google.com>, <len.brown@intel.com>, <pavel@kernel.org>,
	<linux-kernel@vger.kernel.org>, wsd_upstream <wsd_upstream@mediatek.com>,
	<linux-mediatek@lists.infradead.org>,
	=?UTF-8?Q?=E5=A3=AB=E9=A1=8F_=E9=82=B1?= <artis.chiu@mediatek.com>,
	=?UTF-8?Q?=E9=9D=96=E6=99=BA_=E9=AB=98?= <Johnny-cc.Kao@mediatek.com>
Date: Mon, 17 Nov 2025 17:31:05 +0800
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_013113_052045_C29408FA 
X-CRM114-Status: GOOD (  12.79  )
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

SGkgUmFmYWVsIGFuZCBBbGwsDQoNCkkgYW0gcmVwb3J0aW5nIGEgcmVncmVzc2lvbiBpbnRyb2R1
Y2VkIGJ5IHRoZSBjb21taXQNCjQ0MzA0NmQxYWQ2NjYwN2YzMjRjNjA0YjlmYmRmMTEyNjZmYThh
YWQgKFBNOiBzbGVlcDogTWFrZSBzdXNwZW5kIG9mDQpkZXZpY2VzIG1vcmUgYXN5bmNocm9ub3Vz
KSwgd2hpY2ggY2FuIGxlYWQgdG8gYSBrZXJuZWwgcGFuaWMgKGRhdGENCmFib3J0KSBpZiBhIGxh
dGUgc3VzcGVuZCBhYm9ydHMuDQpUaGUgY29tbWl0IG1vZGlmaWVzIGxpc3QgaGFuZGxpbmcgZHVy
aW5nIHN1c3BlbmQuIFdoZW4gYSBkZXZpY2Ugc3VzcGVuZA0KYWJvcnRzIGF0IHRoZSAibGF0ZSIg
c3RhZ2UsIGBkcG1fc3VzcGVuZGVkX2xpc3RgIGlzIHNwbGljZWQgaW50bw0KYGRwbV9sYXRlX2Vh
cmx5X2xpc3RgLg0KVGhpcyBjcmVhdGVzIGFuIGltYmFsYW5jZS4gRGV2aWNlcyBvbiB0aGlzIGxp
c3QgdGhhdCBoYWQgbm90IHlldA0KZXhlY3V0ZWQgYHBtX3J1bnRpbWVfZGlzYWJsZSgpYCBpbiBg
ZGV2aWNlX3N1c3BlbmRfbGF0ZSgpYCBhcmUgbm93DQppbmNvcnJlY3RseSBzdWJqZWN0ZWQgdG8g
YHBtX3J1bnRpbWVfZW5hYmxlKClgIGR1cmluZyB0aGUgc3Vic2VxdWVudA0KYGRldmljZV9yZXN1
bWVfZWFybHkoKWAgc2VxdWVuY2UuDQoNClRoaXMgY2F1c2VzIHR3byBpc3N1ZXM6DQoNCjEuIE51
bWVyb3VzIGVycm9yIG1lc3NhZ2VzIGluIGRtZXNnOiAiQXR0ZW1wdCB0byBlbmFibGUgcnVudGlt
ZSBQTSB3aGVuDQppdCBpcyBibG9ja2VkLiINCjIuIEEgY3JpdGljYWwgZmFpbHVyZSBmb3Igc2lt
cGxlLWJ1cyBkZXZpY2VzOiBXaGVuDQpgc2ltcGxlX3BtX2J1c19ydW50aW1lX3Jlc3VtZSgpYCBp
cyBjYWxsZWQgZm9yIGEgZGV2aWNlIHdob3NlIGJ1cyBpcw0KYE5VTExgLCB0aGUga2VybmVsIGF0
dGVtcHRzIHRvIGFjY2VzcyB0aGUgbnVsbCBidXMgc3RydWN0LCB0cmlnZ2VyaW5nIGENCmRhdGEg
YWJvcnQuDQoNClN0ZXBzIHRvIFJlcHJvZHVjZToNCg0KVGhlIGlzc3VlIGNhbiBiZSByZWxpYWJs
eSByZXByb2R1Y2VkIGJ5IGZvcmNpbmcgYSBsYXRlIHN1c3BlbmQgdG8NCmFib3J0Lg0KDQoxLiBB
cHBseSB0aGUgZm9sbG93aW5nIG1vZGlmaWNhdGlvbiB0byB0aGUgYGRldmljZV9zdXNwZW5kX2xh
dGUoKWANCmZ1bmN0aW9uIHRvIHNpbXVsYXRlIGEgd2FrZXVwIGV2ZW50Og0KLS0tIGEvZHJpdmVy
cy9iYXNlL3Bvd2VyL21haW4uYw0KKysrIGIvZHJpdmVycy9iYXNlL3Bvd2VyL21haW4uYw0KQEAg
LTE1NjgsNyArMTU2OCw3IEBAIHN0YXRpYyBpbnQgZGV2aWNlX3N1c3BlbmRfbGF0ZShzdHJ1Y3Qg
ZGV2aWNlDQoqZGV2LCBwbV9tZXNzYWdlX3Qgc3RhdGUsIGJvb2wgYXN5bg0KIAlpZiAoYXN5bmNf
ZXJyb3IpDQogCQlnb3RvIENvbXBsZXRlOw0KIA0KLQlpZiAocG1fd2FrZXVwX3BlbmRpbmcoKSkg
ew0KKwlpZiAoMSkgeyAvKiBGb3JjZSBhYm9ydCBmb3IgdGVzdGluZyAqLw0KIAkJYXN5bmNfZXJy
b3IgPSAtRUJVU1k7DQogCQlnb3RvIENvbXBsZXRlOw0KIAl9DQoyLiBUcmlnZ2VyIGEgc3lzdGVt
IHN1c3BlbmQuDQozLiBUaGUgc3lzdGVtIHdpbGwgYXR0ZW1wdCB0byBzdXNwZW5kLCBhYm9ydCBh
dCB0aGUgbGF0ZSBzdGFnZSwgYW5kDQp0aGVuIHRyaWdnZXIgdGhlIGRhdGEgYWJvcnQgZHVyaW5n
IHRoZSByZXN1bWUgc2VxdWVuY2UuDQoNCkNhbGwgVHJhY2U6DQoNClVuYWJsZSB0byBoYW5kbGUg
a2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBhdCB2aXJ0dWFsIGFkZHJlc3MNCjAwMDAw
MDAwMDAwMDAwMDgNCnBjIDogWzB4ZmZmZmZmZTM5ODhlODFlNF0gc2ltcGxlX3BtX2J1c19ydW50
aW1lX3Jlc3VtZSsweDFjLzB4OTANCmxyIDogWzB4ZmZmZmZmZTM5OGE4NDhkMF0gcG1fZ2VuZXJp
Y19ydW50aW1lX3Jlc3VtZSsweDQwLzB4NTgNCg0KQXMgYSBwb3RlbnRpYWwgZml4LCBJIGFtIHdv
bmRlcmluZyBpZiBhIGNvbmRpdGlvbmFsIGNoZWNrIGlzIG5lZWRlZCBpbg0KYGRldmljZV9yZXN1
bWVfZWFybHkoKWAgYmVmb3JlIGludm9raW5nIGBwbV9ydW50aW1lX2VuYWJsZSgpYCBmb3IgYQ0K
ZGV2aWNlPw0KDQpCZXN0IFJlZ2FyZHMsDQpSb3Nl


