Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E1BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 09:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SSApiHrkWY9SkmhJB/uTiLTIWGHn7Gj8Y5GHldrYOBQ=; b=3/vakY31b9bZf3
	rPTFRMgwHWfUg8mAObId/E9eNyVs4gN0ez7vw1147JEt1lWVM2QXPDJQrYmTwNzRMIZCxA+jyjzXN
	J3XxcSptCJhrr96ROiLzrfAqijcDcvLKXGcSjPJM7zK//HCTtPmc6d/mrVxn4zA9cbY3cwm6lR+OK
	l53hXtZQCvrHIxRH0R+kgf9Vx445rnWtTX6Xa5PFDhmNAOjbiS3cnV+KjCEDFPZHdE4emUDLMARqJ
	N3njjOOkJ+RmvVeLQlwOITX+cHhvxQFiMuH25BQMQXPR7BwyegHJwmME/IQkKzcGe+yHVPDrgp6DT
	eSqrM3gcZ6At3sYwasog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt3vl-002e8z-L7; Mon, 23 May 2022 09:00:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2oa-002AAA-IT; Mon, 23 May 2022 07:49:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=ZsaIAR1rHf8fHqAgHwXs3gwzmvyLcYR+fGSvD5QFSlQ=; b=nLsFEdu5iDCO2ASmiyfmjHOcDE
 KGNZag097jVOIOuj3khObwoMXvDPMK9DWCC+oR7QPLPLdL80Oz5VXiIo/LhMxjqwKorhxT/r2uJ0M
 0nQpi3P+cfmQzyJYANiYaYsl6Zg9qhW8lywo5Qz9eS7fpnXHHDlFg0p8bmJhQTbw7uO416DUwNqnE
 Kkr9bag18H9JCilLPdKC7yHTwrLPhtCYHf23ZOlil/huJHFOYQrpMl1tc0wf0DB8LyXZubAzeHPRW
 1RMnxGVs5is0cEIHXOlZQREJYRo8CFtMUIPw5hpCZIiLtmDvt633KHsNat6jsCDfEBt/4t7/mEGlb
 ptXIWiIg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt1Ho-000szN-2Y; Mon, 23 May 2022 06:11:26 +0000
X-UUID: 440ac58725b04532b67b3df2ea621f4f-20220522
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:503cd6eb-2ce4-4d9c-8026-2d9a30a3c012, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:f1fe2ee3-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:1,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 440ac58725b04532b67b3df2ea621f4f-20220522
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2026400617; Sun, 22 May 2022 23:10:52 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 May 2022 23:01:02 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 14:01:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 23 May 2022 14:00:59 +0800
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
Subject: [PATCH v8 16/19] arm64: dts: mediatek: Add infra #reset-cells
 property for MT8195
Date: Mon, 23 May 2022 14:00:53 +0800
Message-ID: <20220523060056.24396-17-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
References: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_071124_839917_BC07BAFA 
X-CRM114-Status: GOOD (  10.27  )
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

V2Ugd2lsbCB1c2UgbWVkaWF0ZWsgY2xvY2sgcmVzZXQgYXMgaW5mcmFjZmdfYW8gcmVzZXQgaW5z
dGVhZCBvZgp0aS1zeXNjb24uIFRvIHN1cHBvcnQgdGhpcywgcmVtb3ZlIHByb3BlcnR5IG9mIHRp
IHJlc2V0IGFuZCBhZGQKcHJvcGVydHkgb2YgI3Jlc2V0LWNlbGxzIGZvciBtZWRpYXRlayBjbG9j
ayByZXNldC4KClNpZ25lZC1vZmYtYnk6IFJleC1CQyBDaGVuIDxyZXgtYmMuY2hlbkBtZWRpYXRl
ay5jb20+ClJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lv
YWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgpSZXZpZXdlZC1ieTogTsOtY29sYXMgRi4g
Ui4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgpUZXN0ZWQtYnk6IE7DrWNvbGFz
IEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KLS0tCiBhcmNoL2FybTY0
L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5NS5kdHNpIHwgMTUgKystLS0tLS0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5NS5kdHNpIGIvYXJjaC9hcm02NC9i
b290L2R0cy9tZWRpYXRlay9tdDgxOTUuZHRzaQppbmRleCBiNTdlNjIwYzJjNzIuLmRiMTZlYmE5
ZDQ3NSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTUuZHRz
aQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5NS5kdHNpCkBAIC0xMCw3
ICsxMCw2IEBACiAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJx
Lmg+CiAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcGh5L3BoeS5oPgogI2luY2x1ZGUgPGR0LWJpbmRp
bmdzL3BpbmN0cmwvbXQ4MTk1LXBpbmZ1bmMuaD4KLSNpbmNsdWRlIDxkdC1iaW5kaW5ncy9yZXNl
dC90aS1zeXNjb24uaD4KIAogLyB7CiAJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUiOwpA
QCAtMjkyLDIwICsyOTEsMTAgQEAKIAkJfTsKIAogCQlpbmZyYWNmZ19hbzogc3lzY29uQDEwMDAx
MDAwIHsKLQkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LWluZnJhY2ZnX2FvIiwgInN5
c2NvbiIsICJzaW1wbGUtbWZkIjsKKwkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LWlu
ZnJhY2ZnX2FvIiwgInN5c2NvbiI7CiAJCQlyZWcgPSA8MCAweDEwMDAxMDAwIDAgMHgxMDAwPjsK
IAkJCSNjbG9jay1jZWxscyA9IDwxPjsKLQotCQkJaW5mcmFjZmdfcnN0OiByZXNldC1jb250cm9s
bGVyIHsKLQkJCQljb21wYXRpYmxlID0gInRpLHN5c2Nvbi1yZXNldCI7Ci0JCQkJI3Jlc2V0LWNl
bGxzID0gPDE+OwotCQkJCXRpLHJlc2V0LWJpdHMgPSA8Ci0JCQkJCTB4MTQwIDE4IDB4MTQ0IDE4
IDAgMCAoQVNTRVJUX1NFVCB8IERFQVNTRVJUX1NFVCB8IFNUQVRVU19OT05FKSAvKiBwY2llICov
Ci0JCQkJCTB4MTIwIDAgIDB4MTI0IDAgIDAgMCAoQVNTRVJUX1NFVCB8IERFQVNTRVJUX1NFVCB8
IFNUQVRVU19OT05FKSAvKiB0aGVybWFsICovCi0JCQkJCTB4NzMwIDEwIDB4NzM0IDEwIDAgMCAo
QVNTRVJUX1NFVCB8IERFQVNTRVJUX1NFVCB8IFNUQVRVU19OT05FKSAvKiB0aGVybWFsICovCi0J
CQkJCTB4MTUwIDUgIDB4MTU0IDUgIDAgMCAoQVNTRVJUX1NFVCB8IERFQVNTRVJUX1NFVCB8IFNU
QVRVU19OT05FKSAvKiBzdnMgZ3B1ICovCi0JCQkJPjsKLQkJCX07CisJCQkjcmVzZXQtY2VsbHMg
PSA8MT47CiAJCX07CiAKIAkJcGVyaWNmZzogc3lzY29uQDEwMDAzMDAwIHsKLS0gCjIuMTguMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
