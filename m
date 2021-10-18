Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A48F7C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 11:58:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70F4260FD8
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 11:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70F4260FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AKxCMl8MrcJGAkBnXYsSERwa4tSkk1XzXztsHY+INIY=; b=NhnSEucVBVM99i
	RQkUPLOsomvlzRPgD2+yZ0e0s2hcEDClla+K5XvH3GsbL4uweRk93u8qr1oOxj3krldcMkuwyUv1G
	sx41vewBaArw0fWnSWbc5V8E9kiwhom9MP0CHVu8jCsQR0ljkBm3i6+MJ/Htz4bRWo6B3qSNCLqSf
	Ojn4I6dpNkcTIxsqigKlvlHwd5Of6c93Z+MnP/Vi113BGo06FIjWoQ3GPGhO5X6UJFNiMnVnn0sOM
	BHbAg6LSdX46RNte1aAp+oBNkrXJZL00R5WLVnTiIoK6ooDo1iwqI9E2DK5nf0pt6gy4VPKQUMFt/
	hli7tZU3raBU0ssQmdIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcRHB-00FVou-1M; Mon, 18 Oct 2021 11:57:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcRGh-00FVe5-JG; Mon, 18 Oct 2021 11:57:29 +0000
X-UUID: 6c3fed04dd1c478eb675cbb99303ed73-20211018
X-UUID: 6c3fed04dd1c478eb675cbb99303ed73-20211018
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1435917539; Mon, 18 Oct 2021 04:57:23 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Oct 2021 04:47:53 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 18 Oct 2021 19:47:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 18 Oct 2021 19:47:52 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>, "Sam
 Shih" <sam.shih@mediatek.com>
Subject: [PATCH v8 0/4] Mediatek MT7986 pinctrl support
Date: Mon, 18 Oct 2021 19:47:35 +0800
Message-ID: <20211018114739.14026-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_045727_667104_13C96F56 
X-CRM114-Status: GOOD (  11.15  )
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
MDIxMTAxODExNDAwOS4xMzM1MC0xLXNhbS5zaGloQG1lZGlhdGVrLmNvbS8KLS0tCnY4OiBmaXhl
ZCB1YXJ0IG5vZGUgaW4geWFtbCBkdHMgZXhhbXBsZQp2Nzogc2VwYXJhdGUgcGluY3RybCBwYXJ0
IGludG8gYSBzaW5nbGUgcGF0Y2ggc2VyaWVzCgpBY2NvcmRpbmcgdG8gdGhlIG1haW50YWluZXLi
gJlzIHN1Z2dlc3Rpb24sIHRoaXMgcGF0Y2ggc3BsaXRzIHRoZSBwcmV2aW91cwp0aHJlYWQgaW50
byBpbmRlcGVuZGVudCBwYXRjaCBzZXJpZXMuClRoaXMgcGF0Y2ggaW5jbHVkZSBjbG9jayBkcml2
ZXIgYW5kIGRldmljZSB0cmVlIHVwZGF0ZQoKT3JpZ2luYWwgdGhyZWFkOgpodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMjAyMTA5MTQwODUxMzcuMzE3NjEtMS1zYW0uc2hpaEBtZWRpYXRlay5j
b20vCi0tLQoKU2FtIFNoaWggKDQpOgogIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiB1cGRhdGUgYmlu
ZGluZ3MgZm9yIE1UNzk4NiBTb0MKICBwaW5jdHJsOiBtZWRpYXRlazogYWRkIHN1cHBvcnQgZm9y
IE1UNzk4NiBTb0MKICBhcm02NDogZHRzOiBtZWRpYXRlazogYWRkIHBpbmN0cmwgc3VwcG9ydCBm
b3IgbXQ3OTg2YQogIGFybTY0OiBkdHM6IG1lZGlhdGVrOiBhZGQgcGluY3RybCBzdXBwb3J0IGZv
ciBtdDc5ODZiCgogLi4uL3BpbmN0cmwvbWVkaWF0ZWssbXQ3OTg2LXBpbmN0cmwueWFtbCAgICAg
IHwgMzYzICsrKysrKysKIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ3OTg2YS1yZmIu
ZHRzICB8ICAyMCArCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210Nzk4NmEuZHRzaSAg
ICAgfCAgMjEgKwogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDc5ODZiLmR0c2kgICAg
IHwgIDIxICsKIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9LY29uZmlnICAgICAgICAgICAgICB8
ICAgNyArCiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgICAgICAgfCAg
IDEgKwogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ3OTg2LmMgICAgIHwgOTI3
ICsrKysrKysrKysrKysrKysrKwogNyBmaWxlcyBjaGFuZ2VkLCAxMzYwIGluc2VydGlvbnMoKykK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGlu
Y3RybC9tZWRpYXRlayxtdDc5ODYtcGluY3RybC55YW1sCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ3OTg2LmMKCi0tCjIuMjkuMgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
