Return-Path: <SRS0=9FsO=BR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03118C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 15:02:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C18812075D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 15:02:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dCooW5ZW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mjxvP9+k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="GklxPdxT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C18812075D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:From:Subject:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vpl2SIoHuqZjW03JAsAESwwWLg5UaOPbeiH2TCihh8w=; b=dCooW5ZWImtEFpy74/zahhEPkc
	y/3drodmPMZWmdfiCFFhY3KvZ0eir0igqFVqULcnXnh5HgsHwqrAvGH5MHv4b3DP51pXMz8iaJfD4
	W0CaWDDc6fDtg5SIko+7tcsWJVGomAHEhpdDUxzBOPF9WV2BrT1PRtCgd3HQjua2c7HrxuoKpdlUk
	BCTagoWLPXrVEXvpT7zrddt9k70J/AlIozDpGMu6BlQoO9mbDPDWoxs6dz4rdLN6KVnCSza1QQWAr
	2xwcacH1BywiYAChWPc9WNTxBDmj0mRYD/mnYyqzgYosZBCq8Fhm6ZoyDLEr5xMVV/L8a7hy/uVTz
	IHdUHHGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k43sp-0001io-Ez; Fri, 07 Aug 2020 15:02:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1RdT-0004nf-8i; Fri, 31 Jul 2020 09:47:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:From:Subject:Cc:To:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=kExC9jk9txz7YON5cv/MXIdhSHG2Vis8qMz/iw96FSs=; b=mjxvP9+kkSvxsT0OPDggA3u2ii
 VU+JpAqfPrk3MKKyI3fqYgU+kP15iFCx0kX5Xoc3nwptOhF+3yvlj9jqvDd2mdMjXV92WkXhhVfdR
 dxKUwXuq80TasSOYdhfOPGWhWfOaNq+AZjfrYjwHN5gqOd0wmgRD1LTuBhBs4crafZnhr6ddqPaTi
 eYJsl804EheGWYVzMPluZyJ+fQq9Q2t5wj5XuJEeSNSm79VntwcoaAbN/h0kqsEB3mUThcUBwynfw
 Ps+bBDw96/Z7p2AjH87wWwIbpUgl9pgJWKu0KPzZv5IBTMw4BzJjGyy9yCzbswolsNV8mjApIVzjC
 TEkuKluQ==;
Received: from mout.web.de ([212.227.17.11])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1RdP-0001zT-9w; Fri, 31 Jul 2020 09:47:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1596188823;
 bh=kExC9jk9txz7YON5cv/MXIdhSHG2Vis8qMz/iw96FSs=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=GklxPdxTZE9l+fDBEysM5AY7758cQt3lZiUNHlORHy9X2W3VT4xQTJXef+V+ViuD+
 LGEoZ1t8f5+DYn7rv/sStOpElaItZyyMgHxxHitwpTy9Uv9dUsmMrcM8BZMWEe7vCq
 gCj03IrkmamOXQR993fS2KFvQuxduRddpD9E/+cA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.48.58.67]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LkhFg-1kbbn835y0-00aZ8U; Fri, 31
 Jul 2020 11:47:02 +0200
To: Neal Liu <neal.liu@mediatek.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
 wsd_upstream@mediatek.com
Subject: Re: [PATCH] acpi: fix 'return' with no value build warning
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <ceec7190-2ab3-2e0b-92f7-d4f9cfde2664@web.de>
Date: Fri, 31 Jul 2020 11:46:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:clHZk46xMgZqBNJ5FfdbA8OKEXfTBFnS+FSlE+Gw1H1aMQ4qoGS
 IPitr7Gj1a6zXDPBuONe+Tki2yylOilCEs3HR0x9Nhj4RFm3Aez8e2JWLwemeCg6R1pbmTk
 iSdACGZgHq/o8+gMF601uAUKEV3nsIuhi7cKQnLDjt1NLttAl5s03vut6iv61CP1lpKBY0Z
 KNgZ4Oysir3JS1zU7oLZA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+0Q0BGfQweg=:pwq8HfQd+KKmy3S9DEN4A9
 m+MMHByNLtvh3pKqUf3Rv8DY3gdw8TmiDdGbLc1iRS3GutYbyYREYOst4px/yP6UBgO52wdg3
 dWlIad96QzkR2o4K75sDcQ2GMMqBMHvZeGT5WKtzjg6/wNAhnVOhRTQKsgkMA7KLNs0Qnyw7C
 8mTIlwe6NhvCngTySHHVWRTnDSthFiLBDX3tdATziv50mz+dd6c5O+SCsJ+tUd1YL31etEaWw
 6OhHqB1I29pb5u1bIFkB1NubMX2yG8fE/gKsDmJ2bz+jM5ihu5R7DSV0JjKpecgxtWRaVSXba
 gVJ2+4dgQu1pVN6ntY9zkFvPdDYF1cbneIorEW7D906ssvT9Nl16HS71NN+2XKOGTlKtAOdqq
 yKtm1jWhjZqYaxYpEiHN+m7nWZLuUmWNqBRcOTaXfV4Xz2+8/kXTqGA/Wf2Nm/QkwOyCWUhp4
 nO7M3EmGyZersWJ8qJzNgL409dvQfey4jIxuju7DjPiq9CBTR5FZR/haIiZKaKBpa4+92+ac5
 3X2fc4h2D+MvZf7CqWfV/jPlPapxeoxNMcMkLwyTnVbPOjGaVTSYJ06T8+2Krc+n1w0EPGa5A
 Y0Bk1vZsscnQ5BoLRMbW1s4CqL+clP2XFXyR2LlDPMRT3U3u1Y1GoHoNj0aWfvkFaJPnU6INt
 feJ5PHxK4RZ4gNWNZppOg6NWAMbtQ9NxtHQ5fZ7Sx+6hAMA1xi68WgvwWKvuVG6UahTiEdh1G
 N/VecP21B19VmbQhTOBgKvKb091pnojmTXgkLRnwIYkHY02DBer4w9e0SAJ0dL4I2r0UN0TY0
 MSj9wp3JlIEeGSSbx31f9igdMhrQ6cal2wAfr6h2XvM+Ce7A14tEdwC3HCNrua55artlHgRTk
 tFUm1Di8TKqzP2hhEVx41WOceprDCl2xJUmphqCCRnfIX+IttTtm9VmYBV/CrnCMOXHl4WlQ9
 Lyx96oynfvAVZ1zGuJFN3VDXTpjzxKS5hMSJdnHSV54s2mEA1ek79Ln3yfVuyijQI5FmjbrIC
 1HuiWrIXfvpWVLE4/NsC5b6NrVGQxABiNpK9N2R23GB0qC1mkPuzl2bcfz82ybyGxcky00sVN
 UO4DCM8/3E/B0cYjGQm0tnHKndI5SgzFs7weOTgDrZC6RHkKdQQe1mm3Uwb+HE/Rc8cIIvNq9
 XFWuvMkgi+dWHr3Z7W+ATe141w22agPy505d2eUolvnTYgQtPztKDeLCBeS6xl3udwT2jXHtp
 uYr8jlwcWFzzCsHl4CONiQ7cFfXlZiTIMdncIVA==
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_104728_160879_EEB1498F 
X-CRM114-Status: UNSURE (   5.74  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Fri, 07 Aug 2020 11:02:09 -0400
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
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

PiBGaXhpbmcgQ0ZJIGlzc3VlIHdoaWNoIGludHJvZHVjZWQgYnkgY29tbWl0IGVmZTk3MTEyMTRl
NiBpcyBpbmNvbXBsZXRlLgoKSSBzdWdnZXN0IHRvIHJlcGxhY2UgdGhpcyBzZW50ZW5jZSBieSB0
aGUgdGFnIOKAnEZpeGVz4oCdLgoKUmVnYXJkcywKTWFya3VzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
