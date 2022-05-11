Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D87C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 19:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=poaebKVNyD0JAq3XLVxPpQLbYFWaJqXXhRNvuVXq3RY=; b=wca6cLCF5qWdGl
	wlJZAg/iKatAyOIYD+HDxlIeUJHvemaI5/EVJiseruwmRdIu8ch2Po3AXCYiQ/zEgySKP55Se0lfV
	R1j8M5Adf47UMUFLz41cIVNR9wlBeysxaTWiBhL558GS6IhjDGj8gwFr3xlUoD7GTJeeEUsvW9BwF
	83iCbKpuEt4Byv+BntvO2J8wRgGDdLr3HBvd9Q2vj8hX0Tcqd5ddab25pzjbHhYcYvn5Y8/0E2gEo
	KZRbuM67DIFA7zZHz/2sZixlj960Jmh5byaD4tLALllu2ooS7gTxCUqudf9T4PeoAmKzaUI0EArF0
	rpvzJ0IFDZiI1Lu7BPuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nosQw-008Q28-RA; Wed, 11 May 2022 19:55:42 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nosQI-008PoR-T0; Wed, 11 May 2022 19:55:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 26CCF1F42D77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652298900;
 bh=VLQbzFLaTXEJncbmCPeLOgEPWtwIfjpqwoLXWnU3Q3E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XIfu0ALH+UxjUOkJvim0Bvm/Ub8bSd/PbUcqNK7FzhFLuniO8kcOJuB1RlEwxtFXu
 H2vgu5rjVBEf3nBxLW3rJJWx0eZiLVBs0l/74eRgrtj3Z7i/FC0EiAyWEEU1ijnnCl
 D7vWm+nEPZqemsIzVf/VBeX9ztquXeeXy+fg2x1at844oi+q1hO/kwCszd4zr1FVb9
 jo+s5154S+zHB3ARtdprkROY/sUEPMXmNSyd1qTRIoi1ZTY1TX6Y8mS/GLkP5967PK
 JDWs43LeW97o8lbmR/k6tCGUSLtxJE5z85UyhQod4lZHQI92JuIKReIzJFnAgtfwWN
 ufnOCKxUVtzQA==
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
 Tzung-Bi Shih <tzungbi@google.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: remoteproc: mediatek: Make l1tcm reg
 exclusive to mt819x
Date: Wed, 11 May 2022 15:54:51 -0400
Message-Id: <20220511195452.871897-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511195452.871897-1-nfraprado@collabora.com>
References: <20220511195452.871897-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_125503_109877_2D441D0A 
X-CRM114-Status: GOOD (  12.51  )
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

Q29tbWl0IGNhMjNlY2ZkYmQ0NCAoInJlbW90ZXByb2MvbWVkaWF0ZWs6IHN1cHBvcnQgTDFUQ00i
KSBhZGRlZCBzdXBwb3J0CmZvciB0aGUgbDF0Y20gbWVtb3J5IHJlZ2lvbiBvbiB0aGUgTVQ4MTky
IFNDUCwgYWRkaW5nIGEgbmV3IGRhX3RvX3ZhCmNhbGxiYWNrIHRoYXQgaGFuZGxlcyBsMXRjbSB3
aGlsZSBrZWVwaW5nIHRoZSBvbGQgb25lIGZvcgpiYWNrLWNvbXBhdGliaWxpdHkgd2l0aCBNVDgx
ODMuIEhvd2V2ZXIsIHNpbmNlIHRoZSBtdDgxOTIgY29tcGF0aWJsZSB3YXMKbWlzc2luZyBmcm9t
IHRoZSBkdC1iaW5kaW5nLCB0aGUgYWNjb21wYW55aW5nIGR0LWJpbmRpbmcgY29tbWl0CjUwM2M2
NGNjNDJmMSAoImR0LWJpbmRpbmdzOiByZW1vdGVwcm9jOiBtZWRpYXRlazogYWRkIEwxVENNIG1l
bW9yeSByZWdpb24iKQptaXN0YWtlbmx5IGFkZGVkIHRoaXMgcmVnIGFzIGlmIGl0IHdlcmUgZm9y
IG10ODE4My4gQW5kIGxhdGVyCml0IGJlY2FtZSBjb21tb24gdG8gYWxsIHBsYXRmb3JtcyBhcyB0
aGVpciBjb21wYXRpYmxlcyB3ZXJlIGFkZGVkLgoKRml4IHRoZSBkdC1iaW5kaW5nIHNvIHRoYXQg
dGhlIGwxdGNtIHJlZyBjYW4gYmUgcHJlc2VudCBvbmx5IG9uIHRoZQpzdXBwb3J0ZWQgcGxhdGZv
cm1zOiBtdDgxOTIgYW5kIG10ODE5NS4KCkZpeGVzOiA1MDNjNjRjYzQyZjEgKCJkdC1iaW5kaW5n
czogcmVtb3RlcHJvYzogbWVkaWF0ZWs6IGFkZCBMMVRDTSBtZW1vcnkgcmVnaW9uIikKU2lnbmVk
LW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29t
PgoKLS0tCgpDaGFuZ2VzIGluIHY1OgotIE1hZGUgbDF0Y20gb3B0aW9uYWwgZm9yIG10ODE5Mi9t
dDgxOTUKLSBHcmVhdGx5IHNpbXBsaWZpZWQgdGhlIGNvbnN0cmFpbnRzIG92ZXJyaWRlIGluIHRo
ZSBpZjp0aGVuOgotIFVwZGF0ZWQgY29tbWl0IG1lc3NhZ2UKCkNoYW5nZXMgaW4gdjQ6Ci0gUmV3
b3JrZWQgcHJlc2VuY2Ugb2YgbDF0Y20gcmVnIHRvIGJlIGlmOnRoZW46IGJhc2VkIGFuZCBwcmVz
ZW50IG9ubHkKICBvbiBtdDgxOTIvbXQ4MTk1Ci0gUmV3cm90ZSBjb21taXQgbWVzc2FnZQotIEFk
ZGVkIEZpeGVzIHRhZwoKQ2hhbmdlcyBpbiB2MzoKLSBNYWRlIHRoZSBjZmcgcmVnIHJlcXVpcmVk
IGFnYWluLiBBZnRlciBsb29raW5nIGFnYWluIGludG8gdGhlIG10ay1zY3AKICBkcml2ZXIsIG9u
bHkgbDF0Y20gaXMgb3B0aW9uYWwuCi0gQWRkZWQgbWVudGlvbiB0aGF0IGEgZHRic19jaGVjayB3
YXJuaW5nIGdldHMgZml4ZWQgYnkgcGF0Y2ggaW4gY29tbWl0CiAgbWVzc2FnZS4KCiAuLi4vYmlu
ZGluZ3MvcmVtb3RlcHJvYy9tdGssc2NwLnlhbWwgICAgICAgICAgfCA0NCArKysrKysrKysrKysr
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlbW90ZXBy
b2MvbXRrLHNjcC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlbW90
ZXByb2MvbXRrLHNjcC55YW1sCmluZGV4IGFiYzExYWM5MjgxOC4uODMyMDY0ZDYzNWIzIDEwMDY0
NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9tdGss
c2NwLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlbW90ZXBy
b2MvbXRrLHNjcC55YW1sCkBAIC0yMywxMSArMjMsMTMgQEAgcHJvcGVydGllczoKIAogICByZWc6
CiAgICAgZGVzY3JpcHRpb246Ci0gICAgICBTaG91bGQgY29udGFpbiB0aGUgYWRkcmVzcyByYW5n
ZXMgZm9yIG1lbW9yeSByZWdpb25zIFNSQU0sIENGRywgYW5kCi0gICAgICBMMVRDTS4KKyAgICAg
IFNob3VsZCBjb250YWluIHRoZSBhZGRyZXNzIHJhbmdlcyBmb3IgbWVtb3J5IHJlZ2lvbnMgU1JB
TSwgQ0ZHLCBhbmQsCisgICAgICBvbiBzb21lIHBsYXRmb3JtcywgTDFUQ00uCisgICAgbWluSXRl
bXM6IDIKICAgICBtYXhJdGVtczogMwogCiAgIHJlZy1uYW1lczoKKyAgICBtaW5JdGVtczogMgog
ICAgIGl0ZW1zOgogICAgICAgLSBjb25zdDogc3JhbQogICAgICAgLSBjb25zdDogY2ZnCkBAIC01
NywxNiArNTksMzAgQEAgcmVxdWlyZWQ6CiAgIC0gcmVnCiAgIC0gcmVnLW5hbWVzCiAKLWlmOgot
ICBwcm9wZXJ0aWVzOgotICAgIGNvbXBhdGlibGU6Ci0gICAgICBlbnVtOgotICAgICAgICAtIG1l
ZGlhdGVrLG10ODE4My1zY3AKLSAgICAgICAgLSBtZWRpYXRlayxtdDgxOTItc2NwCi10aGVuOgot
ICByZXF1aXJlZDoKLSAgICAtIGNsb2NrcwotICAgIC0gY2xvY2stbmFtZXMKK2FsbE9mOgorICAt
IGlmOgorICAgICAgcHJvcGVydGllczoKKyAgICAgICAgY29tcGF0aWJsZToKKyAgICAgICAgICBl
bnVtOgorICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxODMtc2NwCisgICAgICAgICAgICAtIG1l
ZGlhdGVrLG10ODE5Mi1zY3AKKyAgICB0aGVuOgorICAgICAgcmVxdWlyZWQ6CisgICAgICAgIC0g
Y2xvY2tzCisgICAgICAgIC0gY2xvY2stbmFtZXMKKworICAtIGlmOgorICAgICAgcHJvcGVydGll
czoKKyAgICAgICAgY29tcGF0aWJsZToKKyAgICAgICAgICBlbnVtOgorICAgICAgICAgICAgLSBt
ZWRpYXRlayxtdDgxODMtc2NwCisgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE4Ni1zY3AKKyAg
ICB0aGVuOgorICAgICAgcHJvcGVydGllczoKKyAgICAgICAgcmVnOgorICAgICAgICAgIG1heEl0
ZW1zOiAyCisgICAgICAgIHJlZy1uYW1lczoKKyAgICAgICAgICBtYXhJdGVtczogMgogCiBhZGRp
dGlvbmFsUHJvcGVydGllczoKICAgdHlwZTogb2JqZWN0CkBAIC04NiwxMCArMTAyLDEwIEBAIGFk
ZGl0aW9uYWxQcm9wZXJ0aWVzOgogCiBleGFtcGxlczoKICAgLSB8Ci0gICAgI2luY2x1ZGUgPGR0
LWJpbmRpbmdzL2Nsb2NrL210ODE4My1jbGsuaD4KKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
Y2xvY2svbXQ4MTkyLWNsay5oPgogCiAgICAgc2NwQDEwNTAwMDAwIHsKLSAgICAgICAgY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDgxODMtc2NwIjsKKyAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRp
YXRlayxtdDgxOTItc2NwIjsKICAgICAgICAgcmVnID0gPDB4MTA1MDAwMDAgMHg4MDAwMD4sCiAg
ICAgICAgICAgICAgIDwweDEwNzAwMDAwIDB4ODAwMD4sCiAgICAgICAgICAgICAgIDwweDEwNzIw
MDAwIDB4ZTAwMDA+OwotLSAKMi4zNi4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
