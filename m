Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42F9C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 10:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ykOVjkro7LJBDuj9uXF1xRxN9bdN0M+oO8xajFp40M=; b=VzooyTAyJ7TKZh
	38cIi5R9FDtOlglTknRUX7cp4eUXJrTrCBUP7Hyxvcb3kzsh5Gc3dkb2IgIz06aV2nr34IKMoUyTP
	ysEGeqKFoX50m4mNlQl8/B8273+UszZEluAGZDS2YpfZlx07d0f8xyFe13Zg5Y2mtfwrIpHvLtHpV
	q4YVGzXXScQ4eRi6y+oOfHGPkgXjc+JRr8mZ/WdjWqwZbGvo3c+01eIl24rvOXYQrJUbFUhIAPY9Y
	bsmA71SCABd1FTIHbhMN3t7BzVe5Djh8i7HS6R1NlSBEs23SVkZwdHXkPO3ARYk6TtkcCltEcHqvb
	IEyDef8tq5W2GRuMjOKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt59J-003Azr-80; Mon, 23 May 2022 10:18:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2oi-002AAA-Hl; Mon, 23 May 2022 07:49:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=7XyZw1uGJGQ6C96AepgVgYNCe0cqcvJrVvDbJTHfkss=; b=YHZydk4zQrzR0MpD6Jim3CLDLE
 qqvskaR6Nh9FeZYmpTOzz9qzGpiqt47q1junH+fgx24GXCQUMM4MZxZCjspjKv2RWCCOm1dNdMogN
 OLIG1Q9271DrJUmnHucq1aazE+ue9InSnHHF63ywaP+fRV+/VA7XW136e4V2OUUbYYMHK0Resebaj
 dmj2LaorOFirmMw0TpFyC2tTDIWRGcI/JcPZPUvIFU4Pa0Sb1V/BiuDLOt2T+SsMu2ujKkIDHD2oY
 pwEaf5KXBVyzmZLEH5bAo25C0GTzGaD4vxeWHRzqIO23sqfuQFuNoYCdUQAHFhx4A3DIWoYM89t/h
 QSGxRUKA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt1C0-000so0-73; Mon, 23 May 2022 06:05:30 +0000
X-UUID: fc798f53fc284a57882c2a456db26c8c-20220522
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:bf6afff7-f32f-41a2-9275-eaf03290dfe9, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:64ac2ee3-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: fc798f53fc284a57882c2a456db26c8c-20220522
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 630509275; Sun, 22 May 2022 23:04:56 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 May 2022 23:01:01 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 23 May 2022 14:01:00 +0800
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
Subject: [PATCH v8 18/19] dt-bindings: arm: mediatek: Add #reset-cells
 property for MT8186
Date: Mon, 23 May 2022 14:00:55 +0800
Message-ID: <20220523060056.24396-19-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
References: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_070527_543744_C60F928E 
X-CRM114-Status: UNSURE (   8.06  )
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

V2Ugd2lsbCB1c2UgdGhlIGluZnJhX2FvIHJlc2V0IHdoaWNoIGlzIGRlZmluZWQgaW4gbXQ4MTg2
LXN5cy1jbG9jay4KVGhlIHZhbHVlIG9mIHJlc2V0LWNlbGxzIGlzIDEuCgpTaWduZWQtb2ZmLWJ5
OiBSZXgtQkMgQ2hlbiA8cmV4LWJjLmNoZW5AbWVkaWF0ZWsuY29tPgpBY2tlZC1ieTogUm9iIEhl
cnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KUmV2aWV3ZWQtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFBy
YWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KVGVzdGVkLWJ5OiBOw61jb2xhcyBGLiBSLiBB
LiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+Ci0tLQogLi4uL2JpbmRpbmdzL2FybS9t
ZWRpYXRlay9tZWRpYXRlayxtdDgxODYtc3lzLWNsb2NrLnlhbWwgICAgICAgfCAzICsrKwogMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssbXQ4MTg2LXN5cy1jbG9j
ay55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9t
ZWRpYXRlayxtdDgxODYtc3lzLWNsb2NrLnlhbWwKaW5kZXggMDg4NmUyZTMzNWJiLi42NjEwNDdk
MjZlMTEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0v
bWVkaWF0ZWsvbWVkaWF0ZWssbXQ4MTg2LXN5cy1jbG9jay55YW1sCisrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssbXQ4MTg2LXN5cy1j
bG9jay55YW1sCkBAIC0zOSw2ICszOSw5IEBAIHByb3BlcnRpZXM6CiAgICcjY2xvY2stY2VsbHMn
OgogICAgIGNvbnN0OiAxCiAKKyAgJyNyZXNldC1jZWxscyc6CisgICAgY29uc3Q6IDEKKwogcmVx
dWlyZWQ6CiAgIC0gY29tcGF0aWJsZQogICAtIHJlZwotLSAKMi4xOC4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
