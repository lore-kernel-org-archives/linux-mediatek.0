Return-Path: <SRS0=uG8S=M4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3271C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 02:40:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E5F760F0F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 02:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E5F760F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J4oBhhPAd8JHgMri6oQ6TpCYGUWgAn/ir7SRjmPQvkM=; b=Iswnb2q8XG68BJ
	AFbGjnPg7LtFoDnGivHb4ASDgrts/P4mXvXzyPAtEVVlNyY/tITdzUwaEY85bkQWDcgXqGaKK+aiC
	2M1VtauJALaN/hvWYSTDI5413CTHdDIOW7TGMYa65Kv4RYrY/DN+9pG8znWC87iyL9NXA/Be4YDAg
	NBXwz7jJWiJETZRiwHS7YKd5GCJdVxVJa9ZzwAM9Qd5AJN4edSWusLlRvg2aitMC+MfVS+uCCA993
	VRJRKWm0lpVxSWQMtMte5IxGEJ6Z1LwyTMM2ni6+U2VOwOPlWejdPU1UZ/kQaWFGr/n9DTiPisdnT
	V/oo1GN+E1PaBRF4ZhWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBTJL-007u8w-BI; Thu, 05 Aug 2021 02:40:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBTJG-007u8S-S8
 for linux-mediatek@lists.infradead.org; Thu, 05 Aug 2021 02:40:41 +0000
X-UUID: ac61bf73e34a422fb23e3b8c2bbf00b0-20210804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=p5SbSMdQojgiQ+fy3Lre4kreOdvc2xhCxxkos1inavU=; 
 b=aMSEMCP2Fn++w9Io6ep5cwZizhfe2Q3KWAjnT9laih71SjP8rjwisrVUtocvXQ39guQ+BntYCfZHtVyhA97fMhgltTdhTbWxZzu51A0wKSXnYqXqElzPi6KnzRe/k6yUIByspC7P0bD3/zsnwp49pYpSPyP0mJJGxVhwvuUSiyo=;
X-UUID: ac61bf73e34a422fb23e3b8c2bbf00b0-20210804
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-yw.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 626540891; Wed, 04 Aug 2021 19:40:34 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 Aug 2021 19:40:32 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 Aug 2021 10:40:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 5 Aug 2021 10:40:24 +0800
From: <mark-yw.chen@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <tedd.an@linux.intel.com>, <chris.lu@mediatek.com>,
 <will-cy.lee@mediatek.com>, <sean.wang@mediatek.com>,
 <linux-bluetooth@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <michaelfsun@google.com>,
 <shawnku@google.com>, <jemele@google.com>, <apusaka@google.com>,
 <mcchou@chromium.org>, mark-yw.chen <mark-yw.chen@mediatek.com>
Subject: [PATCH 1/1] Bluetooth: btusb: Fix fall-through warnings
Date: Thu, 5 Aug 2021 10:40:12 +0800
Message-ID: <20210805024012.18022-1-mark-yw.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_194040_372582_072CFFB5 
X-CRM114-Status: UNSURE (   8.22  )
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

RnJvbTogIm1hcmsteXcuY2hlbiIgPG1hcmsteXcuY2hlbkBtZWRpYXRlay5jb20+DQoNCkZpeCBm
YWxsLXRocm91Z2ggd2FybmluZ3M6DQpkcml2ZXJzL2JsdWV0b290aC9idHVzYi5jOiBJbiBmdW5j
dGlvbiDigJhidHVzYl9yZWN2X2FjbF9tdGvigJk6DQpkcml2ZXJzL2JsdWV0b290aC9idHVzYi5j
OjQwMzM6Mzogd2FybmluZzoNCnRoaXMgc3RhdGVtZW50IG1heSBmYWxsIHRocm91Z2ggWy1XaW1w
bGljaXQtZmFsbHRocm91Z2g9XQ0KIDQwMzMgfCAgIHVzYl9kaXNhYmxlX2F1dG9zdXNwZW5kKGRh
dGEtPnVkZXYpOw0KICAgICAgfCAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
DQpkcml2ZXJzL2JsdWV0b290aC9idHVzYi5jOjQwMzQ6Mjogbm90ZTogaGVyZQ0KIDQwMzQgfCAg
Y2FzZSAweDA1ZmY6ICAvKiBGaXJtd2FyZSBkZWJ1ZyBsb2dnaW5nIDEgKi8NCiAgICAgIHwgIF5+
fn4NCg0KU2lnbmVkLW9mZi1ieTogbWFyay15dy5jaGVuIDxtYXJrLXl3LmNoZW5AbWVkaWF0ZWsu
Y29tPg0KLS0tDQogZHJpdmVycy9ibHVldG9vdGgvYnR1c2IuYyB8IDIgKysNCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2JsdWV0b290aC9i
dHVzYi5jIGIvZHJpdmVycy9ibHVldG9vdGgvYnR1c2IuYw0KaW5kZXggYTRjZWU4MzI3Mjk1Li44
OWZmOTE4MmI3ZTIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2JsdWV0b290aC9idHVzYi5jDQorKysg
Yi9kcml2ZXJzL2JsdWV0b290aC9idHVzYi5jDQpAQCAtNDAyNyw3ICs0MDI3LDkgQEAgc3RhdGlj
IGludCBidHVzYl9yZWN2X2FjbF9tdGsoc3RydWN0IGhjaV9kZXYgKmhkZXYsIHN0cnVjdCBza19i
dWZmICpza2IpDQogCQkgKiBzdXNwZW5kIGFuZCB0aHVzIGRpc2FibGUgYXV0by1zdXNwZW5kLg0K
IAkJICovDQogCQl1c2JfZGlzYWJsZV9hdXRvc3VzcGVuZChkYXRhLT51ZGV2KTsNCisJCWZhbGx0
aHJvdWdoOw0KIAljYXNlIDB4MDVmZjoJCS8qIEZpcm13YXJlIGRlYnVnIGxvZ2dpbmcgMSAqLw0K
KwkJZmFsbHRocm91Z2g7DQogCWNhc2UgMHgwNWZlOgkJLyogRmlybXdhcmUgZGVidWcgbG9nZ2lu
ZyAyICovDQogCQlyZXR1cm4gaGNpX3JlY3ZfZGlhZyhoZGV2LCBza2IpOw0KIAl9DQotLSANCjIu
MTguMA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
