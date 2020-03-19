Return-Path: <SRS0=inF0=5E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B02C4332B
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 20:35:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E4DF2072C
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 20:35:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nh6k0oGT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=vdorst.com header.i=@vdorst.com header.b="iemcHV0x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E4DF2072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=vdorst.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Subject:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n1OfNxmg6igbywojsIJxiP+1eMdzrBvHVFuuOYeU870=; b=nh6k0oGT8W6Txyisl646XJpZM
	x8BuMWinvbzlnFO4Bvx52XLcEihBlS4WuvzP48KeN7MwG7J63JIG5QJJ0hcwGzALrvryK/MIg5/s4
	EnnW8cJH4ncmpiu+njZTHCZ5V8nfLtxf7P8pD+gBkS7Is0DTfEZAipITfcATV2Vr/rNXnJbldVQAO
	82SZO5qBquf/pSH6DrtH7Do3H+tRHG9vEuzxVR0mRb77UJ0BqoaR2TDt9ONQp57sAYBsBLgQE9JQm
	4ME5V9fI66/6RQd8LU5vASkeFauiMkXXd8aNqisgkt47trIXlNkHywUy9MQC+bz0+Ew5oiLmBsoQ4
	1eov20NtQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jF1t6-000434-5I; Thu, 19 Mar 2020 20:35:32 +0000
Received: from mx.0dd.nl ([5.2.79.48])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jF1t3-00042E-Np
 for linux-mediatek@lists.infradead.org; Thu, 19 Mar 2020 20:35:31 +0000
Received: from mail.vdorst.com (mail.vdorst.com [IPv6:fd01::250])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx.0dd.nl (Postfix) with ESMTPS id 45AE45FAE6;
 Thu, 19 Mar 2020 21:35:00 +0100 (CET)
Authentication-Results: mx.0dd.nl; dkim=pass (2048-bit key;
 secure) header.d=vdorst.com header.i=@vdorst.com header.b="iemcHV0x"; 
 dkim-atps=neutral
Received: from www (www.vdorst.com [192.168.2.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id EEFCB25026C;
 Thu, 19 Mar 2020 21:34:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.vdorst.com EEFCB25026C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdorst.com;
 s=default; t=1584650100;
 bh=cSLvUWll0EXOQRnoPBZasPlEwOgeA+HGgMKCZAuoZdY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iemcHV0xIJAdVye15L7fb3pyDiheB46s6gQcbIXdScFMwMX3wn0Le14D0f20uVGaI
 odTIOghRJVOJdFs0nPWJD85tPpjGqXarSE5BwMOBelkftE0/dglwdenfvkOdJVzBiV
 Mo4xabOCdRFY3MP6YCdHEycMHS+pZsSlDCgP3w1xX6d17meJePFeENGHj9zKm3KBCU
 0AHwkPp+37u2pTFDg7/EpehbLuf7gld/h7R+4PZvV8Pf1eTD9oeuRPgm7jm3c9Ay4H
 8Dl2fGy1uYWV0raIn2rA8c1iLNnOOfgKsE7NvafuPKARb7k8S2Y89y70z0VGv9D+It
 +VhzeUWAt2NZw==
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1]) by
 www.vdorst.com (Horde Framework) with HTTPS; Thu, 19 Mar 2020 20:34:59 +0000
Date: Thu, 19 Mar 2020 20:34:59 +0000
Message-ID: <20200319203459.Horde.FHMW3lKtaN-qI8lZ8qts7N_@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: Vivien Didelot <vivien.didelot@gmail.com>
Subject: Re: [[PATCH,net]] net: dsa: mt7530: Change the LINK bit to reflect
 the link status
References: <20200319134756.46428-1-opensource@vdorst.com>
 <20200319124123.GB3412372@t480s.localdomain>
In-Reply-To: <20200319124123.GB3412372@t480s.localdomain>
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_133529_919127_2C87E1E2 
X-CRM114-Status: GOOD (  15.37  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <landen.chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew Smith <andrew.smith@digi.com>, "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="Yes"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

UXVvdGluZyBWaXZpZW4gRGlkZWxvdCA8dml2aWVuLmRpZGVsb3RAZ21haWwuY29tPjoKCj4gSGkg
UmVuw6ksCj4KPiBPbiBUaHUsIDE5IE1hciAyMDIwIDE0OjQ3OjU2ICswMTAwLCBSZW7DqSB2YW4g
RG9yc3QgIAo+IDxvcGVuc291cmNlQHZkb3JzdC5jb20+IHdyb3RlOgo+PiBBbmRyZXcgcmVwb3J0
ZWQ6Cj4+Cj4+IEFmdGVyIGEgbnVtYmVyIG9mIG5ldHdvcmsgcG9ydCBsaW5rIHVwL2Rvd24gY2hh
bmdlcywgc29tZXRpbWVzIHRoZSBzd2l0Y2gKPj4gcG9ydCBnZXRzIHN0dWNrIGluIGEgc3RhdGUg
d2hlcmUgaXQgdGhpbmtzIGl0IGlzIHN0aWxsIHRyYW5zbWl0dGluZyBwYWNrZXRzCj4+IGJ1dCB0
aGUgY3B1IHBvcnQgaXMgbm90IGFjdHVhbGx5IHRyYW5zbWl0dGluZyBhbnltb3JlLiBJbiB0aGlz
IHN0YXRlIHlvdQo+PiB3aWxsIHNlZSBhIG1lc3NhZ2Ugb24gdGhlIGNvbnNvbGUKPj4gIm10a19z
b2NfZXRoIDFlMTAwMDAwLmV0aGVybmV0IGV0aDA6IHRyYW5zbWl0IHRpbWVkIG91dCIgYW5kIHRo
ZSBUeCBjb3VudGVyCj4+IGluIGlmY29uZmlnIHdpbGwgYmUgaW5jcmVtZW50aW5nIG9uIHZpcnR1
YWwgcG9ydCwgYnV0IG5vdCBpbmNyZW1lbnRpbmcgb24KPj4gY3B1IHBvcnQuCj4+Cj4+IFRoZSBp
c3N1ZSBpcyB0aGF0IE1BQyBUWC9SWCBzdGF0dXMgaGFzIG5vIGltcGFjdCBvbiB0aGUgbGluayBz
dGF0dXMgb3IKPj4gcXVldWUgbWFuYWdlciBvZiB0aGUgc3dpdGNoLiBTbyB0aGUgcXVldWUgbWFu
YWdlciBqdXN0IHF1ZXVlcyB1cCBwYWNrZXRzCj4+IG9mIGEgZGlzYWJsZWQgcG9ydCBhbmQgc2Vu
ZHMgb3V0IHBhdXNlIGZyYW1lcyB3aGVuIHRoZSBxdWV1ZSBpcyBmdWxsLgo+Pgo+PiBDaGFuZ2Ug
dGhlIExJTksgYml0IHRvIHJlZmxlY3QgdGhlIGxpbmsgc3RhdHVzLgo+Pgo+PiBGaXhlczogYjhm
MTI2YThkNTQzICgibmV0LW5leHQ6IGRzYTogYWRkIGRzYSBzdXBwb3J0IGZvciBNZWRpYXRlayAg
Cj4+IE1UNzUzMCBzd2l0Y2giKQo+PiBSZXBvcnRlZC1ieTogQW5kcmV3IFNtaXRoIDxhbmRyZXcu
c21pdGhAZGlnaS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFJlbsOpIHZhbiBEb3JzdCA8b3BlbnNv
dXJjZUB2ZG9yc3QuY29tPgo+CgpIaSBWaXZpZW4sCgo+IFJldmlld2VkLWJ5OiBWaXZpZW4gRGlk
ZWxvdCA8dml2aWVuLmRpZGVsb3RAZ21haWwuY29tPgo+Cj4gRm9yIHRoZSBzdWJqZWN0IHByZWZp
eCwgaXQgaXMgcHJlZmVyYWJsZSB0byB1c2UgIltQQVRDSCBuZXRdIiBvdmVyCj4gIltbUEFUQ0gs
bmV0XV0iLiBZb3UgY2FuIGVhc2lseSBhZGQgdGhpcyBicmFja2V0ZWQgcHJlZml4IHdpdGggZ2l0
Cj4gZm9ybWF0LXBhdGNoJ3Mgb3B0aW9uIC0tc3ViamVjdC1wcmVmaXg9IlBBVENIIG5ldCIuCgpU
aGFua3MgZm9yIHJldmlld2luZy4KCkZ1bm55IGlzIHRoYXQgSSB1c2VkIHN1YmplY3QtcHJlZml4
IG9wdGlvbiBidXQgSSB3aXRoIHRoZSBicmFja2V0cy4KTGlrZSAtLXN1YmplY3QtcHJlZml4PSJb
UEFUQ0gsbmV0XSIgYnV0IG5vdCByZWFsaXppbmcgdGhhdCBnaXQgYWxzbwphZGQgYnJhY2tldHMu
IEkgZGlkbid0IG5vdGljZWQgdW50aWwgSSBnb3QgYW4gZW1haWwgYmFjayBmcm9tIHRoZQptYWls
aW5nbGlzdCB0aGF0IGl0IGhhZCBkb3VibGUgYnJhY2tldHMuCk5leHQgdGltZSBJIHVzZSAiW1BB
VENIIG5ldF0iLgoKR3JlYXQsCgpSZW7DqQoKCj4KPgo+IFRoYW5rIHlvdSwKPgo+IAlWaXZpZW4K
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
