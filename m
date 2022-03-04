Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB0FC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 13:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KTdePOLtMO7Lg/taZ4xsmPSb0cjBgtnZ6A3FYE4JDAg=; b=hTd85F1TCiuocp
	nI6Mfo7TdiabUFwIeLSERoX18wlSZnsL2VKqyp26aG6256sccB4F+kghh7zBA/2mt1wpS7S9JWxC1
	9CRuCrPRrDvtZmTqBlcWgO5NiFIv1GMlFsuqI6LduOmFaeajO6aBeLB8BU3/ZSyS9zUfOXhfpulYz
	bQFcoV/nxTZXUdzJO+LS7D4uzsfmboshdFb8N5+RLErp2f3lbHfXeFrfuWiIuK4xY7NaOnrckdljh
	BOb6RcSp/2MFrfSa5V7jWoqdQ5xAEjLxUTogbhNzLVoMUW2mFTcCp7d7hjR/MpPHK1RJgBLa3ttFO
	rtysJdZmXRGEHrQbBpkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ7pE-00A91V-Fy; Fri, 04 Mar 2022 13:18:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ7p8-00A8y4-Eq; Fri, 04 Mar 2022 13:18:24 +0000
X-UUID: 403cb3bf4f58429095a0c3af63807d08-20220304
X-UUID: 403cb3bf4f58429095a0c3af63807d08-20220304
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2081132217; Fri, 04 Mar 2022 06:18:18 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Mar 2022 05:08:16 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Mar 2022 21:08:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Mar 2022 21:08:15 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, Hui
 Liu <hui.liu@mediatek.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v3 03/21] arm64: dts: mt8192: Add gce node
Date: Fri, 4 Mar 2022 21:07:51 +0800
Message-ID: <20220304130809.12924-4-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220304130809.12924-1-allen-kh.cheng@mediatek.com>
References: <20220304130809.12924-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_051822_548156_020B7EBF 
X-CRM114-Status: GOOD (  10.09  )
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

QWRkIGdjZSBub2RlIGZvciBtdDgxOTIgU29DLgoKU2lnbmVkLW9mZi1ieTogQWxsZW4tS0ggQ2hl
bmcgPGFsbGVuLWtoLmNoZW5nQG1lZGlhdGVrLmNvbT4KUmV2aWV3ZWQtYnk6IE7DrWNvbGFzIEYu
IFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZ2Vs
b0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9y
YS5jb20+Ci0tLQogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaSB8IDEw
ICsrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaSBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kKaW5kZXggMGY5ZjIxMWNhOTg2Li45ZTFiNTYz
YmViYWIgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0
c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQpAQCAtNiw2
ICs2LDcgQEAKIAogL2R0cy12MS87CiAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svbXQ4MTky
LWNsay5oPgorI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2djZS9tdDgxOTItZ2NlLmg+CiAjaW5jbHVk
ZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPgogI2luY2x1ZGUg
PGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPgogI2luY2x1ZGUgPGR0LWJp
bmRpbmdzL3BpbmN0cmwvbXQ4MTkyLXBpbmZ1bmMuaD4KQEAgLTU1Miw2ICs1NTMsMTUgQEAKIAkJ
CSNzaXplLWNlbGxzID0gPDA+OwogCQl9OwogCisJCWdjZTogbWFpbGJveEAxMDIyODAwMCB7CisJ
CQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi1nY2UiOworCQkJcmVnID0gPDAgMHgxMDIy
ODAwMCAwIDB4NDAwMD47CisJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjAzIElSUV9UWVBFX0xF
VkVMX0hJR0ggMD47CisJCQkjbWJveC1jZWxscyA9IDwzPjsKKwkJCWNsb2NrcyA9IDwmaW5mcmFj
ZmcgQ0xLX0lORlJBX0dDRT47CisJCQljbG9jay1uYW1lcyA9ICJnY2UiOworCQl9OworCiAJCXNj
cF9hZHNwOiBjbG9jay1jb250cm9sbGVyQDEwNzIwMDAwIHsKIAkJCWNvbXBhdGlibGUgPSAibWVk
aWF0ZWssbXQ4MTkyLXNjcF9hZHNwIjsKIAkJCXJlZyA9IDwwIDB4MTA3MjAwMDAgMCAweDEwMDA+
OwotLSAKMi4xOC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlawo=
