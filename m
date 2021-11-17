Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD89C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 23:58:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B59661ABF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 23:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B59661ABF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=vqk0iOrHOR5Fz8Jt8GId5QasELHM10oU+sFYbV5p834=; b=y6bvnCdYZNCT5f
	0Ct6dgEiiGzZdJ8kyqFk8CoUOZcEA3b3ZBFqLFJXYPv6SAqP4bzOVqLWSU+2Da0RPuQctCauqEY2P
	yD4IslUM4gGqU2PiajkpgPijnbFa2MUS7GDf0s7GT/TwtnWOqTz5YbD1v7AFAV3Ixdt9ZGQEXczFW
	Bawhjih11x4JZ9rtKpm9IEHpyYXEbNntAy+TFRPhLVDY1nSlx4uvTBBG64nsG3c4u3PkGLXMLFxfD
	AetALjylaCAwd9ONI9OOhFgc00XOLQOPmlcN9FPPaqTUbECpkMMkVeW7O/Ogt7Ol2rvKn5L4ZN41E
	GYP+h2d634ga0YlTtwmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnUou-006cAz-K9; Wed, 17 Nov 2021 23:58:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnUog-006c86-UK; Wed, 17 Nov 2021 23:58:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8D5A61AD2;
 Wed, 17 Nov 2021 23:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637193494;
 bh=jt1bptChpIJAfJm7hhcvnL0z6T39eDJjHsyLzG8zD1Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=lyKjNjZh0qOCqIMVIpeRoNDwhdUJ/tL20BWpiwNwGttOe0RfGC7KJ4PhUovOify8k
 CPIwK9uSUQMg7VMxx+ystTmi5eBYFIkTtVD4sE8ulLOvbgkfTXGOpyI5/5ntrQgvl0
 CfZ1WfNlECodqxIGcyQGBzURqYPwL89BjB4irtfrZDGz99G0bGiOvyoqAHp04d3fBv
 aBxC568xp2R7kzM9biPqbt5SZcYkGOgkMTsagR6oWZfjlJq8OfZ4tIYBwT1Dm+Bjb+
 xfWKIqeKqVbpwaZ3tBQdETriNpArC0Ads/tlo1ukjZbgXjypi2+h68mtdIpt5Dhoxd
 4UKc+KstDfPQQ==
Date: Wed, 17 Nov 2021 17:58:12 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
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
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v3 01/25] PCI: Add PCI_ERROR_RESPONSE and it's related
 definitions
Message-ID: <20211117235812.GA1786428@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f7960a4dee0e417eedd7d2e031d04ac9016c6686.1634825082.git.naveennaidu479@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_155815_060913_BCBCC514 
X-CRM114-Status: GOOD (  25.31  )
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

On Thu, Oct 21, 2021 at 08:37:26PM +0530, Naveen Naidu wrote:
> An MMIO read from a PCI device that doesn't exist or doesn't respond
> causes a PCI error.  There's no real data to return to satisfy the
> CPU read, so most hardware fabricates ~0 data.
> 
> Add a PCI_ERROR_RESPONSE definition for that and use it where
> appropriate to make these checks consistent and easier to find.
> 
> Also add helper definitions SET_PCI_ERROR_RESPONSE and
> RESPONSE_IS_PCI_ERROR to make the code more readable.
> 
> Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> ---
>  include/linux/pci.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index cd8aa6fce204..689c8277c584 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -154,6 +154,15 @@ enum pci_interrupt_pin {
>  /* The number of legacy PCI INTx interrupts */
>  #define PCI_NUM_INTX	4
>  
> +/*
> + * Reading from a device that doesn't respond typically returns ~0.  A
> + * successful read from a device may also return ~0, so you need additional
> + * information to reliably identify errors.
> + */
> +#define PCI_ERROR_RESPONSE     (~0ULL)
> +#define SET_PCI_ERROR_RESPONSE(val)    (*(val) = ((typeof(*(val))) PCI_ERROR_RESPONSE))
> +#define RESPONSE_IS_PCI_ERROR(val) ((val) == ((typeof(val)) PCI_ERROR_RESPONSE))

Beautiful!  I really like this.

I would prefer the macros to start with "PCI_", e.g.,
PCI_SET_ERROR_RESPONSE().

I think "RESPONSE_IS_PCI_ERROR()" is too strong because (as the
comment says), ~0 *may* indicate an error.  Or it may be a successful
read of a register that happens to contain ~0.

Possibilities to convey the idea that this isn't definitive:

  PCI_POSSIBLE_ERROR_RESPONSE(val)  # a little long
  PCI_LIKELY_ERROR(val)             # we really have no idea whether
  PCI_PROBABLE_ERROR(val)           #   likely or probable
  PCI_POSSIBLE_ERROR(val)           # promising?

Can you rebase to my "main" branch (v5.16-rc1), tweak the above, and
collect up the acks/reviews?

We should also browse drivers outside drivers/pci for places we could
use these.  Not necessarily as part of this series, although if
authors there object, it would be good to learn that earlier than
later.

Drivers that implement pci_error_handlers might be a fruitful place to
start.  But you've done a great job finding users of ~0 and 0xffff...
in drivers/pci/, too.

> +
>  /*
>   * pci_power_t values must match the bits in the Capabilities PME_Support
>   * and Control/Status PowerState fields in the Power Management capability.
> -- 
> 2.25.1
> 
> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
