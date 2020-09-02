Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29878C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 12:04:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDAA12078B
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 12:04:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m7sJees8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="MpkdoSS4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDAA12078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h/8vJl5joPVDi1JEGq8+qW11E6S74E3Q1nCcsQ4oTJI=; b=m7sJees8wL0TIgXdHWKHW0ghj
	4fnfwYdoWHmGPOU5U1HdRZ86ePveTwBKQEeTmAwNwgfJMKe2lP7MB3CGnKOjQx2+nto2Y5RHKKCBh
	UXpkQV9XCjy2TL2q8MfErgU1dCUxgBMqdreRXK+1X+N3yc4wUvAJVl9L+wGuA3u+lI/NijcKEgzf5
	Z21qgD8kKIBfhrItRTlE/enO+wznP1TqbHU3/Jmf3u8fQrtnbDnFcK3MVF1L9F0tD9/0T2yTk4YuJ
	ojEupuNLS0CeTvqptG1g+CmkhLeE9YM5is+uAXNNXAqzXV9sW+g6fADl3dPgC7mJUIKICB4ORzbqr
	JZhQOeZxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDRUq-0007vQ-DC; Wed, 02 Sep 2020 12:04:12 +0000
Received: from mout.web.de ([212.227.15.3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDRUm-0007t0-Oq; Wed, 02 Sep 2020 12:04:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1599048245;
 bh=tsS2No5aY8Z0zXIy+N8gvxmKWKqkx/cvOlYf4Ekcuzk=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=MpkdoSS4MLXvoc3svN/rYxCDrJNfOuowONgF9gDbei19QHqDtGsiDYt7F9LY7dQSI
 GbiL29g4lSpDaFDQxQ1Rnkn7wEE51POlV5ncjOvzzGwdwk9cbze+KvCADbs/VgcmMN
 uvCPL2bRxRGkemgmjsTZjl7KAuzTFFOo/8Y0RNSI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.24.57]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MLgCx-1kCbwX18C3-000pl2; Wed, 02
 Sep 2020 13:50:58 +0200
Subject: Re: rpmsg: Avoid double-free in mtk_rpmsg_register_device()
To: Nicolas Boichat <drinkcat@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-remoteproc@vger.kernel.org
References: <9f4fb922-4aa3-0b63-6d81-c83daefd13b9@web.de>
 <CANMq1KBJTpnYG59B1V=y_emqD3dtMZQAPY9bWJOC8FW2fNRgsA@mail.gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <28d04296-9f3c-464d-d4a0-fd03cdc883d9@web.de>
Date: Wed, 2 Sep 2020 13:50:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CANMq1KBJTpnYG59B1V=y_emqD3dtMZQAPY9bWJOC8FW2fNRgsA@mail.gmail.com>
Content-Language: en-GB
X-Provags-ID: V03:K1:T+XatyHIegHHQLFHQJ0gjnuIktdwSH7SFfmZ4NhhqNC0V2S77iA
 IU+hQry/nJmuaFDsuOa5whB9sGeFX81g+oU5MeOoZVuSJRQVFMQ8i7goZ/7Ku4nrBAu5/u7
 4R/2EjyMljticz1B0LhTgDcQEZYFJHe9yWfcjbiJ3cU6wONdVMWpvC09V40E0i5e12kSDJA
 c03Yjv2988hxtaS8dcW7Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SKjEfykBSYQ=:U3gsTwq78qcoSU92TVe3Hn
 RLQL2kpl+/tdZGJR8Wcc50G07HZQz4nr/VkH37VNWi8NGxrmdU2yKlgkwo7fLDXdpPAANv5Lm
 ijHJJxka1oE55KmPQaRqj8PclvasqJ0jXsqgU91cONrzhS4L6pVPH+MK6PJwiezjRJrA8Miy+
 RYeeHtgBzcoFu2k5lpYfQCFLY4eVXF8fOJyxVMgopSmVJdBG/QHpNhoDtyGRPPrZBI8PyT4cZ
 3WBfQcNkTvnoXmCvAypK96V99i40NsuWXQEssqhIUCrkTvDFhEqUiQGdds6nPSNCOO0xhs3e4
 LrKdaO8sMVuhFt4ayU89APOO/AtCcGDZ2KiRNM4Nr72K5qK9R6osU2DtEptsBysVrIIdz619v
 HODsd3WjUCf3/oaJ4WIjGFJ6GWGxPrCbhlqe9S22oEnbkh3TW2CixDNzuKQok8AZ1rd0HFTx7
 U25azr3zi1xua0eprG68pReTnb4PvFb/7yLRrrFnAxhadEq9zjobyOZeGO7ZcNHs2VFrN+x4h
 NyVJBgSK819632yIVLghOpLN0HkaFQf+XC/mWi5tBKG94s9WvwJM/JCvdcBQqgpYuBxlzlFU4
 LT2lsJN+JsV+cDCGfQqXXHPaCp1YHmMrSi9zyVR2QLKfAZqE+E+8FOFCCEK7rU/fEYprQiwGV
 WjJjD6vNeYKCfUvCaREUAd6a20o6ULeg44dF7QqSnQUwqYvXOnomCSdXHurwtXFS0itB/BJfr
 X10sKQekvzeQsZyWicAybJtfnArH8btGJ1MFG5jj9ZB7VYI1dAOf6IJHXReQ8u3HVt5WGnaj3
 PHeK4xHvoDXVQNt7rjeML5vFzRmaVIct0Kg25AU0AJOuQfYJKKPDabgSdR2CbIbKh8Z2tDrRx
 Ejqv05SjkIzSpeUFTm2bAUHxvy/FPHQXqW/BrqX2NufRGhe+54UssvmGqZHSvEM1FASsWVTUo
 dC3MeXEB1ts0QduQTg9D3cKbjtUs9TUdRMJ7Q5Lj7UhjsGBN6DL+IOm5WpDA1Q1VdrF2dT22q
 HU92PrHPKAsozs0LrbOxS1uLOfAwx8cVZPegUh/T69Tbj/rOdirpuLH2Xk0uiC7hEc6wvghwp
 eogB0tF37DmfKR/dKmEKy2quP+vTfU3usZCddsxXSfLkunhSg1og4zhb900oX4F9/ye9j3ZiJ
 ZUJoZMSbKJ2qZ+xG6N/wlD4hKLClH3QPFxpPgqyVltVNC+6KaoDNPKgygyRS/mBMSaeOLEvW0
 VumhSCkaCVt4Z1AtOCjToIuYg83bhPlucN64v0Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_080409_110761_7472C374 
X-CRM114-Status: UNSURE (   9.48  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

>> Can another imperative wording become helpful for the change description?
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=9c7d619be5a002ea29c172df5e3c1227c22cbb41#n151
>
> Looking at your posting history, I'll leave it up to the maintainer.

Would you like to follow the Linux development process documentation here
(for the subsequent patch version)?

Regards,
Markus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
