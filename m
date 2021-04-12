Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE8DFC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 08:27:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DFCA611C9
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 08:27:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DFCA611C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YHpWlsvbYbCDq4ZX7H+ILrfzGAn9mBtACQhqxYt6WXc=; b=mzHJLGy7EVARVqERo1Km6uMRZ
	fC/C+eJ3xA9Xo8hN7ZtBrjjJkd45WjQU3NvB+lY1cN8udU3VQkmAEfv8KQE8mHbhT33RyER1sp0fM
	j+iHTGO7RHtHrJIx2aXzVU3uv8vDNQfKZ3uaBkaMm1udy742C8R1DAO+6CZUSEoHR+voU6Z5dor6b
	UtzN6xh45lI1HTHsH4Q7iMYwItRzQd4kBOz0CLjLq6Cz6JEgOnv67KCLqaRxgYmzKqQo/vG7KbCQX
	DElxmQg2PUCku6UvZxLNA3EkuU+mRiM7hcqjGDXeNvG4Ran2KVJldPCoMT6wc/Qxj8qfrUZWk6iDv
	8AYfmJxiw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVruT-00660f-BJ; Mon, 12 Apr 2021 08:27:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVru2-0065uO-Aa
 for linux-mediatek@desiato.infradead.org; Mon, 12 Apr 2021 08:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=UaKmap8VBg3qA/HYVgj8+5VJG7Je5+TY240hCc5hhQU=; b=sJGpHXND+I+L/IJZBtqoIv0HeF
 dXgIt/X/eCAFkf7tlLQ7ufi2olBr+TFZX33SYJWflRbeqJ8rhjBGw7cLwVj3KWZR9PEQoYcTVetRH
 3RijV1PB668GygWcKbqbN/7PH5LNxRNOkQ98UI/qO6jxn72oM0Yaibgt8m/83zngAboT6SeRkSWyP
 vMshoqv8PMXNu5XUNNVUxrWOE4VYq8T26QiPTgiZek+Pru7Z0dXADoKmBxTDCwhYmmwx9buo2MuRB
 WA3+0GVuLW8m4y3fiewWfGNf4fwbiRnxk4I0U720upqmAuU0uSXF+BTaHkJ52iHFQVxI25zZNmUh0
 5IVFeODA==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVrtz-005yJd-1j
 for linux-mediatek@lists.infradead.org; Mon, 12 Apr 2021 08:26:37 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 z24-20020a1cf4180000b029012463a9027fso6347389wma.5
 for <linux-mediatek@lists.infradead.org>; Mon, 12 Apr 2021 01:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UaKmap8VBg3qA/HYVgj8+5VJG7Je5+TY240hCc5hhQU=;
 b=D9bGG0D89YcdKYQVNMxqqEfkh5jnzAnYR+Z6iaiehla9H3/mJR7c0nc7W7/eAvgyum
 kRailtqXCfNQ85Q3Eb0gydmc0l+jUk4bujbqief4/2iss6t+H3yH1oR8OSj9Cgy+L2hv
 lXZHSsQGs71LQ4pU5ngrTQNTUmSIAaAHrTfgtNHcu4osdU0UFQBFfRDaNV/er6qwFjDY
 AGh8F6MyNG9DcSHPMH0q44SlYTFU7zLdKQAyiwLRoYgIxpZ6gg9UsCLqhqjwDBx20N2S
 boUYhk2Ybuy9TRkOE/X1wJGKMxWutsHaJvr30jjeTmKHh+K8exEx9l/3yks4rBBGn4N+
 /BVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=UaKmap8VBg3qA/HYVgj8+5VJG7Je5+TY240hCc5hhQU=;
 b=ozCqaMaMGdzuaoJWObsnCSNp/BrsillziC22Qx0Q5TNpnkDflrbn2iC1ADRxxvNqDo
 eWNN6C3QwgZI01Vy9lnnJXjneDN3g2rW3F6s2Ni5x1G6Q78J6YE3uFrfMYpmxYxtjzbj
 Zt8w3bgwqycoPacJHN1HLxkYYQvLeZWlRaMBITZUVraSo4qm1S8TcoT53PwpcGeWAPui
 wSKgFSc0gypx1jjNKjzuTFzKaYfFeEothbzs6fYagdi5dopr74fjxrXUU0qx1tgOeKff
 8aHd/4gCg+ilf1Pj1YvLP06Rsn0d78Ru6hMUcwja+ouztxdOgIMTlQbHZzraJtwAS5Mu
 BQWQ==
X-Gm-Message-State: AOAM532vq2GAM4BQ/zmMfBIGuBo1QCU7dGwDyjnNe8wiDAjCwKGpDh5r
 HO1pJw6LDP6u9S0MdrXLiEYpcg==
X-Google-Smtp-Source: ABdhPJwsfDxCETIVflyHJroKHGN4n7AsriRCdtoYopc7TlOeEXwsW8tArL9wGxUxG0peFRZCfJVPqA==
X-Received: by 2002:a1c:7ed3:: with SMTP id
 z202mr18155336wmc.136.1618215992476; 
 Mon, 12 Apr 2021 01:26:32 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:4c21:b00e:ff79:bf20?
 ([2a01:e0a:90c:e290:4c21:b00e:ff79:bf20])
 by smtp.gmail.com with ESMTPSA id x25sm3642204wmj.34.2021.04.12.01.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 01:26:32 -0700 (PDT)
Subject: Re: [PATCH] gpu/drm: mediatek: hdmi: check for valid modes on MT8167
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>
References: <20210409084308.481185-1-narmstrong@baylibre.com>
 <CAAOTY_-gqN2HCLg6AABsXYzJoBxpN8FkMfjqWFu2q=6noiY1qg@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <e3bd95df-f5c9-2791-8112-348592b7a513@baylibre.com>
Date: Mon, 12 Apr 2021 10:26:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAAOTY_-gqN2HCLg6AABsXYzJoBxpN8FkMfjqWFu2q=6noiY1qg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_012635_182793_266D98BA 
X-CRM114-Status: GOOD (  21.82  )
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

T24gMTAvMDQvMjAyMSAwMDo0MSwgQ2h1bi1LdWFuZyBIdSB3cm90ZToKPiBIaSwgTmVpbDoKPiAK
PiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+IOaWvCAyMDIx5bm0NOac
iDnml6Ug6YCx5LqUIOS4i+WNiDQ6NDPlr6vpgZPvvJoKPj4KPj4gT24gTVQ4MTY3LCBvbmx5IENF
QSBtb2RlcyBhbmQgYW55dGhpbmcgdXNpbmcgYSBjbG9jayBiZWxvdyAxNDg1MDAgaXMKPj4gc3Vw
cG9ydGVkIGZvciBIRE1JLiBUaGlzIGNoYW5nZSBhZGRzIHNvbWUgY2hlY2tzIHRvIG1ha2Ugc3Vy
ZSB0aGUKPj4gdmlkZW8gZm9ybWF0IGlzIE9LIGZvciBNVDgxNjcuCj4gCj4gSSB0aGluayB0aGlz
IHBhdGNoIHNob3VsZCBiZSBzZXBhcmF0ZWQgdG8gMyBwYXRjaGVzLiBjaGVjayBDRUEgbW9kZSwK
PiBjaGVjayBjbG9jaywgYWRkIG10ODE2NyBoZG1pIHN1cHBvcnQuCgpPawoKPiAKPj4KPj4gU2ln
bmVkLW9mZi1ieTogRmFiaWVuIFBhcmVudCA8ZnBhcmVudEBiYXlsaWJyZS5jb20+Cj4+IFNpZ25l
ZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KPj4gLS0t
Cj4+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyB8IDE3ICsrKysrKysrKysr
KysrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+PiBpbmRleCA4ZWU1NWY5ZTI5NTQuLjk5MWUyZTkzNWI5
MyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKPj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKPj4gQEAgLTE0OCw2ICsx
NDgsOCBAQCBzdHJ1Y3QgaGRtaV9hdWRpb19wYXJhbSB7Cj4+Cj4+ICBzdHJ1Y3QgbXRrX2hkbWlf
Y29uZiB7Cj4+ICAgICAgICAgYm9vbCB0el9kaXNhYmxlZDsKPj4gKyAgICAgICB1bnNpZ25lZCBs
b25nIG1heF9tb2RlX2Nsb2NrOwo+PiArICAgICAgIGJvb2wgY2VhX21vZGVzX29ubHk7Cj4+ICB9
Owo+Pgo+PiAgc3RydWN0IG10a19oZG1pIHsKPj4gQEAgLTEyNTksNiArMTI2MSwxMyBAQCBzdGF0
aWMgaW50IG10a19oZG1pX2Nvbm5fbW9kZV92YWxpZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
biwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIE1PREVfQkFEOwo+PiAgICAgICAg
IH0KPj4KPj4gKyAgICAgICBpZiAoaGRtaS0+Y29uZi0+Y2VhX21vZGVzX29ubHkgJiYgIWRybV9t
YXRjaF9jZWFfbW9kZShtb2RlKSkKPj4gKyAgICAgICAgICAgICAgIHJldHVybiBNT0RFX0JBRDsK
Pj4gKwo+PiArICAgICAgIGlmIChoZG1pLT5jb25mLT5tYXhfbW9kZV9jbG9jayAmJgo+PiArICAg
ICAgICAgICBtb2RlLT5jbG9jayA+IGhkbWktPmNvbmYtPm1heF9tb2RlX2Nsb2NrKQo+PiArICAg
ICAgICAgICAgICAgcmV0dXJuIE1PREVfQ0xPQ0tfSElHSDsKPj4gKwo+PiAgICAgICAgIGlmICht
b2RlLT5jbG9jayA8IDI3MDAwKQo+PiAgICAgICAgICAgICAgICAgcmV0dXJuIE1PREVfQ0xPQ0tf
TE9XOwo+PiAgICAgICAgIGlmIChtb2RlLT5jbG9jayA+IDI5NzAwMCkKPj4gQEAgLTE4MTAsMTAg
KzE4MTksMTggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfaGRtaV9jb25mIG10a19oZG1pX2Nv
bmZfbXQyNzAxID0gewo+PiAgICAgICAgIC50el9kaXNhYmxlZCA9IHRydWUsCj4+ICB9Owo+Pgo+
PiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfaGRtaV9jb25mIG10a19oZG1pX2NvbmZfbXQ4MTY3
ID0gewo+PiArICAgICAgIC5tYXhfbW9kZV9jbG9jayA9IDE0ODUwMCwKPj4gKyAgICAgICAuY2Vh
X21vZGVzX29ubHkgPSB0cnVlLAo+PiArfTsKPj4gKwo+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBv
Zl9kZXZpY2VfaWQgbXRrX2RybV9oZG1pX29mX2lkc1tdID0gewo+PiAgICAgICAgIHsgLmNvbXBh
dGlibGUgPSAibWVkaWF0ZWssbXQyNzAxLWhkbWkiLAo+PiAgICAgICAgICAgLmRhdGEgPSAmbXRr
X2hkbWlfY29uZl9tdDI3MDEsCj4+ICAgICAgICAgfSwKPj4gKyAgICAgICB7IC5jb21wYXRpYmxl
ID0gIm1lZGlhdGVrLG10ODE2Ny1oZG1pIiwKPiAKPiAibWVkaWF0ZWssbXQ4MTY3LWhkbWkiIGRv
ZXMgbm90IGV4aXN0IGluIGJpbmRpbmcgZG9jdW1lbnQsIHNvIGFkZCB0aGlzCj4gdG8gYmluZGlu
ZyBkb2N1bWVudCBmaXJzdC4KPiBJbiBhZGRpdGlvbiwgY291bGQgeW91IGFsc28gdHJhbnNmZXIg
bWVkaWF0ZWssaGRtaS50eHQgdG8geWFtbCBmb3JtYXQ/CgpTdXJlCgpUaGFua3MsCk5laWwKCj4g
Cj4gUmVnYXJkcywKPiBDaHVuLUt1YW5nLgo+IAo+PiArICAgICAgICAgLmRhdGEgPSAmbXRrX2hk
bWlfY29uZl9tdDgxNjcsCj4+ICsgICAgICAgfSwKPj4gICAgICAgICB7IC5jb21wYXRpYmxlID0g
Im1lZGlhdGVrLG10ODE3My1oZG1pIiwKPj4gICAgICAgICB9LAo+PiAgICAgICAgIHt9Cj4+IC0t
Cj4+IDIuMjUuMQo+PgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
