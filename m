Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26C4C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 20:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ML4SfF0T7YvGqBBeSoQDE+N2cwFEs45i+CWNUKq34vY=; b=utAcJth3oIXGre
	+HhsghB3QsyzYA07Z/iii4ht+5pDI60qDAGk9DfG9b2+bw8Re6NNemkw6/46TBe6k8SiXiHx0Dnk1
	HPXcB4o6/+gQ8I4wHdi0NMYeauJAog8YUsIhjniwCAb++X9QAj0VVmr5X24l3y+ZVtmHkxgYND37d
	TptGkdJzcmKIS/yej653GqfLO8ariW7eaMHdFji+/qwkEBrDD7wNFgsYKoMA/feNZ9v7fEGPdtEYt
	UBtBn8TbY9DaAslM8/kSC0H0VgJxB2stzImAJSVJpetP+anV2NxGMgGOIH8i/vEautFoql+TbRB0x
	km8QHCMfbB2ZKyPdXjpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npFtX-00DSfE-1B; Thu, 12 May 2022 20:58:47 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npFrL-00DRFz-Kw; Thu, 12 May 2022 20:56:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id C77991F458B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652388984;
 bh=AeFfex/JVD/zQPvVyInmERUi6VeIDf4H1bEVg6p3hq4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oelGi46TkTSVx9U5OYpY1f1QGBQpol128N84Wt7Qg+e8HbVTUcjJcRVSNBSn1qpVD
 zrLG45adeLt2RFtWGWLXpNbPh0hCC0w4zwZKr4PTIuoAQvBv4krIj0FNhc+IrF53dK
 wfL/T+rvMzMPQl6JxpEALD8vNg6iauaa7bO9TCYF/FAGSQkRKrqDqypOhS9PpT7e45
 FX9N8B1rE5jpTvGW593HZWKEX2e3qqKICKqL9U/5eIvR8RXv9nRFdpYWPV/tiTqc4+
 fxlkwV32OM7wYyH2LYtqB5vmuicT6WfjnbIdyrhW1ivE0ftP7gMdbK9yMBMSTCg9B9
 B5qUmnoojj7RQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v3 07/16] arm64: dts: mediatek: asurada: Add ChromeOS EC
Date: Thu, 12 May 2022 16:55:53 -0400
Message-Id: <20220512205602.158273-8-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512205602.158273-1-nfraprado@collabora.com>
References: <20220512205602.158273-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_135631_863978_EE3130B2 
X-CRM114-Status: GOOD (  10.65  )
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
aW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+ClRlc3RlZC1ieTogQ2hlbi1ZdSBUc2Fp
IDx3ZW5zdEBjaHJvbWl1bS5vcmc+CgotLS0KCihubyBjaGFuZ2VzIHNpbmNlIHYyKQoKQ2hhbmdl
cyBpbiB2MjoKLSBSZW5hbWVkIFBXTSBzdWJub2RlIHRvIGF2b2lkIGR0LWJpbmRpbmcgd2Fybmlu
ZyAoZWMtcHdtIC0+IHB3bSkKCiAuLi4vYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEu
ZHRzaSAgICAgfCA3OSArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNzkgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4
MTkyLWFzdXJhZGEuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFz
dXJhZGEuZHRzaQppbmRleCA0ZmNlNDhkMGY2NTMuLmJjZmE2ODhiNjdmNyAxMDA2NDQKLS0tIGEv
YXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpCisrKyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaQpAQCAtMzUzLDYg
KzM1MywxNCBAQCAmcGlvIHsKIAkJCSAgIkFVRF9EQVRfTUlTTzAiLAogCQkJICAiQVVEX0RBVF9N
SVNPMSI7CiAKKwljcm9zX2VjX2ludDogY3Jvcy1lYy1pcnEtZGVmYXVsdC1waW5zIHsKKwkJcGlu
cy1lYy1hcC1pbnQtb2RsIHsKKwkJCXBpbm11eCA9IDxQSU5NVVhfR1BJTzVfX0ZVTkNfR1BJTzU+
OworCQkJaW5wdXQtZW5hYmxlOworCQkJYmlhcy1wdWxsLXVwOworCQl9OworCX07CisKIAlpMmMw
X3BpbnM6IGkyYzAtZGVmYXVsdC1waW5zIHsKIAkJcGlucy1idXMgewogCQkJcGlubXV4ID0gPFBJ
Tk1VWF9HUElPMjA0X19GVU5DX1NDTDA+LApAQCAtNDMyLDYgKzQ0MCw3NCBAQCAmc3BpMSB7CiAJ
bWVkaWF0ZWsscGFkLXNlbGVjdCA9IDwwPjsKIAlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwog
CXBpbmN0cmwtMCA9IDwmc3BpMV9waW5zPjsKKworCWNyb3NfZWM6IGVjQDAgeworCQljb21wYXRp
YmxlID0gImdvb2dsZSxjcm9zLWVjLXNwaSI7CisJCXJlZyA9IDwwPjsKKwkJaW50ZXJydXB0cy1l
eHRlbmRlZCA9IDwmcGlvIDUgSVJRX1RZUEVfTEVWRUxfTE9XPjsKKwkJc3BpLW1heC1mcmVxdWVu
Y3kgPSA8MzAwMDAwMD47CisJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CisJCXBpbmN0cmwt
MCA9IDwmY3Jvc19lY19pbnQ+OworCisJCSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkjc2l6ZS1j
ZWxscyA9IDwwPjsKKworCQliYXNlX2RldGVjdGlvbjogY2JhcyB7CisJCQljb21wYXRpYmxlID0g
Imdvb2dsZSxjcm9zLWNiYXMiOworCQl9OworCisJCWNyb3NfZWNfcHdtOiBwd20geworCQkJY29t
cGF0aWJsZSA9ICJnb29nbGUsY3Jvcy1lYy1wd20iOworCQkJI3B3bS1jZWxscyA9IDwxPjsKKwor
CQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwkJfTsKKworCQlpMmNfdHVubmVsOiBpMmMtdHVubmVs
IHsKKwkJCWNvbXBhdGlibGUgPSAiZ29vZ2xlLGNyb3MtZWMtaTJjLXR1bm5lbCI7CisJCQlnb29n
bGUscmVtb3RlLWJ1cyA9IDwwPjsKKwkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkJI3NpemUt
Y2VsbHMgPSA8MD47CisJCX07CisKKwkJbXQ2MzYwX2xkbzNfcmVnOiByZWd1bGF0b3JAMCB7CisJ
CQljb21wYXRpYmxlID0gImdvb2dsZSxjcm9zLWVjLXJlZ3VsYXRvciI7CisJCQlyZWcgPSA8MD47
CisJCQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwxODAwMDAwPjsKKwkJCXJlZ3VsYXRvci1t
YXgtbWljcm92b2x0ID0gPDMzMDAwMDA+OworCQl9OworCisJCW10NjM2MF9sZG81X3JlZzogcmVn
dWxhdG9yQDEgeworCQkJY29tcGF0aWJsZSA9ICJnb29nbGUsY3Jvcy1lYy1yZWd1bGF0b3IiOwor
CQkJcmVnID0gPDE+OworCQkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MzMwMDAwMD47CisJ
CQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsKKwkJfTsKKworCQl0eXBlYyB7
CisJCQljb21wYXRpYmxlID0gImdvb2dsZSxjcm9zLWVjLXR5cGVjIjsKKwkJCSNhZGRyZXNzLWNl
bGxzID0gPDE+OworCQkJI3NpemUtY2VsbHMgPSA8MD47CisKKwkJCXVzYl9jMDogY29ubmVjdG9y
QDAgeworCQkJCWNvbXBhdGlibGUgPSAidXNiLWMtY29ubmVjdG9yIjsKKwkJCQlyZWcgPSA8MD47
CisJCQkJbGFiZWwgPSAibGVmdCI7CisJCQkJcG93ZXItcm9sZSA9ICJkdWFsIjsKKwkJCQlkYXRh
LXJvbGUgPSAiaG9zdCI7CisJCQkJdHJ5LXBvd2VyLXJvbGUgPSAic291cmNlIjsKKwkJCX07CisK
KwkJCXVzYl9jMTogY29ubmVjdG9yQDEgeworCQkJCWNvbXBhdGlibGUgPSAidXNiLWMtY29ubmVj
dG9yIjsKKwkJCQlyZWcgPSA8MT47CisJCQkJbGFiZWwgPSAicmlnaHQiOworCQkJCXBvd2VyLXJv
bGUgPSAiZHVhbCI7CisJCQkJZGF0YS1yb2xlID0gImhvc3QiOworCQkJCXRyeS1wb3dlci1yb2xl
ID0gInNvdXJjZSI7CisJCQl9OworCQl9OworCX07CiB9OwogCiAmc3BpNSB7CkBAIC00NDYsMyAr
NTIyLDYgQEAgJnNwaTUgewogJnVhcnQwIHsKIAlzdGF0dXMgPSAib2theSI7CiB9OworCisjaW5j
bHVkZSA8YXJtL2Nyb3MtZWMta2V5Ym9hcmQuZHRzaT4KKyNpbmNsdWRlIDxhcm0vY3Jvcy1lYy1z
YnMuZHRzaT4KLS0gCjIuMzYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
