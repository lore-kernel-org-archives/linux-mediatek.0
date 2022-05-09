Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E411C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 18:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rf67Yfr1x6mWsSAa6LNf+9mMIYlcQ2CF71jdre/V5dE=; b=40a45VD465PA2F
	N+Zpo/SDmfSqJ/YmWU/tms5G/I1kfd2rKL8aVomNiKHXLlOwUKVOrfu27rvytPqVD3ajzPnQb6ptx
	or8UV+t190H6t1kT5Hxe4IFEQv3BAXND6L3Lh8IPqjH4qCFIstfk/YJT1YL/3fIkigtVvXiHSZUso
	+3a6u8XiYWJK8UPnRlyU5UFZKReAeJtTcc3zRu7D3rdHaeaE/raMg5d7LO04t372YRG8YF69edcVV
	WkbliU4Bk9k8raYUZn5a05/6g+bIJTA7HrOOVqHvMlisT8gseMrJ38WpNPeHiXObKYiteEfvKLnws
	UApGWH+r84ALB7ZsPsOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no8Yl-00Fvw8-7U; Mon, 09 May 2022 18:56:43 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no8Ya-00Fvth-AB; Mon, 09 May 2022 18:56:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id B58901F44049
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652122590;
 bh=ZLYs6CI7s8Jj8EeHsrXSw3oRF8/mCUSKeayVDMKYyPg=;
 h=From:To:Cc:Subject:Date:From;
 b=HJiXLwHH5YEw2s3HHpeH4aPABH0EI2Upl5k26VzT/j4d5Pyx5F75JtEBDK4qU/Wwi
 UuMqI0weAy9luNMb7N1ZL3BxlwAYAJ7xwABSgHk/GIJ9aChTjiZqZP3z/+YJQYCW2K
 +vsBYYr1BxTJ8qu2KhjAOfsOHl3OUck2aUdZsLa8wDs2CFTfolSH6SctvjcXGnQNF3
 q3thmdZaq9qwWlbqPoH/yyHmJo+PwRfEzUpVpajC8CPKP4EjAkabUMIrX3K4V4yGym
 Dk2Guf3NbgXDSmrbsd79FcJLM3rU7hMUZNxVPRRGmfgCpvQZFuapCqYoFeeaAlWNRZ
 Hia2Y5fzdMpSQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Shane Chien <shane.chien@mediatek.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH] Revert "ASoC: dt-bindings: mediatek: mt8192: Add i2s-share
 properties"
Date: Mon,  9 May 2022 14:56:25 -0400
Message-Id: <20220509185625.580811-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_115632_519722_D08B3A43 
X-CRM114-Status: UNSURE (   9.21  )
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

VGhpcyByZXZlcnRzIGNvbW1pdCBlMDU2Y2Y0MzQxYWUzZjg1NmYxZTM4ZGEwMmIyN2NiMDRkZTRj
NjliLiBUaGUgY29tbWl0CndhcyBtZXJnZWQgd2hpbGUgdGhlIHByb3BlcnR5IG5hbWUgYW5kIGRl
ZmluaXRpb24gd2VyZSBzdGlsbCBiZWluZwpkaXNjdXNzZWQuIFJldmVydCB0aGUgY29tbWl0IGZv
ciBub3cgYW5kIGEgZm9sbG93IHVwIGNvbW1pdCB3aWxsIHJlLWFkZAp0aGUgcHJvcGVydHkgYWZ0
ZXIgaXQgaXMgZnVydGhlciBkaXNjdXNzZWQgYW5kIHJldmlld2VkLgoKU2lnbmVkLW9mZi1ieTog
TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgoKLS0tCgog
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210ODE5Mi1hZmUtcGNtLnlh
bWwgfCA1IC0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ4MTkyLWFmZS1wY20u
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9tdDgxOTItYWZl
LXBjbS55YW1sCmluZGV4IDViMDNjOGRiZjMxOC4uN2EyNWJjOWI4MDYwIDEwMDY0NAotLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ4MTkyLWFmZS1wY20ueWFt
bAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ4MTkyLWFm
ZS1wY20ueWFtbApAQCAtNTQsMTEgKzU0LDYgQEAgcHJvcGVydGllczoKICAgICAgIC0gY29uc3Q6
IGF1ZF9pbmZyYV9jbGsKICAgICAgIC0gY29uc3Q6IGF1ZF9pbmZyYV8yNm1fY2xrCiAKLXBhdHRl
cm5Qcm9wZXJ0aWVzOgotICAiXmkyc1swLTM1LTldLXNoYXJlJCI6Ci0gICAgZGVzY3JpcHRpb246
IE5hbWUgb2YgdGhlIEkyUyBidXMgdGhhdCBpcyBzaGFyZWQgd2l0aCB0aGlzIGJ1cwotICAgIHBh
dHRlcm46ICJeSTJTWzAtMzUtOV0kIgotCiByZXF1aXJlZDoKICAgLSBjb21wYXRpYmxlCiAgIC0g
aW50ZXJydXB0cwotLSAKMi4zNi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
