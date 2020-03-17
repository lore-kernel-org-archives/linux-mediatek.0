Return-Path: <SRS0=yvcX=5C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28EFCC10F29
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 14:34:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFBEB206EC
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 14:34:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dEOeZV8v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFBEB206EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5Rycq2iTFbCjYAbqO/x63dFxW8SkMfl7/UYnAI1KYE0=; b=dEOeZV8vh+DfXV
	XLaTrBc18DSSsQLtK3SsFN/8q/6WIwxsUE1F6KySjxNdqW0XFfCxrKZtX4zjJT7wsv7Zc5Wr684V5
	vzOyxNkkAbk80ULE+2JUx1SlIXd6G0rxCctA8ZZkun0L6zwCH7vTlp4R6oHHoTRsO/1WqBSPwrCYN
	BL5iJ8S2PFbv0MsfXZjcBA9PPuLAel6KHVGyF7FaJyhFXMwa/HpZjDkQDub1KNhWAef9+3gQvQI6W
	aDmT5bTX+BVWbCLH1BOD1AJsS2RF3LW3VnlBsylVwSaKvkg2s4bnqg3FQ210vT52mWirTY7KlLKp6
	SxXyAmWMleoASX/3ZtVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEDIq-00022f-BC; Tue, 17 Mar 2020 14:34:44 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEDIg-0001vS-RP; Tue, 17 Mar 2020 14:34:37 +0000
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr
 [86.202.105.35])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id C5F1324000A;
 Tue, 17 Mar 2020 14:34:28 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2] rtc: mt2712: fix build without PM_SLEEP
Date: Tue, 17 Mar 2020 15:34:21 +0100
Message-Id: <20200317143421.9551-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_073435_021263_CF9ED9B7 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-rtc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Rml4IHRoaXMgYnVpbGQgZXJyb3Igd2hlbiBQTV9TTEVFUCBpcyBub3Qgc2VsZWN0ZWQ6Cgpkcml2
ZXJzL3J0Yy9ydGMtbXQyNzEyLmM6NDEyOjEwOiBlcnJvcjog4oCYbXQyNzEyX3BtX29wc+KAmSB1
bmRlY2xhcmVkIGhlcmUgKG5vdCBpbiBhIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmG10Mjcx
Ml9ydGNfb3Bz4oCZPwogIDQxMiB8ICAgLnBtID0gJm10MjcxMl9wbV9vcHMsCiAgICAgIHwgICAg
ICAgICAgXn5+fn5+fn5+fn5+fgoKU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEJlbGxvbmkgPGFs
ZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPgotLS0KIGRyaXZlcnMvcnRjL3J0Yy1tdDI3MTIu
YyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3J0Yy9ydGMtbXQyNzEyLmMgYi9kcml2ZXJzL3J0Yy9ydGMtbXQyNzEyLmMKaW5kZXgg
NjJjMjAyNDE0MjZkLi41ODFiODczMWZiOGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcnRjL3J0Yy1t
dDI3MTIuYworKysgYi9kcml2ZXJzL3J0Yy9ydGMtbXQyNzEyLmMKQEAgLTQwOSw3ICs0MDksOSBA
QCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBtdDI3MTJfcnRjX2RyaXZlciA9IHsKIAku
ZHJpdmVyID0gewogCQkubmFtZSA9ICJtdDI3MTItcnRjIiwKIAkJLm9mX21hdGNoX3RhYmxlID0g
bXQyNzEyX3J0Y19vZl9tYXRjaCwKKyNpZmRlZiBDT05GSUdfUE1fU0xFRVAKIAkJLnBtID0gJm10
MjcxMl9wbV9vcHMsCisjZW5kaWYKIAl9LAogCS5wcm9iZSAgPSBtdDI3MTJfcnRjX3Byb2JlLAog
fTsKLS0gCjIuMjQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
