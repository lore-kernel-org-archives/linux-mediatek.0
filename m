Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F13C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 13:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DzDxBXobmyQTOL/4btOe2QE9HImPU+TH/LLILs9IFeI=; b=iwcomGmVz+AG6u
	X2PHsIyfv4p7JW9mg/wLkpFqE2u1k+XYvm6iDRRyVuXyRNsX7RW52R/af3QF9cqbq/P2U3JvkXJuD
	cAEZLmexy7fUBiBnM7YItNzJYBz5nuARGK394pEIgRD4PPsHVEFYhEoM06kpT26uOvghQ82egHeVC
	/w9C2U1LvUDza43KkpHken0XNb8jVqSl+TyGM22tb9dqMRbE/SUjamdCpjGoX0vJSBPv12I1Z2s7r
	oFG0HEv8eH4RJ+SWfB+gsvFyCAzyy8BWZAUwxbgFwP9wmcSpqsAxelDkeOzOmLzNLSqBTm9wjd7xQ
	BFuW5mvzewyVX/y7BNsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ7fk-00A3xR-H2; Fri, 04 Mar 2022 13:08:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ7fV-00A3qH-35; Fri, 04 Mar 2022 13:08:27 +0000
X-UUID: 193f3aeaf05f44f3ac8877db2f3af000-20220304
X-UUID: 193f3aeaf05f44f3ac8877db2f3af000-20220304
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 503563683; Fri, 04 Mar 2022 06:08:23 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Mar 2022 05:08:21 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 4 Mar 2022 21:08:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Mar 2022 21:08:14 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, Hui
 Liu <hui.liu@mediatek.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v3 02/21] arm64: dts: mt8192: Add spmi node
Date: Fri, 4 Mar 2022 21:07:50 +0800
Message-ID: <20220304130809.12924-3-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220304130809.12924-1-allen-kh.cheng@mediatek.com>
References: <20220304130809.12924-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_050825_157082_C1AA4010 
X-CRM114-Status: UNSURE (   9.70  )
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

QWRkIHNwbWkgbm9kZSBmb3IgbXQ4MTkyIFNvQy4KClNpZ25lZC1vZmYtYnk6IEFsbGVuLUtIIENo
ZW5nIDxhbGxlbi1raC5jaGVuZ0BtZWRpYXRlay5jb20+ClJldmlld2VkLWJ5OiBOw61jb2xhcyBG
LiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+ClJldmlld2VkLWJ5OiBBbmdl
bG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJv
cmEuY29tPgotLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kgfCAx
NyArKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpIGIvYXJj
aC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQppbmRleCA3NjQyODU5OTQ0NGUu
LjBmOWYyMTFjYTk4NiAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9t
dDgxOTIuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNp
CkBAIC01MzUsNiArNTM1LDIzIEBACiAJCQlhc3NpZ25lZC1jbG9jay1wYXJlbnRzID0gPCZ0b3Bj
a2dlbiBDTEtfVE9QX09TQ19EMTA+OwogCQl9OwogCisJCXNwbWk6IHNwbWlAMTAwMjcwMDAgewor
CQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDY4NzMtc3BtaSI7CisJCQlyZWcgPSA8MCAweDEw
MDI3MDAwIDAgMHgwMDBlMDA+LAorCQkJICAgICAgPDAgMHgxMDAyOTAwMCAwIDB4MDAwMTAwPjsK
KwkJCXJlZy1uYW1lcyA9ICJwbWlmIiwgInNwbWltc3QiOworCQkJY2xvY2tzID0gPCZpbmZyYWNm
ZyBDTEtfSU5GUkFfUE1JQ19BUD4sCisJCQkJIDwmaW5mcmFjZmcgQ0xLX0lORlJBX1BNSUNfVE1S
PiwKKwkJCQkgPCZ0b3Bja2dlbiBDTEtfVE9QX1NQTUlfTVNUX1NFTD47CisJCQljbG9jay1uYW1l
cyA9ICJwbWlmX3N5c19jayIsCisJCQkJICAgICAgInBtaWZfdG1yX2NrIiwKKwkJCQkgICAgICAi
c3BtaW1zdF9jbGtfbXV4IjsKKwkJCWFzc2lnbmVkLWNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RP
UF9QV1JBUF9VTFBPU0NfU0VMPjsKKwkJCWFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8JnRvcGNr
Z2VuIENMS19UT1BfT1NDX0QxMD47CisJCQkjYWRkcmVzcy1jZWxscyA9IDwyPjsKKwkJCSNzaXpl
LWNlbGxzID0gPDA+OworCQl9OworCiAJCXNjcF9hZHNwOiBjbG9jay1jb250cm9sbGVyQDEwNzIw
MDAwIHsKIAkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLXNjcF9hZHNwIjsKIAkJCXJl
ZyA9IDwwIDB4MTA3MjAwMDAgMCAweDEwMDA+OwotLSAKMi4xOC4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
