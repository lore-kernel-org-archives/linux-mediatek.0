Return-Path: <SRS0=mu4u=HG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA398C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 01:13:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6604064F5F
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 01:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6604064F5F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ky6zFI8He1AW3tA7DJ1pp8C3LWj1NZactQCjHJgtvPE=; b=eT31+nFyk1DFWg+bLVD+dhuT/Y
	UiT2yjCrJTAKQia4XYbr61ink4xt8D9pREz6QhpI+N2ZJTh2KOHDeunGOtVGELvmbranqr4eiEnGn
	k7mu24S69zHMw3c9md7AKmgfoYGFmKW7Tqy2GW2kI4fFxXY6lamsvkmp6/P0lNofedo7mqGPYJLlW
	f4muRuoiAeDYLFs8eiZ2iqaqv8KUnbglrQswFrxg84Y43rv7XAwQnSVDJAqCiuQcPR8QUClMTJjQ8
	VViRqhzzJthqajUvZQ1fCrD4Qyp4g+DlmapGUVFzLv+Kfe0B8q+vqFiB/xzwAydslJ4cIVtHWwsp+
	N3k3yGGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7TCz-000645-1C; Thu, 04 Feb 2021 01:13:21 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7TCu-00061s-9p; Thu, 04 Feb 2021 01:13:18 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DWL9f17CqzjJlD;
 Thu,  4 Feb 2021 09:11:50 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Thu, 4 Feb 2021
 09:12:58 +0800
From: Ye Bin <yebin10@huawei.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>, <luiz.dentz@gmail.com>, 
 <matthias.bgg@gmail.com>, <linux-bluetooth@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH] Bluetooth: btusb: remove set but not used variable in
 btusb_mtk_setup_firmware_79xx
Date: Thu, 4 Feb 2021 09:18:56 +0800
Message-ID: <20210204011856.3685334-1-yebin10@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_201317_108770_F5EF5D18 
X-CRM114-Status: UNSURE (   7.05  )
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
Cc: Hulk Robot <hulkci@huawei.com>, Ye Bin <yebin10@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Rml4IGZvbGxvdyB3YXJuaW5nOgpkcml2ZXJzL2JsdWV0b290aC9idHVzYi5jOjM0Nzk6OTogd2Fy
bmluZzogdmFyaWFibGUg4oCYZndfc2l6ZeKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1i
dXQtc2V0LXZhcmlhYmxlXQogIHNpemVfdCBmd19zaXplOwogICAgICAgICBefn5+fn5+CmRyaXZl
cnMvYmx1ZXRvb3RoL2J0dXNiLmM6MzQ3MzoyOTogd2FybmluZzogdmFyaWFibGUg4oCYcGF0Y2ho
ZHLigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KICBzdHJ1
Y3QgYnRtdGtfcGF0Y2hfaGVhZGVyICpwYXRjaGhkciA9IE5VTEw7CiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXn5+fn5+fn4KClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVh
d2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogWWUgQmluIDx5ZWJpbjEwQGh1YXdlaS5jb20+Ci0tLQog
ZHJpdmVycy9ibHVldG9vdGgvYnR1c2IuYyB8IDQgLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibHVldG9vdGgvYnR1c2IuYyBiL2RyaXZl
cnMvYmx1ZXRvb3RoL2J0dXNiLmMKaW5kZXggZWVhZmI4NDMyYzBmLi45NjA5YjZjYmYyMGYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvYmx1ZXRvb3RoL2J0dXNiLmMKKysrIGIvZHJpdmVycy9ibHVldG9v
dGgvYnR1c2IuYwpAQCAtMzQ3MCwxMyArMzQ3MCwxMSBAQCBzdGF0aWMgaW50IGJ0dXNiX210a19o
Y2lfd210X3N5bmMoc3RydWN0IGhjaV9kZXYgKmhkZXYsCiBzdGF0aWMgaW50IGJ0dXNiX210a19z
ZXR1cF9maXJtd2FyZV83OXh4KHN0cnVjdCBoY2lfZGV2ICpoZGV2LCBjb25zdCBjaGFyICpmd25h
bWUpCiB7CiAJc3RydWN0IGJ0bXRrX2hjaV93bXRfcGFyYW1zIHdtdF9wYXJhbXM7Ci0Jc3RydWN0
IGJ0bXRrX3BhdGNoX2hlYWRlciAqcGF0Y2hoZHIgPSBOVUxMOwogCXN0cnVjdCBidG10a19nbG9i
YWxfZGVzYyAqZ2xvYmFsZGVzYyA9IE5VTEw7CiAJc3RydWN0IGJ0bXRrX3NlY3Rpb25fbWFwICpz
ZWN0aW9ubWFwOwogCWNvbnN0IHN0cnVjdCBmaXJtd2FyZSAqZnc7CiAJY29uc3QgdTggKmZ3X3B0
cjsKIAljb25zdCB1OCAqZndfYmluX3B0cjsKLQlzaXplX3QgZndfc2l6ZTsKIAlpbnQgZXJyLCBk
bGVuLCBpLCBzdGF0dXM7CiAJdTggZmxhZywgZmlyc3RfYmxvY2ssIHJldHJ5OwogCXUzMiBzZWN0
aW9uX251bSwgZGxfc2l6ZSwgc2VjdGlvbl9vZmZzZXQ7CkBAIC0zNDkwLDggKzM0ODgsNiBAQCBz
dGF0aWMgaW50IGJ0dXNiX210a19zZXR1cF9maXJtd2FyZV83OXh4KHN0cnVjdCBoY2lfZGV2ICpo
ZGV2LCBjb25zdCBjaGFyICpmd25hbQogCiAJZndfcHRyID0gZnctPmRhdGE7CiAJZndfYmluX3B0
ciA9IGZ3X3B0cjsKLQlmd19zaXplID0gZnctPnNpemU7Ci0JcGF0Y2hoZHIgPSAoc3RydWN0IGJ0
bXRrX3BhdGNoX2hlYWRlciAqKWZ3X3B0cjsKIAlnbG9iYWxkZXNjID0gKHN0cnVjdCBidG10a19n
bG9iYWxfZGVzYyAqKShmd19wdHIgKyBNVEtfRldfUk9NX1BBVENIX0hFQURFUl9TSVpFKTsKIAlz
ZWN0aW9uX251bSA9IGdsb2JhbGRlc2MtPnNlY3Rpb25fbnVtOwogCi0tIAoyLjI1LjQKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
