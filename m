Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4394C606A31E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 12:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bcIO/e7E;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P7FzGBt+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lBki+4xAXmSxHooQdTNTB74XM3rdpl5Jlw/sGPjJ2bQ=; b=bcIO/e7Ezv3wgvjKmpUAjfifYF
	0gYRjo5RAbpZJMsUFtfm2Dk8jSlltJO7bvc50ytTXBymAUmrzHEV7uUtEwY9YdKjkmX0iimtzXRW9
	XNcL7Kg8gERxnpYMhL2jESow7y+ljF32SIyBIrlx7oHvO7PWv6lgctdFcore6As0gw5VJJpvh8Qro
	M5MDVxZ3MuUHOnXhvAiu/Ywix3i2AaJO7fZcjnHaWeJsJoo/oPdQbFpQVer7eONkI4BJRc/e+gUJc
	v7z9heY9M81eiWdW4MasIMJyKt4BM+A/N3Jr/mXq+PhXGdIQJMhjmhAmnjlQq60NSVdHLPvoZ9ahH
	Kuia54zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBk2-00000009lWd-3ukR;
	Wed, 25 Nov 2026 12:04:50 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBjz-00000009lVt-2fzp;
	Wed, 25 Nov 2026 12:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795608288; x=1827144288;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4cKCKbZSIGARMvx3NwbCNxA9KCH81gFlhOHiyitYp5A=;
  b=P7FzGBt+j+wAFvhnD4ktZuZYkxBhmuceLufNZnbmayU0s3SnT6lNM3AZ
   /zttPaxVmaMORm/QEqGKo04D81pvCp9m1QTj8kkqf76kOWjUj2nIpfQiK
   tuiiPzziVKgx4RCWInyTmtQeN8L1mhebmxF9wfCsiwWDi6RTJ2ulPUUfz
   MmXA4WcUtaGU0pycADu/Ky7S7Ah7T+8G73EEAD6kvp/RPXoSobOEIKgtr
   Jjl2dRppLAQg8ii0Wna5y4CQgdGkVV6gtB8ofyaxQZoas4tBDwGArCQo9
   afefW9MXXel9duy0p0k326y6glty3DzBtCiiw/NWq3tUp9162AvQAhMbF
   g==;
X-CSE-ConnectionGUID: tiq16P2YQI2ViwTrLRBd/w==
X-CSE-MsgGUID: zC8UsGbiTC+RtVBYc07Yww==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4487619"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4487619"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 04:03:31 -0800
X-CSE-ConnectionGUID: 2HWffgX6RFq12SN9EC9gjw==
X-CSE-MsgGUID: ooBJMlv+RsmSgY38fCWINA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="11719607"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 25 Nov 2026 04:03:28 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 2A23B98; Wed, 25 Nov 2026 13:03:27 +0100 (CET)
Date: Wed, 25 Nov 2026 13:03:27 +0100
From: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
To: Chunfeng Yun =?utf-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>
Cc: "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"westeri@kernel.org" <westeri@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"sven@kernel.org" <sven@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v3 1/8] thunderbolt: Prefix NHI core functions with tb_
 and tb_ring_
Message-ID: <20261125120327.GD191152@black.igk.intel.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
 <20261123113705.2297329-2-chunfeng.yun@mediatek.com>
 <20261124161159.GT229695@black.igk.intel.com>
 <1aa3fa77b7e96509db6779bbb0cc74ce7c9a4ffb.camel@mediatek.com>
 <20261125071300.GA191152@black.igk.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261125071300.GA191152@black.igk.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_040447_990337_E1A91323 
X-CRM114-Status: GOOD (  28.34  )
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 08:13:00AM +0100, mika.westerberg@linux.intel.com wrote:
> On Wed, Nov 25, 2026 at 06:43:38AM +0000, Chunfeng Yun (云春峰) wrote:
> > On 二, 2026-11-24 at 17:11 +0100, Mika Westerberg wrote:
> > > On Mon, Nov 23, 2026 at 07:36:48PM +0800, Chunfeng Yun wrote:
> > > > In preparation for modularizing PCIe NHI support and allowing PCIe
> > > > and platform NHI drivers to be built as separate modules atop the
> > > > Thunderbolt core framework, several NHI functions and structures
> > > > will
> > > > need to be exported.
> > > > 
> > > > Currently, several of these functions lack standard subsystem
> > > > prefixes,
> > > > risking namespace pollution or collisions across the flat kernel
> > > > symbol
> > > > namespace:
> > > > 
> > > > - ring_msix() lacks any subsystem prefix and diverges from all
> > > > other
> > > >   exported ring functions in the driver, which use the "tb_ring_"
> > > > prefix.
> > > > - nhi_probe(), nhi_shutdown(), and nhi_pm_ops lack the standard
> > > > "tb_"
> > > >   prefix used across the Thunderbolt public interface (such as
> > > > struct
> > > >   tb_nhi and struct tb_nhi_ops).
> > > > - nhi_msi() is named after PCI MSI, even though the ISR simply
> > > > schedules
> > > >   the interrupt work and can serve as a generic ISR for non-PCIe
> > > > platform
> > > >   controllers as well.
> > > > 
> > > > Rename these functions and symbols to conform to Thunderbolt
> > > > subsystem
> > > > naming conventions before exporting them:
> > > > 
> > > > - ring_msix       -> tb_ring_msix
> > > 
> > > I think we can move MSI-X completely to pci.c. As far as I can tell
> > > ARM
> > > stuff is not going to need that. While there we can drop MSI, that
> > > has been
> > > never used (MSI-X was supported from day 0 by the HW).
> > If move MSI-X completely to pci.c, then will rename and export another
> > two functions:
> > __ring_interrupt()
> > ring_interrupt_index()
> > 
> > is it fine for you?
> 
> No that's even worse :( But I was thinking that we can do the same for MSIX
> as for regular interrupt in nhi.c:
> 
>   nhi->irq set -> request_irq() for that
>   ring->irq set -> request_irq() for that
> 
> This would hopefully limit the number of functions we need to export. Maybe
> it allows us to get rid of the .request_ring_irq and the like in the
> tb_nhi_ops?

I realized we cannot do this for MSIX because we allocate them on-demand so
the callbacks need to stay. However, we can avoid exporting ring_msix if we
make ->ring_request_msix() return the interrupt number.

