Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DADDBC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 12:32:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9231360F93
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 12:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9231360F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=saSfpvw8VVD27zXF3GVhCQ9bscCXcw25vjhLE+1DQO4=; b=wICFKmSvk25DKa
	5PIbkCnfPEbIhWE7wUFUKFx7ggdgQK9XN+A8dyKkoDw72fhbedhv45M+PUAgIvoSwmmohIhK6G5Pm
	dp/kEvHmC0xy+bIj8CpBdm1oLMZVJqD395CSFl0dmwAkk8FJb0uJRRJfuiL7ik9Z5sC0/oYboOK9P
	i/GLADwcC9ItaMPO1zKNAW1DpZWPlE8isInj70ZwH2TWllHRjLFF9zAOKFFUwPepZ+8JNjTrlzTw3
	5lSB0jWC0gEv19eHWIFNdMfYlA9T068Q8tymT7MU5AlfaAsh1wMew69BP8Arx5FvYdESyGVI7iId2
	F4OpbbqOJ4/CLMw0pWPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdtiu-00AsSG-Vd; Fri, 22 Oct 2021 12:32:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdtii-00AsPA-52; Fri, 22 Oct 2021 12:32:25 +0000
X-UUID: 418032e255ae498085bec17457d52a7b-20211022
X-UUID: 418032e255ae498085bec17457d52a7b-20211022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 998631091; Fri, 22 Oct 2021 05:32:22 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Oct 2021 05:22:20 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Oct 2021 20:22:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Oct 2021 20:22:18 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, "Weiyi
 Lu" <weiyi.lu@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Ikjoon Jang <ikjn@chromium.org>, Miles Chen <miles.chen@mediatek.com>, "Enric
 Balletbo i Serra" <enric.balletbo@collabora.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-clk@vger.kernel.org>
CC: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>, "Sam
 Shih" <sam.shih@mediatek.com>
Subject: [RESEND, PATCH v6 0/5] Mediatek MT7986 basic clock support
Date: Fri, 22 Oct 2021 20:22:13 +0800
Message-ID: <20211022122213.27065-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_053224_224137_5E87583C 
X-CRM114-Status: GOOD (  11.31  )
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

VGhpcyBwYXRjaCBzZXJpZXMgYWRkIGJhc2ljIGNsb2NrIHN1cHBvcnQgZm9yIG1lZGlhdGVrIG10
Nzk4NiBTb0MuCkl0IGlzIGJhc2VkIG9uIHBhdGNoIHNlcmllcyAiQWRkIGJhc2ljIFNvQyBzdXBw
b3J0IGZvciBtZWRpYXRlayBtdDc5ODYiCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIx
MTAxODExNDAwOS4xMzM1MC0xLXNhbS5zaGloQG1lZGlhdGVrLmNvbS8KYW5kICJjbGs6IG1lZGlh
dGVrOiBBZGQgQVBJIGZvciBjbG9jayByZXNvdXJjZSByZWN5Y2xlIgpodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1hcm0ta2VybmVsLzIwMjEwOTE0MDIxNjMzLjI2Mzc3LTUtY2h1bi1qaWUu
Y2hlbkBtZWRpYXRlay5jb20vCgotLS0KdjY6IFVzZWQgbG93ZXJjYXNlIGhleCB2YWx1ZXMgaW4g
Y2xvY2sgRFQKdjU6IHVzZWQgYnVpbHRpbl9wbGF0Zm9ybV9kcml2ZXIgaW5zdGVhZCBvZiBDTEtf
T0ZfREVDTEFSRQogICAgZm9sbG93IHJlY2VudCBjbGstbXQ4MTk1IGNsb2NrIHBhdGNoIHNlcmll
czoKICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvMjAyMTA5MTQw
MjE2MzMuMjYzNzctMS1jaHVuLWppZS5jaGVuQG1lZGlhdGVrLmNvbS8KCnY0OgpBY2NvcmRpbmcg
dG8gdGhlIG1haW50YWluZXLigJlzIHN1Z2dlc3Rpb24sIHRoaXMgcGF0Y2ggc3BsaXRzIHRoZSBw
cmV2aW91cwp0aHJlYWQgaW50byBpbmRlcGVuZGVudCBwYXRjaCBzZXJpZXMuClRoaXMgcGF0Y2gg
aW5jbHVkZSBjbG9jayBkcml2ZXIgYW5kIGRldmljZSB0cmVlIHVwZGF0ZQoKT3JpZ2luYWwgdGhy
ZWFkOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMTA5MTQwODUxMzcuMzE3NjEtMS1z
YW0uc2hpaEBtZWRpYXRlay5jb20vCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1r
ZXJuZWwvMjAyMTA5MTQwODUxMzcuMzE3NjEtMi1zYW0uc2hpaEBtZWRpYXRlay5jb20vCi0tLQoK
U2FtIFNoaWggKDUpOgogIGR0LWJpbmRpbmdzOiBjbG9jazogbWVkaWF0ZWs6IGRvY3VtZW50IGNs
ayBiaW5kaW5ncyBmb3IgbWVkaWF0ZWsKICAgIG10Nzk4NiBTb0MKICBjbGs6IG1lZGlhdGVrOiBh
ZGQgbXQ3OTg2IGNsb2NrIElEcwogIGNsazogbWVkaWF0ZWs6IGFkZCBtdDc5ODYgY2xvY2sgc3Vw
cG9ydAogIGFybTY0OiBkdHM6IG1lZGlhdGVrOiBhZGQgY2xvY2sgc3VwcG9ydCBmb3IgbXQ3OTg2
YQogIGFybTY0OiBkdHM6IG1lZGlhdGVrOiBhZGQgY2xvY2sgc3VwcG9ydCBmb3IgbXQ3OTg2YgoK
IC4uLi9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssYXBtaXhlZHN5cy50eHQgICAgICB8ICAgMSArCiAu
Li4vYmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLGV0aHN5cy50eHQgfCAgIDEgKwogLi4u
L2FybS9tZWRpYXRlay9tZWRpYXRlayxpbmZyYWNmZy50eHQgICAgICAgIHwgICAxICsKIC4uLi9h
cm0vbWVkaWF0ZWsvbWVkaWF0ZWssc2dtaWlzeXMudHh0ICAgICAgICB8ICAgMiArCiAuLi4vYXJt
L21lZGlhdGVrL21lZGlhdGVrLHRvcGNrZ2VuLnR4dCAgICAgICAgfCAgIDEgKwogYXJjaC9hcm02
NC9ib290L2R0cy9tZWRpYXRlay9tdDc5ODZhLmR0c2kgICAgIHwgIDY4ICsrKy0KIGFyY2gvYXJt
NjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ3OTg2Yi5kdHNpICAgICB8ICA2OCArKystCiBkcml2ZXJz
L2Nsay9tZWRpYXRlay9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgMTcgKwogZHJpdmVycy9j
bGsvbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgICA0ICsKIGRyaXZlcnMvY2xr
L21lZGlhdGVrL2Nsay1tdDc5ODYtYXBtaXhlZC5jICAgICB8IDEwMCArKysrKwogZHJpdmVycy9j
bGsvbWVkaWF0ZWsvY2xrLW10Nzk4Ni1ldGguYyAgICAgICAgIHwgMTMyICsrKysrKysKIGRyaXZl
cnMvY2xrL21lZGlhdGVrL2Nsay1tdDc5ODYtaW5mcmFjZmcuYyAgICB8IDIyNCArKysrKysrKysr
KysKIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDc5ODYtdG9wY2tnZW4uYyAgICB8IDM0MiAr
KysrKysrKysrKysrKysrKysKIGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svbXQ3OTg2LWNsay5o
ICAgICAgICB8IDE2OSArKysrKysrKysKIDE0IGZpbGVzIGNoYW5nZWQsIDExMjAgaW5zZXJ0aW9u
cygrKSwgMTAgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvbWVk
aWF0ZWsvY2xrLW10Nzk4Ni1hcG1peGVkLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Ns
ay9tZWRpYXRlay9jbGstbXQ3OTg2LWV0aC5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9j
bGsvbWVkaWF0ZWsvY2xrLW10Nzk4Ni1pbmZyYWNmZy5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Nzk4Ni10b3Bja2dlbi5jCiBjcmVhdGUgbW9kZSAxMDA2
NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9tdDc5ODYtY2xrLmgKCi0tCjIuMjkuMgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
