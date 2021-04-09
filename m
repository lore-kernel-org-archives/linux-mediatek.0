Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B80C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 12:25:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A2A6610D1
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 12:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A2A6610D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=vdorst.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Subject:Cc:To:
	From:Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6FaVOn7T0NuO602t33T4BmE86ZHICczjUVTMTOil7sM=; b=WrcpCsL77mRlVlFpnLnZJ51wz
	HPtFxBRDzeVaYZFDdWLLFAd6Gev1wO0Jus9Anf1n8BTdwgk+FLIQog/hxQITUtqjpGB5WWfBcVEcz
	8OoU5NWm1I7t2cFo7kmA4PfHkiZN+UBvT1rB4GANADwKACQtLGkYo3TR9cLmVEZa+btN5p1ksZXUI
	+hmTICgwP8lR/UgCigpoC30uIw3O+kXCZM9U489iKU/rDa034YZRQsdwPNRrjEd4MOXHtNrGOB5/0
	T2VD8HISdmYVEyS74uF6iPdaZdFlnQZmhK7aqf55AKIYWmyP8iEc/Yw+7/063UDUC5oFleFnKc/An
	wm3WpS07g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUqCm-000j74-1j; Fri, 09 Apr 2021 12:25:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUqCi-000j63-IK
 for linux-mediatek@desiato.infradead.org; Fri, 09 Apr 2021 12:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:In-Reply-To:References:Subject:Cc:To:From:
 Message-ID:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=8+E8zX/etY3i4LNvV1TwVYoMvMWtXNcy6wJF6uT5dRI=; b=dpHdJs2XUXUq4xjqvKgPjGpEXJ
 eyMEdn7PXAU5t9zItMOk5xBrThbTXUTb+eU1o2CGRD3ib24eqNw9JPQpoh4Jqz+3BsVi6M287ASPI
 Vng3OXr9YBNCe0I7kA6sPoCwOgqTs682AtPjgkvFC+oZHd62D2ZWNo/AmbtrklmxgLb5etTvs1Yef
 qgQ6NoYXOOtDWEkaOKmbj0bDTWIOuxQoNNnwNYWTy2Lc2jTMGn276DR/+JDBNanr4MiJTuGrWAazu
 wfH+LXqZM33VQMs00hjXlg6Nco8ehOqvSgkbmYFxFC4wf0vyi+ClME4PHt28r67KHzK1TbrxnIbql
 X84/Dk0g==;
Received: from mx.i2x.nl ([2a04:52c0:101:921::25])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lUqCf-004VZp-3C
 for linux-mediatek@lists.infradead.org; Fri, 09 Apr 2021 12:25:39 +0000
Received: from mail.vdorst.com (mail.vdorst.com [IPv6:fd00::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx.i2x.nl (Postfix) with ESMTPS id BC5575FBA8;
 Fri,  9 Apr 2021 14:25:29 +0200 (CEST)
Authentication-Results: mx.i2x.nl; dkim=pass (2048-bit key;
 secure) header.d=vdorst.com header.i=@vdorst.com header.b="Tcw1qj2W"; 
 dkim-atps=neutral
Received: from www (unknown [192.168.2.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id 7F273BC6013;
 Fri,  9 Apr 2021 14:25:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.vdorst.com 7F273BC6013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdorst.com;
 s=default; t=1617971129;
 bh=8+E8zX/etY3i4LNvV1TwVYoMvMWtXNcy6wJF6uT5dRI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tcw1qj2Wfgvbthhz2/picZXahWlFzpEgfAPbgjUST7I4lhUBZYACWjtYtc9Yb+osb
 tp7b/aLxZ6HeRn9PFIz6MgGmZiSRINCL9O3NEeb6Ne9p15n9mqctyN/Lc3W7B9zpdL
 +s5pDcWEID9av23lIspKxpt0d7CRyIzsF77uAxXmFGSmIp9qQ/Tul/N2bSqEEEFkRL
 GfoXTg6TDxCTyq4F+8ARBgGkOIRLJWFiGQ1oNtTmWy/Hb2lwgwqU+mhF1HJE81p6L8
 7Jt2oyMyFQTVHzCBtkGLSDzejUbp2AKemy9j0vclRtwKiWWyZj16cn0kriDnkrqEG2
 xTqkT1/o+fZcg==
Received: from 48.79.2.5.in-addr.arpa (48.79.2.5.in-addr.arpa [5.2.79.48])
 by www.vdorst.com (Horde Framework) with HTTPS; Fri, 09 Apr 2021 12:25:29
 +0000
Date: Fri, 09 Apr 2021 12:25:29 +0000
Message-ID: <20210409122529.Horde.fb4QbDNxhPNA6ZyDBOjGTct@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: DENG Qingfang <dqfext@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Heiner
 Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Landen
 Chao <Landen.Chao@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-kernel
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, linux-staging@lists.linux.dev, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>, Weijie Gao
 <weijie.gao@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>, Frank
 Wunderlich <frank-w@public-files.de>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>
Subject: Re: [RFC v3 net-next 0/4] MT7530 interrupt support
References: <20210408123919.2528516-1-dqfext@gmail.com>
 <20210408140255.Horde.Pl-DXtrqmiH9imsWjDqblfM@www.vdorst.com>
 <CALW65jZujSCk16RX_xgcg+NGrc9yyFQOQ9Y-z3qz-Qv1TvUQLg@mail.gmail.com>
 <YG8zvFKOdnzaJqLa@lunn.ch>
In-Reply-To: <YG8zvFKOdnzaJqLa@lunn.ch>
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_052537_286067_9D21A909 
X-CRM114-Status: GOOD (  21.89  )
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

UXVvdGluZyBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+OgoKPiBPbiBUaHUsIEFwciAwOCwg
MjAyMSBhdCAxMTowMDowOFBNICswODAwLCBERU5HIFFpbmdmYW5nIHdyb3RlOgo+PiBIaSBSZW7D
qSwKPj4KPj4gT24gVGh1LCBBcHIgOCwgMjAyMSBhdCAxMDowMiBQTSBSZW7DqSB2YW4gRG9yc3Qg
IAo+PiA8b3BlbnNvdXJjZUB2ZG9yc3QuY29tPiB3cm90ZToKPj4gPgo+PiA+IFRlc3RlZCBvbiBV
YmlxdWl0aSBFUi1YLVNGUCAoTVQ3NjIxKSB3aXRoIDEgZXh0ZXJuYWwgcGh5IHdoaWNoICAKPj4g
dXNlcyBpcnE9UE9MTC4KPj4gPgo+Pgo+PiBJIHdvbmRlciBpZiB0aGUgZXh0ZXJuYWwgUEhZJ3Mg
SVJRIGNhbiBiZSByZWdpc3RlcmVkIGluIHRoZSBkZXZpY2V0cmVlLgo+PiBDaGFuZ2UgTVQ3NTMw
X05VTV9QSFlTIHRvIDYsIGFuZCBhZGQgdGhlIGZvbGxvd2luZyB0byBFUi1YLVNGUCBkdHMgUEhZ
IG5vZGU6Cj4KPiBJIGRvbid0IGtub3cgdGhpcyBwbGF0Zm9ybS4gV2hhdCBpcyB0aGUgUEhZcyBp
bnRlcnJ1cHQgcGluIGNvbm5lY3RlZAo+IHRvPyBBIFNvQyBHUElPPyBUaGVyZSBpcyBhIGdlbmVy
aWMgbWVjaGFuaXNtIHRvIGRlc2NyaWJlIFBIWQo+IGludGVycnVwdHMgaW4gRFQuIFRoYXQgc2hv
dWxkIGJlIHVzZWQsIGlmIGl0IGlzIGEgR1BJTy4KPgo+IAkgICBBbmRyZXcKClF1b3RpbmcgQW5k
cmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPjoKCj4gT24gVGh1LCBBcHIgMDgsIDIwMjEgYXQgMTE6
MDA6MDhQTSArMDgwMCwgREVORyBRaW5nZmFuZyB3cm90ZToKPj4gSGkgUmVuw6ksCj4+Cj4+IE9u
IFRodSwgQXByIDgsIDIwMjEgYXQgMTA6MDIgUE0gUmVuw6kgdmFuIERvcnN0ICAKPj4gPG9wZW5z
b3VyY2VAdmRvcnN0LmNvbT4gd3JvdGU6Cj4+ID4KPj4gPiBUZXN0ZWQgb24gVWJpcXVpdGkgRVIt
WC1TRlAgKE1UNzYyMSkgd2l0aCAxIGV4dGVybmFsIHBoeSB3aGljaCAgCj4+IHVzZXMgaXJxPVBP
TEwuCj4+ID4KPj4KPj4gSSB3b25kZXIgaWYgdGhlIGV4dGVybmFsIFBIWSdzIElSUSBjYW4gYmUg
cmVnaXN0ZXJlZCBpbiB0aGUgZGV2aWNldHJlZS4KPj4gQ2hhbmdlIE1UNzUzMF9OVU1fUEhZUyB0
byA2LCBhbmQgYWRkIHRoZSBmb2xsb3dpbmcgdG8gRVItWC1TRlAgZHRzIFBIWSBub2RlOgo+Cj4g
SSBkb24ndCBrbm93IHRoaXMgcGxhdGZvcm0uIFdoYXQgaXMgdGhlIFBIWXMgaW50ZXJydXB0IHBp
biBjb25uZWN0ZWQKPiB0bz8gQSBTb0MgR1BJTz8gVGhlcmUgaXMgYSBnZW5lcmljIG1lY2hhbmlz
bSB0byBkZXNjcmliZSBQSFkKPiBpbnRlcnJ1cHRzIGluIERULiBUaGF0IHNob3VsZCBiZSB1c2Vk
LCBpZiBpdCBpcyBhIEdQSU8uCj4KPiAJICAgQW5kcmV3CgoKSGkgQW5kcmV3LAoKSSBjb3VsZG4n
dCBmaW5kIGlmIHRoZSBleHRlcm5hbCBwaHkgSVJRIGlzIGNvbm5lY3RlZCB0byBhbnkgZ3BpbyBv
ZiB0aGUgU09DLgpTbyBFeHRlcm5hbCBQSFkgSVJRIGNhbid0IGJlIHNlbnNlZCB2aWEgYSBncGlv
LgoKClRoZSBwYXRjaCB1c2VkIHRoZSBNVDc1MzAgbGluayBjaGFuZ2UgaW50ZXJydXB0IGFuZCBm
bGFncy4KTWF5YmUgdGhlIHBhdGNoIGlzIG1pc3VzaW5nIHRoZSB0aGVzZSBmbGFncyBhcyBhbiBp
bnRlcnJ1cHQ/ClRoZSBzYW1lIE1UNzUzMCByZWdpc3RlciBhbHNvIGhhcyB0aGUgaW50ZXJydXB0
IGZsYWdzIGZvciB0aGUgaW50ZXJuYWwgcGh5cy4KQnV0IGluIHRoZSBNVDc1MzEgZGF0YXNoZWV0
IHRoZXkgZG9uJ3QgZGVzY3JpYmUgdGhlbS4KCk9uIHRoZSBvdGhlciBoYW5kIEkgZG9uJ3QgaGF2
ZSBhbnkgaW5mb3JtYXRpb24gYWJvdXQgdGhlIGludGVybmFsIFBIWSAgCm9yIHJlZ2lzdGVyIHNl
dHRpbmdzLgpTbyBlbmFibGluZyB0aGUgaW50ZXJydXB0IG9uIHRoZSBQSFkgaXMgY3VycmVudGx5
IG5vdCBwb3NzaWJsZS4KCkkgYWxzbyBmb3JjZWQgZW5hYmxlZCBhbGwgdGhlIE1UNzUzMCBQSFkg
aW50ZXJydXB0cyBhbmQgUEhZIGxpbmsgIApjaGFuZ2UgaW50ZXJydXB0cy4KSSBwcmludCB0aGUg
aW50ZXJydXB0IHN0YXR1cyBtdDc1MzAuCkkgZG9uJ3Qgc2VlIGFueSBNVDc1MzAgaW50ZXJydXB0
IGZpcmVkIHdoZW4gbGluayBjaGFuZ2luZyB0aGUgcG9ydCAgCjUvZXh0ZXJuYWwgcGh5LgpXaGlj
aCB3YXMgb2YgY291cnNlIGFzIGV4cGVjdGVkLiBXZSBvbmx5IGhhdmUgNSBpbnRlcm5hbCBwaHkn
cyBmb3IgdGhlICAKcG9ydCAwIHRvIDQuClBvcnQgNSBhbmQgNiBpcyBvbmx5IGhhdmUgYSBNQUMg
dGhhdCBpcyBjb25uZWN0ZWQgdG8gdGhlIFNPQyBvZiBhbiAgCmV4dGVybmFsIFBIWS4KCkdyZWF0
cywKClJlbsOpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawo=
