Return-Path: <SRS0=IT6v=7J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29276C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 12:28:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE03220873
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 12:28:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZQERX9Ts"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE03220873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qMTVReaV+UxlTr69OA8Qn+czzil0pfCZ7XDzx4Pe+ZM=; b=ZQERX9TsG4s6du
	b8iRDJVzukn8bHq1F6sqyHKgmrCTTZC64KOeB6IEQRA4/WaXbb0I8TeOeRVAJx5RX9e6R1niUPyxl
	6P9O73nEZ0ZOvEh+MsArr5kScPHyPbI5Y2xG7tm7tOM6TuNrcrZMxjtC3zxIp1nHUyjlvYjSswwGM
	jc3w8EhbMg/T2h4K82J/5GTnQuBTS85UaKdefAG6QH+lIFC4/0RuWB5JXxpAKYVbPoIY0SvqKonw4
	ohJu5TzgD/0LYGsFisRiXL67ELyOCknvlUfgz8p1I2xhemVkKYpY67l7v5c4xtxl1gSbao5M549t+
	dLcnsBVbkgPdKlK3BleQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdvAs-0003K2-Mh; Wed, 27 May 2020 12:28:46 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdvAd-000359-5u; Wed, 27 May 2020 12:28:32 +0000
Received: from mail-qk1-f180.google.com ([209.85.222.180]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MXY2Z-1jVsvr1tqJ-00YwVs; Wed, 27 May 2020 14:28:28 +0200
Received: by mail-qk1-f180.google.com with SMTP id 205so10946649qkg.3;
 Wed, 27 May 2020 05:28:27 -0700 (PDT)
X-Gm-Message-State: AOAM531fTg2HCQVdi3ygYPyIrWerMR41q0KWRZSfsVjOvySWUmQ9k6GK
 CDOhU+0ftwOSm6ZyCNzyQS5O9wuObEs47qucfwE=
X-Google-Smtp-Source: ABdhPJwaAgzroHfp7pJ7RNhUPIcAie1aEFqd1EprpZ9PmXq2JihQh/b6bzG/FLdwRDsYzWluddqdrXxjIL6hkdgwLDI=
X-Received: by 2002:a37:bc7:: with SMTP id 190mr3695944qkl.286.1590582507016; 
 Wed, 27 May 2020 05:28:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200522120700.838-1-brgl@bgdev.pl>
 <20200522120700.838-7-brgl@bgdev.pl>
 <20200527073150.GA3384158@ubuntu-s3-xlarge-x86>
 <CAMRc=MevVsYZFDQif+8Zyv41sSkbS8XqWbKGdCvHooneXz88hg@mail.gmail.com>
 <CAK8P3a3WXGZpeX0E8Kyuo5Rkv5acdkZN6_HNS61Y1=Jh+G+pRQ@mail.gmail.com>
 <CAMRc=Md1w_6+dU9gCwiiB5R+dMcYMPFLPrA++RBkKp5zaY6Riw@mail.gmail.com>
In-Reply-To: <CAMRc=Md1w_6+dU9gCwiiB5R+dMcYMPFLPrA++RBkKp5zaY6Riw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 27 May 2020 14:28:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3L6aGtKqv4ikNJc3or_mX2VvRE1sgaZZ9esD6jx+Hyug@mail.gmail.com>
Message-ID: <CAK8P3a3L6aGtKqv4ikNJc3or_mX2VvRE1sgaZZ9esD6jx+Hyug@mail.gmail.com>
Subject: Re: [PATCH v5 06/11] net: ethernet: mtk-star-emac: new driver
To: Bartosz Golaszewski <brgl@bgdev.pl>
X-Provags-ID: V03:K1:gTfH6EvBwrdKlbVes7Hi6+Dguco3nqgHliJUeVQPDBSx8GJmu8o
 +zX+dq+/0EBCjVZkalXD0Q3AMa2V56OEegsHKLKibp99aRkwglzSlNRjWz+z5aJMI4XCrf+
 dAN0wqPxg4XJ9xFLJxUka1Y8CY4E5bd502w6sqUoW8i7mBKYAnHksK0Ih14hRbJJjakvuzz
 A/mNPtjDFAh9YXqqZbL2A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NghcvGCrNFk=:xkLT8uEGs5CJLvgMRi9SPJ
 FeB53Gq+wbPu9qmeeItaR2JiSUSsZHk9KZmsZSHCYyl2wznKx5yf3M80LvNjDpL2qDEsxTwmq
 Tnr51T5VcgFl7vKtxaDH1JIN4dk4PSfFvXX+l1pGJy7wQmPqHLLEJYTLG3Uupgl4GRC++guWw
 Ol8/LDXkZjRtJ4Kmv8cmaladVZy7G66kt+uRQYjNktXt68bbP+PyFPz+SPSB61Iew5sv6GE6X
 kqWXFb+kAgUfWZy+IyI8VYcMygDG1EbZ0NJqYsxF6YfNGNlsaJX5YfNx3zaqPGHPigWHiiPWJ
 ZQHXyT3gNLrHcSQAOkoazoHSC8RTZ/XNki/Dve7AGfybOceMAFXlzpdQHvo9RGrnj4pYWIl/i
 ieXQpZIrsn6BXGj0sUvagpRDTHRtzlhDHsTljSgYNKvDlpEqHEJwHFovHA/gsyL3YFXaQCvkY
 GfMOIsgFPHF791PjpAwiaBaD31d+POBZHhZJDzauJgq1BUlXdBHlpn/BS24NljrfgDgeWApfC
 4tIwvcvFjDKLL7J2g9rV8Rtvk/Fjp10K3ZuaKGUP4rcON3OWVGxpwRMlj1+WpVE9JXfs/nlWL
 czKc6OOW8SkV8BlL6CHOFLAIBTf13CFkUOONrTwmRnIriii5GSsQRQmypecisZbTH7k/PsOWf
 7C2sNFlYIzKCYqNpap3xi9rVMpu9tL94Xcn4zPorp8XsBLXFzS7I7XK1jVRB3SIcjk7UwLPtM
 SQiLuOpTlSgDMerYcB4LNdRtkHtRdtXt4uhpYd7XI/+zJOVG+vUJA1B9bV21xTdy2fyD3fOpG
 R5v5tZLDEeDiJFUiGIGsKpc0+iMpDaK5tiZPROWqBQCZyweuf4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_052831_521586_78534025 
X-CRM114-Status: GOOD (  12.84  )
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
Cc: Edwin Peer <edwin.peer@broadcom.com>,
 devicetree <devicetree@vger.kernel.org>,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 netdev <netdev@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pedro Tsai <pedro.tsai@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Nathan Chancellor <natechancellor@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBNYXkgMjcsIDIwMjAgYXQgMTo0OSBQTSBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmds
QGJnZGV2LnBsPiB3cm90ZToKPgo+IMWbci4sIDI3IG1haiAyMDIwIG8gMTM6MzMgQXJuZCBCZXJn
bWFubiA8YXJuZEBhcm5kYi5kZT4gbmFwaXNhxYIoYSk6Cj4gPgo+ID4gT24gV2VkLCBNYXkgMjcs
IDIwMjAgYXQgMTA6NDYgQU0gQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD4gd3Jv
dGU6Cj4gPiA+IFRoYW5rcyBmb3IgcmVwb3J0aW5nIHRoaXMhIEkgaGF2ZSBhIGZpeCByZWFkeSBh
bmQgd2lsbCBzZW5kIGl0IHNob3J0bHkuCj4gPgo+ID4gSSBhbHJlYWR5IGhhdmUgYSB3b3JrYXJv
dW5kIGZvciB0aGlzIGJ1ZyBhcyB3ZWxsIGFzIGFub3RoZXIgb25lCj4gPiBpbiBteSB0cmVlIHRo
YXQgSSdsbCBzZW5kIGxhdGVyIHRvZGF5IGFmdGVyIHNvbWUgbW9yZSB0ZXN0aW5nLgo+ID4KPiA+
IEZlZWwgZnJlZSB0byB3YWl0IGZvciB0aGF0LCBvciBqdXN0IGlnbm9yZSBtaW5lIGlmIHlvdSBh
bHJlYWR5IGhhdmUgYSBmaXguCj4gPgo+Cj4gSSBhbHJlYWR5IHBvc3RlZCBhIGZpeFsxXS4gU29y
cnkgZm9yIG9taXR0aW5nIHlvdSwgYnV0IHNvbWVob3cgeW91cgo+IG5hbWUgZGlkbid0IHBvcCB1
cCBpbiBnZXRfbWFpbnRhaW5lcnMucGwuCgpJJ20gbm90IGEgbWFpbnRhaW5lciBmb3IgdGhpcywg
SSBqdXN0IGRvIGEgbG90IG9mIGJ1aWxkIGZpeGVzIG9uIHRoZSBzaWRlLAphcyBJIHZlcmlmeSB0
aGUgc3R1ZmYgdGhhdCBJIG1lcmdlIG15c2VsZiA7LSkKCj4gWzFdIGh0dHBzOi8vbGttbC5vcmcv
bGttbC8yMDIwLzUvMjcvMzc4CgpPaywgcGVyZmVjdCwgdGhhdCBpcyBpbmRlZWQgdGhlIGNvcnJl
Y3QgZml4IGFuZCBtaW5lIHdhcyB3cm9uZy4gSSdsbApqdXN0IHNlbmQgYSBmaXggZm9yIHRoZSBv
dGhlciBidWcgKHVudXNlZC1mdW5jdGlvbiB3YXJuaW5nKSB0aGVuLgoKICAgICBBcm5kCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
