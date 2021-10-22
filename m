Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49E1C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 12:20:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C0D96112F
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 12:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C0D96112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o6xn24pCDs1Kyo72ANpS3Mks7/bRP5nJUtFbHyF17yg=; b=G2x7aF5UDqlRlB
	X34fEvLMKQKf8Syy5djXlxhiZmQ39Mgqymc8ow0uteAx6jGcfzOjlqvAmIYezcl4+o65TP/XU7F3+
	lB0gpAvXssP8rT4KJncAhWWKOYPcIpDPuY+2DAWSmmC/tSy+5z96pDt7ZE9TKvpJ/8ZVvAmvvRDNb
	ASZ5KBDEO/Mls9A6WcpAzpHEc3Y7Q32NhmuUDHpAkAM8PhA0m0CbmCZuLlTobKF3SbKLJqRGP6Anx
	M0fMBwQUDKUVHkUV9YYZI+p/mTcj6R+QNv57OJ+vOTcGUb5M7p2YgpBB7JPXl8z9QawvgTCIx4Drs
	Pp2iZ16AwRSOHB0fbCCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdtWz-00Ap2W-Ak; Fri, 22 Oct 2021 12:20:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdtWh-00AovS-UF; Fri, 22 Oct 2021 12:20:03 +0000
X-UUID: 8bb5aba5dc5f4fdf9872b3f6860e1600-20211022
X-UUID: 8bb5aba5dc5f4fdf9872b3f6860e1600-20211022
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2050903468; Fri, 22 Oct 2021 05:19:55 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Oct 2021 05:19:53 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Oct 2021 20:19:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Oct 2021 20:19:51 +0800
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
Subject: 
Date: Fri, 22 Oct 2021 20:19:39 +0800
Message-ID: <20211022121944.25687-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_051959_990498_EF30FAC0 
X-CRM114-Status: GOOD (  11.26  )
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

U3ViamVjdDogW1BBVENIIHY2IDAvNV0gTWVkaWF0ZWsgTVQ3OTg2IGJhc2ljIGNsb2NrIHN1cHBv
cnQKClRoaXMgcGF0Y2ggc2VyaWVzIGFkZCBiYXNpYyBjbG9jayBzdXBwb3J0IGZvciBtZWRpYXRl
ayBtdDc5ODYgU29DLgpJdCBpcyBiYXNlZCBvbiBwYXRjaCBzZXJpZXMgIkFkZCBiYXNpYyBTb0Mg
c3VwcG9ydCBmb3IgbWVkaWF0ZWsgbXQ3OTg2IgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MjAyMTEwMTgxMTQwMDkuMTMzNTAtMS1zYW0uc2hpaEBtZWRpYXRlay5jb20vCmFuZCAiY2xrOiBt
ZWRpYXRlazogQWRkIEFQSSBmb3IgY2xvY2sgcmVzb3VyY2UgcmVjeWNsZSIKaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtYXJtLWtlcm5lbC8yMDIxMDkxNDAyMTYzMy4yNjM3Ny01LWNodW4t
amllLmNoZW5AbWVkaWF0ZWsuY29tLwoKLS0tCnY2OiBVc2VkIGxvd2VyY2FzZSBoZXggdmFsdWVz
IGluIGNsb2NrIERUCnY1OiB1c2VkIGJ1aWx0aW5fcGxhdGZvcm1fZHJpdmVyIGluc3RlYWQgb2Yg
Q0xLX09GX0RFQ0xBUkUKICAgIGZvbGxvdyByZWNlbnQgY2xrLW10ODE5NSBjbG9jayBwYXRjaCBz
ZXJpZXM6CiAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0ta2VybmVsLzIwMjEw
OTE0MDIxNjMzLjI2Mzc3LTEtY2h1bi1qaWUuY2hlbkBtZWRpYXRlay5jb20vCgp2NDoKQWNjb3Jk
aW5nIHRvIHRoZSBtYWludGFpbmVy4oCZcyBzdWdnZXN0aW9uLCB0aGlzIHBhdGNoIHNwbGl0cyB0
aGUgcHJldmlvdXMKdGhyZWFkIGludG8gaW5kZXBlbmRlbnQgcGF0Y2ggc2VyaWVzLgpUaGlzIHBh
dGNoIGluY2x1ZGUgY2xvY2sgZHJpdmVyIGFuZCBkZXZpY2UgdHJlZSB1cGRhdGUKCk9yaWdpbmFs
IHRocmVhZDoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjEwOTE0MDg1MTM3LjMxNzYx
LTEtc2FtLnNoaWhAbWVkaWF0ZWsuY29tLwpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1h
cm0ta2VybmVsLzIwMjEwOTE0MDg1MTM3LjMxNzYxLTItc2FtLnNoaWhAbWVkaWF0ZWsuY29tLwot
LS0KClNhbSBTaGloICg1KToKICBkdC1iaW5kaW5nczogY2xvY2s6IG1lZGlhdGVrOiBkb2N1bWVu
dCBjbGsgYmluZGluZ3MgZm9yIG1lZGlhdGVrCiAgICBtdDc5ODYgU29DCiAgY2xrOiBtZWRpYXRl
azogYWRkIG10Nzk4NiBjbG9jayBJRHMKICBjbGs6IG1lZGlhdGVrOiBhZGQgbXQ3OTg2IGNsb2Nr
IHN1cHBvcnQKICBhcm02NDogZHRzOiBtZWRpYXRlazogYWRkIGNsb2NrIHN1cHBvcnQgZm9yIG10
Nzk4NmEKICBhcm02NDogZHRzOiBtZWRpYXRlazogYWRkIGNsb2NrIHN1cHBvcnQgZm9yIG10Nzk4
NmIKCiAuLi4vYXJtL21lZGlhdGVrL21lZGlhdGVrLGFwbWl4ZWRzeXMudHh0ICAgICAgfCAgIDEg
KwogLi4uL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxldGhzeXMudHh0IHwgICAxICsK
IC4uLi9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssaW5mcmFjZmcudHh0ICAgICAgICB8ICAgMSArCiAu
Li4vYXJtL21lZGlhdGVrL21lZGlhdGVrLHNnbWlpc3lzLnR4dCAgICAgICAgfCAgIDIgKwogLi4u
L2FybS9tZWRpYXRlay9tZWRpYXRlayx0b3Bja2dlbi50eHQgICAgICAgIHwgICAxICsKIGFyY2gv
YXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ3OTg2YS5kdHNpICAgICB8ICA2OCArKystCiBhcmNo
L2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210Nzk4NmIuZHRzaSAgICAgfCAgNjggKysrLQogZHJp
dmVycy9jbGsvbWVkaWF0ZWsvS2NvbmZpZyAgICAgICAgICAgICAgICAgIHwgIDE3ICsKIGRyaXZl
cnMvY2xrL21lZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAgNCArCiBkcml2ZXJz
L2Nsay9tZWRpYXRlay9jbGstbXQ3OTg2LWFwbWl4ZWQuYyAgICAgfCAxMDAgKysrKysKIGRyaXZl
cnMvY2xrL21lZGlhdGVrL2Nsay1tdDc5ODYtZXRoLmMgICAgICAgICB8IDEzMiArKysrKysrCiBk
cml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ3OTg2LWluZnJhY2ZnLmMgICAgfCAyMjQgKysrKysr
KysrKysrCiBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ3OTg2LXRvcGNrZ2VuLmMgICAgfCAz
NDIgKysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL210Nzk4Ni1j
bGsuaCAgICAgICAgfCAxNjkgKysrKysrKysrCiAxNCBmaWxlcyBjaGFuZ2VkLCAxMTIwIGluc2Vy
dGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xr
L21lZGlhdGVrL2Nsay1tdDc5ODYtYXBtaXhlZC5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9jbGsvbWVkaWF0ZWsvY2xrLW10Nzk4Ni1ldGguYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvY2xrL21lZGlhdGVrL2Nsay1tdDc5ODYtaW5mcmFjZmcuYwogY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDc5ODYtdG9wY2tnZW4uYwogY3JlYXRlIG1vZGUg
MTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svbXQ3OTg2LWNsay5oCgotLQoyLjI5LjIK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
