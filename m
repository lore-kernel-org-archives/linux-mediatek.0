Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24E2C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 19:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a/9di6EKy2bWe6T6IoRGhxc5ZtRUjMknkSghYj1YtGY=; b=EPqp3nQ1sDzJZN
	bGhyfhLdUfd9RlSbbfpJoOl5OcUALpkPldp2NVEOJPALzKu/qUxWioUHNqn58qg/Jp9VZZXicNgnF
	keMZXoCWb2EHhal1eLoAbExp8+OyEHtVuNL8RKMdygpUOI3YVzwsGYG4sosa8W0ncjeNIHcpdddE3
	84Du6RYUyEyJuddoJceiX+ORVFwlj59ct+ZRy+g5XwVS9ALwmHWFToAvtAo3fyBYsixFffvw6hK4k
	a4OzcCEfY0D4skVQJKM3K0n9FhwlicZQpUWG99R1yqtApWXaDqy78rX0diQ56B4su3T2/Jmcxg6A2
	mf1x/qmH2g3e9IGJlfKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nosQw-008Q1k-2u; Wed, 11 May 2022 19:55:42 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nosQJ-008PpG-AA; Wed, 11 May 2022 19:55:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 5BD6F1F42D8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652298902;
 bh=zQZ+FBCWSprK14b9f7+B4iUx3u3Er37+OdCYjvtcX5s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A2is1EEeIztWNbTHLyTN0kLL+MyA0BsJpq3tgeiSI8YhXOYDtkaZwh2onLuFzL0P4
 VL1j/FuYTtMRhK8jc6W7RSChLYNYB8Az7CIaNw2CTOd5bRkKFrDywjoSuzevAlvYJ6
 hHt86mDxne/Rt67YPPP3t90ACYCpbGeHR7TXLmOi03ivgaPXGX2qCL0W9STx6nM5F3
 lavThUrHAQdGlzbyKXHMK8kgyTWijFZugM1c64hhcN7TSQaMPof5wQOmuJ3a8xqnk5
 RTfrdv816BOvukNl6FURkBLWbHVzR5QktOi3HEoNdHX82lIabJlBlH14gRwbhbBWlh
 GnUAcqXJeuJjA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Tinghan Shen <tinghan.shen@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-remoteproc@vger.kernel.org
Subject: [PATCH v5 2/2] dt-bindings: remoteproc: mediatek: Add optional
 memory-region to mtk, scp
Date: Wed, 11 May 2022 15:54:52 -0400
Message-Id: <20220511195452.871897-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511195452.871897-1-nfraprado@collabora.com>
References: <20220511195452.871897-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_125503_529556_3819EA43 
X-CRM114-Status: UNSURE (   9.28  )
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
dHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL210ayxzY3AueWFtbAppbmRleCA4MzIwNjRkNjM1YjMu
LmVlYzNiOWM0YzcxMyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3JlbW90ZXByb2MvbXRrLHNjcC55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9yZW1vdGVwcm9jL210ayxzY3AueWFtbApAQCAtNTQsNiArNTQsOSBAQCBwcm9w
ZXJ0aWVzOgogICAgICAgZmlybXdhcmUgc2VhcmNoIHBhdGggY29udGFpbmluZyB0aGUgZmlybXdh
cmUgaW1hZ2UgdXNlZCB3aGVuCiAgICAgICBpbml0aWFsaXppbmcgU0NQLgogCisgIG1lbW9yeS1y
ZWdpb246CisgICAgbWF4SXRlbXM6IDEKKwogcmVxdWlyZWQ6CiAgIC0gY29tcGF0aWJsZQogICAt
IHJlZwotLSAKMi4zNi4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
