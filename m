Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5582DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 12:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/mWubNLhO0KPdLM+LU+yEMjozSP8EVm+UJUYfv33Rzc=; b=JMLHwQpjTqmk1I
	IFCDkmwGk1SzNFyXITUYstVwEfvlOeugfGzLoWZaNi7L9HichE+Y1kUafEOt48v37JiRD1OQoGIvy
	c3lFc5BxQhtaBhLP5Mtm69QHbTHLC82CQ2p4erB95Y3JqMKgXPBEGq/YLrv6eePE1MttMcd4I9eaJ
	LwluKLIVNpdDKEyJ+t5wHQF7CLjLxN+XqY5G6VckyCdDazQUFwvDU0Y5WE6FS0tigD4xQQjA5ls0/
	fb0/Mcp3/mbPeJGSL5qHnQnF0XIiKnxPlIe37D5WS1XOZvRWFqKjIDU1o8D34pQ6eLL30u1yUH0h1
	9d70RwTl7zgcPzC+cYhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neFxv-00EIf9-Ds; Tue, 12 Apr 2022 12:49:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neFtj-00EGTd-Sa; Tue, 12 Apr 2022 12:45:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6B8D46182C;
 Tue, 12 Apr 2022 12:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18DDFC385A1;
 Tue, 12 Apr 2022 12:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649767530;
 bh=XYiwRfijmpElQc3kiUm2Ka2BQBWKE6kkKwKlog3l6Fw=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=ol2DO33P1N8tMqZh4X8Yj4ItBwtVOONDeChhJGN4LnJD4gIccJc4cv84waAZ2jGoM
 u6PVkiJfdOP8A29p1K4eO5dnEbiTo3ayyk7R8ZLGnd/AqtAIAF1Sbcq/6xSxvk5pAf
 kJB/cusL+nAw+O1lZlrgiLCGTv9McBJLaHRngWBLcxmmLHlkWrsrRk4MU6hNSP5mx6
 jSRGFxOOq7UyP6wOu5/ejhr9Wi3/eT7CQbXrW+WC0jLziii0gyvfK0Es9EzmILy668
 6Z2L9z55ae0y1Ehkud7V63F/q9HEylhRu9trydlYgCL1Lx1jPvghLiyk3pYojFAxm2
 Txq7fsNfrZrEQ==
From: Kalle Valo <kvalo@kernel.org>
To: Philippe Schenker <dev@pschenker.ch>
Cc: Deren Wu <deren.wu@mediatek.com>, linux-wireless@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>, linux@leemhuis.info,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, YN Chen <YN.Chen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH] Revert "mt76: mt7921: enable aspm by default"
References: <20220412090415.17541-1-dev@pschenker.ch>
 <87y20aod5d.fsf@kernel.org>
 <668f1310cc78b17c24ce7be10f5f907d5578e280.camel@mediatek.com>
 <420241bdd4fdbd1379f59e38571ec04c580eba41.camel@pschenker.ch>
Date: Tue, 12 Apr 2022 15:45:24 +0300
In-Reply-To: <420241bdd4fdbd1379f59e38571ec04c580eba41.camel@pschenker.ch>
 (Philippe Schenker's message of "Tue, 12 Apr 2022 14:30:34 +0200")
Message-ID: <87bkx6o4gr.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_054532_047025_410CFBDA 
X-CRM114-Status: GOOD (  24.94  )
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
IGhlbHAgdG8gY2hlY2sgdGhlIHBhdGNoIGluIHlvdXIgcGxhdGZvcm0/Cj4KPiBBYWgsIHNvIEkg
aGF2ZSBiZWVuIGEgYml0IGxhdGUgd2l0aCBteSBwYWluZnVsIGJpc2VjdGluZy4gU2hvdWxkIGhh
dmUKPiBjaGVja2VkIC1uZXh0IGJlZm9yZS4uLiAKCkFjdHVhbGx5IGNvbW1pdCA2MDJjYzBjOTYx
OGEgaXMgYWxyZWFkeSBpbiBMaW51cycgdHJlZSBhbmQgaXQgd2FzCmluY2x1ZGVkIGluIHY1LjE4
LXJjMSByZWxlYXNlLgoKPiBXaGF0ZXZlciwgeW91ciBwYXRjaCB3b3JrcyBqdXN0IGZpbmUuIEkg
Y2hlcnJ5IHBpY2tlZCB5b3VyIHBhdGNoIG9uCj4gdG9wIG1haW5saW5lIHY1LjE3IGFuZCBpdCB3
b3JrcyBqdXN0IGZpbmUgd2l0aCB0aGF0IG9uZS4KPgo+IFRoYW5rIHlvdSB2ZXJ5IG11Y2ggRGVy
ZW4hCgpBbmQgdGhhbmsgeW91IFBoaWxpcHBlIGZvciBxdWlja2x5IHRlc3RpbmcgdGhpcyEKCj4g
U29ycnkgS2FsbGUgZm9yIHRoZSBvdmVybGFwcGluZyByZXZlcnQsIHBsZWFzZSBkbyBub3QgYXBw
bHkgaXQuCgpPaywgSSdsbCBkcm9wIHlvdXIgcmV2ZXJ0LgoKLS0gCmh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9saXN0LwoKaHR0cHM6Ly93aXJlbGVz
cy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdw
YXRjaGVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
