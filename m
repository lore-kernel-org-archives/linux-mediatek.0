Return-Path: <SRS0=z6AG=3D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4482C33C9E
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2020 21:56:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70F8524658
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2020 21:56:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QBM0iLVA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8TLJ3X3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70F8524658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OFzmKM92CrkBoiLh8/9p5ctezEMZWNAjjHY+nlVgz9w=; b=QBM0iLVA476gzH
	ZTZUhWsFF+IYELzeJYmWDcX5hXXPBkT1xpSHfmF4bFZQn//KulUobFu8lxdsTWPaag783eG/05yJY
	XGQlMGEvRsfushsfPVcJH51tLzGK7mhOuh+gi/3YnAkqdykp7P+td3ZTHWFlmDu5k3jk/39+jJj2O
	ppyc5MXhcDi7khDB3p7nDwzkWRuzouz3su+Dm4l8bow5Q70jVtBL/0vlSWQk+NhMQtb8MLA/0oSlf
	7kwsoLc09BXhHFOe1Ef+OXFGPQ1DVi8cInVfCcNzUnEQ6lA6VePaskFG5NghmnQXSKvQpOlbXNzOg
	XcorkxhK6wv/sUEjkxAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irUAj-0002L1-1z; Tue, 14 Jan 2020 21:56:25 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irUAg-0002KT-1l; Tue, 14 Jan 2020 21:56:23 +0000
Received: by mail-ed1-x541.google.com with SMTP id i16so13465714edr.5;
 Tue, 14 Jan 2020 13:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yH3gRAxnfteCLLH/u2qSnjxRy8GxS8UCwyFGMa2DlSk=;
 b=L8TLJ3X3zeA1DIMsprrsvpWLzlNOIhK4gRrrwo1pWCBT2v6TzZt4fyCDREJ5gMRHB1
 w3Tp0Ge+TB+EcXDYqq/S3H3H6dsnQhPBnJDXcrIekSfsKC9NqaQvKCOeGIpuJE05Ipkc
 2Uw8qi25HOS7n5tOtEoGTi7iZeSrf2TttZ2Jl/iyp7NOqn4KJsYpRNvl93C9zqvvfWAV
 VLaPVVelE92hWnWCTwTnfNksNwxvNpUQnWb3fpWfqlkXLVWAo540W2abWB2ihtMd5AFP
 SSv4sdAdjrGGpIPzE5oneuBDdE5vw70m3ZK18regWMUwN5vUjoNXQKiasgd6vJ1gDr0S
 n49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=yH3gRAxnfteCLLH/u2qSnjxRy8GxS8UCwyFGMa2DlSk=;
 b=g2dFqNi5TDMW+vONFg1odILWlxJPh8qzo2TYNBpjnA1uLA2QkRpSK8RiixITTkhjvI
 uJLlTSUtYlW71himdT4+z7gRmeC+0D6QHK/ovoLp4H/XUuVul+rBXkF+xcmnuKFErzOM
 KBsQ3tmtkcRKZ4uSCwTUnitoDSoJ02npG8LpxcBBFlqP+FssApPGjWyDe4BXiDEJ7od8
 0TkYOXTEgLj1s2u3DYOQDGhVNn0cYERalOmcswhHLqxQ+lFyy8c2GObIz3oqHkmmp6T/
 7GF2KXFfeUGLg144GYk6cao0mPxb7bY5sW4vg9L3JUPklAlOEtVgfXthPgLMnclHsrOj
 i/KQ==
X-Gm-Message-State: APjAAAVS49gWXAKQdVUKqYhBhgWa09VDk1KDUjVwReCEUWvJNiEncjf/
 Mi/rMu6SleW7JGx96B7YAgZQWAfX
X-Google-Smtp-Source: APXvYqyWnO9iRf5STWhMn69PWxX8fFlxQ2pGMtj6O19YvlnMFQQfsTfJA4C1fnENHdovGqy+6ivD2g==
X-Received: by 2002:aa7:d84b:: with SMTP id f11mr25642369eds.96.1579038979890; 
 Tue, 14 Jan 2020 13:56:19 -0800 (PST)
Received: from [10.67.50.41] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id i11sm656262eds.23.2020.01.14.13.56.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2020 13:56:19 -0800 (PST)
Subject: Re: [PATCH RFC net-next 05/19] net: dsa: tag_ar9331: add GRO callbacks
To: Vladimir Oltean <olteanv@gmail.com>, Alexander Lobakin <alobakin@dlink.ru>
References: <20191230143028.27313-1-alobakin@dlink.ru>
 <20191230143028.27313-6-alobakin@dlink.ru>
 <ee6f83fd-edf4-5a98-9868-4cbe9e226b9b@gmail.com>
 <ed0ad0246c95a9ee87352d8ddbf0d4a1@dlink.ru>
 <CA+h21hoSoZT+ieaOu8N=MCSqkzey0L6HeoXSyLtHjZztT0S9ug@mail.gmail.com>
 <0002a7388dfd5fb70db4b43a6c521c52@dlink.ru>
 <CA+h21hqZoLrU7nL3Vo0KcmFnOxNxQPwoOVSEd6styyjK7XO+5w@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 G10n8gCguORqNGMsVRxrlLs7/himep7MrCc=
Message-ID: <129bf2bc-c0e9-02a3-7d40-0f7920803769@gmail.com>
Date: Tue, 14 Jan 2020 13:56:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CA+h21hqZoLrU7nL3Vo0KcmFnOxNxQPwoOVSEd6styyjK7XO+5w@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_135622_095854_DCEE7BA8 
X-CRM114-Status: GOOD (  14.74  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Song Liu <songliubraving@fb.com>,
 Jakub Kicinski <jakub.kicinski@netronome.com>,
 Yoshiki Komachi <komachi.yoshiki@gmail.com>,
 lkml <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@google.com>, Matteo Croce <mcroce@redhat.com>,
 Edward Cree <ecree@solarflare.com>, Jakub Sitnicki <jakub@cloudflare.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Sean Wang <sean.wang@mediatek.com>, Jiri Pirko <jiri@mellanox.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, netdev <netdev@vger.kernel.org>,
 Paul Blakey <paulb@mellanox.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 "David S. Miller" <davem@davemloft.net>, Taehee Yoo <ap420073@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMS8xMy8yMCAyOjI4IEFNLCBWbGFkaW1pciBPbHRlYW4gd3JvdGU6Cj4gT24gTW9uLCAxMyBK
YW4gMjAyMCBhdCAxMTo0NiwgQWxleGFuZGVyIExvYmFraW4gPGFsb2Jha2luQGRsaW5rLnJ1PiB3
cm90ZToKPj4KPj4gVmxhZGltaXIgT2x0ZWFuIHdyb3RlIDEzLjAxLjIwMjAgMTI6NDI6Cj4+PiBI
aSBBbGV4YW5kZXIsCj4+Pgo+Pj4gT24gTW9uLCAxMyBKYW4gMjAyMCBhdCAxMToyMiwgQWxleGFu
ZGVyIExvYmFraW4gPGFsb2Jha2luQGRsaW5rLnJ1Pgo+Pj4gd3JvdGU6Cj4+Pj4KPj4+PiBDUFUg
cG9ydHMgY2FuJ3QgYmUgYnJpZGdlZCBhbnl3YXkKPj4+Pgo+Pj4+IFJlZ2FyZHMsCj4+Pj4g4Zq3
IOGbliDhmqIg4ZqmIOGaoCDhmrEKPj4+Cj4+PiBUaGUgZmFjdCB0aGF0IENQVSBwb3J0cyBjYW4n
dCBiZSBicmlkZ2VkIGlzIGFscmVhZHkgbm90IGlkZWFsLgo+Pj4gT25lIGNhbiBoYXZlIGEgRFNB
IHN3aXRjaCB3aXRoIGNhc2NhZGVkIHN3aXRjaGVzIG9uIGVhY2ggcG9ydCwgc28gaXQKPj4+IGFj
dHMgbGlrZSBOIERTQSBtYXN0ZXJzIChub3QgYXMgRFNBIGxpbmtzLCBzaW5jZSB0aGUgdGFnZ2Vy
cyBhcmUKPj4+IGluY29tcGF0aWJsZSksIHdpdGggZWFjaCBzd2l0Y2ggZm9ybWluZyBpdHMgb3du
IHRyZWUuIEl0IGlzIGRlc2lyYWJsZQo+Pj4gdGhhdCB0aGUgcG9ydHMgb2YgdGhlIERTQSBzd2l0
Y2ggb24gdG9wIGFyZSBicmlkZ2VkLCBzbyB0aGF0Cj4+PiBmb3J3YXJkaW5nIGJldHdlZW4gY2Fz
Y2FkZWQgc3dpdGNoZXMgZG9lcyBub3QgcGFzcyB0aHJvdWdoIHRoZSBDUFUuCj4+Cj4+IE9oLCBJ
IHNlZS4gQnV0IGN1cnJlbnRseSBEU0EgaW5mcmEgZm9yYmlkcyB0aGUgYWRkaW5nIERTQSBtYXN0
ZXJzIHRvCj4+IGJyaWRnZXMgSUlSQy4gQ2FuJ3QgbmFtZSBpdCBnb29kIG9yIGJhZCBkZWNpc2lv
biwgYnV0IHdhcyBpbnRyb2R1Y2VkCj4+IHRvIHByZXZlbnQgYWNjaWRlbnRhbCBwYWNrZXQgZmxv
dyBicmVha2luZyBvbiBEU0Egc2V0dXBzLgo+Pgo+IAo+IEkganVzdCB3YW50ZWQgdG8gcG9pbnQg
b3V0IHRoYXQgc29tZSBwZW9wbGUgYXJlIGdvaW5nIHRvIGJlIGxvb2tpbmcgYXQKPiB3YXlzIGJ5
IHdoaWNoIHRoZSBFVEhfUF9YRFNBIGhhbmRsZXIgY2FuIGJlIG1hZGUgdG8gcGxheSBuaWNlIHdp
dGggdGhlCj4gbWFzdGVyJ3MgcnhfaGFuZGxlciwgYW5kIHRoYXQgaXQgd291bGQgYmUgbmljZSB0
byBhdCBsZWFzdCBub3QgbWFrZQo+IHRoZSBsaW1pdGF0aW9uIHdvcnNlIHRoYW4gaXQgaXMgYnkg
Y29udmVydGluZyBldmVyeXRoaW5nIHRvCj4gcnhfaGFuZGxlcnMgKHdoaWNoICJjdXJyZW50bHki
IGNhbid0IGJlIHN0YWNrZWQsIGZyb20gdGhlIGNvbW1lbnRzIGluCj4gbmV0ZGV2aWNlLmgpLgoK
SSBhbSBub3Qgc3VyZSB0aGlzIHdvdWxkIGNoYW5nZSB0aGUgc2l0dWF0aW9uIG11Y2gsIHRvZGF5
IHdlIGNhbm5vdCBoYXZlCmFueXRoaW5nIGJ1dCBzd2l0Y2ggdGFncyB0cmF2ZWwgb24gdGhlIERT
QSBtYXN0ZXIgbmV0d29yayBkZXZpY2UsCndoZXRoZXIgd2UgYWNjb21wbGlzaCB0aGUgUlggdGFw
IHRocm91Z2ggYSBzcGVjaWFsIHNrYi0+cHJvdG9jb2wgdmFsdWUKb3IgdmlhIHJ4X2hhbmRsZXIs
IGl0IHByb2JhYmx5IGRvZXMgbm90IGZ1bmN0aW9uYWxseSBtYXR0ZXIsIGJ1dCBpdApjb3VsZCBj
aGFuZ2UgdGhlIHBlcmZvcm1hbmNlLgotLSAKRmxvcmlhbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
