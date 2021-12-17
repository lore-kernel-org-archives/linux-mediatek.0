Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F0AC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 17:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pLYmya1rGNEbFZB7UR6xwgTQ2QvYUaB/FnDvEouRJyA=; b=hAmqpdESzbHuy5
	GLhUgfNi26QaT6eOCxa0i54KQHr1pcIJWWRgmGtjqH1tTHFOjALykAIf4twRY0YCq2FFqf6hLP3Wh
	xak3nfZboTQOroSl3dsC0BqxZOGkuN3pDz+soNp8lAqyNrDXSPbJMtJZCQtdmsTZWszdnDWurAPB8
	32cB94R7BHEWX9jCk5kqvuzERsh7zKwbub5sfPCDBKplNNSg6y1x+Iqv28IZFkmYIPGpLic5260OU
	i4jWsRV4+SwIoJ/dRIcBhEUireiJd2R1CZnRn0S8aTlLm3dOAw6pgpWfnuZI//8lKIOsJEYf4VUOd
	xxm+yDo9nX78FIY9BGJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myHOa-00BZUI-KC; Fri, 17 Dec 2021 17:51:52 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myG2T-00B9gm-8c; Fri, 17 Dec 2021 16:24:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 98C6E1F47153
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639758295; bh=lxasgzjqebm4cr/bK1kNdQ45q5KLqEPJPyvYbHtTlFQ=;
 h=From:To:Cc:Subject:Date:From;
 b=euyMke+SvnYfzlw2kOqY1FNW/qVCRuXc8fCZytMr9lv8sLexs2XL9Wjo9/Gag9RPG
 +bmx9rP+zQ95khHvZVGRRmuIgVD0okN1G192s8RGwzS2qlON+5KQNdia31eN/Zqq5/
 W3G0FT3lv6w6ZR4pwmr4zi5N6uNR4l2M4JBlGYQE+viM293uTP97louo5jnjiudwlV
 HWFzpfSVHxaFw2CGVE8KgVZMF/YCkZsskSW4p1SxJ7LEX/2wfWfy5lRG1qqHhJA8Fm
 OvYu7b7UygZVxhNA3B0zx9GxgJJWXUq1HdOoePRBicv9jPBKAX0qXn3C2dst4wNvzQ
 ZtjgpS6x7W8cA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
Subject: [PATCH] arm64: defconfig: Enable MT6397 RTC
Date: Fri, 17 Dec 2021 11:24:45 -0500
Message-Id: <20211217162445.876034-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_082457_476768_76F5B392 
X-CRM114-Status: UNSURE (   7.68  )
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

VGhlIE1UNjM5NyBSVEMgaXMgcGFydCBvZiB0aGUgTWVkaWF0ZWsgTVQ2Mzk3IFBNSUMsIHdoaWNo
IGlzIHByZXNlbnQgaW4KdGhlIG10ODE3My1lbG0gYmFzZSBib2FyZC4KClRoZSBkcml2ZXIgZm9y
IHRoZSBQTUlDIGlzIGFscmVhZHkgZW5hYmxlZCB0aHJvdWdoIENPTkZJR19NRkRfTVQ2Mzk3LCBz
bwplbmFibGUganVzdCB0aGUgZHJpdmVyIGZvciB0aGUgUlRDLgoKU2lnbmVkLW9mZi1ieTogTsOt
Y29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgotLS0KIGFyY2gv
YXJtNjQvY29uZmlncy9kZWZjb25maWcgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcgYi9hcmNoL2Fy
bTY0L2NvbmZpZ3MvZGVmY29uZmlnCmluZGV4IGYyZTJiOWJkZDcwMi4uNzZiZDM0MjIzMjc3IDEw
MDY0NAotLS0gYS9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnCisrKyBiL2FyY2gvYXJtNjQv
Y29uZmlncy9kZWZjb25maWcKQEAgLTkyNyw2ICs5MjcsNyBAQCBDT05GSUdfUlRDX0RSVl9URUdS
QT15CiBDT05GSUdfUlRDX0RSVl9TTlZTPW0KIENPTkZJR19SVENfRFJWX0lNWF9TQz1tCiBDT05G
SUdfUlRDX0RSVl9YR0VORT15CitDT05GSUdfUlRDX0RSVl9NVDYzOTc9bQogQ09ORklHX0RNQURF
VklDRVM9eQogQ09ORklHX0RNQV9CQ00yODM1PXkKIENPTkZJR19ETUFfU1VONkk9bQotLSAKMi4z
NC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
