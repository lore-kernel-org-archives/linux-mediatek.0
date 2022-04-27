Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0B6C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 09:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=krlWSqzdmVLg/RXeCwCkZB1ELW/rjukyiuGR59jYQz0=; b=YswGtRBubpRUDd
	qKRvhPK6abg4TNQSdds3dd8fwCVNJZsMChsABMcp5dG8A55aqlTgCi1eBeLrizLPHi13krWaXd1B/
	hqW80oTPg9MSM9o3mVfQanMgvC8a6giU9pOPCRnwFXP1t4fEuIha1HJiOaGV3+s43FGenm7PcgsWi
	aEzulxcbB2qCIR3jiWhUHyPyyk/uFN8n6bYWfLrchH3fHq9PcAWXE/SsSg84cIExudgLf4aVghNjO
	cWG1J4sVCJQK7DZlK+QnSsPABuaEQAVAumGAjufpElgb767P/L4GP+WTqYxnOHNI6KLsBVQmYnydc
	BBjANVlEeiptRjBWmdXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njdgd-000fLn-JA; Wed, 27 Apr 2022 09:10:15 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njdfp-000esI-9z; Wed, 27 Apr 2022 09:09:27 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1njdfk-0000Hv-00; Wed, 27 Apr 2022 11:09:20 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
 id E3A75C01C7; Wed, 27 Apr 2022 10:59:14 +0200 (CEST)
Date: Wed, 27 Apr 2022 10:59:14 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mips: dts: ralink: mt7621: add mdio label to
 mdio-bus
Message-ID: <20220427085914.GA8404@alpha.franken.de>
References: <20220411112049.18001-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220411112049.18001-1-arinc.unal@arinc9.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_020925_534708_DBE2274F 
X-CRM114-Status: GOOD (  13.89  )
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

T24gTW9uLCBBcHIgMTEsIDIwMjIgYXQgMDI6MjA6NDdQTSArMDMwMCwgQXLEsW7DpyDDnE5BTCB3
cm90ZToKPiBBZGQgbWRpbyBsYWJlbCB0byB0aGUgbWRpby1idXMgbm9kZSB0byBlYXNpbHkgcmVm
ZXIgdG8gaXQuCj4gCj4gVXNlIHRoZSBuZXdseSBjcmVhdGVkIGxhYmVsIG9uIHRoZSBHQi1QQzIg
ZGV2aWNldHJlZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBcsSxbsOnIMOcTkFMIDxhcmluYy51bmFs
QGFyaW5jOS5jb20+Cj4gUmV2aWV3ZWQtYnk6IFNlcmdpbyBQYXJhY3VlbGxvcyA8c2VyZ2lvLnBh
cmFjdWVsbG9zQGdtYWlsLmNvbT4KPiAtLS0KPiB2MjogYWRkICJyYWxpbms6IiB0byB0aGUgY29t
bWl0IHN1bW1hcnkKPiAKPiAtLS0KPiAgLi4uL2Jvb3QvZHRzL3JhbGluay9tdDc2MjEtZ251YmVl
LWdiLXBjMi5kdHMgICB8IDE4ICsrKysrKysrLS0tLS0tLS0tLQo+ICBhcmNoL21pcHMvYm9vdC9k
dHMvcmFsaW5rL210NzYyMS5kdHNpICAgICAgICAgIHwgIDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2Vk
LCA5IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKc2VyaWVzIGFwcGxpZWQgdG8gbWlw
cy1uZXh0LgoKVGhvbWFzLgoKLS0gCkNyYXAgY2FuIHdvcmsuIEdpdmVuIGVub3VnaCB0aHJ1c3Qg
cGlncyB3aWxsIGZseSwgYnV0IGl0J3Mgbm90IG5lY2Vzc2FyaWx5IGEKZ29vZCBpZGVhLiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsgUkZDMTkyNSwgMi4z
IF0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
