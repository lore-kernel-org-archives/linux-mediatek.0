Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC7AC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 07:44:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BC8B610F9
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 07:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BC8B610F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uknRew8a71r2ch1C/3+nRqmX83NH05diSauYcMZgUjc=; b=a3D3XSWcNbWmo4
	G4HCYw7DfhD9T4FkVGduZCzmsEriLoPz50OUUTMTMnuRQLfQx37Xm19LJ3mN1UmC6rJBWml7m2yNg
	Gn4FV0kJytN7OfjzRNMml7ytc4ugGTyDa/TPA7VbIaHNFwv1YCDyNCNbNPrpQpVqTL5HugbRsoyxG
	yAmrbwLBt4DHFUUgvJkl9A4/oSko4VlPYqq0MzwriCV73WnxuoARi/9w0sJNticLyX+tzaoE/+VG1
	1GZozfh6MU06H5Q7oOEBeplU0hN8lAdKOD5zPVlOykBN2n5Rmn+X9j8t+5hAu3LS3lGI2xui2f7cN
	okQHoHZfUlvMxUgR78QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mavPm-001x9C-8E; Thu, 14 Oct 2021 07:44:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mavPj-001x8d-Us; Thu, 14 Oct 2021 07:44:33 +0000
X-UUID: 9b5d485ad6154f588d5739a5420b01c9-20211014
X-UUID: 9b5d485ad6154f588d5739a5420b01c9-20211014
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 115666904; Thu, 14 Oct 2021 00:44:27 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Oct 2021 00:44:25 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 14 Oct 2021 15:44:18 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Enric Balletbo
 i Serra <enric.balletbo@collabora.com>, Fabien Parent <fparent@baylibre.com>, 
 Seiya Wang <seiya.wang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>, Sam
 Shih <sam.shih@mediatek.com>
Subject: [PATCH v6 0/3] Add basic SoC support for mediatek mt7986
Date: Thu, 14 Oct 2021 15:44:00 +0800
Message-ID: <20211014074403.17346-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_004432_029424_C1BF04C7 
X-CRM114-Status: GOOD (  10.49  )
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
b24uCgotLS0KdjY6IHNlcGFyYXRlIGJhc2ljIHBhcnQgaW50byBhIHNpbmdsZSBwYXRjaCBzZXJp
ZXMKCkFjY29yZGluZyB0byB0aGUgbWFpbnRhaW5lcuKAmXMgc3VnZ2VzdGlvbiwgdGhpcyBwYXRj
aCBzcGxpdHMgdGhlIHByZXZpb3VzCnRocmVhZCBpbnRvIGluZGVwZW5kZW50IHBhdGNoIHNlcmll
cy4KVGhpcyBwYXRjaCBpbmNsdWRlIGJhc2ljIGRldmljZSBzdXBwb3J0LgoKT3JpZ2luYWwgdGhy
ZWFkOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMTA5MTQwODUxMzcuMzE3NjEtMS1z
YW0uc2hpaEBtZWRpYXRlay5jb20vCi0tLQoKU2FtIFNoaWggKDMpOgogIGR0LWJpbmRpbmdzOiBh
cm02NDogZHRzOiBtZWRpYXRlazogQWRkIG10Nzk4NiBzZXJpZXMKICBhcm02NDogZHRzOiBtZWRp
YXRlazogYWRkIGJhc2ljIG10Nzk4NmEgc3VwcG9ydAogIGFybTY0OiBkdHM6IG1lZGlhdGVrOiBh
ZGQgYmFzaWMgbXQ3OTg2YiBzdXBwb3J0CgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21l
ZGlhdGVrLnlhbWwgICAgIHwgICA4ICsKIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvTWFr
ZWZpbGUgICAgICAgICB8ICAgMiArCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210Nzk4
NmEtcmZiLmR0cyAgfCAgMzQgKysrKwogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDc5
ODZhLmR0c2kgICAgIHwgMTQ5ICsrKysrKysrKysrKysrKysrKwogYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9tdDc5ODZiLXJmYi5kdHMgIHwgIDI2ICsrKwogYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9tdDc5ODZiLmR0c2kgICAgIHwgMTQ5ICsrKysrKysrKysrKysrKysrKwogNiBm
aWxlcyBjaGFuZ2VkLCAzNjggaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gv
YXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ3OTg2YS1yZmIuZHRzCiBjcmVhdGUgbW9kZSAxMDA2
NDQgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDc5ODZhLmR0c2kKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210Nzk4NmItcmZiLmR0cwogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ3OTg2Yi5kdHNp
CgotLQoyLjI5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
