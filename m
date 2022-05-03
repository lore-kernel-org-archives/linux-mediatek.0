Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4180CC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 21:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bcr2hFmNQUHGqwaGrvkoqcVw4vVM90sqga6gDz0fSqY=; b=uqD/ojDggILMlP
	lxexXLvs5BMN7CD/cp92QQGxt5VBEJYrEyks160wW3YMxVnnJDKfP+YNWhRRUF2eZAgQrzYLNh7sz
	uRalrkjRLQJ4vQpRWMLcm52/JLP4WMRUN2i8EJL89Iuo8CeGtF2gTgBp1G20qusPOBBBYw1+0YBMs
	p+0J02M+kzGD8VswBLDWRRpyWUSMv+BJ44qwoN5J/Jm+PBOpmeRIl41RZ0AliXOkzKdtrqVV7NvCq
	IDHWj7YImbbYGd0GPKEY9airWb6q14S4E2ErLaFKlsKnl1z46PSedhBhP/KSf25SovI6COdnLwG1y
	8VACkczdAi7KdYrtHPrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlzo3-007isS-0H; Tue, 03 May 2022 21:11:39 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlznr-007inH-DG; Tue, 03 May 2022 21:11:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 613F91F41693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651612286;
 bh=b6/DfUMzFN0FDTboudtmnTW/K0RtsVzlnmRHB0NutEY=;
 h=From:To:Cc:Subject:Date:From;
 b=HP96vztyI0eC4J/ls+gpZ/TFO5BN2+VM6gebHlvDI371amS3BySvEreWV+QMIc6yd
 b2NtPVywkw3RJRFgZdAH5JvlOMI8eCXw5hWdt1Z+yKh3Ee3TJu/gxjeDipTMz48oHO
 GV1R6cR4urofebnSpAjOORHVzAZsX1pDslrY/J3CbXcwHU8fgYirWmloCSi3y6YceQ
 KrqgaMuI3N5n+7T3tebwLGrwLm85gx/kt4JEEKWOGpzJJpvOOJMsXjnvj4y/lniGNJ
 xm1EVbZLC9d0lC7pCGlbn5ugFtv7+DxnCPIq71J0JfgHL7dRUKZWznYz2R5v1RyCgS
 1URLtOiA07FQw==
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
Subject: [PATCH v3 0/2] Mediatek SCP dt-binding tweaks
Date: Tue,  3 May 2022 17:11:12 -0400
Message-Id: <20220503211114.2656099-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_141127_618744_FB7CB2F1 
X-CRM114-Status: UNSURE (   8.35  )
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

ClR3byBzaW1wbGUgcGF0Y2hlcyBmb3IgdGhlIE1lZGlhdGVrIFNDUCBkdC1iaW5kaW5nLiBUaGUg
Zmlyc3QgZml4ZXMgdGhlCnJlZy9yZWctbmFtZXMgcHJvcGVydHkgd2hpbGUgdGhlIHNlY29uZCBh
ZGRzIGEgbmV3IG9wdGlvbmFsCm1lbW9yeS1yZWdpb24gcHJvcGVydHkuCgp2MjogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwNTAyMTkyNDIwLjI1NDg1MTItMS1uZnJhcHJhZG9AY29s
bGFib3JhLmNvbQp2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwNDI5MjExMTEx
LjIyMTQxMTktMS1uZnJhcHJhZG9AY29sbGFib3JhLmNvbQoKQ2hhbmdlcyBpbiB2MzoKLSBNYWRl
IHRoZSBjZmcgcmVnIHJlcXVpcmVkIGFnYWluLiBBZnRlciBsb29raW5nIGFnYWluIGludG8gdGhl
IG10ay1zY3AKICBkcml2ZXIsIG9ubHkgbDF0Y20gaXMgb3B0aW9uYWwuCgpDaGFuZ2VzIGluIHYy
OgotIERyb3BwZWQgdHlwZSBhbmQgZGVzY3JpcHRpb24gZnJvbSBtZW1vcnktcmVnaW9uIHNpbmNl
IGl0J3MgYQogIHdlbGwta25vd24gcHJvcGVydHkKLSBTZXQgbWVtb3J5LXJlZ2lvbiBtYXhJdGVt
cyB0byAxCgpOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyAoMik6CiAgZHQtYmluZGluZ3M6IHJlbW90
ZXByb2M6IG1lZGlhdGVrOiBNYWtlIGwxdGNtIHJlZyBvcHRpb25hbCBmb3IgbXRrLHNjcAogIGR0
LWJpbmRpbmdzOiByZW1vdGVwcm9jOiBtZWRpYXRlazogQWRkIG9wdGlvbmFsIG1lbW9yeS1yZWdp
b24gdG8KICAgIG10ayxzY3AKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL210
ayxzY3AueWFtbCAgICAgICAgICB8IDkgKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKLS0gCjIuMzYuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
