Return-Path: <SRS0=NAie=2C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D788CC43603
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 14:30:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A98622067C
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 14:30:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kDDQpQC4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A98622067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:From:Date:
	MIME-Version:Subject:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RNUG7CHihsrbrb0QsWX78QAW3zYlon6BZLgWPmTn1K0=; b=kDDQpQC4JPWMTrr1E3qcZCQTc
	0V52fa5LohkVMOD05DKnX1i3hEwCLtgvKPXjqV4FDNCUQjwK+0GWtwvmiGE5EnF7h7sjQ/kAyDM/V
	tz71f1fLZMMo1J1So74wd3k9kbkROdpJ2j0S/NcWaacEo9Tq4kqkNO36elUlVWl1Kc2UQlrx/cN88
	PaAVKx+JKFOvXaTg/1Oahfv8GeRMa+jwb4FsZZWTC/ZFt8F5tCAwynRuwCJ8tq/cDUfTGf6EbmGgz
	J0fLMngqVLu5sxw0k2xm5TW2ALbxp3/crp+UgakRE9pV4Zws55X2u3hi1V4rAmYdmBqUdWgpSx4S9
	grItYlXog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifPUT-0003Y6-07; Thu, 12 Dec 2019 14:30:53 +0000
Received: from inca-roads.misterjones.org ([213.251.177.50])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifPUP-0003Xe-6O; Thu, 12 Dec 2019 14:30:50 +0000
Received: from www-data by cheepnis.misterjones.org with local (Exim 4.80)
 (envelope-from <maz@kernel.org>)
 id 1ifPUF-0002s6-2y; Thu, 12 Dec 2019 15:30:39 +0100
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH v5 3/3] hwrng: add mtk-sec-rng driver
X-PHP-Originating-Script: 0:main.inc
MIME-Version: 1.0
Date: Thu, 12 Dec 2019 14:30:38 +0000
From: Marc Zyngier <maz@kernel.org>
In-Reply-To: <CAKv+Gu9YhkzpKbrxa=xDOkS6=kZSMaidor_4DqGY6f1M0tO7kQ@mail.gmail.com>
References: <1574864578-467-1-git-send-email-neal.liu@mediatek.com>
 <1574864578-467-4-git-send-email-neal.liu@mediatek.com>
 <CADnJP=uhD=J2NrpSwiX8oCTd-u_q05=HhsAV-ErCsXNDwVS0rA@mail.gmail.com>
 <1575027046.24848.4.camel@mtkswgap22>
 <CAKv+Gu_um7eRYXbieW7ogDX5mmZaxP7JQBJM9CajK+6CsO5RgQ@mail.gmail.com>
 <20191202191146.79e6368c@why>
 <299029b0-0689-c2c4-4656-36ced31ed513@gmail.com>
 <b7043e932211911a81383274e0cc983d@www.loen.fr>
 <1576127609.27185.8.camel@mtkswgap22>
 <a5982b8ed10440eef14c04df6e6060b6@www.loen.fr>
 <CAKv+Gu9YhkzpKbrxa=xDOkS6=kZSMaidor_4DqGY6f1M0tO7kQ@mail.gmail.com>
Message-ID: <9de12c45b4b022cfb01d89ca56429d53@www.loen.fr>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/0.7.2
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: ard.biesheuvel@linaro.org, neal.liu@mediatek.com,
 f.fainelli@gmail.com, pawel.moll@arm.com, mark.rutland@arm.com,
 devicetree@vger.kernel.org, herbert@gondor.apana.org.au,
 wsd_upstream@mediatek.com, catalin.marinas@arm.com, sean.wang@kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-crypto@vger.kernel.org, mpm@selenic.com,
 matthias.bgg@gmail.com, crystal.guo@mediatek.com, will@kernel.org,
 lists@bofh.nu, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_063049_378599_54C2F1E5 
X-CRM114-Status: GOOD (  23.63  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Pawel Moll <pawel.moll@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Sean Wang <sean.wang@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 =?UTF-8?Q?Crystal_Guo_=28=E9=83=AD=E6=99=B6=29?= <crystal.guo@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Neal Liu <neal.liu@mediatek.com>, "open
 list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>,
 Matt Mackall <mpm@selenic.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Will Deacon <will@kernel.org>, Lars Persson <lists@bofh.nu>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2019-12-12 14:03, Ard Biesheuvel wrote:
> On Thu, 12 Dec 2019 at 12:45, Marc Zyngier <maz@kernel.org> wrote:
>>
>> On 2019-12-12 05:13, Neal Liu wrote:
>> > On Tue, 2019-12-03 at 11:17 +0000, Marc Zyngier wrote:
>> >> On 2019-12-03 04:16, Florian Fainelli wrote:
>> >> > On 12/2/2019 11:11 AM, Marc Zyngier wrote:
>> >> >> On Mon, 2 Dec 2019 16:12:09 +0000
>> >> >> Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>> >> >>
>> >> >>> (adding some more arm64 folks)
>> >> >>>
>> >> >>> On Fri, 29 Nov 2019 at 11:30, Neal Liu 
>> <neal.liu@mediatek.com>
>> >> >>> wrote:
>> >> >>>>
>> >> >>>> On Fri, 2019-11-29 at 18:02 +0800, Lars Persson wrote:
>> >> >>>>> Hi Neal,
>> >> >>>>>
>> >> >>>>> On Wed, Nov 27, 2019 at 3:23 PM Neal Liu
>> >> <neal.liu@mediatek.com>
>> >> >>>>> wrote:
>> >> >>>>>>
>> >> >>>>>> For MediaTek SoCs on ARMv8 with TrustZone enabled,
>> >> peripherals
>> >> >>>>>> like
>> >> >>>>>> entropy sources is not accessible from normal world 
>> (linux)
>> >> and
>> >> >>>>>> rather accessible from secure world (ATF/TEE) only. This
>> >> driver
>> >> >>>>>> aims
>> >> >>>>>> to provide a generic interface to ATF rng service.
>> >> >>>>>>
>> >> >>>>>
>> >> >>>>> I am working on several SoCs that also will need this kind 
>> of
>> >> >>>>> driver
>> >> >>>>> to get entropy from Arm trusted firmware.
>> >> >>>>> If you intend to make this a generic interface, please 
>> clean
>> >> up
>> >> >>>>> the
>> >> >>>>> references to MediaTek and give it a more generic name. For
>> >> >>>>> example
>> >> >>>>> "Arm Trusted Firmware random number driver".
>> >> >>>>>
>> >> >>>>> It will also be helpful if the SMC call number is
>> >> configurable.
>> >> >>>>>
>> >> >>>>> - Lars
>> >> >>>>
>> >> >>>> Yes, I'm trying to make this to a generic interface. I'll 
>> try
>> >> to
>> >> >>>> make
>> >> >>>> HW/platform related dependency to be configurable and let it
>> >> more
>> >> >>>> generic.
>> >> >>>> Thanks for your suggestion.
>> >> >>>>
>> >> >>>
>> >> >>> I don't think it makes sense for each arm64 platform to 
>> expose
>> >> an
>> >> >>> entropy source via SMC calls in a slightly different way, and
>> >> model
>> >> >>> it
>> >> >>> as a h/w driver. Instead, we should try to standardize this, 
>> and
>> >> >>> perhaps expose it via the architectural helpers that already
>> >> exist
>> >> >>> (get_random_seed_long() and friends), so they get plugged 
>> into
>> >> the
>> >> >>> kernel random pool driver directly.
>> >> >>
>> >> >> Absolutely. I'd love to see a standard, ARM-specified,
>> >> virtualizable
>> >> >> RNG that is abstracted from the HW.
>> >> >
>> >> > Do you think we could use virtio-rng on top of a modified
>> >> virtio-mmio
>> >> > which instead of being backed by a hardware mailbox, could use
>> >> > hvc/smc
>> >> > calls to signal writes to shared memory and get notifications 
>> via
>> >> an
>> >> > interrupt? This would also open up the doors to other virtio 
>> uses
>> >> > cases
>> >> > beyond just RNG (e.g.: console, block devices?). If this is
>> >> > completely
>> >> > stupid, then please disregard this comment.
>> >>
>> >> The problem with a virtio device is that it is a ... device. What 
>> we
>> >> want
>> >> is to be able to have access to an entropy source extremely early 
>> in
>> >> the
>> >> kernel life, and devices tend to be available pretty late in the
>> >> game.
>> >> This means we cannot plug them in the architectural helpers that 
>> Ard
>> >> mentions above.
>> >>
>> >> What you're suggesting looks more like a new kind of virtio
>> >> transport,
>> >> which is interesting, in a remarkably twisted way... ;-)
>> >>
>> >> Thanks,
>> >>
>> >>          M.
>> >
>> > In conclusion, is it helpful that hw_random has a generic 
>> interface
>> > to
>> > add device randomness by talking to hwrng which is implemented in 
>> the
>> > firmware or the hypervisor?
>> > For most chip vendors, I think the answer is yes. We already 
>> prepared
>> > a
>> > new patchset and need you agree with this idea.
>>
>> As long as it is a *unified* interface, I'm all for that.
>>
>
>
> Yeah, but I'm not sure it makes sense to model it as a device like
> this. It would be nice if we could tie this into the ARM SMCCC
> discovery, and use the SMC calls to back arch_get_random_seed_long()

Probably I wasn't clear enough, but that's really what I meant by
a unified interface (implemented by the firmware or the hypervisor).

> [provided we fix the braindead way in which that is being used today
> in the interrupt code]

Ah, I said I'd look into it. Thanks for the reminder...

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
