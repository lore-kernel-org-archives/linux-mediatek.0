Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2589AC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 13:33:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F053620721
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 13:33:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r7AEKlUT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="NJ0ybiSw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F053620721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gs36WbbetopVJBlqBjzAtxPRyfufEPXsLBSq7FhQ7Y0=; b=r7AEKlUTBzdKKG
	eVxjs9Gsc7ifhuxFdb1CW1zYHc1vOqBidBa2RqZyEC/xtqTCK3gkL59j7QN6jh280ITXwDngW0c44
	z9vsGFAZxZaXLt7++ESGpc7liNrpzF2hoYu8TDa52ZNcnYkYPctzVTzeSmvzMbQyC4oZbc881Y5F2
	4S5cY0XXXTWGqDYClB5bt7QWBFe+ze/nq+fee4nxzOSdEmZX3+t8hqGLNdD50xmhdYriiEPJv2nS+
	Jbb1MGWPQdmXGfcMf4CZMEKbiZ0ZefG9zr8uP7SphIpgFWH9ggdpodZzstd5xdPxo6E9tbBYcHi8b
	YZcb6VoeiCbSpRFAAT5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeIeU-0004Tp-Pb; Thu, 28 May 2020 13:32:54 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeIeS-0004TF-7i
 for linux-mediatek@lists.infradead.org; Thu, 28 May 2020 13:32:53 +0000
Received: by mail-io1-xd42.google.com with SMTP id q8so28544584iow.7
 for <linux-mediatek@lists.infradead.org>; Thu, 28 May 2020 06:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W6Ng+4krUrmarKse2LeV5TbqCd00mWN+CVVq8JMM5SE=;
 b=NJ0ybiSwbgGo1ahGYgAEwAdeEVE39Up4uZ5A1HFgeBFSeLdYyEjBoxzLaGany3U5qV
 tjyrvq25hqP+szOxI6JhW3xweR3C+uklX69AslmSgzZCTItj/lE1GwHfTH3xcf08EAt3
 mIwE34/rwjc7maTJJIaEZzx9+zgsTJyg16wtDEVvAZDos92VaeKTKyLujiHiG6B1cOYc
 KIuFtxHGqOtrjVeCdhdPy1poHODMArChjps6RUTUQ889ANVor3RtIvsULAyoI9a8m+lM
 yGQ/vmJQnyAURdQlFeawVfHk0vmYbLrVgpgL5isYwZKpihaGQitPE1wijKFtYBpDmHAO
 jbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W6Ng+4krUrmarKse2LeV5TbqCd00mWN+CVVq8JMM5SE=;
 b=AYWW9OpcLiWmDQK5a/9isTfxzLCD5vyw7X6T+BKzzto58ZiU2k4LFOiYTQHT2i8iOm
 oYxQlKAJtggLzdelsA4eh8KHBCWK+h916fQpygDJXeDWJujHCxV0l+iiVG33rCPbEera
 GkzTmqZXwDuM90dscx7boPm7TxRPdxfauUq6807y42tZzae2FmKtKWoa6Ty0pXyMi/91
 AHd8BcLLXxFcD7dpd5D7EraYR8AcaUXFq9xB52TwvgnDw0Na9ZeHEvmDT8COL/nMlZal
 zdo8B/opuw57DDaQQs5EsVbyzzjaYCVF+2wkouYNGZJ3EMO2ji0XmJcckgDbNhMv4J/O
 JGOw==
X-Gm-Message-State: AOAM531OeYkXHkfz6w34zmMFpbNYa6Vp0stzHfWjv2xnzG8nFxZ/g9qi
 GDJL8JVGDelvwo4BQKp9pKV0fgtjUNMFthp/Px+ryg==
X-Google-Smtp-Source: ABdhPJzo7KSXJqLmG4j0rLnWfVnluS/E9w7gshGux7pMtHXApV9skQgthF60OVdfNho6c1thzgPYEEykEs0OHoviWNw=
X-Received: by 2002:a5e:981a:: with SMTP id s26mr2322972ioj.131.1590672771135; 
 Thu, 28 May 2020 06:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200528123459.21168-1-brgl@bgdev.pl>
 <20200528123459.21168-2-brgl@bgdev.pl>
 <20200528132938.GC3606@sirena.org.uk>
In-Reply-To: <20200528132938.GC3606@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 May 2020 15:32:40 +0200
Message-ID: <CAMRc=MejeXv6vd5iRW_EB3XqBtdCWDcV=4BOCDDFd4D0-y9LUA@mail.gmail.com>
Subject: Re: [PATCH 1/2] regmap: provide helpers for simple bit operations
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_063252_281880_5CC2724B 
X-CRM114-Status: UNSURE (   7.61  )
X-CRM114-Notice: Please train this message.
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
Cc: Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 netdev <netdev@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Y3p3LiwgMjggbWFqIDIwMjAgbyAxNToyOSBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+
IG5hcGlzYcWCKGEpOgo+Cj4gT24gVGh1LCBNYXkgMjgsIDIwMjAgYXQgMDI6MzQ6NThQTSArMDIw
MCwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPgo+ID4gVGhpcyBhZGRzIHRocmVlIG5ldyBt
YWNyb3MgZm9yIHNpbXBsZSBiaXQgb3BlcmF0aW9uczogc2V0X2JpdHMsCj4gPiBjbGVhcl9iaXRz
IGFuZCB0ZXN0X2JpdHMuCj4KPiBXaHkgbWFjcm9zIGFuZCBub3Qgc3RhdGljIGlubGluZXM/CgpU
aGUgZXhpc3RpbmcgcmVnbWFwX3VwZGF0ZV9iaXRzXyooKSBoZWxwZXJzIGFyZSBtYWNyb3MgdG9v
LCBzbyBJIHRyaWVkCnRvIHN0YXkgY29uc2lzdGVudC4gQW55IHJlYXNvbiB3aHkgdGhleSBhcmUg
bWFjcm9zIGFuZCBub3Qgc3RhdGljCmlubGluZXM/IElmIHRoZXJlJ3Mgbm9uZSwgdGhlbiB3aHkg
bm90IGNvbnZlcnQgdGhlbSB0b28/IE90aGVyd2lzZQp3ZSdkIGhhdmUgYSBzdGF0aWMgaW5saW5l
IGV4cGFuZGluZyBhIG1hY3JvIHdoaWNoIGluIHR1cm4gaXMgY2FsbGluZyBhCmZ1bmN0aW9uIChy
ZWdtYXBfdXBkYXRlX2JpdHNfYmFzZSgpKS4KCkJhcnRvc3oKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
