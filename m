Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5574BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 10:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UpW8IG8jvxJCbnjzOei6QV3R9Y3zIkM7w8LeNjDvKAQ=; b=a1KXjLqo1mxlz9
	pDUBNL+WRwgb22Gy07cunKcHuhuAfIru35BmBCvxP15nqFfb8KKbY15LkBwVp8efa5+5vWamQdgz8
	g9pn9Kp3QJ3KbY8EHzZp3NxRlYkzJYJB9tFZ0JiybVY1VjmjX9h4Gr7QGxPNSGyUDKD/w4IzYo21B
	7PMh+Q1bioye2gLc8brPxwaL3wqqD6IRIqcK1dKv9L7jXpWhM6z57X5wPwvrJGuL3rPY+aTPu2UIt
	xMbk0s3cycuduboY6ES/psgcpr+3Yv0WIRBrN/91/rI2EqD3685CvmkOAQktdNyZIb5L+pVo2kJYp
	1wLuvti5gqfn62vJ4VFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwiNG-008wA7-AS; Mon, 13 Dec 2021 10:16:02 +0000
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwi2H-008mvA-Ty; Mon, 13 Dec 2021 09:54:23 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=19; SR=0; TI=SMTPD_---0V-V3Tqn_1639389254; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0V-V3Tqn_1639389254) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 13 Dec 2021 17:54:15 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: nbd@nbd.name
Cc: lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
 shayne.chen@mediatek.com, sean.wang@mediatek.com, kvalo@kernel.org,
 davem@davemloft.net, kuba@kernel.org, matthias.bgg@gmail.com,
 nathan@kernel.org, ndesaulniers@google.com, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Yang Li <yang.lee@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] mt76: remove variable set but not used
Date: Mon, 13 Dec 2021 17:54:13 +0800
Message-Id: <20211213095413.99456-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_015422_181378_752924F0 
X-CRM114-Status: UNSURE (   7.77  )
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

VGhlIGNvZGUgdGhhdCB1c2VzIHZhcmlhYmxlIHF1ZXVlZCBoYXMgYmVlbiByZW1vdmVkLAphbmQg
Im10NzZfaXNfdXNiKGRldikgPyBxLT5uZGVzYyAtIHEtPnF1ZXVlZCA6IHEtPnF1ZXVlZCIKZGlk
bid0IGRvIGFueXRoaW5nLCBzbyBhbGwgdGhleSBzaG91bGQgYmUgcmVtb3ZlZCBhcyB3ZWxsLgoK
RWxpbWluYXRlIHRoZSBmb2xsb3dpbmcgY2xhbmcgd2FybmluZ3M6CmRyaXZlcnMvbmV0L3dpcmVs
ZXNzL21lZGlhdGVrL210NzYvZGVidWdmcy5jOjc3Ojk6IHdhcm5pbmc6IHZhcmlhYmxlCuKAmHF1
ZXVlZOKAmSBzZXQgYnV0IG5vdCB1c2VkLgoKUmVwb3J0ZWQtYnk6IEFiYWNpIFJvYm90IDxhYmFj
aUBsaW51eC5hbGliYWJhLmNvbT4KRml4ZXM6IDJkOGJlNzZjMTY3NCAoIm10NzY6IGRlYnVnZnM6
IGltcHJvdmUgcXVldWUgbm9kZSByZWFkYWJpbGl0eSIpClNpZ25lZC1vZmYtYnk6IFlhbmcgTGkg
PHlhbmcubGVlQGxpbnV4LmFsaWJhYmEuY29tPgotLS0KIGRyaXZlcnMvbmV0L3dpcmVsZXNzL21l
ZGlhdGVrL210NzYvZGVidWdmcy5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9t
ZWRpYXRlay9tdDc2L2RlYnVnZnMuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210
NzYvZGVidWdmcy5jCmluZGV4IGI4YmNmMjJhMDdmZC4uMDI3ZDllYTE3ZDA0IDEwMDY0NAotLS0g
YS9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L2RlYnVnZnMuYworKysgYi9kcml2
ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L2RlYnVnZnMuYwpAQCAtNzQsMTMgKzc0LDEy
IEBAIEVYUE9SVF9TWU1CT0xfR1BMKG10NzZfcXVldWVzX3JlYWQpOwogc3RhdGljIGludCBtdDc2
X3J4X3F1ZXVlc19yZWFkKHN0cnVjdCBzZXFfZmlsZSAqcywgdm9pZCAqZGF0YSkKIHsKIAlzdHJ1
Y3QgbXQ3Nl9kZXYgKmRldiA9IGRldl9nZXRfZHJ2ZGF0YShzLT5wcml2YXRlKTsKLQlpbnQgaSwg
cXVldWVkOworCWludCBpOwogCiAJc2VxX3B1dHMocywgIiAgICAgcXVldWUgfCBody1xdWV1ZWQg
fCAgICAgIGhlYWQgfCAgICAgIHRhaWwgfFxuIik7CiAJbXQ3Nl9mb3JfZWFjaF9xX3J4KGRldiwg
aSkgewogCQlzdHJ1Y3QgbXQ3Nl9xdWV1ZSAqcSA9ICZkZXYtPnFfcnhbaV07CiAKLQkJcXVldWVk
ID0gbXQ3Nl9pc191c2IoZGV2KSA/IHEtPm5kZXNjIC0gcS0+cXVldWVkIDogcS0+cXVldWVkOwog
CQlzZXFfcHJpbnRmKHMsICIgJTlkIHwgJTlkIHwgJTlkIHwgJTlkIHxcbiIsCiAJCQkgICBpLCBx
LT5xdWV1ZWQsIHEtPmhlYWQsIHEtPnRhaWwpOwogCX0KLS0gCjIuMjAuMS43LmcxNTMxNDRjCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
