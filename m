Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24756C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 May 2022 19:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iv17+fTvNvxvR+DE/hprG4BPc+GTl+ynkP4Tc3AOvt4=; b=uEG7aqQaJor2x7
	lpWCN6SGk76+aC8V6svBfCBu9mn1sPEZ2ufkucw4s8aq/eeQVyNVJl8nKgav4NdvXRnO4jpq4lI6l
	sgaboeWB9p3KwtuGav7xixHOVAV2aYRnyefFe3Z8Vxwk03k4VrkCaqXRsK3nn7v1rnno1nEvmW6FW
	qdoVJYWuDMrd6hqVOWQnqrmjZM5Z5rMkQpQ6hZsWczdZx9yhULTBEnppv+QSgxB0rP6BSROf/+58M
	tf332T/zO3aK4Z3jngQt7aDvkyZihfKuqYMb9Dm8/+5shLgxT/7cKzxcBH5smwkIzzTJ4U1mgtcNS
	esz3+V/1WBgYrTX7+4cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlbfI-002NX8-7P; Mon, 02 May 2022 19:25:00 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlbep-002NLt-JW; Mon, 02 May 2022 19:24:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id EE26B1F43619
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651519470;
 bh=XkLENWM+R3mXRcAnf7rx6wijc7C/RaUn71isMJVASJk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HVKO8pC3w6eYiPSquxenJQrMYI7U13/cmYQoDDE2VSCGKBJ/xAg0NBA4O+71HpmsD
 zuWLVrPr6/yfdIrfJIFS57Ftw6uinl16vDF9HSpDW9KN5tgHl6TZeYVQMVE6U/egZ6
 vEF9YxbLcFTyv3snK6oipLxlXeOOMSsE3Bb0e2ji7ckTovc83NEXPE32GJNf5xCAOw
 oFDzp7U/ThHiU71zgOO7RiITYVF45QYsoc1ntahTh58PsVMN5s6oC/hOKH+tHqLtzt
 zDz10r44TlOwBM/YVyLpnjOfxRW8PzebHhl6QGVWmukUAjY+LFFr8mDCqSyeOwknf1
 TcusRrYZWtckQ==
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
Subject: [PATCH v2 2/2] dt-bindings: remoteproc: mediatek: Add optional
 memory-region to mtk, scp
Date: Mon,  2 May 2022 15:24:20 -0400
Message-Id: <20220502192420.2548512-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220502192420.2548512-1-nfraprado@collabora.com>
References: <20220502192420.2548512-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_122431_808867_B07F8B30 
X-CRM114-Status: GOOD (  10.10  )
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
YWJvcmEuY29tPgoKLS0tCkkgbGVmdCBvdXQgQW5nZWxvJ3MgUi1iIHNpbmNlIG9mIHRoZSAzIGxp
bmVzIGluIHRoZSBwYXRjaCBmcm9tIHYxLCBvbmx5CjEgaXMgbGVmdC4KCkNoYW5nZXMgaW4gdjI6
Ci0gRHJvcHBlZCB0eXBlIGFuZCBkZXNjcmlwdGlvbiBzaW5jZSBpdCdzIGEgd2VsbC1rbm93biBw
cm9wZXJ0eQotIFNldCBtYXhJdGVtcyB0byAxCgogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3JlbW90ZXByb2MvbXRrLHNjcC55YW1sIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcmVtb3RlcHJvYy9tdGssc2NwLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcmVtb3RlcHJvYy9tdGssc2NwLnlhbWwKaW5kZXggZWM5ZGRlYjZjYTJjLi5jNmE5
MmFjOGRiMTggMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
ZW1vdGVwcm9jL210ayxzY3AueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcmVtb3RlcHJvYy9tdGssc2NwLnlhbWwKQEAgLTUxLDYgKzUxLDkgQEAgcHJvcGVydGll
czoKICAgaW50ZXJydXB0czoKICAgICBtYXhJdGVtczogMQogCisgIG1lbW9yeS1yZWdpb246Cisg
ICAgbWF4SXRlbXM6IDEKKwogcmVxdWlyZWQ6CiAgIC0gY29tcGF0aWJsZQogICAtIHJlZwotLSAK
Mi4zNi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
