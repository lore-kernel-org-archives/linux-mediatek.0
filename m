Return-Path: <SRS0=YyAn=5V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC70BC2BA15
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Apr 2020 16:32:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75FCA20675
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Apr 2020 16:32:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b2Slla7f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="s6dWjtH3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75FCA20675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BCfhGtotNOU7PFzi7ygMZeCKUFPTvrAz2rulXhOfzyA=; b=b2Slla7ffqZf2V
	OGFvQds3XWOtNRCD/q/i1vqXKGdlIpEFuO82o2eyWkte1Gof1EgPR4nBx/f4XCpniHiTdzXWBKIoQ
	tyQ18N1Ti3Lbq7++m3o9BVihDAfc/DVdOF/6+iC0rcYYrP5UwL4UnBoIpQwwoVnzeLhW0jmcniaNT
	uWzEKyt2S/E8Lhz/Ki0MtC/+zlVVN3NEkd1mbyLhtTYZXEI5RNUqTzV9Lv2CAcg4qf76E/ASTh5Fe
	iDEDo9Tdclshen5xqHei79UW1nsz5zodUq65b/ocBpr3PUwQhlXgLOSr9Pyd3YUxk6HO0RloeWwBO
	RuOdSMCKIByGImu371DQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jL8Bg-0005TF-SA; Sun, 05 Apr 2020 16:31:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jL8Bc-0005Ms-2n; Sun, 05 Apr 2020 16:31:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=gFlHvsAHEobceHTkLMZ6spQ28fq/W6tggJVmyEt6af8=; b=s6dWjtH3JuEn+/E7cfZF0nrwEm
 8CXHku1NQXdT34iBp7kUcHCyzmFGbmgDNrtA0VJI7Xo+HdNq6guE6wqNJKsZ9GKj9v2o3JQd4u+gE
 0gHVrIVIWt34Hnw8NyEjkV0bGJHUf14ZfQ+j+D1IhNlvtVCFOdi6UftzlHVyVbcf8CxWVlfyingfO
 +YjAWr9CxT1jimaR1US+lLjBKBQvrvzGPOpw1pWxfvkQQW9vt3bm84u1/D5erVDY63eps3vj8OIqD
 nxpcBnd+FUW8/OCBZSBSO7V54HIYCaD+4t3ZYi7ORxlwcuiOJS2rNhWDhZdw0FCrlT2XSvqLigxj6
 0gWpuBLw==;
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jL8BX-0006Cq-5G; Sun, 05 Apr 2020 16:31:50 +0000
Received: from mail.mleia.com (localhost [127.0.0.1])
 by mail.mleia.com (Postfix) with ESMTP id E02923D6201;
 Sun,  5 Apr 2020 16:31:27 +0000 (UTC)
Subject: Re: [PATCH] rtc: Delete an error message in three functions
To: Markus Elfring <Markus.Elfring@web.de>, linux-rtc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>
References: <04116352-b464-041c-1939-96440133aa6f@web.de>
From: Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <a33be664-7b21-a9a5-de45-7bb24740e927@mleia.com>
Date: Sun, 5 Apr 2020 19:31:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <04116352-b464-041c-1939-96440133aa6f@web.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20200405_163127_942536_44D09C9E 
X-CRM114-Status: GOOD (  12.73  )
/bin/ln: failed to access
 'reaver_cache/texts/20200405_163127_942536_44D09C9E': No such file or
 directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200405_163127_942536_44D09C9E 
X-CRM114-Status: GOOD (  12.57  )
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
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Tang Bin <tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gNC81LzIwIDY6MzYgUE0sIE1hcmt1cyBFbGZyaW5nIHdyb3RlOgo+IEZyb206IE1hcmt1cyBF
bGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4KPiBEYXRlOiBTdW4sIDUgQXBy
IDIwMjAgMTc6MzA6MTUgKzAyMDAKPiAKPiBUaGUgZnVuY3Rpb24g4oCccGxhdGZvcm1fZ2V0X2ly
ceKAnSBjYW4gbG9nIGFuIGVycm9yIGFscmVhZHkuCj4gVGh1cyBvbWl0IHJlZHVuZGFudCBtZXNz
YWdlcyBmb3IgdGhlIGV4Y2VwdGlvbiBoYW5kbGluZyBpbiB0aGUKPiBjYWxsaW5nIGZ1bmN0aW9u
cy4KPiAKPiBUaGlzIGlzc3VlIHdhcyBkZXRlY3RlZCBieSB1c2luZyB0aGUgQ29jY2luZWxsZSBz
b2Z0d2FyZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXJrdXMgRWxmcmluZyA8ZWxmcmluZ0B1c2Vy
cy5zb3VyY2Vmb3JnZS5uZXQ+Cj4gLS0tCj4gIGRyaXZlcnMvcnRjL3J0Yy1mc2wtZnRtLWFsYXJt
LmMgfCA0ICstLS0KPiAgZHJpdmVycy9ydGMvcnRjLWxwYzI0eHguYyAgICAgICB8IDQgKy0tLQoK
Rm9yIExQQzI0eHgvMTh4eC80M3h4IGNoYW5nZQoKQWNrZWQtYnk6IFZsYWRpbWlyIFphcG9sc2tp
eSA8dnpAbWxlaWEuY29tPgoKPiAgZHJpdmVycy9ydGMvcnRjLW10MjcxMi5jICAgICAgICB8IDQg
Ky0tLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkK
PiAKCi0tCkJlc3Qgd2lzaGVzLApWbGFkaW1pcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
