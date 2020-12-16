Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1C4C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 17:31:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F3C623382
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 17:31:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F3C623382
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dCBcyJhBKgY3S3kouJKzEwZyBHg5WMA49ZVdTa5S8HA=; b=dBLf+Esv/NHHSU96w5ifOyNSn
	Lw6xpvklOxkSK+7FdJUdovkwIiRCZK1vAAEzdlgTD54HDYFzKRmIjglFEeWGmrVTKPR30esUkdVLF
	FrCSs8st08rHsQNnFRZbrSZ0IzU5o13+mDSIDAhllzWhtVD3xsN84RoHQ1iRVnJ8M0LB6QqBk9vA6
	unWy9rS4gM/+c0k4hZ9JSREru1qpahDzUkmJOwpscWwaOSS3zEA1ReQN2HqBKLhkxeM9AsgRW0Bdy
	ZUvmrw9GaQD4KjzsMDTtpSXWFckI9Ok+2ip39kbp3Nqnpg11OAdEZuIvk0eG+vG9zh5Ow7IIk0hLe
	uNPoBv7Ag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpadX-0001Pt-87; Wed, 16 Dec 2020 17:30:51 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpadU-0001P6-8M
 for linux-mediatek@lists.infradead.org; Wed, 16 Dec 2020 17:30:49 +0000
Received: from [IPv6:2a00:5f00:102:0:b08e:75ff:fe3e:2a49] (unknown
 [IPv6:2a00:5f00:102:0:b08e:75ff:fe3e:2a49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: gtucker)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3C2DD1F41293;
 Wed, 16 Dec 2020 17:30:46 +0000 (GMT)
Subject: Re: linusw/devel bisection:
 baseline.bootrr.mediatek-mt8173-pinctrl-probed on mt8173-elm-hana
To: Linus Walleij <linus.walleij@linaro.org>
References: <5fd76cf2.1c69fb81.6f19b.b16a@mx.google.com>
 <483b08f2-09c3-e753-d2ce-4e34fee627f3@collabora.com>
 <CACRpkdbozXM3FHQB9+GcPJZdNT+Vi1223m2uEqqJ21ukY1A4Gw@mail.gmail.com>
 <8e5e0251-9450-5c93-cd2e-c44779a72b0c@collabora.com>
 <CACRpkdb8Bgie3dJME5qQwu_33b6zVYzAayJnHJUCzrkntpNNXw@mail.gmail.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <600ff528-71b0-ac02-0266-ddc5e3b6fcf4@collabora.com>
Date: Wed, 16 Dec 2020 17:30:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <CACRpkdb8Bgie3dJME5qQwu_33b6zVYzAayJnHJUCzrkntpNNXw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_123048_425255_673342BC 
X-CRM114-Status: GOOD (  14.39  )
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
Cc: "kernelci-results@groups.io" <kernelci-results@groups.io>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Sean Wang <sean.wang@kernel.org>, Johan Hovold <johan@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 16/12/2020 12:41, Linus Walleij wrote:
> On Wed, Dec 16, 2020 at 11:10 AM Guillaume Tucker
> <guillaume.tucker@collabora.com> wrote:
> 
>>> It seems we need to teach the core to ignore the name (empty string).
>>
>> OK great, I see you've sent a patch for that.  I'll check if we
>> can confirm it fixes the issue (something I'd like to also
>> automate...).
> 
> Yups would love to hear if this solves it, it should be in today's
> -next.

Yes in fact it appears to be all fixed on your for-next branch:

  https://kernelci.org/test/case/id/5fda32f92738afa48dc94ce1/

Today's linux-next was not tested in the Collabora lab because of
some infrastructure problem, but that's resolved now so it should
be in tomorrow's results.

Best wishes,
Guillaume

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
