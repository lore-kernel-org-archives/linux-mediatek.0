Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13990C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 10:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tt7Fxurc6pg47P8pPoNvMp2AqsjFO+QYEmqC73LsLOg=; b=LfxaRLP/H1Xl9B
	KEuUx7f/wP5X+hp/TQOagV4TBGMO7odzZcveK+/AwjOOG76hKJd+dLXJLuC65kotqI4trUEJq4ovG
	h7kxvHXZosDj9OYsLkfze1Iu0/rXoP9jAUCbmo1A96pcKKrgnlt4f6j0BuIz9w2j7eNgSmyTx+c4T
	hdTFbz6MosguNm7weOCyW1d48+uxHZTlMdSu8b4kf6zgW6CpTF/xVIO13Nc8UiX3Xq3gZI30G+803
	H/h3ueo0sFr1/VX11AxvO0Q5QdubhL6o4Nv1xF46wgBxlgDFWZRMxwWXcAlarvsMwUsSJpLROlJwG
	BdKunaUt4tTP9Me1BBjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt5iY-003RvH-5f; Mon, 23 May 2022 10:55:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt4bX-002wTe-0q; Mon, 23 May 2022 09:44:05 +0000
X-UUID: 9d7e530cfc1e45dab91b2d39edfc8165-20220523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:1f0a3b7e-0947-447a-a151-487c9486a3e8, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:3f6738e3-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:1,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 9d7e530cfc1e45dab91b2d39edfc8165-20220523
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 440772454; Mon, 23 May 2022 02:43:52 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 02:33:52 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 23 May 2022 17:33:50 +0800
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
Subject: [RESEND v8 16/19] arm64: dts: mediatek: Add infra #reset-cells
 property for MT8195
Date: Mon, 23 May 2022 17:33:43 +0800
Message-ID: <20220523093346.28493-17-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220523093346.28493-1-rex-bc.chen@mediatek.com>
References: <20220523093346.28493-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_024359_156883_7106C312 
X-CRM114-Status: GOOD (  10.32  )
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

V2Ugd2lsbCB1c2UgbWVkaWF0ZWsgY2xvY2sgcmVzZXQgYXMgaW5mcmFjZmdfYW8gcmVzZXQgaW5z
dGVhZCBvZgp0aS1zeXNjb24uIFRvIHN1cHBvcnQgdGhpcywgcmVtb3ZlIHByb3BlcnR5IG9mIHRp
IHJlc2V0IGFuZCBhZGQKcHJvcGVydHkgb2YgI3Jlc2V0LWNlbGxzIGZvciBtZWRpYXRlayBjbG9j
ayByZXNldC4KClNpZ25lZC1vZmYtYnk6IFJleC1CQyBDaGVuIDxyZXgtYmMuY2hlbkBtZWRpYXRl
ay5jb20+ClJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lv
YWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgpSZXZpZXdlZC1ieTogTsOtY29sYXMgRi4g
Ui4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgotLS0KIGFyY2gvYXJtNjQvYm9v
dC9kdHMvbWVkaWF0ZWsvbXQ4MTk1LmR0c2kgfCAxNSArKy0tLS0tLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTk1LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL21lZGlhdGVrL210ODE5NS5kdHNpCmluZGV4IGI1N2U2MjBjMmM3Mi4uZGIxNmViYTlkNDc1
IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5NS5kdHNpCisr
KyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTk1LmR0c2kKQEAgLTEwLDcgKzEw
LDYgQEAKICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9pcnEuaD4K
ICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9waHkvcGh5Lmg+CiAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
cGluY3RybC9tdDgxOTUtcGluZnVuYy5oPgotI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0L3Rp
LXN5c2Nvbi5oPgogCiAvIHsKIAljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5NSI7CkBAIC0y
OTIsMjAgKzI5MSwxMCBAQAogCQl9OwogCiAJCWluZnJhY2ZnX2FvOiBzeXNjb25AMTAwMDEwMDAg
ewotCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUtaW5mcmFjZmdfYW8iLCAic3lzY29u
IiwgInNpbXBsZS1tZmQiOworCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUtaW5mcmFj
ZmdfYW8iLCAic3lzY29uIjsKIAkJCXJlZyA9IDwwIDB4MTAwMDEwMDAgMCAweDEwMDA+OwogCQkJ
I2Nsb2NrLWNlbGxzID0gPDE+OwotCi0JCQlpbmZyYWNmZ19yc3Q6IHJlc2V0LWNvbnRyb2xsZXIg
ewotCQkJCWNvbXBhdGlibGUgPSAidGksc3lzY29uLXJlc2V0IjsKLQkJCQkjcmVzZXQtY2VsbHMg
PSA8MT47Ci0JCQkJdGkscmVzZXQtYml0cyA9IDwKLQkJCQkJMHgxNDAgMTggMHgxNDQgMTggMCAw
IChBU1NFUlRfU0VUIHwgREVBU1NFUlRfU0VUIHwgU1RBVFVTX05PTkUpIC8qIHBjaWUgKi8KLQkJ
CQkJMHgxMjAgMCAgMHgxMjQgMCAgMCAwIChBU1NFUlRfU0VUIHwgREVBU1NFUlRfU0VUIHwgU1RB
VFVTX05PTkUpIC8qIHRoZXJtYWwgKi8KLQkJCQkJMHg3MzAgMTAgMHg3MzQgMTAgMCAwIChBU1NF
UlRfU0VUIHwgREVBU1NFUlRfU0VUIHwgU1RBVFVTX05PTkUpIC8qIHRoZXJtYWwgKi8KLQkJCQkJ
MHgxNTAgNSAgMHgxNTQgNSAgMCAwIChBU1NFUlRfU0VUIHwgREVBU1NFUlRfU0VUIHwgU1RBVFVT
X05PTkUpIC8qIHN2cyBncHUgKi8KLQkJCQk+OwotCQkJfTsKKwkJCSNyZXNldC1jZWxscyA9IDwx
PjsKIAkJfTsKIAogCQlwZXJpY2ZnOiBzeXNjb25AMTAwMDMwMDAgewotLSAKMi4xOC4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
