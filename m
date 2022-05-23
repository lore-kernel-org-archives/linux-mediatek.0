Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546F1C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 09:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zca9knGTWDIrtCyWu+gjHza/O6s8RQQk/DGBe+ULzlU=; b=Bfra8O6Xcgzik3
	RdcXk/K84s3XzW8/hwQJgttrV4XzGXxnMAA4xacZzNIaO8QTXGXRjEZGwZPIh9vLYFFSnA7UUZmqD
	tvRzYWdfQdyC9tYky86DlkSQ5YRU/Yf23P8ZmE6ocudp05t4aQhCgKJVcOlj+LuC7l4bXQPUKlooi
	Uw2N19xRPq6LcuHAdbUEWP0bUuz4z8vpcTvFwaOshd9AtZJ9UShpwTsJ7YgYDSkMoIYMAi5D1VOfO
	SlB9opL0+S0eIESd3uPKFi6NsFTulDrSTC384CMFABpgp12L/RHArdKSK9XvyXlSFHGak6SGTr50k
	zWTRf42zOqAAtMmwgjtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4P5-002rRn-4E; Mon, 23 May 2022 09:31:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2oh-002A7b-BZ; Mon, 23 May 2022 07:49:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=xcHrYZLXLPlRTq+0vnlhR2b9fxEyAoum33HaLYazOCw=; b=YajXRZDRE8bvZfaWdtjz9BkF6/
 48zLsti+/OQn6N/L0uRjnAwDLZ0YONydwN8eE5YMdWPCubh9ziQFTkJE3/E38SHnuE7S3Yj8bmMsI
 DUDAIZqhC0RuQlVkKpQaW4kNEEIlIsi2McHdMHA2ftEEYf/Of/O5RU9mYVSm1R0Wdn4C0OC9a2F1f
 iCin51lnXnT1yTzGMmNLcoK7JWAQZd+OJS/MQErUnXZEvHUmc8QPjgIYEeU5QKSbAxeFETayHmXI0
 0ffi+jzZeA3CYs8RJRxr0s7+n9gOD+BRP56WO4mo8niXXAtAovu596DSSGKXruAHxQ3zlxWBlMTRC
 vPeINmtA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt1C0-000snx-73; Mon, 23 May 2022 06:05:30 +0000
X-UUID: c4f9bbe7d34b4ed4855c88f19526191b-20220522
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:2f0c01be-0fdf-43ae-bd9a-3c2b4788707a, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:aca73e7a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: c4f9bbe7d34b4ed4855c88f19526191b-20220522
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1333652929; Sun, 22 May 2022 23:04:56 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 May 2022 23:01:00 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 23 May 2022 14:00:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 23 May 2022 14:00:59 +0800
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
Subject: [PATCH v8 12/19] dt-bindings: arm: mediatek: Add #reset-cells
 property for MT8192/MT8195
Date: Mon, 23 May 2022 14:00:49 +0800
Message-ID: <20220523060056.24396-13-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
References: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_070527_531354_49FE60CE 
X-CRM114-Status: UNSURE (   8.98  )
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
