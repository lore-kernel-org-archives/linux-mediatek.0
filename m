Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240F6C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 17:44:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6812D2333E
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 17:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6812D2333E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QLhl4wPFJ67WRrH3RaeG79HeFH/lkUsHRFDKWNbKXg=; b=oPkHQE18bABKVbkFUFqTANX61d
	dysZAY/tU0AFLw28nsB4cKlmKcm8zQRG+7oVA8ZsMBKY3yA8lRzilxnlZoAtKhmT1oMPz5JiqAmg3
	psAoBPs1Z6CZ6dBGMfy5Sg6DPrUf0aYhCoSg4JSBwZ8SIJb1pCLHN+ecQZUiqTq3cgy2nLKMtbe4v
	2s6ctT6/qBHnJDizedVTL9ErnJW/BgTd9XWTUNS/wdNhmxAmu7gJnCSMoVv3OPtPXS2+G3yGMkhm4
	BM0McRXAcCDM1n0Poo5TzP23+7p4WBWAoHIa3+O/HFSD8H+//WpLhiRTeKXGhLEzJVH5kcjdwGleU
	K3EDlElg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzkCF-0004lr-Sa; Wed, 13 Jan 2021 17:44:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzkCE-0004la-IW
 for linux-mediatek@merlin.infradead.org; Wed, 13 Jan 2021 17:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:From:CC:To:Reply-to:Subject:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
 Date:Sender:Content-ID:Content-Description;
 bh=pm0ZlDCbrqJGH+8CaccMRwCLQ/RnLdRbfmFm3m/5WJE=; b=uRUVyd1T5WN12m9/W3zYgm59Xf
 Gd22u0zc/Luptjz5KlCnJKPjQ1p4ciCkfIidPVCB4HF4w/PQbdjwhrqzQVE42O5fBoSxk3Ej1+bDJ
 sdpQAYoRiV1bmB2b3XPZ7CTuy/Iorc3Skdq8C2/v3sn9dmgZ3+500oIn6Eva+whCld7RyYSJGd+68
 e8Ci0naIlDSG4Um8mTNB9n+3QtMk7cVpZeIYUE68+aXyKSvFwMi7FjsLF7Q3ZappPI1jPWY8FxqCg
 McRsgs8DXS/HMFWhCzkyyPAsLF9TxTMVjvjVp939uJ5aRr61ul+CrXsu4XE7w5+5P09VkvQD5KNqu
 C1YgrJZg==;
Received: from mout.gmx.net ([212.227.17.21])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1kzkBd-006WnA-9G
 for linux-mediatek@lists.infradead.org; Wed, 13 Jan 2021 17:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1610559817;
 bh=pm0ZlDCbrqJGH+8CaccMRwCLQ/RnLdRbfmFm3m/5WJE=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=jXZdKdi17y3sCLHj0XCXSUnI8nXPuvYqBaspIwTX8ilP8ADmBGNpm1XY2Gcd7oeos
 weK+IQ6K2KNUX/YRup/4DZgTb35xN3NfEqkJIdtuC7jW2Smp06EmlfGiGCbL3hl5Ad
 NhqRKlE3aqK/IQ8xpdorSmpjsxbaP8Ce6jbSPlVU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([185.75.74.15]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8hVB-1kv3Dk26jZ-004hw7; Wed, 13
 Jan 2021 18:43:37 +0100
Date: Wed, 13 Jan 2021 18:43:29 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <1610352714.9738.14.camel@mtksdccf07>
References: <20210109190937.42409-1-linux@fw-web.de>
 <630fc8584a2f426d9fce6b900a337918@mtkmbs05n1.mediatek.inc>
 <1610352714.9738.14.camel@mtksdccf07>
MIME-Version: 1.0
Subject: Re: FW: [PATCH] dts64: mt7622: fix slow sd card access
To: linux-mediatek@lists.infradead.org,
 SkyLake Huang <skylake.huang@mediatek.com>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <6C2153F8-66FE-450E-BB37-DB586BD5DAB8@public-files.de>
X-Provags-ID: V03:K1:uFQg+G4o0VkLhFcHmboYbtKNG4jOhllMHcp/u4sZGpf7HwtPrn1
 XkH5+P2eopasCQnrommPVy/cMZC329qNXYN+O8k2+C9bzEMNGPgkXmIRlSccC2+sCJfWzwj
 FcnslyF6zEuMAz2KjzSNJTjgsqa/cZGWwYd0S4gf9vzTBlyACtTgbxMNsofr0B/ze7dUP85
 VeVjurkF8ePwMaxIr2A8g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EP7/MuImp/I=:pr/wNbDaTuVt6lVAjG/HIp
 5FRsKrLCto7nD52RqD+3lxIRacdRcC1oETFUsfPC0e9eQzjShNqPh/OEVKwji70pU6hhsmK+i
 b6U9Nb33f1q9LjWGjxitDDK+JmzzVqC5ba6Bu2l5d6bqG8dvDz/oZD3iu8UHgI7iRO8GVxjXa
 rwFRDNjYhq3MnWYXHdzsfVRpAlmeQoCJQeCeNIB8ZKAxP3LvERzUumpL22NslB4obP6SFx2EL
 6kCxjz3l9+WmPcx6Q8Jbs/jixSu3B7UI2yJlAjg0rntJuwf2+J0a/bXCCvPRhHPkw6X13jENX
 O9VCdrmbkQR/dGFxhKschWsitlqlHkdhZcvKAlt3qw3TgNwY0Vtkf6y6HIA3pa/X+HDV+AJNz
 zQiBoriOP8+EMRIjHIXDuP+svfv+XkwFZKmb1J2WxDl3pxdcegg+WitSPEo8JjcSXDwCEMurC
 cOFfE/dmwNryI/28hyTzKasB1AtLcy/QvfEXj0h70ZvPofbaG42NG8ixCLb+rC+3zUbBmvdbj
 xSHpBDyAYyQN2luzkkwParn/m7YSMglWKeDmHhhySwpiu3jyemaI0Yk4Y/0kDTREBrXxJghat
 wpfvEny86XjCIQkj7QymuBYglA70i+nuvXntd5eEIBBRiarnoUr50chCdW27+vrkTzRxAGSwX
 Z5V/wyIKna9DU7XleJ609VxYLvnRqgxU9Komqzs9ljTNBc3DoyJCTqTnOWQxTfpjQBElglF1d
 hz9QU0a+hh9MD5hTlMObvOGlYvJhkj3IeTCcYl0MO45DbM1C5N746d0EGL9U6g1rL8TiKPA3K
 uR8FXHs1dzIrY6aHf0Sx1RzY5mMLra5vgXGfj/KhiN8JVluT+FxjM137EO8BtRM8l4cviRyZN
 6dfyOQatQtD7tPcm7rqg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_174407_532965_9A00EF04 
X-CRM114-Status: UNSURE (   3.85  )
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
Reply-To: frank-w@public-files.de
Cc: devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi

Thanks for clarification. I will send out a v2
with only the reset. Seems this is enough.

Next time please send answer also to me
(not only mailinglist).
regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
