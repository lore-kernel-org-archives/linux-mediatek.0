Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790B3C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 21:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t6WsgFo3eRRfCck2rJZwsNLbVHIbCJ8C+LGyCGDvTjc=; b=kLjQmmjfap7LLw
	8zxXplbqLTFnK9vGNC2qTj71OPtfPR6cqjvJEB1lAsMaEuOB2yEl3nn4t/Fvi1FwU8xf3GzkIXcoQ
	0hrQPXrVA4NWtO6cpfjMaw3P98pYZd7m6SawsWyP66N5BvwchH6dSibvIXPUYf096YBy5p+4FRhc4
	aPz4KuPWvAGHTmq9F+GpnpQ4DeTEnu1c/BnSvaSmUYDlsSA/JqHVRGNGz6SIUfuwh62luminccq3t
	V3VENzHlaeysvBVAUUBdC3dP8kmIrXaDCfGhFKdL5QkLC0rHzJfwYZw34VWTTv1XQHpu2JKGA5iHX
	fVTkHdrc+4ZKS9YEQCsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlzoM-007j1t-Hu; Tue, 03 May 2022 21:11:58 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlznu-007ip1-Mn; Tue, 03 May 2022 21:11:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 23E1E1F41A29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651612289;
 bh=mA7otPzGgHa0tglo/3X5LMpk0p4zRAjSBL46I5ES5B0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g4oVUtAJqNan5Xqyyf1UK2A5CbBf5KW9gGiTSWJKhPqQMA+NgjhhTeh6/DoS/YoPN
 cGV/azRfLY1xCcx0YckY2n0Ct/I+ea0LO01IoUoLHTaNXSSMFa0JKBDmD0z+XhvTy1
 WXscXMtcZHcozEVqQ3zU0g0m5QATlaTKFqqFEEnUnb8lTJamgdMA+yVbixowSjrvOL
 f4oXfcG8CHzqYKB5biOUAyLq1i6Dtu32dMmcnfTdTPXk1BGp/FebsXgSHH+tZPeh8v
 4gtRoKkR7QMuJ3pGq8QauUwFIeBVbeRisIjA8dnJmmPQc8PkUfuNIke3bYpcspL0EB
 HZKIVmoLR5qpg==
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
Subject: [PATCH v3 2/2] dt-bindings: remoteproc: mediatek: Add optional
 memory-region to mtk, scp
Date: Tue,  3 May 2022 17:11:14 -0400
Message-Id: <20220503211114.2656099-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220503211114.2656099-1-nfraprado@collabora.com>
References: <20220503211114.2656099-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_141130_956106_F95590D3 
X-CRM114-Status: UNSURE (   9.39  )
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
dHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL210ayxzY3AueWFtbAppbmRleCBlZWVhODQzNzlhMWUu
LjM5NWM4MGJjZTcxMyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3JlbW90ZXByb2MvbXRrLHNjcC55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9yZW1vdGVwcm9jL210ayxzY3AueWFtbApAQCAtNDcsNiArNDcsOSBAQCBwcm9w
ZXJ0aWVzOgogICBpbnRlcnJ1cHRzOgogICAgIG1heEl0ZW1zOiAxCiAKKyAgbWVtb3J5LXJlZ2lv
bjoKKyAgICBtYXhJdGVtczogMQorCiByZXF1aXJlZDoKICAgLSBjb21wYXRpYmxlCiAgIC0gcmVn
Ci0tIAoyLjM2LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
