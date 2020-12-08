Return-Path: <SRS0=HZpZ=FM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C4FC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 14:05:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A097E23AC4
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 14:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A097E23AC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O2NyhUoeuXtdYZ8k10foQZSS2hc/xwkBaj475hA/FCQ=; b=zTpn+08rdPy+7AM9qRaWBLnrL
	LAvYvJwc1cHr1eD78XULTcQ6IOrj41dmOEn3FgYVNT3M8DSKRIfLaQZtW2nRpa/fJDyMpCmb3uY3O
	wlx4eQjEU307NmkSWOedyRkLkbRwwk53PFY9b4MV2Z+8/AWkaHsfD9ABQcVCtj6/XeN610MQ56QDz
	bn1yWiQ62xfjGgLzGoGq4lImjbMLRRiKTERkkZvgvaB5haeRIZ0dMbM9bSGKX+0LQo47oMjZfSj/F
	6IiOQfa/2guKJcLg0k6zT7kUfTpcQ6Y3OKV1LtoROw0MSuAfpXityBYuNCoucCFwI5N4P2Oi33D2T
	wOcRhvplg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmdc4-0002Wl-Ts; Tue, 08 Dec 2020 14:05:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmdc0-0002VL-3W; Tue, 08 Dec 2020 14:05:04 +0000
X-Gm-Message-State: AOAM530b31PCfqMuZjW9CFaus2De0ZeqW4KPZoVJrjCaR9aCcNr55oR1
 y06l4VhB7cMOZvSOVeFGh+77da2JusIlUzJKnDk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607436303;
 bh=mbsdbwKyczvLHvtpaeUbdE5uuehFNcjej12iuv54kM0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=t5uiLAeQbxE76Z++9gWAPnbTDDysMrXRk28zPlRtfyuIO7KisYFV51C0+0vmKG/lx
 FDmoSG20CkOI9fWyjYdJ7NGaT7c19OkAKQBfG1TuQ9CJwvMmNBlcMpT9RBEokMdgTO
 JI+YOHY1RkGBEiRYOL4qRgyeMqtE0/y+yNFKHctLaLSULO5eeOojKUyFe08t+XqT8o
 ze7N/fAz5Rgpn5PaUxsuw2xcvh3TQgrsCIpR/wbTURPXqTdJiTR879ONxqAjHDlysJ
 5bXxC2JOCcuSb30yGAmqESn+giBCnwNguePZrZirB0JPDJIzcr2ah1ev9rj5hnQkst
 ZKoA2TyKqP7aw==
X-Google-Smtp-Source: ABdhPJwOOS2YE9U5ISalt8ZW6t5h5/7Imq5MdNE9kh6uYThwbWteRjZKRfIw8tfSJKviZjaCwjro3y+psb4Y2uBf6pY=
X-Received: by 2002:adf:b343:: with SMTP id k3mr22054883wrd.202.1607436301682; 
 Tue, 08 Dec 2020 06:05:01 -0800 (PST)
MIME-Version: 1.0
References: <20201203222922.1067522-1-arnd@kernel.org>
 <CAPDyKFqtFYqc8i_fVzOUnuZGJjtwjVLqE-vebtOKuYJ-4PrDBg@mail.gmail.com>
 <CAK8P3a3srmTdY69j+g-wazMkrTL8_Grsw=vCMyizyA_7oOC4tg@mail.gmail.com>
 <IVYYKQ.T5GFS8Z1QTP2@crapouillou.net>
In-Reply-To: <IVYYKQ.T5GFS8Z1QTP2@crapouillou.net>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 8 Dec 2020 15:04:45 +0100
X-Gmail-Original-Message-ID: <CAK8P3a21gkBsb3rcNvzH3XA_0GRRKPgnsrynTTO=EZVwy6DC+g@mail.gmail.com>
Message-ID: <CAK8P3a21gkBsb3rcNvzH3XA_0GRRKPgnsrynTTO=EZVwy6DC+g@mail.gmail.com>
Subject: Re: [PATCH] mmc: mediatek: mark PM functions as __maybe_unused
To: Paul Cercueil <paul@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_090504_221070_523B2D7E 
X-CRM114-Status: GOOD (  11.42  )
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
Cc: Marek Vasut <marex@denx.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 Chun-Hung Wu <chun-hung.wu@mediatek.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 yong mao <yong.mao@mediatek.com>, Amey Narkhede <ameynarkhede03@gmail.com>,
 ARM/Mediatek SoC support <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBEZWMgNywgMjAyMCBhdCAxOjMzIFBNIFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91
aWxsb3UubmV0PiB3cm90ZToKPiBMZSB2ZW4uIDQgZMOpYy4gMjAyMCDDoCAxNToxNCwgQXJuZCBC
ZXJnbWFubiA8YXJuZEBrZXJuZWwub3JnPiBhIMOpY3JpdAoKPiBCeSB0aGUgd2F5LCBhcyBJJ20g
ZW5kaW5nIHVwIGRvaW5nIHRoZSBzYW1lIGluIGEgZGlmZmVyZW50IGNvbnRleHQsIEkKPiB0aGlu
ayBpdCB3b3VsZCBiZSB1c2VmdWwgdG8gaGF2ZSBhIElGX0VOQUJMRUQoKSBtYWNybyBkZWZpbmVk
IGxpa2UgdGhpczoKPgo+ICNkZWZpbmUgSUZfRU5BQkxFRChfY2ZnLCBfcHRyKSAoSVNfRU5BQkxF
RChfY2ZnKSA/IChfcHRyKSA6IE5VTEwpCj4KPiBUaGVuIHRoZSBwbV9wdHIoX3B0cikgbWFjcm8g
Y291bGQgYmUgZGVmaW5lZCBsaWtlIHRoaXM6Cj4KPiAjZGVmaW5lIHBtX3B0cihfcHRyKSBJRl9F
TkFCTEVEKENPTkZJR19QTSwgX3B0cikKCkkgbGlrZSB0aGF0LiBEbyB5b3UganVzdCB3YW50IHRv
IGdvIGFoZWFkIGFuZCBzdGFydCB3aXRoIGFkZGluZwpJRl9FTkFCTEVEKCkgdG8geW91ciBvd24g
YnJhbmNoIHRoZW4/CgogICAgQXJuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
