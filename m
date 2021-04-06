Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E207BC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 15:57:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82963613C7
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 15:57:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82963613C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X5yXvVZC+diAN5YbzCakfMH0Dath9Xjwlkfof/0vG4E=; b=hA+TSBGh4FSez8rrbKLQ+fUtv
	mEVYMYOZvO1mPYQ32BbXRupyiqY1m4HvY8IAAYZeY3TL+FXR2YVJZ9xUQmnKwGd0fj+2co76t0BJW
	Jrr1aIMCm1rP0fSJRMSb1ZcsY314hgaDoVpTXTiB4lfKD82hHEumq2nTPiso+HKZQhTdJYa2C49eh
	lNpWKIxeebJ7j8Bs+rWMiOthE/V4bWfRXXkvaV1DBArNvpYUyiaIWYuODicg0gpSr2I31p5FUCaDH
	si5ysFoKrqai87oXchzSIJFyFXZFD7O6q9FJjlYKoUyEo+Mv0eGAR7txVj3sUbVZnYQPh09h1sM7N
	NutODfHXg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTo4x-002y1x-Ap; Tue, 06 Apr 2021 15:57:23 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTo4t-002y1a-LI
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 15:57:21 +0000
Received: by mail-il1-x132.google.com with SMTP id l9so7437055ils.6
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Apr 2021 08:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FEHBLN0Zstx1GJN7oNvdBnFUfGg0YcWpGNgAuqNChPM=;
 b=ewEZauKlnvV70GX0on1+GRjS9gR/bGnmqPzBG+GSpy2uOxwLfOllm9KCl5/p7dFAZz
 nHE1PVAjQimYXKTfna3TXgFuubqMlL3UaczMGaC0r2bCDW0X7qg4nOxFzZQWrUtkB/YD
 BzgGmPkk1FdLZw8Lm4U/X/4ppblG8V4pG8bAO8hmaMKKJrxoLBEtm9W127DFBGtAU2UE
 t3oVu54JpKY9oq21Gcsu+T9VbuEM+KXkKbmTjDvs4o3q9lJnzsOVa9zbWtBpT67TMG3R
 2h/Iowp2LUCrtcdi5khnKDrSoXByGh5FqI6GimUrmfcfLjd+XhdyCMM4ZLElYNd3Vb9C
 CGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FEHBLN0Zstx1GJN7oNvdBnFUfGg0YcWpGNgAuqNChPM=;
 b=Mo1zKZOaQOUkJX7eFil61yQe4wor3KdMqHvJGdF/NQTorihvqCsnKKvx+X6nkI7R/O
 QLG1Dwh+uvOeBd52dtoE8Jq+NpKSs16Q25GPUz3vHSdBlWpGyHleOgMI4lZcS4XW9yGN
 hCjuKC1LvSQkcAMR+OxY8Z2aGQlNmclC9EwSSSJvK/skzuybqb3ARzfcukelIwEhrGkc
 yU6gWRLHeZXKCIlNv8Me+zsI6QjQ7mW39xe0XKMqMPx6svFN3Qm1BBpsZQugacZtpIY2
 dx4IL+/kxVEKKvYJQX6bP5k1TE1Sgh3TdELzjxXZIXQBV7p7Q0NKMpn5Ws2mSF+dWK3k
 Ecqw==
X-Gm-Message-State: AOAM533r4OGgw+GhG6/kAOE92j5nKKdNdCIqFPzJ/FLKNw57YAkg94lx
 Oq/Ag8wcX6n/ma2wInKBswKXfFPnyTtehCGOWzs=
X-Google-Smtp-Source: ABdhPJwcAo2Mlxz7UGgC2fTg8jHTyNrSATURmH+oza/tZhdRnPEtDe7seeMK4cOStjDtCgSO2NPZMkI6wNVpe9+DdWk=
X-Received: by 2002:a92:de0c:: with SMTP id x12mr2017100ilm.169.1617724637582; 
 Tue, 06 Apr 2021 08:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210406141819.1025864-1-dqfext@gmail.com>
 <20210406141819.1025864-2-dqfext@gmail.com>
 <CAAOTY_8snSTcguhyB9PJBWydqNaWZL3V4zXiYULVp5n48fN24w@mail.gmail.com>
In-Reply-To: <CAAOTY_8snSTcguhyB9PJBWydqNaWZL3V4zXiYULVp5n48fN24w@mail.gmail.com>
From: DENG Qingfang <dqfext@gmail.com>
Date: Tue, 6 Apr 2021 23:57:14 +0800
Message-ID: <CALW65jbbQSFbgjsMkKCyFWnbkLOenM_+2q6K7BQG5bc4-R0CpA@mail.gmail.com>
Subject: Re: [RFC net-next 1/4] net: phy: add MediaTek PHY driver
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Landen Chao <Landen.Chao@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Sean Wang <sean.wang@mediatek.com>, Vivien Didelot <vivien.didelot@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-staging@lists.linux.dev, 
 DTML <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
 Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>, 
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_165719_837149_51BC394F 
X-CRM114-Status: GOOD (  10.21  )
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

T24gVHVlLCBBcHIgNiwgMjAyMSBhdCAxMTo0NyBQTSBDaHVuLUt1YW5nIEh1IDxjaHVua3Vhbmcu
aHVAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBIaSwgUWluZ2Zhbmc6Cj4KPiBERU5HIFFpbmdmYW5n
IDxkcWZleHRAZ21haWwuY29tPiDmlrwgMjAyMeW5tDTmnIg25pelIOmAseS6jCDkuIvljYgxMDox
OeWvq+mBk++8mgo+ID4gLS0tIGEvZHJpdmVycy9uZXQvcGh5L0tjb25maWcKPiA+ICsrKyBiL2Ry
aXZlcnMvbmV0L3BoeS9LY29uZmlnCj4gPiBAQCAtMjA3LDYgKzIwNywxMSBAQCBjb25maWcgTUFS
VkVMTF84OFgyMjIyX1BIWQo+ID4gICAgICAgICAgIFN1cHBvcnQgZm9yIHRoZSBNYXJ2ZWxsIDg4
WDIyMjIgRHVhbC1wb3J0IE11bHRpLXNwZWVkIEV0aGVybmV0Cj4gPiAgICAgICAgICAgVHJhbnNj
ZWl2ZXIuCj4gPgo+ID4gK2NvbmZpZyBNRURJQVRFS19QSFkKPgo+IFRoZXJlIGFyZSBtYW55IE1l
ZGlhdGVrIHBoeSBkcml2ZXJzIGluIFsxXSwgc28gdXNlIGEgc3BlY2lmaWMgbmFtZS4KClNvICJN
RURJQVRFS19NVDc1MzBfUEhZIiBzaG91bGQgYmUgb2theT8KCj4KPiBbMV0gaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3Ry
ZWUvZHJpdmVycy9waHkvbWVkaWF0ZWs/aD12NS4xMi1yYzYKPgo+IFJlZ2FyZHMsCj4gQ2h1bi1L
dWFuZy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVk
aWF0ZWsK
