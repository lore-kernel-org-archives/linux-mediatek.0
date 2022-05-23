Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFECC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 11:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WsNs5+omJxfK/26JLuJFKubjWuuH3FkXLCm6sAPUR9M=; b=qryfkVUZxZ0k/m
	RObGaxaC7vO3onUGCX7DH68kI7ylMLnMYwg7ZLVjLMalED/WEsPOoNCivRKr4Ud5xrsUq7QnEwxOK
	CeFrNAuBy9q6ThoumZBwDpEMuQ6HO5q0XHTD8dM/K/uKvyggFGgr2xW9foW2furS+OlYzUdOBuCAD
	pTse6JNcsh4KDnSOhEso1Fot4ZKsUzteEfQF+t2gorKd71vF2BJlm+r0lTEZa48YFLFLCGpqBgH1K
	rE4FuxvFMHc803oTPpEq/XpwYxeBcI1XLjSw5Y7zz1PET8T/Yo6Jur73u4qN9VbiN5+rY6Lgxk0CC
	OoQvnXeUSclTAHbVCkGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt5o1-003Unc-BY; Mon, 23 May 2022 11:00:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt4ba-002wVu-PM; Mon, 23 May 2022 09:44:08 +0000
X-UUID: 849d121017c94b42975c05e7c31514be-20220523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:31c784cd-ba69-4a30-8ce0-b604775dff0f, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:dd6738e3-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 849d121017c94b42975c05e7c31514be-20220523
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2119560467; Mon, 23 May 2022 02:43:55 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 02:33:54 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 17:33:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 23 May 2022 17:33:50 +0800
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
Subject: [RESEND v8 17/19] dt-bindings: reset: mediatek: Add infra_ao reset
 index for MT8186
Date: Mon, 23 May 2022 17:33:44 +0800
Message-ID: <20220523093346.28493-18-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220523093346.28493-1-rex-bc.chen@mediatek.com>
References: <20220523093346.28493-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_024402_898440_FFD149CB 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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

VG8gc3VwcG9ydCByZXNldCBvZiBpbmZyYV9hbywgYWRkIHRoZSBpbmRleCBvZiBpbmZyYV9hbyBy
ZXNldCBvZgp0aGVybWFsL3N2cyBmb3IgTVQ4MTg2LgoKU2lnbmVkLW9mZi1ieTogUmV4LUJDIENo
ZW4gPHJleC1iYy5jaGVuQG1lZGlhdGVrLmNvbT4KQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+ClJldmlld2VkLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXBy
YWRvQGNvbGxhYm9yYS5jb20+ClJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdu
byA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgotLS0KIGluY2x1ZGUv
ZHQtYmluZGluZ3MvcmVzZXQvbXQ4MTg2LXJlc2V0cy5oIHwgNSArKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVz
ZXQvbXQ4MTg2LXJlc2V0cy5oIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9tdDgxODYtcmVz
ZXRzLmgKaW5kZXggNWY4NTAzNzBjNDJjLi4yZTkwMjljMjJmMzggMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvZHQtYmluZGluZ3MvcmVzZXQvbXQ4MTg2LXJlc2V0cy5oCisrKyBiL2luY2x1ZGUvZHQtYmlu
ZGluZ3MvcmVzZXQvbXQ4MTg2LXJlc2V0cy5oCkBAIC03LDYgKzcsNyBAQAogI2lmbmRlZiBfRFRf
QklORElOR1NfUkVTRVRfQ09OVFJPTExFUl9NVDgxODYKICNkZWZpbmUgX0RUX0JJTkRJTkdTX1JF
U0VUX0NPTlRST0xMRVJfTVQ4MTg2CiAKKy8qIFRPUFJHVSByZXNldHMgKi8KICNkZWZpbmUgTVQ4
MTg2X1RPUFJHVV9JTkZSQV9TV19SU1QJCQkJMAogI2RlZmluZSBNVDgxODZfVE9QUkdVX01NX1NX
X1JTVAkJCQkJMQogI2RlZmluZSBNVDgxODZfVE9QUkdVX01GR19TV19SU1QJCQkJMgpAQCAtMzMs
NCArMzQsOCBAQAogLyogTU1TWVMgcmVzZXRzICovCiAjZGVmaW5lIE1UODE4Nl9NTVNZU19TVzBf
UlNUX0JfRElTUF9EU0kwCQkJMTkKIAorLyogSU5GUkEgcmVzZXRzICovCisjZGVmaW5lIE1UODE4
Nl9JTkZSQV9USEVSTUFMX0NUUkxfUlNUCQkJMAorI2RlZmluZSBNVDgxODZfSU5GUkFfUFRQX0NU
UkxfUlNUCQkJCTEKKwogI2VuZGlmICAvKiBfRFRfQklORElOR1NfUkVTRVRfQ09OVFJPTExFUl9N
VDgxODYgKi8KLS0gCjIuMTguMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
