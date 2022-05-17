Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7D1C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 09:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EfJ8gcCueyOhEDAQN0qm2f5G5KXw79kCoEbB5ucm7Ac=; b=G+zCk8XIj9Mp6A
	p8qhjlrorzTNWWpBIcm7fidf+FfrbWJLQETjObkzfegMs5KX5H2qQhdDl+xJdIISgrrrMCLlK+jVl
	+n0Zhp+4DNuC6wnu1BZZh57QkowG26acCRPwLckrvZMazqy7wEJTIE/UV3lauUoeTTe6r/qKeApfl
	Kuzm15Svc2g/sFlUckc/zslPHVb8nH4D5PEH5oz4vOXvvyzTKLzJadfk5UJVqvmfJKpg+AGtIx9Oa
	gohh4zwvcy3CykLy8aNG8pcYpPA2aOisMoQk61Q8qWg9/OP8JsPN2d9MVoeFgiHKmF9vNv0hGipK/
	HZALZJols5e5BCe6S/0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqtkp-00CqKB-0u; Tue, 17 May 2022 09:44:35 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqtkX-00CqCg-Gp; Tue, 17 May 2022 09:44:19 +0000
Received: by mail-wr1-x433.google.com with SMTP id h14so4274797wrc.6;
 Tue, 17 May 2022 02:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xFt28KVBptJqZXZcy2j7vQR/cUjdtAD4JIr71r3m1NI=;
 b=E3m6vwrzu9qqznwzVA6PVPYb0KrMeGUMjSVxkZTqsqkoJETD7P+FMkRP8hxAtwJf1T
 +JTlB6ue1pkmf/C+vau3LD0gVzqZLmR1DfBgexd16Y44930jLZJskv8nOuaqrl5eOfX9
 2DYv9H5vhLA0P7Mfed8XHdlgeJi+BHdgZdLGv4+kQ5mYbH/u5R6/tHjUgEC4hUYDMZi9
 RA/brVdCvFYAEmssuCwhR5OYP3rDKXwTBgb51nTZXq9wOoQIWWBOt4wm7YM4e/H4Op5H
 +eOKx1Fwv70DJaN8+a7zqwiTAP+CR8cLE7ZN9Et7o3ZnfWDGfCc9hqn4QHD8u/vNuoNB
 mEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xFt28KVBptJqZXZcy2j7vQR/cUjdtAD4JIr71r3m1NI=;
 b=hPesM/4ehrrJL12zPfO5h9Z14OrFyGKRYsqolYV5z3Pn6cbmslX9JanKs9mHHoIEKB
 b8BTXBy/3eyPbtJo/EQL8YFo9NprMvEFH9Fjg4myqQhg7lVZjcYXGsZDG33fdmu+o/5t
 NmwrJM69CJtG8/0pFGV4fFYqDr1wo46AETiHEhUtB7nx2smB6lxCLtxUi4Gq1ZcFF4Nk
 jg31rywbhD7NYTLtavsM4A6iQeCLqy9s9+Y+YuV/APcsNSOvwVb81D2QFvAA3pYkoo3T
 4d8tcJx2PnlgrnKOIzIrwB09TAeqi1FiebHHtvT8DBDeC2glBqftQER0hHU11DMxKf7t
 YrTg==
X-Gm-Message-State: AOAM530eeoL9YI/kGr2Pn1QqYY3vvrBuQ9WtySt26KtTuw1g51XxszO0
 SmJJI3bIB0ZhrXUt27p4d48=
X-Google-Smtp-Source: ABdhPJx1GUr9fffSpx1lpZSn/YrvUVjYuNV7SxnP1mMQRxq4bK1KUpckqXBE/b8Ru/y+ysz1Jxm1MA==
X-Received: by 2002:a05:6000:10d0:b0:20d:7d3:9972 with SMTP id
 b16-20020a05600010d000b0020d07d39972mr8625180wrx.554.1652780653881; 
 Tue, 17 May 2022 02:44:13 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 c22-20020a05600c0a5600b00396fbf6f524sm1471019wmq.1.2022.05.17.02.44.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 02:44:13 -0700 (PDT)
Message-ID: <a8bd608c-d94c-f4a2-e3b1-3381c9098caf@gmail.com>
Date: Tue, 17 May 2022 11:44:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 1/5] soc: mediatek: pwrap: Use readx_poll_timeout()
 instead of custom function
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 rex-bc.chen@mediatek.com, zhiyong.tao@mediatek.com
References: <20220516124659.69484-1-angelogioacchino.delregno@collabora.com>
 <20220516124659.69484-2-angelogioacchino.delregno@collabora.com>
 <f8acbc75-970c-62fb-ad0d-914e512104a7@gmail.com>
 <9f197c69-fe04-b636-afb7-8474763c8a3a@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <9f197c69-fe04-b636-afb7-8474763c8a3a@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_024417_604756_55F46140 
X-CRM114-Status: GOOD (  20.66  )
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

CgpPbiAxNy8wNS8yMDIyIDExOjQxLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToK
PiBJbCAxNy8wNS8yMiAxMToyNSwgTWF0dGhpYXMgQnJ1Z2dlciBoYSBzY3JpdHRvOgo+Pgo+Pgo+
PiBPbiAxNi8wNS8yMDIyIDE0OjQ2LCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToK
Pj4+IEZ1bmN0aW9uIHB3cmFwX3dhaXRfZm9yX3N0YXRlKCkgaXMgYSBmdW5jdGlvbiB0aGF0IHBv
bGxzIGFuIGFkZHJlc3MKPj4+IHRocm91Z2ggYSBoZWxwZXIgZnVuY3Rpb24sIGJ1dCB0aGlzIGlz
IHRoZSB2ZXJ5IHNhbWUgb3BlcmF0aW9uIHRoYXQKPj4+IHRoZSByZWFkeF9wb2xsX3RpbWVvdXQg
bWFjcm8gbWVhbnMgdG8gZG8uCj4+PiBDb252ZXJ0IGFsbCBpbnN0YW5jZXMgb2YgY2FsbGluZyBw
d3JhcF93YWl0X2Zvcl9zdGF0ZSgpIHRvIGluc3RlYWQKPj4+IHVzZSB0aGUgcmVhZF9wb2xsX3Rp
bWVvdXQgbWFjcm8uCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwg
UmVnbm8gCj4+PiA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgo+Pj4g
UmV2aWV3ZWQtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3Jh
LmNvbT4KPj4+IFRlc3RlZC1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bj
b2xsYWJvcmEuY29tPgo+Pj4gLS0tCj4+PiDCoCBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstcG1p
Yy13cmFwLmMgfCA2MCArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCj4+PiDCoCAxIGZpbGUg
Y2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1wbWljLXdyYXAuYyAKPj4+IGIvZHJpdmVy
cy9zb2MvbWVkaWF0ZWsvbXRrLXBtaWMtd3JhcC5jCj4+PiBpbmRleCBiZjM5YTY0ZjNlY2MuLjU0
YTUzMDBhYjcyYiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1wbWlj
LXdyYXAuYwo+Pj4gKysrIGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLXBtaWMtd3JhcC5jCj4+
PiBAQCAtMTMsNiArMTMsOSBAQAo+Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgo+Pj4g
wqAgI2luY2x1ZGUgPGxpbnV4L3Jlc2V0Lmg+Cj4+PiArI2RlZmluZSBQV1JBUF9QT0xMX0RFTEFZ
X1VTwqDCoMKgIDEwCj4+PiArI2RlZmluZSBQV1JBUF9QT0xMX1RJTUVPVVRfVVPCoMKgwqAgMTAw
MDAKPj4+ICsKPj4+IMKgICNkZWZpbmUgUFdSQVBfTVQ4MTM1X0JSSURHRV9JT1JEX0FSQl9FTsKg
wqDCoMKgwqDCoMKgIDB4NAo+Pj4gwqAgI2RlZmluZSBQV1JBUF9NVDgxMzVfQlJJREdFX1dBQ1Mz
X0VOwqDCoMKgwqDCoMKgwqAgMHgxMAo+Pj4gwqAgI2RlZmluZSBQV1JBUF9NVDgxMzVfQlJJREdF
X0lOSVRfRE9ORTPCoMKgwqDCoMKgwqDCoCAweDE0Cj4+PiBAQCAtMTI0MSwyNyArMTI0NCwxNCBA
QCBzdGF0aWMgYm9vbCBwd3JhcF9pc19mc21faWRsZV9hbmRfc3luY19pZGxlKHN0cnVjdCAKPj4+
IHBtaWNfd3JhcHBlciAqd3JwKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgICh2YWwgJiBQV1JBUF9T
VEFURV9TWU5DX0lETEUwKTsKPj4+IMKgIH0KPj4+IC1zdGF0aWMgaW50IHB3cmFwX3dhaXRfZm9y
X3N0YXRlKHN0cnVjdCBwbWljX3dyYXBwZXIgKndycCwKPj4+IC3CoMKgwqDCoMKgwqDCoCBib29s
ICgqZnApKHN0cnVjdCBwbWljX3dyYXBwZXIgKikpCj4+PiAtewo+Pj4gLcKgwqDCoCB1bnNpZ25l
ZCBsb25nIHRpbWVvdXQ7Cj4+PiAtCj4+PiAtwqDCoMKgIHRpbWVvdXQgPSBqaWZmaWVzICsgdXNl
Y3NfdG9famlmZmllcygxMDAwMCk7Cj4+PiAtCj4+PiAtwqDCoMKgIGRvIHsKPj4+IC3CoMKgwqDC
oMKgwqDCoCBpZiAodGltZV9hZnRlcihqaWZmaWVzLCB0aW1lb3V0KSkKPj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiBmcCh3cnApID8gMCA6IC1FVElNRURPVVQ7Cj4+PiAtwqDCoMKg
wqDCoMKgwqAgaWYgKGZwKHdycCkpCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
MDsKPj4+IC3CoMKgwqAgfSB3aGlsZSAoMSk7Cj4+PiAtfQo+Pj4gLQo+Pj4gwqAgc3RhdGljIGlu
dCBwd3JhcF9yZWFkMTYoc3RydWN0IHBtaWNfd3JhcHBlciAqd3JwLCB1MzIgYWRyLCB1MzIgKnJk
YXRhKQo+Pj4gwqAgewo+Pj4gK8KgwqDCoCBib29sIHRtcDsKPj4+IMKgwqDCoMKgwqAgaW50IHJl
dDsKPj4+IMKgwqDCoMKgwqAgdTMyIHZhbDsKPj4+IC3CoMKgwqAgcmV0ID0gcHdyYXBfd2FpdF9m
b3Jfc3RhdGUod3JwLCBwd3JhcF9pc19mc21faWRsZSk7Cj4+PiArwqDCoMKgIHJldCA9IHJlYWR4
X3BvbGxfdGltZW91dChwd3JhcF9pc19mc21faWRsZSwgd3JwLCB0bXAsIHRtcCwKPj4KPj4gaG0s
IGlmIHdlIG1ha2UgdGhlIGNvbmQgKHRtcCA+IDApIHRoYXQgd291bGQgaGVscCB0byB1bmRlcnN0
YW5kIHRoZSBjb2RlLiBBdCAKPj4gbGVhc3QgSSBoYWQgdG8gdGhpbmsgYWJvdXQgaXQgZm9yIGEg
bW9tZW50LiBCdXQgSSBsZWF2ZSBpdCB0byB5b3UgaWYgeW91IHRoaW5rIAo+PiBpdCdzIHdvcnRo
IHRoZSBlZmZvcnQuCj4+Cj4gCj4gSSB3b3VsZCBwcmVmZXIgc2l6ZSBvdmVyIHJlYWRhYmlsaXR5
IGluIHRoaXMgY2FzZS4uLiBpZiB3ZSBkbyAodG1wID4gMCksIGl0IHdvdWxkCj4gYmUgaW5jb3Jy
ZWN0IHRvIGtlZXAgdG1wIGFzIGEgYGJvb2xgLCB3ZSB3b3VsZCBoYXZlIHRvIHNldCBpdCBhcyBh
biBpbnRlZ2VyIHZhciwKPiB3aGljaCBpcyB1bm5lY2Vzc2FyaWx5IGJpZ2dlciAodGhhdCdzIHRo
ZSByZWFzb24gd2h5IEkgd3JvdGUgaXQgbGlrZSBzbyEpLgo+IAo+IEFub3RoZXIgd2F5IHRvIGlu
Y3JlYXNlIGh1bWFuIHJlYWRhYmlsaXR5IHdvdWxkIGJlIHRvIGRvICh0bXAgPT0gdHJ1ZSksIGJ1
dCBpdAo+IGxvb2tzIGEgYml0IHdlaXJkIHRvIG1lLCBkb2Vzbid0IGl0Pwo+IElmIHlvdSBkaXNh
Z3JlZSBhYm91dCB0aGF0IGxvb2tpbmcgd2VpcmQsIHRob3VnaCwgSSBjYW4gZ28gd2l0aCB0aGF0
IG9uZSwgcGVyaGFwcyEKPiAKCllvdSBhcmUgcmlnaHQsIGp1c3QgbGVhdmUgaXQgYXMgaXQgaXMu
CgpSZWdhcmRzLApNYXR0aGlhcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
