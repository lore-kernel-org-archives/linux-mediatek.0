Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14281C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 09:56:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EBBD613B2
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 09:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EBBD613B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=vdorst.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Subject:Cc:To:
	From:Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5WFYS4QlDcLQ/JIL6XMB/McBJmdZc3ews148kdT+kHU=; b=NXiTUuwhgBDh0ReVxshffmngI
	70KMLCq/jnEAlqWNB0hPnnYwDaemx+6NR4B3Y+dqlR8wBW1iZtt+unqrNItYhdoTiTCT1UHJYNarN
	5nnnXJxEsMwHpEL1y3lAT7tlTTEJFKn6ce+SFGQlFvKF5oc3sFeS7e6Bg5+oZAjHGG4iaiL488XB1
	K/nwk9CnqfBv6F8IoeLrtWFhp3SLbPNc2hHTaL8uVcUvF+4jEoAsVw+3ZnD+YL4SRekXLsUYuJ0Y6
	JpzsyEydOrH2PnFcewlTdQ18hwMHaOHuXxE/o5eRAxZwHKMBXWVcH6JWPl86VSmXiTYoPSt4VGcL+
	V/ZDaGPrg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWFmI-008oB8-TA; Tue, 13 Apr 2021 09:56:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWFm7-008o8w-FO
 for linux-mediatek@desiato.infradead.org; Tue, 13 Apr 2021 09:56:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:In-Reply-To:References:Subject:Cc:To:From:
 Message-ID:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=sWQeaeOZs1zGfDyfM+Yma0gmKoH8b4gYtID9LwyyZ5w=; b=XCso3MDVzy09nvbyShKRj/HjI0
 mXsloCmktxPzMgJ60EGwc6oc/zh8rGH3odhB5iEQJuT5h/DJBH8gYyHlgAxKOLVT4wg4AkyjVHAIa
 nnDV2qivPCIp+IfYbDnXmrW5Ta1WAx7wIBaYTBFfW98kUoeOCmZjhtT4pxABh4n76qRGirKa93Kv7
 rx8hZiYuv35e5xh1yZ4AMoUYDH9Vp21d4eO2D313J6W4AeY/RhOBf2jMQc/lqbWOeuZat83XvfbE7
 uO6I+Ql+2X2LHyY+OY307i8pNqfG1uFYKQuiySaiGZPZZL0RmxZRnex+OrXTVX/P1IrBBxUm089za
 iwVggh+Q==;
Received: from mx.i2x.nl ([5.2.79.48])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lWFm3-006uFo-En
 for linux-mediatek@lists.infradead.org; Tue, 13 Apr 2021 09:56:01 +0000
Received: from mail.vdorst.com (mail.vdorst.com [IPv6:fd00::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx.i2x.nl (Postfix) with ESMTPS id 3CB085FBA8;
 Tue, 13 Apr 2021 11:55:47 +0200 (CEST)
Authentication-Results: mx.i2x.nl; dkim=pass (2048-bit key;
 secure) header.d=vdorst.com header.i=@vdorst.com header.b="Gghi4hES"; 
 dkim-atps=neutral
Received: from www (unknown [192.168.2.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id EDBE5BCBD82;
 Tue, 13 Apr 2021 11:55:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.vdorst.com EDBE5BCBD82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdorst.com;
 s=default; t=1618307747;
 bh=sWQeaeOZs1zGfDyfM+Yma0gmKoH8b4gYtID9LwyyZ5w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gghi4hEShLFgZnDXwuQW8jfIxh7MkxHmq+NZ0k2s+nND11zJt7k4G1H3UMRBbSPaD
 8J4TJrlKR08JzOITEUFD5YjM4pojAxuGYtzuGKdq6w5ZWzOqiGhsgKvJlPayJXmgc7
 0R343Hr8LuZBbSwqz95x5qGKYwtiSIlvw8pQ3lAl36oIOkYldIISeeHMwVz4w4kAI5
 9nAiWev+Ipuk1zFHDSqVmaatXUONC8fEE+Tc14M4+Wy6WyaklIpKTZCXLLRFxukSYe
 JwT3D1mxVmyaqSSScCNP6/pZMdOl4pKfTtOOhPskToPL6snJfFPMff7XOmFmRi0nWn
 9cEMPEdyhK96Q==
Received: from 48.79.2.5.in-addr.arpa (48.79.2.5.in-addr.arpa [5.2.79.48])
 by www.vdorst.com (Horde Framework) with HTTPS; Tue, 13 Apr 2021 09:55:46
 +0000
Date: Tue, 13 Apr 2021 09:55:46 +0000
Message-ID: <20210413095546.Horde.AlZ6EGgmo3WL6JXtMEAWgRh@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Landen Chao
 <Landen.Chao@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo
 <gch981213@gmail.com>, Frank Wunderlich <frank-w@public-files.de>, Thomas
 Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: Re: [RFC v4 net-next 1/4] net: phy: add MediaTek PHY driver
References: <20210412034237.2473017-1-dqfext@gmail.com>
 <20210412034237.2473017-2-dqfext@gmail.com>
 <20210412070449.Horde.wg9CWXW8V9o0P-heKYtQpVh@www.vdorst.com>
 <20210412150836.929610-1-dqfext@gmail.com>
 <20210413035920.1422364-1-dqfext@gmail.com>
In-Reply-To: <20210413035920.1422364-1-dqfext@gmail.com>
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_025559_666376_5D80D695 
X-CRM114-Status: GOOD (  25.64  )
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

UXVvdGluZyBERU5HIFFpbmdmYW5nIDxkcWZleHRAZ21haWwuY29tPjoKCj4gT24gTW9uLCBBcHIg
MTIsIDIwMjEgYXQgMTE6MDg6MzZQTSArMDgwMCwgREVORyBRaW5nZmFuZyB3cm90ZToKPj4gT24g
TW9uLCBBcHIgMTIsIDIwMjEgYXQgMDc6MDQ6NDlBTSArMDAwMCwgUmVuw6kgdmFuIERvcnN0IHdy
b3RlOgo+PiA+IEhpIFFpbmdmYW5nLAo+PiA+ID4gK3N0YXRpYyB2b2lkIG10a19waHlfY29uZmln
X2luaXQoc3RydWN0IHBoeV9kZXZpY2UgKnBoeWRldikKPj4gPiA+ICt7Cj4+ID4gPiArCS8qIERp
c2FibGUgRUVFICovCj4+ID4gPiArCXBoeV93cml0ZV9tbWQocGh5ZGV2LCBNRElPX01NRF9BTiwg
TURJT19BTl9FRUVfQURWLCAwKTsKPj4gPgo+PiA+IEZvciBteSBFRUUgcGF0Y2ggSSBjaGFuZ2Vk
IHRoaXMgbGluZSB0bzoKPj4gPgo+PiA+IGdlbnBoeV9jb25maWdfZWVlX2FkdmVydChwaHlkZXYp
Owo+PiA+Cj4+ID4gU28gUEhZIEVFRSBwYXJ0IGlzIHNldHVwIHByb3Blcmx5IGF0IGJvb3QsIGlu
c3RlYWQgZW5hYmxlIGl0IG1hbnVhbCB2aWEKPj4gPiBldGh0b29sLgo+PiA+IFRoaXMgZnVuY3Rp
b24gYWxzbyB0YWtlcyB0aGUgRFRTIHBhcmFtZXRlcnMgImVlZS1icm9rZW4teHh4eCIgaW4gIAo+
PiB0byBhY2NvdW50Cj4+ID4gd2hpbGUKPj4gPiBzZXR0aW5nLXVwIHRoZSBQSFkuCj4+Cj4+IFRo
YW5rcywgSSdtIG5vdyB0ZXN0aW5nIHdpdGggaXQuCj4KPiBIaSBSZW5lLAo+Cj4gV2l0aGluIDEy
IGhvdXJzLCBJIGdvdCBzb21lIHNwb250YW5lb3VzIGxpbmsgZG93bi91cHMgd2hlbiBFRUUgaXMg
ZW5hYmxlZDoKPgo+IFsxNjMzNC4yMzYyMzNdIG10NzUzMCBtZGlvLWJ1czoxZiB3YW46IExpbmsg
aXMgRG93bgo+IFsxNjMzNC4yNDEzNDBdIGJyLWxhbjogcG9ydCAzKHdhbikgZW50ZXJlZCBkaXNh
YmxlZCBzdGF0ZQo+IFsxNjMzNy4zNTU5ODhdIG10NzUzMCBtZGlvLWJ1czoxZiB3YW46IExpbmsg
aXMgVXAgLSAxR2Jwcy9GdWxsIC0gIAo+IGZsb3cgY29udHJvbCByeC90eAo+IFsxNjMzNy4zNjM0
NjhdIGJyLWxhbjogcG9ydCAzKHdhbikgZW50ZXJlZCBibG9ja2luZyBzdGF0ZQo+IFsxNjMzNy4z
Njg2MzhdIGJyLWxhbjogcG9ydCAzKHdhbikgZW50ZXJlZCBmb3J3YXJkaW5nIHN0YXRlCj4KPiBU
aGUgY2FibGUgaXMgYSAzMG0gQ2F0LjYgYW5kIG5ldmVyIGhhcyBzdWNoIGlzc3VlIHdoZW4gRUVF
IGlzIGRpc2FibGVkLgo+IFBlcmhhcHMgV0FLRVVQX1RJTUVfMTAwMC8xMDAgb3Igc29tZSBQSFkg
cmVnaXN0ZXJzIG5lZWQgdG8gYmUgZmluZS10dW5lZCwKPiBidXQgZm9yIG5vdyBJIHRoaW5rIGl0
IHNob3VsZCBiZSBkaXNhYmxlZCBieSBkZWZhdWx0LgoKSGkgUWluZ2ZhbmcsCgpQcm9ibGVtIGlz
IHRoYXQsIG1heSBiZSB0aGUgb3RoZXIgZGV2aWNlIG9uIHRoZSBvdGhlciBzaWRlLCBtYXkgaXMg
aXNzdWUuClNvIGl0IGlzIGhhcmQgdG8gdGVsbCB3aGljaCBkZXZpY2UgaXMgdGhlIGlzc3VlLgoK
CkkgaGF2ZSBhIGxvdyB0cmFmZmljIGFjY2VzcyBwb2ludCB3aXRoIDFtZXRlciBjYWJsZSBydW5u
aW5nIHRoZSAgCm9wZW53cnQgNS4xMCBrZXJuZWwgd2l0aCB0aGUgb3BlbndydCBFRUUgcGF0Y2gu
CkVFRSBpcyBhY3RpdmUgYW5kIHVwdGltZSB3aXRoIDE2ZGF5cyB3aXRob3V0IGFuIGlzc3VlLgpU
aGlzIHdhcyB3aXRoIHRoZSBvbGQgcGF0Y2ggd2hpY2ggY2xlYXJzIHRoZSBXQUtFVVBfVElNRV8x
MDAwLzEwMCB2YWx1ZXMuCgoKSSBjaGFuZ2VkIG15IGV0aGVybmV0IHNldHVwIHNvIHRoYXQgYWNj
ZXNzIHBvaW50IHN3aXRjaCBoYXMgbW9yZSAgCnRyYWZmaWMgYW5kIGxvbmdlciBjYWJsZSB+MTht
ZXRlcnMuCkkgYWxzbyB1cGdyYWRlZCB0aGUga2VybmVsIHRvIDUuMTAuMjggYW5kIGFkZGVkIHRo
ZSBFRUUgdjIgcGF0Y2guCkxldCdzIHNlZSB3aGF0IGhhcHBlbnMgZm9yIGEgbG9uZ2VyIHRpbWUg
YW5kIHdpdGggbW9yZSByZWFsIHdvcmxkIHRyYWZmaWMuCgpHcmVhdHMsCgpSZW7DqQo+Cj4+Cj4+
ID4KPj4gPiA+ICsKPj4gPiA+ICsJLyogRW5hYmxlIEhXIGF1dG8gZG93bnNoaWZ0ICovCj4+ID4g
PiArCXBoeV9tb2RpZnlfcGFnZWQocGh5ZGV2LCBNVEtfUEhZX1BBR0VfRVhURU5ERUQsIDB4MTQs
IDAsIEJJVCg0KSk7CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
