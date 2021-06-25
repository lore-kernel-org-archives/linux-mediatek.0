Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52040C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 10:37:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 159F261444
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 10:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 159F261444
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=USXKMrwRQOsGZWNPleUGbmlQit1M9+aHcgXSjqZpUxM=; b=OFl7rMXn7O+qIuVTYMcrhvbmAh
	7M0YRiSjEINJou8tvY8sMUvL5f//UBA3G2ukntZvbV3SWyhySEhVUDGHzXws4N5gWXtz4fkv1hvjC
	joWKkaxVqZj9sv2mmz6yPiG2kw+nhiXM+fAlQ80QMs0UKZUHbjKKO5/smKvBPaLPUQMBFsqOUvNYa
	Zphk83lzwCzQsa1bPnyWmyUeD/e6x8mn14JkBKdyE77lnrM7eXJJ08iG+7kG4tj0PUVT1ywgpD/LC
	hCkudIS9GKz6cpg3o7kZQwc7Q++AjOVYMNPurIaHrvyfkDe2pn0RozuDYjwrOw6Nxet5x04iv72mx
	l00uAEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwjCx-0010zj-VN; Fri, 25 Jun 2021 10:37:12 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwiaC-000o0t-3C
 for linux-mediatek@lists.infradead.org; Fri, 25 Jun 2021 09:57:10 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 k30-20020a05600c1c9eb02901d4d33c5ca0so4692wms.3
 for <linux-mediatek@lists.infradead.org>; Fri, 25 Jun 2021 02:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LXR0Jto15p9D6SXD9so7u+A/IVvd9POUcHlyax5EA1Q=;
 b=cjBsefTsH+8iWqNb5tJUjU4+p/+aBifMkCkjwOnqsHUn6jefOgZXyp07SoXTLVv3UJ
 0b0XViNGme3bChT6OpT/zVbW6U/4y6ZFzxq/JrxuzmAFcrlXZdYf3dEoQrRsqNqKVW9o
 4giDfrGrz3KWCO+DAGaqyVfkbNvcjNKfR6rxVKqR8l8CosCTp23YIbDVvCD22X4WQpdT
 uG8pzSCMirxNPqR22ZQpYonP+lLYdkLcq/0C4y7maHhj/8bh3wol5zk9LajHaJ7Rl9bT
 nchMxhtET2fuxSuvDURU9KAudg0AUgcYIq+ZrO0D1Jof/26BempxFRQ64ktO8U2LoZkx
 cOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LXR0Jto15p9D6SXD9so7u+A/IVvd9POUcHlyax5EA1Q=;
 b=iqBGo4Wn3XlZnJC9xYcX7cT1QASpf4UOuW/HK2YytLGZ8/CM4kM2zrIVLiEDTI0uer
 YZpTnNiwEsjFNQQM6AjrdGWmXpFwfwjX4CZtEA9cdqM6G7/ubzU/A6coQ4qbiQvVzORy
 ZGCMt8c1Crd9Y8PlfobquVdbNevDeKprUVV/2DXdjq6aAIHFsdc+f/YbYB3/U6hgQ+bf
 FvByoAejhNakvgvkyk3pDmFHDq5nObt+ZFMNGtYPaGZEmz5YRFQtB1ZJXoQsqq4vwRbu
 5ATXG9V8dxMgENT/Gky83yrl6/ZDkRYQxZ4LELMVOTGuvmfJVCQ3+dHhFaI0YVYA96YN
 urxA==
X-Gm-Message-State: AOAM532MXAl6n1x5cToyLRTXKRUFLd0nAftHuuJF03EZfeNzlAJGGSrF
 XhyfVjg+z9P6spi9x8El8g35rw==
X-Google-Smtp-Source: ABdhPJw08HAiAJAuqs2vuWjjX1R7qU+vfjz0Pw1It39O79illPxSUSjz0ErIOOIUdhwWa3pTWaLZ7A==
X-Received: by 2002:a7b:cbc5:: with SMTP id n5mr9734097wmi.148.1624615025903; 
 Fri, 25 Jun 2021 02:57:05 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:c52d:3cc5:c823:ade0?
 ([2a01:e34:ed2f:f020:c52d:3cc5:c823:ade0])
 by smtp.googlemail.com with ESMTPSA id v22sm4851249wmh.40.2021.06.25.02.57.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 02:57:05 -0700 (PDT)
Subject: Re: Aw: Re: [PATCH] Fix mt7622.dtsi thermal cpu
To: Frank Wunderlich <frank-w@public-files.de>,
 Eric Woudstra <ericwouds@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
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
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <8b27246b-721e-fa0e-5c2b-b1b4b4d6fdd3@linaro.org>
Date: Fri, 25 Jun 2021 11:57:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <trinity-7580d955-3187-41e5-9297-1ac8f628a9d5-1624609003739@3c-app-gmx-bs66>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_025708_246384_0BB269CB 
X-CRM114-Status: GOOD (  23.92  )
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

CkhpIEZyYW5rLAoKT24gMjUvMDYvMjAyMSAxMDoxNiwgRnJhbmsgV3VuZGVybGljaCB3cm90ZToK
PiBIaSwKPiAKCj4+IEdlc2VuZGV0OiBEb25uZXJzdGFnLCAyNC4gSnVuaSAyMDIxIHVtIDE1OjI5
IFVociBWb246ICJFcmljCj4+IFdvdWRzdHJhIiA8ZXJpY3dvdWRzQGdtYWlsLmNvbT4gVGhlIFNP
QyBydW5zIHVudGhyb3RsbGVkIHNsb3dseSB0bwo+PiA4MCBkZWdyZWVzLiBUaGlzIHRha2VzIG1p
bnV0ZXMuClBvbGxpbmcgaW50ZXJ2YWwgMSBzZWNvbmQgb3IgbGVzcyBkb2VzIG5vdCBtYXR0ZXIg
bXVjaCB3aGVuIGxvb2tpbmcgYXQKdGhlc2UgdGVtcGVyYXR1cmUgcmlzZSB0aW1lcwo+PiAKPj4g
QWZ0ZXIgdGhhdCBpbiBtb3JlIHRoZW4gYW4gaG91ciBpdCBzbG93bHkgY3JlZXBzIHVwIHRvIDg1
LiBJCj4+IGJlbGlldmUKdGhlIGRlc2lnbiBpcyBzbyB0aGF0IHRoZSBTT0MsIHVuZGVyIG5vcm1h
bCBjaXJjdW1zdGFuY2VzLCBjYW4gcnVuIGF0CjEuMzUgR0h6IHdpdGhvdXQgdGhyb3R0bGluZyBm
cmVxdWVuY3ksIHdpdGhvdXQgaGVhdHNpbmsuIEl0IGp1c3QgbmVlZHMgYQpzYWZlZ3VhcmQgZm9y
IGRpZmZlcmVudCBjaXJjdW1zdGFuY2VzLgo+PiAKPj4gTW9zdCBvZiB0aGVzZSBTT0NzIGNhbiBh
bHNvIHJ1biBpbiBpbmR1c3RyaWFsIGdyYWRlIGNpcmN1bXN0YW5jZXMsCndoaWNoIG1lYW5zIHVw
IHRvIDg1IGRlZ3JlZXMgYW1iaWVudCB0ZW1wZXJhdHVyZSBhbHJlYWR5IC4gSWYgbm90CmluZHVz
dHJpYWwgdGhlbiB0aGlzIHdvdWxkIGJlIDYwIGRlZ3JlZXMgYW1iaWVudCBhbHJlYWR5Cj4+IAo+
PiBCdXQgb25seSBzb21lb25lIGF0IE1lZGlhdGVrIGNhbiBjb25maXJtIHRoaXMKPiAKPiBtYXli
ZSBNYXR0aGlhcyBrbm93cyBhbnlib2R5PyBnZXRfbWFpbnRhaW5lcnMtc2NyaXB0IHNob3dzIG5v
IG10awo+IGVtcGxveWVlIGZvciBtdGtfdGhlcm1hbCBkcml2ZXIsCmFkZGVkIFNlYW4gYW5kIFJ5
ZGVyIGFzIGNvbW1vbiBMaW51eC1Db250YWN0cy4uLgo+IAo+IERhbmllbCBmcm9tIG9wZW53cnQg
aGF2ZSBzb21lIG90aGVyIG10NzYyMiBCb2FyZHMgbWF5YmUgaGUgY2FuIHRlc3QKdGhlIEZhbiBh
cHByb2FjaCBiZWxvdwo+IAo+PiBPbiBKdW4gMjQsIDIwMjEsIDEyOjIxIFBNLCBhdCAxMjoyMSBQ
TSwgRGFuaWVsIExlemNhbm8KPGRhbmllbC5sZXpjYW5vQGxpbmFyby5vcmc+IHdyb3RlOgo+Pj4g
Rm91bmQgdGhhdDoKPj4+IAo+Pj4gCmh0dHBzOi8vZG93bmxvYWQua2FtYW1pLnBsL3A1NzkzNDQt
TVQ3NjIyQV9EYXRhc2hlZXRfZm9yX0JhbmFuYVBpX09ubHklMjgxJTI5LnBkZgo+Pj4gCj4+PiBD
aGFwdGVyIDMuMyAtIFRoZXJtYWwgQ2hhcmFjdGVyaXN0aWNzCj4+PiAKPj4+IEdpdmVuIHRoZSB2
YWx1ZXMgSSBzdWdnZXN0Ogo+Pj4gCj4+PiAtIFBhc3NpdmUgLSA4MMKwQwo+Pj4gCj4+PiAtIEhv
dCAtIDkwwrBDCj4+PiAKPj4+IC0gQ3JpdGljYWwgLSAxMDDCsEMKPiAKPiBtYXliZSBhZGRpbmcg
RkFOIChyNjQsIGRvbid0IGtub3cgZm9yIG90aGVyIG10NzYyMiBib2FyZHMpIGZvciBsb3dlcgo+
IDIKdHJpcHMgKHdpdGggYWRqdXN0ZWQgdGVtcGVyYXR1cmUgcG9pbnRzKSBhbmQgY3B1LXRocm90
dGVsaW5nIGZvciB1cHBlciAyCnRyaXBzCgpJdCBkZXBlbmRzIHdoYXQgeW91IHdhbnQgdG8gYWNo
aWV2ZSBmaXJzdDoKCiAtIGJldHRlciAvIHN1c3RhaW5lZCBwZXJmb3JtYW5jZSwgdGhlbiBmYW4g
YmVmb3JlCgogLSBxdWlldCBkZXZpY2Ugb3IgcG93ZXIgc2F2aW5nIChvbiBiYXR0ZXJ5KSB0aGVu
IGNwdSB0aHJvdHRsaW5nIGJlZm9yZQoKVGhhdCBpcyBib2FyZCBzcGVjaWZpYywgaXQgc2hvdWxk
IGJlIHR1bmVkIG9uIERUIGJvYXJkIHNwZWNpZmljIGZpbGUuCgpTb21lIGNvbW1lbnRzIGJlbG93
OgoKPiBzb21ldGhpbmcgbGlrZSB0aGlzICh1c2VkIHRoZSA3MC84MCB0cmlwIHBvaW50cyBkaXNj
dXNzZWQgYmVmb3JlKToKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210NzYy
Mi5kdHNpCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDc2MjIuZHRzaQoK
WW91IHNob3VsZCBub3QgYWRkIHRoZSBmYW4gaW4gdGhlIG10NzYyMi5kdHNpIGl0c2VsZiBidXQg
aW4gdGhlIGJvYXJkCnNwZWNpZmljIGZpbGUgd2hlcmUgdGhlcmUgaXMgYSBmYW4gb3V0cHV0IG9u
IGl0LiBtdDc2MjIuZHRzaSBpcyBzdXBwb3NlZAp0byBiZSB0aGUgU29DIGl0c2VsZiBBRkFJQ1Qu
CgpGb3IgaW5zdGFuY2U6CgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC90aGVybWFsL2xpbnV4LmdpdC90cmVlL2FyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2No
aXAvcmszMzk5LXNhcHBoaXJlLmR0c2kjbjM5CgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC90aGVybWFsL2xpbnV4LmdpdC90cmVlL2FyY2gvYXJtNjQvYm9v
dC9kdHMvcm9ja2NoaXAvcmszMzk5LXNhcHBoaXJlLmR0c2kjbjE2NAoKPiBAQCAtMTM0LDYgKzEz
NCwxMyBAQAo+ICAJCX07Cj4gIAl9Owo+ICAKPiArCWZhbjA6IHB3bS1mYW4gewo+ICsJCWNvbXBh
dGlibGUgPSAicHdtLWZhbiI7Cj4gKwkJI2Nvb2xpbmctY2VsbHMgPSA8Mj47Cj4gKwkJcHdtcyA9
IDwmcHdtIDIgMTAwMDAgMD47Cj4gKwkJY29vbGluZy1sZXZlbHMgPSA8MCAxMDIgMTcwIDIzMD47
Cj4gKwl9Owo+ICsKPiAgCXRoZXJtYWwtem9uZXMgewo+ICAJCWNwdV90aGVybWFsOiBjcHUtdGhl
cm1hbCB7Cj4gIAkJCXBvbGxpbmctZGVsYXktcGFzc2l2ZSA9IDwxMDAwPjsKPiBAQCAtMTQzLDEz
ICsxNTAsMTMgQEAKPiAgCj4gIAkJCXRyaXBzIHsKPiAgCQkJCWNwdV9wYXNzaXZlOiBjcHUtcGFz
c2l2ZSB7Cj4gLQkJCQkJdGVtcGVyYXR1cmUgPSA8NDcwMDA+Owo+ICsJCQkJCXRlbXBlcmF0dXJl
ID0gPDcwMDAwPjsKPiAgCQkJCQloeXN0ZXJlc2lzID0gPDIwMDA+Owo+ICAJCQkJCXR5cGUgPSAi
cGFzc2l2ZSI7Cj4gIAkJCQl9Owo+ICAKPiAgCQkJCWNwdV9hY3RpdmU6IGNwdS1hY3RpdmUgewo+
IC0JCQkJCXRlbXBlcmF0dXJlID0gPDY3MDAwPjsKPiArCQkJCQl0ZW1wZXJhdHVyZSA9IDw4MDAw
MD47Cj4gIAkJCQkJaHlzdGVyZXNpcyA9IDwyMDAwPjsKPiAgCQkJCQl0eXBlID0gImFjdGl2ZSI7
Cj4gIAkJCQl9Owo+IEBAIC0xNzAsMTQgKzE3NywxMiBAQAo+ICAJCQljb29saW5nLW1hcHMgewo+
ICAJCQkJbWFwMCB7Cj4gIAkJCQkJdHJpcCA9IDwmY3B1X3Bhc3NpdmU+Owo+IC0JCQkJCWNvb2xp
bmctZGV2aWNlID0gPCZjcHUwIFRIRVJNQUxfTk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD4sCj4g
LQkJCQkJCQkgPCZjcHUxIFRIRVJNQUxfTk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD47Cj4gKwkJ
CQkJY29vbGluZy1kZXZpY2UgPSA8JmZhbjAgVEhFUk1BTF9OT19MSU1JVCBUSEVSTUFMX05PX0xJ
TUlUPjsKPiAgCQkJCX07CgpmYW4gPT0gYWN0aXZlIHRyaXAgcG9pbnQKClRoaXMgaXMgcmVmZXJy
aW5nIHRvIHRoZSBwYXNzaXZlIHRyaXAgcG9pbnQuIFNvIGl0IHNob3VsZCBwb2ludCB0byB0aGUK
Q1BVIGFzIGl0IGlzIG5vdy4gTm90ZSB0aGUgb3JkZXIgb2YgbWl0aWdhdGlvbiBpcyBpbnZlcnRl
ZCByZWdhcmRpbmcgdGhlCnByb3Bvc2FsIGRlc2NyaXB0aW9uLgoKPiAgCQkJCW1hcDEgewo+ICAJ
CQkJCXRyaXAgPSA8JmNwdV9hY3RpdmU+Owo+IC0JCQkJCWNvb2xpbmctZGV2aWNlID0gPCZjcHUw
IFRIRVJNQUxfTk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD4sCj4gLQkJCQkJCQkgPCZjcHUxIFRI
RVJNQUxfTk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD47Cj4gKwkJCQkJY29vbGluZy1kZXZpY2Ug
PSA8JmZhbjAgVEhFUk1BTF9OT19MSU1JVCBUSEVSTUFMX05PX0xJTUlUPjsKPiAgCQkJCX07Cj4g
IAo+ICAJCQkJbWFwMiB7Cj4gQEAgLTQyOCw2ICs0MzMsNyBAQAo+ICAJcHdtOiBwd21AMTEwMDYw
MDAgewo+ICAJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ3NjIyLXB3bSI7Cj4gIAkJcmVnID0g
PDAgMHgxMTAwNjAwMCAwIDB4MTAwMD47Cj4gKwkJI3B3bS1jZWxscyA9IDwzPjsKPiAgCQlpbnRl
cnJ1cHRzID0gPEdJQ19TUEkgNzcgSVJRX1RZUEVfTEVWRUxfTE9XPjsKPiAgCQljbG9ja3MgPSA8
JnRvcGNrZ2VuIENMS19UT1BfUFdNX1NFTD4sCj4gIAkJCSA8JnBlcmljZmcgQ0xLX1BFUklfUFdN
X1BEPiwKPiAKPiAKPiByZWdhcmRzIEZyYW5rCj4gCgoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5v
cmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZv
bGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNl
Ym9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6
Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
