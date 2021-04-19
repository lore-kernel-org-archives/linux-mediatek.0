Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F8A2C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 08:33:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3C6361029
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 08:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3C6361029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LkuASpKNCu44w/3VwGZbjsD+T16h1W8SqLb6n/sq28o=; b=NsXlQccXnz1PTTbjY/n85Vuar
	FF2hI2wxZgbUgMMF5zAWD4ZO6w0vb0xJRUoEwOLV0Pi2t4guvrCv6yvrNaVHZH1UWekieNhzLLxZP
	u3EpSN95eDC371HrRmvllmrtxjw26n4X42UI7rlHqXdpjRTKeKruz+3RpqObCNhiuhn9V3vXga4J5
	A7nqC+0mla9XJYmrht0GbjNIoVsfahZ8bzM7Ys8s952ED4HVMKvPcpMHMLAZDqGtr31RF7RttB1e8
	+XYIf97NgGqhJrIR5+oVz9LUxA9n4yq2UTcPeXs8RlFsmjBCkGlXc1qr7T0RIhm/QDGSI36J3gbiT
	OpbZgU1GA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYPLF-009R5J-O0; Mon, 19 Apr 2021 08:33:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYPLD-009R50-39
 for linux-mediatek@desiato.infradead.org; Mon, 19 Apr 2021 08:33:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=YwGEofnYqrSMdgze3a6W2GQYeIBqGGaYbDUA6vt3vKo=; b=x1FVdOBFSpaFYEzJLiJYvzuM86
 96OvLPh/D9UHbixq/lYYnHN3USwkVbHO64JwJCKnKGkQ6vNfrsiz3JngW8i0t4qsD2zVzXf5VsIVf
 sfsoLXTE/JwvF4qY4fFBfFtOVddOrg7xcBGDgVXAsumrqnRJHTzbGbHNxVtxsY/rcTOZamBZWR87h
 v1EwiQn8NPQ/wzoVoXwQRRAeAocE/JXmxBuDVXcJvGrrYf+ZOfVCCaQDWBR4rjRcNx7X5lllVcWFP
 +f/kGQK/gBHCXooiDVf1glYbVOF7L16nHLj9yK195JkJTwfWc/soLY0LVZO6HsPLHJI0bsqfdSkZH
 QPmKSqDw==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYPL7-00BBrX-VJ
 for linux-mediatek@lists.infradead.org; Mon, 19 Apr 2021 08:33:09 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 d200-20020a1c1dd10000b02901384767d4a5so1544666wmd.3
 for <linux-mediatek@lists.infradead.org>; Mon, 19 Apr 2021 01:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YwGEofnYqrSMdgze3a6W2GQYeIBqGGaYbDUA6vt3vKo=;
 b=sY39fkO9gzV2OOZ3mQUmHEXWL25JK42CMP9UfCDOvL6iTg2W/IxtRe2ADaWrJhlUBU
 ybBynFYKWFJoBYx3os8jOydAU4Jlrxr6NYOpPi2HaLPz6tHjRiCPqxquo8bjg2P7V9/N
 pXmHq/qqrGJSFt0yLGXoZqW6monxkaRnUHj2tOWAQSX4zrrXTneihvMCie0XQiayY1Vu
 j3uONKpZi7Coz5IQS1CPnoK4R3yG1G6oRXZITnPbJf/GrEIw+XPeu3j4l5t7iGuQBHWC
 2EbMC5aNNVCnxiEbxSBL6VLpdW4fgHhgPPHNmCcmxGaQh2fazwiHY56De4D4xF5JqqVo
 Sp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YwGEofnYqrSMdgze3a6W2GQYeIBqGGaYbDUA6vt3vKo=;
 b=NX3QoCT3GleO8qdugsLrwr+4DnD9a5g3C3C9IwsZ1xUH20FtNyt/usV6B41CW+7/sj
 tg2519J/5w0yN0ygD9AViYWxuFjrbfpn++mP5x4niI7p0YbCc078wRK6WcRD3D+uC9yI
 rCisqo0B1m7XBSQWKaLz81cEIyNDVRuDSmzbffKsldji23Xlt9oco5H9MasNdstAt9Xg
 CB9kfJUWUGTVC7y7vO32objX8DozX0SOtWsUPdwSSYXw16lXsHvh5mbn2wRjl1FOf9Gk
 RVdVjBoYBYzJ5dRnC7R9ZAa2DRy9u3lPdGYY3mkMZUggUWZrlutogkMQf04fFnl3I7hX
 KAvA==
X-Gm-Message-State: AOAM531PBx0lowJOVIiY5E93o4lAnKQ1F+J8LKmhRG17Pko5HVxndBBQ
 79lWVoWtqjolVff+O03X6rQlMg==
X-Google-Smtp-Source: ABdhPJytCUAriVHySrcb+bsrQYHcDr2ZuO/waZciNVUCjaiN9QDanVUjNYbH38fH0WjMuejRKOXPKA==
X-Received: by 2002:a1c:60c2:: with SMTP id
 u185mr20068734wmb.157.1618821183863; 
 Mon, 19 Apr 2021 01:33:03 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:796f:a096:3809:6fc5?
 ([2a01:e34:ed2f:f020:796f:a096:3809:6fc5])
 by smtp.googlemail.com with ESMTPSA id f23sm18932470wmf.37.2021.04.19.01.33.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 01:33:03 -0700 (PDT)
Subject: Re: [PATCH v3] drivers/clocksource/mediatek: Ack and disable
 interrupts on suspend
To: Evan Benn <evanbenn@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>, 
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Julia Lawall <Julia.Lawall@lip6.fr>,
 Stanley Chu <stanley.chu@mediatek.com>, Thomas Gleixner
 <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
References: <20210412132200.v3.1.I1d9917047de06715da16e1620759f703fcfdcbcb@changeid>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <3e4803f8-7c38-6f71-fc89-2fa763e3395e@linaro.org>
Date: Mon, 19 Apr 2021 10:33:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210412132200.v3.1.I1d9917047de06715da16e1620759f703fcfdcbcb@changeid>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_013306_095926_C9BFF55A 
X-CRM114-Status: GOOD (  24.67  )
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

T24gMTIvMDQvMjAyMSAwNToyMiwgRXZhbiBCZW5uIHdyb3RlOgo+IEludGVycnVwdHMgYXJlIGRp
c2FibGVkIGR1cmluZyBzdXNwZW5kIGJlZm9yZSB0aGlzIGRyaXZlciBkaXNhYmxlcyBpdHMKPiB0
aW1lcnMuIEFSTSB0cnVzdGVkIGZpcm13YXJlIHdpbGwgYWJvcnQgc3VzcGVuZCBpZiB0aGUgdGlt
ZXIgaXJxIGlzCj4gcGVuZGluZywgc28gYWNrIGFuZCBkaXNhYmxlIHRoZSB0aW1lciBpbnRlcnJ1
cHQgZHVyaW5nIHN1c3BlbmQuCj4gCj4gU2lnbmVkLW9mZi1ieTogRXZhbiBCZW5uIDxldmFuYmVu
bkBjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gCj4gQ2hhbmdlcyBpbiB2MzoKPiBNb3ZlIHRoZSBBQ0sg
ZnJvbSB0aGUgc2h1dGRvd24gdG8gdGhlIHN1c3BlbmQgZnVuY3Rpb24uCj4gCj4gQ2hhbmdlcyBp
biB2MjoKPiBSZW1vdmUgdGhlIHBhdGNoIHRoYXQgc3BsaXRzIHRoZSBkcml2ZXJzIGludG8gMiBm
aWxlcy4KPiAKPiAgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1tZWRpYXRlay5jIHwgMjMgKysr
KysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1tZWRpYXRlay5jIGIv
ZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1tZWRpYXRlay5jCj4gaW5kZXggOTMxOGVkY2Q4OTYz
Li4xYWU4ZmVlNjM5YmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1t
ZWRpYXRlay5jCj4gKysrIGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1tZWRpYXRlay5jCj4g
QEAgLTI0MSw2ICsyNDEsMjcgQEAgc3RhdGljIHZvaWQgbXRrX2dwdF9lbmFibGVfaXJxKHN0cnVj
dCB0aW1lcl9vZiAqdG8sIHU4IHRpbWVyKQo+ICAJICAgICAgIHRpbWVyX29mX2Jhc2UodG8pICsg
R1BUX0lSUV9FTl9SRUcpOwo+ICB9Cj4gIAo+ICtzdGF0aWMgdm9pZCBtdGtfZ3B0X3Jlc3VtZShz
dHJ1Y3QgY2xvY2tfZXZlbnRfZGV2aWNlICpjbGspCj4gK3sKPiArCXN0cnVjdCB0aW1lcl9vZiAq
dG8gPSB0b190aW1lcl9vZihjbGspOwo+ICsKPiArCW10a19ncHRfZW5hYmxlX2lycSh0bywgVElN
RVJfQ0xLX0VWVCk7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIG10a19ncHRfc3VzcGVuZChzdHJ1
Y3QgY2xvY2tfZXZlbnRfZGV2aWNlICpjbGspCj4gK3sKPiArCXN0cnVjdCB0aW1lcl9vZiAqdG8g
PSB0b190aW1lcl9vZihjbGspOwo+ICsKPiArCS8qIERpc2FibGUgYWxsIGludGVycnVwdHMgKi8K
PiArCXdyaXRlbCgweDAsIHRpbWVyX29mX2Jhc2UodG8pICsgR1BUX0lSUV9FTl9SRUcpOwo+ICsK
PiArCS8qIFRoaXMgaXMgY2FsbGVkIHdpdGggaW50ZXJydXB0cyBkaXNhYmxlZCwKClBsZWFzZSBm
aXggdGhlIGNvbW1lbnQgc3R5bGU6CgoJLyoKCSAqIFRoaXMgaXMgY2FsbGVkIHdpdGggaW50ZXJy
dXB0cyBkaXNhYmxlZAoJICogc28gLi4uCgkgKiAuLi4KCSAqLwoKT3RoZXIgdGhhbiB0aGFuIHRo
YXQgSSdsbCBiZSBoYXBweSB0byBwaWNrIGl0LgoKPiArCSAqIHNvIHdlIG5lZWQgdG8gYWNrIGFu
eSBpbnRlcnJ1cHQgdGhhdCBpcyBwZW5kaW5nCj4gKwkgKiBPciBmb3IgZXhhbXBsZSBBVEYgd2ls
bCBwcmV2ZW50IGEgc3VzcGVuZCBmcm9tIGNvbXBsZXRpbmcuCj4gKwkgKi8KPiArCXdyaXRlbCgw
eDNmLCB0aW1lcl9vZl9iYXNlKHRvKSArIEdQVF9JUlFfQUNLX1JFRyk7Cj4gK30KPiArCj4gIHN0
YXRpYyBzdHJ1Y3QgdGltZXJfb2YgdG8gPSB7Cj4gIAkuZmxhZ3MgPSBUSU1FUl9PRl9JUlEgfCBU
SU1FUl9PRl9CQVNFIHwgVElNRVJfT0ZfQ0xPQ0ssCj4gIAo+IEBAIC0yODYsNiArMzA3LDggQEAg
c3RhdGljIGludCBfX2luaXQgbXRrX2dwdF9pbml0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSkK
PiAgCXRvLmNsa2V2dC5zZXRfc3RhdGVfb25lc2hvdCA9IG10a19ncHRfY2xrZXZ0X3NodXRkb3du
Owo+ICAJdG8uY2xrZXZ0LnRpY2tfcmVzdW1lID0gbXRrX2dwdF9jbGtldnRfc2h1dGRvd247Cj4g
IAl0by5jbGtldnQuc2V0X25leHRfZXZlbnQgPSBtdGtfZ3B0X2Nsa2V2dF9uZXh0X2V2ZW50Owo+
ICsJdG8uY2xrZXZ0LnN1c3BlbmQgPSBtdGtfZ3B0X3N1c3BlbmQ7Cj4gKwl0by5jbGtldnQucmVz
dW1lID0gbXRrX2dwdF9yZXN1bWU7Cj4gIAl0by5vZl9pcnEuaGFuZGxlciA9IG10a19ncHRfaW50
ZXJydXB0Owo+ICAKPiAgCXJldCA9IHRpbWVyX29mX2luaXQobm9kZSwgJnRvKTsKPiAKCgotLSAK
PGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3
YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNv
bS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9v
cmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
