Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01B7C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 10:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wABbo5bMxTqg1amnngT0H1ts3MNELyJAvkKcKPuymPg=; b=QBVCohjzEg5G1o
	LTDkrJpePO6HVQJAhXrD5W26rrs9tjxS1sL0wgYsZcIHb1Q+N91DGF1Wa2KRmrqmks/E0EUsCss+h
	/lDDAtUzACVBBJbVflog0KDlBR6gVi9kscXmtBgzTEiH+UcaeqomU+jQAse2U/z2X8r6eWjmdkBcy
	yxptVXQoh4n6P2d+ncqqc515xIg4wSbcpv1shyUTnIHqVmjNsjhu7aupJ4xSdr6OXxizXa3IWt0GA
	L7dNycWKWqYSBMNPNN5cVS6/5s3tOlNmBanzgz7+hjgUeo7mYzjDmfBxqE5nv8HkjgWKvBtIdfHcu
	cIChksrVZgwsd6k2zZ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt5im-003S27-AI; Mon, 23 May 2022 10:55:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt4bU-002wSU-V5; Mon, 23 May 2022 09:44:03 +0000
X-UUID: 95c488fc86ec4454a18051e05d327e56-20220523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:aaa3beb2-4bfe-4210-90f6-e2a7cdd16e09, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:c75e487a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 95c488fc86ec4454a18051e05d327e56-20220523
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1175469284; Mon, 23 May 2022 02:43:52 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 02:33:51 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 23 May 2022 17:33:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 23 May 2022 17:33:49 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <p.zabel@pengutronix.de>, <angelogioacchino.delregno@collabora.com>,
 <nfraprado@collabora.com>, <chun-jie.chen@mediatek.com>,
 <wenst@chromium.org>, <runyang.chen@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [RESEND v8 13/19] dt-bindings: reset: mediatek: Add infra_ao reset
 index for MT8192/MT8195
Date: Mon, 23 May 2022 17:33:40 +0800
Message-ID: <20220523093346.28493-14-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220523093346.28493-1-rex-bc.chen@mediatek.com>
References: <20220523093346.28493-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_024357_063244_8D75CFCD 
X-CRM114-Status: UNSURE (   8.41  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

VG8gc3VwcG9ydCByZXNldCBvZiBpbmZyYV9hbywgYWRkIHRoZSBpbmRleCBvZiBpbmZyYV9hbyBy
ZXNldCBvZgp0aGVybWFsL3N2cy9wY2VpIGZvciBNVDgxOTIgYW5kIHRoZXJtYWwvc3ZzIGZvciBN
VDgxOTUuCgpTaWduZWQtb2ZmLWJ5OiBSZXgtQkMgQ2hlbiA8cmV4LWJjLmNoZW5AbWVkaWF0ZWsu
Y29tPgpBY2tlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBs
aW5hcm8ub3JnPgpSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vs
b2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KUmV2aWV3ZWQtYnk6IE7DrWNvbGFz
IEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KW07DrWNvbGFzOiBUZXN0
IGZvciBNVDgxOTJdClRlc3RlZC1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFk
b0Bjb2xsYWJvcmEuY29tPgotLS0KIGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvbXQ4MTkyLXJl
c2V0cy5oIHwgOCArKysrKysrKwogaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9tdDgxOTUtcmVz
ZXRzLmggfCA2ICsrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9tdDgxOTItcmVzZXRzLmggYi9pbmNs
dWRlL2R0LWJpbmRpbmdzL3Jlc2V0L210ODE5Mi1yZXNldHMuaAppbmRleCA3NjRjYTk5MTBmYTku
LjEyZTIwODdjOTBhMyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9tdDgx
OTItcmVzZXRzLmgKKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9tdDgxOTItcmVzZXRz
LmgKQEAgLTcsNiArNyw3IEBACiAjaWZuZGVmIF9EVF9CSU5ESU5HU19SRVNFVF9DT05UUk9MTEVS
X01UODE5MgogI2RlZmluZSBfRFRfQklORElOR1NfUkVTRVRfQ09OVFJPTExFUl9NVDgxOTIKIAor
LyogVE9QUkdVIHJlc2V0cyAqLwogI2RlZmluZSBNVDgxOTJfVE9QUkdVX01NX1NXX1JTVAkJCQkJ
MQogI2RlZmluZSBNVDgxOTJfVE9QUkdVX01GR19TV19SU1QJCQkJMgogI2RlZmluZSBNVDgxOTJf
VE9QUkdVX1ZFTkNfU1dfUlNUCQkJCTMKQEAgLTMwLDQgKzMxLDExIEBACiAvKiBNTVNZUyByZXNl
dHMgKi8KICNkZWZpbmUgTVQ4MTkyX01NU1lTX1NXMF9SU1RfQl9ESVNQX0RTSTAJCQkxNQogCisv
KiBJTkZSQSByZXNldHMgKi8KKyNkZWZpbmUgTVQ4MTkyX0lORlJBX1JTVDBfVEhFUk1fQ1RSTF9T
V1JTVAkJMAorI2RlZmluZSBNVDgxOTJfSU5GUkFfUlNUMl9QRVhUUF9QSFlfU1dSU1QJCTEKKyNk
ZWZpbmUgTVQ4MTkyX0lORlJBX1JTVDNfVEhFUk1fQ1RSTF9QVFBfU1dSU1QJMgorI2RlZmluZSBN
VDgxOTJfSU5GUkFfUlNUNF9QQ0lFX1RPUF9TV1JTVAkJMworI2RlZmluZSBNVDgxOTJfSU5GUkFf
UlNUNF9USEVSTV9DVFJMX01DVV9TV1JTVAk0CisKICNlbmRpZiAgLyogX0RUX0JJTkRJTkdTX1JF
U0VUX0NPTlRST0xMRVJfTVQ4MTkyICovCmRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdz
L3Jlc2V0L210ODE5NS1yZXNldHMuaCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvbXQ4MTk1
LXJlc2V0cy5oCmluZGV4IGEyNmJjY2M4Yjk1Ny4uMGIxOTM3ZjE0YjM2IDEwMDY0NAotLS0gYS9p
bmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L210ODE5NS1yZXNldHMuaAorKysgYi9pbmNsdWRlL2R0
LWJpbmRpbmdzL3Jlc2V0L210ODE5NS1yZXNldHMuaApAQCAtNyw2ICs3LDcgQEAKICNpZm5kZWYg
X0RUX0JJTkRJTkdTX1JFU0VUX0NPTlRST0xMRVJfTVQ4MTk1CiAjZGVmaW5lIF9EVF9CSU5ESU5H
U19SRVNFVF9DT05UUk9MTEVSX01UODE5NQogCisvKiBUT1BSR1UgcmVzZXRzICovCiAjZGVmaW5l
IE1UODE5NV9UT1BSR1VfQ09OTl9NQ1VfU1dfUlNUICAgICAgICAgIDAKICNkZWZpbmUgTVQ4MTk1
X1RPUFJHVV9JTkZSQV9HUlNUX1NXX1JTVCAgICAgICAgMQogI2RlZmluZSBNVDgxOTVfVE9QUkdV
X0FQVV9TV19SU1QgICAgICAgICAgICAgICAyCkBAIC0yNiw0ICsyNyw5IEBACiAKICNkZWZpbmUg
TVQ4MTk1X1RPUFJHVV9TV19SU1RfTlVNICAgICAgICAgICAgICAgMTYKIAorLyogSU5GUkEgcmVz
ZXRzICovCisjZGVmaW5lIE1UODE5NV9JTkZSQV9SU1QwX1RIRVJNX0NUUkxfU1dSU1QgICAgIDAK
KyNkZWZpbmUgTVQ4MTk1X0lORlJBX1JTVDNfVEhFUk1fQ1RSTF9QVFBfU1dSU1QgMQorI2RlZmlu
ZSBNVDgxOTVfSU5GUkFfUlNUNF9USEVSTV9DVFJMX01DVV9TV1JTVCAyCisKICNlbmRpZiAgLyog
X0RUX0JJTkRJTkdTX1JFU0VUX0NPTlRST0xMRVJfTVQ4MTk1ICovCi0tIAoyLjE4LjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
