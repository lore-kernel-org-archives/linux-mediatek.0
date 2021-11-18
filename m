Return-Path: <SRS0=mmGE=QF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3225BC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 13:31:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF56E61350
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 13:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF56E61350
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gmh288tX5K/8eTAA6eqEAe54KSIwajMiuuhDjOub5Nc=; b=Vk7DBdFWW2yePs
	Lb9VfzLwaOMAyEoFaClqJXbJwbUBilSONEDGMnaQEXAhf5ssCJMIyOarhOmTybOrtWxbar3tkrCUW
	lU9KveFZamJUnYUwn/0B7aOXyqCv3AxMmesbtvk77Hx8KKGow2+/1TJ7sECThAQMWlUJeW4qQUGHB
	oxNr/X+ecVl+V9/fOz5udWwILExqbPupliUvg6cT+PX9klssXVCBCI0fnRxLMGh3iyXXJRG9/ASNE
	3th0Y0fUZ+jHiZzwZunK4UYu94FstTv+v9SUG1O5p4XJb03UeASjBuo107BiMESMAj0o9VYT40ZtM
	MpaSNvW5QWqI4Jad9pLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnhVH-007vJA-9r; Thu, 18 Nov 2021 13:31:03 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnhVC-007vHJ-J3; Thu, 18 Nov 2021 13:31:00 +0000
Received: by mail-pl1-x631.google.com with SMTP id v19so5242426plo.7;
 Thu, 18 Nov 2021 05:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Rri8CgMU3iUgw+czpevbWjMbr1UWm75xhAwXD02I6xU=;
 b=FDEnvL+UtpoLRk6Q1zJ5TWKgN3pkejoc+c1lfiUwMmvGmldi6KxwZO1grB8bUwgggl
 NxymJ9lCNeYeShRKPCEoAFb/qyeXIlHXW6H9LhjrDZVVUGNirPbyJuI24LirczSzl/Na
 OK380QfTTMyJLsiytjnQRYSmo9aAci9N0vFC8VP0JB29tQt8eoW/ggKIxCPmK5+dxsXW
 XwurEenZVOh5wEwUMaPPAASeHd9USOigFhhHFenuvMmC1EPdDlgUL2LZwm9an0CE8meS
 Rv6YcVKeQnHd4N1kacEKQoyflUzVHPAi/1nTgQ8d8eBhHJHyNrVBYPckBm/kGT11HH/L
 8L/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Rri8CgMU3iUgw+czpevbWjMbr1UWm75xhAwXD02I6xU=;
 b=2aLDb7JiUmgJYhxoWjB/siG3rS9CpSXVlChTZ7Klytb54bODR58GX1wTsv5Gej/Pzn
 /pKIDJoYDrwWVyAU17AnuugESrlC+ek9ivlnqYDPtZOZ0/JniEHuFuGpSWGoZMM0OWne
 fmItbnct6VNuHJeoMPGV0q82K98rOQKAY/PO1lNDlRZ+AfENTriMMK5HXXTEWIRtg5ne
 NUnDz+AnfxCCTUqOmAV3xItP+rnoIhaUazPDEJRfbRoef/tLCOz70wZ7GaiCnExjv1xo
 W2UqD5njHiviqpVZAAcjO2PlI0SY6nV88RbkrXOH69yxSMJ1hWqLsD0j4jWiSRMghVFx
 jTbQ==
X-Gm-Message-State: AOAM533Z4Fgaatjch6/MAd055fDIjZf8C2BxHIoLhwLDIfw6lgSS29OE
 fadrdvyWE3EHDIEVLkmy0fM=
X-Google-Smtp-Source: ABdhPJw603nbU+O/fPHP8RoT4nn8P5boytORpwShOu3KLVJrVk3lFo3z0RQCNEqj18u5XFcu5Q1lpg==
X-Received: by 2002:a17:90a:df14:: with SMTP id
 gp20mr10690696pjb.186.1637242256451; 
 Thu, 18 Nov 2021 05:30:56 -0800 (PST)
Received: from theprophet ([2406:7400:63:2c47:5ffe:fc34:61f0:f1ea])
 by smtp.gmail.com with ESMTPSA id z19sm3624615pfe.181.2021.11.18.05.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 05:30:56 -0800 (PST)
Date: Thu, 18 Nov 2021 19:00:20 +0530
From: Naveen Naidu <naveennaidu479@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 linux-hyperv@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 linux-pci@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Russell Currey <ruscur@russell.cc>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Toan Le <toan@os.amperecomputing.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Nirmal Patel <nirmal.patel@linux.intel.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Rob Herring <robh@kernel.org>, Wei Liu <wei.liu@kernel.org>,
 linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Joyce Ooi <joyce.ooi@intel.com>, Dexuan Cui <decui@microsoft.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 linux-rockchip@lists.infradead.org,
 "maintainer:BROADCOM IPROC ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>, 
 Jonathan Derrick <jonathan.derrick@linux.dev>,
 Xiaowei Song <songxiaowei@hisilicon.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Robert Richter <rric@kernel.org>, Sean V Kelley <sean.v.kelley@intel.com>,
 Ray Jui <rjui@broadcom.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 linux-arm-kernel@lists.infradead.org, Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
 Scott Branden <sbranden@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Lukas Wunner <lukas@wunner.de>, Jingoo Han <jingoohan1@gmail.com>,
 Shawn Guo <shawn.guo@linaro.org>,
 Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH v3 01/25] PCI: Add PCI_ERROR_RESPONSE and it's related
 definitions
Message-ID: <20211118133020.nkr3xzbzonxtrqbw@theprophet>
References: <f7960a4dee0e417eedd7d2e031d04ac9016c6686.1634825082.git.naveennaidu479@gmail.com>
 <20211117235812.GA1786428@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211117235812.GA1786428@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_053058_686170_E6AC3C72 
X-CRM114-Status: GOOD (  42.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 17/11, Bjorn Helgaas wrote:
> On Thu, Oct 21, 2021 at 08:37:26PM +0530, Naveen Naidu wrote:
> > An MMIO read from a PCI device that doesn't exist or doesn't respond
> > causes a PCI error.  There's no real data to return to satisfy the
> > CPU read, so most hardware fabricates ~0 data.
> > 
> > Add a PCI_ERROR_RESPONSE definition for that and use it where
> > appropriate to make these checks consistent and easier to find.
> > 
> > Also add helper definitions SET_PCI_ERROR_RESPONSE and
> > RESPONSE_IS_PCI_ERROR to make the code more readable.
> > 
> > Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
> > Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> > ---
> >  include/linux/pci.h | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > index cd8aa6fce204..689c8277c584 100644
> > --- a/include/linux/pci.h
> > +++ b/include/linux/pci.h
> > @@ -154,6 +154,15 @@ enum pci_interrupt_pin {
> >  /* The number of legacy PCI INTx interrupts */
> >  #define PCI_NUM_INTX	4
> >  
> > +/*
> > + * Reading from a device that doesn't respond typically returns ~0.  A
> > + * successful read from a device may also return ~0, so you need additional
> > + * information to reliably identify errors.
> > + */
> > +#define PCI_ERROR_RESPONSE     (~0ULL)
> > +#define SET_PCI_ERROR_RESPONSE(val)    (*(val) = ((typeof(*(val))) PCI_ERROR_RESPONSE))
> > +#define RESPONSE_IS_PCI_ERROR(val) ((val) == ((typeof(val)) PCI_ERROR_RESPONSE))
> 
> Beautiful!  I really like this.
>

Thank you very much for the review ^^

> I would prefer the macros to start with "PCI_", e.g.,
> PCI_SET_ERROR_RESPONSE().
> 

ACK

> I think "RESPONSE_IS_PCI_ERROR()" is too strong because (as the
> comment says), ~0 *may* indicate an error.  Or it may be a successful
> read of a register that happens to contain ~0.
> 
> Possibilities to convey the idea that this isn't definitive:
> 
>   PCI_POSSIBLE_ERROR_RESPONSE(val)  # a little long
>   PCI_LIKELY_ERROR(val)             # we really have no idea whether
>   PCI_PROBABLE_ERROR(val)           #   likely or probable
>   PCI_POSSIBLE_ERROR(val)           # promising?
>

ACK. Will use PCI_POSSIBLE_ERROR()

> Can you rebase to my "main" branch (v5.16-rc1), tweak the above, and
> collect up the acks/reviews?
> 

ACK

> We should also browse drivers outside drivers/pci for places we could
> use these.  Not necessarily as part of this series, although if
> authors there object, it would be good to learn that earlier than
> later.
> 
> Drivers that implement pci_error_handlers might be a fruitful place to
> start.  But you've done a great job finding users of ~0 and 0xffff...
> in drivers/pci/, too.
> 

A quick grep showed that there are around 80 drivers which have
pci_error_handlers. I was thinking that it would be better if we handle
these drivers in another patch series since the current patch series is
itself 25 patches long. And in my short tenure reading LKML, I gathered
that folks generally are not so kind to a long list of patches in a
single patch series ^^' (I might be wrong though, Apologies)

The consensus on the patch series does seem slightly positive so
ideally, I was hoping that we would not have the case where a author
does not like the way we are handling this patch. Then again, I'm
pretty sure that I might be wrong ^^'

I hope it would be okay that I send in a new patch series with the
suggested changes and handle the other changes in another patch series
^^

Thanks,
Naveen
> > +
> >  /*
> >   * pci_power_t values must match the bits in the Capabilities PME_Support
> >   * and Control/Status PowerState fields in the Power Management capability.
> > -- 
> > 2.25.1
> > 
> > _______________________________________________
> > Linux-kernel-mentees mailing list
> > Linux-kernel-mentees@lists.linuxfoundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
