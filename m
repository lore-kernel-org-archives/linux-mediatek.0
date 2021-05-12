Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C726C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 06:25:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C24DE6192B
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 06:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C24DE6192B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Oq9N014pVMpa0QTtj1y81apxNeDpfOuzkKQ6/S5oOA4=; b=mePWpAwAGW9TqE+GIcNqMFOO1
	CbF4i/r1ytRkaXQcbXQZBdeHHfgNbHPQ5+87Qjh/JfiIpVxP0Hn2eund81pwIX/2GOcFlWUl/nq4g
	EIXnVxl97kNlh0DgUPOoHJPG+LXHw9CtZu+jKtPI7xLz8J/8Gx4W6Vw+YjNykRGF/uCPsOWeLPc1D
	5YF8CfNOm0Wff1E/pehAaSgwNyqMwlQ8xF0uapwdsrNE9kjCX7BAqgnUb96id0RvIqPngC3yz89FO
	K8Uc4w+kQonz0HUv5BixT8NgwJ1KWxJOHpuHCm7rCBDFCLl99o3/VLc7pb6Cfzs0jGouj/7vHE0AC
	aUXGH8vLw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgiId-0028wK-0F; Wed, 12 May 2021 06:24:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgiIR-0028ua-F7
 for linux-mediatek@desiato.infradead.org; Wed, 12 May 2021 06:24:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=t7gDJaqgoZsHb6DiIXvZKpSg+LB+FrrnWDOpfg5m9L8=; b=hnjAs4Tq0LSBJ21OQ8h1HRlybg
 7Lrp1ZCF3bpnSW4Xmk+ChONbF9WXKc1MM+MSFTlckl5mW3WpG2L5CrYreRq2eEMI/+CCLNw30mIis
 0Lq2MXVAoxH4CRf0qCi/L+ucw2xH8KJw03YvzderSUp+U2J4+GuGgKIHJx41tMHEhM/QgpCbJreA+
 xRqYzCJ+BidYkmpLVdTABTIic8CAcDAAc6LLQOFlFrUr72FCGUxI5XEOLnfur2ZGLk6jfQQbzs8z8
 YaCAQZSIKtBnQk+gRUEZ/i6SPul8VW7RfBW0zlgwR58AWIzp2j6ayTzVFBq9K+8wOjQvb99tQAXIi
 +c5IpdyA==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgiIO-00A969-Fi
 for linux-mediatek@lists.infradead.org; Wed, 12 May 2021 06:24:38 +0000
Received: by mail-wr1-x430.google.com with SMTP id m9so22386410wrx.3
 for <linux-mediatek@lists.infradead.org>; Tue, 11 May 2021 23:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=t7gDJaqgoZsHb6DiIXvZKpSg+LB+FrrnWDOpfg5m9L8=;
 b=WO34k/7Bk2+xQd/jUD6S9ebWfCkyB6ieU4Ksl96o0Jdyk/ZifZVp+9xmgXEFZAvFDL
 DRyFrzDiZliI6/m1dDyzahGZxG/N1wOPkEEm7p6OXE2u6lJRGWKQxhlGNQFFTb9s7tjO
 hu2jvDjE93nyvARnR+BTfs6ROwqkhuCsu+SwEBiH1TaUvvibri4tk0deYUVsP8w8Vuyq
 8yWmrSq3uBnW5DOA7CE2BGExecvSagvWHNpKvjE+980YXT3zPKQqNgtjsGXhNjsENAHb
 uC2VECmmSHdTnO9fdeeU3znOI/8PmOZ6sUUvOhox4smOi9sqfKRtSOZJcGOOIEN0OrIT
 j++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=t7gDJaqgoZsHb6DiIXvZKpSg+LB+FrrnWDOpfg5m9L8=;
 b=VqTIhClaoWi5ZWKH+eNnd4EVXUbg2NHA00HrTSQZFzC2lBbv1boN/K/Q0jA6mL6AcN
 tAVSlAPEJk/G2xEhKxmwSsp6k23LmQgiU0bqI/ha3zqRWtFmsl4P/52rBQ9xCORnKf3N
 f3xVgqkYPtcAuKfpx2DbC40qPDICZ4rBI63+EpS3wBWWcRytjhX49p5fWxMugeIPCd+S
 BEDApKlRjua5ThO6jv31kX/JENB5sHHPYn8yCmpdcRXUleVrvPjVvdgcPfLu3eNM7c0z
 YwfU5f1IUCng12Ijopw8d2VLFNS5c97IAOlgjmt9T2vWtQbVvEBJSG/3Q3Z0I0BHod1s
 FeFw==
X-Gm-Message-State: AOAM531vV8Z/Vnm2O/YTr6xpefXk4l0vofTMsw12VutB4Wpf6tqNehBH
 NYjTjkBmKRCb5UZuR5RiG6wVUg==
X-Google-Smtp-Source: ABdhPJyXUCtio5iJ3s1PQFdvFz5rXvEBSNTrEg78ueKFXw5VVxcuzOCeqYEf2Kds9CfywK/Zy3FcBw==
X-Received: by 2002:adf:facf:: with SMTP id a15mr43701962wrs.53.1620800674099; 
 Tue, 11 May 2021 23:24:34 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id z5sm324183wrn.69.2021.05.11.23.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 23:24:33 -0700 (PDT)
Date: Wed, 12 May 2021 07:24:31 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, sre@kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
 shufan_lee@richtek.com, ChiYuan Huang <cy_huang@richtek.com>,
 benjamin.chao@mediatek.com
Subject: Re: [PATCH v7 04/11] mfd: mt6360: Combine mt6360 pmic/ldo resources
 into mt6360 regulator resources
Message-ID: <20210512062431.GB805368@dell>
References: <1605177598-23501-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605177598-23501-5-git-send-email-gene.chen.richtek@gmail.com>
 <74b127eb-9a3c-20c9-5692-b00b982f4da3@gmail.com>
 <CAE+NS34qR9f2LOpvxTBDF4OR=Xq-SFP+uHdWe3dZ5x8xggS8kA@mail.gmail.com>
 <20210115073241.GC3975472@dell>
 <CAE+NS37hVMVJA04ZmdcfKvw05ga1-vT=fGRAf=bh17XOJHEh4A@mail.gmail.com>
 <20210323093806.GR2916463@dell>
 <CAE+NS37jmcyr2w9Z22-m5Ug7rF3Twq20poOLjptDX6E9E_7NLg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAE+NS37jmcyr2w9Z22-m5Ug7rF3Twq20poOLjptDX6E9E_7NLg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_232436_617095_D23E65D9 
X-CRM114-Status: GOOD (  28.88  )
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

T24gVHVlLCAxMSBNYXkgMjAyMSwgR2VuZSBDaGVuIHdyb3RlOgoKPiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPiDmlrwgMjAyMeW5tDPmnIgyM+aXpSDpgLHkuowg5LiL5Y2INTozOOWv
q+mBk++8mgo+ID4KPiA+IE9uIFR1ZSwgMDIgTWFyIDIwMjEsIEdlbmUgQ2hlbiB3cm90ZToKPiA+
Cj4gPiA+IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+IOaWvCAyMDIx5bm0MeaciDE1
5pelIOmAseS6lCDkuIvljYgzOjMy5a+r6YGT77yaCj4gPiA+ID4KPiA+ID4gPiBPbiBGcmksIDE1
IEphbiAyMDIxLCBHZW5lIENoZW4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiA+IE1hdHRoaWFzIEJy
dWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+IOaWvCAyMDIx5bm0MeaciDEy5pelIOmAseS6
jCDkuIvljYg4OjMy5a+r6YGT77yaCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+IE9uIDEyLzExLzIwMjAgMTE6MzksIEdlbmUgQ2hlbiB3cm90ZToKPiA+ID4g
PiA+ID4gPiBGcm9tOiBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiA+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiA+IENvbWJpbmUgbXQ2MzYwIHBtaWMvbGRvIHJlc291cmNlcyBpbnRv
IG10NjM2MCByZWd1bGF0b3IgcmVzb3VyY2VzCj4gPiA+ID4gPiA+ID4gdG8gc2ltcGxpZnkgdGhl
IHNpbWlsYXIgcmVzb3VyY2VzIG9iamVjdC4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+ID4gPiA+ID4g
PiA+IEFja2VkLWZvci1NRkQtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4g
PiA+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiA+ID4gIGRyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMg
fCAxMSArKystLS0tLS0tLQo+ID4gPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCA4IGRlbGV0aW9ucygtKQo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMgYi9kcml2ZXJzL21mZC9tdDYzNjAtY29y
ZS5jCj4gPiA+ID4gPiA+ID4gaW5kZXggNjkyZTQ3Yi4uNTExOWU1MSAxMDA2NDQKPiA+ID4gPiA+
ID4gPiAtLS0gYS9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jCj4gPiA+ID4gPiA+ID4gKysrIGIv
ZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYwo+ID4gPiA+ID4gPiA+IEBAIC0yNjUsNyArMjY1LDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCByZXNvdXJjZSBtdDYzNjBfbGVkX3Jlc291cmNlc1tdID0g
ewo+ID4gPiA+ID4gPiA+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9GTEVEMV9T
VFJCX1RPX0VWVCwgImZsZWQxX3N0cmJfdG9fZXZ0IiksCj4gPiA+ID4gPiA+ID4gIH07Cj4gPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiAtc3RhdGljIGNvbnN0IHN0cnVjdCByZXNvdXJjZSBtdDYz
NjBfcG1pY19yZXNvdXJjZXNbXSA9IHsKPiA+ID4gPiA+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVj
dCByZXNvdXJjZSBtdDYzNjBfcmVndWxhdG9yX3Jlc291cmNlc1tdID0gewo+ID4gPiA+ID4gPiA+
ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9CVUNLMV9QR0JfRVZULCAiYnVjazFf
cGdiX2V2dCIpLAo+ID4gPiA+ID4gPiA+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2
MF9CVUNLMV9PQ19FVlQsICJidWNrMV9vY19ldnQiKSwKPiA+ID4gPiA+ID4gPiAgICAgICBERUZJ
TkVfUkVTX0lSUV9OQU1FRChNVDYzNjBfQlVDSzFfT1ZfRVZULCAiYnVjazFfb3ZfZXZ0IiksCj4g
PiA+ID4gPiA+ID4gQEAgLTI3OCw5ICsyNzgsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJlc291
cmNlIG10NjM2MF9wbWljX3Jlc291cmNlc1tdID0gewo+ID4gPiA+ID4gPiA+ICAgICAgIERFRklO
RV9SRVNfSVJRX05BTUVEKE1UNjM2MF9MRE83X09DX0VWVCwgImxkbzdfb2NfZXZ0IiksCj4gPiA+
ID4gPiA+ID4gICAgICAgREVGSU5FX1JFU19JUlFfTkFNRUQoTVQ2MzYwX0xETzZfUEdCX0VWVCwg
ImxkbzZfcGdiX2V2dCIpLAo+ID4gPiA+ID4gPiA+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVE
KE1UNjM2MF9MRE83X1BHQl9FVlQsICJsZG83X3BnYl9ldnQiKSwKPiA+ID4gPiA+ID4gPiAtfTsK
PiA+ID4gPiA+ID4gPiAtCj4gPiA+ID4gPiA+ID4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVzb3Vy
Y2UgbXQ2MzYwX2xkb19yZXNvdXJjZXNbXSA9IHsKPiA+ID4gPiA+ID4gPiAgICAgICBERUZJTkVf
UkVTX0lSUV9OQU1FRChNVDYzNjBfTERPMV9PQ19FVlQsICJsZG8xX29jX2V2dCIpLAo+ID4gPiA+
ID4gPiA+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9MRE8yX09DX0VWVCwgImxk
bzJfb2NfZXZ0IiksCj4gPiA+ID4gPiA+ID4gICAgICAgREVGSU5FX1JFU19JUlFfTkFNRUQoTVQ2
MzYwX0xETzNfT0NfRVZULCAibGRvM19vY19ldnQiKSwKPiA+ID4gPiA+ID4gPiBAQCAtMjk4LDEw
ICsyOTUsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1mZF9jZWxsIG10NjM2MF9kZXZzW10gPSB7
Cj4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgTlVMTCwgMCwgMCwgIm1lZGlhdGVrLG10
NjM2MC1jaGciKSwKPiA+ID4gPiA+ID4gPiAgICAgICBPRl9NRkRfQ0VMTCgibXQ2MzYwLWxlZCIs
IG10NjM2MF9sZWRfcmVzb3VyY2VzLAo+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgIE5V
TEwsIDAsIDAsICJtZWRpYXRlayxtdDYzNjAtbGVkIiksCj4gPiA+ID4gPiA+ID4gLSAgICAgT0Zf
TUZEX0NFTEwoIm10NjM2MC1wbWljIiwgbXQ2MzYwX3BtaWNfcmVzb3VyY2VzLAo+ID4gPiA+ID4g
PiA+IC0gICAgICAgICAgICAgICAgIE5VTEwsIDAsIDAsICJtZWRpYXRlayxtdDYzNjAtcG1pYyIp
LAo+ID4gPiA+ID4gPiA+IC0gICAgIE9GX01GRF9DRUxMKCJtdDYzNjAtbGRvIiwgbXQ2MzYwX2xk
b19yZXNvdXJjZXMsCj4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgTlVMTCwgMCwgMCwg
Im1lZGlhdGVrLG10NjM2MC1sZG8iKSwKPiA+ID4gPiA+ID4gPiArICAgICBPRl9NRkRfQ0VMTCgi
bXQ2MzYwLXJlZ3VsYXRvciIsIG10NjM2MF9yZWd1bGF0b3JfcmVzb3VyY2VzLAo+ID4gPiA+ID4g
PiA+ICsgICAgICAgICAgICAgICAgIE5VTEwsIDAsIDAsICJtZWRpYXRlayxtdDYzNjAtcmVndWxh
dG9yIiksCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEFzIGRpc2N1c3NlZCB3aXRoIHRoZSBNRkQg
bWFpbnRhaW5lciBbMV0sIHRoZSByZWd1bGF0b3IgKGFuZCBwcm9iYWJseSBhbGwgY2VsbHMpCj4g
PiA+ID4gPiA+IHNob3VsZG4ndCBoYXZlIGEgRFQgYmluZGluZy4KPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gU28gcGxlYXNlIHNlbmQgYSBuZXcgdmVyc2lvbiB3aGljaCBmaXhlcyB0aGF0Lgo+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiBSZWdhcmRzLAo+ID4gPiA+ID4gPiBNYXR0aGlhcwo+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWF0
ZWsvMjAyMTAxMTExNjQxMTguR0U0NzI4QHNpcmVuYS5vcmcudWsvCj4gPiA+ID4KPiA+ID4gPiBJ
IGRvbid0IHRoaW5rIE1hcmsgaXMgY29ycmVjdCBoZXJlLgo+ID4gPiA+Cj4gPiA+ID4gV2UgdXN1
YWxseSBkbyBpbXBsZW1lbnQgY29tcGF0aWJsZSBzdHJpbmdzIGZvciBzdWItZGV2aWNlcyBhbmQg
dGhleSBkbwo+ID4gPiA+IHRlbmQgdG8gaGF2ZSB0aGVpciBvd24gZGV2aWNlIG5vZGVzLgo+ID4g
PiA+Cj4gPiA+ID4gSXQncyBhIHZlcnkgbG9uZyB0aW1lIGFnbyBzaW5jZSBJIGNvZGVkIHRoaXMg
dXAgbXlzZWxmLCBidXQgZnJvbQo+ID4gPiA+IG1lbW9yeSwgeW91IGNhbid0IGhhdmUgMiBkZXZp
Y2VzIHNoYXJlIGEgY29tcGF0aWJsZSBzdHJpbmcuCj4gPiA+ID4KPiA+ID4KPiA+ID4gRWl0aGVy
IE1hcmsgb3IgTGVlIHN1Z2dlc3Rpb24gaXMgd29yay4KPiA+ID4gSXMgdGhlcmUgYSBjb25jbHVz
aW9uIHRoYXQgd2UgY2FuIGFwcGx5IGl0Pwo+ID4gPiBJZiBNRkQgaXMgYWxyZWFkeSBzdXBwb3J0
ZWQgb2ZfY29tcGF0aWJsZSwgd2UgcHJlZmVyIHVzZSBvZl9jb21wYXRpYmxlIG1hcHBpbmcuCj4g
Pgo+ID4gSSB3b3VsZCByZXN1Ym1pdCB0aGUgc2V0LiAgV2UgY2FuIHN0YXJ0IGFmcmVzaCBmcm9t
IHRoZXJlLgo+IAo+IERlYXIgSm9uZXMsCj4gCj4gICAgIFNob3VsZCBJIHNlbmQgZml4ZWQgcGF0
Y2ggYWJvdXQgYWRkaW5nIHJlZ3VsYXRvciBub2RlIGRpcmVjdGx5IGNhbgo+IG1ha2UgZWFzaWVy
IGZvciB5b3UgdG8gcmUtc3VibWl0IG5ldyBwYXRjaD8KCkRvbid0IHdvcnJ5IGFib3V0IG1lLiAg
RG8gd2hhdCdzIGJlc3QgZm9yIHlvdS4KCkkgbG9vayBmb3J3YXJkIHRvIHJlY2VpdmluZyB0aGUg
bmV3IHNldCBzb29uLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2Fs
IExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29m
dHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJs
b2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
