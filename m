Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C73C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Apr 2022 20:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LBRdXo4+nhER5R715FErqOJl/CA46jcMHzCLdM2FK6U=; b=FBvkxkLrHnZoxu
	+LtX03Y6NAd23PXAdP9NY7hN2gugAjCAZUnNDMUvsCuBAgcYF+Ox32bJCD4ucZj8B4oY2TgmGOiVo
	H1kOI5hzZACEQ8qsdnW9sUKpqU0ShxkH6LOdg767eKJ8IznVQaYYr4pXJrBs8UnONg0rkXg309urs
	JI86dqiHDzZu1IX3tUHujOBBz578ZvTG/eVMXuq71f8+yDTT6RsmkLlGiJEub8L6W00VgTiqPmOZx
	Gf7E/MHuO69uffFJuPuvXjAqBfwL0/JewNS57sYUATyqJ1q6YCQC/7gI2AR8oqAyfag7JUOifq1es
	KCr7z9L/+d2mA9izy2lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndeEy-005Rfu-IV; Sun, 10 Apr 2022 20:32:56 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndeEK-005RNF-Ab; Sun, 10 Apr 2022 20:32:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649622731; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=gIHrux1Qx6cY6Pyu4y77mzgZzBjZyceD7oDM7YFkR/mKow87bN1DefCaocxDQfjgqeimJ/WAQS33ic0N0V8cu0nJh9im/KZsru1pPLA4fbe2J8cUiF+mvZ4OXHqCrgIGoYDBDpV+xRr7HbHy0Ywdm1+so3iL+pSIdcJNCeQsqqA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649622731;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=/MOMK34Z6z6C4CqZb8rLYQ4jYbrhj9LEWEwpaErwP4o=; 
 b=XLiSQj5h+xt2fR9KFl/aQJnOAIAJH+F8JK+SPP7MoDqFEYvcnPop1m2C1o3N2+iYxxJa2k1JbcAx74taP/ufzMq7A2Bra2HOJvj93VbKwxioUT/VtSP73P1OU63gWrcIExksd+Ibv3yY21/4BIDQLwSdR6ttmnHiYRJDBZzOnh4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649622731; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=/MOMK34Z6z6C4CqZb8rLYQ4jYbrhj9LEWEwpaErwP4o=;
 b=IEqd05QgWct3oxoPxsxQmyqf/6IlDq+nbX7nej93sqGJqCJiJxW00t9S3XUwi+m+
 K3ZWJHZfC3+l7SXb2VCkjmtO0+Zl/VcWAf91U+Tme95kJe+LFtoI23zC5yI3OMnjv21
 6wo149RY6tWIXTSm7xg1V8aSycanXsH/CpHehsvg=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649622730691527.6330187658422;
 Sun, 10 Apr 2022 13:32:10 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH 3/3] mips: dts: mt7621: remove binding for defining gpio
 function for pin groups
Date: Sun, 10 Apr 2022 23:31:38 +0300
Message-Id: <20220410203138.22513-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220410203138.22513-1-arinc.unal@arinc9.com>
References: <20220410203138.22513-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_133216_540739_9BCAAA1C 
X-CRM114-Status: UNSURE (   8.29  )
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
IDxhcmluYy51bmFsQGFyaW5jOS5jb20+Ci0tLQogYXJjaC9taXBzL2Jvb3QvZHRzL3JhbGluay9t
dDc2MjEtZ251YmVlLWdiLXBjMS5kdHMgfCAxMiAtLS0tLS0tLS0tLS0KIGFyY2gvbWlwcy9ib290
L2R0cy9yYWxpbmsvbXQ3NjIxLWdudWJlZS1nYi1wYzIuZHRzIHwgMTIgLS0tLS0tLS0tLS0tCiAy
IGZpbGVzIGNoYW5nZWQsIDI0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9i
b290L2R0cy9yYWxpbmsvbXQ3NjIxLWdudWJlZS1nYi1wYzEuZHRzIGIvYXJjaC9taXBzL2Jvb3Qv
ZHRzL3JhbGluay9tdDc2MjEtZ251YmVlLWdiLXBjMS5kdHMKaW5kZXggNzVmM2IwNDI1NDg3Li5j
MzA3YTBlZGI5MWYgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlwcy9ib290L2R0cy9yYWxpbmsvbXQ3NjIx
LWdudWJlZS1nYi1wYzEuZHRzCisrKyBiL2FyY2gvbWlwcy9ib290L2R0cy9yYWxpbmsvbXQ3NjIx
LWdudWJlZS1nYi1wYzEuZHRzCkBAIC05NywxOCArOTcsNiBAQCAmcGNpZSB7CiAJc3RhdHVzID0g
Im9rYXkiOwogfTsKIAotJnBpbmN0cmwgewotCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Ci0J
cGluY3RybC0wID0gPCZzdGF0ZV9kZWZhdWx0PjsKLQotCXN0YXRlX2RlZmF1bHQ6IHN0YXRlLWRl
ZmF1bHQgewotCQlncGlvLXBpbm11eCB7Ci0JCQlncm91cHMgPSAidWFydDMiLCAid2R0IjsKLQkJ
CWZ1bmN0aW9uID0gImdwaW8iOwotCQl9OwotCX07Ci19OwotCiAmZ21hYzEgewogCXN0YXR1cyA9
ICJva2F5IjsKIAlwaHktaGFuZGxlID0gPCZldGhwaHk0PjsKZGlmZiAtLWdpdCBhL2FyY2gvbWlw
cy9ib290L2R0cy9yYWxpbmsvbXQ3NjIxLWdudWJlZS1nYi1wYzIuZHRzIGIvYXJjaC9taXBzL2Jv
b3QvZHRzL3JhbGluay9tdDc2MjEtZ251YmVlLWdiLXBjMi5kdHMKaW5kZXggYjQyN2FlOWUwODFm
Li44MjY4ZDczOGU3NGYgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlwcy9ib290L2R0cy9yYWxpbmsvbXQ3
NjIxLWdudWJlZS1nYi1wYzIuZHRzCisrKyBiL2FyY2gvbWlwcy9ib290L2R0cy9yYWxpbmsvbXQ3
NjIxLWdudWJlZS1nYi1wYzIuZHRzCkBAIC04MSwxOCArODEsNiBAQCAmcGNpZSB7CiAJc3RhdHVz
ID0gIm9rYXkiOwogfTsKIAotJnBpbmN0cmwgewotCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7
Ci0JcGluY3RybC0wID0gPCZzdGF0ZV9kZWZhdWx0PjsKLQotCXN0YXRlX2RlZmF1bHQ6IHN0YXRl
LWRlZmF1bHQgewotCQlncGlvLXBpbm11eCB7Ci0JCQlncm91cHMgPSAid2R0IjsKLQkJCWZ1bmN0
aW9uID0gImdwaW8iOwotCQl9OwotCX07Ci19OwotCiAmZ21hYzEgewogCXN0YXR1cyA9ICJva2F5
IjsKIAlwaHktaGFuZGxlID0gPCZldGhwaHk3PjsKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
