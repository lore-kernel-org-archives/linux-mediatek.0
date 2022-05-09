Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B0DC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 20:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zNh04+IqjaHRFS+LmBAVYjU2Qnp6rsd1aF/u2jxSWxQ=; b=ko5lIk9Z+9r2hc
	qxgDH2bNMU1hjwUDCkNQbcOO4z0WRTugCRMjAD3xdSaxJOcwoR3L/JaooiKj3IDzD0S4RsLbtcRGv
	RndqDGO8lU/SAt32cvPo64+RGIDDdy6o9hJx4ckKOIyGBbsz1GuDZv6SghZGM3Jg71ACVf6ecSRHb
	bNV7110Rfmo96UTvRiYEruAjKuIkbE3LYigCVNTCcjUtYD1tAu8+LuU67HBHG3bV+VDoq87XGkzoX
	UfEJb4W+BSV5EoiuBeHbLvAu96ktqM7+HGJORCp9BVl+XFxWDA5ShSiY6kLliUlAekfLwemVQ5PFM
	7YRJEs0K/Ky/jdQ7bf4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noATE-00GFCX-0L; Mon, 09 May 2022 20:59:08 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noAT2-00GF8A-KP; Mon, 09 May 2022 20:58:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 564EA1F42F48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652129932;
 bh=j+wdfrc3FXi43X0VkODadFay6bg9FKNBstYCTMpecA8=;
 h=From:To:Cc:Subject:Date:From;
 b=U74Ljn728Csp+ET2xThho9d1REqGnsswajm8GHfb67k2/RQZQWrjH38iHELrF44Nj
 xjNY6xlKH4B+68AQjDzJ4U9UXWZJZvRQXVg+CE577q+KjYL03FmMa/3TLtBWPFbaJc
 CZtRlFSbP4P6LvKc4+03hk9wBfEX4V83iyBOVw4o1AuuX92sETE6/YrYOK5HC+RLse
 usJnlXHQmatb4Tr1cmtTPqJ7rXIY3//R6J9m5ZXiAvwzZW6PwC2awkxQcnstozW5iT
 i1yFHZ/MGA/PZzO3rWICOJ8hBGFEU41lmBA6aSosZ+mnNFsx4iQ1oOlQOIjrv9EE/V
 Tc+X6cFr8gC1Q==
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
Subject: [PATCH v2] ASoC: dt-bindings: mediatek: mt8192: Add i2s-share
 properties
Date: Mon,  9 May 2022 16:58:47 -0400
Message-Id: <20220509205847.607076-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_135856_923634_71C689EA 
X-CRM114-Status: GOOD (  12.20  )
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

VGhlIE1lZGlhdGVrIEFGRSBQQ00gY29udHJvbGxlciBmb3IgTVQ4MTkyIGFsbG93cyB0d28gSTJT
IGludGVyZmFjZXMgdG8Kc2hhcmUgdGhlIHNhbWUgY2xvY2sgYW5kIGFjdCBhcyBhIHNpbmdsZSBp
bnRlcmZhY2Ugd2l0aCBib3RoIGlucHV0IGFuZApvdXRwdXQuIEFkZCBwYXR0ZXJucyBmb3IgdGhl
c2UgcHJvcGVydGllcyBpbiB0aGUgZHQtYmluZGluZy4gVGhlCnByb3BlcnR5IGlzIHNwbGl0IGlu
dG8gdHdvIHBhdHRlcm5zIGluIG9yZGVyIHRvIGFsbG93IGFsbCB2YWxpZAppbnRlcmZhY2UgcGFp
cmluZ3MuCgpTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRv
QGNvbGxhYm9yYS5jb20+CgotLS0KVGhlIHNlcmllcyBmcm9tIHYxIG9mIHRoaXMgcGF0Y2ggd2Fz
IG1lcmdlZCBhbHRob3VnaCBzb21lIGNoYW5nZXMgd2VyZQpzdGlsbCBuZWVkZWQgaW4gdGhpcyBw
YXRjaCwgc28gdGhlIHYxIG9mIHRoaXMgcGF0Y2ggd2FzIHJldmVydGVkIFsxXSBhbmQKdGhpcyBz
dGFuZGFsb25lIGNvbW1pdCBhZGRyZXNzZXMgdGhlIGZlZWRiYWNrIGZyb20gdjEgYW5kIHJlYWRk
cyB0aGUKcHJvcGVydHkuCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwNTA5
MTg1NjI1LjU4MDgxMS0xLW5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tCgp2MTogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjIwNDI5MjAzMDM5LjIyMDc4NDgtMi1uZnJhcHJhZG9AY29sbGFi
b3JhLmNvbS8KCkNoYW5nZXMgaW4gdjI6Ci0gQWRkZWQgIm1lZGlhdGVrLCIgcHJlZml4IHRvIHBy
b3BlcnR5Ci0gUmV3cm90ZSBhbmQgYWRkZWQgbW9yZSBpbmZvcm1hdGlvbiB0byBwcm9wZXJ0eSBk
ZXNjcmlwdGlvbgotIFNwbGl0IGludG8gdHdvIHBhdHRlcm5zIHRvIHZhbGlkYXRlIHRoYXQgb3V0
cHV0LWlucHV0IHBhaXJpbmdzIGFyZQogIGRvbmUKCiAuLi4vYmluZGluZ3Mvc291bmQvbXQ4MTky
LWFmZS1wY20ueWFtbCAgICAgICAgICAgfCAxNiArKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgMTYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zb3VuZC9tdDgxOTItYWZlLXBjbS55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210ODE5Mi1hZmUtcGNtLnlhbWwKaW5kZXggN2EyNWJj
OWI4MDYwLi4yYWJmNDNjNmMyYzMgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zb3VuZC9tdDgxOTItYWZlLXBjbS55YW1sCisrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9tdDgxOTItYWZlLXBjbS55YW1sCkBAIC01NCw2ICs1
NCwyMiBAQCBwcm9wZXJ0aWVzOgogICAgICAgLSBjb25zdDogYXVkX2luZnJhX2NsawogICAgICAg
LSBjb25zdDogYXVkX2luZnJhXzI2bV9jbGsKIAorcGF0dGVyblByb3BlcnRpZXM6CisgICJebWVk
aWF0ZWssaTJzWzEzNTc5XS1zaGFyZSQiOgorICAgIGRlc2NyaXB0aW9uOgorICAgICAgRWFjaCBJ
MlMgaW50ZXJmYWNlIGhhcyBhIHNpbmdsZSBkYXRhIGxpbmUsIGlucHV0IGlmIGl0cyBpbmRleCBp
cyBldmVuIG9yCisgICAgICBvdXRwdXQgaWYgdGhlIGluZGV4IGlzIG9kZC4gQW4gaW5wdXQgYW5k
IGFuIG91dHB1dCBJMlMgaW50ZXJmYWNlIGNhbiBiZQorICAgICAgdXNlZCB0b2dldGhlciBhcyBp
ZiB0aGV5IHdlcmUgYSBzaW5nbGUgSTJTIGludGVyZmFjZSB3aXRoIGJvdGggaW5wdXQgYW5kCisg
ICAgICBvdXRwdXQgZGF0YSBsaW5lcyBieSBzaGFyaW5nIHRoZSBzYW1lIGNsb2NrLiBUaGlzIHBy
b3BlcnR5IHJlcHJlc2VudHMgdGhpcworICAgICAgcGFpcmluZy4gVGhlIHZhbHVlIHNob3VsZCBi
ZSB0aGUgbmFtZSBvZiB0aGUgaW50ZXJmYWNlIHdob3NlIGNsb2NrIGlzCisgICAgICB1c2VkLCBh
bmQgdGhlIHByb3BlcnR5IG5hbWUgdGhlIG90aGVyIGludGVyZmFjZSB0aGF0IGRlcGVuZHMgb24g
dGhpcworICAgICAgY2xvY2suCisgICAgcGF0dGVybjogIl5JMlNbMDI2OF0kIgorCisgICJebWVk
aWF0ZWssaTJzWzAyNjhdLXNoYXJlJCI6CisgICAgZGVzY3JpcHRpb246IFNhbWUgYXMgYWJvdmUu
CisgICAgcGF0dGVybjogIl5JMlNbMTM1NzldJCIKKwogcmVxdWlyZWQ6CiAgIC0gY29tcGF0aWJs
ZQogICAtIGludGVycnVwdHMKLS0gCjIuMzYuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
