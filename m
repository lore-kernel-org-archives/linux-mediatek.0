Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B08C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 08:08:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71ED26109F
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 08:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 71ED26109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2641hQydabuNA0iKJo8yF0um8aQPf+TWIL+EG3AyyTM=; b=nYOZYu8I3VgCxL
	/DZSIaYd6dB3tG3JsFYoYVb8k1GrqXuxORGp1oqo7DcecrCfhjf23Yp0aDCfyco0P2o04kCpku81J
	7yQJcswcvTonWdWD7GL4Kn+IKMXodjk6E+FwfO9PSsHZUPvPmjxjJp1h/997KjCnw64OPcMRH4fl0
	xvJVdaOvITWw3gI/uUqiY9zkPZ9rRJ389Wf5lMomepGgJpOeTWW6cw1RuGJFJnm7RG3U5HxpVFBnK
	FQAUkq6WfGDpyATob/wssEATus9HBxFwy59u6LWNd7pN2VU3wpFKaEcY+9hE+M3GJyyNg+uf0cas3
	j4YdyaDkaAHxfUCBzgzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mavmX-0026AB-KC; Thu, 14 Oct 2021 08:08:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mavl8-0025Z2-Vp; Thu, 14 Oct 2021 08:06:40 +0000
X-UUID: 9da5b5d69b25440c84ac62a46be92872-20211014
X-UUID: 9da5b5d69b25440c84ac62a46be92872-20211014
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1074844197; Thu, 14 Oct 2021 01:06:35 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Oct 2021 00:58:43 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 14 Oct 2021 15:58:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 14 Oct 2021 15:58:42 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>, "Sam
 Shih" <sam.shih@mediatek.com>
Subject: [PATCH v7 0/4] Mediatek MT7986 pinctrl support
Date: Thu, 14 Oct 2021 15:58:32 +0800
Message-ID: <20211014075836.17681-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_010639_070240_B862DADD 
X-CRM114-Status: GOOD (  10.60  )
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
dXBwb3J0IGZvciBtZWRpYXRlayBtdDc5ODYiOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MjAyMTEwMTQwNzQ0MDMuMTczNDYtMS1zYW0uc2hpaEBtZWRpYXRlay5jb20vCgotLS0KdjcgOiBz
ZXBhcmF0ZSBwaW5jdHJsIHBhcnQgaW50byBhIHNpbmdsZSBwYXRjaCBzZXJpZXMKCkFjY29yZGlu
ZyB0byB0aGUgbWFpbnRhaW5lcuKAmXMgc3VnZ2VzdGlvbiwgdGhpcyBwYXRjaCBzcGxpdHMgdGhl
IHByZXZpb3VzCnRocmVhZCBpbnRvIGluZGVwZW5kZW50IHBhdGNoIHNlcmllcy4KVGhpcyBwYXRj
aCBpbmNsdWRlIGNsb2NrIGRyaXZlciBhbmQgZGV2aWNlIHRyZWUgdXBkYXRlCgpPcmlnaW5hbCB0
aHJlYWQ6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIxMDkxNDA4NTEzNy4zMTc2MS0x
LXNhbS5zaGloQG1lZGlhdGVrLmNvbS8KLS0tCgpTYW0gU2hpaCAoNCk6CiAgZHQtYmluZGluZ3M6
IHBpbmN0cmw6IHVwZGF0ZSBiaW5kaW5ncyBmb3IgTVQ3OTg2IFNvQwogIHBpbmN0cmw6IG1lZGlh
dGVrOiBhZGQgc3VwcG9ydCBmb3IgTVQ3OTg2IFNvQwogIGFybTY0OiBkdHM6IG1lZGlhdGVrOiBh
ZGQgcGluY3RybCBzdXBwb3J0IGZvciBtdDc5ODZhCiAgYXJtNjQ6IGR0czogbWVkaWF0ZWs6IGFk
ZCBwaW5jdHJsIHN1cHBvcnQgZm9yIG10Nzk4NmIKCiAuLi4vcGluY3RybC9tZWRpYXRlayxtdDc5
ODYtcGluY3RybC55YW1sICAgICAgfCAzNjMgKysrKysrKwogYXJjaC9hcm02NC9ib290L2R0cy9t
ZWRpYXRlay9tdDc5ODZhLXJmYi5kdHMgIHwgIDIwICsKIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVk
aWF0ZWsvbXQ3OTg2YS5kdHNpICAgICB8ICAyMSArCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlh
dGVrL210Nzk4NmIuZHRzaSAgICAgfCAgMjEgKwogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL0tj
b25maWcgICAgICAgICAgICAgIHwgICA3ICsKIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9NYWtl
ZmlsZSAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3Ry
bC1tdDc5ODYuYyAgICAgfCA5MjcgKysrKysrKysrKysrKysrKysrCiA3IGZpbGVzIGNoYW5nZWQs
IDEzNjAgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL21lZGlhdGVrLG10Nzk4Ni1waW5jdHJsLnlhbWwKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDc5ODYu
YwoKLS0KMi4yOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlawo=
