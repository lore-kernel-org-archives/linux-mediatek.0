Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDE3C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 19:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3p7jA/74D2YL1p7eG8n/nX0R1eyFxE0zb6y5TsnvBTk=; b=vUELLZWIJeadqc
	Dync0pjpzQ/J8rEFezDxeeqWT/Q3c6wRcqfS8bhHRGFM4MOLopopWU/ZcrIL6lwYHalcOv+8PQCHV
	nQvAXS1iP+YXYGFa93BBJnSE5iWn9DfPwg45pcs2aiZQ9Uqb7BBqN3xOM52qtg7lgPFvRG6JEiMbt
	GpqFbdV5gBjYJnEpvRjNZyb/57pbr6CKd5L7OjZpFPMBgy+kIgNvBHyKzjptf+WmdaFr11hqgwAGP
	WhRs0Nc1aH+PuWt/CQ/+JHobtnWJWKhjdFFrLWwW6B6WamvA7gpJfT032f/1QyqsjLiDl0rI7iQ1t
	X/AF6iwZysUroYf9inMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmhT9-00HZWn-Uc; Thu, 05 May 2022 19:48:59 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmhQv-00HXqF-Ji; Thu, 05 May 2022 19:46:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 782D21F45CCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651780000;
 bh=4PBOh4M6bJ2M0kJAtlVqT+bTLE2+DOSd+p4NN3H8MQA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QKA+47hAV5ct/svISUIaYtGG5R/sdS7fMhJs89/a16lQCxjf4o4CjsvkqnJsXgiDz
 N1sey4E/PkrX2KyFuS6rkShD0Kvg+iNGap4LHhiWSAMQlUNrsLFnrKMkDjlYDZv5g0
 rYcJGUjOd3YvvKd/WDl9WTTki2G2q3DdWgOJasAtiRQGabVMDSAxvx4GQMnUTRkPHK
 riayXt8vZGtRcfIy4/akKmcd4FSVaYjDsY6RSr8+mdRkcJ3cukG+2saQFOKurxl2Uu
 9paXDzzT1t88+gVXu4HMr9Dzskn0I//D6F0mEmAP93j476tPJ0zOMLiu6Oa27+EcP9
 matsHtM8koagg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 09/16] arm64: dts: mediatek: asurada: Add Cr50 TPM
Date: Thu,  5 May 2022 15:45:43 -0400
Message-Id: <20220505194550.3094656-10-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220505194550.3094656-1-nfraprado@collabora.com>
References: <20220505194550.3094656-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_124641_865524_1CD60EF0 
X-CRM114-Status: GOOD (  10.53  )
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

VGhlIEFzdXJhZGEgcGxhdGZvcm0gaGFzIGEgR29vZ2xlIFNlY3VyaXR5IENoaXAgY29ubmVjdGVk
IHRvIHRoZSBTUEk1CmJ1cy4gSXQgcnVucyB0aGUgY3I1MCBmaXJtd2FyZSBhbmQgcHJvdmlkZXMg
VFBNIGZ1bmN0aW9uYWxpdHkuIEFkZApzdXBwb3J0IGZvciBpdC4KClNpZ25lZC1vZmYtYnk6IE7D
rWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KUmV2aWV3ZWQt
Ynk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25v
QGNvbGxhYm9yYS5jb20+Ci0tLQoKKG5vIGNoYW5nZXMgc2luY2UgdjEpCgogLi4uL2FybTY0L2Jv
b3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kgfCAxNyArKysrKysrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kKaW5kZXggYTFjYmY3YTM3NWI2Li41
MjIxZjFkMWI3ZGMgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4
MTkyLWFzdXJhZGEuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5
Mi1hc3VyYWRhLmR0c2kKQEAgLTUsNiArNSw3IEBACiAgKi8KIC9kdHMtdjEvOwogI2luY2x1ZGUg
Im10ODE5Mi5kdHNpIgorI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oPgogCiAvIHsK
IAlhbGlhc2VzIHsKQEAgLTM1Myw2ICszNTQsMTMgQEAgJnBpbyB7CiAJCQkgICJBVURfREFUX01J
U08wIiwKIAkJCSAgIkFVRF9EQVRfTUlTTzEiOwogCisJY3I1MF9pbnQ6IGNyNTAtaXJxLWRlZmF1
bHQtcGlucyB7CisJCXBpbnMtZ3NjLWFwLWludC1vZGwgeworCQkJcGlubXV4ID0gPFBJTk1VWF9H
UElPMTcxX19GVU5DX0dQSU8xNzE+OworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCX07CisKIAlj
cm9zX2VjX2ludDogY3Jvcy1lYy1pcnEtZGVmYXVsdC1waW5zIHsKIAkJcGlucy1lYy1hcC1pbnQt
b2RsIHsKIAkJCXBpbm11eCA9IDxQSU5NVVhfR1BJTzVfX0ZVTkNfR1BJTzU+OwpAQCAtNTE3LDYg
KzUyNSwxNSBAQCAmc3BpNSB7CiAJbWVkaWF0ZWsscGFkLXNlbGVjdCA9IDwwPjsKIAlwaW5jdHJs
LW5hbWVzID0gImRlZmF1bHQiOwogCXBpbmN0cmwtMCA9IDwmc3BpNV9waW5zPjsKKworCWNyNTBA
MCB7CisJCWNvbXBhdGlibGUgPSAiZ29vZ2xlLGNyNTAiOworCQlyZWcgPSA8MD47CisJCWludGVy
cnVwdHMtZXh0ZW5kZWQgPSA8JnBpbyAxNzEgSVJRX1RZUEVfRURHRV9SSVNJTkc+OworCQlzcGkt
bWF4LWZyZXF1ZW5jeSA9IDwxMDAwMDAwPjsKKwkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsK
KwkJcGluY3RybC0wID0gPCZjcjUwX2ludD47CisJfTsKIH07CiAKICZ1YXJ0MCB7Ci0tIAoyLjM2
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
