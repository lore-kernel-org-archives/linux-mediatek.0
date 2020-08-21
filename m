Return-Path: <SRS0=eFaK=B7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980ADC433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:17:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6453C20732
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:17:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yDi3BZMT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TuRM4rWA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6453C20732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QOlizJ0Hq6V+D5JzTy7lUDWfkEqdEBD+EYAre0RqwhA=; b=yDi3BZMTNZ8sC3bSKni+Qm+Zl
	U6onN6YVAvW0xZRCdc55o0C/th29NBJhzqzDQY9ibHjxG6fyGJn+PrwROPI8jxW5hIFZRadoWBbAQ
	lj5FOF2wRv39z5AvhTECALUjmAg6SqubivRhfn1RAXixS04htalwrOxRbJD44xtyi2dBwLjI9EGUu
	jb8z+/R2slJwoUX/s/Uq/3wD8Xn9fNPI6bjF06JbNESYCIMjG33CgFV+UGHwjnz2csvpGki4cLmE9
	ow7aDpBUUAbmiYjjUEMOFaP6H472KgGM7MBOCaGMPLpGX4Fcxsc5AZKprtAQPI2Fup5kGHxi7wZ8e
	SeWp1WODg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k947H-0007cz-Gi; Fri, 21 Aug 2020 10:17:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9479-0007c4-LD; Fri, 21 Aug 2020 10:17:44 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E3D3B20732;
 Fri, 21 Aug 2020 10:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598005059;
 bh=5BAlCqvHy57rbwgICn/sFBOoeg182xLiB3y+Z3clJT0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TuRM4rWAEXZya+O4G3npdmKG8oVkWUezk+wz4nqTVpJ2F3EL1SuL7rO4CoOORUbDF
 OXldTfml7s7fn6b/J4FW9+mXNxpwTCbhSD1ij9FZjJ1CONkKqIOfTYIegfcWZPDRR9
 UD1B40SrVa9tAKlA9rMyBZEoXOXzGlNvobcik8ts=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1k9477-004prC-00; Fri, 21 Aug 2020 11:17:37 +0100
MIME-Version: 1.0
Date: Fri, 21 Aug 2020 11:17:36 +0100
From: Marc Zyngier <maz@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH] Revert "irqchip/mtk-sysirq: Convert to a platform driver"
In-Reply-To: <95ae0ae3-7798-d6d5-fc37-391862a0b4ca@collabora.com>
References: <20200819161907.1155110-1-enric.balletbo@collabora.com>
 <C9E59107-CE83-4554-9447-5DE5BEE09A3B@fw-web.de>
 <CAGETcx9_A-E5b-JxT2G142mGxqoo8xqFNEgT+CNWt=oOv0Z5+w@mail.gmail.com>
 <a23bac35d20eb002bdfb5263bf5dd213@kernel.org>
 <CAGETcx-NpRzzeXYN-UBP1eAsC3s_AofSQ9rXOEmCjhLhKLnxWg@mail.gmail.com>
 <14b8f4b9667d29ee25e25eb19c69e3f7@kernel.org>
 <95ae0ae3-7798-d6d5-fc37-391862a0b4ca@collabora.com>
User-Agent: Roundcube Webmail/1.4.7
Message-ID: <93debe6a0308b66d3f307af67ba7ec2c@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: enric.balletbo@collabora.com, saravanak@google.com,
 wichtig@fw-web.de, linux-kernel@vger.kernel.org, kernel@collabora.com,
 linux@fw-web.de, matthias.bgg@gmail.com, drinkcat@chromium.org,
 hsinyi@chromium.org, hanks.chen@mediatek.com, jason@lakedaemon.net,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_061739_928674_23C006C4 
X-CRM114-Status: GOOD (  29.61  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Jason Cooper <jason@lakedaemon.net>, Saravana Kannan <saravanak@google.com>,
 Hanks Chen <hanks.chen@mediatek.com>, Frank Wunderlich <wichtig@fw-web.de>,
 LKML <linux-kernel@vger.kernel.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Wunderlich <linux@fw-web.de>, Collabora Kernel ML <kernel@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Enric,

On 2020-08-21 10:20, Enric Balletbo i Serra wrote:
> Hi Marc,
> 
> On 20/8/20 16:53, Marc Zyngier wrote:
>> On 2020-08-20 09:07, Saravana Kannan wrote:
>>> On Thu, Aug 20, 2020 at 12:56 AM Marc Zyngier <maz@kernel.org> wrote:
>>>> 
>>>> On 2020-08-19 19:51, Saravana Kannan wrote:
>>>> > On Wed, Aug 19, 2020 at 9:52 AM Frank Wunderlich <wichtig@fw-web.de>
>>>> > wrote:
>>>> >>
>>>> >> hi,
>>>> >>
>>>> >> does the fix you've linked to my revert [1] not work in your case?
>>>> >>
>>>> >> [1] https://patchwork.kernel.org/patch/11718481/
>>>> >
>>>> > Thanks for pointing it out Frank. Also, might want to avoid top
>>>> > posting in the future.
>>>> >
>>>> > Enric, Can you please try that other fix and see if that solves your
>>>> > issue?
>>>> 
>>>> I think Enric was clear that the driver does probe correctly
>>>> (meaning that he has the fix in his tree). It is everything else
>>>> that breaks, because none of the drivers on the platform are
>>>> equipped to defer their own probing.
>>>> 
>>>> I think we need to change this works right now, meaning that we 
>>>> can't
>>>> blindly change the behaviour of *built-in* drivers. I'll see if I 
>>>> can
>>>> come up with something quickly, but I'll otherwise take Enric patch.
>>> 
>>> Sounds fair Marc.
>>> 
>>> Btw, Enric, out of curiosity, can you try adding "fw_devlink=on" to
>>> your kernel command line to see if it helps? It basically ensures
>>> proper probe ordering without depending on the drivers. There are 
>>> some
>>> corner cases where it still can't work properly (too much to explain
>>> for a late night email), but if the platforms don't have those corner
>>> cases it'll work perfectly.
>>> 
>>> I'm fine with the revert if Marc isn't able to find a quick fix to 
>>> the
>>> drivers, but this might also fix your problem right away.
>> 
>> I'm afraid there is no quick fix if we want to preserve the current
>> behavior with built-in drivers, and not having "fw_devlink=on" by
>> default makes it irrelevant for most people.
>> 
>> fw_devlink also prevents my test platforms from booting (my rk3399
>> doesn't find its PCI devices with it), while the same kernel boots
>> just fine without it. It could well be that the corner case is
>> likely to be more prevalent than you seem to expect.
>> 
>> I will probably end-up end-up queuing reverts for both mtk-sysirq,
>> mtk-cirq, and qcom-pdc (the first two can't be built as module with
>> mainline anyway, and I seem to remember that the latter caused some
>> controversy as well).
>> 
>> As an experiment, I have pushed out a branch[1] that implements
>> a "hybrid" probe, retaining the previous early probe mechanism when
>> the driver is built-in, and letting things rip when built as a
>> module (if you do that, you hopefully know what you are doing).
>> I'd welcome some testing on affected platforms (I don't have
>> anything I can run mainline on that'd be affected).
>> 
> 
> Unfortunately, my Kukui (MT8183) board doesn't boot at all with those 
> patches. I
> only did a quick test and I didn't dig further, please let me know if 
> you want I
> debug more the issue. IMHO, right now, the revert seems to be the 
> better
> solution for this cycle.

It'd be good if you could help with that, but I will definitely apply
the revert (below for the revert list). Any change is too invasive to
be added to this cycle.

920ecb8c35cb irqchip/mtk-cirq: Convert to a platform driver
f97dbf48ca43 irqchip/mtk-sysirq: Convert to a platform driver
5be57099d445 irqchip/qcom-pdc: Switch to using IRQCHIP_PLATFORM_DRIVER 
helper macros
95bf9305d2e3 irqchip/qcom-pdc: Allow QCOM_PDC to be loadable as a 
permanent module

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
