Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A27AC00A89
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 22:34:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05D5C2151B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 22:34:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kGE8Vmt6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVpPUCDE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05D5C2151B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0xIZcbgoyij8fkyej9vM4cD+b0jCu6uhdilfIhY6SZQ=; b=kGE8Vmt68Ru7wrkD6dFnW3myO
	/2LoIZRlUSRNq8QRD8kxXTfw7vsS9ufy6g0jJ+qlYkGSSKwiQp/NEtx2E5+zySVRfBvDX2MyrK9kS
	jcA2J7OCkd1f7u9KWmysa6RaSgBYAwY+6tCJCwfka8f37JxNW44gp1QISdigZDRr0PhdKGvJC92/I
	U0j5mEsynR/9Zc+7TMGHu0xiTyfi0ACCMOjN3TDFB7XQh0hfhjLkScAsZibsG7xkbU3L8VToSgq97
	NcY+UWeF0n7nGrAs5lIvp2ChOZa8BQixh3phCpwu8ACFfuYZJs6ABC46BwfpJcLT4C0wUjmnukij4
	slmEePc5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYcyt-0004zL-BT; Fri, 30 Oct 2020 22:34:47 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYcyq-0004yg-5c; Fri, 30 Oct 2020 22:34:45 +0000
Received: by mail-ed1-x542.google.com with SMTP id l16so8296782eds.3;
 Fri, 30 Oct 2020 15:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ejZA//8CR8vKHBVBVoHn31P+SbVlR2kYuuF5lBhYi7A=;
 b=fVpPUCDET3duNIv0x/AFrK3Ozs7QKpM3wdXeOT+U9BTPVFSkRn3aTJa4YHpmWalKLX
 KYTylHbj8THL5tSL0Q9tpqubri7f5ZxDx17ILB6Fa2IbwPsZ/KPXmtDs04lUZfSERa/+
 RTVkopfN9j5hDAObRWGM6jLIxl2UrSnbEuN3HDiJjpTzSVddIUC/UvQVXD3o8YIZlJ4N
 LodVBDrSCUTRXzVVoTVfqoGSwpuY8VX9HU3fOM+w6x2xHhZKLfXYfi5xbrYFTQAFWJoK
 bhq6EW1eTjoLOzrhLo62HNkWI5mhcppjynOSx5AwW9egsTSOqY84hq10k/uS1fxSmECu
 ymwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ejZA//8CR8vKHBVBVoHn31P+SbVlR2kYuuF5lBhYi7A=;
 b=YrkNy2ggOM2QPeBd8/VgdC6NcXDMOXnppQ8ZLeVrjicTT0XrXjBJVKTISB09No+N1c
 UPiCmMUkdeGeJ+5Pss9MWH95GH32qqsVrBUbXx1cMBs8cGTeMfyYKHlB4Oo0arvBtOMb
 bqqj/CxF6cOP7faswtGKtkWL9HdaPrOC4Jz99OA9OV20x7+dGCZO1BjmoJvN9MUmxcWl
 gP13aYF6Mdty2cAGlnXXra9v4EtAf2HenKF3RxC32f6iEwR5ZUmZG5pYS7PojNGd+T7+
 vF6Wso/otD4ZhNFcPRoblxHDFaQ+b01tKHn+jOw0PXEvKg6ugZvxxqyWdUPxST7XY4+S
 APuw==
X-Gm-Message-State: AOAM5313Jbg3WtzPnIOCT0eZbPfc9uc420YMYRjfYO0AjW5AV9P7aX38
 sGKy+Lce6UM3zykjKu3J5Op+jxryj+U=
X-Google-Smtp-Source: ABdhPJyMgcKGc2OExx+BJ1jqfdmuV+OVoyy+JHRlrlq7cf4IF3iMPtBlQiUoAnN9QGoPze475i4WUw==
X-Received: by 2002:a50:871d:: with SMTP id i29mr4916526edb.300.1604097281484; 
 Fri, 30 Oct 2020 15:34:41 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:28e3:24bf:72a1:43e4?
 ([2a01:110f:b59:fd00:28e3:24bf:72a1:43e4])
 by smtp.gmail.com with ESMTPSA id e17sm3456095ejh.64.2020.10.30.15.34.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2020 15:34:40 -0700 (PDT)
Subject: Re: [PATCH v5 2/2] leds: mt6360: Add LED driver for MT6360
To: Gene Chen <gene.chen.richtek@gmail.com>
References: <1602034966-3524-1-git-send-email-gene.chen.richtek@gmail.com>
 <1602034966-3524-3-git-send-email-gene.chen.richtek@gmail.com>
 <5a9b31c4-739c-06fc-2015-ed474993ad22@gmail.com>
 <CAE+NS35Y41mFKNhj+54BeeSYFu2J9BtvMWOxyMcf9a==39cbdA@mail.gmail.com>
 <8925db23-5cc4-3c5f-932a-461fe6450dad@gmail.com>
 <CAE+NS379bgtRotqzioR+Ya3mE1kZrKfe9qV=W2p=hH7Omrn8Hw@mail.gmail.com>
 <1bb76c54-14af-6c78-4623-77c6678b262e@gmail.com>
 <CAE+NS35z7_ZUdm6gRNw2z7Ozs+1A8_Vtj_9x-F65RLd4QqDFDA@mail.gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <af17141f-23ae-063d-ade2-42dfdf611d81@gmail.com>
Date: Fri, 30 Oct 2020 23:34:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAE+NS35z7_ZUdm6gRNw2z7Ozs+1A8_Vtj_9x-F65RLd4QqDFDA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_183444_249106_74AA1711 
X-CRM114-Status: GOOD (  30.52  )
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
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, cy_huang@richtek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wilma.Wu@mediatek.com,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, shufan_lee@richtek.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMTAvMzAvMjAgOTo1MSBBTSwgR2VuZSBDaGVuIHdyb3RlOgo+IEphY2VrIEFuYXN6ZXdza2kg
PGphY2VrLmFuYXN6ZXdza2lAZ21haWwuY29tPiDmlrwgMjAyMOW5tDEw5pyIMjjml6Ug6YCx5LiJ
IOS4iuWNiDE6Mjjlr6vpgZPvvJoKPj4KPj4gT24gMTAvMjcvMjAgMTA6MjggQU0sIEdlbmUgQ2hl
biB3cm90ZToKPj4+IEphY2VrIEFuYXN6ZXdza2kgPGphY2VrLmFuYXN6ZXdza2lAZ21haWwuY29t
PiDmlrwgMjAyMOW5tDEw5pyIMjHml6Ug6YCx5LiJIOS4iuWNiDU6NDflr6vpgZPvvJoKPj4+Pgo+
Pj4+IE9uIDEwLzIwLzIwIDg6NDQgQU0sIEdlbmUgQ2hlbiB3cm90ZToKPj4+Pj4gSmFjZWsgQW5h
c3pld3NraSA8amFjZWsuYW5hc3pld3NraUBnbWFpbC5jb20+IOaWvCAyMDIw5bm0MTDmnIg55pel
IOmAseS6lCDkuIrljYg1OjUx5a+r6YGT77yaCj4+Pj4+Pgo+Pj4+Pj4gSGkgR2VuZSwKPj4+Pj4+
Cj4+Pj4+PiBPbiAxMC83LzIwIDM6NDIgQU0sIEdlbmUgQ2hlbiB3cm90ZToKPj4+Pj4+PiBGcm9t
OiBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPj4+Pj4+Pgo+Pj4+Pj4+IEFkZCBN
VDYzNjAgTEVEIGRyaXZlciBpbmNsdWRlIDItY2hhbm5lbCBGbGFzaCBMRUQgd2l0aCB0b3JjaC9z
dHJvYmUgbW9kZSwKPj4+Pj4+PiAzLWNoYW5uZWwgUkdCIExFRCBzdXBwb3J0IFJlZ2lzdGVyL0Zs
YXNoL0JyZWF0aCBNb2RlLCBhbmQgMS1jaGFubmVsIGZvcgo+Pj4+Pj4+IG1vb25saWdodCBMRUQu
Cj4+Pj4+Pj4KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNo
dGVrLmNvbT4KPj4+Pj4+PiAtLS0KPj4+Pj4+PiAgICAgIGRyaXZlcnMvbGVkcy9LY29uZmlnICAg
ICAgIHwgIDEyICsKPj4+Pj4+PiAgICAgIGRyaXZlcnMvbGVkcy9NYWtlZmlsZSAgICAgIHwgICAx
ICsKPj4+Pj4+PiAgICAgIGRyaXZlcnMvbGVkcy9sZWRzLW10NjM2MC5jIHwgNzgzICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4+Pj4+ICAgICAgMyBmaWxl
cyBjaGFuZ2VkLCA3OTYgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4+ICAgICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvbGVkcy9sZWRzLW10NjM2MC5jCj4+Pj4+Pj4KPj4+Pj4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9sZWRzL0tjb25maWcgYi9kcml2ZXJzL2xlZHMvS2NvbmZpZwo+Pj4+Pj4+IGlu
ZGV4IDFjMTgxZGYuLmM3MTkyZGQgMTAwNjQ0Cj4+Pj4+Pj4gLS0tIGEvZHJpdmVycy9sZWRzL0tj
b25maWcKPj4+Pj4+PiArKysgYi9kcml2ZXJzL2xlZHMvS2NvbmZpZwo+Pj4+Pj4+IEBAIC0yNzEs
NiArMjcxLDE4IEBAIGNvbmZpZyBMRURTX01UNjMyMwo+Pj4+Pj4+ICAgICAgICAgICAgVGhpcyBv
cHRpb24gZW5hYmxlcyBzdXBwb3J0IGZvciBvbi1jaGlwIExFRCBkcml2ZXJzIGZvdW5kIG9uCj4+
Pj4+Pj4gICAgICAgICAgICBNZWRpYXRlayBNVDYzMjMgUE1JQy4KPj4+Pj4+Pgo+Pj4+Pj4+ICtj
b25maWcgTEVEU19NVDYzNjAKPj4+Pj4+PiArICAgICB0cmlzdGF0ZSAiTEVEIFN1cHBvcnQgZm9y
IE1lZGlhdGVrIE1UNjM2MCBQTUlDIgo+Pj4+Pj4+ICsgICAgIGRlcGVuZHMgb24gTEVEU19DTEFT
U19GTEFTSCAmJiBPRgo+Pj4+Pj4+ICsgICAgIGRlcGVuZHMgb24gTEVEU19DTEFTU19NVUxUSUNP
TE9SCj4+Pj4+Pgo+Pj4+Pj4gU2luY2UgQ09ORklHX0xFRF9DTEFTU19NVUxUSUNPTE9SIGNhbiBi
ZSB0dXJuZWQgb2ZmIHlvdSBuZWVkIHRvIGhhdmUKPj4+Pj4+IGJlbG93IGluc3RlYWQ6Cj4+Pj4+
Pgo+Pj4+Pj4gZGVwZW5kcyBvbiBMRURTX0NMQVNTX01VTFRJQ09MT1IgfHwgISFMRURTX0NMQVNT
X01VTFRJQ09MT1IKPj4KPj4gTXkgdHlwbyBoZXJlLCBzaG91bGQgYmUgb25lICIhIjoKPj4KPj4g
ZGVwZW5kcyBvbiBMRURTX0NMQVNTX01VTFRJQ09MT1IgfHwgIUxFRFNfQ0xBU1NfTVVMVElDT0xP
Ugo+Pgo+PiBBbmQgeW91IHNob3VsZCBhbHNvIGhhdmUKPj4KPj4gZGVwZW5kcyBvbiBMRURTX0NM
QVNTX0ZMQVNIIHx8ICFMRURTX0NMQVNTX0ZMQVNICj4+Cj4+IEJ1dCB0byBtYWtlIGl0IHdvcmsg
Y29ycmVjdGx5IHlvdSB3b3VsZCBoYXZlIHRvIGFkZCByZWdpc3RyYXRpb24KPj4gc3R1YnMgdG8g
aW5jbHVkZS9saW51eC9sZWQtY2xhc3MtZmxhc2guaCBzaW1pbGFybHkgdG8gTEVEIG1jIHN0dWJz
Cj4+IGluIGluY2x1ZGUvbGludXgvbGVkLWNsYXNzLW11bHRpY29sb3IuaC4KPj4KPj4+Pj4+Cj4+
Pj4+PiBVbmxlc3MgeW91IHdhbnQgdG8gcHJldmVudCBlbmFibGluZyB0aGUgZHJpdmVyIHdpdGhv
dXQgUkdCIExFRCwKPj4+Pj4+IGJ1dCB0aGF0IGRvZXMgbm90IHNlZW0gdG8gYmUgcmVhc29uYWJs
ZSBhdCBmaXJzdCBnbGFuY2UuCj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBNYXkgSSBjaGFuZ2UgdG8gInNl
bGVjdCBMRURTX0NMQVNTX01VTFRJQ09MT1IiPwo+Pj4+PiBJIHN1cHBvc2UgUkdCIGFsd2F5cyB1
c2UgbXVsdGljb2xvciBtb2RlLgo+Pj4+Cj4+Pj4gWW91IHdpbGwgYWxzbyBoYXZlIG1vb25saWdo
dCBMRUQgdGhhdCB3aWxsIG5vdCBuZWVkIG11bHRpY29sb3IKPj4+PiBmcmFtZXdvcmsuIElzIGl0
IHNvbWVob3cgdHJvdWJsZXNvbWUgdG8ga2VlcCAiZGVwZW5kcyBvbiI/Cj4+Pj4KPj4+Cj4+PiBJ
ZiBvbmx5IHVzZSBNTCBMRUQgYW5kIEZMRUQsICBEVFNJIHdpbGwgb25seSBkZWZpbmUgTUwgTEVE
IGFuZCBGTEVELgo+Pj4gVGhlcmVmb3JlLCB0aGUgZHJpdmVycyBwcm9iZSB3aWxsIG5vdCByZWdp
c3RlciByZ2IgbXVsdGljb2xvciBkZXZpY2UuCj4+Cj4+IFBsZWFzZSB0ZXN0IHlvdXIgdXNlIGNh
c2UgYWdhaW4gd2l0aCBteSBmaXhlZCAiZGVwZW5kcyBvbiIuCj4+Cj4+IEluIGNhc2Ugd2hlbiB0
aGVyZSBpcyBvbmx5IE1MIExFRCBhbmQgRkxFRCBpbiB0aGUgRFQgaXQgc2hvdWxkCj4+IHJlZ2lz
dGVyIGJvdGggZGV2aWNlcyBpZiBMRURTX0NMQVNTX0ZMQVNIIGlzIHR1cm5lZCBvbi4KPj4gTXVs
dGljb2xvciBmcmFtZXdvcmsgaGFzIG5vdGhpbmcgdG8gZG8gaW4gdGhpcyBjYXNlLgo+Pgo+PiBC
dXQgaWYgeW91IGFkZGl0aW9uYWxseSBoYWQgTUMgTEVEIG5vZGUsIHRoZW4gaXQgc2hvdWxkCj4+
IGJlIHJlZ2lzdGVyZWQgb25seSBpZiBMRURTX0NMQVNTX01VTFRJQ09MT1IgaXMgZW5hYmxlZC4K
Pj4KPj4gU2ltaWxhcmx5LCB3aGVuIEZMRUQgbm9kZSBpcyBwcmVzZW50LCBidXQgTEVEU19DTEFT
U19GTEFTSAo+PiBpcyBvZmYsIGFuZCBMRURTX0NMQVNTX01VTFRJQ09MT1IgaXMgb24sIHRoZSBk
cml2ZXIgc2hvdWxkIHN0aWxsCj4+IGNvbXBpbGUsIGJ1dCByZWdpc3RlciBvbmx5IExFRCBNQyBk
ZXZpY2UgKGlmIGl0cyBub2RlIGlzIHByZXNlbnQpLgo+Pgo+IAo+IEkgdGhpbmsgdGhpcyBjYXNl
IG9ubHkgcmVnaXN0ZXIgTEVEIGRldmljZSwgbm90IExFRCAiTUMiIGRldmljZS4KPiBCZWNhdXNl
IG91ciBGTEFTSCBpcyBub3QgYSBtdWx0aWNvbG9yIGRldmljZS4KCk5vLCBoZXJlIEkgd2FzIGRl
c2NyaWJpbmcgZm9sbG93aW5nIHNldHVwOgoKLSBEVCBGTEVEIG5vZGUgaXMgcHJlc2VudCwgQ09O
RklHX0xFRFNfQ0xBU1NfRkxBU0ggaXMgb2ZmCi0gRFQgTUMgbm9kZSBpcyBwcmVzZW50LCBDT05G
SUdfTEVEU19DTEFTU19NVUxUSUNPTE9SIGlzIG9uCgpNTCBMRUQgcHJlc2VuY2UgaW4gRFQgaXMg
aXJyZWxldmFudCBpbiB0aGlzIGNhc2UuCkl0IHNob3VsZCBiZSBhbHdheXMgcmVnaXN0ZXJlZCBp
ZiB0aGVyZSBpcyBjb3JyZXNwb25kaW5nIERUIG5vZGUKYW5kIExFRFNfQ0xBU1MgaXMgb24uCgo+
IAo+PiBQb3NzaWJsZSBzaG91bGQgYmUgYWxzbyB0aGUgY2FzZSB3aGVuIGJvdGggTEVEU19DTEFT
U19GTEFTSAo+PiBhbmQgTEVEU19DTEFTU19NVUxUSUNPTE9SIGFyZSBvZmYuIFRoZW4gb25seSBM
RUQgY2xhc3MgZGV2aWNlCj4+IGZvciBNTCBMRUQgd2lsbCBiZSByZWdpc3RlcmVkIChwcm92aWRl
ZCB0aGVyZSBpcyBNTCBEVCBub2RlKS4KPj4gQnV0IHRvIG1ha2UgaXQgcG9zc2libGUgeW91IHNo
b3VsZCBoYXZlIGFsc28gImRlcGVuZHMgb24gTEVEU19DTEFTUyIKPj4gaW4gdGhlIEtjb25maWcg
ZW50cnkuCj4+Cj4gCj4gQWNjb3JkaW5nIHRvIHlvdXIgc3VnZ2VzdGlvbiwKPiBkZXBlbmRzIG9u
IExFRF9DTEFTUyAmJiBMRURTX0NMQVNTX0ZMQVNIICYmIE9GCgpzL0xFRF9DTEFTUy9MRURTX0NM
QVNTLwoKQW5kIHlvdSBoYXZlIHRvIHJlbW92ZSBMRURTX0NMQVNTX0ZMQVNIIGZyb20gYWJvdmUg
bGluZS4KCj4gZGVwZW5kcyBvbiBMRURTX0NMQVNTX01VTFRJQ09MT1IgfHwgISFMRURTX0NMQVNT
X01VTFRJQ09MT1IKCnMvISFMRURTX0NMQVNTX01VTFRJQ09MT1IvIUxFRFNfQ0xBU1NfTVVMVElD
T0xPUi8KCj4gZGVwZW5kcyBvbiBMRURTX0NMQVNTX0ZMQVNIIHx8ICFMRURTX0NMQVNTX0ZMQVNI
Cj4gZGVwZW5kcyBvbiBNRkRfTVQ2MzYwCgpZb3Ugd2lsbCBuZWVkIFY0TDJfRkxBU0hfTEVEX0NM
QVNTIGRlcGVuZGVuY3kgYXMgd2VsbCwgdG8gYXZvaWQKYnVpbGQgYnJlYWssIHdoZW4gaXQgaXMg
c2V0IHRvICdtJy4KClRvIHJlY2FwLCBmb2xsb3dpbmcgYmxvY2sgb2YgZGVwZW5kZW5jaWVzIGlz
IHJlcXVpcmVkOgoKZGVwZW5kcyBvbiBMRURTX0NMQVNTICYmIE9GCmRlcGVuZHMgb24gTEVEU19D
TEFTU19NVUxUSUNPTE9SIHx8ICFMRURTX0NMQVNTX01VTFRJQ09MT1IKZGVwZW5kcyBvbiBMRURT
X0NMQVNTX0ZMQVNIIHx8ICFMRURTX0NMQVNTX0ZMQVNICmRlcGVuZHMgb24gVjRMMl9GTEFTSF9M
RURfQ0xBU1MgfHwgIVY0TDJfRkxBU0hfTEVEX0NMQVNTCmRlcGVuZHMgb24gTUZEX01UNjM2MAoK
PiAKPiBhbmQgc291cmNlIGNvZGUgYWRkIGNvbnN0cmFpbnQKPiAKPiAjaWYgSVNfRU5BQkxFRChD
T05GSUdfTEVEU19DTEFTU19NVUxUSUNPTE9SKQo+ICAgICAgcmV0ID0gZGV2bV9sZWRfY2xhc3Nk
ZXZfbXVsdGljb2xvcl9yZWdpc3Rlcl9leHQocGFyZW50LCAmbGVkLT5yZ2IsCj4gaW5pdF9kYXRh
KTsKPiAjZW5kaWYKPiAKPiAjaWYgSVNfRU5BQkxFRChDT05GSUdfTEVEU19DTEFTU19GTEFTSCkK
PiAgICAgIHJldCA9IGRldm1fbGVkX2NsYXNzZGV2X2ZsYXNoX3JlZ2lzdGVyX2V4dChwYXJlbnQs
ICZsZWQtPmZsYXNoLCBpbml0X2RhdGEpOwo+ICNlbmRpZgoKTm8sIHRoZSBndWFyZHMgc2hvdWxk
IGJlIGluIGhlYWRlcnMuIFRoYXQncyB3aHkgSSByZWNvbW1lbmRlZCBhZGRpbmcKbm8gb3BzIGZv
ciBMRUQgZmxhc2ggY2xhc3MgcmVnaXN0cmF0aW9uIGZ1bmN0aW9ucyBpbiBwcmV2aW91cyBlbWFp
bC4KClBsZWFzZSBjb21wYXJlIGluY2x1ZGUvbGludXgvbGVkLWNsYXNzLW11bHRpY29sb3IuaCBh
bmQgZG8gc2ltaWxhciAKY2hhbmdlcyBpbiBpbmNsdWRlL2xpbnV4L2xlZC1jbGFzcy1mbGFzaC5o
LgoKPiA9PT09PT09PT09PT09Cj4gCj4gT3IgU2hvdWxkIEkgc2VwZXJhdGUgdHdvIGRyaXZlcnM/
Cj4gb25lIGZvciBSR0IgTEVELCBvbmUgZm9yIE1MIExFRCBhbmQgRkxFRAoKVGhpcyB3b3VsZCBp
bmN1ciB1bm5lY2Vzc2FyeSBjb2RlIGR1cGxpY2F0aW9uLgoKLS0gCkJlc3QgcmVnYXJkcywKSmFj
ZWsgQW5hc3pld3NraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlawo=
