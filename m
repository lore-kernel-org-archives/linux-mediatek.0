Return-Path: <SRS0=9f7n=PJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B2EC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 16:08:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57B8160FC0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 16:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 57B8160FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RlVLP/yUN5lSF64acNDY9Bslt79GN1KutqwzxT7bZTw=; b=jnM5jSNVZEnO1V
	APBHe8U7GQ8PHPR+E1/VGeizRhJqM7kbgqyJurV7UIZEg2RIgn9dYgblyWt+xfbSp0lZ6/8mJsliD
	ZGJ9qhMzv6TOH33WblL/IK/8SWCz1yWE58Zvr54wSXJTVlxSLECIL8lMwzM6j2y44ZzRArEMamKjP
	Xef0BvyxQAd3StBzaGWBvx4LIBWv43ePAOYBwG0Ma10FLqoBD2CbvTJjBKhjjfpoa64/KQX5V0DIe
	rdfkiiWlZlGbyF1i9KbkeO8um06LBoSU3pIw2zXO7ye0mqAM4Xe70uRfdwdNyAtlywD+WAwYvYdAj
	4jkiZ87VHzbQQDymcoVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdacW-008Iob-Tp; Thu, 21 Oct 2021 16:08:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdacT-008InG-Rk; Thu, 21 Oct 2021 16:08:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1AEFD611CB;
 Thu, 21 Oct 2021 16:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634832521;
 bh=3wcwNbtDNknQedZoy24cZfK1CiOqshIYIk3e2c4B9Rw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XWhJ08GGIqTZw+TvT/nMCDAy7quf2FJv33jj0Ily06vxkI8rUxTQELDkeHb0u+NFl
 MD0Lx9+x7lhMM3GIAZfA1T2u0eNmQAG1bqpXTvz67evSI6p28cRymuvwfzx0MmCdPZ
 Eu9kyx0IRx+BQHrjfg6pUkXIBKHVfUT3rJ6PyHjkKsGXSiMQ2s0MWrlq5f/6WPUXfA
 12KC4ZTUvETH0cKn32kcKsPv7RGUIftWATLF8XYn+cHxWi3nvl7PC2jb98L+8EJMFN
 xtCzC0AmpDoL2r37xWXDC3EUt/EyyEmL8iLEASXb2kkCdjx5XS/xqqOzJAGW3sGtIs
 FzUF2rqmMe78Q==
Received: by pali.im (Postfix)
 id D8DB085E; Thu, 21 Oct 2021 18:08:38 +0200 (CEST)
Date: Thu, 21 Oct 2021 18:08:38 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Cc: bhelgaas@google.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
 skhan@linuxfoundation.org, Robert Richter <rric@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 "maintainer:BROADCOM IPROC ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>, 
 Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Shawn Guo <shawn.guo@linaro.org>, Xiaowei Song <songxiaowei@hisilicon.com>,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Joyce Ooi <joyce.ooi@intel.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Nirmal Patel <nirmal.patel@linux.intel.com>,
 Jonathan Derrick <jonathan.derrick@linux.dev>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>, Amey Narkhede <ameynarkhede03@gmail.com>,
 Russell Currey <ruscur@russell.cc>, Oliver O'Halloran <oohall@gmail.com>,
 Sean V Kelley <sean.v.kelley@intel.com>,
 Qiuxu Zhuo <qiuxu.zhuo@intel.com>, Marc Zyngier <maz@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 Toan Le <toan@os.amperecomputing.com>
Subject: Re: [PATCH v3 01/25] PCI: Add PCI_ERROR_RESPONSE and it's related
 definitions
Message-ID: <20211021160838.r7t7fmmeseaecfac@pali>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
 <f7960a4dee0e417eedd7d2e031d04ac9016c6686.1634825082.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f7960a4dee0e417eedd7d2e031d04ac9016c6686.1634825082.git.naveennaidu479@gmail.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_090841_964582_5996BEF2 
X-CRM114-Status: GOOD (  19.33  )
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

T24gVGh1cnNkYXkgMjEgT2N0b2JlciAyMDIxIDIwOjM3OjI2IE5hdmVlbiBOYWlkdSB3cm90ZToK
PiBBbiBNTUlPIHJlYWQgZnJvbSBhIFBDSSBkZXZpY2UgdGhhdCBkb2Vzbid0IGV4aXN0IG9yIGRv
ZXNuJ3QgcmVzcG9uZAo+IGNhdXNlcyBhIFBDSSBlcnJvci4gIFRoZXJlJ3Mgbm8gcmVhbCBkYXRh
IHRvIHJldHVybiB0byBzYXRpc2Z5IHRoZQo+IENQVSByZWFkLCBzbyBtb3N0IGhhcmR3YXJlIGZh
YnJpY2F0ZXMgfjAgZGF0YS4KPiAKPiBBZGQgYSBQQ0lfRVJST1JfUkVTUE9OU0UgZGVmaW5pdGlv
biBmb3IgdGhhdCBhbmQgdXNlIGl0IHdoZXJlCj4gYXBwcm9wcmlhdGUgdG8gbWFrZSB0aGVzZSBj
aGVja3MgY29uc2lzdGVudCBhbmQgZWFzaWVyIHRvIGZpbmQuCj4gCj4gQWxzbyBhZGQgaGVscGVy
IGRlZmluaXRpb25zIFNFVF9QQ0lfRVJST1JfUkVTUE9OU0UgYW5kCj4gUkVTUE9OU0VfSVNfUENJ
X0VSUk9SIHRvIG1ha2UgdGhlIGNvZGUgbW9yZSByZWFkYWJsZS4KPiAKPiBTdWdnZXN0ZWQtYnk6
IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTmF2
ZWVuIE5haWR1IDxuYXZlZW5uYWlkdTQ3OUBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogUGFsaSBS
b2jDoXIgPHBhbGlAa2VybmVsLm9yZz4KCj4gLS0tCj4gIGluY2x1ZGUvbGludXgvcGNpLmggfCA5
ICsrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvcGNpLmggYi9pbmNsdWRlL2xpbnV4L3BjaS5oCj4gaW5kZXgg
Y2Q4YWE2ZmNlMjA0Li42ODljODI3N2M1ODQgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9w
Y2kuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvcGNpLmgKPiBAQCAtMTU0LDYgKzE1NCwxNSBAQCBl
bnVtIHBjaV9pbnRlcnJ1cHRfcGluIHsKPiAgLyogVGhlIG51bWJlciBvZiBsZWdhY3kgUENJIElO
VHggaW50ZXJydXB0cyAqLwo+ICAjZGVmaW5lIFBDSV9OVU1fSU5UWAk0Cj4gIAo+ICsvKgo+ICsg
KiBSZWFkaW5nIGZyb20gYSBkZXZpY2UgdGhhdCBkb2Vzbid0IHJlc3BvbmQgdHlwaWNhbGx5IHJl
dHVybnMgfjAuICBBCj4gKyAqIHN1Y2Nlc3NmdWwgcmVhZCBmcm9tIGEgZGV2aWNlIG1heSBhbHNv
IHJldHVybiB+MCwgc28geW91IG5lZWQgYWRkaXRpb25hbAo+ICsgKiBpbmZvcm1hdGlvbiB0byBy
ZWxpYWJseSBpZGVudGlmeSBlcnJvcnMuCj4gKyAqLwo+ICsjZGVmaW5lIFBDSV9FUlJPUl9SRVNQ
T05TRSAgICAgKH4wVUxMKQo+ICsjZGVmaW5lIFNFVF9QQ0lfRVJST1JfUkVTUE9OU0UodmFsKSAg
ICAoKih2YWwpID0gKCh0eXBlb2YoKih2YWwpKSkgUENJX0VSUk9SX1JFU1BPTlNFKSkKPiArI2Rl
ZmluZSBSRVNQT05TRV9JU19QQ0lfRVJST1IodmFsKSAoKHZhbCkgPT0gKCh0eXBlb2YodmFsKSkg
UENJX0VSUk9SX1JFU1BPTlNFKSkKPiArCj4gIC8qCj4gICAqIHBjaV9wb3dlcl90IHZhbHVlcyBt
dXN0IG1hdGNoIHRoZSBiaXRzIGluIHRoZSBDYXBhYmlsaXRpZXMgUE1FX1N1cHBvcnQKPiAgICog
YW5kIENvbnRyb2wvU3RhdHVzIFBvd2VyU3RhdGUgZmllbGRzIGluIHRoZSBQb3dlciBNYW5hZ2Vt
ZW50IGNhcGFiaWxpdHkuCj4gLS0gCj4gMi4yNS4xCj4gCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
