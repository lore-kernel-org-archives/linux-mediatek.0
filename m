Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3D4C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 04:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Message-ID:Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Date:From:To:Subject:
	Content-Description:Mime-Version:Cc:Content-ID:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DF4Y/5XPXAncjHbXGWrPuuY73xydCFIWDVJW+/2VBJg=; b=eKzFmx1iO77OKJ
	E/Y8CS87rbX0WBQAx/2rk4yOOBiunkhAD+5e5QgyT8FANLIgxmz455HIAhrlVFt121jWkbCJ+KxW6
	wJBbniFl5K7KTTDCV5qHk3sKIHaEQTGvwwR2MqakutUVeF+QYriQ1H4EOJsIBYa40QNzupbMmS+Am
	8/b4sjb3F7Rv1wXaUkYpJMwTxdF737G1Gs/J43yS/Q6X9zANW5xBYWGzLQX9kk6DQxZGWtPuEhWej
	aaKvf/1gRY9SaOMwzReU3DwpHNoeWoi16c4QVt+Wl0/14Ca01QnoktWcOThOWTAvGauYu81WT82p7
	cy7L0YwIZSOzN+EgnnHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np0hh-00A0CJ-J9; Thu, 12 May 2022 04:45:33 +0000
Received: from [94.249.236.152] (helo=host.securemail.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np0hf-00A0Av-8o
 for linux-mediatek@lists.infradead.org; Thu, 12 May 2022 04:45:32 +0000
Received: from [103.252.117.68] (unknown [103.252.117.68])
 by host.securemail.com (Postfix) with ESMTPA id B945EA14089
 for <linux-mediatek@lists.infradead.org>; Thu, 12 May 2022 07:39:49 +0300 (MSK)
Mime-Version: 1.0
Content-Description: Mail message body
Subject: Your kind attention
To: linux-mediatek@lists.infradead.org
From: mathejohnson91@gmail.com
Date: Thu, 12 May 2022 07:39:48 +0300
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_214531_488424_5B3D61C9 
X-CRM114-Status: SPAM  (  -6.01  )
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
Reply-To: mathew@mjsconsortium.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Message-ID: <E1np0hh-00A0CJ-J9@bombadil.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGVsbG8gdGhlcmUsCgpNeSBuYW1lcyBhcmUgTWF0aGV3IEpvaG5zb24sIEkgYW0gcmVwcmVzZW50
aW5nIHRoZSBpbnRlcmVzdCBvZiBhIGNlcnRhaW4gcG9saXRpY2FsbHkgZXhwb3NlZCBwZXJzb24s
IHdlIGFyZSBsb29raW5nIGZvciBwYXJ0bmVycyBvdmVyc2VhcyB0aGF0IGNhbiBtYW5hZ2UgaGln
aC12YWx1ZSBmdW5kcyBmb3IgYSBwZXJpb2Qgb2YgNS0xMCB5ZWFycywgdGhlIGZ1bmRzIGhhdmUg
YmVlbiBhY2NydWVkIGJ5IHRoZSBpbmZsdWVuY2Ugb2YgdGhlIHBvd2VyIG9mIG15IGJlbmVmYWN0
b3LigJlzIG9mZmljZS4KClBsZWFzZSBkbyBjb250YWN0IG1lIGlmIHlvdSBhcmUgaW50ZXJlc3Rl
ZCBhbmQgSSB3aWxsIGV4cGxhaW4gdGhlIGJ1c2luZXNzIHRvIHlvdSBpbiBkZXRhaWwgZm9yIHlv
dSB0byBiZXR0ZXIgdW5kZXJzdGFuZCB0aGUgdHJhbnNhY3Rpb24sIEkgY2FuIGFzc3VyZSB5b3Ug
dGhhdCB0aGlzIHdpbGwgYmUgb2YgbXV0dWFsIGJlbmVmaXQgdG8gYWxsLgoKWW91IGNhbiByZXNw
b25kIHRvIG1lIGFuZCBpbGwgc2VuZCB5b3UgYSBkZXRhaWxlZCBleHBsYW5hdGlvbgoKWW91cnMu
CgpNYXRoZXcgSm9obnNvbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsK
