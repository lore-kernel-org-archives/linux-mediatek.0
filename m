Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8DBC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 12:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f5FxGZGNguMEHx1f5LKq64tQG7fYDLKHl8vtvlLgu7Q=; b=GhtN4Ks1DyN+YX
	6Ba6n7tgudTE69j2/HXnA6SrJWWJiB02fM/5j9qz3PXFx9WWiXALp2kFwAy5btJwgIiXdd33hWaDG
	FHrl/oqPK4dTIrVoWf89B+VEqYUMp8sqhabE7wQTRAAFHVTN2GTiOu1PI3Jlib8CwuamdNH+X9jo+
	HrjYBO0HbqKo6au+JxdsTJGKRKMJlNCyvMz/shDEnMRplSzbpH5F6G0Ez1/fkThQ+WlCcLQ5Z3WAH
	F02fwlzdQBJmSsg9tjKaAvZd0fqdCQ4h5EHp0+zBmnp8fvpPU50B6ht1PtohHqx0A920HOD/tfvBP
	iyZ3LH6VUAtSQz9ivK+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neFsE-00EFkS-92; Tue, 12 Apr 2022 12:43:58 +0000
Received: from mxout014.mail.hostpoint.ch ([2a00:d70:0:e::314])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neFfe-00E9RL-Jt; Tue, 12 Apr 2022 12:31:01 +0000
Received: from [10.0.2.46] (helo=asmtp013.mail.hostpoint.ch)
 by mxout014.mail.hostpoint.ch with esmtps (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2 (FreeBSD)) (envelope-from <dev@pschenker.ch>)
 id 1neFfG-000Bu6-U9; Tue, 12 Apr 2022 14:30:34 +0200
Received: from 31-10-206-124.static.upc.ch ([31.10.206.124] helo=[10.0.0.134])
 by asmtp013.mail.hostpoint.ch with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.95 (FreeBSD))
 (envelope-from <dev@pschenker.ch>) id 1neFfG-000LWw-O9;
 Tue, 12 Apr 2022 14:30:34 +0200
X-Authenticated-Sender-Id: dev@pschenker.ch
Message-ID: <420241bdd4fdbd1379f59e38571ec04c580eba41.camel@pschenker.ch>
Subject: Re: [PATCH] Revert "mt76: mt7921: enable aspm by default"
From: Philippe Schenker <dev@pschenker.ch>
To: Deren Wu <deren.wu@mediatek.com>, Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
 linux@leemhuis.info, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi83@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, Sean
 Wang <sean.wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, YN
 Chen <YN.Chen@mediatek.com>,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
Date: Tue, 12 Apr 2022 14:30:34 +0200
In-Reply-To: <668f1310cc78b17c24ce7be10f5f907d5578e280.camel@mediatek.com>
References: <20220412090415.17541-1-dev@pschenker.ch>
 <87y20aod5d.fsf@kernel.org>
 <668f1310cc78b17c24ce7be10f5f907d5578e280.camel@mediatek.com>
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_053058_771423_B1ADE545 
X-CRM114-Status: GOOD (  20.79  )
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
Reply-To: dev@pschenker.ch
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMDIyLTA0LTEyIGF0IDE5OjA2ICswODAwLCBEZXJlbiBXdSB3cm90ZToKPiBPbiBU
dWUsIDIwMjItMDQtMTIgYXQgMTI6MzcgKzAzMDAsIEthbGxlIFZhbG8gd3JvdGU6Cj4gPiBQaGls
aXBwZSBTY2hlbmtlciA8ZGV2QHBzY2hlbmtlci5jaD4gd3JpdGVzOgo+ID4gCj4gPiA+IFRoaXMg
cmV2ZXJ0cyBjb21taXQgYmYzNzQ3YWUyZTI1ZGRhNmE5ZTZjNDY0YTcxN2M2NjExOGM1ODhjOC4K
PiA+ID4gCj4gPiA+IFRoaXMgY29tbWl0IGludHJvZHVjZXMgYSByZWdyZXNzaW9uIG9uIHNvbWUg
c3lzdGVtcyB3aGVyZSB0aGUKPiA+ID4ga2VybmVsIGlzCj4gPiA+IGNyYXNoaW5nIGluIGRpZmZl
cmVudCBsb2NhdGlvbnMgYWZ0ZXIgYSByZWJvb3Qgd2FzIGlzc3VlZC4KPiA+ID4gCj4gPiA+IFRo
aXMgaXNzdWUgd2FzIGJpc2VjdGVkIG9uIGEgVGhpbmtwYWQgUDE0cyBHZW4yIChBTUQpIHdpdGgg
bGF0ZXN0Cj4gPiA+IGZpcm13YXJlLgo+ID4gPiAKPiA+ID4gTGluazogCj4gPiA+IGh0dHBzOi8v
dXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC13aXJlbGVz
cy81MDc3YTk1MzQ4NzI3NTgzN2U4MWJkZjE4MDhkZWQwMGI5Njc2ZjlmLmNhbWVsQHBzY2hlbmtl
ci5jaC9fXzshIUNUUk5LQTl3TWcwQVJidyEwOXRqeWFRbE1jaTNmVkkzeWlOaURKS1VXX3F3TkFf
Q2JWaG9BcmFlSVg5NkI5OVExNEo0aUR5Y1dBOWNxMzZZJAo+ID4gPiDCoAo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBQaGlsaXBwZSBTY2hlbmtlciA8ZGV2QHBzY2hlbmtlci5jaD4KPiA+IAo+ID4gQ2Fu
IEkgdGFrZSB0aGlzIHRvIHdpcmVsZXNzIHRyZWU/IEZlbGl4LCBhY2s/Cj4gPiAKPiA+IEknbGwg
YWxzbyBhZGQ6Cj4gPiAKPiA+IEZpeGVzOiBiZjM3NDdhZTJlMjUgKCJtdDc2OiBtdDc5MjE6IGVu
YWJsZSBhc3BtIGJ5IGRlZmF1bHQiKQo+ID4gCj4gCj4gSGkgS2FsbGUsCj4gCj4gV2UgaGF2ZSBh
IHBhdGNoIGZvciBhIHNpbWlsYXIgcHJvYmxlbS4gQ2FuIHlvdSB3YWl0IGZvciB0aGUKPiB2ZXJp
ZmljYXRpb24gYnkgUGhpbGlwcGU/Cj4gQ29tbWl0IDYwMmNjMGM5NjE4YTgxICgibXQ3NjogbXQ3
OTIxZTogZml4IHBvc3NpYmxlIHByb2JlIGZhaWx1cmUKPiBhZnRlcgo+IHJlYm9vdCIpCj4gTGlu
azogCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9y
dmFsZHMvbGludXguZ2l0L2NvbW1pdC9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2
P2lkPTYwMmNjMGM5NjE4YTgxOWFiMDBlYTNjOTQwMDc0MmEwY2EzMTgzODAKPiAKPiBJIGNhbiBy
ZXByb2R1Y2UgdGhlIHByb2JsZW0gaW4gbXkgdjUuMTYtcmM1IGRlc2t0b3AuIEFuZCB0aGUgaXNz
dWUgY2FuCj4gYmUgZml4ZWQgd2hlbiB0aGUgcGF0Y2ggYXBwbGllZC4KPiAKPiAKPiBIaSBQaGls
aXBwZSwKPiAKPiBDYW4geW91IHBsZWFzZSBoZWxwIHRvIGNoZWNrIHRoZSBwYXRjaCBpbiB5b3Vy
IHBsYXRmb3JtPwoKQWFoLCBzbyBJIGhhdmUgYmVlbiBhIGJpdCBsYXRlIHdpdGggbXkgcGFpbmZ1
bCBiaXNlY3RpbmcuIFNob3VsZCBoYXZlCmNoZWNrZWQgLW5leHQgYmVmb3JlLi4uIFdoYXRldmVy
LCB5b3VyIHBhdGNoIHdvcmtzIGp1c3QgZmluZS4gSSBjaGVycnkKcGlja2VkIHlvdXIgcGF0Y2gg
b24gdG9wIG1haW5saW5lIHY1LjE3IGFuZCBpdCB3b3JrcyBqdXN0IGZpbmUgd2l0aCB0aGF0Cm9u
ZS4KClRoYW5rIHlvdSB2ZXJ5IG11Y2ggRGVyZW4hCgpTb3JyeSBLYWxsZSBmb3IgdGhlIG92ZXJs
YXBwaW5nIHJldmVydCwgcGxlYXNlIGRvIG5vdCBhcHBseSBpdC4KCkJlc3QgUmVnYXJkcywKUGhp
bGlwcGUKCj4gCj4gCj4gUmVnYXJkcywKPiBEZXJlbgo+IAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
