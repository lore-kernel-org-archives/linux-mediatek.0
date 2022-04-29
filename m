Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724E3C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 21:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iJn8D52MtmvPfIiCGr3/xt8MX9M1a0f4Gf50oGER2zc=; b=TLsWzmmmNqU1pl
	eu5ZBUOQlnmpSY4wFHWJo48YMnmIm/XstrBYOVyTfjLBR9+9XDQTgg0TXrMT6wSnPJDEGKiA5v0O8
	o4ulOje4sJ1CpBsZeRKl5K43nZnRcRVZOORfci/F06sNmnmojL+iMCb+i293jxVq3rdSVs5R34pBL
	pp+L/So2+f0A15iyUSPphQf2AshRCl/Os1igNoxHkZnbRybisTNjRxihbYOSm9g/6I0SbzWmhWqZU
	LRGEiuAIRKL7VmB/lPkeb8gyFNNkHOWUhft9WGLcXjiOovDTKLdL1tIrOphyHSZQCR3Iz7VeazQA6
	EfzgQGVWfmwRYI9YHeOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkXtz-00Cjsc-2X; Fri, 29 Apr 2022 21:11:47 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkXtc-00Cjj8-9x; Fri, 29 Apr 2022 21:11:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id C2C101F469DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651266682;
 bh=zkf2OdOr4qeK3DFvoa0PuUxALZNEfVfEptYcm+0bgWY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dfdpa804qceBKZ5hxqyciz2L4G4BIRypnil5OHRrbaUrasFP7RTTZjGR3m+UWxbuT
 6+L5MnQ6R7N1NRd05Ud+tTgOm+KQVOEfJZ+nwwysCdOWTHe8ihdOd3gjlFDoqfAkRd
 uoFjR1YeYQAjqpKR4TtUo/kUKMv30gJX61VhTvPBtK2NmU6I5xQY+pj15jWwSn7JqF
 /aARjrqrFgy5azn2f9uxOFnVzvGUfq0o0rssfcefSzLUW6Wp2IHpdWpB/R3xwre+PW
 zlW1G1EMYkW6ACwyQxL3/maz8CrTjxUWiZJQDuqmdiUBIE8hukqzYnedOSdZ7VBubO
 AwoQmkDC2h34A==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Tinghan Shen <tinghan.shen@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-remoteproc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: remoteproc: mediatek: Fix optional reg-names
 for mtk, scp
Date: Fri, 29 Apr 2022 17:11:09 -0400
Message-Id: <20220429211111.2214119-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220429211111.2214119-1-nfraprado@collabora.com>
References: <20220429211111.2214119-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_141124_510677_25D94833 
X-CRM114-Status: UNSURE (   9.94  )
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

VGhlIFNDUCBoYXMgdGhyZWUgbWVtb3J5IHJlZ2lvbnM6IHNyYW0sIGwxdGNtIGFuZCBjZmcuIE9u
bHkgc3JhbSBpcwpyZXF1aXJlZCwgdGhlIG90aGVyIHR3byBhcmUgb3B0aW9uYWwuIEZpeCB0aGUg
ZHQtYmluZGluZyBzbyB0aGF0IHRoZQpvcHRpb25hbCByZWdpb25zIGNhbiBiZSBvbWl0dGVkIGFu
ZCBwYXNzZWQgaW4gYW55IG9yZGVyLgoKQWxzbyBhZGQgdGhlIG1pc3NpbmcgbWluSXRlbXMgdG8g
dGhlIHJlZyBwcm9wZXJ0eSBhbmQgdXBkYXRlIHRoZQpkZXNjcmlwdGlvbi4KClNpZ25lZC1vZmYt
Ynk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KCi0t
LQoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlbW90ZXByb2MvbXRrLHNjcC55YW1sICAgICAg
fCAxMiArKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3JlbW90ZXByb2MvbXRrLHNjcC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3JlbW90ZXByb2MvbXRrLHNjcC55YW1sCmluZGV4IDgyM2EyMzYyNDJkZS4uZWM5ZGRlYjZj
YTJjIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3Rl
cHJvYy9tdGssc2NwLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3JlbW90ZXByb2MvbXRrLHNjcC55YW1sCkBAIC0yNCwxNCArMjQsMjAgQEAgcHJvcGVydGllczoK
ICAgcmVnOgogICAgIGRlc2NyaXB0aW9uOgogICAgICAgU2hvdWxkIGNvbnRhaW4gdGhlIGFkZHJl
c3MgcmFuZ2VzIGZvciBtZW1vcnkgcmVnaW9ucyBTUkFNLCBDRkcsIGFuZAotICAgICAgTDFUQ00u
CisgICAgICBMMVRDTS4gT25seSBTUkFNIGlzIHJlcXVpcmVkLCB3aGlsZSBDRkcgYW5kIEwxVENN
IGFyZSBvcHRpb25hbC4KKyAgICBtaW5JdGVtczogMQogICAgIG1heEl0ZW1zOiAzCiAKICAgcmVn
LW5hbWVzOgorICAgIG1pbkl0ZW1zOiAxCiAgICAgaXRlbXM6CiAgICAgICAtIGNvbnN0OiBzcmFt
Ci0gICAgICAtIGNvbnN0OiBjZmcKLSAgICAgIC0gY29uc3Q6IGwxdGNtCisgICAgICAtIGVudW06
CisgICAgICAgICAgLSBsMXRjbQorICAgICAgICAgIC0gY2ZnCisgICAgICAtIGVudW06CisgICAg
ICAgICAgLSBsMXRjbQorICAgICAgICAgIC0gY2ZnCiAKICAgY2xvY2tzOgogICAgIGRlc2NyaXB0
aW9uOgotLSAKMi4zNi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
