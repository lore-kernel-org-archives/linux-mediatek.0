Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A01C432BE
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 12:50:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4644B61181
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 12:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4644B61181
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xA87pdZhs7EyH0lEcsT6KH5IzGZHtl+Pn1o758UfTzA=; b=DHXJaJbvVGuo+6
	OxVO2K/PqYTFfebUqaQPOjFB53nLi9Pllo/ELTBve+D8XXu3JHSVpFVI+hDmWncA2kXIoLfuJ8jP2
	SgkfjwT91PkqXvELc+yboIjQAux6Yw2DdkmnBHumnBB5qw6Y7s5tb/Uq+C4gq7ih969dvhTFBrOPp
	O0md7bxQBSaqW59v4rnD4hKeOpfGMwERueHBoW6dLlziawsqb6iAvkQWQKl6Hx1Jv1rF2sZNcjJ8o
	04yTwoVbkJOkcOQs92CAGMJjwRy3sAz7Pflcwm2SG5GJ6KdyDttpshspCvXkeg00WCEXXQ/Ktdymc
	B3HcMuGUelkK9OpgH55g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBzIn-00CW3K-1x; Fri, 06 Aug 2021 12:50:17 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBzIj-00CW01-9R
 for linux-mediatek@lists.infradead.org; Fri, 06 Aug 2021 12:50:15 +0000
Received: from smtpclient.apple (p5b3d23f8.dip0.t-ipconnect.de [91.61.35.248])
 by mail.holtmann.org (Postfix) with ESMTPSA id 99CEACED0D;
 Fri,  6 Aug 2021 14:50:05 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH 1/1] Bluetooth: btusb: Fix fall-through warnings
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210806013516.26148-1-mark-yw.chen@mediatek.com>
Date: Fri, 6 Aug 2021 14:50:05 +0200
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 Tedd Ho-Jeong An <tedd.an@linux.intel.com>, chris.lu@mediatek.com,
 will-cy.lee@mediatek.com, Sean Wang <sean.wang@mediatek.com>,
 BlueZ <linux-bluetooth@vger.kernel.org>,
 linux-mediatek@lists.infradead.org,
 open list <linux-kernel@vger.kernel.org>,
 Michael Sun <michaelfsun@google.com>, shawnku@google.com,
 jemele@google.com, Archie Pusaka <apusaka@google.com>,
 Miao-chen Chou <mcchou@chromium.org>
Message-Id: <ECE92D22-1581-4B04-BD3A-19741B15449E@holtmann.org>
References: <20210806013516.26148-1-mark-yw.chen@mediatek.com>
To: Mark-YW.Chen@mediatek.com
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_055013_554352_03A6A1E7 
X-CRM114-Status: UNSURE (   8.42  )
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

SGkgTWFyaywKCj4gRml4IGZhbGwtdGhyb3VnaCB3YXJuaW5nczoKPiBkcml2ZXJzL2JsdWV0b290
aC9idHVzYi5jOiBJbiBmdW5jdGlvbiDigJhidHVzYl9yZWN2X2FjbF9tdGvigJk6Cj4gZHJpdmVy
cy9ibHVldG9vdGgvYnR1c2IuYzo0MDMzOjM6IHdhcm5pbmc6Cj4gdGhpcyBzdGF0ZW1lbnQgbWF5
IGZhbGwgdGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCj4gNDAzMyB8ICAgdXNiX2Rp
c2FibGVfYXV0b3N1c3BlbmQoZGF0YS0+dWRldik7Cj4gICAgICB8ICAgXn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiBkcml2ZXJzL2JsdWV0b290aC9idHVzYi5jOjQwMzQ6Mjog
bm90ZTogaGVyZQo+IDQwMzQgfCAgY2FzZSAweDA1ZmY6ICAvKiBGaXJtd2FyZSBkZWJ1ZyBsb2dn
aW5nIDEgKi8KPiAgICAgIHwgIF5+fn4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBtYXJrLXl3LmNoZW4g
PG1hcmsteXcuY2hlbkBtZWRpYXRlay5jb20+Cj4gLS0tCj4gZHJpdmVycy9ibHVldG9vdGgvYnR1
c2IuYyB8IDEgKwo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKcGF0Y2ggaGFzIGJl
ZW4gYXBwbGllZCB0byBibHVldG9vdGgtbmV4dCB0cmVlLgoKUmVnYXJkcwoKTWFyY2VsCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
