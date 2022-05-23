Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BD7C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 10:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zW3jWtpZgKVBFWHE2Zkt7tGsJOQOg0jPvoWVDsTnZDc=; b=Tto+XZrbuksds8
	LaA283LoLPjAuI9qKeihqNAROZvibg33X9/1en3wHc3/GNqfvJUPAJm4qi9VyhpOp+7lQrynBifaE
	p5Dt86NewCPB2y2zrC1p66thYvHI+uvkl0HPvkyHoLDYZqj3ZxbNnj4eIaWpJCaFr2U9Q2XlbCHXq
	pkGrMxkhdcvq9oXRpg36hubXaB2O6LHTLaBvbSKs2TwnvPzf67CmXj0iilJtzplSCdeC/ijSgQN76
	XaNX8RdvOA1upyowXTgY9RVgLjnRygS+JNFc4iX2OY6E+58/f6bI8wlUGvVNuq/RdqflQpVXdqfOT
	9xzBxwf7oH9jRMjco6UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt5kT-003Swl-PW; Mon, 23 May 2022 10:57:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt4bV-002wSg-Bd; Mon, 23 May 2022 09:44:04 +0000
X-UUID: 203934a89d29489f956912197d3a349d-20220523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:4b89886f-a081-4b43-988e-3f9d17b39763, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:406738e3-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 203934a89d29489f956912197d3a349d-20220523
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 188083551; Mon, 23 May 2022 02:43:52 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 02:33:49 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 23 May 2022 17:33:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 23 May 2022 17:33:48 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <p.zabel@pengutronix.de>, <angelogioacchino.delregno@collabora.com>,
 <nfraprado@collabora.com>, <chun-jie.chen@mediatek.com>,
 <wenst@chromium.org>, <runyang.chen@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [RESEND v8 00/19] Cleanup MediaTek clk reset drivers and support SoCs
Date: Mon, 23 May 2022 17:33:27 +0800
Message-ID: <20220523093346.28493-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_024357_494657_EAEFFF03 
X-CRM114-Status: GOOD (  12.32  )
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

SW4gdGhpcyBzZXJpZXMsIHdlIGNsZWFudXAgTWVkaWFUZWsgY2xvY2sgcmVzZXQgZHJpdmVycyBp
biBjbGsvbWVkaWF0ZWsKZm9sZGVyLiBNZWRpYVRlayBjbG9jayByZXNldCBkcml2ZXIgaXMgdXNl
ZCB0byBwcm92aWRlIHJlc2V0IGNvbnRyb2wKb2YgbW9kdWxlcyBjb250cm9sbGVkIGluIGNsaywg
bGlrZSBpbmZyYV9hby4KCkNoYW5nZXMgZm9yIHY4IHJlc2VuZDoKMS4gUmVtb3ZlIHRlc3RlZC1i
eSB0YWcgZnJvbSBOw61jb2xhcyBmb3IgTVQ4MTk1L01UODE4NiBwYXRjaGVzLgoyLiBBZGQgcmV2
aWV3ZWQtYnkgdGFnIGZyb20gQW5nZWxvR2lvYWNjaGluby4KCkNoYW5nZXMgZm9yIHY4OgoxLiBV
c2UgJ2VudW0gbXRrX3Jlc2V0X3ZlcnNpb24nIHRvIHJlcGxhY2UgdTggaW4gcGF0Y2ggNSBhbmQg
Ni4KMi4gVXNlIGxvd2VyY2FzZSAnMHhjJyBpbiBwYXRjaCA3LgozLiBEcm9wICJzaW1wbGUtbWZk
IiBpbiBwYXRjaCAxNiBiZWNhdXNlIGl0J3MgZm9yIG9yaWdpbmFsIHJlc2V0IGNvbnRyb2xsZXIu
CjQuIHY4IGlzIGJhc2VkIG9uIGxpbnV4LW5leHQgbmV4dC0yMDIyMDUyMCBhbmQgQ2hlbi1ZdSdz
IHNlcmllc1sxXS4KCkNoYW5nZXMgZm9yIHY3OgoxLiB2NyBpcyBiYXNlZCBvbiBsaW51eC1uZXh0
IG5leHQtMjAyMjA1MTkgYW5kIENoZW4tWXUncyBzZXJpZXNbMV0uCjIuIEFkZCBzdXBwb3J0IGZv
ciBNVDgxODYuCgpbMV06IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51
eC1tZWRpYXRlay9saXN0Lz9zZXJpZXM9NjQzMDAzCgpDaGFuZ2VzIGZvciB2NjoKMS4gQWRkIGEg
bmV3IHBhdGNoIHRvIHN1cHBvcnQgaW51cHV0IGFyZ3VtZW50IGluZGV4IG1vZGUuCjIuIFJldmlz
ZSBkZWZpbml0aW9uIGluIHJlc2V0LmggdG8gaW5kZXguCgpSZXgtQkMgQ2hlbiAoMTkpOgogIGNs
azogbWVkaWF0ZWs6IHJlc2V0OiBBZGQgcmVzZXQuaAogIGNsazogbWVkaWF0ZWs6IHJlc2V0OiBG
aXggd3JpdHRlbiByZXNldCBiaXQgb2Zmc2V0CiAgY2xrOiBtZWRpYXRlazogcmVzZXQ6IFJlZmlu
ZSBhbmQgcmVvcmRlciBmdW5jdGlvbnMgaW4gcmVzZXQuYwogIGNsazogbWVkaWF0ZWs6IHJlc2V0
OiBFeHRyYWN0IGNvbW1vbiBkcml2ZXJzIHRvIHVwZGF0ZSBmdW5jdGlvbgogIGNsazogbWVkaWF0
ZWs6IHJlc2V0OiBNZXJnZSBhbmQgcmV2aXNlIHJlc2V0IHJlZ2lzdGVyIGZ1bmN0aW9uCiAgY2xr
OiBtZWRpYXRlazogcmVzZXQ6IFJldmlzZSBzdHJ1Y3R1cmUgdG8gY29udHJvbCByZXNldCByZWdp
c3RlcgogIGNsazogbWVkaWF0ZWs6IHJlc2V0OiBTdXBwb3J0IG5vbnNlcXVlbmNlIGJhc2Ugb2Zm
c2V0cyBvZiByZXNldAogICAgcmVnaXN0ZXJzCiAgY2xrOiBtZWRpYXRlazogcmVzZXQ6IFN1cHBv
cnQgaW51cHV0IGFyZ3VtZW50IGluZGV4IG1vZGUKICBjbGs6IG1lZGlhdGVrOiByZXNldDogQ2hh
bmdlIHJldHVybiB0eXBlIGZvciBjbG9jayByZXNldCByZWdpc3RlcgogICAgZnVuY3Rpb24KICBj
bGs6IG1lZGlhdGVrOiByZXNldDogQWRkIG5ldyByZWdpc3RlciByZXNldCBmdW5jdGlvbiB3aXRo
IGRldmljZQogIGNsazogbWVkaWF0ZWs6IHJlc2V0OiBBZGQgcmVzZXQgc3VwcG9ydCBmb3Igc2lt
cGxlIHByb2JlCiAgZHQtYmluZGluZ3M6IGFybTogbWVkaWF0ZWs6IEFkZCAjcmVzZXQtY2VsbHMg
cHJvcGVydHkgZm9yCiAgICBNVDgxOTIvTVQ4MTk1CiAgZHQtYmluZGluZ3M6IHJlc2V0OiBtZWRp
YXRlazogQWRkIGluZnJhX2FvIHJlc2V0IGluZGV4IGZvcgogICAgTVQ4MTkyL01UODE5NQogIGNs
azogbWVkaWF0ZWs6IHJlc2V0OiBBZGQgaW5mcmFfYW8gcmVzZXQgc3VwcG9ydCBmb3IgTVQ4MTky
L01UODE5NQogIGFybTY0OiBkdHM6IG1lZGlhdGVrOiBBZGQgaW5mcmEgI3Jlc2V0LWNlbGxzIHBy
b3BlcnR5IGZvciBNVDgxOTIKICBhcm02NDogZHRzOiBtZWRpYXRlazogQWRkIGluZnJhICNyZXNl
dC1jZWxscyBwcm9wZXJ0eSBmb3IgTVQ4MTk1CiAgZHQtYmluZGluZ3M6IHJlc2V0OiBtZWRpYXRl
azogQWRkIGluZnJhX2FvIHJlc2V0IGluZGV4IGZvciBNVDgxODYKICBkdC1iaW5kaW5nczogYXJt
OiBtZWRpYXRlazogQWRkICNyZXNldC1jZWxscyBwcm9wZXJ0eSBmb3IgTVQ4MTg2CiAgY2xrOiBt
ZWRpYXRlazogcmVzZXQ6IEFkZCBpbmZyYV9hbyByZXNldCBzdXBwb3J0IGZvciBNVDgxODYKCiAu
Li4vbWVkaWF0ZWsvbWVkaWF0ZWssbXQ4MTg2LXN5cy1jbG9jay55YW1sICAgfCAgIDMgKwogLi4u
L21lZGlhdGVrL21lZGlhdGVrLG10ODE5Mi1zeXMtY2xvY2sueWFtbCAgIHwgICAzICsKIC4uLi9t
ZWRpYXRlay9tZWRpYXRlayxtdDgxOTUtc3lzLWNsb2NrLnlhbWwgICB8ICAgMyArCiBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpICAgICAgfCAgIDEgKwogYXJjaC9hcm02
NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTUuZHRzaSAgICAgIHwgIDE1ICstCiBkcml2ZXJzL2Ns
ay9tZWRpYXRlay9jbGstbXQyNzAxLWV0aC5jICAgICAgICAgfCAgMTAgKy0KIGRyaXZlcnMvY2xr
L21lZGlhdGVrL2Nsay1tdDI3MDEtZzNkLmMgICAgICAgICB8ICAxMCArLQogZHJpdmVycy9jbGsv
bWVkaWF0ZWsvY2xrLW10MjcwMS1oaWYuYyAgICAgICAgIHwgIDEwICstCiBkcml2ZXJzL2Nsay9t
ZWRpYXRlay9jbGstbXQyNzAxLmMgICAgICAgICAgICAgfCAgMjIgKy0KIGRyaXZlcnMvY2xrL21l
ZGlhdGVrL2Nsay1tdDI3MTIuYyAgICAgICAgICAgICB8ICAyMiArLQogZHJpdmVycy9jbGsvbWVk
aWF0ZWsvY2xrLW10NzYyMi1ldGguYyAgICAgICAgIHwgIDEwICstCiBkcml2ZXJzL2Nsay9tZWRp
YXRlay9jbGstbXQ3NjIyLWhpZi5jICAgICAgICAgfCAgMTIgKy0KIGRyaXZlcnMvY2xrL21lZGlh
dGVrL2Nsay1tdDc2MjIuYyAgICAgICAgICAgICB8ICAyMiArLQogZHJpdmVycy9jbGsvbWVkaWF0
ZWsvY2xrLW10NzYyOS1ldGguYyAgICAgICAgIHwgIDEwICstCiBkcml2ZXJzL2Nsay9tZWRpYXRl
ay9jbGstbXQ3NjI5LWhpZi5jICAgICAgICAgfCAgMTIgKy0KIGRyaXZlcnMvY2xrL21lZGlhdGVr
L2Nsay1tdDgxMzUuYyAgICAgICAgICAgICB8ICAyMiArLQogZHJpdmVycy9jbGsvbWVkaWF0ZWsv
Y2xrLW10ODE3My5jICAgICAgICAgICAgIHwgIDIyICstCiBkcml2ZXJzL2Nsay9tZWRpYXRlay9j
bGstbXQ4MTgzLmMgICAgICAgICAgICAgfCAgMTggKy0KIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Ns
ay1tdDgxODYtaW5mcmFfYW8uYyAgICB8ICAyMyArKwogZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xr
LW10ODE5Mi5jICAgICAgICAgICAgIHwgIDI5ICsrKwogZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xr
LW10ODE5NS1pbmZyYV9hby5jICAgIHwgIDI0ICsrKwogZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xr
LW10ay5jICAgICAgICAgICAgICAgIHwgICA3ICsKIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1t
dGsuaCAgICAgICAgICAgICAgICB8ICAgOSArLQogZHJpdmVycy9jbGsvbWVkaWF0ZWsvcmVzZXQu
YyAgICAgICAgICAgICAgICAgIHwgMTk4ICsrKysrKysrKysrKystLS0tLQogZHJpdmVycy9jbGsv
bWVkaWF0ZWsvcmVzZXQuaCAgICAgICAgICAgICAgICAgIHwgIDgyICsrKysrKysrCiBpbmNsdWRl
L2R0LWJpbmRpbmdzL3Jlc2V0L210ODE4Ni1yZXNldHMuaCAgICAgfCAgIDUgKwogaW5jbHVkZS9k
dC1iaW5kaW5ncy9yZXNldC9tdDgxOTItcmVzZXRzLmggICAgIHwgICA4ICsKIGluY2x1ZGUvZHQt
YmluZGluZ3MvcmVzZXQvbXQ4MTk1LXJlc2V0cy5oICAgICB8ICAgNiArCiAyOCBmaWxlcyBjaGFu
Z2VkLCA1MjMgaW5zZXJ0aW9ucygrKSwgOTUgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9jbGsvbWVkaWF0ZWsvcmVzZXQuaAoKLS0gCjIuMTguMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
