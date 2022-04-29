Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D20C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 20:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HJPUuuakdA2zChpQGYaTzo/8iOiTWxgktskWaSuRbMY=; b=U3SQCaRG6DsIyI
	9Mgxa5lMMKigvxtG+5hEnmVmO26xzEmG179pIsuq33c5OnUfrJjWwMPmUSwG0GRjeg6d4qTWMYhmF
	gzwy7HwoE6buVYFalZe4vC9gFD4Xr0OzUcdklCCr2kD5p/QojIGw+X/UUbKHtmeAgT9e7mG2S9m7c
	W9h8g7u2lFkYkEHU5EHTE9lSX/X2Mvbm25rwtQ3KjKRTBXjBIPpCtKTDY7hxop5XgLbIELaNjJmzW
	FjYvvx1+A1ZGvfwvKkQc4hE3UhdZ1doICiRRCBC8xifM2QIcvDd6yqCu7/La5CcNUdLR9gKatHOhs
	0+ATrMEMw2+UdFcW//dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkXGm-00CVW9-1K; Fri, 29 Apr 2022 20:31:16 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkXGP-00CVNm-4e; Fri, 29 Apr 2022 20:30:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 13ED91F469D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651264251;
 bh=iA81JYnLAQQ56KXiWfdUYhI2+oyfPVXJFjeDzQn33UQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IEXLTWvqDvhD8CXoQFsb1+gzKNMCACdb8rlEhLrPyFd5Ezy+kLRcmFRgNDdCBsuKN
 F24McZ6t0CsiSnp6455dCY4H1vu7lXGmcYxl5ke4thYo5fhgXDCtnWhmwohSXFFCEj
 HR3NsmGWzRONXwoUFTxpZ98PUXsHAO6evwLPcOIAtkBXwsmkitIWiu1guxTspIsf2W
 I1oW750Zw+95Up0iRS8Enhwhs6IwLCwc7gx+FF85yE0Y6AuXegjBGms3Z/+t5khTEL
 tMxYkikxZsfLJf6KdIeL8LLyPo6mozWksZutDOsDDeMHPdcQdcmlNv0c3MRm5bX/y6
 35CkcCaxg8KMw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Shane Chien <shane.chien@mediatek.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 1/3] ASoC: dt-bindings: mediatek: mt8192: Add i2s-share
 properties
Date: Fri, 29 Apr 2022 16:30:37 -0400
Message-Id: <20220429203039.2207848-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220429203039.2207848-1-nfraprado@collabora.com>
References: <20220429203039.2207848-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_133053_349325_D31616E1 
X-CRM114-Status: UNSURE (   9.41  )
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

VGhlIE1lZGlhdGVrIEFGRSBQQ00gY29udHJvbGxlciBmb3IgTVQ4MTkyIGFsbG93cyBzaGFyaW5n
IG9mIGFuIEkyUyBidXMKYmV0d2VlbiB0d28gYnVzc2VzLiBBZGQgYSBwYXR0ZXJuIGZvciB0aGVz
ZSBwcm9wZXJ0aWVzIGluIHRoZQpkdC1iaW5kaW5nLgoKU2lnbmVkLW9mZi1ieTogTsOtY29sYXMg
Ri4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgoKLS0tCgogRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210ODE5Mi1hZmUtcGNtLnlhbWwgfCA1ICsr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210ODE5Mi1hZmUtcGNtLnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ4MTkyLWFmZS1wY20ueWFt
bAppbmRleCA3YTI1YmM5YjgwNjAuLjViMDNjOGRiZjMxOCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210ODE5Mi1hZmUtcGNtLnlhbWwKKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210ODE5Mi1hZmUtcGNtLnlh
bWwKQEAgLTU0LDYgKzU0LDExIEBAIHByb3BlcnRpZXM6CiAgICAgICAtIGNvbnN0OiBhdWRfaW5m
cmFfY2xrCiAgICAgICAtIGNvbnN0OiBhdWRfaW5mcmFfMjZtX2NsawogCitwYXR0ZXJuUHJvcGVy
dGllczoKKyAgIl5pMnNbMC0zNS05XS1zaGFyZSQiOgorICAgIGRlc2NyaXB0aW9uOiBOYW1lIG9m
IHRoZSBJMlMgYnVzIHRoYXQgaXMgc2hhcmVkIHdpdGggdGhpcyBidXMKKyAgICBwYXR0ZXJuOiAi
XkkyU1swLTM1LTldJCIKKwogcmVxdWlyZWQ6CiAgIC0gY29tcGF0aWJsZQogICAtIGludGVycnVw
dHMKLS0gCjIuMzYuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
