Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F416C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 11:36:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCD06206FB
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 11:36:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wN03+C1L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b="qkXroFtf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCD06206FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=laposte.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UD/mqCabS+wtL1kn0VInJ1Io/5vM2BPTQ58VMnUvv9M=; b=wN03+C1LlL+MwQt34ZS9t0t5n5
	lqFNQqPNBqK5C+4dPyCwSD7dDfgvWlTNGplYl7Dv1+rb7zqW9j5K+NWxqbxk4MQjhhnL+XjGkVBNc
	cUYnu8vTuRXkAgm4kNVg7AgqrFokVAozxyN2qbxtypy+pvSupiPwWwu8ZBj9XNaG2RGAGGi+Rgrnz
	kQB8Nq6i6pHnhsHfTUMG6Js8WSFMVI5y8drCP2hVdx9K6Gjb4zMgfSkttFIFW9DcOFFLP5OKxQJLE
	79RZjd3R5mWUxb3Rip6s9GiC5JpllpbOYW7zowJ4Yw5i+KmRzcfdK2cXVCJyUOBes0YXQN6dq8Xq7
	2//qUCKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdAtP-0004yk-Ln; Thu, 12 Nov 2020 11:35:55 +0000
Received: from smtp-outgoing.laposte.net ([160.92.124.109])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdAtI-0004v2-FP
 for linux-mediatek@lists.infradead.org; Thu, 12 Nov 2020 11:35:49 +0000
X-mail-filterd: {"version":"1.1.4", "queueID":"4CX0042YDYz10MQ4",
 "contextId":"ebf0f8af-98db-4cff-8680-f1f8c0471f72"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0120.laposte.net (SMTP Server) with ESMTP id 4CX0042YDYz10MQ4;
 Thu, 12 Nov 2020 12:35:32 +0100 (CET)
X-mail-filterd: {"version":"1.1.4", "queueID":"4CX0014104z10MQT",
 "contextId":"0e7ca37c-c656-48c2-9d8a-64fa72269c86"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
X-lpn-spamcause: OK,
 (-100)(0000)gggruggvucftvghtrhhoucdtuddrgedujedruddvfedgtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecunfetrffquffvgfdpqfgfvfdpggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepgghinhgtvghnthcuufhtvghhlhoruceovhhinhgtvghnthdrshhtvghhlhgvsehlrghpohhsthgvrdhnvghtqeenucggtffrrghtthgvrhhnpeetiedvheeijedtgfelvdfghfevtdevjeehffdtueekueeiudduteejkedtueffteenucfkphepkeekrdduvddurddugeelrdegleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopehrohhmuhgrlhgurdgsvghrghgvrhhivgdpihhnvghtpeekkedruddvuddrudegledrgeelpdhmrghilhhfrhhomhepvhhinhgtvghnthdrshhtvghhlhgvsehlrghpohhsthgvrdhnvghtpdhrtghpthhtohepsghgohhlrghsiigvfihskhhisegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvhhinhgtvghnthdrshhtvghhlhgvsehlrghpohhsthgvrdhnvghtpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpt
 hhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Received: from romuald.bergerie (unknown [88.121.149.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mlpnf0120.laposte.net (SMTP Server) with ESMTPSA id 4CX0014104z10MQT;
 Thu, 12 Nov 2020 12:35:29 +0100 (CET)
Received: from radicelle.bergerie (radicelle.bergerie [192.168.124.12])
 by romuald.bergerie (Postfix) with ESMTPS id 6D2913D20EA2;
 Thu, 12 Nov 2020 09:48:56 +0100 (CET)
Received: from vincent by radicelle.bergerie with local (Exim 4.94)
 (envelope-from <vincent@radicelle.bergerie>)
 id 1kd8Ho-0005k4-55; Thu, 12 Nov 2020 09:48:56 +0100
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
To: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] net: ethernet: mtk-star-emac: return ok when xmit drops
Date: Thu, 12 Nov 2020 09:48:33 +0100
Message-Id: <20201112084833.21842-1-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=laposte.net; s=lpn-wlmd;
 t=1605180933; bh=ZqIXuytQtqNakK+uXCSUANljRRTY4GRLTUpiu+kdDGU=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=qkXroFtfeDXHVkL5JrYMJbEpOBWXwVN0v+hsgX1vFu9aPdju1lBGTp9mgKStAOWVcLZ47bgOOV3Ks4oASsQbo9nwl+K5/+Zv9i2EBbBFWfEOohJSsTdf7fpOCxwY1no/ZD5meax5Lmgju6YY5T43l2tIGzfFHGOHG95KdhP2t+Pis0iTdRr9nss4sRW+AHhnWfVfIFqpi0Ap9W/jvlZW5zczP1DmKseIfOLPCfhmnbplxUEJIQLnuIw12aWPT9S14tK3IHH0+XN9H+WAZN6Pk6tMLJJixOv7eMrJ+jFg07sD/ZNZKcXT+ApI+ujKZbNOigx/Q8uH/MLIGrfuArTmgw==;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_063548_871392_07FAA2CF 
X-CRM114-Status: GOOD (  12.34  )
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
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "David S . Miller" <davem@davemloft.net>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

VGhlIG5kb19zdGFydF94bWl0KCkgbWV0aG9kIG11c3QgcmV0dXJuIE5FVERFVl9UWF9PSyBpZiB0
aGUgRE1BIG1hcHBpbmcKZmFpbHMsIGFmdGVyIGZyZWVpbmcgdGhlIHNvY2tldCBidWZmZXIuCkZp
eCB0aGUgbXRrX3N0YXJfbmV0ZGV2X3N0YXJ0X3htaXQoKSBmdW5jdGlvbiBhY2NvcmRpbmdseS4K
CkZpeGVzOiA4YzdiZDVhNDU0ZmYgKCJuZXQ6IGV0aGVybmV0OiBtdGstc3Rhci1lbWFjOiBuZXcg
ZHJpdmVyIikKU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBs
YXBvc3RlLm5ldD4KQ2M6IERhdmlkIFMuIE1pbGxlciA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4KQ2M6
IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+Ci0tLQogZHJp
dmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX3N0YXJfZW1hYy5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX3N0YXJfZW1hYy5jIGIvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX3N0YXJfZW1hYy5jCmluZGV4IDEzMjUwNTUzMjYzYjUuLmU1
NmEyNmY3OTdmMjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L21lZGlhdGVrL210
a19zdGFyX2VtYWMuYworKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRlay9tdGtfc3Rh
cl9lbWFjLmMKQEAgLTEwNTMsNyArMTA1Myw3IEBAIHN0YXRpYyBpbnQgbXRrX3N0YXJfbmV0ZGV2
X3N0YXJ0X3htaXQoc3RydWN0IHNrX2J1ZmYgKnNrYiwKIGVycl9kcm9wX3BhY2tldDoKIAlkZXZf
a2ZyZWVfc2tiKHNrYik7CiAJbmRldi0+c3RhdHMudHhfZHJvcHBlZCsrOwotCXJldHVybiBORVRE
RVZfVFhfQlVTWTsKKwlyZXR1cm4gTkVUREVWX1RYX09LOwogfQogCiAvKiBSZXR1cm5zIHRoZSBu
dW1iZXIgb2YgYnl0ZXMgc2VudCBvciBhIG5lZ2F0aXZlIG51bWJlciBvbiB0aGUgZmlyc3QKLS0g
CjIuMjguMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
