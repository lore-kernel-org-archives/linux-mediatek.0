Return-Path: <SRS0=Rw5Z=YR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B688ACA9EAF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 07:57:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CEE3205ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 07:57:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qGDekEU4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KarVPLaB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CEE3205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYl9d9mHQYmrbCFjPdUEYpONHGT+5N/zOS4bZfldCbo=; b=qGDekEU4wF1X0a
	bVI+wzjw1Jvt9KuZ/z253f8HD+rHWaG7dimx9F8cCMjSjJ0NfoD+iQ+CtWrGzbLMkN6iWlQ+b1b7r
	zEGLxqgB11N8EKDKUUOSp6ZVJy9grNZfHfbRrMDgED5nqt4LGqFaavEOCxOnjF9ObF0ErT2RZNzVw
	Waijhe/Gek2hhKjgIgpGf1PlP2M8jmUdkjr/Cs7YFRe6bz3RKVWuXT1YwnKC6MUxZjZfKgkrl5gao
	bYtYyTXU94AWicdZuYqXMsRpx3e8JqazxlLch1z0MnzUeYsxdx1hFduvamitdu9G+vV/eBvWa6SFY
	/SdSzPXGW9oPgChE10Tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNXzs-0001OA-6o; Thu, 24 Oct 2019 07:57:28 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNXzo-0001Mk-TC
 for linux-mediatek@lists.infradead.org; Thu, 24 Oct 2019 07:57:26 +0000
Received: by mail-wm1-x344.google.com with SMTP id n7so802266wmc.3
 for <linux-mediatek@lists.infradead.org>; Thu, 24 Oct 2019 00:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=2R2CzbjvEDjQmx61JPs0RIA5BRAZFdy1ELg14vUw0UQ=;
 b=KarVPLaBPctaaN5I1bubIar3T/z7eSO6kv6QHJHU97Yb654aPehI+thVq0mZ3Jm8nx
 n2c9tW1zImFk0i7AZS5BjlzwY9kxtexGvnoqflA6oaj3k1JJ0SOol5VCjorf9/t7/g+R
 zkdk5KQf7KCombZznlxFlE+f0Hre2crdS44Cd1lSoeRAoGYWiqRjNyVer9cKHhTF4UR5
 wzSWUb2gRLA7/KFvI++Xfpe0MFXxtl2mSbyfnVu7uFK1+eeSS5d2929gLYcg27fFo9vV
 6wG10gP2E5B7FNLyrKcPOyKtL1kFOHm43pq0c/OPj/qmwyfPc9vqIjTig758Wzk3opYF
 r+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=2R2CzbjvEDjQmx61JPs0RIA5BRAZFdy1ELg14vUw0UQ=;
 b=JDNYUqb8GfDWjPVRpIeepWT3u+/+wFJqRH3v03rZD1m8/9lJ7Aqflk0JJ8iiG1XZ70
 jmhzCuAHzgttDXfN/VVug+v8wW7XRzNvjKUo8QXf7QbpR510iL5/nZD5dfSAvtpsq7Y4
 pHRg6dZ0watLtJLX8GtVLlyR7aFFdrTNcwjb1OpJJB64A3K/yQxGGLP9TJfAb31h/QBX
 fKQDtmpTDf+33Fd7IfdgSpSifRozwOiMMHxT3Pw+V0Vqbsh4/KNLk3AdSqyzK+L8izZy
 2F0pY213vAPphUsEzWsAxMNc4Z/pV7LUBIguKNzE3+NJOswZQJJAXt2JC358teYRV4yP
 Klmg==
X-Gm-Message-State: APjAAAW/4pZ8BpaQQonMOFgnYV8lebfxf+bmiuTf9ZoRDshLaDZMB7HM
 YA/6bHNaXCoTakM7h5lyZpwBrg==
X-Google-Smtp-Source: APXvYqzfzbyOD0kMrrQiasuUlY/4XG7ebzJuOpr4xPK79DUE6o1jWvTCFJ/oMBpjTCu4tX/LxTh1vw==
X-Received: by 2002:a1c:6885:: with SMTP id d127mr3484113wmc.64.1571903842614; 
 Thu, 24 Oct 2019 00:57:22 -0700 (PDT)
Received: from dell ([95.149.164.99])
 by smtp.gmail.com with ESMTPSA id d4sm31839931wrc.54.2019.10.24.00.57.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 24 Oct 2019 00:57:22 -0700 (PDT)
Date: Thu, 24 Oct 2019 08:57:20 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [PATCH] mfd: mt6397: fix probe after changing mt6397-core
Message-ID: <20191024075720.GI15843@dell>
References: <20191003185323.24646-1-frank-w@public-files.de>
 <20191016095338.GD4365@dell>
 <24600EAE-5379-475F-B83D-880E767F2CDA@public-files.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <24600EAE-5379-475F-B83D-880E767F2CDA@public-files.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_005724_945560_3A9F4BCE 
X-CRM114-Status: UNSURE (   7.02  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMiBPY3QgMjAxOSwgRnJhbmsgV3VuZGVybGljaCB3cm90ZToKCj4gV2lsbCBpdCBi
ZSBtZXJnZWQgb24gcmMtY3ljbGU/Cj4gCj4gSSBhc2sgYmVjYXVzZSBpIHNlZSBpdCBvbmx5IGlu
IG1mZC1uZXh0IGJ1dCBub3QgaW4gZml4ZXMvdG9ydmFsZHMtbWFzdGVyCgpJdCdzIGJlZW4gc2Vu
dCB0byBMaW51cyBmb3IgdGhlIC1yY3MuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFy
byBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0
d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxv
ZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
