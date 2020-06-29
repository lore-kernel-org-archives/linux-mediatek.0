Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26974C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 08:11:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8A5E23355
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 08:11:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cqJ352Wm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EKuRkQ2B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8A5E23355
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=miaFbkvSFNQjtoxYwtmFvZpxG8Jx96RVv+vjQ6FijdY=; b=cqJ352WmfcsSV/oWKIlcget5Y
	D+Ml1oqJU4k+z/8DVUB7+7ixwPa3MlEUHT+uB35JWbnldsC3kLCQ4CMvADd32p7aOxWmqAli94PXQ
	yBYlPMUvJhn6Yo77hsU90cHVYkwW0g3s6lT0WESO+p/h+JO/fOXCmQryhyQGZZAGiN8D/u+wmhqSZ
	O5n7KU5jPsU+adr5lTncEiRY+F7bqKVtJrC2qXtpha5br6QOmuqYEiis3Ikv1Aw5mB4HcXNIwqdAo
	SSfiu90aeL1Ys3HohnPpxMsOmrkyBmfrBG4wiLLxJG0wdWg1kSJ1YGDGRQw5GEoWzjavNRIKVxMK7
	Yh0JGCoWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jposR-0000wN-K4; Mon, 29 Jun 2020 08:10:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jposN-0000vc-GI; Mon, 29 Jun 2020 08:10:52 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A853023134;
 Mon, 29 Jun 2020 08:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593418249;
 bh=ftGuVRVgqjk9PwokZ1ZSRnJZM48vH8egkh8R/K03F7Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EKuRkQ2BiHMfRIFe8CdjR0qvDn5rm9WrsWhrFDzsY8en1EUHyk0ruTgCkPe/OYRt0
 2+mzFCouHUepwnCP70mA3qtzrpPe1KZ5WvIrkzLiWNdrfzBdQSoVgYlB0z/wyBUTi0
 jrwx4ip6uZf+jqAyXNew5BbRdkospW90++G+Oxn8=
Date: Mon, 29 Jun 2020 10:10:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH 2/2] usb: mtu3: fix NULL pointer dereference
Message-ID: <20200629081039.GA1221843@kroah.com>
References: <1593410434-19406-1-git-send-email-chunfeng.yun@mediatek.com>
 <1593410434-19406-2-git-send-email-chunfeng.yun@mediatek.com>
 <99fc1f6e-7907-6723-612a-8b68ffa871e5@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <99fc1f6e-7907-6723-612a-8b68ffa871e5@web.de>
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
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdW4gMjksIDIwMjAgYXQgMTA6MDA6MjJBTSArMDIwMCwgTWFya3VzIEVsZnJpbmcg
d3JvdGU6Cj4gPiBTb21lIHBvaW50ZXJzIGFyZSBkZXJlZmVyZW5jZWQgYmVmb3JlIHN1Y2Nlc3Nm
dWwgY2hlY2tzLgo+IAo+IEkgc3VnZ2VzdCB0byByZWNvbnNpZGVyIGFuZCBpbXByb3ZlIHRoZSBj
aGFuZ2UgZGVzY3JpcHRpb24uCj4gCj4gKiBXb3VsZCBhIG51bGwgcG9pbnRlciBkZXJlZmVyZW5j
ZSBiZSBwb3NzaWJsZSBvbmx5IHdpdGggdGhlIHZhcmlhYmxlcyDigJxtZXDigJ0KPiAgIGFuZCDi
gJxtcmVx4oCdIGluIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgZnVuY3Rpb24g4oCcbXR1M19n
YWRnZXRfZGVxdWV1ZeKAnT8KPiAKPiAqIEhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdG8gYWRqdXN0
IGFueSBtb3JlIHZhcmlhYmxlIGluaXRpYWxpc2F0aW9ucz8KPiAKPiAqIFdpbGwgaXQgYmVjb21l
IGhlbHBmdWwgdG8gYWRkIHRoZSB0YWcg4oCcRml4ZXPigJ0gdG8gdGhlIGNvbW1pdCBtZXNzYWdl
Pwo+IAo+IFJlZ2FyZHMsCj4gTWFya3VzCgpIaSwKClRoaXMgaXMgdGhlIHNlbWktZnJpZW5kbHkg
cGF0Y2gtYm90IG9mIEdyZWcgS3JvYWgtSGFydG1hbi4KCk1hcmt1cywgeW91IHNlZW0gdG8gaGF2
ZSBzZW50IGEgbm9uc2Vuc2ljYWwgb3Igb3RoZXJ3aXNlIHBvaW50bGVzcwpyZXZpZXcgY29tbWVu
dCB0byBhIHBhdGNoIHN1Ym1pc3Npb24gb24gYSBMaW51eCBrZXJuZWwgZGV2ZWxvcGVyIG1haWxp
bmcKbGlzdC4gIEkgc3Ryb25nbHkgc3VnZ2VzdCB0aGF0IHlvdSBub3QgZG8gdGhpcyBhbnltb3Jl
LiAgUGxlYXNlIGRvIG5vdApib3RoZXIgZGV2ZWxvcGVycyB3aG8gYXJlIGFjdGl2ZWx5IHdvcmtp
bmcgdG8gcHJvZHVjZSBwYXRjaGVzIGFuZApmZWF0dXJlcyB3aXRoIGNvbW1lbnRzIHRoYXQsIGlu
IHRoZSBlbmQsIGFyZSBhIHdhc3RlIG9mIHRpbWUuCgpQYXRjaCBzdWJtaXR0ZXIsIHBsZWFzZSBp
Z25vcmUgTWFya3VzJ3Mgc3VnZ2VzdGlvbjsgeW91IGRvIG5vdCBuZWVkIHRvCmZvbGxvdyBpdCBh
dCBhbGwuICBUaGUgcGVyc29uL2JvdC9BSSB0aGF0IHNlbnQgaXQgaXMgYmVpbmcgaWdub3JlZCBi
eQphbG1vc3QgYWxsIExpbnV4IGtlcm5lbCBtYWludGFpbmVycyBmb3IgaGF2aW5nIGEgcGVyc2lz
dGVudCBwYXR0ZXJuIG9mCmJlaGF2aW9yIG9mIHByb2R1Y2luZyBkaXN0cmFjdGluZyBhbmQgcG9p
bnRsZXNzIGNvbW1lbnRhcnksIGFuZAppbmFiaWxpdHkgdG8gYWRhcHQgdG8gZmVlZGJhY2suICBQ
bGVhc2UgZmVlbCBmcmVlIHRvIGFsc28gaWdub3JlIGVtYWlscwpmcm9tIHRoZW0uCgp0aGFua3Ms
CgpncmVnIGstaCdzIHBhdGNoIGVtYWlsIGJvdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
