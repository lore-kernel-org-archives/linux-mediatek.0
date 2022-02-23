Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C2AC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 13:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k1U13YMpSjDlu3YzndB2xklUq1o06Bx6iV33GzhfJlE=; b=fSOAoc2K2W2vMm
	jHS9wyx3OPl45m700VOs5S4EgTHnbq3R4Kj2Aaly/JQK5xebGjd4nLXvrfNEs2VL0RBP4BSDkL5tr
	C6mCZenNVl6H94LG4/Pm3Ikqoe7tNAbT04siAPiCeFrmbBwcpdEe3Zoz4nqECTwQMgdZ+4jUeb8IJ
	2b3iRr6hLTYMZQDxtLbhmbSm5Gzr4+c9CyPy2UmminfYwAX61dDvJ7wsKu4ALWETaSX5DvP3u5Htl
	qyRbMXWpVNM8XgSk3O8MZFa2Uw6d0GviQZpVDjVXDXy+vn/H0bg309Ft9LU5AjZ++BmgzeaHsFRs6
	iEYV8RXbsr2qnqe98Rww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMrZP-00ERi9-P1; Wed, 23 Feb 2022 13:20:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrTz-00EPTU-IV; Wed, 23 Feb 2022 13:15:05 +0000
X-UUID: 573e6ca5b0244ffeaa33a67fcb492de2-20220223
X-UUID: 573e6ca5b0244ffeaa33a67fcb492de2-20220223
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1687095151; Wed, 23 Feb 2022 06:14:56 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Feb 2022 05:14:55 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 23 Feb 2022 21:14:53 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Feb 2022 21:14:53 +0800
Message-ID: <af55a1009f43e02170c5bfbaa54e843728965961.camel@mediatek.com>
Subject: Re: [PATCH v2 21/23] arm64: dts: mt8192: Add dsi node
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, --to=Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Date: Wed, 23 Feb 2022 21:14:53 +0800
In-Reply-To: <20220222231635.33cupieckldkzgzn@notapiano>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-22-allen-kh.cheng@mediatek.com>
 <20220222231635.33cupieckldkzgzn@notapiano>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_051503_665465_01498FFB 
X-CRM114-Status: GOOD (  16.81  )
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

T24gVHVlLCAyMDIyLTAyLTIyIGF0IDE4OjE2IC0wNTAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToKPiBPbiBGcmksIEZlYiAxOCwgMjAyMiBhdCAwNToxNjozMVBNICswODAwLCBBbGxl
bi1LSCBDaGVuZyB3cm90ZToKPiA+IEFkZCBkc2kgbmRvZSBmb3IgbXQ4MTkyIFNvQy4KPiA+IAo+
ID4gU2lnbmVkLW9mZi1ieTogQWxsZW4tS0ggQ2hlbmcgPGFsbGVuLWtoLmNoZW5nQG1lZGlhdGVr
LmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0
c2kgfCAxMyArKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMo
KykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4
MTkyLmR0c2kKPiA+IGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQo+
ID4gaW5kZXggMDI2ZjJkODE0MWIwLi4xZjE1NTVmZDE4ZjUgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpCj4gPiArKysgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpCj4gPiBAQCAtMTM1MCw2ICsxMzUwLDE5IEBA
Cj4gPiAgCQkJY2xvY2tzID0gPCZtbXN5cyBDTEtfTU1fRElTUF9ESVRIRVIwPjsKPiA+ICAJCX07
Cj4gPiAgCj4gPiArCQlkc2kwOiBkc2lAMTQwMTAwMDAgewo+ID4gKwkJCWNvbXBhdGlibGUgPSAi
bWVkaWF0ZWssbXQ4MTgzLWRzaSI7Cj4gPiArCQkJcmVnID0gPDAgMHgxNDAxMDAwMCAwIDB4MTAw
MD47Cj4gPiArCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDI2NSBJUlFfVFlQRV9MRVZFTF9ISUdI
Cj4gPiAwPjsKPiA+ICsJCQltZWRpYXRlayxzeXNjb24tZHNpID0gPCZtbXN5cyAweDE0MD47Cj4g
PiArCQkJY2xvY2tzID0gPCZtbXN5cyBDTEtfTU1fRFNJMD4sCj4gPiArCQkJCTwmbW1zeXMgQ0xL
X01NX0RTSV9EU0kwPiwKPiA+ICsJCQkJPCZtaXBpX3R4MD47Cj4gCj4gUGxlYXNlIGZpeCB0aGUg
aW5kZW50YXRpb24uCgpISSBOw61jb2xhcywKSSB3aWxsIGZpeCB0aGlzIGluIG5leHQgdmVyc2lv
biwgVGhhbmtzLgoKPiAKPiA+ICsJCQljbG9jay1uYW1lcyA9ICJlbmdpbmUiLCAiZGlnaXRhbCIs
ICJocyI7Cj4gPiArCQkJcGh5cyA9IDwmbWlwaV90eDA+Owo+ID4gKwkJCXBoeS1uYW1lcyA9ICJk
cGh5IjsKPiA+ICsJCX07Cj4gPiArCj4gPiAgCQlvdmxfMmwyOiBvdmxAMTQwMTQwMDAgewo+ID4g
IAkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLWRpc3Atb3ZsLTJsIjsKPiA+ICAJCQly
ZWcgPSA8MCAweDE0MDE0MDAwIDAgMHgxMDAwPjsKPiA+IC0tIAo+ID4gMi4xOC4wCj4gPiAKPiA+
IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
