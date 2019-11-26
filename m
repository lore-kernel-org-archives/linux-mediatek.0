Return-Path: <SRS0=vfNJ=ZS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6240C432C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 09:23:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7080A206BF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 09:23:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pJNyC3aL";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="U5p0lkxH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="d/XJJ/Eh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7080A206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nNrDHngSyg1PKG+9gtAwSaZgxKKvmSt7cA3DIEcXFyo=; b=pJNyC3aLHeE1n+
	v30OAKE2gWRwTsZDRRSQ4c5M400QLdmF1X5v4shNf/6R/rj5ZnwXapn2t6G/RTUxe8CJuMguqed8E
	k3UbmvJHbVCOwoWwW4TdxVxm3lFbOeHdRTfSEuvz+WGoLysOTKReXwS7htW+t5fxmrnuO0Dw5eF/H
	S7Mxpwpdqo05KLsSWMOtgP+AzekjtLqpVDOxy54zPNuypOZ99NcVlkgkkpmEfCgmjK6GFtxWjAJru
	fMyBM1X5A+R32EVni6/YPKOb+vtb1gXRJ1TGeCMd4R7QHeEgYpxeTGxJOc7X2nof8K7AWZVN6sRLV
	uIBEFLnVF0LJVMd9AyvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZX3u-0000A5-00; Tue, 26 Nov 2019 09:23:10 +0000
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZX3r-00009D-Ht
 for linux-mediatek@lists.infradead.org; Tue, 26 Nov 2019 09:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574760183;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=7JpzEUgPOKikbM97IChytjtM3nmMVXbRuF7hhQqzTtk=;
 b=U5p0lkxHpnYMPD3YpR0IPOznP1k64THkZ5Ek29ZFTTJiAn1pEmJDqXTCyO/JeREO
 MueoLMhgoFmxNAMH0jro/4HDJDXAMfxxMZBphxNvoZpsc3wIzEJYt2egQLv/KaF6I9e
 X06yStNYQmn+nH1wF0hBtAXv5QZ+gGn1JocZ2Qmg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574760183;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=7JpzEUgPOKikbM97IChytjtM3nmMVXbRuF7hhQqzTtk=;
 b=d/XJJ/EhcC7+JLpdgjWLTYBsHpUPx0uY93aLDHMFZrUcdnRz6Bxk3kQ8T+UrDqlz
 0Aezg3GeXGPrOJeUWL9At8AHlD64Qt20oIk41Ky/gMDRItYwWKT4FjmIBNdAg2x7BSY
 /MsccStupFycAKUUOBUjGLQdD1/zLqZOHrq8uCdA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3D393C447BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH] mt76: Off by one in mt76_calc_rx_airtime()
References: <20191121213935.2cbgh3qmd4hv4v5a@kili.mountain>
 <87v9r7ysg0.fsf@toke.dk> <20191126091150.GA1759@kadam>
 <87h82ryp45.fsf@toke.dk>
Date: Tue, 26 Nov 2019 09:23:03 +0000
In-Reply-To: <87h82ryp45.fsf@toke.dk> ("Toke \=\?utf-8\?Q\?H\=C3\=B8iland-J\?\=
 \=\?utf-8\?Q\?\=C3\=B8rgensen\=22's\?\= message of
 "Tue, 26 Nov 2019 10:16:10 +0100")
Message-ID: <0101016ea7057599-4b9d94c8-f18d-4976-b7e0-a35a953f2653-000000@us-west-2.amazonses.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-SES-Outgoing: 2019.11.26-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191126_012307_638262_9DC201C4 
X-CRM114-Status: GOOD (  11.11  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, kernel-janitors@vger.kernel.org,
 linux-wireless@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Roy Luo <royluo@google.com>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHJlZGhhdC5jb20+IHdyaXRlczoKCj4gRGFu
IENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPiB3cml0ZXM6Cj4KPj4gT24gVHVl
LCBOb3YgMjYsIDIwMTkgYXQgMDk6MDQ6MTVBTSArMDEwMCwgVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vu
c2VuIHdyb3RlOgo+Pj4gRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPiB3
cml0ZXM6Cj4+PiAKPj4+ID4gQEAgLTI0Miw3ICsyNDIsNyBAQCB1MzIgbXQ3Nl9jYWxjX3J4X2Fp
cnRpbWUoc3RydWN0IG10NzZfZGV2ICpkZXYsIHN0cnVjdCBtdDc2X3J4X3N0YXR1cyAqc3RhdHVz
LAo+Pj4gPiAgCQkJcmV0dXJuIDA7Cj4+PiA+ICAKPj4+ID4gIAkJc2JhbmQgPSBkZXYtPmh3LT53
aXBoeS0+YmFuZHNbc3RhdHVzLT5iYW5kXTsKPj4+ID4gLQkJaWYgKCFzYmFuZCB8fCBzdGF0dXMt
PnJhdGVfaWR4ID4gc2JhbmQtPm5fYml0cmF0ZXMpCj4+PiA+ICsJCWlmICghc2JhbmQgfHwgc3Rh
dHVzLT5yYXRlX2lkeCA+PSBzYmFuZC0+bl9iaXRyYXRlcykKPj4+ID4gIAkJCXJldHVybiAwOwo+
Pj4gPiAgCj4+PiA+ICAJCXJhdGUgPSAmc2JhbmQtPmJpdHJhdGVzW3N0YXR1cy0+cmF0ZV9pZHhd
Owo+Pj4gCj4+PiBUaGlzIGNvZGUgaGFzIHJlY2VudGx5IGJlZW4gcG9ydGVkIHRvIG1hYzgwMjEx
IChuZXQvbWFjODAyMTEvYWlydGltZS5jKS4KPj4+IEl0IHNlZW1zIHRoYXQgdGhlIGJ1ZyBpcyBh
bHNvIHByZXNlbnQgdGhlcmU7IGNhcmUgdG8gc2VuZCBhIHBhdGNoIGZvcgo+Pj4gdGhhdCBhcyB3
ZWxsPyA6KQo+Pgo+PiBPaC4gIFRoYW5rcyBmb3IgcG9pbnRpbmcgdGhhdCBvdXQuICBJIGFjdHVh
bGx5IHNhdyB0aGUgc3RhdGljIGNoZWNrZXIKPj4gd2FybmluZyBmb3IgdGhhdCBhbmQgaWdub3Jl
ZCBpdCB0aGlua2luZyB0aGF0IGl0IHdhcyB0aGUgc2FtZSBjb2RlLgo+PiA6UAo+Cj4gV2VsbCwg
aXQncyBjb3B5LXBhc3RlZCBmcm9tIHRoZSBzYW1lIGNvZGUgOykKPgo+IFRoZSBwbGFuIGlzIHRv
IGdldCByaWQgb2YgdGhlIHZlcnNpb24gaW5zaWRlIG10NzY7IHdhcyB3YWl0aW5nIGZvciB0aGUK
PiB0cmVlcyB0byBjb252ZXJnZSwgdGhvdWdoLCBzbyBJIGd1ZXNzIGFmdGVyIHRoZSBtZXJnZSB3
aW5kb3c/CgpZdXAsIGFzIEknbSBub3QgdGFraW5nIGFueXRoaW5nIHRvIHctZC1uZXh0IHVudGls
IC1yYzEgaXMgcmVsZWFzZWQuCgotLSAKS2FsbGUgVmFsbwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
