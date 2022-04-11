Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6150AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 11:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XjW1O89U/iHjvnIDvIOX+aRRsYazxOc5adYwnnzRRRA=; b=BmCSwI410GH/SG
	R3JjfZwG6Lq/RE473a1Dp7DaVuScuBW2I5ZZZabXVlRvZw7MJDlxJJ9zcNFkbviqiITdJETRJfRaK
	Z0Udkzb8nzmzaU4+zbRzvO9yWCZqgdJ7aKtJoeBuTqqYb63MCcWsrMJs1PoqZUSwVuBYKNZbF7857
	x9rdzytPfwW3/mII56ZbOIJl8hnbwZ53Ml3YmwAv0rllIYJJ6Xtnc88rHasGvehNrLVLiwyA5m00g
	97DHv6aYcxq7f9kpJL/tdqGVVZNHYu8O/cIDooe6MbsuyQCkk5ehKpLaFg4g8xbvxs1RYC3DEXKEB
	FliJLvoDMZ8zyAV3AywQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nds80-008eCK-8E; Mon, 11 Apr 2022 11:22:40 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nds6j-008dOC-FX; Mon, 11 Apr 2022 11:21:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649676065; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CNOTXYv8Sx8j1g4oPY7guZ7x8Y+9W4nAWbaAtTVJaGAEjnPEbPURRROrxlPeiVlexU6os8+D6poyT2IuNj2J3ppdiMFrLipTTRI+g4xaKxkfras9goVVn4eCqKi38bpQXE4TWQT+f3qfvaVRnMivOWrnPw3BD4dmpR4c6ssNcGY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649676065;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=5/jbDAF5X5kezjSRAK51Yoit+uFd9VQLdmTmKwAwHMY=; 
 b=dseB4UyKiR9WxMIcSnQZDK6jMcO05AtaGhRY3jPfFS0Sx/OyeGOIJIL4tzjRqdsbZbrl78erto5C6VVuxy6xe0izsgYnKSoAXnwopNMFrERtKAOG1tXJ5cFzWPE8PYJ7gXIm81ImfN/alB6R6WWX6c2UeGWybjlwlqwzlOMIz2k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649676065; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=5/jbDAF5X5kezjSRAK51Yoit+uFd9VQLdmTmKwAwHMY=;
 b=I8/9xBIsYdFV55onKD8dTdAAGKHxevBRAhV0IDExLNV+mCSXvemhUwqNJ3ODxduz
 sT78ypYJCINSDizM9Sd6RSB8pUcgbHTsuwmkN2QxsxRuUgusBcvkMIvV09qKSx+TrNz
 dr2ZBB5PcMAdPYxEt8YlxzAt7Kib3DozynGuReBg=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649676064932643.1336824950525;
 Mon, 11 Apr 2022 04:21:04 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH v2 3/3] mips: dts: ralink: mt7621: remove defining gpio
 function for pin groups
Date: Mon, 11 Apr 2022 14:20:49 +0300
Message-Id: <20220411112049.18001-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220411112049.18001-1-arinc.unal@arinc9.com>
References: <20220411112049.18001-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_042121_608295_94B30EE3 
X-CRM114-Status: UNSURE (   9.20  )
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

QWxsIHBpbiBncm91cHMgZnVuY3Rpb24gYXMgZ3BpbyB1bmxlc3Mgc2V0IG90aGVyd2lzZS4gVGhl
cmVmb3JlLCByZW1vdmUKdGhpcyB1bm5lY2Vzc2FyeSBiaW5kaW5nLgoKVGVzdGVkIG9uIFVuaUVs
ZWMgVTc2MjEtMDYtMTZNIG9uIE9wZW5XcnQuCgpTaWduZWQtb2ZmLWJ5OiBBcsSxbsOnIMOcTkFM
IDxhcmluYy51bmFsQGFyaW5jOS5jb20+ClJldmlld2VkLWJ5OiBTZXJnaW8gUGFyYWN1ZWxsb3Mg
PHNlcmdpby5wYXJhY3VlbGxvc0BnbWFpbC5jb20+Ci0tLQp2MjogYWRkICJyYWxpbms6IiB0byB0
aGUgY29tbWl0IHN1bW1hcnkKCi0tLQogYXJjaC9taXBzL2Jvb3QvZHRzL3JhbGluay9tdDc2MjEt
Z251YmVlLWdiLXBjMS5kdHMgfCAxMiAtLS0tLS0tLS0tLS0KIGFyY2gvbWlwcy9ib290L2R0cy9y
YWxpbmsvbXQ3NjIxLWdudWJlZS1nYi1wYzIuZHRzIHwgMTIgLS0tLS0tLS0tLS0tCiAyIGZpbGVz
IGNoYW5nZWQsIDI0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9ib290L2R0
cy9yYWxpbmsvbXQ3NjIxLWdudWJlZS1nYi1wYzEuZHRzIGIvYXJjaC9taXBzL2Jvb3QvZHRzL3Jh
bGluay9tdDc2MjEtZ251YmVlLWdiLXBjMS5kdHMKaW5kZXggNzVmM2IwNDI1NDg3Li5jMzA3YTBl
ZGI5MWYgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlwcy9ib290L2R0cy9yYWxpbmsvbXQ3NjIxLWdudWJl
ZS1nYi1wYzEuZHRzCisrKyBiL2FyY2gvbWlwcy9ib290L2R0cy9yYWxpbmsvbXQ3NjIxLWdudWJl
ZS1nYi1wYzEuZHRzCkBAIC05NywxOCArOTcsNiBAQCAmcGNpZSB7CiAJc3RhdHVzID0gIm9rYXki
OwogfTsKIAotJnBpbmN0cmwgewotCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Ci0JcGluY3Ry
bC0wID0gPCZzdGF0ZV9kZWZhdWx0PjsKLQotCXN0YXRlX2RlZmF1bHQ6IHN0YXRlLWRlZmF1bHQg
ewotCQlncGlvLXBpbm11eCB7Ci0JCQlncm91cHMgPSAidWFydDMiLCAid2R0IjsKLQkJCWZ1bmN0
aW9uID0gImdwaW8iOwotCQl9OwotCX07Ci19OwotCiAmZ21hYzEgewogCXN0YXR1cyA9ICJva2F5
IjsKIAlwaHktaGFuZGxlID0gPCZldGhwaHk0PjsKZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9ib290
L2R0cy9yYWxpbmsvbXQ3NjIxLWdudWJlZS1nYi1wYzIuZHRzIGIvYXJjaC9taXBzL2Jvb3QvZHRz
L3JhbGluay9tdDc2MjEtZ251YmVlLWdiLXBjMi5kdHMKaW5kZXggYjQyN2FlOWUwODFmLi44MjY4
ZDczOGU3NGYgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlwcy9ib290L2R0cy9yYWxpbmsvbXQ3NjIxLWdu
dWJlZS1nYi1wYzIuZHRzCisrKyBiL2FyY2gvbWlwcy9ib290L2R0cy9yYWxpbmsvbXQ3NjIxLWdu
dWJlZS1nYi1wYzIuZHRzCkBAIC04MSwxOCArODEsNiBAQCAmcGNpZSB7CiAJc3RhdHVzID0gIm9r
YXkiOwogfTsKIAotJnBpbmN0cmwgewotCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Ci0JcGlu
Y3RybC0wID0gPCZzdGF0ZV9kZWZhdWx0PjsKLQotCXN0YXRlX2RlZmF1bHQ6IHN0YXRlLWRlZmF1
bHQgewotCQlncGlvLXBpbm11eCB7Ci0JCQlncm91cHMgPSAid2R0IjsKLQkJCWZ1bmN0aW9uID0g
ImdwaW8iOwotCQl9OwotCX07Ci19OwotCiAmZ21hYzEgewogCXN0YXR1cyA9ICJva2F5IjsKIAlw
aHktaGFuZGxlID0gPCZldGhwaHk3PjsKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
