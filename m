Return-Path: <SRS0=uG8S=M4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3EE0C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 13:13:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA5A56113B
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 13:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA5A56113B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IdPfJKjjF9XAp6I16DZ0VPvk8oc/TW01WxYtLS3WoY0=; b=I1IFyegNox1zOQ
	nTR7Zkn9tcR8/eYNisjWSlGawNvLN9cgWINYwFo0fM17Rw3DsxCLQR7PjPgwjZtNJ2zzf/28l7tm+
	ZZjuruo0C4LlPa3RNp0lOCUmG1yaXYWG+kjAGTuXxaPScalzZF/vU9W9mNFXEO+2fgjnbC1SGbRlr
	txocBINBtWvvdck39SXewrkWIMVW8P+VfXjQTgLRkMnzNAq/1m+BDQqYTVaL0zWScGzqV9C0kSrvQ
	YfUMRCLAgjoktA6Bh2/Nw7xGpLaAHlRLptucGUhp6jMZGU5dTeWRVe+OHfe7QrhyQkSDpiTgs6TTJ
	YfaY3R3fdG+/WOEwY4Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBdBK-009dSF-5B; Thu, 05 Aug 2021 13:13:06 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBdBG-009dR1-4X
 for linux-mediatek@lists.infradead.org; Thu, 05 Aug 2021 13:13:04 +0000
Received: from smtpclient.apple (p5b3d23f8.dip0.t-ipconnect.de [91.61.35.248])
 by mail.holtmann.org (Postfix) with ESMTPSA id 4EC50CECF0;
 Thu,  5 Aug 2021 15:12:49 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH v5 1/2] Bluetooth: btusb: Record debug log for Mediatek
 Chip.
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <4e9d536cb6a7cffb829f105183f2bb5bceb4122c.camel@linux.intel.com>
Date: Thu, 5 Aug 2021 15:12:48 +0200
Cc: Mark-YW.Chen@mediatek.com, Johan Hedberg <johan.hedberg@gmail.com>,
 chris.lu@mediatek.com, will-cy.lee@mediatek.com,
 Sean Wang <sean.wang@mediatek.com>,
 BlueZ <linux-bluetooth@vger.kernel.org>,
 linux-mediatek@lists.infradead.org,
 open list <linux-kernel@vger.kernel.org>,
 Michael Sun <michaelfsun@google.com>, shawnku@google.com,
 jemele@google.com, Archie Pusaka <apusaka@google.com>,
 Miao-chen Chou <mcchou@chromium.org>
Message-Id: <22F94464-EF65-4676-AC61-1E13E22A837F@holtmann.org>
References: <20210804090316.12080-1-mark-yw.chen@mediatek.com>
 <8988B918-95FD-42DE-95FA-3BAC4A144165@holtmann.org>
 <4e9d536cb6a7cffb829f105183f2bb5bceb4122c.camel@linux.intel.com>
To: Tedd Ho-Jeong An <tedd.an@linux.intel.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_061302_359279_14024378 
X-CRM114-Status: UNSURE (   7.92  )
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

SGkgVGVkZCwKCj4gSSBjYW5ub3QgZmluZCB0aGUgb3JpZ2luYWwgcGF0Y2ggZW1haWwgYW5kIENJ
IHJlcG9ydCwgaG93ZXZlciB0aGlzIHBhdGNoIHRocm93cyB0aGlzIHdhcm5pbmcuCj4gCj4gZHJp
dmVycy9ibHVldG9vdGgvYnR1c2IuYzogSW4gZnVuY3Rpb24g4oCYYnR1c2JfcmVjdl9hY2xfbXRr
4oCZOgo+IGRyaXZlcnMvYmx1ZXRvb3RoL2J0dXNiLmM6NDAzMzozOiB3YXJuaW5nOiB0aGlzIHN0
YXRlbWVudCBtYXkgZmFsbCB0aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KPiA0MDMz
IHwgICB1c2JfZGlzYWJsZV9hdXRvc3VzcGVuZChkYXRhLT51ZGV2KTsKPiAgICAgIHwgICBefn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IGRyaXZlcnMvYmx1ZXRvb3RoL2J0dXNi
LmM6NDAzNDoyOiBub3RlOiBoZXJlCj4gNDAzNCB8ICBjYXNlIDB4MDVmZjogIC8qIEZpcm13YXJl
IGRlYnVnIGxvZ2dpbmcgMSAqLwo+ICAgICAgfCAgXn5+fgoKdGhlIC8qIGZhbGwgdGhyb3VnaCAq
LyBjb21tZW50IGlzIG1pc3NpbmcuCgpSZWdhcmRzCgpNYXJjZWwKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
