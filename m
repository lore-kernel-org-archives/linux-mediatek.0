Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BC8C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 21:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EZ3BW4LzTgC+/kZ1SBgWcgcaWW1LVO/DIPCvhar7+Mw=; b=hy2GCyHaDGAgPT
	uStLHEPPDwdRxW6LAyrGQwIBas5S0VjoqPm5HgC1Jc0tZg2OF6AQbujBxauHXlq1NYvjSu+EmoQgz
	QFDhRxIPQKvJVPswC7gSohwg6cohoVowhfsid+vQq1aXSCcDUL1t3BX/lsEEqcbq6n0zddngRhp9c
	h7bEWwpKgdy/G9dZhHG5Xt1CPIHkpAKo08NEeE07JgxDrvqgHaCSI4QlhXWFz+RZmukHXHzX04PyF
	L/d8qzv7FmoGVLiSPCriHFmo4BBQ1fQDK3yKWWT76Ef26nUgZN0vks3pB0aG5Oc6cVqxRwf2hEJP7
	V90A03NYBryd1UJn6+1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUEbT-00Ae7X-Rt; Tue, 15 Mar 2022 21:21:15 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUEb8-00AdzO-U4; Tue, 15 Mar 2022 21:20:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 669FC1F42B7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647379246;
 bh=GsxKwxEoyVMpi9QnEKrL5AuRZVqQ1PwZULVbs0dY27k=;
 h=From:To:Cc:Subject:Date:From;
 b=h61l0YcKl1B4Yzl5OA0aoMfTb2YVYT1Gse4wDVqGX1o2XqvO+ac/C6hh/mpCngk8K
 ouUjOaAOYCjREhwUtZM/DVAD1Lv4SY1E1IZWPp5jcYaQlQAHAVrJ2qGcnpsg+EYLL6
 8mTZa1+ISpCXJ7K87vzznR7apFqH/208bNq2cEgSzaY1gxgnpVMcZSIqwcz07aMMKW
 b35qUMoj43TS9a8uC2TWs56lGQYnpSJ0L+iOaJnwoapr94Q00l0ds577mEa1bHXCQ5
 08cTqHwFamAqgZyC9/8XZEQpaAYf720FPrRY/fud09FjO9dAUD0detyNgq1PWf85RQ
 ghbr76+NAhqGg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v1 0/4] dt-bindings: pinctrl: mt8192: Add missing wrapping
 node and properties
Date: Tue, 15 Mar 2022 17:19:32 -0400
Message-Id: <20220315211936.442708-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_142055_107236_A315C4F0 
X-CRM114-Status: UNSURE (   7.60  )
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

ClRoaXMgc2VyaWVzIGFkZHMgdGhlIHdyYXBwaW5nIG5vZGUgZm9yIHBpbm11eCBub2RlcyB0aGF0
IHdhcyBtaXNzaW5nIGluCnRoZSBtdDgxOTItcGluY3RybCBkdC1iaW5kaW5nIGFzIHdlbGwgYXMg
YSBjb3VwbGUgb3RoZXIgbWlzc2luZwpwcm9wZXJ0aWVzLgoKCk7DrWNvbGFzIEYuIFIuIEEuIFBy
YWRvICg0KToKICBkdC1iaW5kaW5nczogcGluY3RybDogbXQ4MTkyOiBBZGQgd3JhcHBpbmcgbm9k
ZSBmb3IgcGluIGNvbmZpZ3VyYXRpb25zCiAgZHQtYmluZGluZ3M6IHBpbmN0cmw6IG10ODE5Mjog
QWRkIG1lZGlhdGVrLGRyaXZlLXN0cmVuZ3RoLWFkdiBwcm9wZXJ0eQogIGR0LWJpbmRpbmdzOiBw
aW5jdHJsOiBtdDgxOTI6IEFkZCBtZWRpYXRlayxwdWxsLXVwLWFkdiBwcm9wZXJ0eQogIGR0LWJp
bmRpbmdzOiBwaW5jdHJsOiBtdDgxOTI6IEFkZCBncGlvLWxpbmUtbmFtZXMgcHJvcGVydHkKCiAu
Li4vYmluZGluZ3MvcGluY3RybC9waW5jdHJsLW10ODE5Mi55YW1sICAgICAgfCAxNTUgKysrKysr
KysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOTggaW5zZXJ0aW9ucygrKSwgNTcgZGVsZXRp
b25zKC0pCgotLSAKMi4zNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
