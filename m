Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93572C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 22:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ngfZM+Qps+wpwQhBUlOi7LQjLEO2yUHCWRr5NBe2hRM=; b=XVvaSYHt4JBt2t
	V0ZNF71+AfKFl5L9Ive4kkMxoiyrVQYMS09xmmU/mItckvffHfxdp2dVs9Os1XP5e3mCKJRwMPOW/
	F+b1lBtScJ//TWq0Fi1UFksoqPat21Lu5qwxDJoB7//UBUHS43DeUE7SBAIi6V5+h/orBtRu7bcNq
	BwN3ielD2MpC7YwvAZnmG06/l6k386o2W9UFHxs7B5KVvh5ZFJJuMeD37F5kIGXdFwPWG6weOVUMH
	P6YZ8BRbkMjerfRBop7larjtvIzBzGn/llzDmP+VneJI+uf2DvHVVaJINhJchQtyMxBIoAcr05o2b
	zPw+/gwEhnxEbcPemkcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwADw-00CpbD-Ra; Tue, 31 May 2022 22:20:24 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwADb-00CpVs-G9; Tue, 31 May 2022 22:20:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: nfraprado)
	with ESMTPSA id C06791F43F19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654035599;
	bh=lMri5Og8mqTLpkPs/QpNcaNHyLWk1vcQfF8MIfkQjsM=;
	h=From:To:Cc:Subject:Date:From;
	b=hqbt4AJDpV12l2MtXQCuns9kvvNq1oPaWtESyjZeW6aFuAtpf64RoyD6801X3kHXu
	 PtZkfBsNNY/iy44xRTBfcqLOfpGZzcfoYJIa4da9TwcPuhUxe7P+/IRG/x4xNJN2Wi
	 +nFosEzY7cdKKgxLwvZIGLykohmbMICaUNfgwitrT0982JzOnYcTiPDur7JQs0KA5L
	 8bXUxR7WHxZGJ44IP878vtVb1Fp8zjoZe6wwpLe3HpEn751IOxmKCXRWrU5pH2kn19
	 rJ5XKgc3+Ra6E3EDhBVmV4pWYU13DxvgDWP0Bh8nMMsTC/5nPgIWbNoRiOA6KknaGy
	 AXM0sTmCxc5JQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/2] MT8192 pinctrl properties adjustments
Date: Tue, 31 May 2022 18:19:52 -0400
Message-Id: <20220531221954.160036-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_152003_797602_EB98F379 
X-CRM114-Status: UNSURE (   8.93  )
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

ClRoZSB0d28gcGF0Y2hlcyBpbiB0aGlzIHNlcmllcyBzdWJzdGl0dXRlIHByb3BlcnRpZXMgaW4g
dGhlIG10ODE5MgpwaW5jdHJsIGR0LWJpbmRpbmcgZm9yIG9uZXMgd2hpY2ggaGF2ZSBhIGNsZWFy
ZXIgbWVhbmluZyBhbmQgYXJlIG1vcmUKc3RhbmRhcmRpemVkLiBBdCB0aGlzIHBvaW50IHRoZXJl
J3Mgbm8gRFQgdXNpbmcgdGhlIG10ODE5MiBwaW5jdHJsCmJpbmRpbmcsIHNvIGlmIHN1Y2ggY2hh
bmdlcyBhcmUgdG8gYmUgbWFkZSwgdGhleSBuZWVkIHRvIGhhcHBlbiBub3cuCgp2MTogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWF0ZWsvMjAyMjA1MjUxNTU3MTQuMTgzNzM2MC0x
LW5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tLwoKQ2hhbmdlcyBpbiB2MjoKLSBEcm9wcGVkIEZpeGVz
IHRhZ3MKLSBBZGRlZCAnaWYnIGJsb2NrcyB0byBlbmZvcmNlIG11dHVhbCBleGNsdXNpb24gb2Yg
cHJvcGVydGllcwoKTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gKDIpOgogIGR0LWJpbmRpbmdzOiBw
aW5jdHJsOiBtdDgxOTI6IFN3aXRjaCBkcml2ZS1zdHJlbmd0aC1hZHYgZm9yIC1taWNyb2FtcAog
IGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBtdDgxOTI6IFVzZSBnZW5lcmljIGJpYXMgaW5zdGVhZCBv
ZiBwdWxsLSotYWR2CgogLi4uL2JpbmRpbmdzL3BpbmN0cmwvcGluY3RybC1tdDgxOTIueWFtbCAg
ICAgIHwgODEgKysrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQxIGluc2VydGlv
bnMoKyksIDQwIGRlbGV0aW9ucygtKQoKLS0gCjIuMzYuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
