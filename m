Return-Path: <SRS0=pLce=IU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E9CCC433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 11:01:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 378FA6196F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 11:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 378FA6196F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ne9NVhhIKvdN984HyDVDLRUGRzh03sq6DhkOkzAsN44=; b=Tbi/d2k+brUMTXKZ3/xc4wSYF
	D10c1TiWq5DBO1A9IJT0kDEc0twsBoNpDfe9sv/1IMsZ8+Ar6TnT8xuXbBh0DxMYYvpczbA17Jxb6
	7avOTqEhahmu78tcVriXzcr4C8E79i3JzyiB0QzbNwDowX4vypQjl2E1QKBmHPrvvBT4yt6bZD1uc
	ue9WVgo+8uilmdmGviG4aO7DCHm6h0WG6+OuX1dlzlYS6/CFKgLPytXmKrnGbRjTC+rF3tSTtf39h
	W9QRhll5xjK+1gTS4iLkbRN8ZAWj4/uZT0Ts4aIiTkICBtEjGj+/d9/Bi9e/H8M4IQVSvTkR/Iraj
	+5Z+sZJwg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOIJB-00BOSa-H8; Mon, 22 Mar 2021 11:01:18 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOIIh-00BOMa-E6; Mon, 22 Mar 2021 11:00:52 +0000
Received: by mail-ot1-x330.google.com with SMTP id
 f73-20020a9d03cf0000b02901b4d889bce0so15450905otf.12; 
 Mon, 22 Mar 2021 04:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MswKZYYZouzZ/DJU9aD32Wwz0ahxahnd05UPrcoeNOA=;
 b=bHl2ngaRSyHYtV22hVZZ6s070a52j+vhIZRPFwlNBJqUV5RHtpgQ1313zSO07TYVfP
 q48jTzvA9OhsPj4xm2oaAfgBkQM7uezv6rSrsOZhh8Ow7pKoARb6djnaedWViqL3DSNA
 InS6OsrgcmVMkcmH5XB4xOZV4G0kcANkF+qWP1ulnSbU7ATHbIDjhDNayAKQuemobgeX
 QnGfZ6ZYefAx6BrzVf/DZYwj7UYb3bv1jMh+59XMrDbJDZLt0L80g25H+GfkrjyeHmwg
 ptyFHv+X/8pFjU/X0jZ6lC0QtkQrKhjpUj0wYKcfHHul+5Pz5GkSsMl85cgp3e3QomgC
 e7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MswKZYYZouzZ/DJU9aD32Wwz0ahxahnd05UPrcoeNOA=;
 b=X7whCXT6uB5WN6b/oLKAtngCNtzwuuxJQzqMGqNEGp1iUdFcz0YnkFQr30JoN+EaV+
 gePeC2bzv+F6DEc0jEXUF0l4aNEo5263RawoU6kQMNWdpbgg5UltHBzCZDDbCfQI2Zae
 WOvO2rV61a346RK53ZhYvKW8HFL9LLvilI+HPUesyVeK43qYAwNNBuslzCwKa2lImrEj
 /xeRJJv2ix5scucoyjji3froH/X9Fnl+GIgAF1c0AWvMrgk/n7aX+C2PPCYR2FzAfT8g
 VNhhj0DkW4ZkDFtMqGyg+6wGHL0kyix53zN4fLVWyP6TNsraOxCk73g0eBni2YBrbXmc
 TJFA==
X-Gm-Message-State: AOAM533z88SecKhYBzfoYQu/ly3ABJU1CZHeWLCF98nIWOOQqUpqwMVb
 R8zZR8WhON08YKkddpSPVheUCRY2JWlbJSCSnKM=
X-Google-Smtp-Source: ABdhPJzYWNIUnBRsr9jYj9MV52giagykpnsYjr14zOl/4YFf/K65sxbnlRqoSwlT4Hvbw7E4/QTnbwFn6qCYx5b35eg=
X-Received: by 2002:a9d:370:: with SMTP id 103mr10793042otv.232.1616410845129; 
 Mon, 22 Mar 2021 04:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <1605177598-23501-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605177598-23501-5-git-send-email-gene.chen.richtek@gmail.com>
 <74b127eb-9a3c-20c9-5692-b00b982f4da3@gmail.com>
 <CAE+NS34qR9f2LOpvxTBDF4OR=Xq-SFP+uHdWe3dZ5x8xggS8kA@mail.gmail.com>
 <20210115073241.GC3975472@dell>
 <CAE+NS37hVMVJA04ZmdcfKvw05ga1-vT=fGRAf=bh17XOJHEh4A@mail.gmail.com>
In-Reply-To: <CAE+NS37hVMVJA04ZmdcfKvw05ga1-vT=fGRAf=bh17XOJHEh4A@mail.gmail.com>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Mon, 22 Mar 2021 19:00:34 +0800
Message-ID: <CAE+NS35R3y=mLcZWXtWbWrmoZLVfXc31a-xMqGuDD+CNbfqitA@mail.gmail.com>
Subject: Re: [PATCH v7 04/11] mfd: mt6360: Combine mt6360 pmic/ldo resources
 into mt6360 regulator resources
To: Lee Jones <lee.jones@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, sre@kernel.org, 
 Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org, 
 devicetree <devicetree@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, 
 Wilma.Wu@mediatek.com, shufan_lee@richtek.com, 
 ChiYuan Huang <cy_huang@richtek.com>, benjamin.chao@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_110049_776346_916D3952 
X-CRM114-Status: GOOD (  28.37  )
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

R2VuZSBDaGVuIDxnZW5lLmNoZW4ucmljaHRla0BnbWFpbC5jb20+IOaWvCAyMDIx5bm0M+aciDLm
l6Ug6YCx5LqMIOS4i+WNiDM6MTblr6vpgZPvvJoKPgo+IExlZSBKb25lcyA8bGVlLmpvbmVzQGxp
bmFyby5vcmc+IOaWvCAyMDIx5bm0MeaciDE15pelIOmAseS6lCDkuIvljYgzOjMy5a+r6YGT77ya
Cj4gPgo+ID4gT24gRnJpLCAxNSBKYW4gMjAyMSwgR2VuZSBDaGVuIHdyb3RlOgo+ID4KPiA+ID4g
TWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4g5pa8IDIwMjHlubQx5pyI
MTLml6Ug6YCx5LqMIOS4i+WNiDg6MzLlr6vpgZPvvJoKPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4K
PiA+ID4gPiBPbiAxMi8xMS8yMDIwIDExOjM5LCBHZW5lIENoZW4gd3JvdGU6Cj4gPiA+ID4gPiBG
cm9tOiBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiA+ID4gPiA+Cj4gPiA+ID4g
PiBDb21iaW5lIG10NjM2MCBwbWljL2xkbyByZXNvdXJjZXMgaW50byBtdDYzNjAgcmVndWxhdG9y
IHJlc291cmNlcwo+ID4gPiA+ID4gdG8gc2ltcGxpZnkgdGhlIHNpbWlsYXIgcmVzb3VyY2VzIG9i
amVjdC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHZW5lIENoZW4gPGdlbmVf
Y2hlbkByaWNodGVrLmNvbT4KPiA+ID4gPiA+IEFja2VkLWZvci1NRkQtYnk6IExlZSBKb25lcyA8
bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ICBkcml2ZXJzL21m
ZC9tdDYzNjAtY29yZS5jIHwgMTEgKysrLS0tLS0tLS0KPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+ID4gPiA+ID4KPiA+ID4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jIGIvZHJpdmVycy9tZmQvbXQ2MzYw
LWNvcmUuYwo+ID4gPiA+ID4gaW5kZXggNjkyZTQ3Yi4uNTExOWU1MSAxMDA2NDQKPiA+ID4gPiA+
IC0tLSBhL2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMKPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMv
bWZkL210NjM2MC1jb3JlLmMKPiA+ID4gPiA+IEBAIC0yNjUsNyArMjY1LDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCByZXNvdXJjZSBtdDYzNjBfbGVkX3Jlc291cmNlc1tdID0gewo+ID4gPiA+ID4g
ICAgICAgREVGSU5FX1JFU19JUlFfTkFNRUQoTVQ2MzYwX0ZMRUQxX1NUUkJfVE9fRVZULCAiZmxl
ZDFfc3RyYl90b19ldnQiKSwKPiA+ID4gPiA+ICB9Owo+ID4gPiA+ID4KPiA+ID4gPiA+IC1zdGF0
aWMgY29uc3Qgc3RydWN0IHJlc291cmNlIG10NjM2MF9wbWljX3Jlc291cmNlc1tdID0gewo+ID4g
PiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcmVzb3VyY2UgbXQ2MzYwX3JlZ3VsYXRvcl9yZXNv
dXJjZXNbXSA9IHsKPiA+ID4gPiA+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9C
VUNLMV9QR0JfRVZULCAiYnVjazFfcGdiX2V2dCIpLAo+ID4gPiA+ID4gICAgICAgREVGSU5FX1JF
U19JUlFfTkFNRUQoTVQ2MzYwX0JVQ0sxX09DX0VWVCwgImJ1Y2sxX29jX2V2dCIpLAo+ID4gPiA+
ID4gICAgICAgREVGSU5FX1JFU19JUlFfTkFNRUQoTVQ2MzYwX0JVQ0sxX09WX0VWVCwgImJ1Y2sx
X292X2V2dCIpLAo+ID4gPiA+ID4gQEAgLTI3OCw5ICsyNzgsNiBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHJlc291cmNlIG10NjM2MF9wbWljX3Jlc291cmNlc1tdID0gewo+ID4gPiA+ID4gICAgICAg
REVGSU5FX1JFU19JUlFfTkFNRUQoTVQ2MzYwX0xETzdfT0NfRVZULCAibGRvN19vY19ldnQiKSwK
PiA+ID4gPiA+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9MRE82X1BHQl9FVlQs
ICJsZG82X3BnYl9ldnQiKSwKPiA+ID4gPiA+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1U
NjM2MF9MRE83X1BHQl9FVlQsICJsZG83X3BnYl9ldnQiKSwKPiA+ID4gPiA+IC19Owo+ID4gPiA+
ID4gLQo+ID4gPiA+ID4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVzb3VyY2UgbXQ2MzYwX2xkb19y
ZXNvdXJjZXNbXSA9IHsKPiA+ID4gPiA+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2
MF9MRE8xX09DX0VWVCwgImxkbzFfb2NfZXZ0IiksCj4gPiA+ID4gPiAgICAgICBERUZJTkVfUkVT
X0lSUV9OQU1FRChNVDYzNjBfTERPMl9PQ19FVlQsICJsZG8yX29jX2V2dCIpLAo+ID4gPiA+ID4g
ICAgICAgREVGSU5FX1JFU19JUlFfTkFNRUQoTVQ2MzYwX0xETzNfT0NfRVZULCAibGRvM19vY19l
dnQiKSwKPiA+ID4gPiA+IEBAIC0yOTgsMTAgKzI5NSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
bWZkX2NlbGwgbXQ2MzYwX2RldnNbXSA9IHsKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgIE5V
TEwsIDAsIDAsICJtZWRpYXRlayxtdDYzNjAtY2hnIiksCj4gPiA+ID4gPiAgICAgICBPRl9NRkRf
Q0VMTCgibXQ2MzYwLWxlZCIsIG10NjM2MF9sZWRfcmVzb3VyY2VzLAo+ID4gPiA+ID4gICAgICAg
ICAgICAgICAgICAgTlVMTCwgMCwgMCwgIm1lZGlhdGVrLG10NjM2MC1sZWQiKSwKPiA+ID4gPiA+
IC0gICAgIE9GX01GRF9DRUxMKCJtdDYzNjAtcG1pYyIsIG10NjM2MF9wbWljX3Jlc291cmNlcywK
PiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgIE5VTEwsIDAsIDAsICJtZWRpYXRlayxtdDYzNjAt
cG1pYyIpLAo+ID4gPiA+ID4gLSAgICAgT0ZfTUZEX0NFTEwoIm10NjM2MC1sZG8iLCBtdDYzNjBf
bGRvX3Jlc291cmNlcywKPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgIE5VTEwsIDAsIDAsICJt
ZWRpYXRlayxtdDYzNjAtbGRvIiksCj4gPiA+ID4gPiArICAgICBPRl9NRkRfQ0VMTCgibXQ2MzYw
LXJlZ3VsYXRvciIsIG10NjM2MF9yZWd1bGF0b3JfcmVzb3VyY2VzLAo+ID4gPiA+ID4gKyAgICAg
ICAgICAgICAgICAgTlVMTCwgMCwgMCwgIm1lZGlhdGVrLG10NjM2MC1yZWd1bGF0b3IiKSwKPiA+
ID4gPgo+ID4gPiA+IEFzIGRpc2N1c3NlZCB3aXRoIHRoZSBNRkQgbWFpbnRhaW5lciBbMV0sIHRo
ZSByZWd1bGF0b3IgKGFuZCBwcm9iYWJseSBhbGwgY2VsbHMpCj4gPiA+ID4gc2hvdWxkbid0IGhh
dmUgYSBEVCBiaW5kaW5nLgo+ID4gPiA+Cj4gPiA+ID4gU28gcGxlYXNlIHNlbmQgYSBuZXcgdmVy
c2lvbiB3aGljaCBmaXhlcyB0aGF0Lgo+ID4gPiA+Cj4gPiA+ID4gUmVnYXJkcywKPiA+ID4gPiBN
YXR0aGlhcwo+ID4gPiA+Cj4gPiA+ID4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LW1lZGlhdGVrLzIwMjEwMTExMTY0MTE4LkdFNDcyOEBzaXJlbmEub3JnLnVrLwo+ID4KPiA+IEkg
ZG9uJ3QgdGhpbmsgTWFyayBpcyBjb3JyZWN0IGhlcmUuCj4gPgo+ID4gV2UgdXN1YWxseSBkbyBp
bXBsZW1lbnQgY29tcGF0aWJsZSBzdHJpbmdzIGZvciBzdWItZGV2aWNlcyBhbmQgdGhleSBkbwo+
ID4gdGVuZCB0byBoYXZlIHRoZWlyIG93biBkZXZpY2Ugbm9kZXMuCj4gPgo+ID4gSXQncyBhIHZl
cnkgbG9uZyB0aW1lIGFnbyBzaW5jZSBJIGNvZGVkIHRoaXMgdXAgbXlzZWxmLCBidXQgZnJvbQo+
ID4gbWVtb3J5LCB5b3UgY2FuJ3QgaGF2ZSAyIGRldmljZXMgc2hhcmUgYSBjb21wYXRpYmxlIHN0
cmluZy4KPiA+Cj4KPiBFaXRoZXIgTWFyayBvciBMZWUgc3VnZ2VzdGlvbiBpcyB3b3JrLgo+IElz
IHRoZXJlIGEgY29uY2x1c2lvbiB0aGF0IHdlIGNhbiBhcHBseSBpdD8KPiBJZiBNRkQgaXMgYWxy
ZWFkeSBzdXBwb3J0ZWQgb2ZfY29tcGF0aWJsZSwgd2UgcHJlZmVyIHVzZSBvZl9jb21wYXRpYmxl
IG1hcHBpbmcuCj4KCklzIHRoZXJlIGFueSB1cGRhdGU/Cgo+ID4gPiBTaG91bGQgSSB1c2UgcGFy
ZW50J3MgZGV2aWNlIHRvIGZpbmQgc3ViLWRldmljZXMgb2Zfbm9kZSBpZiB3aXRob3V0Cj4gPiA+
IGNvbXBhdGlibGUgbmFtZT8KPiA+ID4gSSB0cmFjZSB0aGUgZnVuY3Rpb24gbWZkX2FkZF9kZXZp
Y2UsCj4gPiA+Cj4gPiA+IGlmIChJU19FTkFCTEVEKENPTkZJR19PRikgJiYgcGFyZW50LT5vZl9u
b2RlICYmIGNlbGwtPm9mX2NvbXBhdGlibGUpIHsKPiA+ID4gICAgIC4uLi4uCj4gPiA+ICAgICBy
ZXQgPSBtZmRfbWF0Y2hfb2Zfbm9kZV90b19kZXYocGRldiwgbnAsIGNlbGwpOwo+ID4gPiAgICAg
Li4uLi4KPiA+ID4gfQo+ID4gPgo+ID4gPiB3aGljaCBpcyBiaW5kaW5nIG1mZCBzdWItZGV2aWNl
IHdpdGggY29tcGF0aWJsZS4gRG9lcyBpdCBiZSByZW1vdmVkIGluCj4gPiA+IHRoZSBmZWF0dXJl
Pwo+ID4gPgo+ID4gPiA+ID4gICAgICAgT0ZfTUZEX0NFTEwoIm10NjM2MC10Y3BjIiwgTlVMTCwK
PiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgIE5VTEwsIDAsIDAsICJtZWRpYXRlayxtdDYzNjAt
dGNwYyIpLAo+ID4gPiA+ID4gIH07Cj4gPiA+ID4gPgo+ID4KPiA+IC0tCj4gPiBMZWUgSm9uZXMg
W+adjueQvOaWr10KPiA+IFNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNl
cwo+ID4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCj4g
PiBGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
