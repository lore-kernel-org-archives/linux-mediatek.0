Return-Path: <SRS0=A+tK=A7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B208FC433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 16:10:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EF762064B
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 16:10:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m5JRxM3f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mywFm7Q0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EF762064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yt/q+ngG6EP6EbOAQCn5akbMg62/ve8/7Nsi0k/X54o=; b=m5JRxM3fAx85vii6uW8HJc6ZD
	dwHEuw5EzgmFdjhzqS2LEzvWxjHPixFibPt0yD1uNUYb0VF52z15k+sc5D9HihZSzN9+amzl9MqkD
	35YZQMQ/6yD3c/5sZ7qp41Be2+PcphCLAorHxoOPSnJq0BhQH+zhPXIFLLLeTCHhdBtiPiTL9STAf
	jcGYfVO0MgLjCUxVEo9ergNefiYhJ8UBovVdcY1gHyakiMO58Gxtmj1/DHCewQrtQo1HuxXMWW5Pb
	q9QzPv3mfc8kU4B3Kyv+Rg3j7/X9BLbiFJcdkiU/fMwxDxmporyDPqtQghgBHYuEM18LMspBLAdm2
	z0krX+Hlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxYMo-0000IE-SE; Mon, 20 Jul 2020 16:10:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxYMl-0000HG-Sh; Mon, 20 Jul 2020 16:10:12 +0000
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 421F122D06;
 Mon, 20 Jul 2020 16:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595261410;
 bh=U7uXjX8IfjoIHHcZ94LBnWRXLP1OX+olQJgVuZvrYz8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mywFm7Q0v6qrIqaQ80nhFbUpcFOGRvUhHtCEA/fayqjg0rtYs/pYaWNKJfRqyw3i7
 XLoxMzbKuZ6U1GcIcAVpCuXX8oodHcdxaDHqTU0uV8Uk8ODLH1CZk2FLTVg8JWrWk5
 azVsSx9XhFktMuRsA0P0lAJSD1h4gOcHR2w6hAVE=
Received: by mail-ej1-f52.google.com with SMTP id ga4so18637323ejb.11;
 Mon, 20 Jul 2020 09:10:10 -0700 (PDT)
X-Gm-Message-State: AOAM5329iJwifFdtEUp+pRsk+wR9GZrAzZOi+o9soI02ZZHGO9vdgvIZ
 054wo+oEXuA6D/mnc57BJ5pBx0r1dcNF5jaUPg==
X-Google-Smtp-Source: ABdhPJzjWZka7dLZIstGqrBjwKgkCw0Jts0It8B2AGaHIdJ5T0KmMrd6sjOYVhE+rD/LgFxqtR3lEzkplYm7brWs4pA=
X-Received: by 2002:a17:906:404e:: with SMTP id
 y14mr21106907ejj.260.1595261408723; 
 Mon, 20 Jul 2020 09:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200506084039.249977-1-eizan@chromium.org>
 <20200506184018.v2.1.I27dac0775ba64deff6a91837f39bfba83dccdf84@changeid>
In-Reply-To: <20200506184018.v2.1.I27dac0775ba64deff6a91837f39bfba83dccdf84@changeid>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 21 Jul 2020 00:09:57 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9qSpH51kkopofoQTfSqYqGWcQVN8KrJJKQDWozoMK+NQ@mail.gmail.com>
Message-ID: <CAAOTY_9qSpH51kkopofoQTfSqYqGWcQVN8KrJJKQDWozoMK+NQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] [media] mtk-mdp: add driver to probe mdp components
To: Eizan Miyamoto <eizan@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_121012_050402_9DCAD820 
X-CRM114-Status: GOOD (  25.26  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 LKML <linux-kernel@vger.kernel.org>, Houlong Wei <houlong.wei@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEVpemFuOgoKRWl6YW4gTWl5YW1vdG8gPGVpemFuQGNocm9taXVtLm9yZz4g5pa8IDIwMjDl
ubQ15pyINuaXpSDpgLHkuIkg5LiL5Y2INDo0MeWvq+mBk++8mgo+Cj4gQnJvYWRseSwgdGhpcyBw
YXRjaCAoMSkgYWRkcyBhIGRyaXZlciBmb3IgdmFyaW91cyBNVEsgTURQIGNvbXBvbmVudHMgdG8K
PiBnbyBhbG9uZ3NpZGUgdGhlIG1haW4gTVRLIE1EUCBkcml2ZXIsIGFuZCAoMikgaG9va3MgdGhl
bSBhbGwgdG9nZXRoZXIKPiB1c2luZyB0aGUgY29tcG9uZW50IGZyYW1ld29yay4KPgo+ICgxKSBV
cCB1bnRpbCBub3csIHRoZSBNVEsgTURQIGRyaXZlciBjb250cm9scyA4IGRldmljZXMgaW4gdGhl
IGRldmljZQo+IHRyZWUgb24gaXRzIG93bi4gV2hlbiBydW5uaW5nIHRlc3RzIGZvciB0aGUgaGFy
ZHdhcmUgdmlkZW8gZGVjb2Rlciwgd2UKPiBmb3VuZCB0aGF0IHRoZSBpb21tdXMgYW5kIExBUkJz
IHdlcmUgbm90IGJlaW5nIHByb3Blcmx5IGNvbmZpZ3VyZWQuIFRvCj4gY29uZmlndXJlIHRoZW0s
IGEgZHJpdmVyIGZvciBlYWNoIGJlIGFkZGVkIHRvIG10a19tZHBfY29tcCBzbyB0aGF0Cj4gbXRr
X2lvbW11X2FkZF9kZXZpY2UoKSBjYW4gKGV2ZW50dWFsbHkpIGJlIGNhbGxlZCBmcm9tIGRtYV9j
b25maWd1cmUoKQo+IGluc2lkZSByZWFsbHlfcHJvYmUoKS4KPgo+ICgyKSBUaGUgaW50ZWdyYXRp
b24gaW50byB0aGUgY29tcG9uZW50IGZyYW1ld29yayBhbGxvd3MgdXMgdG8gZGVmZXIgdGhlCj4g
cmVnaXN0cmF0aW9uIHdpdGggdGhlIHY0bDIgc3Vic3lzdGVtIHVudGlsIGFsbCB0aGUgTURQLXJl
bGF0ZWQgZGV2aWNlcwo+IGhhdmUgYmVlbiBwcm9iZWQsIHNvIHRoYXQgdGhlIHJlbGV2YW50IGRl
dmljZSBub2RlIGRvZXMgbm90IGJlY29tZQo+IGF2YWlsYWJsZSB1bnRpbCBpbml0aWFsaXphdGlv
biBvZiBhbGwgdGhlIGNvbXBvbmVudHMgaXMgY29tcGxldGUuCj4KPiBTb21lIG5vdGVzIGFib3V0
IGhvdyB0aGUgY29tcG9uZW50IGZyYW1ld29yayBoYXMgYmVlbiBpbnRlZ3JhdGVkOgo+Cj4gLSBU
aGUgZHJpdmVyIGZvciB0aGUgcmRtYTAgY29tcG9uZW50IHNlcnZlcyBkb3VibGUgZHV0eSBhcyB0
aGUgIm1hc3RlciIKPiAgIChhZ2dyZWdhdGUpIGRyaXZlciBhcyB3ZWxsIGFzIGEgY29tcG9uZW50
IGRyaXZlci4gVGhpcyBpcyBhIG5vbi1pZGVhbAo+ICAgY29tcHJvbWlzZSB1bnRpbCBhIGJldHRl
ciBzb2x1dGlvbiBpcyBkZXZlbG9wZWQuIFRoaXMgZGV2aWNlIGlzCj4gICBkaWZmZXJlbnRpYXRl
ZCBmcm9tIHRoZSByZXN0IGJ5IGNoZWNraW5nIGZvciBhICJtZWRpYXRlayx2cHUiIHByb3BlcnR5
Cj4gICBpbiB0aGUgZGV2aWNlIG5vZGUuCj4KPiAtIFRoZSBsaXN0IG9mIG1kcCBjb21wb25lbnRz
IHJlbWFpbnMgaGFyZC1jb2RlZCBhcyBtdGtfbWRwX2NvbXBfZHRfaWRzW10KPiAgIGluIG10a19t
ZHBfY29yZS5jLCBhbmQgYXMgbXRrX21kcF9jb21wX2RyaXZlcl9kdF9tYXRjaFtdIGluCj4gICBt
dGtfbWRwX2NvbXAuYy4gVGhpcyB1bmZvcnR1bmF0ZSBkdXBsaWNhdGlvbiBvZiBpbmZvcm1hdGlv
biBpcwo+ICAgYWRkcmVzc2VkIGluIGEgZm9sbG93aW5nIHBhdGNoIGluIHRoaXMgc2VyaWVzLgo+
Cj4gLSBUaGUgY29tcG9uZW50IGRyaXZlciBjYWxscyBjb21wb25lbnRfYWRkKCkgZm9yIGVhY2gg
ZGV2aWNlIHRoYXQgaXMKPiAgIHByb2JlZC4KPgo+IC0gSW4gbXRrX21kcF9wcm9iZSAodGhlICJt
YXN0ZXIiIGRldmljZSksIHdlIHNjYW4gdGhlIGRldmljZSB0cmVlIGZvcgo+ICAgYW55IG1hdGNo
aW5nIG5vZGVzIGFnYWluc3QgbXRrX21kcF9jb21wX2R0X2lkcywgYW5kIGFkZCBjb21wb25lbnQK
PiAgIG1hdGNoZXMgZm9yIHRoZW0uIFRoZSBtYXRjaCBjcml0ZXJpYSBpcyBhIG1hdGNoaW5nIGRl
dmljZSBub2RlCj4gICBwb2ludGVyLgo+Cj4gLSBXaGVuIHRoZSBzZXQgb2YgY29tcG9uZW50cyBk
ZXZpY2VzIHRoYXQgaGF2ZSBiZWVuIHByb2JlZCBjb3JyZXNwb25kcwo+ICAgd2l0aCB0aGUgbGlz
dCB0aGF0IGlzIGdlbmVyYXRlZCBieSB0aGUgIm1hc3RlciIsIHRoZSBjYWxsYmFjayB0bwo+ICAg
bXRrX21kcF9tYXN0ZXJfYmluZCgpIGlzIG1hZGUsIHdoaWNoIHRoZW4gY2FsbHMgdGhlIGNvbXBv
bmVudCBiaW5kCj4gICBmdW5jdGlvbnMuCj4KPiAtIEluc2lkZSBtdGtfbWRwX21hc3Rlcl9iaW5k
KCksIG9uY2UgYWxsIHRoZSBjb21wb25lbnQgYmluZCBmdW5jdGlvbnMKPiAgIGhhdmUgYmVlbiBj
YWxsZWQsIHdlIGNhbiB0aGVuIHJlZ2lzdGVyIG91ciBkZXZpY2UgdG8gdGhlIHY0bDIKPiAgIHN1
YnN5c3RlbS4KPgo+IC0gVGhlIGNhbGwgdG8gcG1fcnVudGltZV9lbmFibGUoKSBpbiB0aGUgbWFz
dGVyIGRldmljZSBpcyBjYWxsZWQgYWZ0ZXIKPiAgIGFsbCB0aGUgY29tcG9uZW50cyBoYXZlIGJl
ZW4gcmVnaXN0ZXJlZCBieSB0aGVpciBiaW5kKCkgZnVuY3Rpb25zCj4gICBjYWxsZWQgYnkgbXRr
X210cF9tYXN0ZXJfYmluZCgpLiBBcyBhIHJlc3VsdCwgdGhlIGxpc3Qgb2YgY29tcG9uZW50cwo+
ICAgd2lsbCBub3QgY2hhbmdlIHdoaWxlIHBvd2VyIG1hbmFnZW1lbnQgY2FsbGJhY2tzIG10a19t
ZHBfc3VzcGVuZCgpLwo+ICAgcmVzdW1lKCkgYXJlIGFjY2Vzc2luZyB0aGUgbGlzdCBvZiBjb21w
b25lbnRzLgoKRm9yIHRoZSBjb21wb25lbnQgYmluZGluZyBwcm9ibGVtLCBNRFAgaXMgc2ltaWxh
ciB0byBEUk0gZHJpdmVyIFsxXSwKYW5kIERSTSBpcyBwcm9iZWQgYnkgbW1zeXMgZHJpdmVyIFsy
XSAobW1zeXMgaXMgYSBkZXZpY2Ugd2hpY2ggY29udHJvbApkaXNwbGF5IGNsb2NrLCBkaXNwbGF5
IHJvdXRpbmcsIG1kcCBjbG9jaywgbWRwIHJvdXRpbmcpLiBNYXliZSB5b3UKY291bGQgcmVmZXIg
dG8gd2hhdCBEUk0gZG9lcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9kcnYuYz9oPXY1LjgtcmM2ClsyXSBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9oPXY1
LjgtcmM2JmlkPTY2N2M3NjkyNDZiMDFjNTNhZDA5MjVkNjAzZDJhMjUzMWFiZDNlZjIKClJlZ2Fy
ZHMsCkNodW4tS3VhbmcuCgo+Cj4gU2lnbmVkLW9mZi1ieTogRWl6YW4gTWl5YW1vdG8gPGVpemFu
QGNocm9taXVtLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
