Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082A3C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 08:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CujZLDbB6sRwgFYJVHdOhyIQeFB/W0L7gpXfj6u6udY=; b=tGLobQBzwsjKpU
	veYJI8AMzQ3GOkLihic4wx9hToZhx4CrvoHAhnpCyCwP2QDi4DIq2C13Nkb6CDD+2GKmPpVPd2Mjr
	+j9dHfc6rqBuYhiMvKrWZcVYVm1cVzLxdMt1V4syQOKhvrrUPks+t9pAUTHttvSagF4wGwGRk60hy
	XvRiFUdA4JzbaCpfyqzPNXvPxwwFEd93hrb81EN6hP2NoyWXuFUulBJLDCTMOtens8JbARtkEfL/O
	MDJYuGM/YxJAyPO+Gw545hA14tL0zJyuOzpyX876uVcW3rBIBS6/VkG7m7iI75V4C5hUga35Wva7e
	qyfCwpoIeMDmy7AS4ODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwKBh-00Enic-En; Wed, 01 Jun 2022 08:58:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwKBV-00EncC-GV; Wed, 01 Jun 2022 08:58:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 15550614AB;
	Wed,  1 Jun 2022 08:58:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A34C385B8;
	Wed,  1 Jun 2022 08:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654073912;
	bh=fycRZup+rRlDibIJXv+b3HmaX/NftZkSg+gXy5Njcqo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=laVepRzYyH9QSsliuI01fpIxdBnoq4GRTpBkDWb+GHnPG0tBOjLV9AyqB9D+h4yV4
	 TPIkLvVZe4EBIdgshCqz0iqc/jH4PNKYahyQeUX5d+qxiRx0+CI25HWutXwoNNE8c3
	 NjEGpTyEuMRAFGNQ2O/YkVc1LSOlqeqNb2ZKnOAduLGWHMk4y8pLRefiCwj6K2i+NW
	 4Rnq6FdMXVyFiu0o3fN+a8kD6QBxODs4ggsFv6qyyr5LJhSzbKFP0aXJQwRc04HYHJ
	 SYdBYRQVehNUABAvGHAEjwPlogc7hDLkElYPaKRBTeHVzOZicj61LT1hyAS2B3sgBE
	 2PgUzp8xU9JAQ==
From: Kalle Valo <kvalo@kernel.org>
To: Philippe Schenker <dev@pschenker.ch>
Cc: Deren Wu <deren.wu@mediatek.com>,  linux-wireless@vger.kernel.org,  Felix Fietkau <nbd@nbd.name>,  linux@leemhuis.info,  "David S. Miller" <davem@davemloft.net>,  Jakub Kicinski <kuba@kernel.org>,  Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,  Matthias Brugger <matthias.bgg@gmail.com>,  Paolo Abeni <pabeni@redhat.com>,  Ryder Lee <ryder.lee@mediatek.com>,  Sean Wang <sean.wang@mediatek.com>,  Shayne Chen <shayne.chen@mediatek.com>,  YN Chen <YN.Chen@mediatek.com>,  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,  linux-mediatek@lists.infradead.org,  netdev@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH] Revert "mt76: mt7921: enable aspm by default"
References: <20220412090415.17541-1-dev@pschenker.ch>
	<87y20aod5d.fsf@kernel.org>
	<668f1310cc78b17c24ce7be10f5f907d5578e280.camel@mediatek.com>
	<e93aef5c9f8a97efe23cfb5892f78f919ce328e7.camel@pschenker.ch>
Date: Wed, 01 Jun 2022 11:58:25 +0300
In-Reply-To: <e93aef5c9f8a97efe23cfb5892f78f919ce328e7.camel@pschenker.ch>
	(Philippe Schenker's message of "Wed, 01 Jun 2022 10:28:27 +0200")
Message-ID: <87mtewoj4e.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_015833_684605_FB4E78FB 
X-CRM114-Status: GOOD (  25.32  )
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

UGhpbGlwcGUgU2NoZW5rZXIgPGRldkBwc2NoZW5rZXIuY2g+IHdyaXRlczoKCj4gT24gVHVlLCAy
MDIyLTA0LTEyIGF0IDE5OjA2ICswODAwLCBEZXJlbiBXdSB3cm90ZToKPj4gT24gVHVlLCAyMDIy
LTA0LTEyIGF0IDEyOjM3ICswMzAwLCBLYWxsZSBWYWxvIHdyb3RlOgo+PiA+IFBoaWxpcHBlIFNj
aGVua2VyIDxkZXZAcHNjaGVua2VyLmNoPiB3cml0ZXM6Cj4+ID4gCj4+ID4gPiBUaGlzIHJldmVy
dHMgY29tbWl0IGJmMzc0N2FlMmUyNWRkYTZhOWU2YzQ2NGE3MTdjNjYxMThjNTg4YzguCj4+ID4g
PiAKPj4gPiA+IFRoaXMgY29tbWl0IGludHJvZHVjZXMgYSByZWdyZXNzaW9uIG9uIHNvbWUgc3lz
dGVtcyB3aGVyZSB0aGUKPj4gPiA+IGtlcm5lbCBpcwo+PiA+ID4gY3Jhc2hpbmcgaW4gZGlmZmVy
ZW50IGxvY2F0aW9ucyBhZnRlciBhIHJlYm9vdCB3YXMgaXNzdWVkLgo+PiA+ID4gCj4+ID4gPiBU
aGlzIGlzc3VlIHdhcyBiaXNlY3RlZCBvbiBhIFRoaW5rcGFkIFAxNHMgR2VuMiAoQU1EKSB3aXRo
IGxhdGVzdAo+PiA+ID4gZmlybXdhcmUuCj4+ID4gPiAKPj4gPiA+IExpbms6IAo+PiA+ID4gaHR0
cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXdp
cmVsZXNzLzUwNzdhOTUzNDg3Mjc1ODM3ZTgxYmRmMTgwOGRlZDAwYjk2NzZmOWYuY2FtZWxAcHNj
aGVua2VyLmNoL19fOyEhQ1RSTktBOXdNZzBBUmJ3ITA5dGp5YVFsTWNpM2ZWSTN5aU5pREpLVVdf
cXdOQV9DYlZob0FyYWVJWDk2Qjk5UTE0SjRpRHljV0E5Y3EzNlkkCj4+ID4gPiDCoAo+PiA+ID4g
U2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgU2NoZW5rZXIgPGRldkBwc2NoZW5rZXIuY2g+Cj4+ID4g
Cj4+ID4gQ2FuIEkgdGFrZSB0aGlzIHRvIHdpcmVsZXNzIHRyZWU/IEZlbGl4LCBhY2s/Cj4+ID4g
Cj4+ID4gSSdsbCBhbHNvIGFkZDoKPj4gPiAKPj4gPiBGaXhlczogYmYzNzQ3YWUyZTI1ICgibXQ3
NjogbXQ3OTIxOiBlbmFibGUgYXNwbSBieSBkZWZhdWx0IikKPj4gPiAKPj4gCj4+IEhpIEthbGxl
LAo+PiAKPj4gV2UgaGF2ZSBhIHBhdGNoIGZvciBhIHNpbWlsYXIgcHJvYmxlbS4gQ2FuIHlvdSB3
YWl0IGZvciB0aGUKPj4gdmVyaWZpY2F0aW9uIGJ5IFBoaWxpcHBlPwo+PiBDb21taXQgNjAyY2Mw
Yzk2MThhODEgKCJtdDc2OiBtdDc5MjFlOiBmaXggcG9zc2libGUgcHJvYmUgZmFpbHVyZQo+PiBh
ZnRlcgo+PiByZWJvb3QiKQo+PiBMaW5rOiAKPj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC9kcml2ZXJzL25l
dC93aXJlbGVzcy9tZWRpYXRlay9tdDc2P2lkPTYwMmNjMGM5NjE4YTgxOWFiMDBlYTNjOTQwMDc0
MmEwY2EzMTgzODAKPj4gCj4+IEkgY2FuIHJlcHJvZHVjZSB0aGUgcHJvYmxlbSBpbiBteSB2NS4x
Ni1yYzUgZGVza3RvcC4gQW5kIHRoZSBpc3N1ZSBjYW4KPj4gYmUgZml4ZWQgd2hlbiB0aGUgcGF0
Y2ggYXBwbGllZC4KPj4gCj4+IAo+PiBIaSBQaGlsaXBwZSwKPj4gCj4+IENhbiB5b3UgcGxlYXNl
IGhlbHAgdG8gY2hlY2sgdGhlIHBhdGNoIGluIHlvdXIgcGxhdGZvcm0/Cj4KPiBIaSBLYWxsZSBh
bmQgRGVyZW4sCj4KPiBJIGp1c3Qgbm90aWNlZCBvbiBteSBzeXN0ZW0gYW5kIG1haW5saW5lIHY1
LjE4IHJlYm9vdHMgZG8gbm93IHdvcmsKPiBob3dldmVyIEJsdWV0b290aCBpcyBubyBsb25nZXIg
YWNjZXNzaWJsZSBhZnRlciBhIHJlYm9vdC4KPgo+IFJldmVydGluZyBjb21taXQgYmYzNzQ3YWUy
ZTI1ZGRhNmE5ZTZjNDY0YTcxN2M2NjExOGM1ODhjOCBvbiB0b3Agb2YKPiB2NS4xOCBzb2x2ZXMg
dGhpcyBwcm9ibGVtIGZvciBtZS4KPgo+IEBEZXJlbiBhcmUgeW91IGF3YXJlIG9mIHRoaXMgYnVn
Pwo+IEBLYWxsZSBJcyB0aGVyZSBhIGJ1Z3RyYWNrZXIgc29tZXdoZXJlIEkgY2FuIHN1Ym1pdCB0
aGlzPwoKRm9yIHJlZ3Jlc3Npb25zIHRoZSBiZXN0IGlzIHRvIHN1Ym1pdCBpdCB0byB0aGUgcmVn
cmVzc2lvbnMgbGlzdCwgQ0NlZAppdCBub3cuCgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCgpodHRwczovL3dpcmVsZXNzLndpa2ku
a2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
