Return-Path: <SRS0=x8tw=7D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0023FC433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 07:47:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA7C82065F
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 07:47:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p3YKt1X3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vqpwnjz8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA7C82065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=++GZTNEYC/p0wkWIsObZwK8Ozu8Nfy9rbCYhHdGTZ2k=; b=p3YKt1X3xyci+M
	FITaB75KuHp68SToq16KeoiR73VSduQW18OlrReyqkcGIEG2XLwmSOygovEgD0KJdR0uSctvaJhtx
	eXLUqyDLCEqeOu76IuChX89b4Pl3ROGqrDBgoLXIxEv5NxL206DajqroTK9xqlyFcRbpMgSf9YtRT
	bzDog1PsvzNmLQt81QAI1DGipVBKun4JNbg1LXdVWGBLUWTHEXvh/echWtRSiHQjZCCgwTGuePgAl
	20bTlX7dUeUMzN73zm4/n5pCwVoqXopZpnfCoOyA/92ZoyoLcnAd0/tDi0C4Xzzpord3hnYXaTTwb
	ogIvYAlgE5oBkh3T2M2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbfvd-0001zk-Sy; Thu, 21 May 2020 07:47:45 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbfvQ-0001pe-OY
 for linux-mediatek@lists.infradead.org; Thu, 21 May 2020 07:47:34 +0000
Received: by mail-wr1-x444.google.com with SMTP id e1so5690058wrt.5
 for <linux-mediatek@lists.infradead.org>; Thu, 21 May 2020 00:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=scVYFjBGBAzKQ/hMy8PhK3pElGqsrP2y83QVfuiAxH4=;
 b=vqpwnjz86M45u3Gnp4IxKufT5KEo7fxf+vl36qzM3nHslyhDCEJIEgQAXKyrOkPOzr
 sxkJdaadCkojgsCryJFV/NsqAGAwrjmBPRNvm9KBnA7Rh2O1j/zY5DwTpPhcFG/rXfkM
 6S23fM0SLLJ7TiHNbL0XWiLK7+upJ5+t62Ye2cO2Wkc0mHW9D9DAJ/WC/rz68M4FmrLX
 k27QqVbp3qP4CmlFWSn5xCNh4GWwvUfMdUElIrpD+rHd5Pa/4AMCOHm/zmAtjuENvG0C
 TUv6XE2S4gfjQ9slqcNHl1ztwdytcQWprTsMRJNpfjLkzetO4LLbY5K/5RpxkGAy8lfS
 nK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=scVYFjBGBAzKQ/hMy8PhK3pElGqsrP2y83QVfuiAxH4=;
 b=uKp05jsIFaDobGE1H9Sm6WIlwVSJetnEV/4iwG1xvvG6eGBj/SkRKlB2tpLJ8YroOZ
 lITaFrHvs2T8mrpE3y/7BIjxSAlzdB8I1C7w4lZNfKSIHDNyyQIsLum9WXA2rPI53+zJ
 aaUC6fYhgIypVXoqfrksjnbv0n45h2G7zIuNFxpAu1rZSFCHtqMAnVIeynIxQ606fR74
 5mGA9zyXms/2tamfV1uyJZKW8VerkzI7eYhROvPzd1yGDw4LI0Cc67YT2kzgbGf3uky5
 uQkcBV9oegnPIb9IoG/6PCGYFf0ickfl1Y+H2CgszhaCVtS546BlsN0PbejIx0QpXYKM
 Nqig==
X-Gm-Message-State: AOAM5303K7cvUIXmss9uIvyXdPG0Z1Cs78wQv8svP8+h/OEqW+RAjFge
 5xmuw46ggyNQ3JKKZlcsl9xG7w==
X-Google-Smtp-Source: ABdhPJxcZ6ZWteBLNFuVjrXs9CMtGph22AZeEwlyAM3AdFye7vHS83vjlNDUgEYM0NT1woW4CXf4Zg==
X-Received: by 2002:adf:9010:: with SMTP id h16mr7329094wrh.412.1590047241123; 
 Thu, 21 May 2020 00:47:21 -0700 (PDT)
Received: from dell ([95.149.164.102])
 by smtp.gmail.com with ESMTPSA id h20sm5542798wma.6.2020.05.21.00.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 00:47:20 -0700 (PDT)
Date: Thu, 21 May 2020 08:47:18 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v13 5/6] rtc: mt6397: Add support for the MediaTek MT6358
 RTC
Message-ID: <20200521074718.GN271301@dell>
References: <1587438012-24832-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1587438012-24832-6-git-send-email-hsin-hsiung.wang@mediatek.com>
 <27c107b3-6ea8-e6f9-697c-7c3c4479008c@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <27c107b3-6ea8-e6f9-697c-7c3c4479008c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_004732_802635_8F93C39D 
X-CRM114-Status: GOOD (  11.94  )
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, drinkcat@chromium.org,
 srv_heupstream@mediatek.com, Frank Wunderlich <frank-w@public-files.de>,
 Josef Friedl <josef.friedl@speed.at>, Ran Bi <ran.bi@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Sebastian Reichel <sre@kernel.org>,
 linux-kernel@vger.kernel.org, Richard Fontana <rfontana@redhat.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gU2F0LCAxNiBNYXkgMjAyMCwgTWF0dGhpYXMgQnJ1Z2dlciB3cm90ZToKCj4gSGkgTGVlLAo+
IAo+IE9uIDIxLzA0LzIwMjAgMDU6MDAsIEhzaW4tSHNpdW5nIFdhbmcgd3JvdGU6Cj4gPiBGcm9t
OiBSYW4gQmkgPHJhbi5iaUBtZWRpYXRlay5jb20+Cj4gPiAKPiA+IFRoaXMgYWRkIHN1cHBvcnQg
Zm9yIHRoZSBNZWRpYVRlayBNVDYzNTggUlRDLiBEcml2ZXIgdXNpbmcKPiA+IGNvbXBhdGlibGUg
ZGF0YSB0byBzdG9yZSBkaWZmZXJlbnQgUlRDX1dSVEdSIGFkZHJlc3Mgb2Zmc2V0Lgo+ID4gVGhp
cyByZXBsYWNlIFJUQ19XUlRHUiB0byBSVENfV1JUR1JfTVQ2MzIzIGluIG10NjMyMy1wb3dlcm9m
Zgo+ID4gZHJpdmVyIHdoaWNoIG9ubHkgbmVlZGVkIGJ5IGFybXY3IENQVSB3aXRob3V0IEFURi4K
PiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogUmFuIEJpIDxyYW4uYmlAbWVkaWF0ZWsuY29tPgo+ID4g
U2lnbmVkLW9mZi1ieTogSHNpbi1Ic2l1bmcgV2FuZyA8aHNpbi1oc2l1bmcud2FuZ0BtZWRpYXRl
ay5jb20+Cj4gPiBSZXZpZXdlZC1ieTogTmljb2xhcyBCb2ljaGF0IDxkcmlua2NhdEBjaHJvbWl1
bS5vcmc+Cj4gPiBBY2tlZC1ieTogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25p
QGJvb3RsaW4uY29tPgo+ID4gQWNrZWQtYnk6IFNlYmFzdGlhbiBSZWljaGVsIDxzcmVAa2VybmVs
Lm9yZz4KPiA+IFJldmlld2VkLWJ5OiBZaW5nam9lIENoZW4gPHlpbmdqb2UuY2hlbkBtZWRpYXRl
ay5jb20+Cj4gCj4gV2UgaGF2ZSBBY2tlZC1ieSBmcm9tIHJ0YyBhbmQgcmVzZXQgZHJpdmVycyBt
YWludGFpbmVycy4gQXJlIHlvdSBPSyB0byB0YWtlIHRoZW0KPiB0aHJvdWdoIHlvdXIgbWZkIGJy
YW5jaD8KPiAKPiBBcmUgeW91IHBsYW5uaW5nIHRvIHF1ZXVlIHRoZW0gZm9yIHY1Ljg/Cj4gCj4g
SnVzdCBhc2tpbmcgYmVjYXVzZSBpZiBzbyBJJ2QgcXVldWUgcGF0Y2ggNiB0aHJvdWdoIG15IHRy
ZWUuCgpZZXMsIHBsZWFzZSB0YWtlIHBhdGNoIDYuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9d
CkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJj
ZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVy
IHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
