Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DDCC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 10:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qIsnnm4jDxJ4Qja73zuDIm93TMUXP+lBtQVRPdeHEGw=; b=ld97f3WT9ILZj3
	7LDbrfcOb9WW5SudDFTqubz4P3KB3F1JU02yEx/grzAlKYUblg4VruoRzwdt5Ak+lwW9Ffpa5toK+
	sSX/Ti2NkCszqI1NDi7SELA+mrIvICqipENF8MG+5WUMthzabdFpdE2ss3ZS2IFcPesdpOH6qiK8l
	XWS1D0gi0DKzNdwhkAsboovPgUtgP+wL+pfQmzmFt1WrLk2ugsXjN9HRHnxtEB47ZBlbOBnzdqxWZ
	IG2gFwVFSuT0r9nT+lB8gba5nal1j3rYYyFEtOA1TiHpzmouLK6apnkrX3uiCdx2cVDnv1qYfCIR6
	/GLE0KwljoMgkbPLBaOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4rZ-0033QV-E4; Mon, 23 May 2022 10:00:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2oW-002A7b-37; Mon, 23 May 2022 07:49:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=rJY2KR5gJ0zYhey8RrgSKvAC1RZ1AapmxpweKPaxBiQ=; b=C1XkMfMMajU9rgv1cTbpr1Wd5L
 ylhJgpIa3LsjX1s26Iy07jugCVBxvoZZE/udaEEkcCvcIVxczfuFr6ba9CkvUY/uWw3gv1jz2pHBo
 XidhdAne5MzQMUdjP89PCl9OP1Ug5gEJ8y/gTbLCVB2p0yuhLdMqtWmOwW7t9uj50z+qNwdB2xFft
 Y/iLUBlBRdzptFjWE6pgfmyF1ciK21FMYqRd/oistSo3ceTuh6DGvktPbZqmolyGMdi95C0Eoo8KU
 JmVlP3DtsL4s0gRUpc2fbu92GyMoqQsLjz7wqG1l6//HHrM/PfcDDEEQPSUHhHxtMTik0Zw6WSKs9
 MOuPWsDQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt1Hr-000t0A-4w; Mon, 23 May 2022 06:11:29 +0000
X-UUID: 2004ec2d280347f787bb6a65ab5fc2b3-20220522
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:e2963439-3538-42e7-bebf-56ff64e4a98b, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:acf93e7a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 2004ec2d280347f787bb6a65ab5fc2b3-20220522
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1992074369; Sun, 22 May 2022 23:10:52 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 May 2022 23:01:00 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 14:01:00 +0800
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
Subject: [PATCH v8 15/19] arm64: dts: mediatek: Add infra #reset-cells
 property for MT8192
Date: Mon, 23 May 2022 14:00:52 +0800
Message-ID: <20220523060056.24396-16-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
References: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_071127_860062_4E820C43 
X-CRM114-Status: UNSURE (   7.36  )
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

VG8gc3VwcG9ydCByZXNldCBvZiBpbmZyYSwgd2UgYWRkIHByb3BlcnR5IG9mICNyZXNldC1jZWxs
cy4KClNpZ25lZC1vZmYtYnk6IFJleC1CQyBDaGVuIDxyZXgtYmMuY2hlbkBtZWRpYXRlay5jb20+
ClJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGlu
by5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgpSZXZpZXdlZC1ieTogTsOtY29sYXMgRi4gUi4gQS4g
UHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgpUZXN0ZWQtYnk6IE7DrWNvbGFzIEYuIFIu
IEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KLS0tCiBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5k
dHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQppbmRleCA3MzNh
ZWMyZTdmNzcuLjEzYmE1ZmVlNGFmYSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9t
ZWRpYXRlay9tdDgxOTIuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210
ODE5Mi5kdHNpCkBAIC0yNzEsNiArMjcxLDcgQEAKIAkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWss
bXQ4MTkyLWluZnJhY2ZnIiwgInN5c2NvbiI7CiAJCQlyZWcgPSA8MCAweDEwMDAxMDAwIDAgMHgx
MDAwPjsKIAkJCSNjbG9jay1jZWxscyA9IDwxPjsKKwkJCSNyZXNldC1jZWxscyA9IDwxPjsKIAkJ
fTsKIAogCQlwZXJpY2ZnOiBzeXNjb25AMTAwMDMwMDAgewotLSAKMi4xOC4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFp
bGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
