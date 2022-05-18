Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB0AC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 15:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3feWzk1AykKmR2rDfX5I9PtWJJCbndDip3lUYSqSqsI=; b=3uLsjo7hRJghnK
	jkgsVwigrWkTeSmgPB8FwA+FsEtKCxvXtAwxOFPHxawIgyai6UxtOODj0+ZUuhPQOTZAZa+zsgDbK
	bKBG90jGeoRJoKeZDyLOLCKBKEvqAeRq10/zquO8S2vh3byYArjL4hpNqYaQg2uhXk+LEz/chId2B
	lYn1NWKjSD75wktHcfgh6avSx3WAJKBN7pIZTs3LjcP+N5wRxPQRhVvsnW0LnOGKvmau5NAFgz94R
	5FDgnB2G0juIMIRm20Qeu4WXXelQ4OtPR1Kb2tV/R+112HKMjmHjSbUkFTNCVUV5St2QC1wzsLDVf
	KRuSTh7TQICO8C6RbTyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrLnD-002sNb-QF; Wed, 18 May 2022 15:40:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrLn2-002sIA-WC; Wed, 18 May 2022 15:40:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8BA1160DF2;
 Wed, 18 May 2022 15:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 868EBC385A5;
 Wed, 18 May 2022 15:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652888444;
 bh=gohT+zCwwd2u+Mo57y6mQsr97gjXgOYB0TvDgLPd4L8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RkhxjpoWKxMbw6dgFfMv1T1QJgX8h8s6tC72x485eBOUle9jdlYMDlBQBvUVE4GiO
 ipKdO2NtXucAoSvUSMW0EmUgmzzh72prs2cRXt5pDzQY4on39C4CHHz4YEd/lEVFIA
 /uqK+uUUzmdYF3fdKslUcPLEzaj93ERb1xKFdtmEMDSkObiWBfrdYQbDu3E7qg8KF3
 6fpuWRx0RFzj/qTJW1uFD9OQtzSghXJ3xejYA4FqhjBxvdldnZ2YQ6ZgmpFLIK6coz
 5zLEXoigzGWcSTnLpDOIM3NFskfFESm1atF+8AYGCzPmKyLz90tzzaSuZqZPHtYOPv
 aFaTcYDcAvdaA==
Date: Wed, 18 May 2022 17:40:37 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Felix Fietkau <nbd@nbd.name>, John Crispin
 <john@phrozen.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Paolo
 Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH net-next 00/12] mtk_eth_soc phylink updates
Message-ID: <20220518174037.6f1b863e@thinkpad>
In-Reply-To: <YoUIX+BN/ZbyXzTT@shell.armlinux.org.uk>
References: <YoUIX+BN/ZbyXzTT@shell.armlinux.org.uk>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_084045_151700_A3E54C58 
X-CRM114-Status: GOOD (  24.60  )
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

T24gV2VkLCAxOCBNYXkgMjAyMiAxNTo1MzoxOSArMDEwMAoiUnVzc2VsbCBLaW5nIChPcmFjbGUp
IiA8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKCj4gSGksCj4gCj4gVGhpcyBzZXJpZXMg
dWx0aW1hdGVseSB1cGRhdGVzIG10a19ldGhfc29jIHRvIHVzZSBwaHlsaW5rX3Bjcywgd2l0aCBz
b21lCj4gZml4ZXMgYWxvbmcgdGhlIHdheS4KPiAKPiBQcmV2aW91cyBhdHRlbXB0cyB0byB1cGRh
dGUgdGhpcyBkcml2ZXIgKHdoaWNoIGlzIG5vdyBtYXJrZWQgYXMgbGVnYWN5KQo+IGhhdmUgZmFp
bGVkIGR1ZSB0byBsYWNrIG9mIHRlc3RpbmcuIEkgYW0gaG9waW5nIHRoYXQgdGhpcyB0aW1lIHdp
bGwgYmUKPiBkaWZmZXJlbnQ7IE1hcmVrIGNhbiB0ZXN0IFJHTUlJIG1vZGVzLCBidXQgbm90IFNH
TUlJLiBTbyBhbGwgdGhhdCB3ZQo+IGtub3cgaXMgdGhhdCB0aGlzIHBhdGNoIHNlcmllcyBwcm9i
YWJseSBkb2Vzbid0IGJyZWFrIFJHTUlJLgo+IAo+IDEpIHJlbW92ZSB1bnVzZWQgbWFjX21vZGUg
YW5kIHNnbWlpIGZsYWdzIG1lbWJlcnMgZnJvbSBzdHJ1Y3R1cmVzLgo+IDIpIHJlbW92ZSB1bm5l
Y2Vzc2FyeSBpbnRlcnByZXRhdGlvbiBvZiBzcGVlZCB3aGVuIGNvbmZpZ3VyaW5nIDEwMDAKPiAg
ICBhbmQgMjUwMCBCYXNlLVgKPiAzKSBtb3ZlIGNvbmZpZ3VyYXRpb24gb2YgU0dNSUkgZHVwbGV4
IHNldHRpbmcgZnJvbSBtYWNfY29uZmlnKCkgdG8KPiAgICBsaW5rX3VwKCkKPiA0KSBvbmx5IHBh
c3MgaW4gaW50ZXJmYWNlIG1vZGUgdG8gbXRrX3NnbWlpX3NldHVwX21vZGVfZm9yY2UoKQo+IDUp
IG1vdmUgZGVjaXNpb24gYWJvdXQgd2hpY2ggbXRrX3NnbWlpX3NldHVwX21vZGVfKigpIGZ1bmN0
aW9uIHRvIGNhbGwKPiAgICBpbnRvIG10a19zZ21paS5jCj4gNikgYWRkIGEgZml4bWUgY29tbWVu
dCBmb3IgUkdNSUkgZXhwbGFuaW5nIHdoeSB0aGUgY2FsbCB0bwo+ICAgIG10a19nbWFjMF9yZ21p
aV9hZGp1c3QoKSBpcyBjb21wbGV0ZWx5IHdyb25nIC0gdGhpcyBuZWVkcyB0byBiZQo+ICAgIGFk
ZHJlc3NlZCBieSBzb21lb25lIHdobyBoYXMgdGhlIGhhcmR3YXJlIGFuZCBjYW4gdGVzdCBhbiBh
cHByb3ByaWF0ZQo+ICAgIGZpeC4gVGhpcyBmaXhtZSBtZWFucyB0aGF0IHRoZSBkcml2ZXIgc3Rp
bGwgY2FuJ3QgYmVjb21lIG5vbi1sZWdhY3kuCj4gNykgbW92ZSBnbWFjIHNldHVwIGZyb20gbWFj
X2NvbmZpZygpIHRvIG1hY19maW5pc2goKSAtIHRoaXMgcHJlc2VydmVzCj4gICAgdGhlIG9yZGVy
IHRoYXQgd2Ugd3JpdGUgdG8gdGhlIGhhcmR3YXJlIHdoZW4gd2UgZXZlbnR1YWxseSBjb252ZXJ0
IHRvCj4gICAgcGh5bGlua19wY3MoKQo+IDgpIG1vdmUgY29uZmlndXJhdGlvbiBvZiBzeXNjZmcw
IGluIFNHTUlJLzgwMi4zeiBtb2RlIHRvIG1hY19maW5pc2goKQo+ICAgIGZvciB0aGUgc2FtZSBy
ZWFzb25zIGFzICg3KS4KPiA5KSBjb252ZXJ0IG10a19zZ21paS5jIGNvZGUgc3RydWN0dXJlIGFu
ZCB0aGUgbXRrX3NnbWlpIHN0cnVjdHVyZSB0bwo+ICAgIHN1aXQgY29udmVyc2lvbiB0byBwaHls
aW5rX3Bjcwo+IDEwKSBmaW5hbGx5IGNvbnZlcnQgdG8gcGh5bGlua19wY3MKPiAKPiBBcyB0aGVy
ZSBoYXMgYmVlbiBubyBmZWVkYmFjayBmcm9tIG10a19ldGhfc29jIG1haW50YWluZXJzIHRvIG15
IFJGQwo+IG9uIEFwcmlsIDZ0aCwgbm90IG15IHJlbWluZGVyIG9uIEFwcmlsIDExdGgsIHNvIGl0
J3Mgbm93IHRpbWUgdG8gbWVyZ2UKPiB0aGlzIGFueXdheS4gTWVkaWF0ZWsgY29kZSBzZWVtcyB0
byBiZSBzdWJtaXR0ZWQgdG8gdGhlIGtlcm5lbCBhbmQKPiB0aGVuIHRoZSBtYWludGFpbmVycyBz
Y2FycGVyLi4uCj4gCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L21lZGlhdGVrL210a19ldGhfc29j
LmMgfCAxMDMgKysrKysrKysrLS0tLS0tLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRl
ay9tdGtfZXRoX3NvYy5oIHwgIDQwICsrKy0tLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVk
aWF0ZWsvbXRrX3NnbWlpLmMgICB8IDE3NiArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4g
IDMgZmlsZXMgY2hhbmdlZCwgMTg2IGluc2VydGlvbnMoKyksIDEzMyBkZWxldGlvbnMoLSkKPiAK
ClRlc3RlZC1ieTogTWFyZWsgQmVow7puIDxrYWJlbEBrZXJuZWwub3JnPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
