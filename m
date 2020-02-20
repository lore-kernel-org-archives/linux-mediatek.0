Return-Path: <SRS0=Q2+k=4I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=3.0 tests=DEAR_BENEFICIARY,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,HK_SCAM,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URG_BIZ autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631C1C11D0C
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Feb 2020 19:52:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39BA6206F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Feb 2020 19:52:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aJ8qXfLl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wQevc5nx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39BA6206F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=corisbank.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DAk64Z27OVILN1Jg6PUhDErQgTHXTwmhnZtS0rG0y0M=; b=aJ8qXfLlMK5h5q
	Lb6XZcu7FDf2bhMP+kNvznNkiOSEWxSNDCqnAe1NqZxssttQSaWVj2UbZkoUNSMDp/zR0cHSiFfG5
	cP7/CBJ43Ilo+F/pqG3VN/36zQ4oVXEvWU5P3Bzhc0MeZ1aNszTJSApNzZbWJHCIiswuU0cgogqa1
	fuuFw3UthrV07JqnwPi/ot5nR8nUVtdspjqOkI8RuAhAeK0pLcJQpGpGuqAYZQKhvdpbr9UsmbiC7
	nWJ+Y7E5btrwvFOP4xAeGTsgMGwK4AxAKOCLBglCIQt+F196OgPa3j3ilLCMKISz36rLS2K0qn3bn
	jGl4sY2m76qtc5x4Pm5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4rsD-0007dh-9G; Thu, 20 Feb 2020 19:52:37 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4rsB-0007cj-9V
 for linux-mediatek@bombadil.infradead.org; Thu, 20 Feb 2020 19:52:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=8w7bKYTtADHLVIhvvrRu3AhNjWaymp5D5LUBvhQ1Lvs=; b=wQevc5nx3mtu+cxOCUBv95IYIE
 nA9nlWQDHOIftZZGzRQXkOpnBRkxoXSOEprs1+SK0uIhJQr9YLCWnu/hdqdJSYqFbrXll7rnAW9EL
 3Q2efdAGt9W4WJAYBu0P4pOcS/Gi6IK+xb1sQkZANyvWN/QKxc7hyC7zX4diVtPAAcFg3OivzwRlA
 ve1osXAf4HuW1EGs7ibRERRhv/wLC3lsdr2/Do67nSrNflWB9jRCPfyhpbbujUND2iTzj8yUwqa34
 xblJvrs5LRLbvmH1xN7SquFs6XQNogPD8cgOjdMy+fljqgV/t9r7abWEmT/cwx3OhLuE6P2Dk0dK1
 M/Qmn/zw==;
Received: from rbpf.bs ([24.51.93.195] helo=mail2.rbpf.bs)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4rs9-0003xf-83
 for linux-mediatek@lists.infradead.org; Thu, 20 Feb 2020 19:52:33 +0000
Received: from unknown (HELO corisbank.com) ([103.207.36.17])
 by mail2.rbpf.bs with ESMTP; 20 Feb 2020 14:46:19 -0500
From: Coris Bank <derek@corisbank.com>
To: linux-mediatek@lists.infradead.org
Subject: Are you still alive? Urgent reply is needed
Date: 20 Feb 2020 11:46:16 -0800
Message-ID: <20200220114616.8D4F90661E1FCCAE@corisbank.com>
MIME-Version: 1.0
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
Reply-To: kentpace@sina.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RGVhciBCZW5lZmljaWFyeSwKCgpQbGVhc2UgY29uZmlybSBpZiB5b3UgYXJlIHN0aWxsIGFsaXZl
IGJlY2F1c2UgdHdvIGdlbnRsZSBtZW4gCndhbGtlZCBpbnRvIG15IG9mZmljZSB0aGlzIG1vcm5p
bmcgdG8gY2xhaW0geW91ciBpbmhlcml0YW5jZSAKZnVuZHMgd2l0aCBvdXIgYmFuay4gVGhleSBz
YWlkIHlvdSBhcmUgZGVhZCBhbmQgdGhhdCB0aGV5IGFyZSAKeW91ciByZXByZXNlbnRhdGl2ZXMu
IAoKT24gTm92ZW1iZXIgMjEsIDIwMDguIEEgYnVzaW5lc3MgbWFuIChuYW1lIHdpdGhoZWxkIGZv
ciBzZWN1cml0eSAKcmVhc29ucykgd2Fsa2VkIGludG8gb3VyIGJhbmsgdG8gb3BlbiBhIE5PTiBS
RVNJREVOQ0UgQUNDT1VOVCBhbmQgCm1hZGUgeW91IGhpcyBORVhUIE9GIEtJTi4KSSBnb3QgeW91
ciBlbWFpbCBhZGRyZXNzIGZyb20gdGhlIGZpbGUgb2YgeW91ciBiZW5lZmFjdG9yIGFzIGhpcyAK
TkVYVCBPRiBLSU4uCkl0J3MgYmVlbiB5ZWFycyB3ZSBjb25maXJtZWQgeW91ciBiZW5lZmFjdG9y
J3MgZGVhdGggYW5kIHlvdSBoYXZlIApub3QgY29udGFjdGVkIG91ciBiYW5rIHRvIGNsYWltIHlv
dXIgaW5oZXJpdGFuY2UuIFlvdSBoYXZlIGEgCnRvdGFsIGJhbGFuY2Ugb2Yg4oKsMjksMDcxLDk3
MC4wMC4KClRoZSBnZW50bGVtZW4gc3VibWl0dGVkIGFuIGFkZHJlc3Mgd2hlcmUgdGhleSB3YW50
IHlvdXIgVklTQSAKREVCSVQKQVRNIENBUkQgc2VudC4KCklmIHlvdSBhcmUgc3RpbGwgYWxpdmUs
IHBsZWFzZSBpbmRpY2F0ZSBieSBzZW5kaW5nIHlvdXIgZnVsbApjb250YWN0IGRldGFpbHMgd2l0
aGluIDcgZGF5IG9mIHJlY2VpdmluZyB0aGlzIG1lc3NhZ2UsIGZhaWx1cmUKdG8gZG8gc28sIEkg
d2lsbCBzZW5kIHRoZSBjYXJkIHRvIHRoZSBhZGRyZXNzIHN1Ym1pdHRlZCBieSB5b3VyCnJlcHJl
c2VudGF0aXZlcy4KCgpSZWdhcmRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
