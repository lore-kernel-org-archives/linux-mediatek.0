Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670B7C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 08:08:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F19D36198C
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 08:08:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F19D36198C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xebXWQ8qjJMEH58HVAvcyrzYSoFjucK+WdIZn3T8fpc=; b=KlqAZzp7P0yYVIMqsUEQy0223
	vhfcS2bxNWJEpdAsrGVBmvFIhiNDryWgUVrlYzqmU967RuBmWeGTQHfwvucE699QgBgtDzVWEcRa7
	bX6MCFb8gNK7Ce/2kZlDqctR/aTrnFk1gSMrzsl8qLYFaqTZLr8FZbPXA32cLupBe8E0gdzjZU1bb
	XDPcG9mRnMM2YvAJeSFeoxjrTdrcWI7liuLRF2sw+/sj46XuaDVbZx3V+qUPaOWobTcecG6dQfRpZ
	09zIYKB0qpTj/TFzV1yehpygBla7UFXrWDIzBxfg86zDpTR4I/cXlNSrTlPtO/kwoiwfHt5z/nsmc
	x1f6shnIA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPL2c-000uDc-77; Thu, 25 Mar 2021 08:08:30 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPL22-000u5J-Un
 for linux-mediatek@lists.infradead.org; Thu, 25 Mar 2021 08:07:58 +0000
Received: by mail-wr1-x42f.google.com with SMTP id x16so1307912wrn.4
 for <linux-mediatek@lists.infradead.org>; Thu, 25 Mar 2021 01:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ItQynOcBUmT2daeIzClvyDiamObFHlZM+po2il7NGQQ=;
 b=F337VBkF8MjeFbPXLUVv+p3BwEBcTQLsElNSRK3KIpxKKh2MJlV3PGaDi23VQ6SLSV
 Qt/0FoW4k/1BwSq4St1ORrlUVQSJEdeq97DRDhd3Wf8avGT+6LGLpAgygewSVN8n91Pq
 2kQXMHHL7zMF+cv/uIDik/ZZ5YPmAgkiMAEkGU+nvJ5Sb+RxxcQ7Z/phG2VRYWUuGXYP
 RAAGee5Reidw+pYMPTP2iUJ1DV1re7jNG45joK19qTHl1IAEocDq5JTr4QZCQuZh3rXg
 6vZeTRIauG1uXhJaZuJbW7yWTngb8nfvn44H2sh9D2lqlnBKo9ela2OmJg81zpY0IQtj
 jmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ItQynOcBUmT2daeIzClvyDiamObFHlZM+po2il7NGQQ=;
 b=puZjITdeicWJYzcryKDgsUp+FoKHTO2lYGDN0F1FXXFo9/MPuKAVKKk1by6Ds1WR7U
 Tw+YHkNHdksiBMByB/D23yT0iHsPnKVoFovkPaZ+bQOSpAQOlu74PpqdX6SJtYT+wIgw
 T/qwYlx/upHDNa4dgNYe1aQV+Al0XIA/+b5tlg4QtWJ5ASp8wTl2iA8aJko0RsnXtrUn
 Mm2NeyAabrnjM/BsNmoQa5Oc7sBvsdUk56kFzl8enabKeAupgA4LSFCZ4iIQ+silqqmj
 QGHQp/qvFVCxealaR+TWC7hIxrM8/tZXKczC/JUu+pxed+MmMHdn3aZdF1fXhkLsaPHl
 LhkA==
X-Gm-Message-State: AOAM5320TvtvQvGqcyi0eHkaSrMDTV0FQAe3Abw26n+L6jt3rFf6nPk7
 DKpvLSw/G7r3npZRVdJ2G5DzJA==
X-Google-Smtp-Source: ABdhPJwdML/QxUKT+3QoJa23+qO8dGO9h3U44vmooj0OX1w4rKyzII4PY323pukeymEh6+h1e9kMDQ==
X-Received: by 2002:adf:de92:: with SMTP id w18mr7373772wrl.217.1616659670443; 
 Thu, 25 Mar 2021 01:07:50 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:d8c1:335e:f39f:249c?
 ([2a01:e34:ed2f:f020:d8c1:335e:f39f:249c])
 by smtp.googlemail.com with ESMTPSA id 81sm5431289wmc.11.2021.03.25.01.07.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 01:07:49 -0700 (PDT)
Subject: Re: [PATCH v2] drivers/clocksource/mediatek: Ack and disable
 interrupts on shutdown
To: Evan Benn <evanbenn@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Stanley Chu <stanley.chu@mediatek.com>,
 Alexey Klimov <alexey.klimov@linaro.org>, Julia Lawall
 <Julia.Lawall@lip6.fr>, Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Viresh Kumar
 <viresh.kumar@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>
References: <20210325123446.v2.1.I1d9917047de06715da16e1620759f703fcfdcbcb@changeid>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <049946ac-5263-21ee-9651-7295f0bcf387@linaro.org>
Date: Thu, 25 Mar 2021 09:07:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210325123446.v2.1.I1d9917047de06715da16e1620759f703fcfdcbcb@changeid>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_080755_351739_15EBF3F5 
X-CRM114-Status: GOOD (  27.63  )
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

T24gMjUvMDMvMjAyMSAwMjozNSwgRXZhbiBCZW5uIHdyb3RlOgo+IHNldF9zdGF0ZV9zaHV0ZG93
biBpcyBjYWxsZWQgZHVyaW5nIHN5c3RlbSBzdXNwZW5kIGFmdGVyIGludGVycnVwdHMgaGF2ZQo+
IGJlZW4gZGlzYWJsZWQuIElmIHRoZSB0aW1lciBoYXMgZmlyZWQgaW4gdGhlIG1lYW50aW1lLCB0
aGVyZSB3aWxsIGJlCj4gYSBwZW5kaW5nIElSUS4gU28gd2UgYWNrIHRoYXQgbm93IGFuZCBkaXNh
YmxlIHRoZSB0aW1lci4gV2l0aG91dCB0aGlzCj4gQVJNIHRydXN0ZWQgZmlybXdhcmUgd2lsbCBh
Ym9ydCB0aGUgc3VzcGVuZCBkdWUgdG8gdGhlIHBlbmRpbmcKPiBpbnRlcnJ1cHQuCj4gCj4gTm93
IGFsd2F5cyBkaXNhYmxlIHRoZSBJUlEgaW4gc3RhdGUgdHJhbnNpdGlvbnMsIGFuZCByZS1lbmFi
bGUgaW4KPiBzZXRfcGVyaW9kaWMgYW5kIG5leHRfZXZlbnQuCgpXaHkgbm90IHB1dCBhZGQgdGhl
IHN1c3BlbmQvcmVzdW1lIGNhbGxiYWNrcyBhbmQgcHV0IHRoZXJlIHRoZSBzcGVjaWZpYwpjb2Rl
IGFuZCBsZXQgdGhlIGlycSB1bnRvdWNoZWQgaW4gdGhlIG5vcm1hbCBmbG93ID8KCj4gU2lnbmVk
LW9mZi1ieTogRXZhbiBCZW5uIDxldmFuYmVubkBjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gCj4gQ2hh
bmdlcyBpbiB2MjoKPiBSZW1vdmUgdGhlIHBhdGNoIHRoYXQgc3BsaXRzIHRoZSBkcml2ZXJzIGlu
dG8gMiBmaWxlcy4KPiAKPiAgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1tZWRpYXRlay5jIHwg
NDkgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMzAgaW5z
ZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xv
Y2tzb3VyY2UvdGltZXItbWVkaWF0ZWsuYyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItbWVk
aWF0ZWsuYwo+IGluZGV4IDkzMThlZGNkODk2My4uZmJhMmY5NDk0ZDkwIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItbWVkaWF0ZWsuYwo+ICsrKyBiL2RyaXZlcnMvY2xv
Y2tzb3VyY2UvdGltZXItbWVkaWF0ZWsuYwo+IEBAIC0xMzIsMTMgKzEzMiwzMyBAQCBzdGF0aWMg
dTY0IG5vdHJhY2UgbXRrX2dwdF9yZWFkX3NjaGVkX2Nsb2NrKHZvaWQpCj4gIAlyZXR1cm4gcmVh
ZGxfcmVsYXhlZChncHRfc2NoZWRfcmVnKTsKPiAgfQo+ICAKPiArc3RhdGljIHZvaWQgbXRrX2dw
dF9kaXNhYmxlX2Fja19pbnRlcnJ1cHRzKHN0cnVjdCB0aW1lcl9vZiAqdG8sIHU4IHRpbWVyKQo+
ICt7Cj4gKwl1MzIgdmFsOwo+ICsKPiArCS8qIERpc2FibGUgaW50ZXJydXB0cyAqLwo+ICsJdmFs
ID0gcmVhZGwodGltZXJfb2ZfYmFzZSh0bykgKyBHUFRfSVJRX0VOX1JFRyk7Cj4gKwl3cml0ZWwo
dmFsICYgfkdQVF9JUlFfRU5BQkxFKHRpbWVyKSwgdGltZXJfb2ZfYmFzZSh0bykgKwo+ICsJICAg
ICAgIEdQVF9JUlFfRU5fUkVHKTsKPiArCj4gKwkvKiBBY2sgaW50ZXJydXB0cyAqLwo+ICsJd3Jp
dGVsKEdQVF9JUlFfQUNLKHRpbWVyKSwgdGltZXJfb2ZfYmFzZSh0bykgKyBHUFRfSVJRX0FDS19S
RUcpOwo+ICt9Cj4gKwo+ICBzdGF0aWMgdm9pZCBtdGtfZ3B0X2Nsa2V2dF90aW1lX3N0b3Aoc3Ry
dWN0IHRpbWVyX29mICp0bywgdTggdGltZXIpCj4gIHsKPiAgCXUzMiB2YWw7Cj4gIAo+ICsJLyog
RGlzYWJsZSB0aW1lciAqLwo+ICAJdmFsID0gcmVhZGwodGltZXJfb2ZfYmFzZSh0bykgKyBHUFRf
Q1RSTF9SRUcodGltZXIpKTsKPiAgCXdyaXRlbCh2YWwgJiB+R1BUX0NUUkxfRU5BQkxFLCB0aW1l
cl9vZl9iYXNlKHRvKSArCj4gIAkgICAgICAgR1BUX0NUUkxfUkVHKHRpbWVyKSk7Cj4gKwo+ICsJ
LyogVGhpcyBtYXkgYmUgY2FsbGVkIHdpdGggaW50ZXJydXB0cyBkaXNhYmxlZCwKPiArCSAqIHNv
IHdlIG5lZWQgdG8gYWNrIGFueSBpbnRlcnJ1cHQgdGhhdCBpcyBwZW5kaW5nCj4gKwkgKiBPciBm
b3IgZXhhbXBsZSBBVEYgd2lsbCBwcmV2ZW50IGEgc3VzcGVuZCBmcm9tIGNvbXBsZXRpbmcuCj4g
KwkgKi8KPiArCW10a19ncHRfZGlzYWJsZV9hY2tfaW50ZXJydXB0cyh0bywgdGltZXIpOwo+ICB9
Cj4gIAo+ICBzdGF0aWMgdm9pZCBtdGtfZ3B0X2Nsa2V2dF90aW1lX3NldHVwKHN0cnVjdCB0aW1l
cl9vZiAqdG8sCj4gQEAgLTE1Miw4ICsxNzIsMTAgQEAgc3RhdGljIHZvaWQgbXRrX2dwdF9jbGtl
dnRfdGltZV9zdGFydChzdHJ1Y3QgdGltZXJfb2YgKnRvLAo+ICB7Cj4gIAl1MzIgdmFsOwo+ICAK
PiAtCS8qIEFja25vd2xlZGdlIGludGVycnVwdCAqLwo+IC0Jd3JpdGVsKEdQVF9JUlFfQUNLKHRp
bWVyKSwgdGltZXJfb2ZfYmFzZSh0bykgKyBHUFRfSVJRX0FDS19SRUcpOwo+ICsJLyogRW5hYmxl
IGludGVycnVwdHMgKi8KPiArCXZhbCA9IHJlYWRsKHRpbWVyX29mX2Jhc2UodG8pICsgR1BUX0lS
UV9FTl9SRUcpOwo+ICsJd3JpdGVsKHZhbCB8IEdQVF9JUlFfRU5BQkxFKHRpbWVyKSwKPiArCSAg
ICAgICB0aW1lcl9vZl9iYXNlKHRvKSArIEdQVF9JUlFfRU5fUkVHKTsKPiAgCj4gIAl2YWwgPSBy
ZWFkbCh0aW1lcl9vZl9iYXNlKHRvKSArIEdQVF9DVFJMX1JFRyh0aW1lcikpOwo+ICAKPiBAQCAt
MjI2LDIxICsyNDgsNiBAQCBfX2luaXQgbXRrX2dwdF9zZXR1cChzdHJ1Y3QgdGltZXJfb2YgKnRv
LCB1OCB0aW1lciwgdTggb3B0aW9uKQo+ICAJICAgICAgIHRpbWVyX29mX2Jhc2UodG8pICsgR1BU
X0NUUkxfUkVHKHRpbWVyKSk7Cj4gIH0KPiAgCj4gLXN0YXRpYyB2b2lkIG10a19ncHRfZW5hYmxl
X2lycShzdHJ1Y3QgdGltZXJfb2YgKnRvLCB1OCB0aW1lcikKPiAtewo+IC0JdTMyIHZhbDsKPiAt
Cj4gLQkvKiBEaXNhYmxlIGFsbCBpbnRlcnJ1cHRzICovCj4gLQl3cml0ZWwoMHgwLCB0aW1lcl9v
Zl9iYXNlKHRvKSArIEdQVF9JUlFfRU5fUkVHKTsKPiAtCj4gLQkvKiBBY2tub3dsZWRnZSBhbGwg
c3B1cmlvdXMgcGVuZGluZyBpbnRlcnJ1cHRzICovCj4gLQl3cml0ZWwoMHgzZiwgdGltZXJfb2Zf
YmFzZSh0bykgKyBHUFRfSVJRX0FDS19SRUcpOwo+IC0KPiAtCXZhbCA9IHJlYWRsKHRpbWVyX29m
X2Jhc2UodG8pICsgR1BUX0lSUV9FTl9SRUcpOwo+IC0Jd3JpdGVsKHZhbCB8IEdQVF9JUlFfRU5B
QkxFKHRpbWVyKSwKPiAtCSAgICAgICB0aW1lcl9vZl9iYXNlKHRvKSArIEdQVF9JUlFfRU5fUkVH
KTsKPiAtfQo+IC0KPiAgc3RhdGljIHN0cnVjdCB0aW1lcl9vZiB0byA9IHsKPiAgCS5mbGFncyA9
IFRJTUVSX09GX0lSUSB8IFRJTUVSX09GX0JBU0UgfCBUSU1FUl9PRl9DTE9DSywKPiAgCj4gQEAg
LTI5Miw2ICsyOTksMTIgQEAgc3RhdGljIGludCBfX2luaXQgbXRrX2dwdF9pbml0KHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbm9kZSkKPiAgCWlmIChyZXQpCj4gIAkJcmV0dXJuIHJldDsKPiAgCj4gKwkv
KiBJbiBjYXNlIHRoZSBmaXJtd2FyZSBsZWZ0IHRoZSBpbnRlcnJ1cHRzIGVuYWJsZWQKPiArCSAq
IGRpc2FibGUgYW5kIGFjayB0aG9zZSBub3cKPiArCSAqLwo+ICsJbXRrX2dwdF9kaXNhYmxlX2Fj
a19pbnRlcnJ1cHRzKCZ0bywgVElNRVJfQ0xLX1NSQyk7Cj4gKwltdGtfZ3B0X2Rpc2FibGVfYWNr
X2ludGVycnVwdHMoJnRvLCBUSU1FUl9DTEtfRVZUKTsKPiArCj4gIAkvKiBDb25maWd1cmUgY2xv
Y2sgc291cmNlICovCj4gIAltdGtfZ3B0X3NldHVwKCZ0bywgVElNRVJfQ0xLX1NSQywgR1BUX0NU
UkxfT1BfRlJFRVJVTik7Cj4gIAljbG9ja3NvdXJjZV9tbWlvX2luaXQodGltZXJfb2ZfYmFzZSgm
dG8pICsgR1BUX0NOVF9SRUcoVElNRVJfQ0xLX1NSQyksCj4gQEAgLTMwNSw4ICszMTgsNiBAQCBz
dGF0aWMgaW50IF9faW5pdCBtdGtfZ3B0X2luaXQoc3RydWN0IGRldmljZV9ub2RlICpub2RlKQo+
ICAJY2xvY2tldmVudHNfY29uZmlnX2FuZF9yZWdpc3RlcigmdG8uY2xrZXZ0LCB0aW1lcl9vZl9y
YXRlKCZ0byksCj4gIAkJCQkJVElNRVJfU1lOQ19USUNLUywgMHhmZmZmZmZmZik7Cj4gIAo+IC0J
bXRrX2dwdF9lbmFibGVfaXJxKCZ0bywgVElNRVJfQ0xLX0VWVCk7Cj4gLQo+ICAJcmV0dXJuIDA7
Cj4gIH0KPiAgVElNRVJfT0ZfREVDTEFSRShtdGtfbXQ2NTc3LCAibWVkaWF0ZWssbXQ2NTc3LXRp
bWVyIiwgbXRrX2dwdF9pbml0KTsKPiAKCgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExp
bmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExp
bmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwK
PGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5s
aW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
