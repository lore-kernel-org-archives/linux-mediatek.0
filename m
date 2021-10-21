Return-Path: <SRS0=9f7n=PJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA73C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 15:59:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16CD26108E
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 15:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16CD26108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nqD5oRrzARqWg0SrIKskCskedIBDjPzqls3rEfyCgf0=; b=XqVGJBHyiYwjZd
	xOhnlq+/bhRZAOt9dSvgS19vRyuYJo7PywKw8z++rW71l/pc3VsFkxx2NSfxRLpILb9vJQOppfnbV
	GmxkgYHfmEiedGGDvZNQvMYz6tNi2pk4rLlRP5WNBoo3m3lK+yKHyV7BCbHBXA4knhBo0U4h47a9H
	XkI4T+oApVAMQpluB0lORSpIIh7mku4JyeTLSOk2FZ/aQMrQoLCR9TEd+YWTUaTA5zxT6iDvkJVIm
	w+ngOPQCPFnreu2Gfik67Ap1BW9ZyyaQepudj+H3LbkvMz4nsZsh7fMhnkrNUiL92eqaYdivViRnz
	uFt5DcddgZQ1LDxOBmzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdaTU-008Gqi-6Y; Thu, 21 Oct 2021 15:59:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdaTR-008GpM-8j; Thu, 21 Oct 2021 15:59:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 92059611F2;
 Thu, 21 Oct 2021 15:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634831960;
 bh=KPsjXWIvxRCwuDpa6Tvl31WU0C1Lqvs1IzWAmvt1LIM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XbjTRlbgoq1kwcCmsdjF6aOe2HMQK3qhZn4f6pwey2aCZwN/CceqGeZEd1NVVct/O
 kAtaIu0D2RzfDizb0fIaGV7yHSP7jJbkgt55srwlnfMkB82DUjcz0CJqbBsQUy4uWY
 IBoamL9aWl4OH1LwOg86ZcJBhBfrYJAu2hgznF4gLGRNWK5xVQ5rD6BityDTdeNgwS
 cRnb8Wpu7DVARlwxGUaTouRT4DDc4QAdUViv1b/jQiIFIHaDQG/uaFhrUhuqvsqihO
 mh/P73eh7rmz07vr2UZwwLI5zkWoGq4S3mbrF3PmKMvhKpfCLTXNCiUnOpogyL0ERX
 wqANqVprTGV4Q==
Received: by pali.im (Postfix)
 id 6EFCD85E; Thu, 21 Oct 2021 17:59:18 +0200 (CEST)
Date: Thu, 21 Oct 2021 17:59:18 +0200
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
Subject: Re: [PATCH v3 02/25] PCI: Set error response in config access
 defines when ops->read() fails
Message-ID: <20211021155918.kigwwylvdmsuyd3z@pali>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
 <56642edd0d6bf8a8e3d20b5fcc088fd6389b827f.1634825082.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56642edd0d6bf8a8e3d20b5fcc088fd6389b827f.1634825082.git.naveennaidu479@gmail.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_085921_380887_CD75FA0F 
X-CRM114-Status: GOOD (  19.18  )
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

T24gVGh1cnNkYXkgMjEgT2N0b2JlciAyMDIxIDIwOjM3OjI3IE5hdmVlbiBOYWlkdSB3cm90ZToK
PiBNYWtlIFBDSV9PUF9SRUFEIGFuZCBQQ0lfVVNFUl9SRUFEX0NPTkZJRyBzZXQgdGhlIGRhdGEg
dmFsdWUgd2l0aCBlcnJvcgo+IHJlc3BvbnNlICh+MCksIHdoZW4gdGhlIFBDSSBkZXZpY2UgcmVh
ZCBieSBhIGhvc3QgY29udHJvbGxlciBmYWlscy4KPiAKPiBUaGlzIGVuc3VyZXMgdGhhdCB0aGUg
Y29udHJvbGxlciBkcml2ZXJzIG5vIGxvbmdlciBuZWVkIHRvIGZhYnJpY2F0ZQo+ICh+MCkgdmFs
dWUgd2hlbiB0aGV5IGRldGVjdCBlcnJvci4gSXQgYWxzbyAgZ3VyYW50ZWVzIHRoYXQgdGhlIGVy
cm9yCj4gcmVzcG9uc2UgKH4wKSBpcyBhbHdheXMgc2V0IHdoZW4gdGhlIGNvbnRyb2xsZXIgZHJp
dmVycyBmYWlscyB0byByZWFkIGEKPiBjb25maWcgcmVnaXN0ZXIgZnJvbSBhIGRldmljZS4KPiAK
PiBUaGlzIG1ha2VzIGVycm9yIHJlc3BvbnNlIGZhYnJpY2F0aW9uIGNvbnNpc3RlbnQgYW5kIGhl
bHBzIGluIHJlbW92YWwgb2YKPiBhIGxvdCBvZiByZXBlYXRlZCBjb2RlLgo+IAo+IFN1Z2dlc3Rl
ZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiBSZXZpZXdlZC1ieTogUm9iIEhl
cnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBOYXZlZW4gTmFpZHUgPG5h
dmVlbm5haWR1NDc5QGdtYWlsLmNvbT4KClJldmlld2VkLWJ5OiBQYWxpIFJvaMOhciA8cGFsaUBr
ZXJuZWwub3JnPgoKPiAtLS0KPiAgZHJpdmVycy9wY2kvYWNjZXNzLmMgfCAxMCArKysrKysrKy0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2FjY2Vzcy5jIGIvZHJpdmVycy9wY2kvYWNjZXNzLmMK
PiBpbmRleCA0NjkzNTY5NWNmYjkuLjBmNzMyYmEyZjcxYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L3BjaS9hY2Nlc3MuYwo+ICsrKyBiL2RyaXZlcnMvcGNpL2FjY2Vzcy5jCj4gQEAgLTQyLDcgKzQy
LDEwIEBAIGludCBub2lubGluZSBwY2lfYnVzX3JlYWRfY29uZmlnXyMjc2l6ZSBcCj4gIAlpZiAo
UENJXyMjc2l6ZSMjX0JBRCkgcmV0dXJuIFBDSUJJT1NfQkFEX1JFR0lTVEVSX05VTUJFUjsJXAo+
ICAJcGNpX2xvY2tfY29uZmlnKGZsYWdzKTsJCQkJCQlcCj4gIAlyZXMgPSBidXMtPm9wcy0+cmVh
ZChidXMsIGRldmZuLCBwb3MsIGxlbiwgJmRhdGEpOwkJXAo+IC0JKnZhbHVlID0gKHR5cGUpZGF0
YTsJCQkJCQlcCj4gKwlpZiAocmVzKQkJCQkJCQlcCj4gKwkJU0VUX1BDSV9FUlJPUl9SRVNQT05T
RSh2YWx1ZSk7CQkJCVwKPiArCWVsc2UJCQkJCQkJCVwKPiArCQkqdmFsdWUgPSAodHlwZSlkYXRh
OwkJCQkJXAo+ICAJcGNpX3VubG9ja19jb25maWcoZmxhZ3MpOwkJCQkJXAo+ICAJcmV0dXJuIHJl
czsJCQkJCQkJXAo+ICB9Cj4gQEAgLTIyOCw3ICsyMzEsMTAgQEAgaW50IHBjaV91c2VyX3JlYWRf
Y29uZmlnXyMjc2l6ZQkJCQkJCVwKPiAgCXJldCA9IGRldi0+YnVzLT5vcHMtPnJlYWQoZGV2LT5i
dXMsIGRldi0+ZGV2Zm4sCQkJXAo+ICAJCQkJCXBvcywgc2l6ZW9mKHR5cGUpLCAmZGF0YSk7CVwK
PiAgCXJhd19zcGluX3VubG9ja19pcnEoJnBjaV9sb2NrKTsJCQkJXAo+IC0JKnZhbCA9ICh0eXBl
KWRhdGE7CQkJCQkJXAo+ICsJaWYgKHJldCkJCQkJCQkJXAo+ICsJCVNFVF9QQ0lfRVJST1JfUkVT
UE9OU0UodmFsKTsJCQkJXAo+ICsJZWxzZQkJCQkJCQkJXAo+ICsJCSp2YWwgPSAodHlwZSlkYXRh
OwkJCQkJXAo+ICAJcmV0dXJuIHBjaWJpb3NfZXJyX3RvX2Vycm5vKHJldCk7CQkJCVwKPiAgfQkJ
CQkJCQkJCVwKPiAgRVhQT1JUX1NZTUJPTF9HUEwocGNpX3VzZXJfcmVhZF9jb25maWdfIyNzaXpl
KTsKPiAtLSAKPiAyLjI1LjEKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
