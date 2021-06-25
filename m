Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF6CC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 12:50:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 038A16191E
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 12:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 038A16191E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9197FDVQcCTzOEN4sizoc7uxbuHQ9jGMyrUDF8dyess=; b=Dvbk0MsPzhBjFOFb2a20WVAXjQ
	LSbx6FRFDQv3MbaZJa9BlTnkU2rRGuneUzKFaojP7sK0bfnVkOYLLSt538lGs79gecLGqeqA2ZDwb
	Sajv812oDRB6dqKSX02C46xdiMv0wvINfc0Tuv58Vb/AluNbzxkSCzIYU9X0ZYyaIwRis1dQQP6xR
	g26vXhJtuO2/UyROAwNP1VvXJS3cry035Cmvi7Nz0h3jwbttEyDRFrkSG88zmTY2Kxs1pKt7AQWO0
	4pi8eJVvsoXJ5pspTt6QxAnj5CxnoSBjUM7m7D8NhNo3n+3SyISEkMVpr6rVPttqbqoWlFTQ+ChXK
	Ysk9S28A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwlIH-001Y7T-4J; Fri, 25 Jun 2021 12:50:49 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwlID-001Y6N-Su
 for linux-mediatek@lists.infradead.org; Fri, 25 Jun 2021 12:50:47 +0000
Received: by mail-wm1-x330.google.com with SMTP id u20so1011014wmq.4
 for <linux-mediatek@lists.infradead.org>; Fri, 25 Jun 2021 05:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3q2hj4q9wB8qmp/YlfpN0DitbMNMAnSRweZBDiZqwXI=;
 b=nCMQS4V942hTCkeHgxA5/hEOu5cPVhFPhcac/zVO69YAnYxFN/NndoZcso0bfuYydH
 evwv7ssyZd15LAc0o0n7VyiK5oa5Adt1MqboygueCw425lfHchnTOs8B57YnjvNcyBfH
 kCn2U6NXctjo6zE8t02d0a76AfURC4hX8frMXKo73+oGd2X0TcGZcc2IZRMMTS/4QzjZ
 EkzM4vMS5Hdicav8JSuHPiBk4XRQ/CNpJ1aJwFu5V2CpfNmxhgdXAY7CEbKJ2nrzPalm
 mvrzmzWrV4WX2rjjtrtd7cIyXGlsiJHcMF1P75EWSiSHrwSEZ2HPFdUXU/H2DeRhuUWS
 6HWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3q2hj4q9wB8qmp/YlfpN0DitbMNMAnSRweZBDiZqwXI=;
 b=Bqhup2SGFt0vcp15Io37QBNPt2LsNVDfvkHDK4scnFp1c/fqqy3ULOVu2OsrIiq4Or
 j+gMc5mpd7oa5HHlT+WN9re9Ni/IEg4PKSyK4NZ8mXH4eeRF+S2algjrW8DIGQNyKP6q
 F8bDmKnm4m6yooQTsng0O3UfioHw0sMzai+YIctNgdebw2F9UFTVc9Brcle+Vywd7TAG
 cLgvyHEkhnvohbbFs/NsUwbHJMiWOsoKVcmpiC15uMPMgtlIEICStJtH5vmDpnrC6V1m
 LJrG1Ij1Kzajo3tUC/kcT18VNFV+zK2mEaZH5LIWMUWVHsOV0mdmHVkcdxN46zIqcT78
 4N+Q==
X-Gm-Message-State: AOAM531VocaeqgdpKu31cLfXbrMgoRLLAUJhQkgZgIAJwsEdjJ/itePk
 hCwuPUAWufrEYXisF6KAseY84A==
X-Google-Smtp-Source: ABdhPJwepCnbNjUznqf4+se6+PE93Avwc76AApO0H/TB3qvRp25uhoHT+KCcmO076e1O/A//zhMUAg==
X-Received: by 2002:a1c:f215:: with SMTP id s21mr10500015wmc.179.1624625444006; 
 Fri, 25 Jun 2021 05:50:44 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:c52d:3cc5:c823:ade0?
 ([2a01:e34:ed2f:f020:c52d:3cc5:c823:ade0])
 by smtp.googlemail.com with ESMTPSA id s5sm6177768wrn.38.2021.06.25.05.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 05:50:43 -0700 (PDT)
Subject: Re: Aw: Re: Re: Re: [PATCH] Fix mt7622.dtsi thermal cpu
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Eric Woudstra <ericwouds@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Daniel Golle <daniel@makrotopia.org>
References: <20210619121927.32699-1-ericwouds@gmail.com>
 <e30a2d01-a200-80cb-88d9-6aea62dd49f1@linaro.org>
 <56fb5540-fb86-4e6a-a596-1276026b37e5@gmail.com>
 <a4e41929-6ab4-fabb-741e-f25a5fd14e3b@linaro.org>
 <47261865-00e3-41eb-bb36-2b939f81f1e8@gmail.com>
 <fb633034-96e5-6165-b43f-290ae1a65cfd@linaro.org>
 <189b52d5-b103-43e1-a64f-1e627fbc75af@gmail.com>
 <173e6bab-9d21-eb28-9b91-a5f80c01fd03@linaro.org>
 <3dd22cf2-1186-4870-aa49-e5cddc18c6e9@gmail.com>
 <trinity-7580d955-3187-41e5-9297-1ac8f628a9d5-1624609003739@3c-app-gmx-bs66>
 <8b27246b-721e-fa0e-5c2b-b1b4b4d6fdd3@linaro.org>
 <trinity-2eb7c0ac-d9dc-446c-8907-69b5f4df6838-1624618996538@3c-app-gmx-bs66>
 <915b101a-6bea-ae96-78ed-d27fa5bfce3a@linaro.org>
 <trinity-59bd4461-3429-4382-9754-90cf20287cad-1624624111998@3c-app-gmx-bs66>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <67107afb-6ed9-9681-6fce-0d52e567ea12@linaro.org>
Date: Fri, 25 Jun 2021 14:50:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <trinity-59bd4461-3429-4382-9754-90cf20287cad-1624624111998@3c-app-gmx-bs66>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_055045_986318_746780B1 
X-CRM114-Status: GOOD (  29.06  )
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

T24gMjUvMDYvMjAyMSAxNDoyOCwgRnJhbmsgV3VuZGVybGljaCB3cm90ZToKPj4gR2VzZW5kZXQ6
IEZyZWl0YWcsIDI1LiBKdW5pIDIwMjEgdW0gMTM6NDcgVWhyCj4+IFZvbjogIkRhbmllbCBMZXpj
YW5vIiA8ZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZz4KPiAKPj4+IGJ1dCB3ZSBuZWVkIHRvIGRp
c2FibGUgdGhlIHBhc3NpdmUgdHJpcCBhcyBjcHUtdHJvdHRlbGluZyBzdGFydHMgdGhlcmUuLi50
aGUgaGlnaGVyIHRlbXBlcmF0dXJlIHRyaXBzIGFyZSBjdXJyZW50bHkgbm90IHJlYWNoZWQKPj4K
Pj4gU29ycnksIGNhbiB5b3UgcmVwaHJhc2UgaXQgPyBJJ20gbm90IGdldHRpbmcgdGhlIHBvaW50
Lgo+IAo+IHRoZSBwcm9ibGVtIGN1cnJlbnRseSBpcyB0aGF0IHBhc3NpdmUgaXMgYXQgNDdkZWdy
ZXNzIENlbHNpdXMgYW5kCj4gdHJvdHRsZXMgY3B1LCBhY3RpdmUgKDY3wrBDKSBhbmQgaG90IHBv
aW50cyBhcmUgbmV2ZXIgcmVhY2hlZCB0aGlzIHdheS4KPiBzbyBhdCBsZWFzdCB3ZSBuZWVkIHRv
IGNoYW5nZSB0ZW1wZXJhdHVyZXMgaW4gZHRzaSwgYW5kIG1heWJlIGRpc2FibGUKPiBjcHUtdHJv
dHRlbGluZyBvbiBwYXNzaXZlIHRyaXAuIGltaG8gZmFuIHdpbGwgbmV2ZXIgc3RhcnQgaWYgaXQg
aXMgaW4KPiBhY3RpdmUgYW5kIGNwdSBpcyB0cm90dGxlZCBiZWZvcmUgaW4gcGFzc2l2ZQoKT2ss
IHRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24uCgo+Pj4gc3VtbWFyeQo+Pj4KPj4+IG1vdmlu
ZyBmYW4gYW5kIGNwdV90aGVybWFsLW92ZXJyaWRlIHRvIGJhbmFuYXBpLXI2NC5kdHMKPj4+Cj4+
PiBwYXNzaXZlLXRyaXA6IGNvb2xpbmctZGV2aWNlID0gPCZjcHUwLzEgMCAwPiBhcyBpbiBlcmlj
cyBQYXRjaAo+Pj4gYWN0aXZlIHRyaXA6IGNvb2xpbmctZGV2aWNlID0gPCZmYW4wIFRIRVJNQUxf
Tk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD47Cj4+PiB0aGUgb3RoZXIgMiB1bmNoYW5nZWQKPj4+
Cj4+PiBidXQgaSBzdWdnZXN0IGNoYW5naW5nIHRoZSB0ZW1wZXJhdHVyZSBwb2ludHMgaW4gbXQ3
NjIyIGR0c2kgYXMgdGhpcyBpcyBTb0Mgc3BlY2lmaWMKPj4+Cj4+PiBzbyBiYXNpY2x5Ogo+Pj4K
Pj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ3NjIyLmR0c2kKPj4+ICsr
KyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ3NjIyLmR0c2kKPj4+IEBAIC0xNDMs
MTMgKzE0MywxMyBAQCBjcHVfdGhlcm1hbDogY3B1LXRoZXJtYWwgewo+Pj4KPj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgIHRyaXBzIHsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY3B1X3Bhc3NpdmU6IGNwdS1wYXNzaXZlIHsKPj4+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB0ZW1wZXJhdHVyZSA9IDw0NzAwMD47Cj4+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdGVtcGVyYXR1cmUgPSA8NzAwMDA+Owo+Pgo+PiBN
YXkgYmUgaW5jcmVhc2UgdGhlIHBhc3NpdmUgdGVtcCB0byA3NcKwQy4KPj4KPj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoeXN0ZXJlc2lzID0gPDIwMDA+Owo+Pj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHR5cGUgPSAicGFzc2l2ZSI7
Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH07Cj4+Pgo+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjcHVfYWN0aXZlOiBjcHUtYWN0aXZlIHsKPj4+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0ZW1wZXJhdHVyZSA9IDw2NzAwMD47
Cj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGVtcGVyYXR1cmUg
PSA8ODAwMDA+Owo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGh5
c3RlcmVzaXMgPSA8MjAwMD47Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdHlwZSA9ICJhY3RpdmUiOwo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB9Owo+Pgo+PiBNb3ZlIHRoZSBhY3RpdmUgdHJpcCAnY3B1X2FjdGl2ZScgdG8gbXQ3NjIyLWJh
bmFuYXBpLWJwaS1yNjQuZHRzLiBhbmQKPj4gc2V0IGl0IHRvIDcwwrBDIGluIHRoZSBtdDc2MjIt
YmFuYW5hcGktYnBpLXI2NC5kdHMsIHNvIHRoZSBmYW4gd2lsbCBhY3QKPj4gYmVmb3JlIHRoZSBj
cHUgdGhyb3R0bGluZy4KPj4KPj4gVGhlIGJlaGF2aW9yIHNob3VsZCBiZSB0aGUgZm9sbG93aW5n
OiBUaGUgdGVtcGVyYXR1cmUgcmVhY2hlcyA3MMKwQywgdGhlCj4+IGZhbiB3aWxsIHN0YXJ0LCBp
ZiB0aGUgdGVtcGVyYXR1cmUgY29udGludWVzIHRvIGluY3JlYXNlLCBpdCB3aWxsCj4+IGluY3Jl
YXNlIHRoZSBzcGVlZC4gSWYgdGhlIHRlbXBlcmF0dXJlIHJlYWNoZXMgNzXCsEMsIHRoZSBmYW4g
aXMgc3RpbGwKPj4gcm90YXRpbmcgYXQgZnVsbCBzcGVlZCBidXQgdGhlIGNwdSBiZWdpbnMgdG8g
YmUgdGhyb3R0bGVkLgo+IAo+IHBhc3NpdmUgdG8gNzUgYW5kIGFjdGl2ZSBsb3dlciB0byA3MD8g
aXMgdGhpcyBhcyBpbnRlbmRlZCB0aGF0IGFjdGl2ZSBjb21lcyBiZWZvcmUgcGFzc2l2ZT8KClll
cy4gU28gdGhlcmUgaXMgYSBkZWZhdWx0IHBhc3NpdmUgbWl0aWdhdGlvbiB0ZW1wIGZvciB0aGUg
U29DIGF0IDc1wrBDLgpBbmQgdGhlIGJwaSBoYXMgYSBzZXR1cCB3aXRoIGEgZmFuIG1pdGlnYXRp
bmcgYmVmb3JlIHRoZSBjcHUgdGhyb3R0bGluZy4KCj4gbXQ3NjIyLWJhbmFuYXBpLWJwaS1yNjQu
ZHRzOgo+IAo+ICZjcHVfdGhlcm1hbCB7Cj4gCXRyaXBzIHsKPiAJCWNwdV9wYXNzaXZlOiBjcHUt
cGFzc2l2ZSB7Cj4gCQkJdGVtcGVyYXR1cmUgPSA8NzUwMDA+Owo+IAkJCWh5c3RlcmVzaXMgPSA8
MjAwMD47Cj4gCQkJdHlwZSA9ICJwYXNzaXZlIjsKPiAJCX07CgpObyBuZWVkIHRvIGFkZCB0aGlz
IHRyaXAgcG9pbnQsIGl0IHNob3VsZCBiZSBjaGFuZ2VkIHRvIDc1wrBDIGluIFNvQyBEVAptdDc2
MjIuZHRzaS4gVGhpcyBmcmFnbWVudCBvZiBEVCB3aWxsIGNvbmNhdGVuYXRlIHdpdGggdGhlIHBy
ZXZpb3VzIG9uZS4KCj4gCQljcHVfYWN0aXZlOiBjcHUtYWN0aXZlIHsKPiAJCQl0ZW1wZXJhdHVy
ZSA9IDw3MDAwMD47Cj4gCQkJaHlzdGVyZXNpcyA9IDwyMDAwPjsKPiAJCQl0eXBlID0gImFjdGl2
ZSI7Cj4gCQl9Owo+IAl9Owo+IAo+IAljb29saW5nLW1hcHMgewo+IAkJbWFwMSB7Cj4gCQkJdHJp
cCA9IDwmY3B1X2FjdGl2ZT47Cj4gCQkJY29vbGluZy1kZXZpY2UgPSA8JmZhbjAgVEhFUk1BTF9O
T19MSU1JVCBUSEVSTUFMX05PX0xJTUlUPjsKPiAJCX07Cj4gCX07Cj4gfTsKPiAKPiAKPj4gQUZB
SVUsIGl0IGlzIGEgQ29ydGV4LUE1MyBydW5uaW5nIEAxLjM1R0gsIHNvIGV4Y2VwdCB0aGUgYm9h
cmQgaXMgaW4gYQo+PiBibGFjayBtZXRhbCBib3ggdW5kZXIgdGhlIHN1biwgSSBkb24ndCBzZWUg
aG93IHdlIGNhbiByZWFjaCB0aGlzIHRoZXJtYWwKPj4gbGltaXRzLgo+Pgo+Pj4gQEAgLTE3MCw4
ICsxNzAsOCBAQCBjcHUtY3JpdCB7Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgICBjb29saW5n
LW1hcHMgewo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXAwIHsKPj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0cmlwID0gPCZjcHVfcGFzc2l2
ZT47Cj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29vbGluZy1k
ZXZpY2UgPSA8JmNwdTAgVEhFUk1BTF9OT19MSU1JVCBUSEVSTUFMX05PX0xJTUlUPiwKPj4+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwm
Y3B1MSBUSEVSTUFMX05PX0xJTUlUIFRIRVJNQUxfTk9fTElNSVQ+Owo+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvb2xpbmctZGV2aWNlID0gPCZjcHUwIDAgMD4s
Cj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICA8JmNwdTEgMCAwPjsKPj4KPj4gWW91IHNob3VsZCBrZWVwIGl0IHVudG91Y2hlZC4KPiAK
PiB0aGVuIGNwdSBpcyB0cm90dGxlZCBhdCBwYXNzaXZlIHBvaW50IChjdXJyZW50bHkgNDfCsEMp
IGFuZCBpbWhvIGZhbiBkb2VzIG5vdCBzdGFydCBhdCBhY3RpdmUKPiAKPj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfTsKPiAKCgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+
IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93
IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29r
IHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3
dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
