Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA40C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 13:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5oYW58IyteD1lwuIVEzhnOGObUPD9KwdAWTVWXTNnB4=; b=SdwteKKI5/vVO2
	/Kzgeb9UCjmdaWQuHl8l0Awi7HepQ25HQu/NsGt26F5Rp8tGQQN1C1HQhfAFxeAvEeUIYbCV8FOHy
	zFpedQM7yVGxz1SKpd0EYTNZKe2mxXDJrK5xcxsXV8wEF4mgBVQcZW+LK4GXcogRt0SDsSy9dZB6y
	uq1Ity5wx0p0bz2ManXpUemHLSWCt6AUNmeqq8BVWwydZnh90qMb92ABKm3Jv0WM2yvy9ipsraVXy
	dVd/n+Tc8QJsrlZthGNcIu1XOernrEXsVVJWi5u0iYfRMAQPzmYvfBVvgizqMLelNPCyyhqXaqdpZ
	q0UxMEqkLKk1sq74j3Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNDvU-000s1Z-G8; Thu, 24 Feb 2022 13:12:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNDuO-000rSQ-Dl; Thu, 24 Feb 2022 13:11:55 +0000
X-UUID: 7aacfd92ad5345d08ed5f689080e0604-20220224
X-UUID: 7aacfd92ad5345d08ed5f689080e0604-20220224
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 626532559; Thu, 24 Feb 2022 06:11:41 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Feb 2022 05:08:33 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 24 Feb 2022 21:08:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 24 Feb 2022 21:08:25 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Kishon Vijay Abraham I" <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@canonical.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Min Guo <Min.Guo@mediatek.com>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 1/1] dt-bindings: phy: mediatek,
 tphy: Add compatible for MT8192
Date: Thu, 24 Feb 2022 21:08:22 +0800
Message-ID: <20220224130822.11292-2-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220224130822.11292-1-allen-kh.cheng@mediatek.com>
References: <20220224130822.11292-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_051148_519142_42353EE5 
X-CRM114-Status: UNSURE (   9.08  )
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

QWRkIE1UODE5MiBjb21wYXRpYmxlIHRvIHRoZSBNZWRpYXRlayBULVBIWSBkdC1iaW5kaW5nLgoK
U2lnbmVkLW9mZi1ieTogQWxsZW4tS0ggQ2hlbmcgPGFsbGVuLWtoLmNoZW5nQG1lZGlhdGVrLmNv
bT4KUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2No
aW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+ClJldmlld2VkLWJ5OiBOw61jb2xhcyBGLiBSLiBB
LiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3BoeS9tZWRpYXRlayx0cGh5LnlhbWwgfCAxICsKIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWssdHBoeS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3BoeS9tZWRpYXRlayx0cGh5LnlhbWwKaW5kZXggZDI3OWJhMjIyMzE2Li43
YjJlMWJjMTE5YmUgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9waHkvbWVkaWF0ZWssdHBoeS55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9waHkvbWVkaWF0ZWssdHBoeS55YW1sCkBAIC04MSw2ICs4MSw3IEBAIHByb3BlcnRp
ZXM6CiAgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ3NjI5LXRwaHkKICAgICAgICAgICAgICAg
LSBtZWRpYXRlayxtdDgxODMtdHBoeQogICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE4Ni10
cGh5CisgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTkyLXRwaHkKICAgICAgICAgICAtIGNv
bnN0OiBtZWRpYXRlayxnZW5lcmljLXRwaHktdjIKICAgICAgIC0gaXRlbXM6CiAgICAgICAgICAg
LSBlbnVtOgotLSAKMi4xOC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
