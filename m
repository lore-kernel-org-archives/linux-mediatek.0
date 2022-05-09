Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C0FC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 12:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YDbT7cVbRYxLu+xDruzwI5obLzqHG6+2Lb9+LGueXCA=; b=ynCzU8ccZDjSV/
	RGycDfs+Mq2hrlu+F9dZ4sG7/PPZJZKQCA/vGGrQF20QobmiDI6DAs/hCv9m3it1/JT/+HZKkV9kT
	dLbiqZ+RGDK1gHJTlhCak+Wrb/6zkv2qDSrUzXx/2+IVSys8nFlZCFsvll/zdzqqByXo2HicEiLvN
	MFpJq1bY54zEakjnlRyvDf0ASor8zGrZs6Pt1JJWCC9zTbagB9amNJ2ZcyxQSt1L5OxCozF+puukG
	eHqrID1ZYLj8x9mOU76Ls36FzS6Xi4CFOvQ+K2DNMaiSoPenwix5/YRH3WZ0FvHQ0lLZfuzxpUJte
	UHFrInXlJEksjtcT4npg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no2kF-00EREs-3c; Mon, 09 May 2022 12:44:11 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no2k2-00ERAM-Vx; Mon, 09 May 2022 12:44:00 +0000
Received: by mail-pf1-x431.google.com with SMTP id c14so12151012pfn.2;
 Mon, 09 May 2022 05:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=SVrlMG9sH7kv5I9cl4/OZLrQBXySLyRLsCZbLGDjIqE=;
 b=Xi9cwvuPhW6vhymMjNEnGLjS2+mLkxi4nu2DYmB22i4hlbz2/AwKHyvl+T6RcixoHM
 zDy+Wqn7ejmxv55EiO4HmOQ4DfMV3zffSi1/xBMFtvg+ADgCZIXd8gXEVl16BGClyGCp
 dt/DN4VsFZHhCVA5nkdToHh9ZSMh2cowpfMdyG2O8MCc8AK3x8Xh5TWoxMxXa6efe+/h
 cPFMmN2r42EOVPBUmYu2cSWPEnHTWDYOo1lFWDPykG/Hg2WtScuDZLoSMrIfVqBBQkZA
 BY7e7B71BnKr2oA1byD7CJYUAnDGmjpDyg+1wHMTLJ0pqltSr8OJ6TMELYns0utsEumf
 NvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=SVrlMG9sH7kv5I9cl4/OZLrQBXySLyRLsCZbLGDjIqE=;
 b=UNpiQpbyhF77DIDZaMO3NeI43Itdpl3PbiTKfX12xDacvUD/dB0zRehQLBGbu1DJiW
 lgLqCDisnm2dit6hXL1+xXww9YQ4ci0LVbTACINm2ao0vF8502rtqLxjQEZK6c/tDKc9
 N04JJTN8jRMkAAfPEYuNqtiJATbaalJVi86AIJ9+iavJo6b2lm9Z5nEAIXntK6060QVH
 GaO/XVkTVCj1Jw9DFreGNDNG4Lzeszi7MfZXIP0wiHqxiXd+1JGpADV1jbdIyH0QbubW
 gZqNmd422aOhMLV8N5ipMq0S6mVVsdsGD5MGQUVzg4YAjkctryq3CPN5u9GBrSPTYwiE
 hV2A==
X-Gm-Message-State: AOAM531zVG7dJHuh6ywGyZg4+3LHaGH7/S9a8LJKzUswivNQRwDChnqq
 4xLy6ph0s8lBp67oGHQjvy0=
X-Google-Smtp-Source: ABdhPJz+/c4hjRHJy7STyl9bPPgXdQdXb8akW99y2Ri08rHOz09qfKgRmIitsqwn8L211TZgXqHz/w==
X-Received: by 2002:a05:6a02:287:b0:3c6:b341:e3ba with SMTP id
 bk7-20020a056a02028700b003c6b341e3bamr4911328pgb.271.1652100237895; 
 Mon, 09 May 2022 05:43:57 -0700 (PDT)
Received: from [172.30.1.40] ([14.32.163.5]) by smtp.gmail.com with ESMTPSA id
 lb5-20020a17090b4a4500b001d77f392280sm8770023pjb.30.2022.05.09.05.43.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 05:43:57 -0700 (PDT)
Message-ID: <3b6a9b8f-d550-8093-5f76-49ea70d1ad62@gmail.com>
Date: Mon, 9 May 2022 21:43:50 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 1/2] dt-bindings: interconnect: Add MediaTek CCI
 dt-bindings
Content-Language: en-US
From: Chanwoo Choi <cwchoi00@gmail.com>
To: Johnson Wang <johnson.wang@mediatek.com>, cw00.choi@samsung.com,
 krzk+dt@kernel.org, robh+dt@kernel.org, kyungmin.park@samsung.com
Cc: khilman@kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 jia-wei.chang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220425125546.4129-1-johnson.wang@mediatek.com>
 <20220425125546.4129-2-johnson.wang@mediatek.com>
 <94efefab-918d-2367-4b74-076dd6f23936@gmail.com>
In-Reply-To: <94efefab-918d-2367-4b74-076dd6f23936@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_054359_059060_CF86BACC 
X-CRM114-Status: GOOD (  12.98  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMjIuIDUuIDkuIDIxOjA5LCBDaGFud29vIENob2kgd3JvdGU6Cj4gSGksCj4gCj4gT24gMjIu
IDQuIDI1LiAyMTo1NSwgSm9obnNvbiBXYW5nIHdyb3RlOgo+PiBBZGQgZGV2aWNldHJlZSBiaW5k
aW5nIG9mIE1lZGlhVGVrIENDSSBvbiBNVDgxODMgYW5kIE1UODE4Ni4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogSm9obnNvbiBXYW5nIDxqb2huc29uLndhbmdAbWVkaWF0ZWsuY29tPgo+PiBTaWduZWQt
b2ZmLWJ5OiBKaWEtV2VpIENoYW5nIDxqaWEtd2VpLmNoYW5nQG1lZGlhdGVrLmNvbT4KPj4gLS0t
Cj4+IMKgIC4uLi9iaW5kaW5ncy9pbnRlcmNvbm5lY3QvbWVkaWF0ZWssY2NpLnlhbWzCoMKgIHwg
MTM5ICsrKysrKysrKysrKysrKysrKwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTM5IGluc2VydGlv
bnMoKykKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IAo+PiBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvaW50ZXJjb25uZWN0L21lZGlhdGVrLGNjaS55YW1sCj4+Cj4+IGRpZmYgLS1n
aXQgCj4+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVyY29ubmVjdC9t
ZWRpYXRlayxjY2kueWFtbCAKPj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aW50ZXJjb25uZWN0L21lZGlhdGVrLGNjaS55YW1sCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+
IGluZGV4IDAwMDAwMDAwMDAwMC4uZTUyMjFlMTdkMTFiCj4+IC0tLSAvZGV2L251bGwKPj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVyY29ubmVjdC9tZWRpYXRl
ayxjY2kueWFtbAo+PiBAQCAtMCwwICsxLDEzOSBAQAo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4+ICslWUFNTCAxLjIKPj4gKy0t
LQo+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9pbnRlcmNvbm5lY3QvbWVk
aWF0ZWssY2NpLnlhbWwjCj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1z
Y2hlbWFzL2NvcmUueWFtbCMKPj4gKwo+PiArdGl0bGU6IE1lZGlhVGVrIENhY2hlIENvaGVyZW50
IEludGVyY29ubmVjdCAoQ0NJKSBmcmVxdWVuY3kgYW5kIAo+PiB2b2x0YWdlIHNjYWxpbmcKPj4g
Kwo+PiArbWFpbnRhaW5lcnM6Cj4+ICvCoCAtIEppYS1XZWkgQ2hhbmcgPGppYS13ZWkuY2hhbmdA
bWVkaWF0ZWsuY29tPgo+IAo+IFdoeSBkaWQgeW91IGFkZCB5b3VyIGF1dGhvciBpbmZvcm1hdGlv
bj8KCkknbSBzb3JyeS4gSSBtaXNzZWQgJ25vdCcgYWJvdmUgc2VudGVuY2UuCklNSE8sIHBsZWFz
ZSBhZGQgeW91ciBhdXRob3IgaW5mb3JtYXRpb24uCgooc25pcCkKCgotLSAKQmVzdCBSZWdhcmRz
LApTYW1zdW5nIEVsZWN0cm9uaWNzCkNoYW53b28gQ2hvaQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
