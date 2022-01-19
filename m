Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D1CC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 17:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ydc3aig1DvoHDNYg0DrUMgQR4COiliF+naVuqRu5K0k=; b=x2N76p+GUFSa7w
	PM6O2kr4jxUlEYE8sbc/3W7tUZ7FDJ6U9xJ9MAKrQ+LuhUKLtf1xNVqGY+gDCCuJyiTSIyqn3j99C
	r53/URhYiMnhk4LSmySLCNH/Gyv+g4ik0eqjxeKtk/m/wO0+gfnwnWb4Lo2UClrM449vTO/iL8X/X
	F7X3aL7YrqDlxdsDPvASY6DO6DYBKJQn7L9AXnv8K/gyNx+dwC8v+ZEvqZ+OMgrSqC64rEGa/HhBr
	BsF0rNJkQ43vyhCyc/oeivJB4bEXNEFYqtGjRKZ9Jl0KHYKryrLcgTNP90fmk+Z/dZz2L515N9HQZ
	AQcpLEDnWNx4kQ2xhySg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAEhl-006Yef-Gj; Wed, 19 Jan 2022 17:25:05 +0000
Received: from eu-shark1.inbox.eu ([195.216.236.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAEhi-006YdO-4q
 for linux-mediatek@lists.infradead.org; Wed, 19 Jan 2022 17:25:04 +0000
Received: from eu-shark1.inbox.eu (localhost [127.0.0.1])
 by eu-shark1-out.inbox.eu (Postfix) with ESMTP id 406A66C0074E;
 Wed, 19 Jan 2022 19:24:56 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
 t=1642613096; bh=2ocrVwEK3JEDTeF+8QmkZiiLdEIYKrfKfVhvZh/P5Bc=;
 h=Date:From:To:Subject:Message-ID:Content-Type:X-ESPOL:from:date;
 b=iG9Mrn8jaNLyYkkloMjcgyRooNJHUfzwGUFruqm1KK9GrPLhq1DuM4mSAN5dDEm19
 /A6ImwfYycZHU9+r7F6O+XYj47+/aBmZDylNE5F+dXj9qIyPB3TzNdtdwR59qrDyDC
 tg56gvrYKSpAI1xZj5DYPDppRJStIIZ0ZWwH8FYQ=
Received: from localhost (localhost [127.0.0.1])
 by eu-shark1-in.inbox.eu (Postfix) with ESMTP id 3298A6C0074B;
 Wed, 19 Jan 2022 19:24:56 +0200 (EET)
Received: from eu-shark1.inbox.eu ([127.0.0.1])
 by localhost (eu-shark1.inbox.eu [127.0.0.1]) (spamfilter, port 35)
 with ESMTP id G1qKrkS23hMb; Wed, 19 Jan 2022 19:24:55 +0200 (EET)
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
 by eu-shark1-in.inbox.eu (Postfix) with ESMTP id 752616C0074A;
 Wed, 19 Jan 2022 19:24:55 +0200 (EET)
Date: Wed, 19 Jan 2022 20:24:49 +0300
From: Boris Lysov <arzamas-16@mail.ee>
To: linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Looking for help with mt6577 clock driver
Message-ID: <20220119202449.02a8b421@pc>
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: 885ml41QGzuilFygRWXfBgUrzVlEXvGWher6j11F/g/3MCuNeEoFVBSznnAFPnHC3iM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_092502_563855_5849DBCA 
X-CRM114-Status: UNSURE (   7.44  )
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

SGVsbG8hCgpJJ20gZGV2ZWxvcGluZyBhIG1haW5saW5lIGtlcm5lbCBmb3IgbXQ2NTc3IHdoaWNo
IGlzIGEgZHVhbC1jb3JlIENvcnRleC1BOQpTb0MgZm9yIHNtYXJ0cGhvbmVzL3RhYmxldHMuCgpJ
J20gc3R1Y2sgYXQgdGhlIGNsb2NrIGRyaXZlciB3aGljaCBsb29rcyBoYXJkIHRvIGltcGxlbWVu
dCBmb3Igc3VjaCBhbiBvbGQKcGxhdGZvcm0gdXNpbmcgbWFpbmxpbmUgY29kZWJhc2UgZnJvbSBN
ZWRpYXRlay4gSSBkbyBzZWUgY29tbW9uIHBhdHRlcm5zIGxpa2UKdXNpbmcgdmFyaW91cyBzdWJz
eXN0ZW1zIGZvciBjbG9jayBtYW5hZ2VtZW50IChhcG1peGVkLCBwZXJpY2ZnLCBtbXN5cykgYnV0
CndoYXQgSSdtIGZhaWxpbmcgdG8gdW5kZXJzdGFuZCBpcyBob3cgYXJlIGNsb2NrcyByZWxhdGVk
IHRvIGVhY2ggb3RoZXIgKGZvcgpleGFtcGxlIG11eGVkIG9uZXMpIGFuZCB3aGF0IGV4YWN0bHkg
ZHJpdmVzIGVhY2ggY2xvY2suIAoKQW5hbHl6aW5nIE1lZGlhdGVrIGRvd25zdHJlYW0ga2VybmVs
IGNvZGUgWzFdWzJdIGRpZG4ndCBoZWxwIG1lIG11Y2ggYmVjYXVzZSBpdAp3b3JrcyBpbiBhICJ3
cml0ZSBzb21lIG1hZ2ljIHZhbHVlcyB0byBmaXJlIGV2ZXJ5dGhpbmcgdXAgYmVjYXVzZSB3aHkg
bm90PyIgWzNdCndheS4gUmlnaHQgbm93IG15IGFwcHJvYWNoZXMgYXJlIGR1bXBpbmcgYW5kIGFu
YWx5emluZyBoYXJkd2FyZSByZWdpc3RlcnMgd2hpbGUKdGhlIGRldmljZSBydW5zIGRvd25zdHJl
YW0ga2VybmVsIFs0XSwgYW5kIGp1c3QgYSBwbGFpbiBndWVzc3dvcmsgd2hpY2ggSQp0aGluayBp
cyByYXRoZXIgdW5yZWxpYWJsZS4gCgpGcm9tIMKnMy4zIG9mIFs1XSBJIHVuZGVyc3RhbmQgdGhh
dCBMS01MIGlzIG5vdCBhIGhlbHBkZXNrIGJ1dCBJIHN0aWxsIHdvdWxkCmxpa2UgdG8gYXNrIGZv
ciBhbnkgdGlwcyByZWdhcmRpbmcgd3JpdGluZyBhIGdvb2QgY2xvY2sgZHJpdmVyLCBlc3BlY2lh
bGx5IGhvdwp0byBkZXRlcm1pbmUgaG93IGFyZSBjbG9ja3MgcmVsYXRlZCB0byBlYWNoIG90aGVy
LiBDYW4gc29tZW9uZSBmcm9tIE1lZGlhdGVrCmV4cGxhaW4gdGhlIFBMTC9jbG9jay9tdXggc3Vi
c3lzdGVtIG9uIG10NjU3NyBwbGVhc2U/CgpUaGFua3MuCgpbMV0gQUxQUy5KQi5NUC5WMS4xOV9N
Qks3N19UQl9KQiBzb3VyY2UgY29kZSBwYWNrYWdlIChrZXJuZWwgdjMuNC54KQpbMl0gaHR0cHM6
Ly93d3cuYWNlci5jb20vYWMvZW4vVVMvY29udGVudC9zdXBwb3J0LXByb2R1Y3QvNDgxNz9iPTEg
aW4gdGhlCiJEb2N1bWVudHMgKDIpIiBzZWN0aW9uLiAKWzNdIG1lZGlhdGVrL3BsYXRmb3JtL210
NjU3Ny9rZXJuZWwvY29yZS9tdF9jbG9ja19tYW5hZ2VyLmMgZnJvbSBbMV0gb3IgWzJdCls0XQpo
dHRwczovL2dpdGh1Yi5jb20vYXJ6YW0xNi9tdDY1Nzdfa2VybmVsX0FjZXJfQjFfQTcxL2NvbW1p
dC81YTQ0N2VjZWRhNzE3MjM3MTVhZjljYzIxNWE2NzI0MWVmYzgzYjNkCls1XSBodHRwOi8vdmdl
ci5rZXJuZWwub3JnL2xrbWwvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
