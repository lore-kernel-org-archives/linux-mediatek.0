Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78786C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 22:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JaxbXgqpxwF8Z3bEKw2Z8QWCkwh0J7syhNWNkgjGWwc=; b=y919VzJaBTqwEm
	uk4seTEWdneTzNZGSHjxoClpdmsAXthaOtZ90oQRqHUS6hWeIEMNAQiR21WCuJzBZwoX9yDeM7oGq
	oIimLRSypX/o98tCjRRGxP3RnhtHAG3Tj+L0VnF35XdsOHmstKJ4uCI7Ru96XbCFhl+WzwC0coAy2
	aTLASUZfX3Br2C7VBgP0U90N+i6XTa8uktXhH3A81wbrc9cPtcTZ0RgYaPTOB3TEjx+ZfkKCsplGo
	MB9/3Y/xV5TKAyh1cSaW2KbPBY7HNPc9APsnxcQQqoI3uw5d+o0tAEFD8xWV9u/xYrPl2GTfGgs+Z
	M45SRQO4uNq4JRN4Xifg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mroh2-002r1Z-Qc; Mon, 29 Nov 2021 22:00:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrogz-002r14-43
 for linux-mediatek@lists.infradead.org; Mon, 29 Nov 2021 22:00:11 +0000
X-UUID: caaba5b961024914a654fdf3e16fda4e-20211129
X-UUID: caaba5b961024914a654fdf3e16fda4e-20211129
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1737819832; Mon, 29 Nov 2021 15:00:04 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Nov 2021 14:00:03 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 30 Nov 2021 06:00:01 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 30 Nov 2021 06:00:01 +0800
From: <sean.wang@mediatek.com>
To: <lb@semihalf.com>
CC: <marcel@holtmann.org>, <johan.hedberg@gmail.com>, <luiz.dentz@gmail.com>, 
 <upstream@semihalf.com>, <linux-bluetooth@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Sean
 Wang" <sean.wang@mediatek.com>
Subject: =?UTF-8?q?Re=3A?=
Date: Tue, 30 Nov 2021 05:59:58 +0800
Message-ID: <1638223198-31652-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <20211126221034.21331-1-lukasz.bartosik@semihalf.com--annotate>
References: <20211126221034.21331-1-lukasz.bartosik@semihalf.com--annotate>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_140009_193918_E1B13BBC 
X-CRM114-Status: UNSURE (   8.37  )
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

RnJvbTogU2VhbiBXYW5nIDxzZWFuLndhbmdAbWVkaWF0ZWsuY29tPgoKPkVuYWJsZSBtc2Z0IG9w
Y29kZSBmb3IgYnRtdGtzZGlvIGRyaXZlci4KPgo+U2lnbmVkLW9mZi1ieTogxYF1a2FzeiBCYXJ0
b3NpayA8bGJAc2VtaWhhbGYuY29tPgo+LS0tCj4gZHJpdmVycy9ibHVldG9vdGgvYnRtdGtzZGlv
LmMgfCAxICsKPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+ZGlmZiAtLWdpdCBh
L2RyaXZlcnMvYmx1ZXRvb3RoL2J0bXRrc2Rpby5jIGIvZHJpdmVycy9ibHVldG9vdGgvYnRtdGtz
ZGlvLmMgaW5kZXggZDljZjBjNDkyZTI5Li4yYTdhNjE1NjYzYjkgMTAwNjQ0Cj4tLS0gYS9kcml2
ZXJzL2JsdWV0b290aC9idG10a3NkaW8uYwo+KysrIGIvZHJpdmVycy9ibHVldG9vdGgvYnRtdGtz
ZGlvLmMKPkBAIC04ODcsNiArODg3LDcgQEAgc3RhdGljIGludCBidG10a3NkaW9fc2V0dXAoc3Ry
dWN0IGhjaV9kZXYgKmhkZXYpCj4JaWYgKGVuYWJsZV9hdXRvc3VzcGVuZCkKPgkJcG1fcnVudGlt
ZV9hbGxvdyhiZGV2LT5kZXYpOwo+Cj4rCWhjaV9zZXRfbXNmdF9vcGNvZGUoaGRldiwgMHhGRDMw
KTsKCkhpIMWBdWthc3osCgptc2Z0IGZlYXR1cmUgaXMgc3VwcG9zZWQgb25seSBzdXBwb3J0ZWQg
b24gbXQ3OTIxLiBDb3VsZCB5b3UgaGVscCByZXdvcmsgdGhlIHBhdGNoIHRvIGVuYWxiZSBtc2Z0
IG9wb2NkZSBvbmx5IGZvciBtdDc5MjE/CgoJU2VhbgoKPglidF9kZXZfaW5mbyhoZGV2LCAiRGV2
aWNlIHNldHVwIGluICVsbHUgdXNlY3MiLCBkdXJhdGlvbik7Cj4KPglyZXR1cm4gMDsKPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
