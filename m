Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B66AC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 06:57:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4ED861210
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 06:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4ED861210
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=vdorst.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Subject:Cc:To:
	From:Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EavKYJ8uKB0730MbFD8S+oc8IOXM3kwluIaD/Ut8Eq4=; b=Jz05PHMrD2qQTUQKLQ34+EHgE
	FIoMBpZuUly4yqVuvcpz3zrE6ip/w1y7+ez2ZlmVvmkNfGBN62PjktvtDt8CoXayJynHDGVJySkBc
	/WP4KJMw18+RnoZJA0LflAuiLDWLWqZPFOQkKqdnnsrYH2I7wAZDWpGPfKzOs547JK9ckV9wbAuTK
	HSpA7b+iYBhJ6vSGKsVlmy80D2BRIHpx+bvf1QzjAL4EN07r9mBdAekfrIAdsrDoo7P9JfGqiBew7
	H/0IZ0vA3UAUOb/ZrFEx24RQTd6K2/zOA6vIlyVCmaS/z8+KADt439BJneWz4YNpUJDpXNsgpj4oD
	AbyUKZuAQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVqVZ-005t6s-3v; Mon, 12 Apr 2021 06:57:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVqVX-005t6b-GI
 for linux-mediatek@desiato.infradead.org; Mon, 12 Apr 2021 06:57:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:In-Reply-To:References:Subject:Cc:To:From:
 Message-ID:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=qdbtM/DvTGQNCLjIn3AIhiOwyFmkZ6jhIqw4Qg8DRuw=; b=JcSHBfk5IvtzbrN8PT5tFDr/0j
 nX1vY3gFHStsNQ9yb4cVLCxUxqWZSm0TcT8mKYBi9qKdbiBVuauU+iPFnSUEh05JAFM07bPRkyt4W
 eDOdqtsJokXoOyjyNv5xcJDajyDGz3KD4BzvLGg2akgJkZs1R9RBdnRHMX3WTrPWc+MGCRDnKhGSL
 sF+av6os+8KCqiHu9xV+G6bzee2gz0Kmsb5p2rMdM8Igm7bUXQrWgSZgDUFI4FPtx7zwXqfYxMlKl
 OcBjVrUm/v97RoCfTJ+D5GZEyjcxEcT6gkOvZuY+9RpSPfk1czsDAYFQuJfD1XfH3xVA6aXRW6hx3
 f29kHoGw==;
Received: from mx.i2x.nl ([5.2.79.48])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lVqVU-005ul8-IH
 for linux-mediatek@lists.infradead.org; Mon, 12 Apr 2021 06:57:14 +0000
Received: from mail.vdorst.com (mail.vdorst.com [IPv6:fd00::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mx.i2x.nl (Postfix) with ESMTPS id BC68F5FB39;
 Mon, 12 Apr 2021 08:57:10 +0200 (CEST)
Authentication-Results: mx.i2x.nl;
 dkim=pass (2048-bit key) header.d=vdorst.com header.i=@vdorst.com
 header.b="BXQxPyhD"; dkim-atps=neutral
Received: from www (unknown [192.168.2.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id 77118BC9FEE;
 Mon, 12 Apr 2021 08:57:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.vdorst.com 77118BC9FEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdorst.com;
 s=default; t=1618210630;
 bh=qdbtM/DvTGQNCLjIn3AIhiOwyFmkZ6jhIqw4Qg8DRuw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BXQxPyhDS9m7NBLFQYXfxTe5/Ef18Jmqr2NBuq/RKrNTUDN1gt9RsrjEYnB8t6Jp2
 fAvUnDeOKjGxIgyIwOFON+WErgcbX3XF8A4Qy76yKXV1pzDVCS+obfsqxCTtkz0plf
 N+34eRzvAnueCw7qwuVBPN+QAdj2qdw3eQerT4sF0loCCx2zzPQJW3kvzMXLfWl0vZ
 tNuK2Dli4JsSYL+pNNx0c97UqjP86sbvTCAjPK4eyvCpzXyPcWyM1qTEAlTOPe0JSM
 tKmFT/DuZINGWbSc+VpNoWP7mWpAlrFGrPpp6fTRdTGpoyMLL1gKd0w6gJphOFuDe7
 O0jMm9z1mTdWw==
Received: from 48.79.2.5.in-addr.arpa (48.79.2.5.in-addr.arpa [5.2.79.48])
 by www.vdorst.com (Horde Framework) with HTTPS; Mon, 12 Apr 2021 06:57:10
 +0000
Date: Mon, 12 Apr 2021 06:57:10 +0000
Message-ID: <20210412065710.Horde.HvZraNbocBxpaaNQLf6FJkk@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Landen Chao
 <Landen.Chao@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, netdev <netdev@vger.kernel.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>, Frank Wunderlich
 <frank-w@public-files.de>
Subject: Re: [PATCH net-next] net: dsa: mt7530: Add support for EEE features
References: <20210409225346.432312-1-opensource@vdorst.com>
 <CALW65jZRs4DBOpWiY+CxWZmX9wXhSP1cM-qeftC=xY2=Tr+HoA@mail.gmail.com>
In-Reply-To: <CALW65jZRs4DBOpWiY+CxWZmX9wXhSP1cM-qeftC=xY2=Tr+HoA@mail.gmail.com>
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_235712_763390_9F31448B 
X-CRM114-Status: GOOD (  20.22  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="Yes"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

UXVvdGluZyBERU5HIFFpbmdmYW5nIDxkcWZleHRAZ21haWwuY29tPjoKCkhpIFFpbmdmYW5nLAoK
VGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKPiBIaSBSZW7DqSwKPgo+IE9uIFNhdCwgQXByIDEwLCAy
MDIxIGF0IDY6NTQgQU0gUmVuw6kgdmFuIERvcnN0IDxvcGVuc291cmNlQHZkb3JzdC5jb20+IHdy
b3RlOgo+PiAtLS0gYS9kcml2ZXJzL25ldC9kc2EvbXQ3NTMwLmMKPj4gKysrIGIvZHJpdmVycy9u
ZXQvZHNhL210NzUzMC5jCj4+IEBAIC0yNTY4LDYgKzI1NjgsMTEgQEAgc3RhdGljIHZvaWQgIAo+
PiBtdDc1M3hfcGh5bGlua19tYWNfbGlua191cChzdHJ1Y3QgZHNhX3N3aXRjaCAqZHMsIGludCBw
b3J0LAo+PiAgICAgICAgICAgICAgICAgICAgICAgICBtY3IgfD0gUE1DUl9UWF9GQ19FTjsKPj4g
ICAgICAgICAgICAgICAgIGlmIChyeF9wYXVzZSkKPj4gICAgICAgICAgICAgICAgICAgICAgICAg
bWNyIHw9IFBNQ1JfUlhfRkNfRU47Cj4+ICsKPj4gKyAgICAgICAgICAgICAgIGlmIChtb2RlID09
IE1MT19BTl9QSFkgJiYgcGh5ZGV2ICYmCj4+ICsgICAgICAgICAgICAgICAgICAgIShwcml2LT5l
ZWVfZGlzYWJsZWQgJiBCSVQocG9ydCkpICYmCj4+ICsgICAgICAgICAgICAgICAgICAgcGh5X2lu
aXRfZWVlKHBoeWRldiwgMCkgPj0gMCkKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgbWNyIHw9
IFBNQ1JfRk9SQ0VfRUVFMUcgfCBQTUNSX0ZPUkNFX0VFRTEwMDsKPgo+IFlvdSBzaG91bGQgYWRq
dXN0IHRoaXMgYWNjb3JkaW5nIHRvIGUtPmFkdmVydGlzZWQuCgpJIG5vdyBiZXR0ZXIgdW5kZXJz
dGFuZCBFRUUgcGFydCBpbiBwaHlsaW5rLgpJIHJlZmFjdG9yIHRoZSBjb2RlIGEgbG90IGFuZCBh
bHNvIHRlc3RlZCB3aXRoIGRpZmZlcmVudApwb3J0IHdpdGggdmFyaW91cyBlZWUtYnJva2VuLTEw
MDB0IGFuZCBlZWUtYnJva2VuLTEwMHR4IHNldAppbiB0aGUgZGV2aWNlIHRyZWUuCgpMb29raW5n
IGF0IG1jciB2YWx1ZSwgaW4gYWxsIHRoZSBjYXNlcyB0aGUgYml0IGFyZSBzZXQgcmlnaHQuCgo+
Cj4+ICAgICAgICAgfQo+Pgo+PiAgICAgICAgIG10NzUzMF9zZXQocHJpdiwgTVQ3NTMwX1BNQ1Jf
UChwb3J0KSwgbWNyKTsKPj4gQEAgLTI4MDAsNiArMjgwNSw0OSBAQCBtdDc1M3hfcGh5X3dyaXRl
KHN0cnVjdCBkc2Ffc3dpdGNoICpkcywgaW50ICAKPj4gcG9ydCwgaW50IHJlZ251bSwgdTE2IHZh
bCkKPj4gICAgICAgICByZXR1cm4gcHJpdi0+aW5mby0+cGh5X3dyaXRlKGRzLCBwb3J0LCByZWdu
dW0sIHZhbCk7Cj4+ICB9Cj4+Cj4+ICtzdGF0aWMgaW50IG10NzUzeF9nZXRfbWFjX2VlZShzdHJ1
Y3QgZHNhX3N3aXRjaCAqZHMsIGludCBwb3J0LAo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgZXRodG9vbF9lZWUgKmUpCj4+ICt7Cj4+ICsgICAgICAgc3RydWN0IG10NzUz
MF9wcml2ICpwcml2ID0gZHMtPnByaXY7Cj4+ICsgICAgICAgdTMyIGVlZWNyLCBwbXNyOwo+PiAr
Cj4+ICsgICAgICAgZS0+ZWVlX2VuYWJsZWQgPSAhKHByaXYtPmVlZV9kaXNhYmxlZCAmIEJJVChw
b3J0KSk7Cj4+ICsKPj4gKyAgICAgICBpZiAoZS0+ZWVlX2VuYWJsZWQpIHsKPj4gKyAgICAgICAg
ICAgICAgIGVlZWNyID0gbXQ3NTMwX3JlYWQocHJpdiwgTVQ3NTMwX1BNRUVFQ1JfUChwb3J0KSk7
Cj4+ICsgICAgICAgICAgICAgICBlLT50eF9scGlfZW5hYmxlZCA9ICEoZWVlY3IgJiBMUElfTU9E
RV9FTik7Cj4+ICsgICAgICAgICAgICAgICBlLT50eF9scGlfdGltZXIgPSBHRVRfTFBJX1RIUkVT
SChlZWVjcik7Cj4+ICsgICAgICAgICAgICAgICBwbXNyID0gbXQ3NTMwX3JlYWQocHJpdiwgTVQ3
NTMwX1BNU1JfUChwb3J0KSk7Cj4+ICsgICAgICAgICAgICAgICBlLT5lZWVfYWN0aXZlID0gZS0+
ZWVlX2VuYWJsZWQgJiYgISEocG1zciAmIFBNU1JfRUVFMUcpOwo+Cj4gZWVlX2VuYWJsZWQgYW5k
IGVlZV9hY3RpdmUgd2lsbCBiZSBzZXQgaW4gcGh5X2V0aHRvb2xfZ2V0X2VlZSwgbm8gbmVlZAo+
IHRvIHNldCB0aGVtIGhlcmUuCgpUaGFua3MgZm9yIHBvaW50aW5nIHRoYXQgb3V0LgpJIHJlZmFj
dG9yIHRoZSBjb2RlIHNvIGl0IG9ubHkgc2V0L3JlcG9ydCB0aGUgTFBJIHNldHRpbmdzLgoKSSBh
bHJlYWR5IHNlbmRlZCB2MiB3aXRoIHRoZXNlIGNoYW5nZXMuCgo+Cj4+ICsgICAgICAgfQo+PiAr
Cj4+ICsgICAgICAgcmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBpbnQgbXQ3NTN4X3Nl
dF9tYWNfZWVlKHN0cnVjdCBkc2Ffc3dpdGNoICpkcywgaW50IHBvcnQsCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCBldGh0b29sX2VlZSAqZSkKPj4gK3sKPj4gKyAgICAg
ICBzdHJ1Y3QgbXQ3NTMwX3ByaXYgKnByaXYgPSBkcy0+cHJpdjsKPj4gKyAgICAgICB1MzIgZWVl
Y3I7Cj4+ICsKPj4gKyAgICAgICBpZiAoZS0+ZWVlX2VuYWJsZWQpIHsKPj4gKyAgICAgICAgICAg
ICAgIGlmIChlLT50eF9scGlfdGltZXIgPiAweEZGRikKPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7Cj4+ICsgICAgICAgICAgICAgICBwcml2LT5lZWVfZGlzYWJsZWQg
Jj0gfkJJVChwb3J0KTsKPj4gKyAgICAgICAgICAgICAgIGVlZWNyID0gbXQ3NTMwX3JlYWQocHJp
diwgTVQ3NTMwX1BNRUVFQ1JfUChwb3J0KSk7Cj4+ICsgICAgICAgICAgICAgICBlZWVjciAmPSB+
KExQSV9USFJFU0hfTUFTSyB8IExQSV9NT0RFX0VOKTsKPj4gKyAgICAgICAgICAgICAgIGlmICgh
ZS0+dHhfbHBpX2VuYWJsZWQpCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIC8qIEZvcmNlIExQ
SSBNb2RlIHdpdGhvdXQgYSBkZWxheSAqLwo+PiArICAgICAgICAgICAgICAgICAgICAgICBlZWVj
ciB8PSBMUElfTU9ERV9FTjsKPj4gKyAgICAgICAgICAgICAgIGVlZWNyIHw9IFNFVF9MUElfVEhS
RVNIKGUtPnR4X2xwaV90aW1lcik7Cj4+ICsgICAgICAgICAgICAgICBtdDc1MzBfd3JpdGUocHJp
diwgTVQ3NTMwX1BNRUVFQ1JfUChwb3J0KSwgZWVlY3IpOwo+PiArICAgICAgIH0gZWxzZSB7Cj4+
ICsgICAgICAgICAgICAgICBwcml2LT5lZWVfZGlzYWJsZWQgfD0gQklUKHBvcnQpOwo+PiArICAg
ICAgIH0KPj4gKwo+PiArICAgICAgIHJldHVybiAwOwo+PiArfQoKCkdyZWF0cywKClJlbsOpCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
