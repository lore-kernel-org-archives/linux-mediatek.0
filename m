Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40DDC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 08:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OBG7HB59IG/BxFK4KTty1jnIcYN+CXnKVrd/awcvlXg=; b=RMyxlzJ60valU1
	2vXasL7ST2vkogi3bNhIsVh807vUecqcv2dRM+pwhgC84Bi+/ndrnkFv02Kw8TufOzsP+x9OWDcdr
	5voma7oinBTBq74jjSlRVP9/ZbVKpUBmeUo+GS1m7kC9OF+MJaxmT+zbt2K7CeLkkG23XI9SipF+o
	Onzwm13zMV/HzBs0WRJfZFAzvMVfbvAdtiQt7QDK2Il5077mubF1igrZd7eC6RgeHETPY6ZL29ICN
	sqPorFiU98cZ715Rlh+PFPtnzM4krNA6TAqOw9k1yQOSkmRjHW56R6G+eSWes3wErmVTq+4ZPyxFF
	rg1JikVGHxMFPi02Vw1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwJic-00Eeto-NS; Wed, 01 Jun 2022 08:28:42 +0000
Received: from smtp-42a9.mail.infomaniak.ch ([84.16.66.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwJiY-00Eeos-LY
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 08:28:41 +0000
Received: from smtp-2-0000.mail.infomaniak.ch (unknown [10.5.36.107])
	by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4LCj3106knzMprL9;
	Wed,  1 Jun 2022 10:28:29 +0200 (CEST)
Received: from [10.0.0.141] (unknown [31.10.206.125])
	by smtp-2-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4LCj300xmMzlhs7p;
	Wed,  1 Jun 2022 10:28:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pschenker.ch;
	s=20220412; t=1654072108;
	bh=Mxe97A1GNK58/rOoNSBOXmeHmHULjXJ31P/mKWrLzv4=;
	h=Subject:From:Reply-To:To:Cc:Date:In-Reply-To:References:From;
	b=I+VDQNdDVJO53tsfUev2HYDDi2xbfy+3H92LPzqKmqJBf57b1oH/UVgYjGKgs4Pdb
	 wU0PTT2ybRQi5XSUqyvtb5AsTfFbuzSk7vdgjuDSSpSB2YqoIfjAWzqEYcQ/xBhJEP
	 ChW2tB1NS/RJdQL+nA3t7oXYxTR0ukB7FXRaO9c8=
Message-ID: <e93aef5c9f8a97efe23cfb5892f78f919ce328e7.camel@pschenker.ch>
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
Date: Wed, 01 Jun 2022 10:28:27 +0200
In-Reply-To: <668f1310cc78b17c24ce7be10f5f907d5578e280.camel@mediatek.com>
References: <20220412090415.17541-1-dev@pschenker.ch>
	 <87y20aod5d.fsf@kernel.org>
	 <668f1310cc78b17c24ce7be10f5f907d5578e280.camel@mediatek.com>
User-Agent: Evolution 3.44.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_012839_183965_2F6F7296 
X-CRM114-Status: GOOD (  17.72  )
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
IHBsYXRmb3JtPwoKSGkgS2FsbGUgYW5kIERlcmVuLAoKSSBqdXN0IG5vdGljZWQgb24gbXkgc3lz
dGVtIGFuZCBtYWlubGluZSB2NS4xOCByZWJvb3RzIGRvIG5vdyB3b3JrCmhvd2V2ZXIgQmx1ZXRv
b3RoIGlzIG5vIGxvbmdlciBhY2Nlc3NpYmxlIGFmdGVyIGEgcmVib290LgoKUmV2ZXJ0aW5nIGNv
bW1pdCBiZjM3NDdhZTJlMjVkZGE2YTllNmM0NjRhNzE3YzY2MTE4YzU4OGM4IG9uIHRvcCBvZgp2
NS4xOCBzb2x2ZXMgdGhpcyBwcm9ibGVtIGZvciBtZS4KCkBEZXJlbiBhcmUgeW91IGF3YXJlIG9m
IHRoaXMgYnVnPwpAS2FsbGUgSXMgdGhlcmUgYSBidWd0cmFja2VyIHNvbWV3aGVyZSBJIGNhbiBz
dWJtaXQgdGhpcz8KClRoYW5rcywKUGhpbGlwcGUKCj4gCj4gCj4gUmVnYXJkcywKPiBEZXJlbgo+
IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
