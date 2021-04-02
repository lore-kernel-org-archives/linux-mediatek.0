Return-Path: <SRS0=/k7X=I7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57EC6C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Apr 2021 14:15:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B456761106
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Apr 2021 14:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B456761106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0lsuAX6Tk1U8V5YrBhjKtl3O5Nly4ohRqz2CSNC/O5A=; b=QpTeW2gKE/HLeLsqUB0E/0XL9
	hRKAaj/xU58slXB6tEFo+ONnBPc2ExjhQ0vcooJSt1bHlN0poIc5yI4QPHDqp8FrCJGP8sA4I10BG
	Vfblp90cfkOIrnDyrDU/N9pryU5IhYMtQmoKTNJZ+ibMQnD1Q8c3wPz3LjpZjqlqCEsW4L5h5XMhN
	WXrA3LZgmvKsoze6WQ69Nb23OADxxUHf3fwO146t+5c4kQDtf+t5eL6guWGyJ0G69wkMIqwAdWBKM
	3Jdo7ptsvKbUM1Q7w4l3Q9qxVUwUMVd6MTfLjNvlnrpJv43OSaHmd5soywOSPMOWZUcBuhWcn744n
	ckT0KelvQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSKa8-00D7YA-Vq; Fri, 02 Apr 2021 14:15:29 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSKZy-00D7XG-OT
 for linux-mediatek@lists.infradead.org; Fri, 02 Apr 2021 14:15:21 +0000
Received: by mail-wr1-x42b.google.com with SMTP id i18so1407264wrm.5
 for <linux-mediatek@lists.infradead.org>; Fri, 02 Apr 2021 07:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kn+08Y+8syWf3BIq6nvfSf388zuVhuWp9zeWcCzqy7w=;
 b=zpTd3fJufNsoqgF2kpXYRIbztSDSQ/kpIYpXrVGVQ70wAagZC31L4d2qpg5n6/NucQ
 Gyqq9C6ruWvgPH5PNiEkM/cGx/rMpq/Ukz1aE51QrGunbgruXZQZmVC2eCopkU8o0i2t
 oJhIArEfoEvLq4lrlWib/n6NRN9p+2+rLKKwlOPG+1KuYSGqvDdU4oPoJLah1lWrjpCQ
 DeDp6/ZKAid5mMpyeI/LK69MOHMcQe62uWjItVaRan0N0fpIOnOxSDL5Az5ymvf2mqgL
 7yWtWluw38tybfVmiWpy88tRwvBnMXAlUePNsZtxo57oJzZs2RvVlRX/C33mXb7T1mu8
 tlxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kn+08Y+8syWf3BIq6nvfSf388zuVhuWp9zeWcCzqy7w=;
 b=iNwZOxe2VPQ5wYxEuTIa2uSTnnoRqtzGdcYWRMn6++Q95YXD//HpvsCF0Z53gcEEyG
 vLjVsWK9h725Ep+5WvCXbRuimNHU+gfDeaLfnZc7o2CMDYSqrGAzR2mJura8Hrss5fsr
 EyTtCeRJIIUTMo09+VPFdbGy5g0BuhvtgO3jFlWvQ+EEyYXr0QWXeWOuzCP7cpqFLvXV
 FVfXziqnFlOa8lGlPl7h7NFPj6RFE3Jv/sxg/KpeUZKc4KB4giv/XVOfM3TAMwvpPSQK
 PStJra4NRP00YjY9uJcc/i+VQUe8ECSQGokUASZWEIhuH5Fc+sMt28fAjwvqfL6ldbeL
 zj4g==
X-Gm-Message-State: AOAM530SFx9EtdFhwEkpcD3Ibktal/VHsg7JMijOSFdRtbRF1ZagLL8I
 3wEgAlqcgz3JrYsHecPIRyry+Q==
X-Google-Smtp-Source: ABdhPJxWqQxR/dWDzV5EyWMmMbTFOQb0j4pNLaNkp2JHQqv8+a27RS5SvuxtwmFPRbBy88+4e/Hlow==
X-Received: by 2002:adf:e108:: with SMTP id t8mr15236750wrz.371.1617372915954; 
 Fri, 02 Apr 2021 07:15:15 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:34f1:44bb:31bf:7aaf?
 ([2a01:e34:ed2f:f020:34f1:44bb:31bf:7aaf])
 by smtp.googlemail.com with ESMTPSA id c2sm14874504wrt.47.2021.04.02.07.15.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 07:15:15 -0700 (PDT)
Subject: Re: [PATCH v2] drivers/clocksource/mediatek: Ack and disable
 interrupts on shutdown
To: Evan Benn <evanbenn@gmail.com>
Cc: Evan Benn <evanbenn@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Alexey Klimov <alexey.klimov@linaro.org>, Julia Lawall
 <Julia.Lawall@lip6.fr>, Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Viresh Kumar
 <viresh.kumar@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>
References: <20210325123446.v2.1.I1d9917047de06715da16e1620759f703fcfdcbcb@changeid>
 <049946ac-5263-21ee-9651-7295f0bcf387@linaro.org>
 <CAP8nV8rv6bKARZ31fVqcjVgMe+5UyVG8UAyNsm1hDCP2BbRSgw@mail.gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <67eed9a2-2b97-be1b-3290-948da662ea65@linaro.org>
Date: Fri, 2 Apr 2021 16:15:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAP8nV8rv6bKARZ31fVqcjVgMe+5UyVG8UAyNsm1hDCP2BbRSgw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_151519_021467_4DEFE744 
X-CRM114-Status: GOOD (  31.68  )
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

CkhpIEV2YW4sCgpPbiAyNy8wMy8yMDIxIDAyOjMxLCBFdmFuIEJlbm4gd3JvdGU6Cj4gSGkgRGFu
aWVsLAo+IAo+IFRoYXQgaXMgYSBnb29kIHBvaW50LCBhbmQgSSBkaWQgdHJ5IHRoYXQgYXQgZmly
c3QgYW5kIGl0IHdvcmtzIGZpbmUuIEkKPiB1cGxvYWRlZCB0aGlzIHZlcnNpb24gYmVjYXVzZSB0
aGUgc3VzcGVuZC9yZXN1bWUgY2FsbGJhY2tzIHdlcmUKPiB1bmRvY3VtZW50ZWQgYW5kIG1vc3Rs
eSBub3QgdXNlZCBieSBvdGhlciBjbG9ja3NvdXJjZSBkcml2ZXJzLiBJCj4gdGhvdWdodCBhIHNt
YWxsZXIgZGlmZiBtaWdodCBiZSBwcmVmZXJhYmxlLgo+IEkgYWxzbyB0aG91Z2h0IGl0IHdvdWxk
IGJlIGJldHRlciB0byBzaHV0IG9mZiB0aGUgaW50ZXJydXB0IGFzIHNvb24gYXMKPiBpdCBpcyBu
b3QgbmVlZGVkLCBhdm9pZGluZyBhbnkgb3RoZXIgcG90ZW50aWFsIGJ1Z3MsIGluc3RlYWQgb2Yg
anVzdAo+IGZpeGluZyB0aGUgb25lIHdlIGtub3cgYWJvdXQgd2l0aCBzdXNwZW5kLiBJJ20gbm90
IHN1cmUgaG93IHRoZSBvdGhlcgo+IGRyaXZlciAvIHRpbWVyIGRpc2FibGUgZmxvd3MgYXJlIGlu
dGVuZGVkIHRvIHdvcmsgZm9yIGV4YW1wbGUKPiAoc2h1dGRvd24sIGRldGFjaCwgZXRjKS4KPiAK
PiBUaGF0IHNhaWQgSSBhbSBoYXBweSB0byB1cGxvYWQgdGhhdCB2ZXJzaW9uIGlmIHBlb3BsZSB0
aGluayBpdCBpcyBiZXR0ZXIuCgpJTU8sIGl0IGlzIG5vdCBpbiB0aGUgbm9ybWFsIGZsb3cgdG8g
ZGlzYWJsZS9lbmFibGUgdGhlIGludGVycnVwdHMuCgpEb2VzIHRoaXMgdGltZXIgYmVsb25nIHRv
IGFuIGFsd2F5cy1vbiBwb3dlciBkb21haW4gPwoKCgo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4u
Y29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvaW5jbHVkZS9saW51eC9jbG9ja2NoaXBzLmgjTDEyMAo+
IAo+IAo+IE9uIFRodSwgMjUgTWFyIDIwMjEgYXQgMTk6MTAsIERhbmllbCBMZXpjYW5vIDxkYW5p
ZWwubGV6Y2Fub0BsaW5hcm8ub3JnPiB3cm90ZToKPj4KPj4gT24gMjUvMDMvMjAyMSAwMjozNSwg
RXZhbiBCZW5uIHdyb3RlOgo+Pj4gc2V0X3N0YXRlX3NodXRkb3duIGlzIGNhbGxlZCBkdXJpbmcg
c3lzdGVtIHN1c3BlbmQgYWZ0ZXIgaW50ZXJydXB0cyBoYXZlCj4+PiBiZWVuIGRpc2FibGVkLiBJ
ZiB0aGUgdGltZXIgaGFzIGZpcmVkIGluIHRoZSBtZWFudGltZSwgdGhlcmUgd2lsbCBiZQo+Pj4g
YSBwZW5kaW5nIElSUS4gU28gd2UgYWNrIHRoYXQgbm93IGFuZCBkaXNhYmxlIHRoZSB0aW1lci4g
V2l0aG91dCB0aGlzCj4+PiBBUk0gdHJ1c3RlZCBmaXJtd2FyZSB3aWxsIGFib3J0IHRoZSBzdXNw
ZW5kIGR1ZSB0byB0aGUgcGVuZGluZwo+Pj4gaW50ZXJydXB0LgoKCj4+PiBOb3cgYWx3YXlzIGRp
c2FibGUgdGhlIElSUSBpbiBzdGF0ZSB0cmFuc2l0aW9ucywgYW5kIHJlLWVuYWJsZSBpbgo+Pj4g
c2V0X3BlcmlvZGljIGFuZCBuZXh0X2V2ZW50Lgo+Pgo+PiBXaHkgbm90IHB1dCBhZGQgdGhlIHN1
c3BlbmQvcmVzdW1lIGNhbGxiYWNrcyBhbmQgcHV0IHRoZXJlIHRoZSBzcGVjaWZpYwo+PiBjb2Rl
IGFuZCBsZXQgdGhlIGlycSB1bnRvdWNoZWQgaW4gdGhlIG5vcm1hbCBmbG93ID8KPj4KPj4+IFNp
Z25lZC1vZmYtYnk6IEV2YW4gQmVubiA8ZXZhbmJlbm5AY2hyb21pdW0ub3JnPgo+Pj4gLS0tCj4+
Pgo+Pj4gQ2hhbmdlcyBpbiB2MjoKPj4+IFJlbW92ZSB0aGUgcGF0Y2ggdGhhdCBzcGxpdHMgdGhl
IGRyaXZlcnMgaW50byAyIGZpbGVzLgo+Pj4KPj4+ICBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVy
LW1lZGlhdGVrLmMgfCA0OSArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tCj4+PiAgMSBmaWxl
IGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLW1lZGlhdGVrLmMgYi9kcml2ZXJzL2Ns
b2Nrc291cmNlL3RpbWVyLW1lZGlhdGVrLmMKPj4+IGluZGV4IDkzMThlZGNkODk2My4uZmJhMmY5
NDk0ZDkwIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1tZWRpYXRl
ay5jCj4+PiArKysgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLW1lZGlhdGVrLmMKPj4+IEBA
IC0xMzIsMTMgKzEzMiwzMyBAQCBzdGF0aWMgdTY0IG5vdHJhY2UgbXRrX2dwdF9yZWFkX3NjaGVk
X2Nsb2NrKHZvaWQpCj4+PiAgICAgICByZXR1cm4gcmVhZGxfcmVsYXhlZChncHRfc2NoZWRfcmVn
KTsKPj4+ICB9Cj4+Pgo+Pj4gK3N0YXRpYyB2b2lkIG10a19ncHRfZGlzYWJsZV9hY2tfaW50ZXJy
dXB0cyhzdHJ1Y3QgdGltZXJfb2YgKnRvLCB1OCB0aW1lcikKPj4+ICt7Cj4+PiArICAgICB1MzIg
dmFsOwo+Pj4gKwo+Pj4gKyAgICAgLyogRGlzYWJsZSBpbnRlcnJ1cHRzICovCj4+PiArICAgICB2
YWwgPSByZWFkbCh0aW1lcl9vZl9iYXNlKHRvKSArIEdQVF9JUlFfRU5fUkVHKTsKPj4+ICsgICAg
IHdyaXRlbCh2YWwgJiB+R1BUX0lSUV9FTkFCTEUodGltZXIpLCB0aW1lcl9vZl9iYXNlKHRvKSAr
Cj4+PiArICAgICAgICAgICAgR1BUX0lSUV9FTl9SRUcpOwo+Pj4gKwo+Pj4gKyAgICAgLyogQWNr
IGludGVycnVwdHMgKi8KPj4+ICsgICAgIHdyaXRlbChHUFRfSVJRX0FDSyh0aW1lciksIHRpbWVy
X29mX2Jhc2UodG8pICsgR1BUX0lSUV9BQ0tfUkVHKTsKPj4+ICt9Cj4+PiArCj4+PiAgc3RhdGlj
IHZvaWQgbXRrX2dwdF9jbGtldnRfdGltZV9zdG9wKHN0cnVjdCB0aW1lcl9vZiAqdG8sIHU4IHRp
bWVyKQo+Pj4gIHsKPj4+ICAgICAgIHUzMiB2YWw7Cj4+Pgo+Pj4gKyAgICAgLyogRGlzYWJsZSB0
aW1lciAqLwo+Pj4gICAgICAgdmFsID0gcmVhZGwodGltZXJfb2ZfYmFzZSh0bykgKyBHUFRfQ1RS
TF9SRUcodGltZXIpKTsKPj4+ICAgICAgIHdyaXRlbCh2YWwgJiB+R1BUX0NUUkxfRU5BQkxFLCB0
aW1lcl9vZl9iYXNlKHRvKSArCj4+PiAgICAgICAgICAgICAgR1BUX0NUUkxfUkVHKHRpbWVyKSk7
Cj4+PiArCj4+PiArICAgICAvKiBUaGlzIG1heSBiZSBjYWxsZWQgd2l0aCBpbnRlcnJ1cHRzIGRp
c2FibGVkLAo+Pj4gKyAgICAgICogc28gd2UgbmVlZCB0byBhY2sgYW55IGludGVycnVwdCB0aGF0
IGlzIHBlbmRpbmcKPj4+ICsgICAgICAqIE9yIGZvciBleGFtcGxlIEFURiB3aWxsIHByZXZlbnQg
YSBzdXNwZW5kIGZyb20gY29tcGxldGluZy4KPj4+ICsgICAgICAqLwo+Pj4gKyAgICAgbXRrX2dw
dF9kaXNhYmxlX2Fja19pbnRlcnJ1cHRzKHRvLCB0aW1lcik7Cj4+PiAgfQo+Pj4KPj4+ICBzdGF0
aWMgdm9pZCBtdGtfZ3B0X2Nsa2V2dF90aW1lX3NldHVwKHN0cnVjdCB0aW1lcl9vZiAqdG8sCj4+
PiBAQCAtMTUyLDggKzE3MiwxMCBAQCBzdGF0aWMgdm9pZCBtdGtfZ3B0X2Nsa2V2dF90aW1lX3N0
YXJ0KHN0cnVjdCB0aW1lcl9vZiAqdG8sCj4+PiAgewo+Pj4gICAgICAgdTMyIHZhbDsKPj4+Cj4+
PiAtICAgICAvKiBBY2tub3dsZWRnZSBpbnRlcnJ1cHQgKi8KPj4+IC0gICAgIHdyaXRlbChHUFRf
SVJRX0FDSyh0aW1lciksIHRpbWVyX29mX2Jhc2UodG8pICsgR1BUX0lSUV9BQ0tfUkVHKTsKPj4+
ICsgICAgIC8qIEVuYWJsZSBpbnRlcnJ1cHRzICovCj4+PiArICAgICB2YWwgPSByZWFkbCh0aW1l
cl9vZl9iYXNlKHRvKSArIEdQVF9JUlFfRU5fUkVHKTsKPj4+ICsgICAgIHdyaXRlbCh2YWwgfCBH
UFRfSVJRX0VOQUJMRSh0aW1lciksCj4+PiArICAgICAgICAgICAgdGltZXJfb2ZfYmFzZSh0bykg
KyBHUFRfSVJRX0VOX1JFRyk7Cj4+Pgo+Pj4gICAgICAgdmFsID0gcmVhZGwodGltZXJfb2ZfYmFz
ZSh0bykgKyBHUFRfQ1RSTF9SRUcodGltZXIpKTsKPj4+Cj4+PiBAQCAtMjI2LDIxICsyNDgsNiBA
QCBfX2luaXQgbXRrX2dwdF9zZXR1cChzdHJ1Y3QgdGltZXJfb2YgKnRvLCB1OCB0aW1lciwgdTgg
b3B0aW9uKQo+Pj4gICAgICAgICAgICAgIHRpbWVyX29mX2Jhc2UodG8pICsgR1BUX0NUUkxfUkVH
KHRpbWVyKSk7Cj4+PiAgfQo+Pj4KPj4+IC1zdGF0aWMgdm9pZCBtdGtfZ3B0X2VuYWJsZV9pcnEo
c3RydWN0IHRpbWVyX29mICp0bywgdTggdGltZXIpCj4+PiAtewo+Pj4gLSAgICAgdTMyIHZhbDsK
Pj4+IC0KPj4+IC0gICAgIC8qIERpc2FibGUgYWxsIGludGVycnVwdHMgKi8KPj4+IC0gICAgIHdy
aXRlbCgweDAsIHRpbWVyX29mX2Jhc2UodG8pICsgR1BUX0lSUV9FTl9SRUcpOwo+Pj4gLQo+Pj4g
LSAgICAgLyogQWNrbm93bGVkZ2UgYWxsIHNwdXJpb3VzIHBlbmRpbmcgaW50ZXJydXB0cyAqLwo+
Pj4gLSAgICAgd3JpdGVsKDB4M2YsIHRpbWVyX29mX2Jhc2UodG8pICsgR1BUX0lSUV9BQ0tfUkVH
KTsKPj4+IC0KPj4+IC0gICAgIHZhbCA9IHJlYWRsKHRpbWVyX29mX2Jhc2UodG8pICsgR1BUX0lS
UV9FTl9SRUcpOwo+Pj4gLSAgICAgd3JpdGVsKHZhbCB8IEdQVF9JUlFfRU5BQkxFKHRpbWVyKSwK
Pj4+IC0gICAgICAgICAgICB0aW1lcl9vZl9iYXNlKHRvKSArIEdQVF9JUlFfRU5fUkVHKTsKPj4+
IC19Cj4+PiAtCj4+PiAgc3RhdGljIHN0cnVjdCB0aW1lcl9vZiB0byA9IHsKPj4+ICAgICAgIC5m
bGFncyA9IFRJTUVSX09GX0lSUSB8IFRJTUVSX09GX0JBU0UgfCBUSU1FUl9PRl9DTE9DSywKPj4+
Cj4+PiBAQCAtMjkyLDYgKzI5OSwxMiBAQCBzdGF0aWMgaW50IF9faW5pdCBtdGtfZ3B0X2luaXQo
c3RydWN0IGRldmljZV9ub2RlICpub2RlKQo+Pj4gICAgICAgaWYgKHJldCkKPj4+ICAgICAgICAg
ICAgICAgcmV0dXJuIHJldDsKPj4+Cj4+PiArICAgICAvKiBJbiBjYXNlIHRoZSBmaXJtd2FyZSBs
ZWZ0IHRoZSBpbnRlcnJ1cHRzIGVuYWJsZWQKPj4+ICsgICAgICAqIGRpc2FibGUgYW5kIGFjayB0
aG9zZSBub3cKPj4+ICsgICAgICAqLwo+Pj4gKyAgICAgbXRrX2dwdF9kaXNhYmxlX2Fja19pbnRl
cnJ1cHRzKCZ0bywgVElNRVJfQ0xLX1NSQyk7Cj4+PiArICAgICBtdGtfZ3B0X2Rpc2FibGVfYWNr
X2ludGVycnVwdHMoJnRvLCBUSU1FUl9DTEtfRVZUKTsKPj4+ICsKPj4+ICAgICAgIC8qIENvbmZp
Z3VyZSBjbG9jayBzb3VyY2UgKi8KPj4+ICAgICAgIG10a19ncHRfc2V0dXAoJnRvLCBUSU1FUl9D
TEtfU1JDLCBHUFRfQ1RSTF9PUF9GUkVFUlVOKTsKPj4+ICAgICAgIGNsb2Nrc291cmNlX21taW9f
aW5pdCh0aW1lcl9vZl9iYXNlKCZ0bykgKyBHUFRfQ05UX1JFRyhUSU1FUl9DTEtfU1JDKSwKPj4+
IEBAIC0zMDUsOCArMzE4LDYgQEAgc3RhdGljIGludCBfX2luaXQgbXRrX2dwdF9pbml0KHN0cnVj
dCBkZXZpY2Vfbm9kZSAqbm9kZSkKPj4+ICAgICAgIGNsb2NrZXZlbnRzX2NvbmZpZ19hbmRfcmVn
aXN0ZXIoJnRvLmNsa2V2dCwgdGltZXJfb2ZfcmF0ZSgmdG8pLAo+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBUSU1FUl9TWU5DX1RJQ0tTLCAweGZmZmZmZmZmKTsKPj4+
Cj4+PiAtICAgICBtdGtfZ3B0X2VuYWJsZV9pcnEoJnRvLCBUSU1FUl9DTEtfRVZUKTsKPj4+IC0K
Pj4+ICAgICAgIHJldHVybiAwOwo+Pj4gIH0KPj4+ICBUSU1FUl9PRl9ERUNMQVJFKG10a19tdDY1
NzcsICJtZWRpYXRlayxtdDY1NzctdGltZXIiLCBtdGtfZ3B0X2luaXQpOwo+Pj4KPj4KPj4KPj4g
LS0KPj4gPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNl
IHNvZnR3YXJlIGZvciBBUk0gU29Dcwo+Pgo+PiBGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cu
ZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo+PiA8aHR0cDovL3R3aXR0ZXIu
Y29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8Cj4+IDxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGlu
YXJvLWJsb2cvPiBCbG9nCgoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3Jn
IOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8
aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8v
dHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9y
Zy9saW5hcm8tYmxvZy8+IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
