Return-Path: <SRS0=bzTf=AF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A8C5C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 18:13:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D21C206C0
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 18:13:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yzzx+30L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="eRPnkRW6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D21C206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c0SmifGDgzU6WG1MUSBr8mKwUfI3mJw/DvJDWC22SXw=; b=Yzzx+30LbqqlqD3pHi5iHzLDL
	ST1lOqN6psH4OrXgI0sRc9QTnqyBVr+3tUNL2ejsTSxSlOeUS/dSgFYnVPbGrPb9RiFwdcKD3yIDN
	0clk3jMrW5LMPOLGz81g4fenC45vxVxvaYpa+D+GVlQn5gB+gqKvTWFT1Q05bhnA9qYQ+qyypWAJG
	XZ7Eji0M0hwwbw9KQJfjPTTiBcb2cuIPwCtNh0QE5sFqJvwGyZmmcJQnDVkM7u0wHPJMRacOtTwr5
	9VEaSwv5FyDdvQXLStGYms2oSNUMm4Q8oR0g5GAIQfiTFSIgqZAkHzmN3Gy4D4t9ftaGBVKOxb8KQ
	oONfGxNDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jo9tB-0006zI-7n; Wed, 24 Jun 2020 18:12:49 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo9t3-0006uv-7s; Wed, 24 Jun 2020 18:12:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z9HGbz+i6aHgJQXofmlkGLhFMu6I+bLstfwl+Ma+zic=; b=eRPnkRW6qklePwWdOAxb9JwS5
 xS/ipXvEOLPqG4rxDeMRcG82RsrzUCvlxUPV++hqZSGvg7m+0koWn+/qWbczE3ftK5VXsUmEKeGD7
 AB4a32kvTcbax4HOssHxQyYT21aJhimITT46A8sQ2LC7hG84yuxXWn9jNSI6eTwGmdMKwomXVoasZ
 L1BT/ft/Ds3U2spVpTR7SaMQJOdFywAQMXo4f5ky4Nci1Q+2ddqgLQNHxftwk7EY1I1mfp3helzVV
 UiDmm24VR+g4qSeYdmWzmuiiKB8eO9juK17D9oUR/dD5JJU/ICdldi21DUhuKE/ryuuYT36s4gOYJ
 ONsOu6V1g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59252)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1jo9sn-0003SY-Gh; Wed, 24 Jun 2020 19:12:27 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1jo9sh-0002BU-2m; Wed, 24 Jun 2020 19:12:19 +0100
Date: Wed, 24 Jun 2020 19:12:19 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 14/15] net: phy: add PHY regulator support
Message-ID: <20200624181218.GC1551@shell.armlinux.org.uk>
References: <20200622093744.13685-1-brgl@bgdev.pl>
 <20200622093744.13685-15-brgl@bgdev.pl>
 <20200622132921.GI1551@shell.armlinux.org.uk>
 <CAMRc=Me1r3Mzfg3-gTsGk4rEtvB=P9ESkn9q=c7z0Q=YQDsw2A@mail.gmail.com>
 <20200623094252.GS1551@shell.armlinux.org.uk>
 <CAMpxmJVP9db-4-AA4e1JkEfrajvJ4s0T6zo5+oFzpJHRBcuSsg@mail.gmail.com>
 <20200623095646.GT1551@shell.armlinux.org.uk>
 <CAMRc=MeKE12sXZycyGA7vmjNai0JfDhRX+XDTp3r3YtrmLQj3A@mail.gmail.com>
 <20200624165719.GB1551@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624165719.GB1551@shell.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 devicetree <devicetree@vger.kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Frank Rowand <frowand.list@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 netdev <netdev@vger.kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Pedro Tsai <pedro.tsai@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdW4gMjQsIDIwMjAgYXQgMDU6NTc6MTlQTSArMDEwMCwgUnVzc2VsbCBLaW5nIC0g
QVJNIExpbnV4IGFkbWluIHdyb3RlOgo+IE9uIFR1ZSwgSnVuIDIzLCAyMDIwIGF0IDA2OjI3OjA2
UE0gKzAyMDAsIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gPiB3dC4sIDIzIGN6ZSAyMDIw
IG8gMTE6NTYgUnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4IGFkbWluCj4gPiA8bGludXhAYXJtbGlu
dXgub3JnLnVrPiBuYXBpc2HFgihhKToKPiA+ID4KPiA+ID4gT24gVHVlLCBKdW4gMjMsIDIwMjAg
YXQgMTE6NDY6MTVBTSArMDIwMCwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiA+ID4gPiB3
dC4sIDIzIGN6ZSAyMDIwIG8gMTE6NDMgUnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4IGFkbWluCj4g
PiA+ID4gPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gbmFwaXNhxYIoYSk6Cj4gPiA+ID4gPgo+ID4g
PiA+ID4gT24gVHVlLCBKdW4gMjMsIDIwMjAgYXQgMTE6NDE6MTFBTSArMDIwMCwgQmFydG9zeiBH
b2xhc3pld3NraSB3cm90ZToKPiA+ID4gPiA+ID4gcG9uLiwgMjIgY3plIDIwMjAgbyAxNToyOSBS
dXNzZWxsIEtpbmcgLSBBUk0gTGludXggYWRtaW4KPiA+ID4gPiA+ID4gPGxpbnV4QGFybWxpbnV4
Lm9yZy51az4gbmFwaXNhxYIoYSk6Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gW3NuaXAhXQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gVGhpcyBp
cyBsaWtlbHkgdG8gY2F1c2UgaXNzdWVzIGZvciBzb21lIFBIWSBkcml2ZXJzLiAgTm90ZSB0aGF0
IHdlIGhhdmUKPiA+ID4gPiA+ID4gPiBzb21lIFBIWSBkcml2ZXJzIHdoaWNoIHJlZ2lzdGVyIGEg
dGVtcGVyYXR1cmUgc2Vuc29yIGluIHRoZSBwcm9iZQo+ID4gPiA+ID4gPiA+IGZ1bmN0aW9uLCB3
aGljaCBtZWFucyB0aGV5IGNhbiBiZSBhY2Nlc3NlZCBpbmRlcGVuZGVudGx5IG9mIHRoZSBsaWZl
dGltZQo+ID4gPiA+ID4gPiA+IG9mIHRoZSBQSFkgYm91bmQgdG8gdGhlIG5ldHdvcmsgZHJpdmVy
ICh3aGljaCBtYXkgb25seSBiZSB3aGlsZSB0aGUKPiA+ID4gPiA+ID4gPiBuZXR3b3JrIGRldmlj
ZSBpcyAidXAiLikgIFdlIGNlcnRhaW5seSBkbyBub3Qgd2FudCBod21vbiBmYWlsaW5nIGp1c3QK
PiA+ID4gPiA+ID4gPiBiZWNhdXNlIHRoZSBuZXR3b3JrIGRldmljZSBpcyBkb3duLgo+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gVGhhdCdzIGtpbmQgb2Ygd29ya2VkIGFyb3VuZCBmb3IgdGhl
IHJlc2V0IHN0dWZmLCBiZWNhdXNlIHRoZXJlIGFyZSB0d28KPiA+ID4gPiA+ID4gPiBsYXllcnMg
dG8gdGhhdDogdGhlIG1kaW8gZGV2aWNlIGxheWVyIHJlc2V0IHN1cHBvcnQgd2hpY2gga25vd3Mg
bm90aGluZwo+ID4gPiA+ID4gPiA+IG9mIHRoZSBQSFkgYmluZGluZyBzdGF0ZSB0byB0aGUgbmV0
d29yayBkcml2ZXIsIGFuZCB0aGUgcGh5bGliIHJlc2V0Cj4gPiA+ID4gPiA+ID4gc3VwcG9ydCwg
YnV0IGl0IGlzIG5vdCBuaWNlLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
IFJlZ3VsYXRvcnMgYXJlIHJlZmVyZW5jZSBjb3VudGVkIHNvIGlmIHRoZSBod21vbiBkcml2ZXIg
ZW5hYmxlcyBpdAo+ID4gPiA+ID4gPiB1c2luZyBtZGlvX2RldmljZV9wb3dlcl9vbigpIGl0IHdp
bGwgc3RheSBvbiBldmVuIGFmdGVyIHRoZSBQSFkgZHJpdmVyCj4gPiA+ID4gPiA+IGNhbGxzIHBo
eV9kZXZpY2VfcG93ZXJfb2ZmKCksIHJpZ2h0PyBBbSBJIG1pc3Npbmcgc29tZXRoaW5nPwo+ID4g
PiA+ID4KPiA+ID4gPiA+IElmIHRoYXQgaXMgdHJ1ZSwgeW91IHdpbGwgbmVlZCB0byBhdWRpdCB0
aGUgUEhZIGRyaXZlcnMgdG8gYWRkIHRoYXQuCj4gPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gVGhp
cyBjaGFuZ2UgZG9lc24ndCBoYXZlIGFueSBlZmZlY3Qgb24gZGV2aWNlcyB3aGljaCBkb24ndCBo
YXZlIGEKPiA+ID4gPiByZWd1bGF0b3IgYXNzaWduZWQgaW4gRFQgdGhvdWdoLiBUaGUgb25lIEkn
bSBhZGRpbmcgaW4gdGhlIGxhc3QgcGF0Y2gKPiA+ID4gPiBpcyB0aGUgZmlyc3QgdG8gdXNlIHRo
aXMuCj4gPiA+Cj4gPiA+IEl0J3MgcXVhbGl0eSBvZiBpbXBsZW1lbnRhdGlvbi4KPiA+ID4KPiA+
ID4gU2hvdWxkIHdlIHdhaXQgZm9yIHNvbWVvbmUgZWxzZSB0byBtYWtlIHVzZSBvZiB0aGUgbmV3
IHJlZ3VsYXRvcgo+ID4gPiBzdXBwb3J0IHRoYXQgaGFzIGJlZW4gYWRkZWQgd2l0aCBhIFBIWSB0
aGF0IHVzZXMgaHdtb24sIGFuZCB0aGV5Cj4gPiA+IGRvbid0IHJlYWxpc2UgdGhhdCBpdCBicmVh
a3MgaHdtb24gb24gaXQsIGFuZCBzZXZlcmFsIGtlcm5lbCB2ZXJzaW9ucwo+ID4gPiBnbyBieSB3
aXRob3V0IGl0IGJlaW5nIG5vdGljZWQuICBJdCB3aWxsIG9ubHkgYmUgYSBub3RpY2FibGUgaXNz
dWUKPiA+ID4gd2hlbiB0aGUgYXNzb2NpYXRlZCBuZXR3b3JrIGRldmljZSBpcyBkb3duLCBhbmQg
dGhhdCBuZXR3b3JrIGRldmljZQo+ID4gPiBkcml2ZXIgZGV0YWNoZXMgZnJvbSB0aGUgUEhZLCBz
byBfaXNfIGxpa2VseSBub3QgdG8gYmUgbm90aWNlZC4KPiA+ID4KPiA+ID4gT3Igc2hvdWxkIHdl
IGRvIGEgc21hbGwgYW1vdW50IG9mIHdvcmsgbm93IHRvIHByb3Blcmx5IGltcGxlbWVudAo+ID4g
PiByZWd1bGF0b3Igc3VwcG9ydCwgd2hpY2ggaW5jbHVkZXMgYSB0cml2aWFsIGdyZXAgZm9yICJo
d21vbiIgYW1vbmdzdAo+ID4gPiB0aGUgUEhZIGRyaXZlcnMsIGFuZCBhZGQgdGhlIG5lY2Vzc2Fy
eSBjYWxsIHRvIGF2b2lkIHRoZSByZWd1bGF0b3IKPiA+ID4gYmVpbmcgc2h1dCBvZmYuCj4gPiA+
Cj4gPiAKPiA+IEknbSBub3Qgc3VyZSB3aGF0IHRoZSBjb3JyZWN0IGFwcHJvYWNoIGlzIGhlcmUu
IFByb3ZpZGUgc29tZSBoZWxwZXIKPiA+IHRoYXQsIHdoZW4gY2FsbGVkLCB3b3VsZCBpbmNyZWFz
ZSB0aGUgcmVndWxhdG9yJ3MgcmVmZXJlbmNlIGNvdW50IGV2ZW4KPiA+IG1vcmUgdG8ga2VlcCBp
dCBlbmFibGVkIGZyb20gdGhlIG1vbWVudCBod21vbiBpcyByZWdpc3RlcmVkIHRvIHdoZW4KPiA+
IHRoZSBkcml2ZXIgaXMgZGV0YWNoZWQ/Cj4gCj4gSSB0aGluayBhIFBIWSBkcml2ZXIgbmVlZHMg
dGhlIHV0aWxpdHkgdG8gY29udHJvbCB0aGlzLiAgV2UgbmVlZCB0byBiZQo+IGNhcmVmdWwgaGVy
ZSB3aXRoIG5hbWluZywgYmVjYXVzZSBwaHlsaWIgaXMgbm90IHRoZSBvbmx5IGNvZGUgaW4gdGhl
Cj4ga2VybmVsIHRoYXQgdXNlcyB0aGUgcGh5XyBwcmVmaXguCj4gCj4gSWYgd2UgaGFkIHJ1bnRp
bWUgUE0gc3VwcG9ydCBmb3IgUEhZcywgd2l0aCByZWd1bGF0b3Igc3VwcG9ydCBob29rZWQKPiBp
bnRvIHJ1bnRpbWUgUE0sIHRoZW4gd2UgYWxyZWFkeSBoYXZlIHN0YW5kYXJkIGludGVyZmFjZXMg
dGhhdCBkcml2ZXJzCj4gY2FuIHVzZSB0byBjb250cm9sIHdoZXRoZXIgdGhlIGRldmljZSBnZXRz
IHBvd2VyZWQgZG93bi4KCk90aGVyIGlkZWFzOgoKLSB1c2luZyBnZW5wZCBvdXRzaWRlIG9mIHRo
ZSBTb0MgdG8gcHJvdmlkZSBwb3dlciBkb21haW4gbWFuYWdlbWVudC4KICBUaGlzIGlzIGFscmVh
ZHkgaG9va2VkIGludG8gcnVudGltZSBQTSwgYnV0IHdvdWxkIG5lZWQgdGhlaXIKICBhZ3JlZW1l
bnQsIGEgZ2VucGQgcHJvdmlkZXIgd3JpdHRlbiwgYW5kIHJ1bnRpbWUgUE0gYWRkZWQgdG8gcGh5
bGliLgoKLSBpZiB3ZSdyZSBnb2luZyBmb3Igc29tZSBjb3JlIGRyaXZlciBtb2RlbCBhcHByb2Fj
aCwgdGhlbiB0aGUgZHJpdmVyCiAgbW9kZWwgb25seSBrbm93cyB3aGVuIGRldmljZXMgYXJlIGJv
dW5kIGFuZCB1bmJvdW5kIHRvIHRoZWlyIGRyaXZlciwKICBpdCBrbm93cyBub3RoaW5nIG9mIHBo
eWxpYidzIGF0dGFjaC9kZXRhY2ggZnJvbSB0aGUgbmV0d29yawogIGludGVyZmFjZS4gIElmIHdl
IHdhbnQgdG8gc2h1dCBvZmYgcG93ZXIgd2hlbiBhIFBIWSBpcyBub3QgYXR0YWNoZWQsCiAgd2Ug
d291bGQgbGlrZWx5IG5lZWQgc29tZSBraW5kIG9mIGludGVyZmFjZSB0byBkbyB0aGF0LgoKLS0g
ClJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgub3JnLnVrL2RldmVsb3Bl
ci9wYXRjaGVzLwpGVFRQIGlzIGhlcmUhIDQwTWJwcyBkb3duIDEwTWJwcyB1cC4gRGVjZW50IGNv
bm5lY3Rpdml0eSBhdCBsYXN0IQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
