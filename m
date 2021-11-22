Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C39C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Nov 2021 12:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3gVFthMIy99UMeWGIN9l3qvylnKMQqr3fIQJOI3Nd+U=; b=OVU0DuuVpcJXv7
	jvpb2F/i2yZQ4RSe5DoEz/SOfos/z4AH5fBVDCJMO3bc0r+qPYKsZ+Q/X8hitdHFE48ogJjkdGBz8
	7c6LA9vyGpX+LXVeovmYmX0VHT+asmfoRzbfOlAUSop2Tp/Df/u867GCO0Df1lucX8zK8c3XVS+Uq
	4hWnWGO+JMkZstKwl27SyNr5uNPDvT0fvcg1ONWZ+ocXcX/yJ4noRcAHAm3Db3oLsM87/pVlgIMKN
	cLWPZsjjSyNvkFqS6u/0WCfFZGFF0eS+c/Vo6Zpl24H+YfOCdJM28GhD3PK5Rxc5STh/zcl3BanL6
	iRd85/St1CWntyXqfLOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp8eb-00GQRo-4k; Mon, 22 Nov 2021 12:42:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp8V5-00GNNF-EL; Mon, 22 Nov 2021 12:32:50 +0000
X-UUID: 29a0de570ca04ec4b1cd1ae9145a96f8-20211122
X-UUID: 29a0de570ca04ec4b1cd1ae9145a96f8-20211122
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2097765967; Mon, 22 Nov 2021 05:32:39 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Nov 2021 04:32:37 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Nov 2021 20:32:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 22 Nov 2021 20:32:36 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Enric Balletbo
 i Serra" <enric.balletbo@collabora.com>, Fabien Parent
 <fparent@baylibre.com>, Seiya Wang <seiya.wang@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
CC: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>, "Sam
 Shih" <sam.shih@mediatek.com>
Subject: [PATCH v8 0/2] Add basic SoC support for mediatek mt7986
Date: Mon, 22 Nov 2021 20:32:20 +0800
Message-ID: <20211122123222.8016-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_043247_529616_627D55CE 
X-CRM114-Status: GOOD (  13.73  )
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

VGhpcyBwYXRjaCBhZGRzIGJhc2ljIFNvQyBzdXBwb3J0IGZvciBNZWRpYXRlaydzIG5ldyA0LWNv
cmUgU29DLApNVDc5ODYsIHdoaWNoIGlzIG1haW5seSBmb3Igd2lmaS1yb3V0ZXIgYXBwbGljYXRp
b24uCgpUaGUgTVQ3OTg2IHNlcmllcyBpbmNsdWRlcyBtdDc5ODZhIGFuZCBtdDc5ODZiLApUaGUg
ZGlmZmVyZW5jZSBpcyB0aGF0IHNvbWUgcGlucyBkbyBub3QgZXhpc3Qgb24gbXQ3OTg2YgoodHdv
IHBpbmN0cmxzIGNvbXBhdGlibGUgc3RyaW5nIGFyZSByZXF1aXJlZCksCgpCdXQgdGhlIGJhc2lj
IHBhcnQgb2YgdGhlIGRldmljZSB0cmVlIHNob3VsZCBiZSB0aGUgc2FtZSwKU28gd2Ugb25seSBh
ZGQgbXQ3OTg2YSBpbiB0aGlzIGJhc2ljIHBhcnQgcGF0Y2ggc2VyaWVzLgpXZSB3aWxsIHNlcGFy
YXRlIG10Nzk4NmEgYW5kIG10Nzk4NmIgaW4gdGhlIHBpbmN0cmwgcGF0Y2ggc2VyaWVzCgotLS0K
djg6IHVwZGF0ZWQgZHRzCnY3OiBhZGRlZCBtZW1vcnkgbm9kZSBiYWNrIHRvIGR0cwp2Njogc2Vw
YXJhdGUgYmFzaWMgcGFydCBpbnRvIGEgc2luZ2xlIHBhdGNoIHNlcmllcwoKQWNjb3JkaW5nIHRv
IHRoZSBtYWludGFpbmVy4oCZcyBzdWdnZXN0aW9uLCB0aGlzIHBhdGNoIHNwbGl0cyB0aGUgcHJl
dmlvdXMKdGhyZWFkIGludG8gaW5kZXBlbmRlbnQgcGF0Y2ggc2VyaWVzLgpUaGlzIHBhdGNoIGlu
Y2x1ZGUgYmFzaWMgZGV2aWNlIHN1cHBvcnQuCgpPcmlnaW5hbCB0aHJlYWQ6Cmh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC8yMDIxMDkxNDA4NTEzNy4zMTc2MS0xLXNhbS5zaGloQG1lZGlhdGVr
LmNvbS8KCgpTYW0gU2hpaCAoMik6CiAgZHQtYmluZGluZ3M6IGFybTY0OiBkdHM6IG1lZGlhdGVr
OiBBZGQgbXQ3OTg2IHNlcmllcwogIGFybTY0OiBkdHM6IG1lZGlhdGVrOiBhZGQgYmFzaWMgbXQ3
OTg2IHN1cHBvcnQKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsueWFtbCAg
ICAgfCAgIDggKwogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9NYWtlZmlsZSAgICAgICAg
IHwgICAxICsKIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ3OTg2YS1yZmIuZHRzICB8
ICAzNyArKysrKwogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDc5ODZhLmR0c2kgICAg
IHwgMTQ4ICsrKysrKysrKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCAxOTQgaW5zZXJ0aW9u
cygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ3
OTg2YS1yZmIuZHRzCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9tZWRp
YXRlay9tdDc5ODZhLmR0c2kKCi0tIAoyLjI5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
