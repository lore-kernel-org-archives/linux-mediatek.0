Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3783C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 12:52:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 689F060E74
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 12:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 689F060E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EZ3BVxUmVWVles01jjw8fhYgTHTP9QVwVDp9ve4OdAo=; b=zkd+1ceBxIQxrn
	lcb0zS3m0WXJ58K+9KO51HQEkm3VME025FJ+3qMbP3ed3qA1ceAjoWLXjNvRSPJ4mkCpqSsUn5LsA
	LjwFxOcfjSGa6wEeIitJeW4CO4P53LtkGRY9nJ+ZSeOKjJSzN7MFf59QVCM2E7iZ01ZljLoTsgb5K
	t9LCtP2z1eEqbsccPIDZuU4WibpFCpDacBnhuuNXsYXc2adVyzmLoKNFj6XmsgAnTK9g4vknPqYS2
	Cezegae6sK46z6cvJ6MS5z2zFe3sYAAokd9WrFrw1V6xRzkN1ByYH3yZwqWF2EYeoJUHFaWo0E4nZ
	pehxh/5Dzxhnc4LKFroA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdu1X-00Axm6-VU; Fri, 22 Oct 2021 12:51:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdu0X-00AxYz-Ii; Fri, 22 Oct 2021 12:50:51 +0000
X-UUID: f46d2c1513aa489d8230e3abca8dce53-20211022
X-UUID: f46d2c1513aa489d8230e3abca8dce53-20211022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1839025930; Fri, 22 Oct 2021 05:50:46 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Oct 2021 05:40:44 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 22 Oct 2021 20:40:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Oct 2021 20:40:42 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>, "Sam
 Shih" <sam.shih@mediatek.com>
Subject: [PATCH v9 0/4] Mediatek MT7986 pinctrl support
Date: Fri, 22 Oct 2021 20:40:32 +0800
Message-ID: <20211022124036.5291-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_055049_656264_E6BFD8D3 
X-CRM114-Status: GOOD (  11.02  )
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

VGhpcyBwYXRjaCBzZXJpZXMgYWRkIHBpbmN0cmwgc3VwcG9ydCBmb3IgbWVkaWF0ZWsgbXQ3OTg2
IFNvQyBzZXJpZXMuCkl0IGlzIGJhc2VkIG9uIHBhdGNoIHNlcmllcyAiQWRkIGJhc2ljIFNvQyBz
dXBwb3J0IGZvciBtZWRpYXRlayBtdDc5ODYiCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDIxMTAxODExNDAwOS4xMzM1MC0xLXNhbS5zaGloQG1lZGlhdGVrLmNvbS8KLS0tCnY5OiBhZGRl
ZCBBY2tlZC1ieSBhbmQgUmV2aWV3ZWQtYnkgdGFnCnY4OiBmaXhlZCB1YXJ0IG5vZGUgaW4geWFt
bCBkdHMgZXhhbXBsZQp2Nzogc2VwYXJhdGUgcGluY3RybCBwYXJ0IGludG8gYSBzaW5nbGUgcGF0
Y2ggc2VyaWVzCgpBY2NvcmRpbmcgdG8gdGhlIG1haW50YWluZXLigJlzIHN1Z2dlc3Rpb24sIHRo
aXMgcGF0Y2ggc3BsaXRzIHRoZSBwcmV2aW91cwp0aHJlYWQgaW50byBpbmRlcGVuZGVudCBwYXRj
aCBzZXJpZXMuClRoaXMgcGF0Y2ggaW5jbHVkZSBjbG9jayBkcml2ZXIgYW5kIGRldmljZSB0cmVl
IHVwZGF0ZQoKT3JpZ2luYWwgdGhyZWFkOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
MTA5MTQwODUxMzcuMzE3NjEtMS1zYW0uc2hpaEBtZWRpYXRlay5jb20vCi0tLQoKClNhbSBTaGlo
ICg0KToKICBkdC1iaW5kaW5nczogcGluY3RybDogdXBkYXRlIGJpbmRpbmdzIGZvciBNVDc5ODYg
U29DCiAgcGluY3RybDogbWVkaWF0ZWs6IGFkZCBzdXBwb3J0IGZvciBNVDc5ODYgU29DCiAgYXJt
NjQ6IGR0czogbWVkaWF0ZWs6IGFkZCBwaW5jdHJsIHN1cHBvcnQgZm9yIG10Nzk4NmEKICBhcm02
NDogZHRzOiBtZWRpYXRlazogYWRkIHBpbmN0cmwgc3VwcG9ydCBmb3IgbXQ3OTg2YgoKIC4uLi9w
aW5jdHJsL21lZGlhdGVrLG10Nzk4Ni1waW5jdHJsLnlhbWwgICAgICB8IDM2MyArKysrKysrCiBh
cmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210Nzk4NmEtcmZiLmR0cyAgfCAgMjAgKwogYXJj
aC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDc5ODZhLmR0c2kgICAgIHwgIDIxICsKIGFyY2gv
YXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ3OTg2Yi5kdHNpICAgICB8ICAyMSArCiBkcml2ZXJz
L3BpbmN0cmwvbWVkaWF0ZWsvS2NvbmZpZyAgICAgICAgICAgICAgfCAgIDcgKwogZHJpdmVycy9w
aW5jdHJsL21lZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvcGlu
Y3RybC9tZWRpYXRlay9waW5jdHJsLW10Nzk4Ni5jICAgICB8IDkyNyArKysrKysrKysrKysrKysr
KysKIDcgZmlsZXMgY2hhbmdlZCwgMTM2MCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvbWVkaWF0ZWssbXQ3
OTg2LXBpbmN0cmwueWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcGluY3RybC9tZWRp
YXRlay9waW5jdHJsLW10Nzk4Ni5jCgotLQoyLjI5LjIKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
