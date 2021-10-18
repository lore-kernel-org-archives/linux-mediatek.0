Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 115F2C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 11:48:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D17C560F9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 11:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D17C560F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BgQNHMz+qgIttnvxxgMjSUD+dxOOzO7U8lbFbc8/y00=; b=f1DTIvV7UkS5Vl
	BMxKr4aNHIac27WDEBSn38bdfZehMSjwXik1xdzkP+V9PXaImE/dCYqgt5TxVH1ItZR1jr9KPXHoD
	wYYsw68CFiS0yQ0tze0c9cRXFu0QzCNNZyycQjufM4Qy2R7J7Defgow8t2CHmMaxXvvu9DXyTAXSy
	+KBaNmw3OxTBsalmBACmS1EkM+kotUXILcjYX2nt6ddA8y3NB6J0ld+TYjeRSw/wL2o0Q1gi9VUIF
	t8HD18pq0EqGCLj3wiq/eNjmalcr7RUXjRgEMEISFVRs3bXyl2PVKZxgPYyPWTgQt2BxgUXkhiiCT
	oZxfrlOAE5UHsbLLS8OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcR7W-00FRKJ-GL; Mon, 18 Oct 2021 11:47:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcR6v-00FR1j-Nv; Mon, 18 Oct 2021 11:47:24 +0000
X-UUID: 62244f0f4fa54e94b28191f7c4bd469f-20211018
X-UUID: 62244f0f4fa54e94b28191f7c4bd469f-20211018
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 283107763; Mon, 18 Oct 2021 04:47:19 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Oct 2021 04:47:17 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Oct 2021 19:47:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 18 Oct 2021 19:47:16 +0800
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
Subject: [PATCH v5 0/5] Mediatek MT7986 basic clock support
Date: Mon, 18 Oct 2021 19:46:56 +0800
Message-ID: <20211018114701.13984-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_044721_812418_296BCD06 
X-CRM114-Status: GOOD (  10.86  )
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
Y2hlbkBtZWRpYXRlay5jb20vCgotLS0KdjU6IHVzZWQgYnVpbHRpbl9wbGF0Zm9ybV9kcml2ZXIg
aW5zdGVhZCBvZiBDTEtfT0ZfREVDTEFSRQogICAgZm9sbG93IHJlY2VudCBjbGstbXQ4MTk1IGNs
b2NrIHBhdGNoIHNlcmllczoKICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1r
ZXJuZWwvMjAyMTA5MTQwMjE2MzMuMjYzNzctMS1jaHVuLWppZS5jaGVuQG1lZGlhdGVrLmNvbS8K
CnY0OgpBY2NvcmRpbmcgdG8gdGhlIG1haW50YWluZXLigJlzIHN1Z2dlc3Rpb24sIHRoaXMgcGF0
Y2ggc3BsaXRzIHRoZSBwcmV2aW91cwp0aHJlYWQgaW50byBpbmRlcGVuZGVudCBwYXRjaCBzZXJp
ZXMuClRoaXMgcGF0Y2ggaW5jbHVkZSBjbG9jayBkcml2ZXIgYW5kIGRldmljZSB0cmVlIHVwZGF0
ZQoKT3JpZ2luYWwgdGhyZWFkOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMTA5MTQw
ODUxMzcuMzE3NjEtMS1zYW0uc2hpaEBtZWRpYXRlay5jb20vCmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LWFybS1rZXJuZWwvMjAyMTA5MTQwODUxMzcuMzE3NjEtMi1zYW0uc2hpaEBtZWRp
YXRlay5jb20vCi0tLQoKU2FtIFNoaWggKDUpOgogIGR0LWJpbmRpbmdzOiBjbG9jazogbWVkaWF0
ZWs6IGRvY3VtZW50IGNsayBiaW5kaW5ncyBmb3IgbWVkaWF0ZWsKICAgIG10Nzk4NiBTb0MKICBj
bGs6IG1lZGlhdGVrOiBhZGQgbXQ3OTg2IGNsb2NrIElEcwogIGNsazogbWVkaWF0ZWs6IGFkZCBt
dDc5ODYgY2xvY2sgc3VwcG9ydAogIGFybTY0OiBkdHM6IG1lZGlhdGVrOiBhZGQgY2xvY2sgc3Vw
cG9ydCBmb3IgbXQ3OTg2YQogIGFybTY0OiBkdHM6IG1lZGlhdGVrOiBhZGQgY2xvY2sgc3VwcG9y
dCBmb3IgbXQ3OTg2YgoKIC4uLi9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssYXBtaXhlZHN5cy50eHQg
ICAgICB8ICAgMSArCiAuLi4vYmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLGV0aHN5cy50
eHQgfCAgIDEgKwogLi4uL2FybS9tZWRpYXRlay9tZWRpYXRlayxpbmZyYWNmZy50eHQgICAgICAg
IHwgICAxICsKIC4uLi9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssc2dtaWlzeXMudHh0ICAgICAgICB8
ICAgMiArCiAuLi4vYXJtL21lZGlhdGVrL21lZGlhdGVrLHRvcGNrZ2VuLnR4dCAgICAgICAgfCAg
IDEgKwogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDc5ODZhLmR0c2kgICAgIHwgIDY4
ICsrKy0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ3OTg2Yi5kdHNpICAgICB8ICA2
OCArKystCiBkcml2ZXJzL2Nsay9tZWRpYXRlay9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAg
MTcgKwogZHJpdmVycy9jbGsvbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgICA0
ICsKIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDc5ODYtYXBtaXhlZC5jICAgICB8IDEwMCAr
KysrKwogZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Nzk4Ni1ldGguYyAgICAgICAgIHwgMTMy
ICsrKysrKysKIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDc5ODYtaW5mcmFjZmcuYyAgICB8
IDIyNCArKysrKysrKysrKysKIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDc5ODYtdG9wY2tn
ZW4uYyAgICB8IDM0MiArKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvZHQtYmluZGluZ3MvY2xv
Y2svbXQ3OTg2LWNsay5oICAgICAgICB8IDE2OSArKysrKysrKysKIDE0IGZpbGVzIGNoYW5nZWQs
IDExMjAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Nzk4Ni1hcG1peGVkLmMKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ3OTg2LWV0aC5jCiBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Nzk4Ni1pbmZyYWNmZy5jCiBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Nzk4Ni10b3Bja2dlbi5jCiBj
cmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9tdDc5ODYtY2xrLmgK
Ci0tCjIuMjkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
