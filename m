Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375CAC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 14:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JsDR20nfhNVXoZN5m2ZjbwjkOvTTzzacIYJzcmj6ODk=; b=lmi1kpPgcypGD1
	dIJcm9icuArNnNdpNrkkz0yIpAZUdnyhY0HMd/QL7tzEyfnlNz9UCn4eS3LxpOWHMxve3n6DpS0r+
	wD7zex3AthLdD8nVerLOQGf4tCLTK5F6xrwSgDPKlk0QN/I7dve/L9SaFgdVOWXtaZAivGKEV6G7L
	7OvT1iQGi6DzUZbnhU2c0X9qHW+8cHMwzKNbmubShrZu6bNeLjuSYQtSNai1yRfoePwXRqAh6lwbw
	2cCm1JR6JeRuwoCLHCgdyKuWuu2mFRyI8Dep06ugZX3oKUmvbDpU4C1QOCPIqf6XsZmtlDkrSqH8I
	soSIUADl2jKL9awBZl6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJc3Z-00FbZe-Ew; Mon, 14 Feb 2022 14:10:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJc3W-00FbX7-70; Mon, 14 Feb 2022 14:10:20 +0000
X-UUID: b9b06c046ccd49d18626a1a516383ab3-20220214
X-UUID: b9b06c046ccd49d18626a1a516383ab3-20220214
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1384709419; Mon, 14 Feb 2022 07:10:12 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 06:01:25 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 14 Feb 2022 22:01:23 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 14 Feb 2022 22:01:22 +0800
From: <xinlei.lee@mediatek.com>
To: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
 <lee.jones@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, xinlei lee
 <xinlei.lee@mediatek.com>
Subject: [1/1] dt-bindings: pwm:Convert pwm-mtk-disp.txt format file to
 pwm-mtk-disp.yaml format file
Date: Mon, 14 Feb 2022 22:01:16 +0800
Message-ID: <1644847276-27622-2-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1644847276-27622-1-git-send-email-xinlei.lee@mediatek.com>
References: <1644847276-27622-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_061018_267884_18D7861A 
X-CRM114-Status: GOOD (  10.57  )
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

RnJvbTogeGlubGVpIGxlZSA8eGlubGVpLmxlZUBtZWRpYXRlay5jb20+CgpTaWduZWQtb2ZmLWJ5
OiB4aW5sZWkgbGVlIDx4aW5sZWkubGVlQG1lZGlhdGVrLmNvbT4KLS0tCiAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9wd20vcHdtLW10ay1kaXNwLnlhbWwgICAgICB8IDYwICsrKysrKysrKysrKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2MCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9wd20tbXRrLWRpc3Au
eWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20v
cHdtLW10ay1kaXNwLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdt
L3B3bS1tdGstZGlzcC55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjJm
MTE4M2UKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcHdtL3B3bS1tdGstZGlzcC55YW1sCkBAIC0wLDAgKzEsNjAgQEAKKyMgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQorJVlBTUwgMS4yCist
LS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcHdtL3B3bS1tdGstZGlzcC55
YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlh
bWwjCisKK3RpdGxlOiBtZWRpYXRlayBQV00gQ29udHJvbGxlciBEZXZpY2UgVHJlZSBCaW5kaW5n
cworCittYWludGFpbmVyczoKKyAgLSBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21h
aWwuY29tPgorICAtIFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9u
aXguZGU+CisgIC0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KKyAgLSBSb2IgSGVy
cmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPgorCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgor
ICAgIGVudW06CisgICAgICAtIG1lZGlhdGVrLG10MjcwMS1kaXNwLXB3bQorICAgICAgLSBtZWRp
YXRlayxtdDY1OTUtZGlzcC1wd20KKyAgICAgIC0gbWVkaWF0ZWssbXQ4MTczLWRpc3AtcHdtCisg
ICAgICAtIG1lZGlhdGVrLG10ODE4My1kaXNwLXB3bQorICAgICAgLSBtZWRpYXRlayxtdDgxODYt
ZGlzcC1wd20KKworICByZWc6CisgICAgbWF4SXRlbXM6IDEKKworICBpbnRlcnJ1cHRzOgorICAg
IG1heEl0ZW1zOiAxCisKKyAgY2xvY2tzOgorICAgIGl0ZW1zOgorICAgICAgLSBkZXNjcmlwdGlv
bjogTWFpbiBDbG9jaworICAgICAgLSBkZXNjcmlwdGlvbjogTW0gQ2xvY2sKKworICBjbG9jay1u
YW1lczoKKyAgICBpdGVtczoKKyAgICAgIC0gY29uc3Q6IG1haW4KKyAgICAgIC0gY29uc3Q6IG1t
CityZXF1aXJlZDoKKyAgLSByZWcKKyAgLSBpbnRlcnJ1cHRzCisgIC0gY2xvY2tzCisgIC0gY2xv
Y2stbmFtZXMKKworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAt
IHwKKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdp
Yy5oPgorICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9tdDgxODYtY2xrLmg+CisgICAg
I2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPgorICAgIGRp
c3BfcHdtOiBkaXNwX3B3bTBAMTEwMGUwMDAgeworICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlh
dGVrLG10ODE4My1kaXNwLXB3bSI7CisgICAgICAgIHJlZyA9IDwweDExMDBlMDAwIDB4MTAwMD47
CisgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAxNDMgSVJRX1RZUEVfTEVWRUxfSElHSD47
CisgICAgICAgIGNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9ESVNQX1BXTT4sCisgICAgICAg
ICAgICAgICAgIDwmaW5mcmFjZmdfYW8gQ0xLX0lORlJBX0FPX0RJU1BfUFdNPjsKKyAgICAgICAg
Y2xvY2stbmFtZXMgPSAibWFpbiIsICJtbSI7CisgICAgICAgIHN0YXR1cyA9ICJva2F5IjsKKyAg
ICB9OwpcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKLS0gCjIuNi40CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
