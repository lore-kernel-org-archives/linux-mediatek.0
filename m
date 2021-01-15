Return-Path: <SRS0=P2Ib=GS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1CAC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jan 2021 07:33:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 848F3221FF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jan 2021 07:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 848F3221FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZhGFpTWKVWpvtO5DQj4wqlDK98v1CeDz1PXwsef1F3M=; b=oMH0lN9CaH9OiVYUD43lrWktL
	NNKNSCggSQoOkTz+/yFJHQ33cy5s9CnH+P7h/FObQrJI+UYitlmdcsHyARerx/J/9nTl3XDSOMC6D
	sz1WlecjHrmNDP9u+p54mb63C4TuDgLr75Ux5RWFQ2gTjDJWEDwhvoAAWL/FZ2hCoJibNbQRExloq
	4r3w2P/DzqEcmt+vmKgT2KN/39jg68B5zY1DJ9HVa4l7PZGjvcxixzi1CSJ5xPdZkmDuJB2+wA23a
	0o1lvCUv434AxvRaRPVuiXmKI6kMk7bj6tFqOx5trd7SECCcWb5R9tDFV1v8dYgWfGCjjpDnaOHUY
	XbZ0BoPHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0JbG-0001Q3-E3; Fri, 15 Jan 2021 07:32:50 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0JbC-0001PG-0u
 for linux-mediatek@lists.infradead.org; Fri, 15 Jan 2021 07:32:47 +0000
Received: by mail-wm1-x331.google.com with SMTP id u14so2548304wmq.4
 for <linux-mediatek@lists.infradead.org>; Thu, 14 Jan 2021 23:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Dg3fcenP6YIm0aYs5w4I6Adx/SFGTjlnu+FOvTsHu6s=;
 b=gxUveA9YGhNb2E0mZMUvTHI+xbr056FxLZgftfCZZGeNOF+yJ9kajtQExO+pdJR3qx
 BLnTtJDuM10lTPfSe/TNs/D6zWrnF+RDifagNGXkh9NzzEPnWLATnD41wIUUXTU3msTk
 Mq5Tkcpzrr9Y/X/lAsccBF2PsbSF/xuTcOOOXSl82oWcuDtlv73iVqwrlUF4P462WsPR
 w/UjHkhGsQJK0QC1WuIzsvDRmaanz15SvGJXwYOm7R/MSO4PtmnYA8Ix054Ghw5VnjW7
 74nqHDrKqAVyPcPhYjEAHt9B+qR2m+wBK6xmMz4DkHGOntE0rS6A6mbthBP1uMf2rFdk
 cOUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Dg3fcenP6YIm0aYs5w4I6Adx/SFGTjlnu+FOvTsHu6s=;
 b=ldJJYSvJkX5QhkbMIFWlAux5BmfplMuqJmDSJKOXHSKfv+vAykcK5F14ZfyashVGrO
 BJb8HG0OOEUWevI1kZF4FSlenVu4EM2wYo0sPHDPZvT/bSOKzfhqWGSoEyVUnYNJrbH0
 gFTB6X4bq0FwTJLItIGHVaEVot7gAVigiS95JD0o9mt1inCnUU8kNs9pbftqEOvjw+LX
 Dfi3JvMGbZ6PUmJIAGDsPVHWQ+xAGMBmqZzxGutq5WZVYjTvkKZ6WjdMOCnE77m5p1lW
 dq2NnwogzD3sGz+Xz54H/ycvKow+HQ7HqUaphcGXa4V0jmYn/mK/uKoS+6SpOyTLymJg
 RDhA==
X-Gm-Message-State: AOAM532DAdPuW9hN8gyR+1bGUXM1HZw45WeMZ/IaRuKLp3uuLim46LPs
 p9jSjkBDAU6uLp5i9S34YgHAvw==
X-Google-Smtp-Source: ABdhPJyDsyZ0WWe8TcdEBpHT5umYuSY/TkSm8W+40uVNy+0csJt6A1ZznlatODu7M7D5wl3RVsB1vQ==
X-Received: by 2002:a1c:df85:: with SMTP id w127mr7535799wmg.166.1610695964629; 
 Thu, 14 Jan 2021 23:32:44 -0800 (PST)
Received: from dell ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id w13sm13281029wrt.52.2021.01.14.23.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 23:32:43 -0800 (PST)
Date: Fri, 15 Jan 2021 07:32:41 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v7 04/11] mfd: mt6360: Combine mt6360 pmic/ldo resources
 into mt6360 regulator resources
Message-ID: <20210115073241.GC3975472@dell>
References: <1605177598-23501-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605177598-23501-5-git-send-email-gene.chen.richtek@gmail.com>
 <74b127eb-9a3c-20c9-5692-b00b982f4da3@gmail.com>
 <CAE+NS34qR9f2LOpvxTBDF4OR=Xq-SFP+uHdWe3dZ5x8xggS8kA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAE+NS34qR9f2LOpvxTBDF4OR=Xq-SFP+uHdWe3dZ5x8xggS8kA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_023246_410870_509562F7 
X-CRM114-Status: GOOD (  20.80  )
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
Cc: Gene Chen <gene_chen@richtek.com>, devicetree <devicetree@vger.kernel.org>,
 linux-pm@vger.kernel.org, sre@kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ChiYuan Huang <cy_huang@richtek.com>, benjamin.chao@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wilma.Wu@mediatek.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxNSBKYW4gMjAyMSwgR2VuZSBDaGVuIHdyb3RlOgoKPiBNYXR0aGlhcyBCcnVnZ2Vy
IDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPiDmlrwgMjAyMeW5tDHmnIgxMuaXpSDpgLHkuowg5LiL
5Y2IODozMuWvq+mBk++8mgo+ID4KPiA+Cj4gPgo+ID4gT24gMTIvMTEvMjAyMCAxMTozOSwgR2Vu
ZSBDaGVuIHdyb3RlOgo+ID4gPiBGcm9tOiBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNodGVrLmNv
bT4KPiA+ID4KPiA+ID4gQ29tYmluZSBtdDYzNjAgcG1pYy9sZG8gcmVzb3VyY2VzIGludG8gbXQ2
MzYwIHJlZ3VsYXRvciByZXNvdXJjZXMKPiA+ID4gdG8gc2ltcGxpZnkgdGhlIHNpbWlsYXIgcmVz
b3VyY2VzIG9iamVjdC4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogR2VuZSBDaGVuIDxnZW5l
X2NoZW5AcmljaHRlay5jb20+Cj4gPiA+IEFja2VkLWZvci1NRkQtYnk6IExlZSBKb25lcyA8bGVl
LmpvbmVzQGxpbmFyby5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9tZmQvbXQ2MzYwLWNv
cmUuYyB8IDExICsrKy0tLS0tLS0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCA4IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQv
bXQ2MzYwLWNvcmUuYyBiL2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMKPiA+ID4gaW5kZXggNjky
ZTQ3Yi4uNTExOWU1MSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUu
Ywo+ID4gPiArKysgYi9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jCj4gPiA+IEBAIC0yNjUsNyAr
MjY1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCByZXNvdXJjZSBtdDYzNjBfbGVkX3Jlc291cmNl
c1tdID0gewo+ID4gPiAgICAgICBERUZJTkVfUkVTX0lSUV9OQU1FRChNVDYzNjBfRkxFRDFfU1RS
Ql9UT19FVlQsICJmbGVkMV9zdHJiX3RvX2V2dCIpLAo+ID4gPiAgfTsKPiA+ID4KPiA+ID4gLXN0
YXRpYyBjb25zdCBzdHJ1Y3QgcmVzb3VyY2UgbXQ2MzYwX3BtaWNfcmVzb3VyY2VzW10gPSB7Cj4g
PiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJlc291cmNlIG10NjM2MF9yZWd1bGF0b3JfcmVzb3Vy
Y2VzW10gPSB7Cj4gPiA+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9CVUNLMV9Q
R0JfRVZULCAiYnVjazFfcGdiX2V2dCIpLAo+ID4gPiAgICAgICBERUZJTkVfUkVTX0lSUV9OQU1F
RChNVDYzNjBfQlVDSzFfT0NfRVZULCAiYnVjazFfb2NfZXZ0IiksCj4gPiA+ICAgICAgIERFRklO
RV9SRVNfSVJRX05BTUVEKE1UNjM2MF9CVUNLMV9PVl9FVlQsICJidWNrMV9vdl9ldnQiKSwKPiA+
ID4gQEAgLTI3OCw5ICsyNzgsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJlc291cmNlIG10NjM2
MF9wbWljX3Jlc291cmNlc1tdID0gewo+ID4gPiAgICAgICBERUZJTkVfUkVTX0lSUV9OQU1FRChN
VDYzNjBfTERPN19PQ19FVlQsICJsZG83X29jX2V2dCIpLAo+ID4gPiAgICAgICBERUZJTkVfUkVT
X0lSUV9OQU1FRChNVDYzNjBfTERPNl9QR0JfRVZULCAibGRvNl9wZ2JfZXZ0IiksCj4gPiA+ICAg
ICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9MRE83X1BHQl9FVlQsICJsZG83X3BnYl9l
dnQiKSwKPiA+ID4gLX07Cj4gPiA+IC0KPiA+ID4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVzb3Vy
Y2UgbXQ2MzYwX2xkb19yZXNvdXJjZXNbXSA9IHsKPiA+ID4gICAgICAgREVGSU5FX1JFU19JUlFf
TkFNRUQoTVQ2MzYwX0xETzFfT0NfRVZULCAibGRvMV9vY19ldnQiKSwKPiA+ID4gICAgICAgREVG
SU5FX1JFU19JUlFfTkFNRUQoTVQ2MzYwX0xETzJfT0NfRVZULCAibGRvMl9vY19ldnQiKSwKPiA+
ID4gICAgICAgREVGSU5FX1JFU19JUlFfTkFNRUQoTVQ2MzYwX0xETzNfT0NfRVZULCAibGRvM19v
Y19ldnQiKSwKPiA+ID4gQEAgLTI5OCwxMCArMjk1LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBt
ZmRfY2VsbCBtdDYzNjBfZGV2c1tdID0gewo+ID4gPiAgICAgICAgICAgICAgICAgICBOVUxMLCAw
LCAwLCAibWVkaWF0ZWssbXQ2MzYwLWNoZyIpLAo+ID4gPiAgICAgICBPRl9NRkRfQ0VMTCgibXQ2
MzYwLWxlZCIsIG10NjM2MF9sZWRfcmVzb3VyY2VzLAo+ID4gPiAgICAgICAgICAgICAgICAgICBO
VUxMLCAwLCAwLCAibWVkaWF0ZWssbXQ2MzYwLWxlZCIpLAo+ID4gPiAtICAgICBPRl9NRkRfQ0VM
TCgibXQ2MzYwLXBtaWMiLCBtdDYzNjBfcG1pY19yZXNvdXJjZXMsCj4gPiA+IC0gICAgICAgICAg
ICAgICAgIE5VTEwsIDAsIDAsICJtZWRpYXRlayxtdDYzNjAtcG1pYyIpLAo+ID4gPiAtICAgICBP
Rl9NRkRfQ0VMTCgibXQ2MzYwLWxkbyIsIG10NjM2MF9sZG9fcmVzb3VyY2VzLAo+ID4gPiAtICAg
ICAgICAgICAgICAgICBOVUxMLCAwLCAwLCAibWVkaWF0ZWssbXQ2MzYwLWxkbyIpLAo+ID4gPiAr
ICAgICBPRl9NRkRfQ0VMTCgibXQ2MzYwLXJlZ3VsYXRvciIsIG10NjM2MF9yZWd1bGF0b3JfcmVz
b3VyY2VzLAo+ID4gPiArICAgICAgICAgICAgICAgICBOVUxMLCAwLCAwLCAibWVkaWF0ZWssbXQ2
MzYwLXJlZ3VsYXRvciIpLAo+ID4KPiA+IEFzIGRpc2N1c3NlZCB3aXRoIHRoZSBNRkQgbWFpbnRh
aW5lciBbMV0sIHRoZSByZWd1bGF0b3IgKGFuZCBwcm9iYWJseSBhbGwgY2VsbHMpCj4gPiBzaG91
bGRuJ3QgaGF2ZSBhIERUIGJpbmRpbmcuCj4gPgo+ID4gU28gcGxlYXNlIHNlbmQgYSBuZXcgdmVy
c2lvbiB3aGljaCBmaXhlcyB0aGF0Lgo+ID4KPiA+IFJlZ2FyZHMsCj4gPiBNYXR0aGlhcwo+ID4K
PiA+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYXRlay8yMDIxMDExMTE2
NDExOC5HRTQ3MjhAc2lyZW5hLm9yZy51ay8KCkkgZG9uJ3QgdGhpbmsgTWFyayBpcyBjb3JyZWN0
IGhlcmUuCgpXZSB1c3VhbGx5IGRvIGltcGxlbWVudCBjb21wYXRpYmxlIHN0cmluZ3MgZm9yIHN1
Yi1kZXZpY2VzIGFuZCB0aGV5IGRvCnRlbmQgdG8gaGF2ZSB0aGVpciBvd24gZGV2aWNlIG5vZGVz
LgoKSXQncyBhIHZlcnkgbG9uZyB0aW1lIGFnbyBzaW5jZSBJIGNvZGVkIHRoaXMgdXAgbXlzZWxm
LCBidXQgZnJvbQptZW1vcnksIHlvdSBjYW4ndCBoYXZlIDIgZGV2aWNlcyBzaGFyZSBhIGNvbXBh
dGlibGUgc3RyaW5nLgoKPiBTaG91bGQgSSB1c2UgcGFyZW50J3MgZGV2aWNlIHRvIGZpbmQgc3Vi
LWRldmljZXMgb2Zfbm9kZSBpZiB3aXRob3V0Cj4gY29tcGF0aWJsZSBuYW1lPwo+IEkgdHJhY2Ug
dGhlIGZ1bmN0aW9uIG1mZF9hZGRfZGV2aWNlLAo+IAo+IGlmIChJU19FTkFCTEVEKENPTkZJR19P
RikgJiYgcGFyZW50LT5vZl9ub2RlICYmIGNlbGwtPm9mX2NvbXBhdGlibGUpIHsKPiAgICAgLi4u
Li4KPiAgICAgcmV0ID0gbWZkX21hdGNoX29mX25vZGVfdG9fZGV2KHBkZXYsIG5wLCBjZWxsKTsK
PiAgICAgLi4uLi4KPiB9Cj4gCj4gd2hpY2ggaXMgYmluZGluZyBtZmQgc3ViLWRldmljZSB3aXRo
IGNvbXBhdGlibGUuIERvZXMgaXQgYmUgcmVtb3ZlZCBpbgo+IHRoZSBmZWF0dXJlPwo+IAo+ID4g
PiAgICAgICBPRl9NRkRfQ0VMTCgibXQ2MzYwLXRjcGMiLCBOVUxMLAo+ID4gPiAgICAgICAgICAg
ICAgICAgICBOVUxMLCAwLCAwLCAibWVkaWF0ZWssbXQ2MzYwLXRjcGMiKSwKPiA+ID4gIH07Cj4g
PiA+CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERl
dmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3Ig
QXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
