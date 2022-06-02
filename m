Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D00C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 08:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XnM21/ITyjaYGxSnEhy4yzzBcOnDl4Bt+LH0eUucmNo=; b=dkZZx9r3nZkpk6
	LdPgCrZMzQZkyNAAJscweOnWXhT8ZUlxnche6LrVkpoelusmh/g/iqSFOlqvdN3k7kYLTX7wQVt1R
	Pkz4H1X26JGjok5LrAQzq5J4sJKDP5Dp3Q0Jo0Ks9rucfoakaIs9+SFYXlHikn7hxAhNtN3KT6Aas
	2FMUhPFNPrX8IO5BOhztNuTBiFlIobAs8ZdJarpuWmkNkZQ7yz+MDCLA2fHkuwe83SEYJpJkwU9VM
	Rz7dfd7XE2aTSTmsf/EE0Glqw+fukbjwVhMKTANBzjNewWDAoLXNed7PwqtftbVJJ6XJDsa5MZpAh
	4aNdKuec3yvq5XtjxWuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwgRQ-002GJa-Ab; Thu, 02 Jun 2022 08:44:28 +0000
Received: from smtp-bc0e.mail.infomaniak.ch ([45.157.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwgRM-002GHP-Ev
	for linux-mediatek@lists.infradead.org; Thu, 02 Jun 2022 08:44:26 +0000
Received: from smtp-2-0001.mail.infomaniak.ch (unknown [10.5.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4LDKLl046yzMprjq;
	Thu,  2 Jun 2022 10:44:15 +0200 (CEST)
Received: from [10.0.0.141] (unknown [31.10.206.125])
	by smtp-2-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4LDKLk1DMszlk1FD;
	Thu,  2 Jun 2022 10:44:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pschenker.ch;
	s=20220412; t=1654159454;
	bh=mV7mkCUjOl6hMSevGR59+xlFQCqBQ4WwdymyF0opzUY=;
	h=Subject:From:Reply-To:To:Cc:Date:In-Reply-To:References:From;
	b=TVJFhJK9EsLdiqX+KhfpvkfTgssVCX73VGWmPkbBNWLdNRINdU7AzH0KLslewDaPE
	 0/OcSegpEggQ+NuLItKAQexi9dmhEjTtYaqWsf2yWmCCCWHigsxq3jh0KmXREU+xJC
	 BCkuo08R2hje4EXErOkpDVna9rJTAIVc9SsHLJrw=
Message-ID: <2c5a6bb34c67c9c15c393346e89bdb14ae6f3c44.camel@pschenker.ch>
Subject: Re: [PATCH] Revert "mt76: mt7921: enable aspm by default"
From: Philippe Schenker <dev@pschenker.ch>
To: sean.wang@mediatek.com
Cc: deren.wu@mediatek.com, kvalo@kernel.org, linux-wireless@vger.kernel.org,
  nbd@nbd.name, linux@leemhuis.info, davem@davemloft.net, kuba@kernel.org, 
 lorenzo.bianconi83@gmail.com, matthias.bgg@gmail.com, pabeni@redhat.com, 
 ryder.lee@mediatek.com, shayne.chen@mediatek.com, yn.chen@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Date: Thu, 02 Jun 2022 10:44:13 +0200
In-Reply-To: <1654122203-26090-1-git-send-email-sean.wang@mediatek.com>
References: 	<e93aef5c9f8a97efe23cfb5892f78f919ce328e7.camel@pschenker.ch--annotate>
	 <1654122203-26090-1-git-send-email-sean.wang@mediatek.com>
User-Agent: Evolution 3.44.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_014424_671305_558F38D6 
X-CRM114-Status: GOOD (  28.25  )
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

T24gVGh1LCAyMDIyLTA2LTAyIGF0IDA2OjIzICswODAwLCBzZWFuLndhbmdAbWVkaWF0ZWsuY29t
IHdyb3RlOgo+IEZyb206IFNlYW4gV2FuZyA8c2Vhbi53YW5nQG1lZGlhdGVrLmNvbT4KPiAKPiA+
IE9uIFR1ZSwgMjAyMi0wNC0xMiBhdCAxOTowNiArMDgwMCwgRGVyZW4gV3Ugd3JvdGU6Cj4gPiA+
IE9uIFR1ZSwgMjAyMi0wNC0xMiBhdCAxMjozNyArMDMwMCwgS2FsbGUgVmFsbyB3cm90ZToKPiA+
ID4gPiBQaGlsaXBwZSBTY2hlbmtlciA8ZGV2QHBzY2hlbmtlci5jaD4gd3JpdGVzOgo+ID4gPiA+
IAo+ID4gPiA+ID4gVGhpcyByZXZlcnRzIGNvbW1pdCBiZjM3NDdhZTJlMjVkZGE2YTllNmM0NjRh
NzE3YzY2MTE4YzU4OGM4Lgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBUaGlzIGNvbW1pdCBpbnRyb2R1
Y2VzIGEgcmVncmVzc2lvbiBvbiBzb21lIHN5c3RlbXMgd2hlcmUgdGhlCj4gPiA+ID4gPiBrZXJu
ZWwgaXMgY3Jhc2hpbmcgaW4gZGlmZmVyZW50IGxvY2F0aW9ucyBhZnRlciBhIHJlYm9vdCB3YXMK
PiA+ID4gPiA+IGlzc3VlZC4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhpcyBpc3N1ZSB3YXMgYmlz
ZWN0ZWQgb24gYSBUaGlua3BhZCBQMTRzIEdlbjIgKEFNRCkgd2l0aAo+ID4gPiA+ID4gbGF0ZXN0
Cj4gPiA+ID4gPiBmaXJtd2FyZS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gTGluazoKPiA+ID4gPiA+
IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC13aXJlbGVzcwo+ID4gPiA+ID4gLzUwNzdhOTUzNDg3Mjc1ODM3ZTgxYmRmMTgwOGRlZDAwYjk2
NzZmOWYuY2FtZWxAcHNjaGVua2VyLmNoL18KPiA+ID4gPiA+IF87ISEKPiA+ID4gPiA+IENUUk5L
QTl3TWcwQVJidyEwOXRqeWFRbE1jaTNmVkkzeWlOaURKS1VXX3F3TkFfQ2JWaG9BcmFlSVg5NkI5
Cj4gPiA+ID4gPiA5UTE0Cj4gPiA+ID4gPiBKNGlEeWNXQTljcTM2WSQKPiA+ID4gPiA+IAo+ID4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgU2NoZW5rZXIgPGRldkBwc2NoZW5rZXIuY2g+
Cj4gPiA+ID4gCj4gPiA+ID4gQ2FuIEkgdGFrZSB0aGlzIHRvIHdpcmVsZXNzIHRyZWU/IEZlbGl4
LCBhY2s/Cj4gPiA+ID4gCj4gPiA+ID4gSSdsbCBhbHNvIGFkZDoKPiA+ID4gPiAKPiA+ID4gPiBG
aXhlczogYmYzNzQ3YWUyZTI1ICgibXQ3NjogbXQ3OTIxOiBlbmFibGUgYXNwbSBieSBkZWZhdWx0
IikKPiA+ID4gPiAKPiA+ID4gCj4gPiA+IEhpIEthbGxlLAo+ID4gPiAKPiA+ID4gV2UgaGF2ZSBh
IHBhdGNoIGZvciBhIHNpbWlsYXIgcHJvYmxlbS4gQ2FuIHlvdSB3YWl0IGZvciB0aGUKPiA+ID4g
dmVyaWZpY2F0aW9uIGJ5IFBoaWxpcHBlPwo+ID4gPiBDb21taXQgNjAyY2MwYzk2MThhODEgKCJt
dDc2OiBtdDc5MjFlOiBmaXggcG9zc2libGUgcHJvYmUgZmFpbHVyZQo+ID4gPiBhZnRlcgo+ID4g
PiByZWJvb3QiKQo+ID4gPiBMaW5rOgo+ID4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19f
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lCj4gPiA+IGwvZ2l0L3Rv
cnZhbGRzL2xpbnV4LmdpdC9jb21taXQvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3
Ngo+ID4gPiA/aWQ9Cj4gPiA+IDYwMmNjMGM5NjE4YTgxOWFiMDBlYTNjOTQwMDc0MmEwY2EzMTgz
ODBfXzshIUNUUk5LQTl3TWcwQVJidyEzTjlJMwo+ID4gPiBpS3dTCj4gPiA+IDNYQ05BYjRMdWhi
RnF0X2VsMXlpT2FKelNkVWphSnNUYXhSQ0hpV2hYbkVnYmszYk9xWVR5NlQkCj4gPiA+IAo+ID4g
PiBJIGNhbiByZXByb2R1Y2UgdGhlIHByb2JsZW0gaW4gbXkgdjUuMTYtcmM1IGRlc2t0b3AuIEFu
ZCB0aGUgaXNzdWUKPiA+ID4gY2FuCj4gPiA+IGJlIGZpeGVkIHdoZW4gdGhlIHBhdGNoIGFwcGxp
ZWQuCj4gPiA+IAo+ID4gPiAKPiA+ID4gSGkgUGhpbGlwcGUsCj4gPiA+IAo+ID4gPiBDYW4geW91
IHBsZWFzZSBoZWxwIHRvIGNoZWNrIHRoZSBwYXRjaCBpbiB5b3VyIHBsYXRmb3JtPwo+ID4gCj4g
PiBIaSBLYWxsZSBhbmQgRGVyZW4sCj4gPiAKPiA+IEkganVzdCBub3RpY2VkIG9uIG15IHN5c3Rl
bSBhbmQgbWFpbmxpbmUgdjUuMTggcmVib290cyBkbyBub3cgd29yawo+ID4gaG93ZXZlciBCbHVl
dG9vdGggaXMgbm8gbG9uZ2VyIGFjY2Vzc2libGUgYWZ0ZXIgYSByZWJvb3QuCj4gPiAKPiA+IFJl
dmVydGluZyBjb21taXQgYmYzNzQ3YWUyZTI1ZGRhNmE5ZTZjNDY0YTcxN2M2NjExOGM1ODhjOCBv
biB0b3Agb2YKPiA+IHY1LjE4IHNvbHZlcyB0aGlzIHByb2JsZW0gZm9yIG1lLgo+ID4gCj4gPiBA
RGVyZW4gYXJlIHlvdSBhd2FyZSBvZiB0aGlzIGJ1Zz8KPiA+IEBLYWxsZSBJcyB0aGVyZSBhIGJ1
Z3RyYWNrZXIgc29tZXdoZXJlIEkgY2FuIHN1Ym1pdCB0aGlzPwo+IAo+IEhpIFBoaWxpcHBlLAo+
IAo+IENvdWxkIHlvdSB0cnkgdGhlIGxhdGVzdCBmaXJtd2FyZSB0byBzZWUgaWYgaXQgY2FuIGhl
bHAgd2l0aCB0aGUgaXNzdWUKPiB5b3UgcmVwb3J0ZWQgaGVyZSA/Cj4gCj4gUGxlYXNlIGNoZWNr
IG91dAo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Zp
cm13YXJlL2xpbnV4LWZpcm13YXJlLmdpdC90cmVlL21lZGlhdGVrCj4gYW5kIHJlcGxhY2UgdGhl
IGZvbGxvd2luZyB0aHJlZSBmaWxlcyBpbiAvbGliL2Zpcm13YXJlL21lZGlhdGVrIG9uCj4geW91
ciB0YXJnZXQgYW5kIHJlYm9vdAo+IDEpIEJUX1JBTV9DT0RFX01UNzk2MV8xXzJfaGRyLmJpbgo+
IDIpIFdJRklfTVQ3OTYxX3BhdGNoX21jdV8xXzJfaGRyLmJpbgo+IDMpIFdJRklfUkFNX0NPREVf
TVQ3OTYxXzEuYmluCj4gCj4gwqDCoMKgwqDCoMKgwqDCoFNlYW4KCkhpIFNlYW4sCgpUaGFua3Mg
Zm9yIHlvdXIgc3VnZ2VzdGlvbi4gSSBkb3dubG9hZGVkIHRoZSBmaXJtd2FyZXMgZnJvbSB0aGUg
bGluayB5b3UKaW5kaWNhdGVkIGFuZCBkb3dubG9hZGVkIHRoZSB0aHJlZSBmaXJtd2FyZXMgZnJv
bSBtYWluIGJyYW5jaC4gSSBjaGVja2VkCmFuZCB0aGUgc2hhMjU2c3VtcyBvZiB0aGUgbW9zdCBy
ZWNlbnQgZmlybXdhcmVzIG1hdGNoIHdpdGggdGhlIG9uZQppbnN0YWxsZWQgYnkgbXkgZGlzdHJp
YnV0aW9uLiBTbyBJIGFscmVhZHkgaGFkIGxhdGVzdCB2ZXJzaW9ucyBvbiBteQp0ZXN0cy4KClBo
aWxpcHBlCgo+IAo+ID4gCj4gPiBUaGFua3MsCj4gPiBQaGlsaXBwZQo+ID4gCj4gPiA+IAo+ID4g
PiAKPiA+ID4gUmVnYXJkcywKPiA+ID4gRGVyZW4KPiA+ID4gCj4gPiAKPiA+IAo+ID4gCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
