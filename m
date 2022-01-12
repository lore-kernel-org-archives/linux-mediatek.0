Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFF9C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 11:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=udk69cuqCf+GoynzJ6r675qQcK03LJmaB7up/1mTP3U=; b=Vdfsi4ODbSTtO1
	OW6mC1Br2rlqQCqim3gfXG/g4v1cgTtEWlFv2yojpBe+lT87icXRtikGJ5HCTq4LCfgUCTVvoy9Ef
	xORzcS3ZxHjN2yN4DzVw4kZju2Jfj6ED4DkGq64Gnz5sfsCQYsLlqBSCk7IhxGJYl1MuXPt+i0HHn
	A6NDf6bRaG6cpWRLj9/zOQRSzmSeCF22gkDZj3fT8H2hDHUNjmRbcoiH3sgc2MlXUOf1n9bUZv1w9
	PQ0F7B0l4F47+PH9EbJWE+zYwqZeNEsKPwQI4OPUdMcMYWI25VkCca2Szic3pdd2w3fpS8HDrLRgy
	HWgAWTs9mIpR/5X5fS7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7cGy-002PRq-Ba; Wed, 12 Jan 2022 11:58:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7cGO-002PBB-HL; Wed, 12 Jan 2022 11:58:01 +0000
X-UUID: 8febc3e6cea348e9b54d36a8ca382613-20220112
X-UUID: 8febc3e6cea348e9b54d36a8ca382613-20220112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1557990102; Wed, 12 Jan 2022 04:57:56 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Jan 2022 03:55:46 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 12 Jan 2022 19:55:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 12 Jan 2022 19:55:44 +0800
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, <nfraprado@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <drinkcat@chromium.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee
 <ryder.lee@kernel.org>, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
Subject: [PATCH v3 1/5] arm64: dts: mediatek: Correct uart clock of MT8192
Date: Wed, 12 Jan 2022 19:55:38 +0800
Message-ID: <20220112115542.10606-2-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220112115542.10606-1-allen-kh.cheng@mediatek.com>
References: <20220112115542.10606-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_035800_608772_F32E8496 
X-CRM114-Status: GOOD (  14.15  )
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

RnJvbTogQWxsZW4tS0ggQ2hlbmcgPEFsbGVuLUtILkNoZW5nQG1lZGlhdGVrLmNvbT4KCldoZW4g
dGhlIGluaXRpYWwgZGV2aWNldHJlZSBmb3IgbXQ4MTkyIHdhcyBhZGRlZCBpbiA0ODQ4OTk4MGUy
N2UgKCJhcm02NDoKZHRzOiBBZGQgTWVkaWF0ZWsgU29DIE1UODE5MiBhbmQgZXZhbHVhdGlvbiBi
b2FyZCBkdHMgYW5kIE1ha2VmaWxlIiksIHRoZQpjbG9jayBkcml2ZXIgZm9yIG10ODE5MiB3YXMg
bm90IHlldCB1cHN0cmVhbSwgc28gdGhlIGNsb2NrIHByb3BlcnR5IG5vZGVzCndlcmUgc2V0IHRv
IHRoZSBjbGsyNm0gY2xvY2sgYXMgYSBwbGFjZWhvbGRlci4KCkdpdmVuIHRoYXQgdGhlIGNsb2Nr
IGRyaXZlciBoYXMgc2luY2UgYmVlbiBhZGRlZCB0aHJvdWdoIDcxMDU3M2RlZTMxYiAoImNsazoK
bWVkaWF0ZWs6IEFkZCBNVDgxOTIgYmFzaWMgY2xvY2tzIHN1cHBvcnQiKSwgYXMgd2VsbCBhcyBp
dHMgZHQtYmluZGluZ3MKdGhyb3VnaCBmMzVmMWEyM2UwZTEgKCJjbGs6IG1lZGlhdGVrOiBBZGQg
ZHQtYmluZGluZ3Mgb2YgTVQ4MTkyIGNsb2NrcyIpIGFuZApkZXZpY2V0cmVlIG5vZGVzIHRocm91
Z2ggNWQyYjg5N2JjNmY1ICgiYXJtNjQ6IGR0czogbWVkaWF0ZWs6IEFkZCBtdDgxOTIKY2xvY2sg
Y29udHJvbGxlcnMiKSwgZml4IHRoZSB1YXJ0IGNsb2NrIHByb3BlcnR5IHRvIHBvaW50IHRvIHRo
ZSBhY3R1YWwKY2xvY2suCgpTaWduZWQtb2ZmLWJ5OiBBbGxlbi1LSCBDaGVuZyA8QWxsZW4tS0gu
Q2hlbmdAbWVkaWF0ZWsuY29tPgpSZXZpZXdlZC1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8g
PG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgotLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ4MTkyLmR0c2kgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRl
ay9tdDgxOTIuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kK
aW5kZXggYzdjN2Q0ZTAxN2FlLi5jZmI2N2NjNDBjMmMgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9t
ZWRpYXRlay9tdDgxOTIuZHRzaQpAQCAtMzI3LDcgKzMyNyw3IEBACiAJCQkJICAgICAibWVkaWF0
ZWssbXQ2NTc3LXVhcnQiOwogCQkJcmVnID0gPDAgMHgxMTAwMjAwMCAwIDB4MTAwMD47CiAJCQlp
bnRlcnJ1cHRzID0gPEdJQ19TUEkgMTA5IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47Ci0JCQljbG9j
a3MgPSA8JmNsazI2bT4sIDwmY2xrMjZtPjsKKwkJCWNsb2NrcyA9IDwmY2xrMjZtPiwgPCZpbmZy
YWNmZyBDTEtfSU5GUkFfVUFSVDA+OwogCQkJY2xvY2stbmFtZXMgPSAiYmF1ZCIsICJidXMiOwog
CQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJfTsKQEAgLTMzNyw3ICszMzcsNyBAQAogCQkJCSAg
ICAgIm1lZGlhdGVrLG10NjU3Ny11YXJ0IjsKIAkJCXJlZyA9IDwwIDB4MTEwMDMwMDAgMCAweDEw
MDA+OwogCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDExMCBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+
OwotCQkJY2xvY2tzID0gPCZjbGsyNm0+LCA8JmNsazI2bT47CisJCQljbG9ja3MgPSA8JmNsazI2
bT4sIDwmaW5mcmFjZmcgQ0xLX0lORlJBX1VBUlQxPjsKIAkJCWNsb2NrLW5hbWVzID0gImJhdWQi
LCAiYnVzIjsKIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCX07Ci0tIAoyLjE4LjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
