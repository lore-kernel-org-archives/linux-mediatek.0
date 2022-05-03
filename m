Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB00C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 21:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=getWqdZwhlqYBuwNR6FFAE8XOpduIpuNqb8JXQu3hjM=; b=G0W9W/+9GNCHJ3
	yxEam4YKfwcUW7HzkoVuk7Euhi9E8dl1a1tbLs18XJ5cd6raykQKW35hGGubHLYvFBk+HMtGrk0Au
	857H+882pS7MNmw+wVUnoqsVRsMtbEkNIrjHy8b6YPH22ruvMnYkfU6TIkT+SnWQxtDxJn6yGedBw
	LN/HMQp5eEbnO6f02XKF4eRwatuan5RrUbufS0OJhyygE26g0if9nl/zdaZJdhja6lsZ8Fb83MXAs
	G+cWkF3y8Luj/GrR1WP9hZA3MbD++zfYGnREOUC5bqeLNP3zzPsc4+PpC13xGNxecCzcSVVxmxDvh
	7NqfS9tdMVR+oRY+3QOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm01l-007mQd-8x; Tue, 03 May 2022 21:25:49 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm01Z-007mMF-QS; Tue, 03 May 2022 21:25:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 046C31F43B53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651613136;
 bh=4LP/jKCMumd2WzQHTLcpeW44tdUtgMXLREom1d6+3d8=;
 h=From:To:Cc:Subject:Date:From;
 b=U6uwvqLWQz1rrgHBmyInvOdwj2a6NsnXgBaLDmfjzuWitxhBVPkxEfKiQ/zHtLaad
 hr0qqA7zPswCSym0S5/b/p4XxmNMhoYHcdqd/lWjegnfnDpXEIcsmEbXNztOynVVhl
 xarPslAab2CEed/rlVqJUSduVQg1MPtDjBk1bf/xxh7kyJzWhTCP3Q0F0bgkA+r8LG
 vVGjtHfiZLqxzlwXdAobGcCXlCaaumMnVUlg3kHCyMm1EAoSDBuYrOT4v9upgAD6uz
 xHJ0H/jA9Fshsxgn3EiV1PSpsN2E/+ZNPegH4r4eDNd+wzvKxd0u9ayFLUxS8daiEu
 Qqw3eEUBib0/w==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: dts: mt8192: Follow binding order for SCP registers
Date: Tue,  3 May 2022 17:25:31 -0400
Message-Id: <20220503212531.2657870-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_142538_030979_16C63B1E 
X-CRM114-Status: GOOD (  11.05  )
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

VGhlIGR0LWJpbmRpbmcgZm9yIFNDUCBkb2N1bWVudHMgdGhlIHJlZy1uYW1lcyBvcmRlciBhcyBz
cmFtLCBjZmcsCmwxdGNtLiBVcGRhdGUgdGhlIFNDUCBub2RlIG9uIHRoZSBtdDgxOTIgZGV2aWNl
dHJlZSB0byBmb2xsb3cgdGhhdApvcmRlciwgd2hpY2ggZ2V0cyByaWQgb2YgYSBkdGJzX2NoZWNr
IHdhcm5pbmcuIFRoaXMgZG9lc24ndCBjaGFuZ2UgYW55CmJlaGF2aW9yIHNpbmNlIHRoZSBTQ1Ag
ZHJpdmVyIGFjY2Vzc2VzIHRoZSBtZW1vcnkgcmVnaW9ucyB0aHJvdWdoIHRoZQpuYW1lcyBhbnl3
YXkuCgpTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNv
bGxhYm9yYS5jb20+CgotLS0KCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5k
dHNpIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIu
ZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kKaW5kZXggMjZk
YmU5ZWNjNTI4Li43MzNhZWMyZTdmNzcgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
bWVkaWF0ZWsvbXQ4MTkyLmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9t
dDgxOTIuZHRzaQpAQCAtNjk5LDkgKzY5OSw5IEBAIHNwaTc6IHNwaUAxMTAxZTAwMCB7CiAJCXNj
cDogc2NwQDEwNTAwMDAwIHsKIAkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLXNjcCI7
CiAJCQlyZWcgPSA8MCAweDEwNTAwMDAwIDAgMHgxMDAwMDA+LAotCQkJICAgICAgPDAgMHgxMDcw
MDAwMCAwIDB4ODAwMD4sCi0JCQkgICAgICA8MCAweDEwNzIwMDAwIDAgMHhlMDAwMD47Ci0JCQly
ZWctbmFtZXMgPSAic3JhbSIsICJsMXRjbSIsICJjZmciOworCQkJICAgICAgPDAgMHgxMDcyMDAw
MCAwIDB4ZTAwMDA+LAorCQkJICAgICAgPDAgMHgxMDcwMDAwMCAwIDB4ODAwMD47CisJCQlyZWct
bmFtZXMgPSAic3JhbSIsICJjZmciLCAibDF0Y20iOwogCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJ
IDQzNSBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+OwogCQkJY2xvY2tzID0gPCZpbmZyYWNmZyBDTEtf
SU5GUkFfU0NQU1lTPjsKIAkJCWNsb2NrLW5hbWVzID0gIm1haW4iOwotLSAKMi4zNi4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
