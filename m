Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63831C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 18:57:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 206B360F36
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 18:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 206B360F36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=H2yE27+98N7SEOnYdDYkirUx32a7i8exCt5QWSbZ0jk=; b=n4dJP/RQ3TEPvcwQY3BLNTb8wF
	43FX2Ox53tqneuifXqJqzEuLFm4azbEnScrBb4laZrBKHY6KXQ0DUX43Hnn6oLEWg3iieSpu0rZvY
	5oXA2bBKqF+JuPVFyE7dhzJicYDUJi9oR4ACC5QWy6aW3eZrAykkSvNDheW7Z2hbuhS26DFeFONAZ
	0Wemgvjy/DoKJz6lr0LcoI5xlFPJN1tqhSMoDM289KG78EEXoFsa60b103HkhVXy5hxk2td5zUu/z
	HkGFL4TI4rHt5LLXZChSIS5nHmZ31aYj7KezpPOvw2Yo/7N7F7lBYKjfo1i3i7EH0uh+IvMKmvB+y
	pzCvw/+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFhnE-0002kS-PQ; Mon, 16 Aug 2021 18:57:04 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFhn9-0002hd-8Z
 for linux-mediatek@lists.infradead.org; Mon, 16 Aug 2021 18:57:03 +0000
Received: by mail-wm1-x335.google.com with SMTP id g138so12164098wmg.4
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Aug 2021 11:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m7ZOM7cdRkICqtiyacBDNsj4qURRxO1sWw5i5EgJhx0=;
 b=HzJ75RUvClIBbqraulv6LCtCEKRyhF9l86bNICahsL0BMDn+tr2MAGedaCoiS/M7HI
 3Ttln2ZDTzMQV/73OAgb5gWdhqVTcAfaMui/jwC/yGkqKyrWPECIE5BGB9wuRotTtJZR
 n8glPdDvrAkL6NsfQuijpU7NTf+EitF7KrlYHBWiagTBD87z3EiqPC6ePhyVfex4LW1R
 bzJOqbK5rRd2/pUmjgicupfKYa5CF6ZgyjklG6WR05kEG1tJglD4u63hsIct80uAMX0l
 mufsLlgPEG0x9jXY+YS8QfK1nmsTKOsGjQu5tgwNUmQkNLRKK/BFJRlM20iaJgIeqnG2
 Ks6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m7ZOM7cdRkICqtiyacBDNsj4qURRxO1sWw5i5EgJhx0=;
 b=OMdmAXgkhmTb6D5AZojQs0JoJZfm1T4inU52kETdtkW2YC16TNmJIp+rUXssoCI+z2
 wqT1gkFWtJBQjduQA1oppoOQqlaL9gNIzz67gQgf55Inmef7UDDOdbaOh4OxHtQGYDWb
 QRlg1MsdiuRZTkYRGol4w5vvnEXiPvNGW/lv8+rcjaGD1ZtLm8im4yiqRtOMrrzvDjud
 u/8d8jtuSE31M0vk4kYIP+2MtI1PPHiwGlJu3fl3pEL5Hy0EmYCVAgTga/9izmjpvJq4
 WS8uBIQ/7hm0rJH9wtjBzY+5b9eUNdki+f7+cGmnp8s0I6agu0+v7dZAioY3R/qQL7x9
 AZfg==
X-Gm-Message-State: AOAM531gUev66/d6l9NYEQtdNJPiG5nzFlgkSVDbiV2R0bADOd0yw6zz
 x77xgymSNYlDty2JQWNXSo/vbGbX75u1Crb5
X-Google-Smtp-Source: ABdhPJzoBGbVSUBBJBd79CzIiBUvM5rY3Ebc57V8YSLGDbhAuaNana1b9dAMLW1tLEGIgbbn9dJJ0g==
X-Received: by 2002:a1c:f414:: with SMTP id z20mr524519wma.94.1629140216638;
 Mon, 16 Aug 2021 11:56:56 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:e1b0:48c1:6199:9cb4?
 ([2a01:e34:ed2f:f020:e1b0:48c1:6199:9cb4])
 by smtp.googlemail.com with ESMTPSA id g9sm386690wmk.34.2021.08.16.11.56.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 11:56:56 -0700 (PDT)
Subject: Re: [PATCH v5 2/3] thermal: mediatek: Add LVTS drivers for SoC
 theraml zones
To: Ben Tseng <ben.tseng@mediatek.com>, Fan Chen <fan.chen@mediatek.com>,
 Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
 srv_heupstream@mediatek.com
Cc: Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, hsinyi@chromium.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Michael Kao <michael.kao@mediatek.com>,
 Yu-Chia Chang <ethan.chang@mediatek.com>
References: <20210617114707.10618-1-ben.tseng@mediatek.com>
 <20210617114707.10618-3-ben.tseng@mediatek.com>
 <06b1804c-4675-2997-8c5c-bcdffbcfc4a1@linaro.org>
 <1f92b245537d6390b7b2bde62ce8b99a3df9d445.camel@mediatek.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <8a38b9fe-0448-3ddc-9ffc-c43137b5ecaa@linaro.org>
Date: Mon, 16 Aug 2021 20:56:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1f92b245537d6390b7b2bde62ce8b99a3df9d445.camel@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_115659_384594_1A9358BB 
X-CRM114-Status: GOOD (  23.94  )
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

CkhpIEJlbiwKCk9uIDIzLzA3LzIwMjEgMDg6MTcsIEJlbiBUc2VuZyB3cm90ZToKPiBPbiBNb24s
IDIwMjEtMDYtMjEgYXQgMTM6MjYgKzAyMDAsIERhbmllbCBMZXpjYW5vIHdyb3RlOgo+PiBPbiAx
Ny8wNi8yMDIxIDEzOjQ3LCBCZW4gVHNlbmcgd3JvdGU6Cj4+PiBGcm9tOiBNaWNoYWVsIEthbyA8
bWljaGFlbC5rYW9AbWVkaWF0ZWsuY29tPgo+Pj4KPj4+IEFkZCBhIExWVFMgKExvdyB2b2x0YWdl
IHRoZXJtYWwgc2Vuc29yKSBkcml2ZXIgdG8gcmVwb3J0IGp1bmN0aW9uCj4+PiB0ZW1wZXJhdHVy
ZXMgaW4gTWVkaWF0ZWsgU29DIGFuZCByZWdpc3RlciB0aGUgbWF4aW11bSB0ZW1wZXJhdHVyZQo+
Pj4gb2Ygc2Vuc29ycyBhbmQgZWFjaCBzZW5zb3IgYXMgYSB0aGVybWFsIHpvbmUuCj4+Cj4+IEkg
dGhpbmsgd2UgYWxyZWFkeSB0YWxrZWQgYWJvdXQgdGhhdC4gV2UgZG9uJ3Qgd2FudCBhIHRoZXJt
YWwgc2Vuc29yCj4+IGRyaXZlciB0byBhZ2dyZWdhdGUgdGhlIHRlbXBlcmF0dXJlcyBidXQgY3Jl
YXRlIHNvbWUga2luZG9mIHZpcnR1YWwKPj4gc2Vuc29yIHdpdGggYSBwcm9wZXJ0eSAobWluLCBt
YXgsIGF2ZywgLi4uKSB3aGljaCBpcyB1c2FibGUgYnkKPj4gYW55b25lLgo+Pgo+PiBbIC4uLiBd
Cj4+Cj4+Cj4+Cj4gCj4gRGVhciBEYW5pZWwsCj4gCj4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5
LgoKc29ycnkgdG9vLCBtaXNzZWQgdG8gYW5zd2VyLiBBbm90aGVyIHRocmVhZCBwb2ludGVkIHRv
IHRoaXMgb25lIGFuZCBJCmZpZ3VyZWQgb3V0IEkgZm9yZ290IHRvIGFuc3dlci4KCj4gQWZ0ZXIg
c3VydmV5ICxJJ20gbm90IHN1cmUgd2hldGhlciB0aGUgcGF0Y2hbMV0gaXMgdGhlIGFyY2hpdGVj
dHVyZSBvZgo+IHZpcnR1YWwgdGhlcm1hbCBzZW5zb3Igd2hpY2ggeW91IGNvbW1lbnRlZC4KCkFo
LCB5ZXMgdGhhdCBpcyBraW5kIG9mIHdoYXQgaXQgd291bGQgYmUgcmVxdWVzdGVkIGJ1dCByZWFs
bHkgZ2VuZXJpYyBzbwphbnlvbmUgY2FuIHVzZSBpdC4KCj4gT3IsIGlzIHRoZXJlIGFueSBleGlz
dGluZyBmcmFtZXdvcmsgb24gbWFpbmxpbmUgYWxyZWFkeSBzdXBwb3J0IHZpcnR1YWwKPiBzZW5z
b3I/CgpObyB1bmZvcnR1bmF0ZWx5LCBpdCBpcyBub3QgZG9uZSBbeWV0XS4KCj4gQ291bGQgeW91
IGhlbHAgdG8gcHJvdmlkZSByZWZlcmVuY2UgdG8gdXM/CgpPaywgd2UgaGFkIHRoaXMgZGlzY3Vz
c2lvbiBzZXZlcmFsIHRpbWVzIG9uIHRoZSBtYWlsaW5nIGxpc3QgYW5kIGF0IHRoZQpkaWZmZXJl
bnQgZXZlbnRzIGxpa2UgdGhlIExpbnV4IFBsdW1iZXJzIGNvbmZlcmVuY2UuIEJ1dCBJIHdhcyBu
b3QgYWJsZQp0byBmaW5kIG91dCBhIHBvaW50ZXIuCgpCYXNpY2FsbHkgdGhlIGlkZWEgaXMgc2lt
cGxlLCB3ZSBkb24ndCB3YW50IGRyaXZlcnMgZG9pbmcgd2VpcmQgdGhpbmdzCmluIHRoZWlyIGdl
dF90ZW1wIGNhbGxiYWNrLiBUaGlzIGNhbGxiYWNrIG11c3QgcmV0dXJuIHRoZSB0ZW1wZXJhdHVy
ZQphc3NvY2lhdGVkIHRvIGEgcGh5c2ljYWwgc2Vuc29yIGluIGEgMToxIG1hbm5lci4KCkhvd2V2
ZXIsIHNvbWUgcGVvcGxlIHdhbnQgdG8gZGVmaW5lIGEgdGhlcm1hbCB6b25lIGJ1dCB3aXRoIGFu
CmFnZ3JlZ2F0aW9uIG9mIGRpZmZlcmVudCBzZW5zb3JzLgoKQXQgdGhpcyBwb2ludCwgd2UgYXJl
IHVuc3VyZSBob3cgdG8gZG8gdGhhdC4KCkhhdmluZyBhIHZpcnR1YWwgc2Vuc29yIHdvdWxkIGJl
IG1vcmUgYWRlcXVhdGUgYXMgaXQgd29uJ3QgaW1wYWN0CmFueXRoaW5nIGV4Y2VwdCB0aGUgRFQg
Zm9yIGEgY29uZmlndXJhdGlvbi4gQW5kIHdlIGNhbiBtYWtlIGl0IHRvIGV2b2x2ZQp3aXRob3V0
IGhhdmluZyB0byBjaGFuZ2UgYWxsIHRoZSB0aGVybWFsIGZyYW1ld29yayBpbnRlcm5hbHMuCgpG
cm9tIGEgRFQgcG9pbnQgb2YgdmlldywgYSB2aXJ0dWFsIHNlbnNvciBkZXZpY2UgY3VvbGQgaGF2
ZSBwaGFuZGxlcyB0bwp0aGUgZGlmZmVyZW50IHNlbnNvcnMgYW5kIGxldCdzIHNheSBhIHByb3Bl
cnR5IHRlbGxpbmcgd2hhdCBkbyB0byAoYXZnLAptaW4sIG1heCwgLi4uKS4gVGhlIHRoZXJtYWwg
em9uZSB3aWxsIHBvaW50IHRvIHRoZSB2aXJ0dWFsIGRldmljZS4KCkluIHRoZSBkcml2ZXIgaXRz
ZWxmLCB0aGUgZ2V0X3RlbXAgd2lsbCBqdXN0IGNhbGwgZ2V0X3RlbXAgb2YgYWxsIHRoZQpzZW5z
b3JzIGFuZCBkbyB0aGUgb3BlcmF0aW9uIHNwZWNpZmllZCBpbiB0aGUgcHJvcGVydHkuCgpXaXRo
IHRoYXQsIHRoZSBkcml2ZXJzIHN0YXkgY29uc2lzdGVudCBhbmQgd2UgaGF2ZSB0aGUgZmxleGli
aWxpdHkgdG8gZG8Kd2hhdGV2ZXIgd2Ugd2FudC4KCkRvZXMgaXQgbWFrZSBzZW5zZSA/CgoKCi0t
IAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29m
dHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2su
Y29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFy
b29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9n
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
