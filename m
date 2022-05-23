Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70142C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 10:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zca9knGTWDIrtCyWu+gjHza/O6s8RQQk/DGBe+ULzlU=; b=2lsvvrCENGWO5T
	J815UqNDXG1yYR+cfyamjP/5eQA0zUSJkUF96AtBr50U5JXUSEKXCVYmTMWwH1j5DFt1onDIQuNKy
	LH80SquANJOOFBoEoBJLnj6h4sUy+0Hj1drrZUTi2CmuLHOj8WGo7wgO1bY1WebWRk2fbxD8Ympia
	DjA6prAVkatvkddam6UOxsxgPXBhSczYhZN2hHWeXItxdpXCxTgnUkoNRzIApnmH8hB48qJWjmunX
	O1oLzT/cY0cnxabfOt6ReSMTfE+ntJ2g3CmNAU9Y70sF6bAdnTDPg37oEM7apW5c0hZM/GcHKtt/R
	J4ekPiN1jJyfGzHS4uDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt5bG-003OH5-8U; Mon, 23 May 2022 10:47:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt4VR-002typ-Kr; Mon, 23 May 2022 09:37:43 +0000
X-UUID: 4799779ab7f94ba1a5853f822ca9b43d-20220523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:0da5895b-b7cc-430d-be24-2b3f1b178802, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:5d2638e3-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 4799779ab7f94ba1a5853f822ca9b43d-20220523
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1227266277; Mon, 23 May 2022 02:37:36 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 02:33:51 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 17:33:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 23 May 2022 17:33:49 +0800
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
Subject: [RESEND v8 12/19] dt-bindings: arm: mediatek: Add #reset-cells
 property for MT8192/MT8195
Date: Mon, 23 May 2022 17:33:39 +0800
Message-ID: <20220523093346.28493-13-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220523093346.28493-1-rex-bc.chen@mediatek.com>
References: <20220523093346.28493-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_023741_756046_633B2FDE 
X-CRM114-Status: UNSURE (   9.53  )
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

V2Ugd2lsbCB1c2UgdGhlIGluZnJhX2FvIHJlc2V0IHdoaWNoIGlzIGRlZmluZWQgaW4gbXQ4MTky
LXN5cy1jbG9jawphbmQgbXQ4MTk1LXN5cy1jbG9jay4KVGhlIHZhbHVlIG9mIHJlc2V0LWNlbGxz
IGlzIDEuCgpTaWduZWQtb2ZmLWJ5OiBSZXgtQkMgQ2hlbiA8cmV4LWJjLmNoZW5AbWVkaWF0ZWsu
Y29tPgpBY2tlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBs
aW5hcm8ub3JnPgpSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vs
b2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KUmV2aWV3ZWQtYnk6IE7DrWNvbGFz
IEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KVGVzdGVkLWJ5OiBOw61j
b2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+Ci0tLQogLi4uL2Jp
bmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxtdDgxOTItc3lzLWNsb2NrLnlhbWwgICAgICAg
fCAzICsrKwogLi4uL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxtdDgxOTUtc3lzLWNs
b2NrLnlhbWwgICAgICAgfCAzICsrKwogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlh
dGVrL21lZGlhdGVrLG10ODE5Mi1zeXMtY2xvY2sueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssbXQ4MTkyLXN5cy1jbG9jay55YW1s
CmluZGV4IDU3MDViY2YxZmU0Ny4uMjdmNzkxNzVjNjc4IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLG10ODE5Mi1zeXMt
Y2xvY2sueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21l
ZGlhdGVrL21lZGlhdGVrLG10ODE5Mi1zeXMtY2xvY2sueWFtbApAQCAtMjksNiArMjksOSBAQCBw
cm9wZXJ0aWVzOgogICAnI2Nsb2NrLWNlbGxzJzoKICAgICBjb25zdDogMQogCisgICcjcmVzZXQt
Y2VsbHMnOgorICAgIGNvbnN0OiAxCisKIHJlcXVpcmVkOgogICAtIGNvbXBhdGlibGUKICAgLSBy
ZWcKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVk
aWF0ZWsvbWVkaWF0ZWssbXQ4MTk1LXN5cy1jbG9jay55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxtdDgxOTUtc3lzLWNsb2NrLnlh
bWwKaW5kZXggNTdhMTUwM2Q5NWZlLi45NWI2YmRmOTk5MzYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssbXQ4MTk1LXN5
cy1jbG9jay55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0v
bWVkaWF0ZWsvbWVkaWF0ZWssbXQ4MTk1LXN5cy1jbG9jay55YW1sCkBAIC0zNyw2ICszNyw5IEBA
IHByb3BlcnRpZXM6CiAgICcjY2xvY2stY2VsbHMnOgogICAgIGNvbnN0OiAxCiAKKyAgJyNyZXNl
dC1jZWxscyc6CisgICAgY29uc3Q6IDEKKwogcmVxdWlyZWQ6CiAgIC0gY29tcGF0aWJsZQogICAt
IHJlZwotLSAKMi4xOC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
