Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AE1C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 21:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aPBUDYeQ5CbrtpmZoMn0gA5/cDPfdiqg6sMnhkkjVoI=; b=KxsvKuBccGE2p4
	W3PsDnK46zfEqDVrywJaP4lCD7oV6by2WQRU7O2Xvzox+VXT4XmrtdiUVgyspqXMWsqIRtQnZ6Las
	TAd3KQCUmqvXFgVbQ9ohJU+KXAnZZxcG5/f1EeRnvtfb8qixNDkx9CggjlUdHg9342FBgpSaBsnB3
	uMptwkNvtizy5JTUlmAxGrZqn2Hr9r4E4SOsXHOB4hwWEn4wHn4/4UmcwBVdLWrmnRePy2zGji6BJ
	Sj+h6ogaijLt8Uej4DmtZ1TcXGs0+7EKn6GINfmcvSH9ZvJytF78Tv3AiEC2a55E0IbxubdWPrCNm
	OaKqeuvpAEc1QZKXtq4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkXu2-00Cjtu-Rg; Fri, 29 Apr 2022 21:11:50 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkXtd-00CjkX-UX; Fri, 29 Apr 2022 21:11:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 8384A1F469E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651266684;
 bh=M4PKB7Pt1wtHjyvgT7kprcmuUgppO8szgoIad51yx9c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wl77Ok5b3IK3LDT0M2d7Yk0V5PV38zHEL1zVj2XHPrQqs/jmFV7V3wqBjZ4RJE7Xz
 C5BriECYW80aHA9eVOLBHDTASK562vHHtUtKagRiUb4yqm2MYYS1gMITNHSPqR3P23
 9qbjmw0yAOTxMFCEllAyrnIcGmRvORrtZSR3tPc0YgVXUQptzm+zcHnsTicOcB9/Hg
 35SwPgoJGrHPYDm2Y1nsRVFZrjgEIHfEaRtiBZC/X2KdAEPTc27xndRa//BTVxGeaf
 SfksPiozhMk2QPvAxUHLO7fI5084icjuFg5vGEflLIE5hYFuuoAe6sh1yano/gGP+e
 OAh9c4zhQOZug==
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
Subject: [PATCH 2/2] dt-bindings: remoteproc: mediatek: Add optional
 memory-region to mtk, scp
Date: Fri, 29 Apr 2022 17:11:10 -0400
Message-Id: <20220429211111.2214119-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220429211111.2214119-1-nfraprado@collabora.com>
References: <20220429211111.2214119-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_141126_184131_5D911202 
X-CRM114-Status: UNSURE (   9.13  )
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
YWJvcmEuY29tPgotLS0KCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3Rl
cHJvYy9tdGssc2NwLnlhbWwgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3Rl
cHJvYy9tdGssc2NwLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVt
b3RlcHJvYy9tdGssc2NwLnlhbWwKaW5kZXggZWM5ZGRlYjZjYTJjLi42NGE5ZDJjN2VkMGQgMTAw
NjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL210
ayxzY3AueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3Rl
cHJvYy9tdGssc2NwLnlhbWwKQEAgLTUxLDYgKzUxLDEwIEBAIHByb3BlcnRpZXM6CiAgIGludGVy
cnVwdHM6CiAgICAgbWF4SXRlbXM6IDEKIAorICBtZW1vcnktcmVnaW9uOgorICAgICRyZWY6IC9z
Y2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUKKyAgICBkZXNjcmlwdGlvbjog
cGhhbmRsZSB0byByZXNlcnZlZCBtZW1vcnkgcmVnaW9uLgorCiByZXF1aXJlZDoKICAgLSBjb21w
YXRpYmxlCiAgIC0gcmVnCi0tIAoyLjM2LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
