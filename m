Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB74C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 13:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4hm2o7LcIBJJCoOgxVdH9RVeiWwHXxeuar1jft1kyo=; b=1zJTWSFzF79/II
	6u4SlwBvK69mhqzFffrRgwG/iebnJgrVkfibqHdtmzvTFes4C6LsyhfuhyxHt66aLABPArjLkwClF
	+hySKK5NJIPduLFdVvfnD7ILPNCrFJvepBBtvNO2ecrMYpQPllzcRF0RirrEyFFF/Pc9Abc+Klha0
	/a68MSPWLPorwHvmARvDPozwaoOGXZYXSPYH22JiRBe9Y3b5CuaSRN7a3MNmLdF3cO2+tY/xGGyv+
	eWW/a9fOtEUbzgVJ1kprRflzY5UpY7yC5M03LS4ggapGGUcUL13cJ6Litk95xcUwu+aRmn7Ayux3G
	tGrppegzozwxCBRbdXOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4kG5-00Bbpo-Ml; Tue, 04 Jan 2022 13:53:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4kFe-00BbfS-46; Tue, 04 Jan 2022 13:53:23 +0000
X-UUID: fdcba7ab5d03447ba2fc966afb05ca6a-20220104
X-UUID: fdcba7ab5d03447ba2fc966afb05ca6a-20220104
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 713208706; Tue, 04 Jan 2022 06:53:20 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Jan 2022 05:53:18 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 4 Jan 2022 21:53:17 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Jan 2022 21:53:17 +0800
Message-ID: <2652267e57e4095e9d0bc265b93cf31f545b7683.camel@mediatek.com>
Subject: Re: [RESEND PATCH v10 0/3] This patches provide ADSP IPC support
 for MT8195
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jassi Brar
 <jassisinghbrar@gmail.com>
CC: Linux-ALSA <alsa-devel@alsa-project.org>, <tzungbi@google.com>,
 <cujomalainey@google.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <sound-open-firmware@alsa-project.org>
Date: Tue, 4 Jan 2022 21:53:17 +0800
In-Reply-To: <20211210104153.24181-1-allen-kh.cheng@mediatek.com>
References: <20211210104153.24181-1-allen-kh.cheng@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_055322_255675_A581661F 
X-CRM114-Status: GOOD (  21.55  )
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

T24gRnJpLCAyMDIxLTEyLTEwIGF0IDE4OjQxICswODAwLCBhbGxlbi1raC5jaGVuZyB3cm90ZToK
PiBGcm9tOiBBbGxlbi1LSCBDaGVuZyA8QWxsZW4tS0guQ2hlbmdAbWVkaWF0ZWsuY29tPgo+IAo+
IE1lZGlhdGVrIEFEU1AgSVBDIGlzIHVzZWQgdG8gc2VuZCBub3RpZmljYXRpb24gb3Igc2hvcnQg
bWVzc2FnZQo+IGJldHdlZW4KPiBwcm9jZXNzb3JzIHdpdGggZHNwLsK3Cj4gCj4gSXQgd2lsbCBw
bGFjZSB0aGUgbWVzc2FnZSB0byB0aGUgc2hhcmUgYnVmZmVyIGFuZCB3aWxsIGFjY2VzcyB0aGUK
PiBBRFNQIG1haWxib3gKPiByZWdpc3RlcnMgdG8ga2ljayBkc3AuCj4gCj4gVHdvIG1haWxib3hl
cyB1c2VkIHRvIHNlbmQgbm90aWZpY2F0aW9uIG9yIHNob3J0IG1lc3NhZ2UgYmV0d2Vlbgo+IHBy
b2Nlc3NvcnMgd2l0aAo+IGRzcAo+IAoKRGVhciBNYXR0aGlhcywKCkRvIHlvdSBoYXZlIGFueSBj
b21tZW50IGFib3V0IHRoaXMgcGF0Y2ggc2VyaWVzPwoKVGhhbmtzLgoKPiBjaGFuZ2VzIHNpbmNl
IHY5Ogo+IC0gcmVuYW1lIGFkc3BfbWJveF9jaGFuX29wcyB0byBtdGtfYWRzcF9tYm94X2NoYW5f
b3BzCj4gCj4gY2hhbmdlcyBzaW5jZSB2ODoKPiAtIHJlbW92ZSBzdHJ1Y3QgYWRzcF9tYm94X2No
X2luZm8KPiAtIGFkZCBnZXRfbXRrX2Fkc3BfbWJveF9wcml2Cj4gLSB1c2UgbXRrX2Fkc3BfbWJv
eF9wcml2IHZhX21ib3hyZWcgYWRkcmVzcyBpbiBhZHNwIG1ib3ggZHJpdmVyCj4gLSBhZGQgc3Ry
dWN0IG10a19hZHNwX21ib3hfY2ZnIGZvciBEU1AgbWJveCByZWdpc3RlciBvZmZzZXQKPiAtIHJl
bW92ZSBhZHNwIG1ib3ggcmVnaXN0ZXIgb2Zmc2V0IGhhcmQgY29kZSBkZWZpbmUKPiAtIHJlbW92
ZSBtdGstYWRzcC1pcGMuaCByZWZlcmVuY2UgaW4gYWRzcCBtYm94IGRyaXZlcgo+IAo+IGNoYW5n
ZXMgc2luY2Ugdjc6Cj4gLSBhZGQgbXRrIHByZWZpeCBmb3IgYWRzcCBpcGMgZnVuY3Rpb25zCj4g
LSByZW5hbWUgYWRzcF9tYm94X2NoX2luZm8gdG8gbXRrX2Fkc3BfbWJveF9jaF9pbmZvCj4gLSBy
ZW1vdmUgaW5jb3JyZWN0IHJldmlld2VycyBpbiBjb21taXQgbWVzc2FnZQo+IAo+IGNoYW5nZXMg
c2luY2UgdjY6Cj4gLSBkdC1iaW5kaW5nczogY2hhbmdlIGV4YW1wbGUgZHRzaSBub2RlLgo+IC0g
cmVuYW1lIGNvbmZpZyBNVEtfQURTUF9JUENfTUJPWCB0byBNVEtfQURTUF9NQk9YCj4gLSByZW1v
dmUgdW51c2VkIHZhcmlhYmxlCj4gLSBhZGQgcmV2aWV3ZXJzCj4gCj4gY2hhbmdlcyBzaW5jZSB2
NToKPiAtIHJlbW92ZSBzb21lIHJlZHVuZGFudCBjb2RlCj4gCj4gY2hhbmdlcyBzaW5jZSB2NDoK
PiAtIHVzZSBzd2l0Y2ggLi4uIGNhc2UgaW4gYWRzcF9pcGNfcmVjdgo+IC0gYWRkIGVycm9yIGhh
bmRsaW5nIHBhdGggZm9yIGNoYW5fbmFtZSBwb2ludGVyCj4gLSByZWZpbmUgc29tZSBjb2RlIHRv
IGJlIGNvbmNpc2UKPiAKPiBjaGFuZ2VzIHNpbmNlIHYzOgo+IC0gcmVvcmRlciBNVEtfQURTUF9J
UENfTUJPWCBjb25maWcKPiAtIHJlbW92ZSBzb21lIHJlZHVuZGFudCBjb2RlCj4gLSByZW1vdmUg
bG9jayBpbiBtdGstYWRzcC1tYWlsYm94Cj4gCj4gY2hhbmdlcyBzaW5jZSB2MjoKPiAtIHNlcGFy
YXRlIGFkc3BfbWFpbGJveCBpbnRvIHR3byBpbnN0YW5jZXMKPiAKPiBjaGFuZ2VzIHNpbmNlIHYx
Ogo+IC0gZml4IGR0X2JpbmRpbmdfY2hlY2sgZXJyb3IKPiAKPiAKPiBBbGxlbi1LSCBDaGVuZyAo
Myk6Cj4gICBkdC1iaW5kaW5nczogbWVkaWF0ZWs6IGFkZCBhZHNwLW1ib3ggZG9jdW1lbnQKPiAg
IGZpcm13YXJlOiBtZWRpYXRlazogYWRkIGFkc3AgaXBjIHByb3RvY29sIGludGVyZmFjZQo+ICAg
bWFpbGJveDogbWVkaWF0ZWs6IGFkZCBzdXBwb3J0IGZvciBhZHNwIG1haWxib3ggY29udHJvbGxl
cgo+IAo+ICAuLi4vYmluZGluZ3MvbWFpbGJveC9tdGssYWRzcC1tYm94LnlhbWwgICAgICAgfCAg
NTIgKysrKysrCj4gIGRyaXZlcnMvZmlybXdhcmUvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAg
ICB8ICAgMSArCj4gIGRyaXZlcnMvZmlybXdhcmUvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAg
ICB8ICAgMSArCj4gIGRyaXZlcnMvZmlybXdhcmUvbWVkaWF0ZWsvS2NvbmZpZyAgICAgICAgICAg
ICB8ICAgOSArCj4gIGRyaXZlcnMvZmlybXdhcmUvbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgICAg
ICB8ICAgMiArCj4gIGRyaXZlcnMvZmlybXdhcmUvbWVkaWF0ZWsvbXRrLWFkc3AtaXBjLmMgICAg
ICB8IDEzNSArKysrKysrKysrKysrKwo+ICBkcml2ZXJzL21haWxib3gvS2NvbmZpZyAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDcgKwo+ICBkcml2ZXJzL21haWxib3gvTWFrZWZpbGUgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDIgKwo+ICBkcml2ZXJzL21haWxib3gvbXRrLWFkc3AtbWFpbGJv
eC5jICAgICAgICAgICAgfCAxNzYKPiArKysrKysrKysrKysrKysrKysKPiAgLi4uL2xpbnV4L2Zp
cm13YXJlL21lZGlhdGVrL210ay1hZHNwLWlwYy5oICAgIHwgIDY1ICsrKysrKysKPiAgMTAgZmls
ZXMgY2hhbmdlZCwgNDUwIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0Cj4gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21haWxib3gvbXRrLGFkc3AtbWJveC55YW1s
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Zpcm13YXJlL21lZGlhdGVrL0tjb25maWcK
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZmlybXdhcmUvbWVkaWF0ZWsvTWFrZWZpbGUK
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZmlybXdhcmUvbWVkaWF0ZWsvbXRrLWFkc3At
aXBjLmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWFpbGJveC9tdGstYWRzcC1tYWls
Ym94LmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvZmlybXdhcmUvbWVkaWF0
ZWsvbXRrLWFkc3AtaXBjLmgKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
