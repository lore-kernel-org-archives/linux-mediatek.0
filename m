Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932E3C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 06:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hw4udtRvRfyi1n6s1bHvJ0DeF4g9aGv3aoZ0Tl3GcMY=; b=PY4ZL5xrnOsgO4
	wTzMeInswDLmZTIO++4HaN1wDruxO3I6wmtlGpUMV1v6jVirxHrHDG4s9PZRfqE1WQcfjrjBxPjFu
	nqlwZbJqxZySQGcoZPYioH4l2HOOJp3fgKSBLj/xTyZo0DZyLD5RfG6VCUugTNdaF5jMJi4OVSBaf
	4xcmAFYB4l2SD3RN4FTKeDStQpuikF4seBECNxsS4631UOBTDOJv52KIVA2sjgsiWXAIUGogNzKvH
	zEURNOE53iQp3ltc3nuZ5EC6pt5FhLmW7ubb+gFcZ6vsNync/FoB1SyFnjifc1yMtnwWJwD5g2lLo
	XGS6LED2o3gDyyBsZf1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nchsQ-00FFQb-If; Fri, 08 Apr 2022 06:13:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nchsO-00FFP9-DK; Fri, 08 Apr 2022 06:13:45 +0000
X-UUID: b3021a5428124e1192083ec2faaef5c9-20220407
X-UUID: b3021a5428124e1192083ec2faaef5c9-20220407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1557271444; Thu, 07 Apr 2022 23:13:36 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 23:05:57 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 Apr 2022 14:05:55 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Apr 2022 14:05:54 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <nfraprado@collabora.com>,
 <tzungbi@google.com>
CC: <angelogioacchino.delregno@collabora.com>, <aaronyu@google.com>,
 <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>, <linmq006@gmail.com>,
 <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jiaxin Yu
 <jiaxin.yu@mediatek.com>, Rob Herring <robh@kernel.org>
Subject: [v10 1/4] ASoC: dt-bindings: mt8192-mt6359: add new compatible and
 new properties
Date: Fri, 8 Apr 2022 14:05:49 +0800
Message-ID: <20220408060552.26607-2-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408060552.26607-1-jiaxin.yu@mediatek.com>
References: <20220408060552.26607-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_231344_505063_5B25A74B 
X-CRM114-Status: UNSURE (   7.68  )
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

MS4gQWRkcyBuZXcgY29tcGF0aWJsZSBzdHJpbmcgIm10ODE5Ml9tdDYzNTlfcnQxMDE1cF9ydDU2
ODJzIiBmb3IgbWFjaGluZXMKd2l0aCBydDEwMTVwIGFuZCBydDU2ODJzLgoyLiBBZGRzIG5ldyBw
cm9wZXJ0eSAiaGVhZHNldC1jb2RlYyIgZm9yIGdldHRpbmcgaGVhZHNldCBjb2RlYy4KMy4gQWRk
cyBuZXcgcHJvcGVydHkgInNwZWFrZXItY29kZWNzIiBmb3IgZ2V0dGluZyBzcGVha2VyIGNvZGVj
cy4KClNpZ25lZC1vZmYtYnk6IEppYXhpbiBZdSA8amlheGluLnl1QG1lZGlhdGVrLmNvbT4KUmV2
aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+ClJldmlld2VkLWJ5OiBOw61j
b2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+ClRlc3RlZC1ieTog
TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgotLS0KIC4u
Li9zb3VuZC9tdDgxOTItbXQ2MzU5LXJ0MTAxNS1ydDU2ODIueWFtbCAgICB8IDMyICsrKysrKysr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210ODE5Mi1tdDYzNTkt
cnQxMDE1LXJ0NTY4Mi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nv
dW5kL210ODE5Mi1tdDYzNTktcnQxMDE1LXJ0NTY4Mi55YW1sCmluZGV4IDVhNWI3NjViODU5YS4u
NGZhMTc5OTA5YzYyIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc291bmQvbXQ4MTkyLW10NjM1OS1ydDEwMTUtcnQ1NjgyLnlhbWwKKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210ODE5Mi1tdDYzNTktcnQxMDE1LXJ0NTY4
Mi55YW1sCkBAIC0xOCw2ICsxOCw3IEBAIHByb3BlcnRpZXM6CiAgICAgZW51bToKICAgICAgIC0g
bWVkaWF0ZWssbXQ4MTkyX210NjM1OV9ydDEwMTVfcnQ1NjgyCiAgICAgICAtIG1lZGlhdGVrLG10
ODE5Ml9tdDYzNTlfcnQxMDE1cF9ydDU2ODIKKyAgICAgIC0gbWVkaWF0ZWssbXQ4MTkyX210NjM1
OV9ydDEwMTVwX3J0NTY4MnMKIAogICBtZWRpYXRlayxwbGF0Zm9ybToKICAgICAkcmVmOiAiL3Nj
aGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZSIKQEAgLTI3LDExICsyOCwzMyBA
QCBwcm9wZXJ0aWVzOgogICAgICRyZWY6ICIvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9u
cy9waGFuZGxlIgogICAgIGRlc2NyaXB0aW9uOiBUaGUgcGhhbmRsZSBvZiBIRE1JIGNvZGVjLgog
CisgIGhlYWRzZXQtY29kZWM6CisgICAgdHlwZTogb2JqZWN0CisgICAgcHJvcGVydGllczoKKyAg
ICAgIHNvdW5kLWRhaToKKyAgICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5p
dGlvbnMvcGhhbmRsZQorICAgIHJlcXVpcmVkOgorICAgICAgLSBzb3VuZC1kYWkKKworICBzcGVh
a2VyLWNvZGVjczoKKyAgICB0eXBlOiBvYmplY3QKKyAgICBwcm9wZXJ0aWVzOgorICAgICAgc291
bmQtZGFpOgorICAgICAgICBtaW5JdGVtczogMQorICAgICAgICBtYXhJdGVtczogMgorICAgICAg
ICBpdGVtczoKKyAgICAgICAgICBtYXhJdGVtczogMQorICAgICAgICAkcmVmOiAvc2NoZW1hcy90
eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlLWFycmF5CisgICAgcmVxdWlyZWQ6CisgICAg
ICAtIHNvdW5kLWRhaQorCiBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKIAogcmVxdWlyZWQ6
CiAgIC0gY29tcGF0aWJsZQogICAtIG1lZGlhdGVrLHBsYXRmb3JtCisgIC0gaGVhZHNldC1jb2Rl
YworICAtIHNwZWFrZXItY29kZWNzCiAKIGV4YW1wbGVzOgogICAtIHwKQEAgLTQ0LDYgKzY3LDE1
IEBAIGV4YW1wbGVzOgogICAgICAgICAgICAgICAgICAgICAgICAgImF1ZF9jbGtfbW9zaV9vbiI7
CiAgICAgICAgIHBpbmN0cmwtMCA9IDwmYXVkX2Nsa19tb3NpX29mZj47CiAgICAgICAgIHBpbmN0
cmwtMSA9IDwmYXVkX2Nsa19tb3NpX29uPjsKKworICAgICAgICBoZWFkc2V0LWNvZGVjIHsKKyAg
ICAgICAgICAgIHNvdW5kLWRhaSA9IDwmcnQ1NjgyPjsKKyAgICAgICAgfTsKKworICAgICAgICBz
cGVha2VyLWNvZGVjcyB7CisgICAgICAgICAgICBzb3VuZC1kYWkgPSA8JnJ0MTAxNV9sPiwKKyAg
ICAgICAgICAgICAgICAgICAgICAgIDwmcnQxMDE1X3I+OworICAgICAgICB9OwogICAgIH07CiAK
IC4uLgotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
