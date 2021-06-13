Return-Path: <SRS0=I1M+=LI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E04EEC48BE8
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jun 2021 00:00:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8162761374
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jun 2021 00:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8162761374
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=reto-schneider.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVMr5fEDRlARbhA+uuEmMTWqLfjYfDOZ15LnXXKr/Ag=; b=tujFQV1iODrKBzXTjNdhD0JRL0
	xU27LG/OmF1jh6hWnqFT97ib5gk+o3r20exq4ba4Kz5G+CO3jKSNgmvyaMjDJG8GanlGU2IAIBfZi
	n4xOc7eDAtpPFZtHNMTY4ITn/R+PsXTcrx+mYSV4C2sa3Y9MMeWbIXD8se15Li3bkWJCebOcJfkeO
	UeTP+ypn//+7fYggwZts8P0eJwMfzd5zPEXgnjtippChtc2cH17nvbf880DPsYN2VyjBi9NlYgPHl
	wpppZSJJCMYPBA9/aILH0ZWWChWYdceF8P9SZXyVfeYiBT10kTiP6Z1+pSSF3ANzVTSCo3Oc0v7DL
	GW5KHZZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsZzD-00Bhiy-Dz; Sun, 13 Jun 2021 23:57:51 +0000
Received: from mxout017.mail.hostpoint.ch ([2a00:d70:0:e::317])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsZz1-00BhhS-2v; Sun, 13 Jun 2021 23:57:40 +0000
Received: from [10.0.2.46] (helo=asmtp013.mail.hostpoint.ch)
 by mxout017.mail.hostpoint.ch with esmtp (Exim 4.94.2 (FreeBSD))
 (envelope-from <code@reto-schneider.ch>)
 id 1lsZyv-0002J6-6t; Mon, 14 Jun 2021 01:57:33 +0200
Received: from [2a02:168:6182:1:d747:8127:5b7a:4266]
 by asmtp013.mail.hostpoint.ch with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2 (FreeBSD)) (envelope-from <code@reto-schneider.ch>)
 id 1lsZyv-000Hc5-4Q; Mon, 14 Jun 2021 01:57:33 +0200
X-Authenticated-Sender-Id: reto-schneider@reto-schneider.ch
From: Reto Schneider <code@reto-schneider.ch>
Subject: Re: [PATCH v1] gpio: mt7621: Assign base field in gpio_chip
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Stefan Roese <sr@denx.de>, Reto Schneider
 <reto.schneider@husqvarnagroup.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210613120608.1527394-1-code@reto-schneider.ch>
 <CAHp75Vc5LRRLc-1A5W4BVQ3QQx-+4Y5CUjG3ksosVdPEecEyqA@mail.gmail.com>
 <db862b9d-2003-08f4-6856-26fb4870caff@reto-schneider.ch>
 <CACRpkdbSv0h6hB_yR+_ZC3vxSUOkaa94EzCArSaSC=nvc5AT3g@mail.gmail.com>
Message-ID: <04f4dda6-b16b-7862-0e88-daefc6d0110f@reto-schneider.ch>
Date: Mon, 14 Jun 2021 01:57:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbSv0h6hB_yR+_ZC3vxSUOkaa94EzCArSaSC=nvc5AT3g@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_165739_158773_E5950FC0 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Linus,

On 14.06.21 01:24, Linus Walleij wrote:
> Hm isn't OpenWrt switched to the mainline driver?

They did, and people are now seeing this "issue" too [1]. Which got me 
to post my "fix" [2] and then trying to upstream it here. :)

Kind regards,
Reto

[1] https://lists.openwrt.org/pipermail/openwrt-devel/2020-May/028926.html
[2] https://lists.openwrt.org/pipermail/openwrt-devel/2021-June/035497.html

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
