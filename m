Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11172C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 May 2022 12:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yaOVMKOk+UO97xIk9Mvk9Ts6u4FhcDm1z8zHv1hwGys=; b=ginNmZc/5LtGF5
	fZANAKY1+bBIWh7hs1ptYqVj6CiUhk53yt1zUvv3W+Vk8qgSDvoNfS3VaB0vWGY19DSWSVsCPrgHW
	uEhUCOVdrtlh86izr9HINQn6LCCdisZDAq9aCCIwNftaLLOOJWy4V3Xiw04tKmvkYlZ/F6l9T/uiv
	FlcXb09ixWY+yOyhgDBPmIsVWrlcGB3JQRflasf4i9RTXEFJ2kxRyaFh6GuAj8gI4fD+JO8xVGQ0v
	g3VJxfx9f7wDvZ1B8tt0lEeJBvijzaO7Eb/JGQLXDutXNqKm9wJhZtsJ7JENbsmpNODK5f8TpTlfi
	QaYEyd/iqw474eyocrcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntqZn-00BAcB-Fq; Wed, 25 May 2022 12:57:23 +0000
Received: from hwsrv-970840.hostwindsdns.com ([2607:5501:3000:21a5::2] helo=box.indicandustries.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntqZl-00BAbN-4S
	for linux-mediatek@lists.infradead.org; Wed, 25 May 2022 12:57:22 +0000
Received: from authenticated-user (box.indicandustries.com [104.168.149.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by box.indicandustries.com (Postfix) with ESMTPSA id 15C7C107D94
	for <linux-mediatek@lists.infradead.org>; Tue, 24 May 2022 03:25:25 -0600 (MDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=box.indicandustries.com; s=mail; t=1653384326;
	bh=V6VCn7WEbqHjVVQ20/+SYu6rwS1WmTHcxX88g+j430s=;
	h=Reply-To:From:To:Subject:Date:From;
	b=Lc6GhV0jBvjV17cL/u5iv4+Oi5OUoNVHX5H3nIDI3o+gqNF1OSXn0vq0CU6ZMAydK
	 3yuVzhfWWpWligy+CXHYoqn0bbBCv0XVHejo31UTk1SRfcsGTkLO9HPPEJBIahu3Pz
	 IMvR30lyA2xafWCewHuaBFNTR4ue0Ejn8NWsNF7sZIrAJvhbzOxvJ48Nq/3sfoht/p
	 QXr+z+/39Slw6czikQ6OSjR1p0a8j+pNgCdfkKLr+ERz5jrQMbkh1Lj8hjYncrWO8p
	 V/QcsPCY6U6ageL2FZ1OuSapDphgkYDPXyl0h0dpy5k/atnkXVWZbRPV4OZliU+HeZ
	 7nAweFn6o2yFA==
From: amjad.ali@box.indicandustries.com
To: linux-mediatek@lists.infradead.org
Subject: Hello Sir, I seek your urgent consideration.
Date: 24 May 2022 11:25:25 +0200
Message-ID: <20220524112525.8F58802496B741DF@box.indicandustries.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_055721_225230_7AA84ED6 
X-CRM114-Status: UNSURE (   1.69  )
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
Reply-To: amjalia90@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpHcmVldGluZ3M/IEkgYW0gQW1qYWQuIEkgd29yayB3aXRoIGEgbGVhZGluZyBCaW8g
RmlybS4gIER1ZSB0byAKdGhlIHNldGJhY2tzIG9mIHRoZSBwYW5kZW1pYywgbXkgY29tcGFueSBo
YXMgb3BlbmVkIGEgYmlkIGluIApzZWFyY2ggb2YgbmV3IHN1cHBsaWVycyBmb3IgYmFzaWMgcmF3
IG1hdGVyaWFscyBuZWVkZWQgaW4gCnByb2R1Y3Rpb24uCgpJIGFtIHNlZWtpbmcgYSByZXByZXNl
bnRhdGl2ZcKgYXMgSSBhbSBhIHN0YWZmLCBJIGNhbiBub3QgYmUgCmludm9sdmVkIGRpcmVjdGx5
LiBJdCBtYXkgbm90IGJlIHlvdXIgYXJlYSBvZiB3b3JrIGJ1dCB0aGUgCnByb2ZpdHMgYXJlIGdy
ZWF0IGFuZCBJIHdpbGwgZ3VpZGUgeW91IHRocm91Z2guIEkgaGF2ZSBhbHJlYWR5IApzb3VyY2Vk
IGEgbG9jYWwgc3VwcGxpZXIgZm9yIHRoaXMuIEkgb25seSBuZWVkIGEgcmVsaWFibGUgCnJlcHJl
c2VudGF0aXZlLgoKUGxlYXNlIGdldCBiYWNrIHRvIG1lIHNvIEkgY2FuIGV4cGxhaW4gdGhpcyBp
biBmdWxsLgoKQW1qYWQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
