Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36F3C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 13:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BGmYbk9C2/fdistEL+2qX1lwugVnJEc14Ub8p/U3pog=; b=H7PePbpa4LVDLj
	0j+WtwHwvzEEdaR22hn9yquQF9w6BRA3qvtXevidI2avW2Xw1Vv+ZcpPyhAOsd0QN8C90BCSWHaUk
	PCNFQRjmG9Cqs+ksQhchIrvRvoHv/REK9tXomqHXwt6lMVDI/HhtS5aoLl2wiMKJYVZHCARvC4eE/
	le2gzbmY49le4ORC4nvy8atjeCnZbNwACBN3ZvUnVmXNs1bv2fBjkhUrmSgzu7NwfABMqdt9T8Xkw
	zHlVgkeiG/pes7Jsi5Vw+hTwaZOK5JNKEeg4lA+OluJQevaeVk4327MafYJysQ5OPwPRGlF5xtF3D
	CiKAUgGnZhONvJwP1MMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ7ko-00A6k2-Ga; Fri, 04 Mar 2022 13:13:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ7iO-00A5Oy-Rc; Fri, 04 Mar 2022 13:11:26 +0000
X-UUID: 0749bc060536432aa7ce32fbbda1fe53-20220304
X-UUID: 0749bc060536432aa7ce32fbbda1fe53-20220304
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 623973971; Fri, 04 Mar 2022 06:11:17 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Mar 2022 05:08:14 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Mar 2022 21:08:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Mar 2022 21:08:13 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, Hui
 Liu <hui.liu@mediatek.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v3 01/21] arm64: dts: mt8192: Add pwrap node
Date: Fri, 4 Mar 2022 21:07:49 +0800
Message-ID: <20220304130809.12924-2-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220304130809.12924-1-allen-kh.cheng@mediatek.com>
References: <20220304130809.12924-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_051124_932292_885E6FFE 
X-CRM114-Status: UNSURE (   9.30  )
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

QWRkIHB3cmFwIG5vZGUgZm9yIG10ODE5MiBTb0MuCgpTaWduZWQtb2ZmLWJ5OiBBbGxlbi1LSCBD
aGVuZyA8YWxsZW4ta2guY2hlbmdAbWVkaWF0ZWsuY29tPgpSZXZpZXdlZC1ieTogTsOtY29sYXMg
Ri4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgpSZXZpZXdlZC1ieTogQW5n
ZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFi
b3JhLmNvbT4KLS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpIHwg
MTIgKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpCmluZGV4IDQxMWZlYjI5NDYxMy4uNzY0
Mjg1OTk0NDRlIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5
Mi5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kKQEAg
LTUyMyw2ICs1MjMsMTggQEAKIAkJCWNsb2NrLW5hbWVzID0gImNsazEzbSI7CiAJCX07CiAKKwkJ
cHdyYXA6IHB3cmFwQDEwMDI2MDAwIHsKKwkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2ODcz
LXB3cmFwIjsKKwkJCXJlZyA9IDwwIDB4MTAwMjYwMDAgMCAweDEwMDA+OworCQkJcmVnLW5hbWVz
ID0gInB3cmFwIjsKKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAyMjAgSVJRX1RZUEVfTEVWRUxf
SElHSCAwPjsKKwkJCWNsb2NrcyA9IDwmaW5mcmFjZmcgQ0xLX0lORlJBX1BNSUNfQVA+LAorCQkJ
CSA8JmluZnJhY2ZnIENMS19JTkZSQV9QTUlDX1RNUj47CisJCQljbG9jay1uYW1lcyA9ICJzcGki
LCAid3JhcCI7CisJCQlhc3NpZ25lZC1jbG9ja3MgPSA8JnRvcGNrZ2VuIENMS19UT1BfUFdSQVBf
VUxQT1NDX1NFTD47CisJCQlhc3NpZ25lZC1jbG9jay1wYXJlbnRzID0gPCZ0b3Bja2dlbiBDTEtf
VE9QX09TQ19EMTA+OworCQl9OworCiAJCXNjcF9hZHNwOiBjbG9jay1jb250cm9sbGVyQDEwNzIw
MDAwIHsKIAkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLXNjcF9hZHNwIjsKIAkJCXJl
ZyA9IDwwIDB4MTA3MjAwMDAgMCAweDEwMDA+OwotLSAKMi4xOC4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
