Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED21FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 19:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vlxcWw1HWGnOUHR4CPl5MD8KoQDzpVIx5psNBc5PaS4=; b=j6/CeiYCsd2pqQ
	q/10v+7y/WgOlSyD9PjK6RnZdrFzbFHGJVJyEXYZGE14O6j/YQNr2H1nyJrPclYK0AU+mgTMOZPWJ
	LVsO68aNJaRLZaj17OmDcgVa8D9giEPEjD9Y3ij9/6NhPNFJiB6BcipxznF3d7ulAjlVpgaHqk1s+
	bdohO8SN75p+m3MLXEptfatSoViLYqAtQPmijh0XsnEEmBe/W7rCxwE9jZMgpqaJWVoGj1yZDP2Bz
	Po5Rr6XaA4J0hfnhsfj3Z9kcagzXzNS0CbR7Y4tImu2EdWj65XX8YL2Zk0FejdPARakjA6nKRXmLO
	hM213o9b1DLNSjgRDp3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmhSQ-00HZ0i-3d; Thu, 05 May 2022 19:48:14 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmhQo-00HXlr-QE; Thu, 05 May 2022 19:46:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 448A11F45CD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651779993;
 bh=e74sZbpqUGhj6kx7s7bPANpIdoqwtDfemeI26ZuR+Yw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iT1gT+XswaaRB3tvXjtX2P9YwdojMf8MvpLtpB6o39WkDOBggr7DqmJzXpXAckyGQ
 oDiBYI933R5vdaZddvqdrIBGSY/ArJnxm0p8R7tPuZd3yg9Pwsm5zUCzw4VWQdSLDC
 kEF9bppZUpFbd+HJZutnuiBEj9z+MBhI03uvQAJrGHXM+bWEq/FawTQZzYkFx8V2jx
 TZGKL//dB7u+ekP7npJFTZJoi19Tps2XE2frrhUbzUaoMS3OYGloZnigNvZSbiu6xb
 tD/7P/eqs5UsU37OcNKPF01TOoyONzX/xVC1epVd0gfL3Exwhg+fazLYMvDwnrffV3
 AnfBwHshSJNqA==
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
Subject: [PATCH v2 07/16] arm64: dts: mediatek: asurada: Add ChromeOS EC
Date: Thu,  5 May 2022 15:45:41 -0400
Message-Id: <20220505194550.3094656-8-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220505194550.3094656-1-nfraprado@collabora.com>
References: <20220505194550.3094656-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_124635_049678_5008D87D 
X-CRM114-Status: GOOD (  10.69  )
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

QWRkIHN1cHBvcnQgZm9yIHRoZSBDaHJvbWVPUyBFbWJlZGRlZCBDb250cm9sbGVyIHByZXNlbnQg
b24gdGhlIEFzdXJhZGEKcGxhdGZvcm0uIEl0IGlzIGNvbm5lY3RlZCB0aHJvdWdoIHRoZSBTUEkx
IGJ1cyBhbmQgb2ZmZXJzIHNldmVyYWwKZnVuY3Rpb25hbGl0aWVzOiBiYXNlIGRldGVjdGlvbiwg
UFdNIGNvbnRyb2xsZXIsIEkyQyB0dW5uZWxpbmcsCnJlZ3VsYXRvcnMsIFR5cGUtQyBjb25uZWN0
b3IgbWFuYWdlbWVudCwga2V5Ym9hcmQgYW5kIFNtYXJ0IEJhdHRlcnkKTWV0cmljcyAoU0JTKS4K
ClNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFi
b3JhLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9n
aW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+CgotLS0KCkNoYW5nZXMgaW4gdjI6Ci0g
UmVuYW1lZCBQV00gc3Vibm9kZSB0byBhdm9pZCBkdC1iaW5kaW5nIHdhcm5pbmcgKGVjLXB3bSAt
PiBwd20pCgogLi4uL2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kgICAgIHwg
NzkgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDc5IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRh
LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kK
aW5kZXggM2M1YjFlNDc1Y2Y2Li42NjIyMDdkMGViNzUgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kKQEAgLTM1Myw2ICszNTMsMTQgQEAg
JnBpbyB7CiAJCQkgICJBVURfREFUX01JU08wIiwKIAkJCSAgIkFVRF9EQVRfTUlTTzEiOwogCisJ
Y3Jvc19lY19pbnQ6IGNyb3MtZWMtaXJxLWRlZmF1bHQtcGlucyB7CisJCXBpbnMtZWMtYXAtaW50
LW9kbCB7CisJCQlwaW5tdXggPSA8UElOTVVYX0dQSU81X19GVU5DX0dQSU81PjsKKwkJCWlucHV0
LWVuYWJsZTsKKwkJCWJpYXMtcHVsbC11cDsKKwkJfTsKKwl9OworCiAJaTJjMF9waW5zOiBpMmMw
LWRlZmF1bHQtcGlucyB7CiAJCXBpbnMtYnVzIHsKIAkJCXBpbm11eCA9IDxQSU5NVVhfR1BJTzIw
NF9fRlVOQ19TQ0wwPiwKQEAgLTQzMiw2ICs0NDAsNzQgQEAgJnNwaTEgewogCW1lZGlhdGVrLHBh
ZC1zZWxlY3QgPSA8MD47CiAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKIAlwaW5jdHJsLTAg
PSA8JnNwaTFfcGlucz47CisKKwljcm9zX2VjOiBlY0AwIHsKKwkJY29tcGF0aWJsZSA9ICJnb29n
bGUsY3Jvcy1lYy1zcGkiOworCQlyZWcgPSA8MD47CisJCWludGVycnVwdHMtZXh0ZW5kZWQgPSA8
JnBpbyA1IElSUV9UWVBFX0xFVkVMX0xPVz47CisJCXNwaS1tYXgtZnJlcXVlbmN5ID0gPDMwMDAw
MDA+OworCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOworCQlwaW5jdHJsLTAgPSA8JmNyb3Nf
ZWNfaW50PjsKKworCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJI3NpemUtY2VsbHMgPSA8MD47
CisKKwkJYmFzZV9kZXRlY3Rpb246IGNiYXMgeworCQkJY29tcGF0aWJsZSA9ICJnb29nbGUsY3Jv
cy1jYmFzIjsKKwkJfTsKKworCQljcm9zX2VjX3B3bTogcHdtIHsKKwkJCWNvbXBhdGlibGUgPSAi
Z29vZ2xlLGNyb3MtZWMtcHdtIjsKKwkJCSNwd20tY2VsbHMgPSA8MT47CisKKwkJCXN0YXR1cyA9
ICJkaXNhYmxlZCI7CisJCX07CisKKwkJaTJjX3R1bm5lbDogaTJjLXR1bm5lbCB7CisJCQljb21w
YXRpYmxlID0gImdvb2dsZSxjcm9zLWVjLWkyYy10dW5uZWwiOworCQkJZ29vZ2xlLHJlbW90ZS1i
dXMgPSA8MD47CisJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJCSNzaXplLWNlbGxzID0gPDA+
OworCQl9OworCisJCW10NjM2MF9sZG8zX3JlZzogcmVndWxhdG9yQDAgeworCQkJY29tcGF0aWJs
ZSA9ICJnb29nbGUsY3Jvcy1lYy1yZWd1bGF0b3IiOworCQkJcmVnID0gPDA+OworCQkJcmVndWxh
dG9yLW1pbi1taWNyb3ZvbHQgPSA8MTgwMDAwMD47CisJCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9s
dCA9IDwzMzAwMDAwPjsKKwkJfTsKKworCQltdDYzNjBfbGRvNV9yZWc6IHJlZ3VsYXRvckAxIHsK
KwkJCWNvbXBhdGlibGUgPSAiZ29vZ2xlLGNyb3MtZWMtcmVndWxhdG9yIjsKKwkJCXJlZyA9IDwx
PjsKKwkJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDMzMDAwMDA+OworCQkJcmVndWxhdG9y
LW1heC1taWNyb3ZvbHQgPSA8MzMwMDAwMD47CisJCX07CisKKwkJdHlwZWMgeworCQkJY29tcGF0
aWJsZSA9ICJnb29nbGUsY3Jvcy1lYy10eXBlYyI7CisJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsK
KwkJCSNzaXplLWNlbGxzID0gPDA+OworCisJCQl1c2JfYzA6IGNvbm5lY3RvckAwIHsKKwkJCQlj
b21wYXRpYmxlID0gInVzYi1jLWNvbm5lY3RvciI7CisJCQkJcmVnID0gPDA+OworCQkJCWxhYmVs
ID0gImxlZnQiOworCQkJCXBvd2VyLXJvbGUgPSAiZHVhbCI7CisJCQkJZGF0YS1yb2xlID0gImhv
c3QiOworCQkJCXRyeS1wb3dlci1yb2xlID0gInNvdXJjZSI7CisJCQl9OworCisJCQl1c2JfYzE6
IGNvbm5lY3RvckAxIHsKKwkJCQljb21wYXRpYmxlID0gInVzYi1jLWNvbm5lY3RvciI7CisJCQkJ
cmVnID0gPDE+OworCQkJCWxhYmVsID0gInJpZ2h0IjsKKwkJCQlwb3dlci1yb2xlID0gImR1YWwi
OworCQkJCWRhdGEtcm9sZSA9ICJob3N0IjsKKwkJCQl0cnktcG93ZXItcm9sZSA9ICJzb3VyY2Ui
OworCQkJfTsKKwkJfTsKKwl9OwogfTsKIAogJnNwaTUgewpAQCAtNDQ2LDMgKzUyMiw2IEBAICZz
cGk1IHsKICZ1YXJ0MCB7CiAJc3RhdHVzID0gIm9rYXkiOwogfTsKKworI2luY2x1ZGUgPGFybS9j
cm9zLWVjLWtleWJvYXJkLmR0c2k+CisjaW5jbHVkZSA8YXJtL2Nyb3MtZWMtc2JzLmR0c2k+Ci0t
IAoyLjM2LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
