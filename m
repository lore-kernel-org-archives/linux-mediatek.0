Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2038EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 20:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ubuFCYfObsdFLdL7gbzHnp8kS63SWuo4bNWnORM55+Q=; b=dTNjYHeJk/QTLh
	RmLgi4jCCHC7j2OaSxmrnvnKzJGFJSBbpWZZja+bqZMyKWmAfMB3j9m4nZjpQF1GVeO4LIguc3DE+
	kirhHoRNXKw8dSL8eFCW1mm4WC191w5Z4/88/5YyhsA715wnLuGcbjIHx1JbP4u16OOKdepvWKIfg
	tUHCZsz10jcK7jqHoLTa/6QV9E9AvaDp6jDFLbb3SWSu31n8YffExuFLdChS7kU87ZZixJU5AtGb1
	/1elWSfsELFTXsI7S7zPS7LxtekJqgszmOAyJdBTzqmxxqzIx0BbJOi7/UEHaCsDkwolQCIkIL8qB
	NLwmIXBGIYYMY5ekUXJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJhbV-00GmcS-JG; Mon, 14 Feb 2022 20:05:45 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJhbI-00GmY6-P9; Mon, 14 Feb 2022 20:05:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 719871F43907
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644869128;
 bh=1uxuJpUNgwUp11TPN1NKA7OMJKeBwVw0ZqlthMDA3F0=;
 h=From:To:Cc:Subject:Date:From;
 b=dgCpr307YqBKISxEPPv8wm5ciiXYOnfRHSotaSu8avXJ+gv4zXKhvUIayUkFttVLP
 ep4Nb0BaR5hda+XrvZQUeKxpuEyIx7L0lpMzuRxSLrk+qTk6o7gx6B3+2xKreJmaVK
 Wio52gU7WsIdGBoqwAiZ0Yl3s1PeRYSUz1tHEuUUXOIGuYPlTK1rAZ5cL6KWbFATSh
 MW9TDixQhqFuKt6rch0Z0ul1nfbzq7CKZ5aOYs3EBnrW10ssQv5fb7+Ica6EWBVAlo
 wRAFjrJ9vB2c45YKkADeGEFcUfEmJPaJd3DeZYAX6Z4yMIB3Kc7k3HcxCc36pwj8ho
 YYno4Uc8EVAiQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Robert Foss <robert.foss@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>
Cc: kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v3] arm64: dts: mt8183: jacuzzi: Fix bus properties in anx's
 DSI endpoint
Date: Mon, 14 Feb 2022 15:05:07 -0500
Message-Id: <20220214200507.2500693-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_120533_047108_9520A891 
X-CRM114-Status: GOOD (  11.29  )
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

bXQ4MTgzLWt1a3VpLWphY3V6emkgaGFzIGFuIGFueDc2MjUgYnJpZGdlIGNvbm5lY3RlZCB0byB0
aGUgb3V0cHV0IG9mCml0cyBEU0kgaG9zdC4gSG93ZXZlciwgYWZ0ZXIgY29tbWl0IGZkMDMxMGI2
ZmU3ZCAoImRybS9icmlkZ2U6IGFueDc2MjU6CmFkZCBNSVBJIERQSSBpbnB1dCBmZWF0dXJlIiks
IGEgYnVzLXR5cGUgcHJvcGVydHkgc3RhcnRlZCBiZWluZyByZXF1aXJlZAppbiB0aGUgZW5kcG9p
bnQgbm9kZSBieSB0aGUgZHJpdmVyIHRvIGluZGljYXRlIHdoZXRoZXIgaXQgaXMgRFNJIG9yIERQ
SS4KCkFkZCB0aGUgbWlzc2luZyBidXMtdHlwZSBwcm9wZXJ0eSBhbmQgc2V0IGl0IHRvIDUKKFY0
TDJfRldOT0RFX0JVU19UWVBFX1BBUkFMTEVMKSBzbyB0aGF0IHRoZSBkcml2ZXIgaGFzIGl0cyBp
bnB1dApjb25maWd1cmVkIHRvIERTSSBhbmQgdGhlIGRpc3BsYXkgcGlwZWxpbmUgY2FuIHByb2Jl
IGNvcnJlY3RseS4KCldoaWxlIGF0IGl0LCBhbHNvIHNldCB0aGUgZGF0YS1sYW5lcyBwcm9wZXJ0
eSB0aGF0IHdhcyBhbHNvIGludHJvZHVjZWQKaW4gdGhhdCBzYW1lIGNvbW1pdCwgc28gdGhhdCB3
ZSBkb24ndCByZWx5IG9uIHRoZSBkZWZhdWx0IHZhbHVlLgoKRml4ZXM6IGZkMDMxMGI2ZmU3ZCAo
ImRybS9icmlkZ2U6IGFueDc2MjU6IGFkZCBNSVBJIERQSSBpbnB1dCBmZWF0dXJlIikKUmV2aWV3
ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJl
Z25vQGNvbGxhYm9yYS5jb20+ClNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRv
IDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KCi0tLQp2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzIwMjIwMjAxMTc0NjQzLjg0MzEwMi0xLW5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tCnYx
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjAxMjAyMjQyMDQuNzczMTE3LTEtbmZy
YXByYWRvQGNvbGxhYm9yYS5jb20KCkNoYW5nZXMgaW4gdjM6Ci0gQWRkZWQgbWlzc2luZyBSZXZp
ZXdlZC1ieQoKQ2hhbmdlcyBpbiB2MjoKLSAodGhhbmtzIFJvYikgVXNlIHByb3BlciBmb3JtYXQg
d2hlbiByZWZlcmluZyB0byBjb21taXQgaW4gY29tbWl0CiAgbWVzc2FnZSBhcyBwb2ludGVkIG91
dCBieSBjaGVja3BhdGNoCgogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMta3Vr
dWktamFjdXp6aS5kdHNpIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLWt1a3VpLWph
Y3V6emkuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLWt1a3VpLWph
Y3V6emkuZHRzaQppbmRleCA4ZjdiZjMzZjYwN2QuLmU4ZjEzM2RjOTZiOSAxMDA2NDQKLS0tIGEv
YXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMta3VrdWktamFjdXp6aS5kdHNpCisr
KyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLWt1a3VpLWphY3V6emkuZHRz
aQpAQCAtMTcxLDYgKzE3MSw4IEBAIHBvcnRAMCB7CiAKIAkJCWFueDc2MjVfaW46IGVuZHBvaW50
IHsKIAkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmRzaV9vdXQ+OworCQkJCWJ1cy10eXBlID0gPDU+
OworCQkJCWRhdGEtbGFuZXMgPSA8MCAxIDIgMz47CiAJCQl9OwogCQl9OwogCi0tIAoyLjM1LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
