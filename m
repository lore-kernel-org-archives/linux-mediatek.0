Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00ECC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 21:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qnV8CKHNrs+5REUgaThs3RU+Vu6cCrm/1hTMui4ydKA=; b=g967XoSXZ0XjXw
	kgiUHKOVVutkPgKmHP9MLhgbGLh68X0awMu6ERKH2rXsdKdPwU+mWwQZlEhkt3c6VpWiv+0tpPJlR
	IHll7ZQgIM3ISG3skbTR2nE7440OXRzz1b82I/SIf6pb1ZxMpreOK7WDUY39F/fve3u98a82XaKEn
	fN1YLYComVbWUD/tvMi8c3DahO418C2+/VaHCl8lcGwoFlqITiOJRVIXO5VIGPQd6q461W0Xzvmvb
	THtdxDwdNla9Cr/UoUw9b4xqPgRImIN/FQ15UwyU0yYk6GPsKrHXS8ow7QNeVSCvtWmDLaePH0umN
	z8nOLjEntrpDwXy4WCDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nn5ZQ-0058Uh-Q7; Fri, 06 May 2022 21:33:04 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nn5Yz-0058JR-FX; Fri, 06 May 2022 21:32:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id ABEA51F46F19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651872756;
 bh=7/ruMOw9euAiDMHjfy/tYPDDLSQ2ojwszbkys9iXdo8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cyOHKSKEm0Xl8bq7Ms0QZLOsaU/N6hUKUV6TpMGAReQ1A6WY6leaqWNUJfgviOnCf
 OGPhAvVL2lmDWpsdiWjVz1H2p6ldfa6xpevW8ZbRn1mxDuZ94NLQAaOQPoBW5kr24W
 JMAMXFneC5iwv/XgHH5+bM8WBp9BUnCbIkEtXoAkp0u7rtVpm0J1FIRG2Uu3dcDGEo
 47l3VZSE78ZM+jmj3HORqEXuoP4c4P5vN/OTavCHPbTPxXq782c4mM6cDAs+nS7lxM
 j7G/gtFGS0OMz4IQA2kjs/Mit4Za3N11h5GPJXSUIy4wj7lZ2rn/Bi/4MdreXeugE/
 lRe86rpNYlZRA==
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
Subject: [PATCH v4 2/2] dt-bindings: remoteproc: mediatek: Add optional
 memory-region to mtk, scp
Date: Fri,  6 May 2022 17:32:26 -0400
Message-Id: <20220506213226.257859-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220506213226.257859-1-nfraprado@collabora.com>
References: <20220506213226.257859-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_143237_712619_BE1FC5DE 
X-CRM114-Status: UNSURE (   8.85  )
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

VGhlIFNDUCBjby1wcm9jZXNzb3IgY2FuIG9wdGlvbmFsbHkgYmUgcGFzc2VkIGEgcmVzZXJ2ZWQg
bWVtb3J5IHJlZ2lvbgp0byB1c2UuIEFkZCB0aGlzIHByb3BlcnR5IGluIHRoZSBkdC1iaW5kaW5n
LgoKU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xs
YWJvcmEuY29tPgpSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vs
b2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KQWNrZWQtYnk6IFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+CgotLS0KCihubyBjaGFuZ2VzIHNpbmNlIHYyKQoKQ2hhbmdlcyBp
biB2MjoKLSBEcm9wcGVkIHR5cGUgYW5kIGRlc2NyaXB0aW9uIHNpbmNlIGl0J3MgYSB3ZWxsLWtu
b3duIHByb3BlcnR5Ci0gU2V0IG1heEl0ZW1zIHRvIDEKCiBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9tdGssc2NwLnlhbWwgfCAzICsrKwogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9yZW1vdGVwcm9jL210ayxzY3AueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL210ayxzY3AueWFtbAppbmRleCBlMTc5M2E4NWU2MTAu
LmIwNTAzMTQ2ZDdmZSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3JlbW90ZXByb2MvbXRrLHNjcC55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9yZW1vdGVwcm9jL210ayxzY3AueWFtbApAQCAtNDIsNiArNDIsOSBAQCBwcm9w
ZXJ0aWVzOgogICBpbnRlcnJ1cHRzOgogICAgIG1heEl0ZW1zOiAxCiAKKyAgbWVtb3J5LXJlZ2lv
bjoKKyAgICBtYXhJdGVtczogMQorCiByZXF1aXJlZDoKICAgLSBjb21wYXRpYmxlCiAgIC0gcmVn
Ci0tIAoyLjM2LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
