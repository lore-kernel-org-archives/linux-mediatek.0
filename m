Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39BE4C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:43:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C033261924
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C033261924
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lXTeeBTRoHCe7UBAzA6FZyCWw9z47Pn+SYyMEvBsTEE=; b=opP6JgQMZX4u5bA66cEQmh+tQ
	fDLFjziEVQ4OcG+pX2sw8Qg/P/RjnaHkvznE88DO7hXi/QjRN3i83dTBAWfpF85Lri6RekIdh2Yqe
	hym2kACFFP9ZJVTfiw3UgIy95nocEv0rp/MtqeyxH9kh0UEYIH9LFGeTt/WxUIFdPPTmVikNwW3Wj
	AEpKvpUJoyVe/LdtlbyG/TduDIEcPLUFAVY8SKdrFvYRy5Xs5KPWWkB7uuuN7IS3UdecxzoGclWDt
	y9kc886NZDPLn/bn9UGPr1uUxQImetzrgz+Uayh9OahAHsDr1hn+N9Hf/wVGAa9VoHnoTrYUOwbjo
	SLEqkNMJw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR1Wx-0020Qg-8a; Mon, 29 Mar 2021 23:42:47 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQvQz-000sE9-8z; Mon, 29 Mar 2021 17:12:19 +0000
Received: by mail-wr1-x42f.google.com with SMTP id x7so13606200wrw.10;
 Mon, 29 Mar 2021 10:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Rqpj3tJ8Hp0uec22wW3HCaakBv7Gn530wlfuwOnGxhw=;
 b=svjoxxu8FXf762k81J7JdAXqRNI+vJYzDQsRHhKReveRENd5hA/nL4sxdOCM8Tpw2b
 jms8DR+rMzQA+E8eHeSxAVD3gBLZ0fmbX/nOvEs+yhJ9Cd7NHwaNkZp+6OMruZL7M3nM
 14EtQNaq1ZeRqx4VQSZFvbGHGPL3ZCJLyZudwVwVvev+WX/qHbvM6oZ7IFuRyCWjne47
 tFZWU54daMIHV/6GmTa5DpzB0aa2HZj6beq9z4vBy8FmPAR6LWLmL1RW32gmhrG/1E77
 bmiftc2mdowy7poAXlHwHXUi+hKWTLswhIfff4RDuRi+cqB8Ur8iKbAaEVKicuXnjvJh
 uddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Rqpj3tJ8Hp0uec22wW3HCaakBv7Gn530wlfuwOnGxhw=;
 b=FgGgfUKZ7ur8VquKcqC8bdasNqcx5InOom/8YkOr8wU0DFhGqxp882xz6JNhaQStJM
 BnbwrDjZc8KkAcfin8Se28l3vzfY8MIHBu0NU3GZRfcTwtgxV+MVG2NLleQBnt4VSx/u
 g5b7Mxmw9tgrPxZv/rEJgko4jKqon+K77dyReGN3TILDM4fD8teTZxCQOGAGW4+8Ka9x
 +Jobu7PdHFb2OW1JJoKRthmDk81lsg7ankEVXgtpjEZf0zP/mzvbyqJdtEE/lrCRLcod
 6YOsuJqf6896fmhYWALFLCbfQK46pn7siYoWJwWSWziBYwb6grNUaLeBHzoiPdNDlluz
 x9qw==
X-Gm-Message-State: AOAM532QZKNgOcjfsiJLqtUn7KimJuKf2ukn5plZAFsxEwT8C31KWexd
 ejjrMIABtc+uQeoeMXXWgxg=
X-Google-Smtp-Source: ABdhPJwutr/FGR0+TNlVNDBj+Z8mVQFMNgwXhcRLsKhhcyvZ+gR2gDLvdYZOR88VUK8ix8W0Ot/K+g==
X-Received: by 2002:a05:6000:137b:: with SMTP id
 q27mr30057996wrz.168.1617037932014; 
 Mon, 29 Mar 2021 10:12:12 -0700 (PDT)
Received: from ziggy.stardust (80.174.240.175.dyn.user.ono.com.
 [80.174.240.175])
 by smtp.gmail.com with ESMTPSA id g11sm30636553wrw.89.2021.03.29.10.12.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 10:12:11 -0700 (PDT)
Subject: Re: [v7,2/3] arm64: dts: mt8183: Configure CPU cooling
To: Michael Kao <michael.kao@mediatek.com>, fan.chen@mediatek.com,
 Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-pm@vger.kernel.org, srv_heupstream@mediatek.com
Cc: Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, hsinyi@chromium.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matthias Kaehlcke <mka@chromium.org>
References: <20210316070144.28440-1-michael.kao@mediatek.com>
 <20210316070144.28440-3-michael.kao@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <25e4c77d-7548-a135-3f94-4f6224de1f91@gmail.com>
Date: Mon, 29 Mar 2021 19:12:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316070144.28440-3-michael.kao@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_181216_674932_94D8F921 
X-CRM114-Status: GOOD (  18.17  )
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

CgpPbiAxNi8wMy8yMDIxIDA4OjAxLCBNaWNoYWVsIEthbyB3cm90ZToKPiBGcm9tOiBNYXR0aGlh
cyBLYWVobGNrZSA8bWthQGNocm9taXVtLm9yZz4KPiAKPiBBZGQgdHdvIHBhc3NpdmUgdHJpcCBw
b2ludHMgYXQgNjjCsEMgYW5kIDgwwrBDIGZvciB0aGUgQ1BVIHRlbXBlcmF0dXJlLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IE1hdHRoaWFzIEthZWhsY2tlIDxta2FAY2hyb21pdW0ub3JnPgo+IFNpZ25l
ZC1vZmYtYnk6IE1pY2hhZWwgS2FvIDxtaWNoYWVsLmthb0BtZWRpYXRlay5jb20+Cj4gVGVzdGVk
LWJ5OiBIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+CgpBcHBsaWVkIHRvIHY1LjEy
LW5leHQvZHRzNjQKClRoYW5rcy4KTWF0dGhpYXMKCgoKPiAtLS0KPiAgYXJjaC9hcm02NC9ib290
L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaSB8IDU2ICsrKysrKysrKysrKysrKysrKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9tdDgxODMuZHRzaQo+IGluZGV4IGQzNTUwYWYwNjQwOC4uMWFkMGExZDU1ZDUz
IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kK
PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My5kdHNpCj4gQEAgLTEz
LDYgKzEzLDcgQEAKPiAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Bvd2VyL210ODE4My1wb3dlci5o
Pgo+ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9tdDgxODMtcmVzZXRz
Lmg+Cj4gICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9waHkvcGh5Lmg+Cj4gKyNpbmNsdWRlIDxkdC1i
aW5kaW5ncy90aGVybWFsL3RoZXJtYWwuaD4KPiAgI2luY2x1ZGUgIm10ODE4My1waW5mdW5jLmgi
Cj4gIAo+ICAvIHsKPiBAQCAtNjc4LDYgKzY3OSw2MSBAQAo+ICAJCQkJcG9sbGluZy1kZWxheSA9
IDw1MDA+Owo+ICAJCQkJdGhlcm1hbC1zZW5zb3JzID0gPCZ0aGVybWFsIDA+Owo+ICAJCQkJc3Vz
dGFpbmFibGUtcG93ZXIgPSA8NTAwMD47Cj4gKwo+ICsJCQkJdHJpcHMgewo+ICsJCQkJCXRocmVz
aG9sZDogdHJpcC1wb2ludEAwIHsKPiArCQkJCQkJdGVtcGVyYXR1cmUgPSA8NjgwMDA+Owo+ICsJ
CQkJCQloeXN0ZXJlc2lzID0gPDIwMDA+Owo+ICsJCQkJCQl0eXBlID0gInBhc3NpdmUiOwo+ICsJ
CQkJCX07Cj4gKwo+ICsJCQkJCXRhcmdldDogdHJpcC1wb2ludEAxIHsKPiArCQkJCQkJdGVtcGVy
YXR1cmUgPSA8ODAwMDA+Owo+ICsJCQkJCQloeXN0ZXJlc2lzID0gPDIwMDA+Owo+ICsJCQkJCQl0
eXBlID0gInBhc3NpdmUiOwo+ICsJCQkJCX07Cj4gKwo+ICsJCQkJCWNwdV9jcml0OiBjcHUtY3Jp
dCB7Cj4gKwkJCQkJCXRlbXBlcmF0dXJlID0gPDExNTAwMD47Cj4gKwkJCQkJCWh5c3RlcmVzaXMg
PSA8MjAwMD47Cj4gKwkJCQkJCXR5cGUgPSAiY3JpdGljYWwiOwo+ICsJCQkJCX07Cj4gKwkJCQl9
Owo+ICsKPiArCQkJCWNvb2xpbmctbWFwcyB7Cj4gKwkJCQkJbWFwMCB7Cj4gKwkJCQkJCXRyaXAg
PSA8JnRhcmdldD47Cj4gKwkJCQkJCWNvb2xpbmctZGV2aWNlID0gPCZjcHUwCj4gKwkJCQkJCQlU
SEVSTUFMX05PX0xJTUlUCj4gKwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUPiwKPiArCQkJCQkJCQkg
PCZjcHUxCj4gKwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUCj4gKwkJCQkJCQlUSEVSTUFMX05PX0xJ
TUlUPiwKPiArCQkJCQkJCQkgPCZjcHUyCj4gKwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUCj4gKwkJ
CQkJCQlUSEVSTUFMX05PX0xJTUlUPiwKPiArCQkJCQkJCQkgPCZjcHUzCj4gKwkJCQkJCQlUSEVS
TUFMX05PX0xJTUlUCj4gKwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUPjsKPiArCQkJCQkJY29udHJp
YnV0aW9uID0gPDMwNzI+Owo+ICsJCQkJCX07Cj4gKwkJCQkJbWFwMSB7Cj4gKwkJCQkJCXRyaXAg
PSA8JnRhcmdldD47Cj4gKwkJCQkJCWNvb2xpbmctZGV2aWNlID0gPCZjcHU0Cj4gKwkJCQkJCQlU
SEVSTUFMX05PX0xJTUlUCj4gKwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUPiwKPiArCQkJCQkJCQkg
PCZjcHU1Cj4gKwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUCj4gKwkJCQkJCQlUSEVSTUFMX05PX0xJ
TUlUPiwKPiArCQkJCQkJCQkgPCZjcHU2Cj4gKwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUCj4gKwkJ
CQkJCQlUSEVSTUFMX05PX0xJTUlUPiwKPiArCQkJCQkJCQkgPCZjcHU3Cj4gKwkJCQkJCQlUSEVS
TUFMX05PX0xJTUlUCj4gKwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUPjsKPiArCQkJCQkJY29udHJp
YnV0aW9uID0gPDEwMjQ+Owo+ICsJCQkJCX07Cj4gKwkJCQl9Owo+ICAJCQl9Owo+ICAKPiAgCQkJ
LyogVGhlIHR6dHMxIH4gdHp0czYgZG9uJ3QgbmVlZCB0byBwb2xsaW5nICovCj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
