Return-Path: <SRS0=uiJf=BH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE1FC433E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 12:34:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 410882070B
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 12:34:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IJRzTMhg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HeBTeN8J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="XQV5K0dV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 410882070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wZtFb08SiH9S8NkgQcLnjDqinmAy4AKAIJdt858k/Ec=; b=IJRzTMhg50kiMuBO4oqQpuIzWR
	H/4GitNLQfgRnJ8JG1Ab5pBUAgQZ4+raWsb5xV5CkamKDN8Ff4b26M2I+59SLedO1MN0E06krxOYj
	oZ9W5dPhJda8Nuu+ddmU4chuYG9/8G98m9FFguWDPUkqltGgadr79aPhCNvsJmfc9kJklGaFhUGqi
	bU4TaLkchZcWmyDHjaO8Ha/TgfsQKQLHDGKmaCA/BGhf68mYM64P1yKUVnVtjDuLPtWMJS5pLFwH4
	ibjM2JvMVgWo8/3Xg4e05WKN0lN+LH4r7jsYQiNc1sc5gP2Qv8EOOtuWySfuRt+wBdSzUNZC7G4SX
	T5H5xO3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0OoK-0003Nd-7q; Tue, 28 Jul 2020 12:34:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0OoJ-0003Mq-5y; Tue, 28 Jul 2020 12:34:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=cBZ/bILTGURooh2/l8xNDLfq8b71aashM/aCdpv45hY=; b=HeBTeN8JZToVmAiDW8sZHTJ44c
 dOngnPxtXUjh5A4tz5YC1+FyN1MOb/ZQLirxoyjmM99QcGf67N6eB5r1f2sL2Ky8W893exu3Jt8kt
 /vfX58MkglNAOgzJL2tGKjV7pWtDV4lEMj8wkKgdZX6XJ04ZuHrdPOYaiPvIvF20+kkY4IHRIfYYw
 aRDG2yOqfdPk7m2qEc1jSipNx4em2rmEA1ptVMw+xcP0g37CD/CsmoVKPGnkQyHL28kmJTZM7ehet
 UyWbc5vasy9iZX1zjkSyigVWIUY54ZVWTY+y+4B1EL/dPtDpL6y9cNfVScxSaoVsB4pE70OcQzmbB
 mtJ5euXg==;
Received: from mout.gmx.net ([212.227.15.15])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0OoF-0002KM-B9; Tue, 28 Jul 2020 12:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1595939646;
 bh=+Xhr2x2VYD1gWTmsb4Uofj+UiBxI7DdvuosyZzVaUM4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=XQV5K0dVM2zwQ0itCwzNqrNrIO/Ko1wE7Yymlnc5KjXU68AMT83wl6HzqbZP/1Pyu
 tQ+KgfD8CE9U1GMBHpnzDXT00OcT9m82GbDeK/z2RIvwo5NchMPn9nDADLXaFGJNXH
 MU7ZVpZ6Kkl02XEZ09j9TjmjoCFmPPNysH+MNz8M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([80.208.215.239]) by mail.gmx.com
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MmlXA-1kScia3yWE-00jsa8; Tue, 28 Jul 2020 14:28:19 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v3] net: ethernet: mtk_eth_soc: fix mtu warning
Date: Tue, 28 Jul 2020 14:27:43 +0200
Message-Id: <20200728122743.78489-1-frank-w@public-files.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:sc5b1pOFKi3FLEOULKn4OozLSQed687rhOjKqf+XCSsSamY2PgS
 2JzFzyIi+ztuNLr94TkKDcwv0V8CQVVgeRKACmKp1sOgDjY8lWDHTRhJEMdJ/ZdmLtdPzEY
 cpxqGiswcGavM06bTX+Y0XB7iBhQhFTK5u1HoAKmuv4zSkW3djqLkiVs66c7HgTDaGRA8G4
 K7il9Y7OEKrorNMSU9CNw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pyvFYCDbX9g=:HE5yGDJZqbkR/kZFvvwzlJ
 bWe4LmQj/v7lzRixljiqnnSKeN5OVyqMbk8Jkkpj8K2SvWvHt1lBLVq0QJK+k57dtmuH2K+ju
 gmtXijXStOZsL+7O3PpVqCEVR27igExJoK7w+cpTebHnEykI4ln4Jp2g3B037Vo6ALrAOLd/F
 aZFt4SRoOGNWB/noZUDZ24USZlXZM0+eu3IYHBcxk6cgDtQHY3vWoY/tg/D/0jarNolhV3V2C
 bXKoKZhj9h9V9nVTh3ZM6N5jMaNV2Bd2crRJIc+VZdmir2kXgyhgsladDk9XAGeTHdbo4T+NW
 y5WyXeNYJW1aiGDeo8ydw5LUrts7SAK/uTQrtnIvZFLqCRxXfWoB4nA73WBArtKekq87AyXo1
 Me4RdGqmjULVovD1f1bgy96hznCOLkvBaO0c0MH87BDquMcE9QKHPh13kw/8PQTlaJUCNvBPO
 JQzqrdnCe3bAHzxhHGVHEFltNyjVtsPmqMfiLK9wVQ4w88Rfz+5Fi4Qwpkb7EkuvvMuGWyLvQ
 n00QMChF0jZb8lj9aRaP3tSleahljraU1o2hxHvpNozuH1sx6WquPW2Mq2segO53GztqdS6vN
 CflmLt63Kypneo9iqVE+xJHVV3TVTqYY7pVG2rck/DxIdxKDoZgnB1rgfeSJgOqibou/WKiSn
 rAhwIruhU+McPNR/ARTFT0apLcggJWtWDHhuFMyjoPqXCZErd9rSENnunA7BOsrab3i+3hDYH
 8s0bWBcJk7J+RWwTm/sLS3ekbVv2K7gxFdcnxLfatzWuzSiwLtmdFbEkapLlSttX6J5KDXQhF
 peeT/ByMtOwtXR1R21zkcJs1cJ/8ab/spVAMSvcqIZy5ypuiYJ85zeVBrpM9tjfPriNhaHGLF
 mZO1y98+3EzoGJsFR6msXLnIZ7jAY89vrJswtzmzQu+1I/vccP8t/sFdHisjr0uxawawTtO53
 EWE69BAIW0pYMqSC/3C4QAzbtZxYZF1U/XlvLIJGfwh7W6risfdEiUutbP3ERSypt8k5FLg71
 MCPn5eQoO0baQT0M9x4Y8MwQC4y/mD4UgDpWuHGZ8+N7nDRYQEQU1m037oWYF+yoeDSijAXE4
 5dHE24PdlT5uElHcqdfhZ15iG/FIeSDi4wMJ0iMbp16k3jjCRMKoPGu5+CUEFI6fmy7BaGmFd
 0CbFDiNe7va9c7zPTew7ulvdILToxBt68fqskXtSgoyAnNQpF/Ydo+nV8rHRw3xmivDOShJ2U
 xV1Fwj6bEFHo6mQgIhRG8lasxjLn7mGgIVMPq3Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_133419_960838_40E54265 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Landen Chao <landen.chao@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RnJvbTogTGFuZGVuIENoYW8gPGxhbmRlbi5jaGFvQG1lZGlhdGVrLmNvbT4KCmluIHJlY2VudCBL
ZXJuZWwtVmVyc2lvbnMgdGhlcmUgYXJlIHdhcm5pbmdzIGFib3V0IGluY29ycmVjdCBNVFUtU2l6
ZQpsaWtlIHRoZXNlOgoKZXRoMDogbXR1IGdyZWF0ZXIgdGhhbiBkZXZpY2UgbWF4aW11bQptdGtf
c29jX2V0aCAxYjEwMDAwMC5ldGhlcm5ldCBldGgwOiBlcnJvciAtMjIgc2V0dGluZyBNVFUgdG8g
aW5jbHVkZSBEU0Egb3ZlcmhlYWQKCkZpeGVzOiBiZmNiODEzMjAzZTYgKCJuZXQ6IGRzYTogY29u
ZmlndXJlIHRoZSBNVFUgZm9yIHN3aXRjaCBwb3J0cyIpCkZpeGVzOiA3MjU3OWUxNGExZDMgKCJu
ZXQ6IGRzYTogZG9uJ3QgZmFpbCB0byBwcm9iZSBpZiB3ZSBjb3VsZG4ndCBzZXQgdGhlIE1UVSIp
CkZpeGVzOiA3YTRjNTNiZWUzMzIgKCJuZXQ6IHJlcG9ydCBpbnZhbGlkIG10dSB2YWx1ZSB2aWEg
bmV0bGluayBleHRhY2siKQpTaWduZWQtb2ZmLWJ5OiBSZW7DqSB2YW4gRG9yc3QgPG9wZW5zb3Vy
Y2VAdmRvcnN0LmNvbT4KU2lnbmVkLW9mZi1ieTogRnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0Bw
dWJsaWMtZmlsZXMuZGU+Ci0tLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX2V0
aF9zb2MuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRlay9tdGtfZXRoX3NvYy5jIGIvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX2V0aF9zb2MuYwppbmRleCA4NTczNWQzMmVjYjAu
LmExYzQ1YjM5YTIzMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsv
bXRrX2V0aF9zb2MuYworKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRlay9tdGtfZXRo
X3NvYy5jCkBAIC0yODkxLDYgKzI4OTEsOCBAQCBzdGF0aWMgaW50IG10a19hZGRfbWFjKHN0cnVj
dCBtdGtfZXRoICpldGgsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCiAJZXRoLT5uZXRkZXZbaWRd
LT5pcnEgPSBldGgtPmlycVswXTsKIAlldGgtPm5ldGRldltpZF0tPmRldi5vZl9ub2RlID0gbnA7
CgorCWV0aC0+bmV0ZGV2W2lkXS0+bWF4X210dSA9IE1US19NQVhfUlhfTEVOR1RIIC0gTVRLX1JY
X0VUSF9ITEVOOworCiAJcmV0dXJuIDA7CgogZnJlZV9uZXRkZXY6Ci0tCjIuMjUuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
