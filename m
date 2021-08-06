Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15141C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 01:45:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABC89611C2
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 01:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABC89611C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k+u3RDOuQwuUx84kmdwx7iuiVklhDU1b/h1kO8DNqz8=; b=KBXq9w1ZucGyGV
	aku0XtaJcwGMK6DdFh7oL3OaZy1lr+Nhb+1EpSJ3o2NnjTW3UPaYtwST1ejtxAjlfpJvyXdtN/wXl
	iUo5YL6Znwr19MtzciKAYaVPU5GSTXGta+6bQiEg9wLnRlVu3ljDAT1XW+m2JFyjEo3vW+e2q/HcF
	HCYgt+mLnihoDTb4SxdUlXemXdn5iB2yLcMtdyVOhcJ6XYiCWmj0lIr7JLX6cQObmVuphThABgC/h
	wG2Yw8VyqErS4+HEah8SxSDzljs1nld4uxhfqp/ZdxWZxcrPSI7DF2dWzkCuKCSAtJvxaTRilckX6
	h7hqw6eyhIRFhufDh9EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBovD-00BHre-3I; Fri, 06 Aug 2021 01:45:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBov8-00BHrC-Mi
 for linux-mediatek@lists.infradead.org; Fri, 06 Aug 2021 01:45:13 +0000
X-UUID: 2483d38ac2c94467b595cb06f34066dc-20210805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=l4qPRtwUaMbLNiuta3QWX/DR2AokXW7R3guA4VQ5+XQ=; 
 b=YUS33SsctmCQA9Rl7MeLjg1vnq2GJFfuYYRDEe43NLpmu6UJxxDwKw7XYRZZdFt27V5r70D4RhhVOy5jWXVFfpqZc/6+L16E5I6q3EcvGfmO4ajUEDu59ryyZXEwGz0BXbveRcHgddaUblJ4YEW5QFFytaW+kEFfK23t8H3KYv0=;
X-UUID: 2483d38ac2c94467b595cb06f34066dc-20210805
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-yw.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 648591333; Thu, 05 Aug 2021 18:45:05 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 Aug 2021 18:35:44 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 Aug 2021 09:35:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 6 Aug 2021 09:35:36 +0800
From: <mark-yw.chen@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <tedd.an@linux.intel.com>, <chris.lu@mediatek.com>,
 <will-cy.lee@mediatek.com>, <sean.wang@mediatek.com>,
 <linux-bluetooth@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <michaelfsun@google.com>,
 <shawnku@google.com>, <jemele@google.com>, <apusaka@google.com>,
 <mcchou@chromium.org>, mark-yw.chen <mark-yw.chen@mediatek.com>
Subject: [PATCH 1/1] Bluetooth: btusb: Fix fall-through warnings
Date: Fri, 6 Aug 2021 09:35:16 +0800
Message-ID: <20210806013516.26148-1-mark-yw.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_184512_197459_25EFE125 
X-CRM114-Status: UNSURE (   7.00  )
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
Y29tPg0KLS0tDQogZHJpdmVycy9ibHVldG9vdGgvYnR1c2IuYyB8IDEgKw0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibHVldG9vdGgvYnR1
c2IuYyBiL2RyaXZlcnMvYmx1ZXRvb3RoL2J0dXNiLmMNCmluZGV4IGE0Y2VlODMyNzI5NS4uNWY0
Mzc1MzhkNzU0IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ibHVldG9vdGgvYnR1c2IuYw0KKysrIGIv
ZHJpdmVycy9ibHVldG9vdGgvYnR1c2IuYw0KQEAgLTQwMjcsNiArNDAyNyw3IEBAIHN0YXRpYyBp
bnQgYnR1c2JfcmVjdl9hY2xfbXRrKHN0cnVjdCBoY2lfZGV2ICpoZGV2LCBzdHJ1Y3Qgc2tfYnVm
ZiAqc2tiKQ0KIAkJICogc3VzcGVuZCBhbmQgdGh1cyBkaXNhYmxlIGF1dG8tc3VzcGVuZC4NCiAJ
CSAqLw0KIAkJdXNiX2Rpc2FibGVfYXV0b3N1c3BlbmQoZGF0YS0+dWRldik7DQorCQlmYWxsdGhy
b3VnaDsNCiAJY2FzZSAweDA1ZmY6CQkvKiBGaXJtd2FyZSBkZWJ1ZyBsb2dnaW5nIDEgKi8NCiAJ
Y2FzZSAweDA1ZmU6CQkvKiBGaXJtd2FyZSBkZWJ1ZyBsb2dnaW5nIDIgKi8NCiAJCXJldHVybiBo
Y2lfcmVjdl9kaWFnKGhkZXYsIHNrYik7DQotLSANCjIuMTguMA0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
