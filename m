Return-Path: <SRS0=eXAR=6E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB84C3A5A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2020 07:37:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 761292145D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2020 07:37:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mPfFlG01";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s9Ej0RPY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 761292145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lZr3nr6Dy1ZwmrmOm3yXNO5GZrR7LF+t/ficYSF50Cg=; b=mPfFlG01Y8oKW4
	FHTS6Le+bXYpAnfnxj58xkNnTJ9IzHPlpUNYOn/hs2YPvbSbM9ckIarMEDwTe/t57cN8Wz3SULCIO
	c/uuPA+kZ8pKfNH+a5kZNRnbdpdWKK/3l+NykV5URoRrfQ8DPoY3GaC61QmO/s0ViFYz3kV3uSjkc
	hpuY3+EcMiyBTG8dP3V0MNRHzK/qBLJezInRqPkP/dqg9A9xb/GIpXgK2Hl+wxzF92aTQgzXPG5XK
	aP3H61ONsUrxpjJR+mlY9B365FRujULi4NILy7eRDNGfutnPhWp+44HtVVX7OjrY5Mo2zUczXcSQl
	WB99aBpdwGeK+gp3ffog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQQzp-0007xm-Po; Mon, 20 Apr 2020 07:37:37 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQQzY-0007kl-J6
 for linux-mediatek@lists.infradead.org; Mon, 20 Apr 2020 07:37:22 +0000
Received: by mail-wm1-x341.google.com with SMTP id h2so9809203wmb.4
 for <linux-mediatek@lists.infradead.org>; Mon, 20 Apr 2020 00:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=x4d8njD2ChzZ2kuDWBQWJtIw3UQE6E7sHmhOoB5ezqs=;
 b=s9Ej0RPYb9lJkeS+N4KaZqRVDOm/SMTuNsIfiyVl/sCG8tzdLnNngYV+RVgyER1R3F
 VRzB6TNY6rn0cuPvz+jDOcsgEm6vB1iflYdPxH4S/bamY84eTcqa+4vtDy05GKDS4zS0
 Kmm16bHrfBNiQYXYskNt3fsMJzTC+pNl8kFLLFI9UFzWOxH8F7RfDCklTUfNpN0f2I44
 VR2D/sc2g96ROMto0j2Rr+t14rZ1StFnVNPpwNhsirhV/Pqwh8cGs84i9OzxMvWPinBI
 Lffym77ABv9sVKQAf5rNjW5F0P8/MHbhNn36a9zIpouhrv8SW+gc2OjC9ud+o76ZOm5t
 peAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=x4d8njD2ChzZ2kuDWBQWJtIw3UQE6E7sHmhOoB5ezqs=;
 b=ZvMSw2uU7xUl8MNk+fBP7PwFwcaIfMv/CSoJF5BnQ9Z511Yz+7sCVTk8l08eUzsHWl
 cc/0ZeTgkAwKQqyjBJnoAnJuciQobDpFFz+/psElI1dBjgNa1a2wuWMTZ9MqXlq0gC+R
 KkQXq7JgCCa3JBrCVmJMwAyUAnIIyEHj60TsgbIOZHroXff8laslzaypGbJDXN9zvA4I
 8LXmqdgXADlEseDzjj3zfWzC4W/9AODLnZTm4/reYY/+92hux2mjF+w8ddmysm4H0cz9
 hErUD98HvmjGls7wKj8glUHpuCHOE9BIOjY0N0CxdC7eAM1t7LDMOC0iEmhw1te5jnP9
 WPAg==
X-Gm-Message-State: AGi0Pubkxzj2/RULLtgJvbybUSvEv2bOLZK9PqyHrxdDiZzKgz48edUP
 E/usRB+2leEMPcU3/nwzSNIU3A==
X-Google-Smtp-Source: APiQypI3JmmCDHjcMn3A1vzcEpxgsLlbI4LO3mEsYg5l0mrqs5au0PNliOvfe+fdVwtahiKITEMREQ==
X-Received: by 2002:a1c:6344:: with SMTP id x65mr16504650wmb.56.1587368238713; 
 Mon, 20 Apr 2020 00:37:18 -0700 (PDT)
Received: from dell ([95.149.164.107])
 by smtp.gmail.com with ESMTPSA id y40sm43875wrd.20.2020.04.20.00.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 00:37:18 -0700 (PDT)
Date: Mon, 20 Apr 2020 08:37:16 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Ran Bi <ran.bi@mediatek.com>
Subject: Re: [PATCH v12 5/6] rtc: mt6397: Add support for the MediaTek MT6358
 RTC
Message-ID: <20200420073716.GM3737@dell>
References: <1586333531-21641-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1586333531-21641-6-git-send-email-hsin-hsiung.wang@mediatek.com>
 <20200416091438.GA2167633@dell>
 <1587112169.12875.2.camel@mhfsdcap03>
 <1587113392.13323.3.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587113392.13323.3.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_003720_629685_E532DDF1 
X-CRM114-Status: GOOD (  14.00  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, Richard Fontana <rfontana@redhat.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, linux-rtc@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>,
 Sean Wang <sean.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Josef Friedl <josef.friedl@speed.at>, srv_heupstream@mediatek.com,
 Sebastian Reichel <sre@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxNyBBcHIgMjAyMCwgUmFuIEJpIHdyb3RlOgoKPiBPbiBGcmksIDIwMjAtMDQtMTcg
YXQgMTY6MjkgKzA4MDAsIFJhbiBCaSB3cm90ZToKPiA+IE9uIFRodSwgMjAyMC0wNC0xNiBhdCAx
MDoxNCArMDEwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gPiBPbiBXZWQsIDA4IEFwciAyMDIwLCBI
c2luLUhzaXVuZyBXYW5nIHdyb3RlOgo+ID4gPiAKPiA+ID4gPiBGcm9tOiBSYW4gQmkgPHJhbi5i
aUBtZWRpYXRlay5jb20+Cj4gPiA+ID4gCj4gPiA+ID4gVGhpcyBhZGQgc3VwcG9ydCBmb3IgdGhl
IE1lZGlhVGVrIE1UNjM1OCBSVEMuIERyaXZlciB1c2luZwo+ID4gPiA+IGNvbXBhdGlibGUgZGF0
YSB0byBzdG9yZSBkaWZmZXJlbnQgUlRDX1dSVEdSIGFkZHJlc3Mgb2Zmc2V0Lgo+ID4gPiA+IFRo
aXMgcmVwbGFjZSBSVENfV1JUR1IgdG8gUlRDX1dSVEdSX01UNjMyMyBpbiBtdDYzMjMtcG93ZXJv
ZmYKPiA+ID4gPiBkcml2ZXIgd2hpY2ggb25seSBuZWVkZWQgYnkgYXJtdjcgQ1BVIHdpdGhvdXQg
QVRGLgo+ID4gPiA+IAo+ID4gPiA+IFJldmlld2VkLWJ5OiBOaWNvbGFzIEJvaWNoYXQgPGRyaW5r
Y2F0QGNocm9taXVtLm9yZz4KPiA+ID4gPiBSZXZpZXdlZC1ieTogWWluZ2pvZSBDaGVuIDx5aW5n
am9lLmNoZW5AbWVkaWF0ZWsuY29tPgo+ID4gPiA+IEFja2VkLWJ5OiBBbGV4YW5kcmUgQmVsbG9u
aSA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+Cj4gPiA+ID4gQWNrZWQtYnk6IFNlYmFz
dGlhbiBSZWljaGVsIDxzcmVAa2VybmVsLm9yZz4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBSYW4g
QmkgPHJhbi5iaUBtZWRpYXRlay5jb20+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSHNpbi1Ic2l1
bmcgV2FuZyA8aHNpbi1oc2l1bmcud2FuZ0BtZWRpYXRlay5jb20+Cj4gPiA+IAo+ID4gPiBQbGVh
c2UgcGxhY2UgdGhlc2UgaW4gY2hyb25vbG9naWNhbCBvcmRlci4gIFRoZXkgc2hvdWxkIHByb3Zp
ZGUgc29tZQo+ID4gPiBoaXN0b3J5LCByYXRoZXIgdGhhbiBhIHVub3JkZXJlZCBzbGFiIGxpc3Qg
b2YgcmFuZG9tIHNpZ24tb2Zmcy4KPiA+ID4gCj4gPiAKPiA+IEkgc3VwcG9zZSB0aGF0IHlvdSBt
ZWFuIHRoZSBvcmRlciBzaG91bGQgYmUgbGlrZSBiZWxvdywgcmlnaHQ/Cj4gPiBSZXZpZXdlZC1i
eTogWWluZ2pvZSBDaGVuIDx5aW5nam9lLmNoZW5AbWVkaWF0ZWsuY29tPgo+ID4gQWNrZWQtYnk6
IFNlYmFzdGlhbiBSZWljaGVsIDxzcmVAa2VybmVsLm9yZz4KPiA+IEFja2VkLWJ5OiBBbGV4YW5k
cmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+Cj4gPiBSZXZpZXdlZC1i
eTogTmljb2xhcyBCb2ljaGF0IDxkcmlua2NhdEBjaHJvbWl1bS5vcmc+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBIc2luLUhzaXVuZyBXYW5nIDxoc2luLWhzaXVuZy53YW5nQG1lZGlhdGVrLmNvbT4KPiA+
IFNpZ25lZC1vZmYtYnk6IFJhbiBCaSA8cmFuLmJpQG1lZGlhdGVrLmNvbT4KPiA+IAo+IAo+IENv
cnJlY3Rpb24sIEkgdGhpbmsgZm9sbG93aW5nIGlzIHRoZSBjb3JyZWN0IGNocm9ub2xvZ2ljYWwg
b3JkZXI6Cj4gU2lnbmVkLW9mZi1ieTogUmFuIEJpIDxyYW4uYmlAbWVkaWF0ZWsuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IEhzaW4tSHNpdW5nIFdhbmcgPGhzaW4taHNpdW5nLndhbmdAbWVkaWF0ZWsu
Y29tPgo+IFJldmlld2VkLWJ5OiBOaWNvbGFzIEJvaWNoYXQgPGRyaW5rY2F0QGNocm9taXVtLm9y
Zz4KPiBBY2tlZC1ieTogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3Rs
aW4uY29tPgo+IEFja2VkLWJ5OiBTZWJhc3RpYW4gUmVpY2hlbCA8c3JlQGtlcm5lbC5vcmc+Cj4g
UmV2aWV3ZWQtYnk6IFlpbmdqb2UgQ2hlbiA8eWluZ2pvZS5jaGVuQG1lZGlhdGVrLmNvbT4KClRo
aXMgbG9va3MgYmV0dGVyLCB5ZXMuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBT
ZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2Fy
ZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
