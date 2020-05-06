Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A5EC47247
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 00:25:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C26720721
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 00:25:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ju9tl15G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C26720721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:From:To:
	Subject:Content-Description:MIME-Version:Cc:Content-ID:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ShI1OYZbG3YOgfCYEnoqiYCmcd0lLr35mHEKfHB/h8o=; b=ju9
	tl15GuMbJMxIrZ6/jnChQPJC3UiY6pWzRqODDTKz6VJgHzlkZAcbAmRr4TL717d04Ic8h3PrllMhv
	GCj6VIR8i11Jb8q/TjEyKZXaH2PnbGXEvoTYVGC6eNvjaXgH+BtoqHA0pfZE1HloTlsvJF8rofWWH
	qgkVIGr8RYcaE9sbJncbZcsSkJqudrmH1mBIvGXn8aNaYZqfJ9JEYfUO8+TA0BkmdIacYqCaPxBRt
	KaC3cH6xSQSFeT1sGNNmTiur/FkB2bWlueULSY+27xOdSyXW+K+fDqWtjnCrg5+nnVG7z6OkFX21n
	92zAkMYAmRewK4W1VCLPAhZIW0qXAnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jW7sA-00063C-EC; Wed, 06 May 2020 00:25:14 +0000
Received: from zimbra.evolbio.mpg.de ([141.5.8.20])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jW7rm-0004Ls-Jc
 for linux-mediatek@lists.infradead.org; Wed, 06 May 2020 00:24:53 +0000
Received: from zimbra.evolbio.mpg.de (localhost [127.0.0.1])
 by zimbra.evolbio.mpg.de (Postfix) with ESMTPS id D837FCEBB250F
 for <linux-mediatek@lists.infradead.org>;
 Wed,  6 May 2020 02:24:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra.evolbio.mpg.de (Postfix) with ESMTP id CB71FCEBB2514
 for <linux-mediatek@lists.infradead.org>;
 Wed,  6 May 2020 02:24:43 +0200 (CEST)
Received: from zimbra.evolbio.mpg.de ([127.0.0.1])
 by localhost (zimbra.evolbio.mpg.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id M-i7VteIUlJg for <linux-mediatek@lists.infradead.org>;
 Wed,  6 May 2020 02:24:43 +0200 (CEST)
Received: from 192.168.137.1 (unknown [176.41.43.40])
 by zimbra.evolbio.mpg.de (Postfix) with ESMTPSA id A0630CEBB250F
 for <linux-mediatek@lists.infradead.org>;
 Wed,  6 May 2020 02:24:43 +0200 (CEST)
MIME-Version: 1.0
Content-Description: Mail message body
Subject: We bieden financiering tegen een laag tarief.
To: linux-mediatek@lists.infradead.org
From: "Genovese Capital partners " <albert_edgar1@outlook.com>
Date: Wed, 06 May 2020 03:24:41 +0300
Message-Id: <20200506002443.A0630CEBB250F@zimbra.evolbio.mpg.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_172450_798752_B38D90B6 
X-CRM114-Status: UNSURE (  -3.80  )
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
Reply-To: silvano@genovesecapital.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

V2Vsa29tIGJpaiBHZW5vdmVzZSBDYXBpdGFsIFBhcnRuZXJzLgoKV2UgaGViYmVuIGVlbiBlbm9y
bWUga3JlZGlldHBvcnRlZmV1aWxsZSB2b29yIGhldCBmaW5hbmNpZXJlbiB2YW4gcHJvamVjdGVu
IGVuIGJlZHJpanZlbiBtZXQgZWVuIGdyb290IHZvbHVtZS4gRGUgcHJvY2VkdXJlcyB6aWpuIGFs
cyB2b2xndDogLQoKMS1EZSBrbGFudCBtb2V0IGVlbiBrb3J0ZSBzYW1lbnZhdHRpbmcgdmFuIGhl
dCBwcm9qZWN0IHN0dXJlbi4gRGl0IG1vZXQgaGV0IHRvdGFsZSBiZWRyYWcgYmV2YXR0ZW4gZGF0
IG5vZGlnIGlzIHZvb3IgaGV0IHByb2plY3QsIGdlc2NoYXQgcmVuZGVtZW50IG9wIGludmVzdGVy
aW5nLCB0ZXJ1Z2JldGFsaW5nc3BlcmlvZGUgdm9vciBsZW5pbmdlbiwgZGl0IG1hZyBuaWV0IG1l
ZXIgemlqbiBkYW4gMTUgamFhci4KCjItIERlIGtsYW50IG1vZXQgaGV0IGdlbm9lbWRlIHByb2pl
Y3QgdmVyemVrZXJlbiBiaWogZWVuIHZlcnpla2VyaW5nc21hYXRzY2hhcHBpaiB2YW4gaGV0IHRv
dGFsZSBsZWVuYmVkcmFnIG9tIGRlIGxlbmluZyBhbHMgb25kZXJwYW5kIHRlIGdhcmFuZGVyZW4g
KGFmaGFua2VsaWprIHZhbiBoZXQgbGVuaW5nc2JlZHJhZykuCgozLSBIZXQgcmVudGVwZXJjZW50
YWdlIHphbCBqYWFybGlqa3MgMiUgYmVkcmFnZW4uCgo0LVRlcnVnYmV0YWxpbmdzZHV1ciBpcyBt
YXhpbWFhbCAxNSBqYWFyCgo1IEZpbmFuY2llcmluZyBkdXVydCBvbmdldmVlciAxMCBiYW5rd2Vy
a2RhZ2VuIHZhbmFmIGRlIGRhZyBkYXQgdSBoZXQgdmVyemVrZXJpbmdzY2VydGlmaWNhYXQgb3Zl
cmxlZ3Qgb2YgZGUgTmVjZWVzc2FyeSBQYXBlciBXb3JrcyBoZWVmdCB2b2x0b29pZC4KCsKgCkFs
cyB1IHRldnJlZGVuIGJlbnQgbWV0IGRlIGJvdmVuc3RhYW5kZSBwcm9jZWR1cmVzLCBzdHV1ciBt
aWogZGFuIGVlbiBpbnRlbnRpZXZlcmtsYXJpbmcgZGllIG9wIGhldCBicmllZmhvb2ZkIHZhbiB1
dyBiZWRyaWpmIHN0YWF0LgoKVm9vciBtZWVyIGluZm9ybWF0aWUgb3ZlciBoZXQgdmVya3Jpamdl
biB2YW4gZWVuIGxlbmluZyB2YW46IFJlYWdlZXIgYWxzdHVibGllZnQgb25taWRkZWxsaWprIG9w
IGRlemUgZS1tYWlsOgoKCk1ldCB2cmllbmRlbGlqa2UgZ3JvZXQsIGluIGFmd2FjaHRpbmcgdmFu
IHV3IHJlYWN0aWUuCgpWcmllbmRlbGlqa2UgZ3JvZXRlbgpDYWlvIFBpbnRvCgpHZW5vdmVzZSBD
YXBpdGFsIFBhcnRuZXJzLgpUZWwuIDA3NTM3IDEyMTkxNQpXaGF0c0FwcDogKzQ0IDc1MzcxNjY3
NjkKS2luZ3MgUmlkZSwgQXNjb3QsIFNMNSA3SlIKCgoKV2VsY29tZSB0byBHZW5vdmVzZSBDYXBp
dGFsIFBhcnRuZXJzLgoKV2UgaGF2ZSBhIGh1Z2UgUG9ydGZvbGlvIG9mIENyZWRpdCwgZm9yIGZp
bmFuY2luZyBwcm9qZWN0cyBhbmQgQnVzaW5lc3Mgb2YgbGFyZ2Ugdm9sdW1lLiBUaGUgcHJvY2Vk
dXJlcyBhcmUgYXMgZm9sbG93czotIAoKMS1UaGUgY2xpZW50IG5lZWRzIHRvIHNlbmQgYSBicmll
ZiBzdW1tYXJ5IG9mIHRoZSBwcm9qZWN0LiBUaGlzIG11c3QgaW5jbHVkZSB0aGUgdG90YWwgYW1v
dW50IHJlcXVpcmVkIGZvciB0aGUgcHJvamVjdCwgZXN0aW1hdGVkIHJldHVybiBvbiBpbnZlc3Rt
ZW50LCBsb2FuIHJlcGF5bWVudCBwZXJpb2QgdGhpcyBtdXN0IG5vdCBiZSBtb3JlIHRoYW4gMTV5
ZWFycy4gCgoyLSBUaGUgY2xpZW50IHdpbGwgbmVlZCB0byBpbnN1cmUgdGhlIHNhaWQgcHJvamVj
dCB3aXRoIGFuIGluc3VyYW5jZSBjb21wYW55IG9mIHRoZSB0b3RhbCBsb2FuIHN1bSB0byBndWFy
YW50ZWUgdGhlIGxvYW4gYXMgY29sbGF0ZXJhbC4oRGVwZW5kZW50IG9uIExvYW4gQW1vdW50KS4K
CjMtIFRoZSBpbnRlcmVzdCByYXRlIHdpbGwgYmUgMiUgYW5udWFsbHkuIAoKNC1SZXBheW1lbnQg
ZHVyYXRpb24gd2lsbCBiZSBhIE1heGltdW0gb2YgIDE1IFllYXJzIAoKNSBGdW5kaW5nIHdpbGwg
dGFrZSBhcHByb3hpbWF0ZWx5IDEwIGJhbmtpbmcgZGF5cyBmcm9tIHRoZSBkYXkgeW91IHByZXNl
bnQgdGhlIGluc3VyYW5jZSBjZXJ0aWZpY2F0ZSBvciBoYXZlIGNvbXBsZXRlZCB0aGUgTmVjZWVz
c2FyeSBQYXBlciB3b3Jrcy4gCgogCklmIHlvdSBhcmUgc2F0aXNmaWVkIHdpdGggdGhlIGFib3Zl
IHByb2NlZHVyZXMgc2VuZCBtZSBhIGxldHRlciBvZiBpbnRlbnQgd3JpdGluZyBvbiB5b3VyIGNv
bXBhbnkgbGV0dGVyaGVhZC4gCgpGb3IgZnVydGhlciBkZXRhaWxzIHRvIGdvIGFib3V0IHByb2N1
cmluZyBhIGxvYW4gZnJvbTogS2luZGx5IHJlc3BvbmQgaW1tZWRpYXRlbHkgdG8gdGhpcyBlbWFp
bDogCgoKUmVnYXJkcywgYXMgd2UgYXdhaXQgeW91ciByZXNwb25zZS4gCgpCZXN0IFJlZ2FyZHMg
CkNhaW8gUGludG8KCkdlbm92ZXNlIENhcGl0YWwgUGFydG5lcnMuClRlbC4gMDc1MzcgMTIxIDkx
NQpXaGF0c0FwcCA6ICs0NCA3NTM3IDE2NiA3NjkKS2luZ3MgUmlkZSwgQXNjb3QsIFNMNSA3SlIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
