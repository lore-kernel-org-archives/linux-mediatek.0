Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42EC0C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 07:57:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07FCC61029
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 07:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07FCC61029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pvBf+VnAmkXGuivieJnakwZC5csjUjFLYPjFOXn2S+0=; b=ooFo3H0ZIBfQmC
	IBuLA5CDsV7Mq7lQ+2jbUSV4LFUSawAZglO0LKB+0FUMINAo7OKc8Ku5e4P4X9KHpk+hykoo6Bzj2
	KnFHVv0YXr+49JZVqL82g6t7xX24CeY0y46ciSH/iNEzYDhBaKmrgfoGroHpQ4luB5JzM5vqep3ak
	mFnc82N9hpJ8ldJtY/VUVIp18+YtCZdjxPxo0fGqPLN/gh4m25E4DP17GvhGKs1Cq7sMMOif8fbaf
	10Z3gu5KDUahyGazbRPva5eY7mgEbffLrxo8iXGpT9la0oHFp6Zly85PYJb0CmQ8HwEh1ddYqoVSc
	DRrfjhtvqMtDSJDIAfBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mavcA-0020dj-Lx; Thu, 14 Oct 2021 07:57:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mavbM-0020D8-94; Thu, 14 Oct 2021 07:56:34 +0000
X-UUID: 84c2c8b0f2254cac95acd384d1486634-20211014
X-UUID: 84c2c8b0f2254cac95acd384d1486634-20211014
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 362209155; Thu, 14 Oct 2021 00:56:27 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Oct 2021 00:56:25 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Oct 2021 15:56:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 14 Oct 2021 15:56:24 +0800
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
Subject: [PATCH v4 0/5] Mediatek MT7986 basic clock support
Date: Thu, 14 Oct 2021 15:56:15 +0800
Message-ID: <20211014075620.17563-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_005632_345999_0CCC1D68 
X-CRM114-Status: GOOD (  10.40  )
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
b3J0IGZvciBtZWRpYXRlayBtdDc5ODYiOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
MTEwMTQwNzQ0MDMuMTczNDYtMS1zYW0uc2hpaEBtZWRpYXRlay5jb20vCgotLS0KQWNjb3JkaW5n
IHRvIHRoZSBtYWludGFpbmVy4oCZcyBzdWdnZXN0aW9uLCB0aGlzIHBhdGNoIHNwbGl0cyB0aGUg
cHJldmlvdXMKdGhyZWFkIGludG8gaW5kZXBlbmRlbnQgcGF0Y2ggc2VyaWVzLgpUaGlzIHBhdGNo
IGluY2x1ZGUgY2xvY2sgZHJpdmVyIGFuZCBkZXZpY2UgdHJlZSB1cGRhdGUKCk9yaWdpbmFsIHRo
cmVhZDoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjEwOTE0MDg1MTM3LjMxNzYxLTEt
c2FtLnNoaWhAbWVkaWF0ZWsuY29tLwpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0t
a2VybmVsLzIwMjEwOTE0MDg1MTM3LjMxNzYxLTItc2FtLnNoaWhAbWVkaWF0ZWsuY29tLwotLS0K
ClNhbSBTaGloICg1KToKICBkdC1iaW5kaW5nczogY2xvY2s6IG1lZGlhdGVrOiBkb2N1bWVudCBj
bGsgYmluZGluZ3MgZm9yIG1lZGlhdGVrCiAgICBtdDc5ODYgU29DCiAgY2xrOiBtZWRpYXRlazog
YWRkIG10Nzk4NiBjbG9jayBJRHMKICBjbGs6IG1lZGlhdGVrOiBhZGQgbXQ3OTg2IGNsb2NrIHN1
cHBvcnQKICBhcm02NDogZHRzOiBtZWRpYXRlazogYWRkIGNsb2NrIHN1cHBvcnQgZm9yIG10Nzk4
NmEKICBhcm02NDogZHRzOiBtZWRpYXRlazogYWRkIGNsb2NrIHN1cHBvcnQgZm9yIG10Nzk4NmIK
CiAuLi4vYXJtL21lZGlhdGVrL21lZGlhdGVrLGFwbWl4ZWRzeXMudHh0ICAgICAgfCAgIDEgKwog
Li4uL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxldGhzeXMudHh0IHwgICAxICsKIC4u
Li9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssaW5mcmFjZmcudHh0ICAgICAgICB8ICAgMSArCiAuLi4v
YXJtL21lZGlhdGVrL21lZGlhdGVrLHNnbWlpc3lzLnR4dCAgICAgICAgfCAgIDIgKwogLi4uL2Fy
bS9tZWRpYXRlay9tZWRpYXRlayx0b3Bja2dlbi50eHQgICAgICAgIHwgICAxICsKIGFyY2gvYXJt
NjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ3OTg2YS5kdHNpICAgICB8ICA2OCArKystCiBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL21lZGlhdGVrL210Nzk4NmIuZHRzaSAgICAgfCAgNjggKysrLQogZHJpdmVy
cy9jbGsvbWVkaWF0ZWsvS2NvbmZpZyAgICAgICAgICAgICAgICAgIHwgIDE3ICsKIGRyaXZlcnMv
Y2xrL21lZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAgNCArCiBkcml2ZXJzL2Ns
ay9tZWRpYXRlay9jbGstbXQ3OTg2LWFwbWl4ZWQuYyAgICAgfCAgNzggKysrKysKIGRyaXZlcnMv
Y2xrL21lZGlhdGVrL2Nsay1tdDc5ODYtZXRoLmMgICAgICAgICB8IDEzMiArKysrKysrKwogZHJp
dmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Nzk4Ni1pbmZyYWNmZy5jICAgIHwgMTk4ICsrKysrKysr
KysrCiBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ3OTg2LXRvcGNrZ2VuLmMgICAgfCAzMTkg
KysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL210Nzk4Ni1jbGsu
aCAgICAgICAgfCAxNjkgKysrKysrKysrKwogMTQgZmlsZXMgY2hhbmdlZCwgMTA0OSBpbnNlcnRp
b25zKCspLCAxMCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9t
ZWRpYXRlay9jbGstbXQ3OTg2LWFwbWl4ZWQuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
Y2xrL21lZGlhdGVrL2Nsay1tdDc5ODYtZXRoLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2Nsay9tZWRpYXRlay9jbGstbXQ3OTg2LWluZnJhY2ZnLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ3OTg2LXRvcGNrZ2VuLmMKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL210Nzk4Ni1jbGsuaAoKLS0KMi4yOS4yCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
