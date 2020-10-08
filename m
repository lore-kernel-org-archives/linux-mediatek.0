Return-Path: <SRS0=jGCy=DP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D9ABC43467
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 10:53:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8545B215A4
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 10:53:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JDP1Iw/F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VAwrMdmA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8545B215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xp4oTMDQhHjlmiNM0lWb8s4yKU4HrW9xESmCt86HZpg=; b=JDP1Iw/F5WyL78d4Ba2pvDWZL
	9NM2sDgKu+NpQjROKJX8Zh1wWl/G0+CbiT5OrA/ach26LohcL9RViljQfFfJZLtFepJcGhGXUgb5q
	3a/VMpzT8dWcrHtIhPZJ3M8FMrDxW1rsvcAZG5RZvH1W+WSRcOYB5thImpZaqz533jQc+GKBtixZK
	8j9sO+smV0owapRA4JmHfQ/+Y+6wM7+Nx/VPmZCGrzZ0sJSoXQA4bK3eQvYGrPn1sXPJHN5Evbuk5
	lfR7SMTHEyS9Js0HCYATrCDhv0gd6z0qEeogLlWC2ypQKXnomzcFbVypVXtgepuHUQQLNz6mEYbTG
	qq5XuYhiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQTYI-0005dA-PP; Thu, 08 Oct 2020 10:53:38 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQTYG-0005cc-CP; Thu, 08 Oct 2020 10:53:37 +0000
Received: by mail-wm1-x344.google.com with SMTP id l11so5973454wmh.2;
 Thu, 08 Oct 2020 03:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wotskCcQ8Bfd9kB9LqYWsitlA9BI8lFl5qjTxF+AmRI=;
 b=VAwrMdmAi7DTJSt1xSvEQ0AJyG7DCnU4ribw1JuLI5Yfceu8pIReZthIiESDilbSqp
 Vf0gdeiQrdlQqRxJ+hrGg8mM0bB+Z8OeLcHhv6jQQASN1Hb+PGzWK/eCe911vrLR+RIT
 HR0E4bih7yH4P5AZakfzTTENk/LpQQOO8lOQjPi5/JDvrNUeDKH3Tv+bccT4lNEtj58q
 rBFCc+TFBdD/PrDzo9+hDERhvKMiGuEJz5qJtyoN9c2dYkapPO6DL3d8WsjB5z+iYITT
 GNMLBj0jUIFfS/xijL5b9InSd3vxqPALTuYL/NOVnAu1uwwzHLSL3M7vDtMKCWAwD/D5
 0WQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wotskCcQ8Bfd9kB9LqYWsitlA9BI8lFl5qjTxF+AmRI=;
 b=CELIDcRifFe5+a6xspZKYKPM3eeGskCHR7ITnK5fcRZbwAG6N3nSSnQ+ryjqXeZQ3f
 Ri3HprEkQFBD/T9C9Pb9IMhpnUgVm3genh6HnIuZBtWknxHeS9awZv32RZKV/Mrs2Kz+
 KttGsfZAThb7jWVLBvdcJ8xwfYnGIQcIdmVFNvACS67K5ldPpu+VGj/vXIDti7ZQT0/+
 TARo6hz3yAvZN2ZhPpT83hNP/LJwN+NGwmnljqsKDDV9iYxNP/ZWi7e5/yrjYDKOhAci
 35LWfa/3BKpfU6b8o6dcquyNfQkHJbyQ+7qhHA7kFOixi5yJnz4M6IuamL0y2A0QLzuq
 ad7g==
X-Gm-Message-State: AOAM532RPLufNvA9XXeKeGriozkP/cwBLeo+PPDj7AmJRdSO/HfSylNu
 zWYO7Wm9LiRN8V+nyTJOpvXm4sofQ3Anmg==
X-Google-Smtp-Source: ABdhPJznG7dHOrS1DRUjCidZScs64soiMYfjbGBAooA1olh4Aec3dFavbraorso1hCwwx5JyQ+GOzQ==
X-Received: by 2002:a1c:bcd5:: with SMTP id m204mr7878483wmf.26.1602154413420; 
 Thu, 08 Oct 2020 03:53:33 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id c16sm7139623wrx.31.2020.10.08.03.53.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2020 03:53:32 -0700 (PDT)
Subject: Re: [PATCH 4/4] soc: mediatek: mmsys: Use an array for setting the
 routing registers
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20201006193320.405529-1-enric.balletbo@collabora.com>
 <20201006193320.405529-5-enric.balletbo@collabora.com>
 <CAAOTY__X8L2sK0s3rkq2LDaMNoQrZKfzn=aJ791fK=UwnJMAyQ@mail.gmail.com>
 <580ecdf4-a686-f14c-a230-7f87f0c8cde5@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <d46f09a9-22bf-da68-5629-f080f7804b92@gmail.com>
Date: Thu, 8 Oct 2020 12:53:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <580ecdf4-a686-f14c-a230-7f87f0c8cde5@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_065336_556216_D4426F7A 
X-CRM114-Status: GOOD (  21.43  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 CK Hu <ck.hu@mediatek.com>, Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAwOC8xMC8yMDIwIDA5OjQ5LCBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIHdyb3RlOgo+IEhp
IENodW4tS3VhbmcsCj4gCj4gT24gOC8xMC8yMCAyOjAxLCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+
PiBIaSwgRW5yaWM6Cj4+Cj4+IEVucmljIEJhbGxldGJvIGkgU2VycmEgPGVucmljLmJhbGxldGJv
QGNvbGxhYm9yYS5jb20+IOaWvCAyMDIw5bm0MTDmnIg35pelIOmAseS4iSDkuIrljYgzOjMz5a+r
6YGT77yaCj4+Pgo+Pj4gRnJvbTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KPj4+Cj4+PiBB
Y3R1YWxseSwgc2V0dGluZyB0aGUgcmVnaXN0ZXJzIGZvciByb3V0aW5nLCB1c2UgbXVsdGlwbGUg
J2lmLWVsc2UnIGZvciBkaWZmZXJlbnQKPj4+IHJvdXRlcywgYnV0IHRoaXMgY29kZSB3b3VsZCBi
ZSBtb3JlIGFuZCBtb3JlIGNvbXBsaWNhdGVkIHdoaWxlIHdlCj4+PiBzdXBwb3J0IG1vcmUgYW5k
IG1vcmUgU29Dcy4gQ2hhbmdlIHRoYXQgYW5kIHVzZSBhIHRhYmxlIHBlciBTb0Mgc28gdGhlCj4+
PiBjb2RlIHdpbGwgYmUgbW9yZSBwb3J0YWJsZSBhbmQgY2xlYXIuCj4+Pgo+Pj4gU2lnbmVkLW9m
Zi1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IEVucmlj
IEJhbGxldGJvIGkgU2VycmEgPGVucmljLmJhbGxldGJvQGNvbGxhYm9yYS5jb20+Cj4+PiAtLS0K
Pj4+Cj4+PiAgIGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jIHwgMzkzICsrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0KPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIxMCBpbnNlcnRp
b25zKCspLCAxODMgZGVsZXRpb25zKC0pCj4+Pgo+Pgo+PiBbc25pcF0KPj4KPj4+Cj4+PiAgIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRhIG10MjcwMV9tbXN5c19kcml2
ZXJfZGF0YSA9IHsKPj4+IEBAIC05MywxMCArMTE1LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBt
dGtfbW1zeXNfZHJpdmVyX2RhdGEgbXQ2Nzk3X21tc3lzX2RyaXZlcl9kYXRhID0gewo+Pj4gICAg
ICAgICAgLmNsa19kcml2ZXIgPSAiY2xrLW10Njc5Ny1tbSIsCj4+PiAgIH07Cj4+Pgo+Pj4gLXN0
YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRhIG10ODE3M19tbXN5c19kcml2
ZXJfZGF0YSA9IHsKPj4+IC0gICAgICAgLmNsa19kcml2ZXIgPSAiY2xrLW10ODE3My1tbSIsCj4+
PiAtfTsKPj4+IC0KPj4+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfbW1zeXNfZHJpdmVyX2Rh
dGEgbXQ4MTgzX21tc3lzX2RyaXZlcl9kYXRhID0gewo+Pj4gICAgICAgICAgLmNsa19kcml2ZXIg
PSAiY2xrLW10ODE4My1tbSIsCj4+PiAgIH07Cj4+PiBAQCAtMTA2LDE4MCArMTI0LDE5MiBAQCBz
dHJ1Y3QgbXRrX21tc3lzIHsKPj4+ICAgICAgICAgIGNvbnN0IHN0cnVjdCBtdGtfbW1zeXNfZHJp
dmVyX2RhdGEgKmRhdGE7Cj4+PiAgIH07Cj4+Pgo+Pgo+PiBbc25pcF0KPj4KPj4+ICtzdGF0aWMg
Y29uc3Qgc3RydWN0IG10a19tbXN5c19kcml2ZXJfZGF0YSBtdDgxNzNfbW1zeXNfZHJpdmVyX2Rh
dGEgPSB7Cj4+PiArICAgICAgIC5jbGtfZHJpdmVyID0gImNsay1tdDgxNzMtbW0iLAo+Pj4gKyAg
ICAgICAucm91dGVzID0gbXQ4MTczX21tc3lzX3JvdXRpbmdfdGFibGUsCj4+PiArICAgICAgIC5u
dW1fcm91dGVzID0gQVJSQVlfU0laRShtdDgxNzNfbW1zeXNfcm91dGluZ190YWJsZSksCj4+PiAr
fTsKPj4+Cj4+Cj4+IEkgcmVtb3ZlIG15IFJldmlld2VkLWJ5IHRhZy4gWW91IGRvZXMgbm90IHNl
dCByb3V0ZXMgZm9yIG10MjcwMSBhbmQKPj4gbXQyNzEyLCBidXQgdGhlc2UgdHdvIFNvQyBuZWVk
IHRoYXQuIE1heWJlIG5vdyB0aGV5IHVzZSB0aGUgc2FtZSB0YWJsZQo+PiBhcyBtdDgxNzMuCj4+
Cj4gCj4gSSBkaWQgdGhhdCBvbiBwdXJwb3NlIGFzIGV4cGxhaW5lZCBpbiB0aGUgY292ZXIgbGV0
dGVyLCBhbmQgYXNrZWQgZm9yIHNvbWVvbmUKPiB3aXRoIHRoZSBoYXJkd2FyZSB0byBwcm92aWRl
IG1lIGEgd29ya2luZyByb3V0aW5nIHRhYmxlLiBCdXQsIGlmIHlvdSB0aGluayB0aGUKPiBzYW1l
IHJvdXRpbmcgc2hvdWxkIHdvcmsgb24gdGhvc2UgZGV2aWNlcyBJJ20gZmluZSB0byB1c2UgdGhl
IHNhbWUgZm9yIGFsbCB0aGUKPiBjdXJyZW50IGRldmljZXMuIEkgZG9uJ3QgaGF2ZSB0aGF0IGhh
cmR3YXJlLCBzbyBhbnl3YXksIHdpbGwgbmVlZCB0byB0ZXN0Lgo+IAoKQnV0IHlvdSBjb3VsZCBk
ZWR1Y2UgdGhlIHJvdXRlcyBuZWVkZWQgYnkgaGF2aW5nIGEgbG9vayBpbnRvIHRoZSBjb21wb25l
bnRzIGluIAptdGtfZHJtX2Rydi5jLCBjb3JyZWN0PwpXZWxsIHNlZSBteSBvdGhlciBlbWFpbCwg
YnV0IGRlZmluaW5nIHRoZW0gdHdpY2Ugc291bmRzIGxpa2Ugbm90IGEgZ29vZCBhcHByb2FjaCAK
dG8gbWUuCgpSZWdhcmRzLApNYXR0aGlhcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
