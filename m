Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2962BC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 12:50:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A80A822CA2
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 12:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A80A822CA2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nSqcGQb/MEoTabRIqRwA19Vhwm++opBgWrqeXp+13+0=; b=1WqnwuaQi3MTaQvFpJL65KVEp
	oE+xXa5WxXuXXTYTWhFhq6A5BvrbyEmBWRyAu+tSw5I0av9Ash7UFoAUlx+lTEJU939WLzh9ass3n
	d3PT80mpPMn6YWjXDUcTDKozov1kTf8KOt3VtdYJXXZuls+B5V2plkXXmjcf1gdF454ZMuCVcYiuW
	IgDdoDduij8QOyG/4Rur37beLt0ixVqFFljwB1K7LwTilRSxbDe4aq8l3ETrrKTsvQc1XcmncWuLS
	MOJDrXTcQEoiwR0Y9oXiXrTB1Cxaqs8K04uZNMQBWgoRmrErZFcliKPYSp8ZgXuFWRJ2Okxm8YX18
	CLM5brzAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx8GG-0001ot-MA; Wed, 06 Jan 2021 12:50:00 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx8GC-0001o6-E4
 for linux-mediatek@lists.infradead.org; Wed, 06 Jan 2021 12:49:57 +0000
Received: by mail-wm1-x32d.google.com with SMTP id q75so2544718wme.2
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Jan 2021 04:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/TFNqMpjunBcCKiBrnJeP1y//MIqYHWIDR79kkwgfkE=;
 b=sfyGdo3EWT8gzyt2KwZFAV2LDV/McqqryurFOfjaIbHKRCP4fQb27tRRH8M23FaAhE
 945R71c4322OL7XhYfrbBQEZ05JUrtgPLRjK9bhbeH+MK1jFGCpMkMlqBiuVNO9r6iZo
 Zri8qk+Z/hYPnRDL6f8me30sUXLW962btc9aBcbe2ao6+x11LVZsXRAkqmqR540gGF9N
 RHw8emMoe+c1RLAiRGOgF/TyNaFiMeXTTAiF/2yt5vWy1NIrFd3rsdkuqSYAWaf0zs1/
 mFWC0Ut+kYnKqdD4VdQbsX+UAAh7wwSzHOYJC8az9BMCrdTfdj/5QJOAN2bZKV9Y5z5c
 ZsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/TFNqMpjunBcCKiBrnJeP1y//MIqYHWIDR79kkwgfkE=;
 b=qv40z+7M4x4vuX6C1KiiG51yxQEj5fZqF+BEjVe8T9MM+lVKFUeRhoD0vN8F+TZ6zn
 b+qP71q0IT8EzmcozT94nQXyhyKgM7FVGRvQbeegNEXthsGgu+YDmSTXHk5kjU8XfCrQ
 /99qmY6wqAeGgfdfJHS4827MARudv82Kqf1c+eFqy7b+ietT8iruKohQ5tEQsJGdAxTc
 msQE8AW6HiVWXHoyloz1DgYWYinxPKqYDgYYZQv9Mbpg73K6wFbVMZyo7VvqwJl7BE4e
 L94jI14rHYuqePz7dzCM19gXbxJD1A0mapK+75nGspqcifcw0iaUBFGAibQCyjpZKo2q
 LN3Q==
X-Gm-Message-State: AOAM5309FHT+ca/DQp4kAQsAgcoOD+aCsTDTbRap3NT5LM4yLbGsv6x7
 dQoz5B7rZ+L5MOmUmZX84KZRZA==
X-Google-Smtp-Source: ABdhPJyALikTC19hcprzApRUBK4PYCJ8dtTZah4EqhL5+ULtjNc3izsNuUYa1xkbqfRLADF5kGFFdQ==
X-Received: by 2002:a1c:7716:: with SMTP id t22mr3526846wmi.126.1609937395097; 
 Wed, 06 Jan 2021 04:49:55 -0800 (PST)
Received: from MacBook-Pro.local ([212.45.67.2])
 by smtp.googlemail.com with ESMTPSA id z6sm2990551wrw.58.2021.01.06.04.49.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jan 2021 04:49:54 -0800 (PST)
Subject: Re: [PATCH V6 08/13] interconnect: mediatek: Add interconnect
 provider driver
To: =?UTF-8?B?SGVucnlDIENoZW4gKOmZs+W7uuixqik=?= <HenryC.Chen@mediatek.com>
References: <1608790134-27425-1-git-send-email-henryc.chen@mediatek.com>
 <1608790134-27425-9-git-send-email-henryc.chen@mediatek.com>
 <c8b951b0-6412-d905-99e1-6350283b57c1@linaro.org>
 <1609918232.23066.5.camel@mtksdaap41>
 <a416a55c-0a7e-6505-ef53-b03f5dbc6cdc@linaro.org>
 <c9b360dcb17e452595f45adb51dd4c31@mtkmbs02n1.mediatek.inc>
From: Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <88d123cf-c69e-dc7f-ddf1-f9ade47d33fc@linaro.org>
Date: Wed, 6 Jan 2021 14:49:51 +0200
MIME-Version: 1.0
In-Reply-To: <c9b360dcb17e452595f45adb51dd4c31@mtkmbs02n1.mediatek.inc>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_074956_612339_10CDCB0C 
X-CRM114-Status: GOOD (  18.51  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 =?UTF-8?B?SmFtZXNKSiBMaWFvICjlu5blu7rmmbop?= <jamesjj.liao@mediatek.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 =?UTF-8?B?RmFuIENoZW4gKOmZs+WHoSk=?= <fan.chen@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Ryan Case <ryandcase@chromium.org>,
 =?UTF-8?B?QXJ2aW4gV2FuZyAo546L5b+X6YqYKQ==?= <Arvin.Wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gNi4wMS4yMSAxMjo0NCwgSGVucnlDIENoZW4gKOmZs+W7uuixqikgd3JvdGU6Cj4+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IEdlb3JnaSBEamFrb3YgW21haWx0bzpnZW9y
Z2kuZGpha292QGxpbmFyby5vcmddCj4+IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSAwNiwgMjAy
MSA0OjE0IFBNCj4+IFRvOiBIZW5yeUMgQ2hlbiAo6Zmz5bu66LGqKQo+PiBDYzogUm9iIEhlcnJp
bmc7IE1hdHRoaWFzIEJydWdnZXI7IFN0ZXBoZW4gQm95ZDsgUnlhbiBDYXNlOyBNYXJrIEJyb3du
OyBNYXJrCj4+IFJ1dGxhbmQ7IE5pY29sYXMgQm9pY2hhdDsgRmFuIENoZW4gKOmZs+WHoSk7IEph
bWVzSkogTGlhbyAo5buW5bu65pm6KTsgQXJ2aW4gV2FuZwo+PiAo546L5b+X6YqYKTsgZGV2aWNl
dHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZzsKPj4gbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZzsgbGludXgtCj4+IHBtQHZnZXIua2VybmVsLm9yZwo+PiBTdWJqZWN0OiBS
ZTogW1BBVENIIFY2IDA4LzEzXSBpbnRlcmNvbm5lY3Q6IG1lZGlhdGVrOiBBZGQgaW50ZXJjb25u
ZWN0Cj4+IHByb3ZpZGVyIGRyaXZlcgo+PiAKPj4gT24gMS82LzIxIDA5OjMwLCBIZW5yeSBDaGVu
IHdyb3RlOgo+PiA+IE9uIE1vbiwgMjAyMS0wMS0wNCBhdCAyMDozNiArMDIwMCwgR2VvcmdpIERq
YWtvdiB3cm90ZToKPj4gPj4gT24gMTIvMjQvMjAgMDg6MDgsIEhlbnJ5IENoZW4gd3JvdGU6Cj4+
ID4+PiBJbnRyb2R1Y2UgTWVkaWF0ZWsgTVQ2ODczL01UODE4My9NVDgxOTIgc3BlY2lmaWMgcHJv
dmlkZXIgZHJpdmVyCj4+ID4+PiB1c2luZyB0aGUgaW50ZXJjb25uZWN0IGZyYW1ld29yay4KPj4g
Pj4+Cj4+ID4+PiAgICAgICAgICAgICAgICBJQ0MgcHJvdmlkZXIgICAgICAgICBJQ0MgTm9kZXMK
Pj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0tLSAgICAgICAgICAtLS0t
Cj4+ID4+PiAgICAgICAgICAgICAgICAtLS0tLS0tLS0gICAgICAgfENQVSB8ICAgfC0tLSB8VlBV
IHwKPj4gPj4+ICAgICAgIC0tLS0tICAgfCAgICAgICAgIHwtLS0tLSAgLS0tLSAgICB8ICAgICAt
LS0tCj4+ID4+PiAgICAgIHxEUkFNIHwtLXxEUkFNICAgICB8ICAgICAgIC0tLS0gICAgfCAgICAg
LS0tLQo+PiA+Pj4gICAgICB8ICAgICB8LS18c2NoZWR1bGVyfC0tLS0tIHxHUFUgfCAgIHwtLS0g
fERJU1B8Cj4+ID4+PiAgICAgIHwgICAgIHwtLXwoRU1JKSAgICB8ICAgICAgIC0tLS0gICAgfCAg
ICAgLS0tLQo+PiA+Pj4gICAgICB8ICAgICB8LS18ICAgICAgICAgfCAgICAgICAtLS0tLSAgIHwg
ICAgIC0tLS0KPj4gPj4+ICAgICAgIC0tLS0tICAgfCAgICAgICAgIHwtLS0tLSB8TU1TWVN8LS18
LS0tIHxWREVDfAo+PiA+Pj4gICAgICAgICAgICAgICAgLS0tLS0tLS0tICAgICAgICAtLS0tLSAg
IHwgICAgIC0tLS0KPj4gPj4+ICAgICAgICAgICAgICAgICAgL3xcICAgICAgICAgICAgICAgICAg
ICB8ICAgICAtLS0tCj4+ID4+PiAgICAgICAgICAgICAgICAgICB8Y2hhbmdlIERSQU0gZnJlcSAg
ICAgfC0tLSB8VkVOQ3wKPj4gPj4+ICAgICAgICAgICAgICAgIC0tLS0tLS0tLS0gICAgICAgICAg
ICAgICB8ICAgICAtLS0tCj4+ID4+PiAgICAgICAgICAgICAgIHwgIERWRlNSICAgfCAgICAgICAg
ICAgICAgfAo+PiA+Pj4gICAgICAgICAgICAgICB8ICAgICAgICAgIHwgICAgICAgICAgICAgIHwg
ICAgIC0tLS0KPj4gPj4+ICAgICAgICAgICAgICAgIC0tLS0tLS0tLS0gICAgICAgICAgICAgICB8
LS0tIHxJTUcgfAo+PiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICAgIC0tLS0KPj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgICAtLS0tCj4+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfC0tLSB8Q0FNIHwKPj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAtLS0tCj4+ID4+Pgo+PiA+Pj4gU2lnbmVkLW9mZi1ieTogSGVucnkgQ2hlbiA8
aGVucnljLmNoZW5AbWVkaWF0ZWsuY29tPgo+PiA+Pj4gLS0tCj4+ID4+PiAgICBkcml2ZXJzL2lu
dGVyY29ubmVjdC9LY29uZmlnICAgICAgICAgICAgfCAgIDEgKwo+PiA+Pj4gICAgZHJpdmVycy9p
bnRlcmNvbm5lY3QvTWFrZWZpbGUgICAgICAgICAgIHwgICAxICsKPj4gPj4+ICAgIGRyaXZlcnMv
aW50ZXJjb25uZWN0L21lZGlhdGVrL0tjb25maWcgICB8ICAxMyArKwo+PiA+Pj4gICAgZHJpdmVy
cy9pbnRlcmNvbm5lY3QvbWVkaWF0ZWsvTWFrZWZpbGUgIHwgICAzICsKPj4gPj4+ICAgIGRyaXZl
cnMvaW50ZXJjb25uZWN0L21lZGlhdGVrL210ay1lbWkuYyB8IDMzMAo+PiArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwo+PiA+Pj4gICAgNSBmaWxlcyBjaGFuZ2VkLCAzNDggaW5zZXJ0
aW9ucygrKQo+PiA+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaW50ZXJjb25uZWN0
L21lZGlhdGVrL0tjb25maWcKPj4gPj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2lu
dGVyY29ubmVjdC9tZWRpYXRlay9NYWtlZmlsZQo+PiA+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvaW50ZXJjb25uZWN0L21lZGlhdGVrL210ay1lbWkuYwo+PiA+Pj4KPj4gPj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2ludGVyY29ubmVjdC9LY29uZmlnCj4+ID4+PiBiL2RyaXZlcnMv
aW50ZXJjb25uZWN0L0tjb25maWcgaW5kZXggNWI3MjA0ZS4uZTkzOWY1YSAxMDA2NDQKPj4gPj4+
IC0tLSBhL2RyaXZlcnMvaW50ZXJjb25uZWN0L0tjb25maWcKPj4gPj4+ICsrKyBiL2RyaXZlcnMv
aW50ZXJjb25uZWN0L0tjb25maWcKPj4gPj4+IEBAIC0xMyw1ICsxMyw2IEBAIGlmIElOVEVSQ09O
TkVDVAo+PiA+Pj4KPj4gPj4+ICAgIHNvdXJjZSAiZHJpdmVycy9pbnRlcmNvbm5lY3QvaW14L0tj
b25maWciCj4+ID4+PiAgICBzb3VyY2UgImRyaXZlcnMvaW50ZXJjb25uZWN0L3Fjb20vS2NvbmZp
ZyIKPj4gPj4+ICtzb3VyY2UgImRyaXZlcnMvaW50ZXJjb25uZWN0L21lZGlhdGVrL0tjb25maWci
Cj4+ID4+Cj4+ID4+IFNvcnQgYWxwaGFiZXRpY2FsbHkgcGxlYXNlLgo+PiA+IE9rCj4+ID4+Cj4+
ID4+Pgo+PiA+Pj4gICAgZW5kaWYKPj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2ludGVyY29u
bmVjdC9NYWtlZmlsZQo+PiA+Pj4gYi9kcml2ZXJzL2ludGVyY29ubmVjdC9NYWtlZmlsZSBpbmRl
eCBkMjAzNTIwLi4wNjQzYTI0IDEwMDY0NAo+PiA+Pj4gLS0tIGEvZHJpdmVycy9pbnRlcmNvbm5l
Y3QvTWFrZWZpbGUKPj4gPj4+ICsrKyBiL2RyaXZlcnMvaW50ZXJjb25uZWN0L01ha2VmaWxlCj4+
ID4+PiBAQCAtNiwzICs2LDQgQEAgaWNjLWNvcmUtb2Jqczo9IGNvcmUubyBidWxrLm8KPj4gPj4+
ICAgIG9iai0kKENPTkZJR19JTlRFUkNPTk5FQ1QpKz0gaWNjLWNvcmUubwo+PiA+Pj4gICAgb2Jq
LSQoQ09ORklHX0lOVEVSQ09OTkVDVF9JTVgpKz0gaW14Lwo+PiA+Pj4gICAgb2JqLSQoQ09ORklH
X0lOVEVSQ09OTkVDVF9RQ09NKSs9IHFjb20vCj4+ID4+PiArb2JqLSQoQ09ORklHX0lOVEVSQ09O
TkVDVF9NVEspKz0gbWVkaWF0ZWsvCj4+ID4+Cj4+ID4+IERpdHRvLgo+PiA+IE9rCj4+ID4+Cj4+
ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbnRlcmNvbm5lY3QvbWVkaWF0ZWsvS2NvbmZpZwo+
PiA+Pj4gYi9kcml2ZXJzL2ludGVyY29ubmVjdC9tZWRpYXRlay9LY29uZmlnCj4+ID4+PiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+PiA+Pj4gaW5kZXggMDAwMDAwMC4uOTcyZDNiYgo+PiA+Pj4gLS0t
IC9kZXYvbnVsbAo+PiA+Pj4gKysrIGIvZHJpdmVycy9pbnRlcmNvbm5lY3QvbWVkaWF0ZWsvS2Nv
bmZpZwo+PiA+Pj4gQEAgLTAsMCArMSwxMyBAQAo+PiA+Pj4gK2NvbmZpZyBJTlRFUkNPTk5FQ1Rf
TVRLCj4+ID4+PiArYm9vbCAiTWVkaWF0ZWsgTmV0d29yay1vbi1DaGlwIGludGVyY29ubmVjdCBk
cml2ZXJzIgo+PiA+Pj4gK2RlcGVuZHMgb24gQVJDSF9NRURJQVRFSwo+PiA+Pj4gK2hlbHAKPj4g
Pj4+ICsgIFN1cHBvcnQgZm9yIE1lZGlhdGVrJ3MgTmV0d29yay1vbi1DaGlwIGludGVyY29ubmVj
dCBoYXJkd2FyZS4KPj4gPj4+ICsKPj4gPj4+ICtjb25maWcgSU5URVJDT05ORUNUX01US19FTUkK
Pj4gPj4+ICt0cmlzdGF0ZSAiTWVkaWF0ZWsgRU1JIGludGVyY29ubmVjdCBkcml2ZXIiCj4+ID4+
PiArZGVwZW5kcyBvbiBJTlRFUkNPTk5FQ1RfTVRLCj4+ID4+PiArZGVwZW5kcyBvbiAoTVRLX0RW
RlNSQyAmJiBPRikKPj4gPj4KPj4gPj4gV291bGQgaXQgYmUgcG9zc2libGUgdG8gZW5hYmxlIENP
TVBJTEVfVEVTVD8KPj4gPiBEbyB5b3UgbWVhbnMgY2hhbmdlIHRvICJkZXBlbmRzIG9uIChNVEtf
RFZGU1JDICYmIE9GKSB8fCBDT01QSUxFX1RFU1QiID8KPj4gCj4+IFllYWgsIHRoZXJlIGlzIGEg
c3R1YiBmb3IgbXRrX2R2ZnNyY19zZW5kX3JlcXVlc3QoKS4gTWF5YmUgd2UgY291bGQgZXZlbgo+
PiBjaGFuZ2UgaXQgZm9yIElOVEVSQ09OTkVDVF9NVEsgdG8gc29tZXRoaW5nIGxpa2U6Cj4+IGRl
cGVuZHMgb24gQVJDSF9NRURJQVRFSyB8fCBDT01QSUxFX1RFU1QgV2lsbCB0aGlzIHdvcms/Cj4g
SGkgR2VvcmdpLAo+IAo+IFNvLi5vbmx5IGNoYW5nZSB0byBhcyBmb2xsb3dpbmc/Cj4gCj4gY29u
ZmlnIElOVEVSQ09OTkVDVF9NVEsKPiBib29sICJNZWRpYXRlayBOZXR3b3JrLW9uLUNoaXAgaW50
ZXJjb25uZWN0IGRyaXZlcnMiCj4gZGVwZW5kcyBvbiBBUkNIX01FRElBVEVLIHx8IENPTVBJTEVf
VEVTVAo+IGhlbHAKPiAgICBTdXBwb3J0IGZvciBNZWRpYXRlaydzIE5ldHdvcmstb24tQ2hpcCBp
bnRlcmNvbm5lY3QgaGFyZHdhcmUuCgpJIHdvdWxkIHNheSB0byBhZGQgQ09NUElMRV9URVNUIGZv
ciBib3RoIElOVEVSQ09OTkVDVF9NVEsgYW5kCklOVEVSQ09OTkVDVF9NVEtfRU1JLCB1bmxlc3Mg
dGhlcmUgaXMgc29tZSBkZXBlbmRlbmN5IHdoaWNoIGRvZXMKbm90IGFsbG93IHVzIHRvIGRvIHNv
LgoKVGhhbmtzLApHZW9yZ2kKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
