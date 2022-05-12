Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4210BC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 20:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TbPesa5E1+cl+keVwoza1SeCmVLdmiuATca5ZRuYch0=; b=Ss7fI1LvwREi4k
	d8oM/uaLf4gY0D4PyxQtm00bNo+UG2NQNeFZEV/VKvlirQLXvOnbyUZBqyX+TZwT4N9kpNyRSvRcQ
	6utba4rGCYPDJjEzt6tKTZXqZ5F0/ohY3DjqjjpcQwkkEZ7Gus4vJwP4H7VfGhZmWdDY4sCnLWlQf
	Yq6oKL4ob6dxniC0t2Yq7A1mSXmU00m14l6j/DNAtCcFDd/Brte3qBVRS9EeckNhXq9sq+1mUm/8d
	WRcMwwySUXFgrvnVB3RkhxSSBbQZZLvIOaLghBJMosQlsIrwzzZ9b5bidoJUKSsglQQZXWM4JEgXr
	ObdpMZp9jcyoT+7x4ZYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npFuL-00DTAt-LT; Thu, 12 May 2022 20:59:37 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npFrP-00DRIN-GH; Thu, 12 May 2022 20:56:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id ED4B11F45945
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652388994;
 bh=8931BEPpRMo9jwNwHld86dfIKOtzN61ZDy8g9afbC0U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YLxYb8ta5a6kjhDiboyTyxwDCKdK4bJow0DMQO6QC7D/gKxdW7+8Fbv2zPWwOqZ8/
 7XxA+B/UZKBQ8xlRHlV/2RhGp8BXp2aSNsteFCxBWsmRMtc2BFD6z8C5i59nR5fOM4
 jqy0E+NieQ3PA92yNOT7lk1b+a6gtdgnjMHQjc+1/Bi4CoASmBzjFkbx/mNGR928+3
 C0L6o2DmUmq+mO+FQZRRl7fHadtFSNEUxZ839TouRp+FZ6MJwkmYYG5zzNoNstHhan
 apVGdkDdplpM/CDhpXtz0c4K2RvDkpLXcPCGzXrdFrbLwHhS/PXoxDygp/lz+DMgUz
 T3cdxUc4D9C9Q==
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
Subject: [PATCH v3 09/16] arm64: dts: mediatek: asurada: Add Cr50 TPM
Date: Thu, 12 May 2022 16:55:55 -0400
Message-Id: <20220512205602.158273-10-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512205602.158273-1-nfraprado@collabora.com>
References: <20220512205602.158273-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_135635_724605_A37D874F 
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

VGhlIEFzdXJhZGEgcGxhdGZvcm0gaGFzIGEgR29vZ2xlIFNlY3VyaXR5IENoaXAgY29ubmVjdGVk
IHRvIHRoZSBTUEk1CmJ1cy4gSXQgcnVucyB0aGUgY3I1MCBmaXJtd2FyZSBhbmQgcHJvdmlkZXMg
VFBNIGZ1bmN0aW9uYWxpdHkuIEFkZApzdXBwb3J0IGZvciBpdC4KClNpZ25lZC1vZmYtYnk6IE7D
rWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KUmV2aWV3ZWQt
Ynk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25v
QGNvbGxhYm9yYS5jb20+ClRlc3RlZC1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zdEBjaHJvbWl1bS5v
cmc+Ci0tLQoKKG5vIGNoYW5nZXMgc2luY2UgdjEpCgogLi4uL2FybTY0L2Jvb3QvZHRzL21lZGlh
dGVrL210ODE5Mi1hc3VyYWRhLmR0c2kgfCAxNyArKysrKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDE3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRz
L21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlh
dGVrL210ODE5Mi1hc3VyYWRhLmR0c2kKaW5kZXggYmNmYTY4OGI2N2Y3Li5kZGYxODg2MWVkYWQg
MTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEu
ZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0
c2kKQEAgLTUsNiArNSw3IEBACiAgKi8KIC9kdHMtdjEvOwogI2luY2x1ZGUgIm10ODE5Mi5kdHNp
IgorI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oPgogCiAvIHsKIAlhbGlhc2VzIHsK
QEAgLTM1Myw2ICszNTQsMTMgQEAgJnBpbyB7CiAJCQkgICJBVURfREFUX01JU08wIiwKIAkJCSAg
IkFVRF9EQVRfTUlTTzEiOwogCisJY3I1MF9pbnQ6IGNyNTAtaXJxLWRlZmF1bHQtcGlucyB7CisJ
CXBpbnMtZ3NjLWFwLWludC1vZGwgeworCQkJcGlubXV4ID0gPFBJTk1VWF9HUElPMTcxX19GVU5D
X0dQSU8xNzE+OworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCX07CisKIAljcm9zX2VjX2ludDog
Y3Jvcy1lYy1pcnEtZGVmYXVsdC1waW5zIHsKIAkJcGlucy1lYy1hcC1pbnQtb2RsIHsKIAkJCXBp
bm11eCA9IDxQSU5NVVhfR1BJTzVfX0ZVTkNfR1BJTzU+OwpAQCAtNTE3LDYgKzUyNSwxNSBAQCAm
c3BpNSB7CiAJbWVkaWF0ZWsscGFkLXNlbGVjdCA9IDwwPjsKIAlwaW5jdHJsLW5hbWVzID0gImRl
ZmF1bHQiOwogCXBpbmN0cmwtMCA9IDwmc3BpNV9waW5zPjsKKworCWNyNTBAMCB7CisJCWNvbXBh
dGlibGUgPSAiZ29vZ2xlLGNyNTAiOworCQlyZWcgPSA8MD47CisJCWludGVycnVwdHMtZXh0ZW5k
ZWQgPSA8JnBpbyAxNzEgSVJRX1RZUEVfRURHRV9SSVNJTkc+OworCQlzcGktbWF4LWZyZXF1ZW5j
eSA9IDwxMDAwMDAwPjsKKwkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKKwkJcGluY3RybC0w
ID0gPCZjcjUwX2ludD47CisJfTsKIH07CiAKICZ1YXJ0MCB7Ci0tIAoyLjM2LjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
