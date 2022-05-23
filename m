Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D81C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 09:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ATBkVk6Fk5qYuRiIxtHDX50Yf5Dpv89iV8WBDv3IxTw=; b=2zA8i7xJHGecp0
	Jt/OUp2H0EnQapZN1krkYeq/U+jGYmvGeVHZF0gznetz90/ygs+q2kqnDg16zkx7PnguNKtQgroZ7
	K3qWVoNPgz7v/B0iENFFj9Hfes/jmhzI/GNRGM7FbenIyZF2l0wDmYNEaNQoIGmoG8rP1m7TrRkxr
	mLRH2GRKna3tFoLvd5mbHUD9k3nj+4WpaBuw4Jdms0yrTUYdsOMmuMebQQTMo27xu1pL3n9ksuF3Z
	oIyK56TgusIxl5r/LFOFoX6qbjH9sGQFiRvafkpIWtAcgIN0oxmj+ZhPop2IxJQWLZNSL1h0nVXB7
	VT6b3yXCULjOSW3mX6LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4YJ-002v8l-7D; Mon, 23 May 2022 09:40:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2oc-002A7b-GC; Mon, 23 May 2022 07:49:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=L8t6hYJ0JJoKhb6tDK5+a+fJ7HX+q0f2sakwT8lRr4A=; b=KfCDDnU8jyTHNXWForkmmWwwLs
 Uz78HCAeObbTdZnNp8Kg06nA+sDX63jhAw1r5D7exQpgZ4uXp9IMCyt7pe7cVbaQpxcMeqwG0KFzk
 t2049c+ZBrrB8Mrob6zUgXHaigd1aKcdd0Zm7EFHYXl1tSMuT/Y2Yqh1Xfiy9BkFEFGimnLyEeDdg
 vq6d8ueAIjC/UEFSNhLUJ8YnUMbTnFUToc3AFjJo7Wa2bqtujGfECB9XQXsOek6GW5Qvt1gCJcq4P
 Cv3q/sXG6QgY5sB2HrkiGJpjGVhUcJkOKS6rEEUsTG594b583Sb2fp8t0vXDNNRM5OZy8A18nOiF4
 nyhFtJUw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt1Hm-000syY-0m; Mon, 23 May 2022 06:11:24 +0000
X-UUID: c5676a6b10904b10a1afafb6d7080030-20220522
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:6f5a96a9-d3ec-431c-a1fe-7dfcac24f7d7, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:aef93e7a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: c5676a6b10904b10a1afafb6d7080030-20220522
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 499599769; Sun, 22 May 2022 23:10:52 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 May 2022 23:00:59 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 23 May 2022 14:00:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 23 May 2022 14:00:57 +0800
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
Subject: [PATCH v8 02/19] clk: mediatek: reset: Fix written reset bit offset
Date: Mon, 23 May 2022 14:00:39 +0800
Message-ID: <20220523060056.24396-3-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
References: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_071122_795441_205A5F93 
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

T3JpZ2luYWwgYXNzZXJ0L2RlYXNzZXJ0IGJpdCBpcyBCSVQoMCksIGJ1dCBpdCdzIG1vcmUgcmVz
b25hYmxlIHRvIG1vZGlmeQp0aGVtIHRvIEJJVChpZCAlIDMyKSB3aGljaCBpcyBiYXNlZCBvbiBp
ZC4KClRoaXMgcGF0Y2ggd2lsbCBub3QgaW5mbHVlbmNlIGFueSBwcmV2aW91cyBkcml2ZXIgYmVj
YXVzZSB0aGUgcmVzZXQgaXMKb25seSB1c2VkIGZvciB0aGVybWFsLiBUaGUgaWQgKE1UODE4M19J
TkZSQUNGR19BT19USEVSTV9TV19SU1QpIGlzIDAuCgpGaXhlczogNjRlYmI1N2EzZGY2ICgiY2xr
OiByZXNldDogTW9kaWZ5IHJlc2V0LWNvbnRyb2xsZXIgZHJpdmVyIikKU2lnbmVkLW9mZi1ieTog
UmV4LUJDIENoZW4gPHJleC1iYy5jaGVuQG1lZGlhdGVrLmNvbT4KUmV2aWV3ZWQtYnk6IENoZW4t
WXUgVHNhaSA8d2Vuc3RAY2hyb21pdW0ub3JnPgpSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlu
byBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KUmV2
aWV3ZWQtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNv
bT4KVGVzdGVkLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9y
YS5jb20+Ci0tLQogZHJpdmVycy9jbGsvbWVkaWF0ZWsvcmVzZXQuYyB8IDQgKystLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2Nsay9tZWRpYXRlay9yZXNldC5jIGIvZHJpdmVycy9jbGsvbWVkaWF0ZWsvcmVzZXQu
YwppbmRleCA5ZjNjYjIyYWVhMWIuLjUxOTFiZWNiNDVkZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9j
bGsvbWVkaWF0ZWsvcmVzZXQuYworKysgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9yZXNldC5jCkBA
IC0xOCw3ICsxOCw3IEBAIHN0YXRpYyBpbnQgbXRrX3Jlc2V0X2Fzc2VydF9zZXRfY2xyKHN0cnVj
dCByZXNldF9jb250cm9sbGVyX2RldiAqcmNkZXYsCiAJc3RydWN0IG10a19yZXNldCAqZGF0YSA9
IGNvbnRhaW5lcl9vZihyY2Rldiwgc3RydWN0IG10a19yZXNldCwgcmNkZXYpOwogCXVuc2lnbmVk
IGludCByZWcgPSBkYXRhLT5yZWdvZnMgKyAoKGlkIC8gMzIpIDw8IDQpOwogCi0JcmV0dXJuIHJl
Z21hcF93cml0ZShkYXRhLT5yZWdtYXAsIHJlZywgMSk7CisJcmV0dXJuIHJlZ21hcF93cml0ZShk
YXRhLT5yZWdtYXAsIHJlZywgQklUKGlkICUgMzIpKTsKIH0KIAogc3RhdGljIGludCBtdGtfcmVz
ZXRfZGVhc3NlcnRfc2V0X2NscihzdHJ1Y3QgcmVzZXRfY29udHJvbGxlcl9kZXYgKnJjZGV2LApA
QCAtMjcsNyArMjcsNyBAQCBzdGF0aWMgaW50IG10a19yZXNldF9kZWFzc2VydF9zZXRfY2xyKHN0
cnVjdCByZXNldF9jb250cm9sbGVyX2RldiAqcmNkZXYsCiAJc3RydWN0IG10a19yZXNldCAqZGF0
YSA9IGNvbnRhaW5lcl9vZihyY2Rldiwgc3RydWN0IG10a19yZXNldCwgcmNkZXYpOwogCXVuc2ln
bmVkIGludCByZWcgPSBkYXRhLT5yZWdvZnMgKyAoKGlkIC8gMzIpIDw8IDQpICsgMHg0OwogCi0J
cmV0dXJuIHJlZ21hcF93cml0ZShkYXRhLT5yZWdtYXAsIHJlZywgMSk7CisJcmV0dXJuIHJlZ21h
cF93cml0ZShkYXRhLT5yZWdtYXAsIHJlZywgQklUKGlkICUgMzIpKTsKIH0KIAogc3RhdGljIGlu
dCBtdGtfcmVzZXRfYXNzZXJ0KHN0cnVjdCByZXNldF9jb250cm9sbGVyX2RldiAqcmNkZXYsCi0t
IAoyLjE4LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
