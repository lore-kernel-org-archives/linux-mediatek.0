Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4149C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 20:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pwpjckf+0l55A5iX5esfJbYb6by7uXPOKQXT80qHTVM=; b=fTLZJw8Oi+Dcwu
	V+J4diJPRM1ovem3NpCJFDE1sp8tWY9ggY/D4zTFRedehWTOAYj00Q9sIzus+Tj5rQAS7OryNZXuI
	Fk4ePGTBVCCqK+i/7U/g57HevaKOLv0KKH2GuTIf7bgCumyN8dpgXTY9Ii+23xvfD0ddiGGep2FCA
	Ve1wz2Gkxg9Y2Hs17DMzOlQOGXYMhMdnweT0E5BezFD2FonJDVYiLOJAJxhUIXfaTV+hJNsRLmPnj
	HLFbMYHFEMEI8fAMqkZA4KnqTQGtl5re5aDypz4fmC1013ebH2KQMkD+fuLkjj7SrByvl3NJeu0Ci
	TnvL/3yXWhYMmDTV/7rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npFrT-00DRLV-B4; Thu, 12 May 2022 20:56:39 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npFr7-00DR7F-0o; Thu, 12 May 2022 20:56:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 095511F45852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652388969;
 bh=+JM0/TCf78vIqvtOSPnO3S1iKSaG2U2+9jsn/lDu4kw=;
 h=From:To:Cc:Subject:Date:From;
 b=GqrILkk/bVyNI8JTeM4JvtRAjemlf5A/6kQmhRbhYouIrcGU8IEmNn+BYi4ocdt2k
 rjfhaTjCBOw/o/UOz0W2dEKf9rCU1uYn1ZVQHYUqkMUXYLFNtPYEmYyn+r7ymXbFCS
 +aLnKZ0NM2Zunla45Rnirea30glurSyiaBIZyEQZ5+uOzuh3uHawPWGknbrRpQjyG9
 8HUCTsdeo4HKaIIVUUJjhfttunHm9JpAEoHuG4o8dDZGGi4DlNst4gxUrA/oDdgKDB
 WD77XaFmDLh4z3nYOW4AMwDlx9BOq/IyzO4rlqyFdVvkZK2HIe3mPR26PEuGomgGWO
 qatQASe3j3eCQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxim Kutnij <gtk3@inbox.ru>, Rob Herring <robh+dt@kernel.org>,
 Sam Shih <sam.shih@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v3 00/16] Introduce support for MediaTek MT8192 Google
 Chromebooks
Date: Thu, 12 May 2022 16:55:46 -0400
Message-Id: <20220512205602.158273-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_135617_297171_8E354504 
X-CRM114-Status: GOOD (  11.72  )
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

ClRoaXMgc2VyaWVzIGludHJvZHVjZXMgRGV2aWNldHJlZXMgZm9yIHRoZSBNVDgxOTItYmFzZWQg
QXN1cmFkYSBwbGF0Zm9ybQphcyB3ZWxsIGFzIEFzdXJhZGEgU3BoZXJpb24gYW5kIEFzdXJhZGEg
SGF5YXRvIGJvYXJkcy4KClN1cHBvcnQgZm9yIHRoZSBib2FyZHMgaXMgYWRkZWQgdG8gdGhlIGV4
dGVudCB0aGF0IGlzIGN1cnJlbnRseSBlbmFibGVkCmluIHRoZSBtdDgxOTIuZHRzaSwgYXMgdG8g
bm90IGFkZCBhbnkgZGVwZW5kZW5jaWVzIHRvIHRoaXMgc2VyaWVzLgoKVGhpcyBzZXJpZXMgd2Fz
IHBlZXItcmV2aWV3ZWQgaW50ZXJuYWxseSBiZWZvcmUgc3VibWlzc2lvbi4KCnYyOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjA1MDUxOTQ1NTAuMzA5NDY1Ni0xLW5mcmFwcmFkb0Bj
b2xsYWJvcmEuY29tLwp2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwMzE2MTUx
MzI3LjU2NDIxNC0xLW5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tLwoKQ2hhbmdlcyBpbiB2MzoKLSBS
ZW5hbWVkIHJlZ3VsYXRvciBub2RlcyB0byBiZSBnZW5lcmljCi0gRml4ZWQga2V5Ym9hcmQgbGF5
b3V0IGZvciBIYXlhdG8KCkNoYW5nZXMgaW4gdjI6Ci0gQWRkZWQgcGF0Y2hlcyAxLTIgZm9yIE1l
ZGlhdGVrIGJvYXJkIGR0LWJpbmRpbmdzCi0gQWRkZWQgcGF0Y2hlcyAxMy0xNiBlbmFibGluZyBo
YXJkd2FyZSBmb3IgQXN1cmFkYSB0aGF0IGhhcyBzaW5jZSBiZWVuCiAgZW5hYmxlZCBvbiBtdDgx
OTIuZHRzaQoKTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gKDE2KToKICBkdC1iaW5kaW5nczogYXJt
NjQ6IGR0czogbWVkaWF0ZWs6IEFkZCBtdDgxOTItYXN1cmFkYS1zcGhlcmlvbgogIGR0LWJpbmRp
bmdzOiBhcm02NDogZHRzOiBtZWRpYXRlazogQWRkIG10ODE5Mi1hc3VyYWRhLWhheWF0bwogIGFy
bTY0OiBkdHM6IG1lZGlhdGVrOiBJbnRyb2R1Y2UgTVQ4MTkyLWJhc2VkIEFzdXJhZGEgYm9hcmQg
ZmFtaWx5CiAgYXJtNjQ6IGR0czogbWVkaWF0ZWs6IGFzdXJhZGE6IERvY3VtZW50IEdQSU8gbmFt
ZXMKICBhcm02NDogZHRzOiBtZWRpYXRlazogYXN1cmFkYTogQWRkIHN5c3RlbS13aWRlIHBvd2Vy
IHN1cHBsaWVzCiAgYXJtNjQ6IGR0czogbWVkaWF0ZWs6IGFzdXJhZGE6IEVuYWJsZSBhbmQgY29u
ZmlndXJlIEkyQyBhbmQgU1BJIGJ1c3NlcwogIGFybTY0OiBkdHM6IG1lZGlhdGVrOiBhc3VyYWRh
OiBBZGQgQ2hyb21lT1MgRUMKICBhcm02NDogZHRzOiBtZWRpYXRlazogYXN1cmFkYTogQWRkIGtl
eWJvYXJkIG1hcHBpbmcgZm9yIHRoZSB0b3Agcm93CiAgYXJtNjQ6IGR0czogbWVkaWF0ZWs6IGFz
dXJhZGE6IEFkZCBDcjUwIFRQTQogIGFybTY0OiBkdHM6IG1lZGlhdGVrOiBhc3VyYWRhOiBBZGQg
RWxhbiBlS1RIMzAwMCBJMkMgdHJhY2twYWQKICBhcm02NDogZHRzOiBtZWRpYXRlazogYXN1cmFk
YTogQWRkIEkyQyB0b3VjaHNjcmVlbgogIGFybTY0OiBkdHM6IG1lZGlhdGVrOiBzcGhlcmlvbjog
QWRkIGtleWJvYXJkIGJhY2tsaWdodAogIGFybTY0OiBkdHM6IG1lZGlhdGVrOiBhc3VyYWRhOiBF
bmFibGUgWEhDSQogIGFybTY0OiBkdHM6IG1lZGlhdGVrOiBhc3VyYWRhOiBFbmFibGUgUENJZSBh
bmQgYWRkIFdpRmkKICBhcm02NDogZHRzOiBtZWRpYXRlazogYXN1cmFkYTogQWRkIE1UNjM1OSBQ
TUlDCiAgYXJtNjQ6IGR0czogbWVkaWF0ZWs6IGFzdXJhZGE6IEFkZCBTUE1JIHJlZ3VsYXRvcnMK
CiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsueWFtbCAgICAgfCAgMTMgKwog
YXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9NYWtlZmlsZSAgICAgICAgIHwgICAyICsKIC4u
Li9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEtaGF5YXRvLXIxLmR0cyB8ICA0NyArKwogLi4u
L21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLXNwaGVyaW9uLXIwLmR0cyAgIHwgIDYyICsrCiAuLi4v
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaSAgICAgfCA3NDggKysrKysrKysr
KysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDg3MiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS1oYXlh
dG8tcjEuZHRzCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRl
ay9tdDgxOTItYXN1cmFkYS1zcGhlcmlvbi1yMC5kdHMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNo
L2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kKCi0tIAoyLjM2LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
