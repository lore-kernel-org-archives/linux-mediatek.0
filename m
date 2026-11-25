Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BE5606A331
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 07:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GNIs/8aE;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RgcHg4zM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zYavSeCQUXeOqjBEOsWlCt1Ej1YB9Ghr9MX6vU9qkiQ=; b=GNIs/8aElt2vqMnmK5lLVaLYoK
	fbwaO2YI5yJ1fksyLwiQoj2zA8AK5gXL66FmAuvV8lcNj83yU/uXrTV/6MNMzWq6rW4MMo7aW5CAg
	wByPb//uTos6CHkenVJl2+QCFJ2PJiqG0pzQ7LV4+r3aLAl0UJ8ZLaCOYINAphZLns8UMycpepOUI
	ELrc1l/WJqRDUape2QVZZGhlquYU/jRR+xVKXP3cXlJqoKWQzFni5HZuKj+aV40kKCyDWz8ToO8nz
	zAEAmixnI4DHVytu6Sicls9qtS7QhUvoTSv3AIYsLWD/muG2IlWqZRSzRyzHkwuxr0NZ056IdIGa5
	eJ9Vqr0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7Bk-00000008pK8-1iaP;
	Wed, 25 Nov 2026 07:13:08 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7Bh-00000008pJe-2a99;
	Wed, 25 Nov 2026 07:13:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795590786; x=1827126786;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pUhfN28L2ucTd2H9ex1vTDJcXUGENUHQlpfC4H2Jf44=;
  b=RgcHg4zMeTLy1RlM7GNylKq8QUAJ4NFiLyU+22bnas9Wp8l84VQ4OT0c
   Hz5fT1EmlINp8W8BcStBXSr1d7VRpoHGEgnIhLCn2Jya1EBKYryPTvc5N
   WA4aJf+73OZiBS5SylsZia3C/e4whlgmxAH35idixs2MOHR0jDEnba8za
   /gEATTgwDt9x1XrFIMflIvCWEVkZECD2Kat87fSaryHaPfjNy2WEAhM3T
   g5pR0w7bpeIRobIZMizuHhh4PazXeOu69grW46Y/+5PAMA/pOemq9UBqL
   IWGfz0tPjGJnDwjS3VwjUam5XTUw69jhHKeY7ckrJzPqG7hRzP20PwOtD
   g==;
X-CSE-ConnectionGUID: Vzq86fWjQ52bSRM+t6hP1A==
X-CSE-MsgGUID: peNF+4XFQbyET8imyjj4QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4458212"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4458212"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 23:13:05 -0800
X-CSE-ConnectionGUID: duVJl/mtSk2ytQA8dKATPg==
X-CSE-MsgGUID: wwLwyDTZSaugKnl7BNHW/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="11776715"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 24 Nov 2026 23:13:01 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 6C07E98; Wed, 25 Nov 2026 08:13:00 +0100 (CET)
Date: Wed, 25 Nov 2026 08:13:00 +0100
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
Message-ID: <20261125071300.GA191152@black.igk.intel.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
 <20261123113705.2297329-2-chunfeng.yun@mediatek.com>
 <20261124161159.GT229695@black.igk.intel.com>
 <1aa3fa77b7e96509db6779bbb0cc74ce7c9a4ffb.camel@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1aa3fa77b7e96509db6779bbb0cc74ce7c9a4ffb.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_231305_724312_276E5800 
X-CRM114-Status: GOOD (  24.49  )
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

On Wed, Nov 25, 2026 at 06:43:38AM +0000, Chunfeng Yun (云春峰) wrote:
> On 二, 2026-11-24 at 17:11 +0100, Mika Westerberg wrote:
> > On Mon, Nov 23, 2026 at 07:36:48PM +0800, Chunfeng Yun wrote:
> > > In preparation for modularizing PCIe NHI support and allowing PCIe
> > > and platform NHI drivers to be built as separate modules atop the
> > > Thunderbolt core framework, several NHI functions and structures
> > > will
> > > need to be exported.
> > > 
> > > Currently, several of these functions lack standard subsystem
> > > prefixes,
> > > risking namespace pollution or collisions across the flat kernel
> > > symbol
> > > namespace:
> > > 
> > > - ring_msix() lacks any subsystem prefix and diverges from all
> > > other
> > >   exported ring functions in the driver, which use the "tb_ring_"
> > > prefix.
> > > - nhi_probe(), nhi_shutdown(), and nhi_pm_ops lack the standard
> > > "tb_"
> > >   prefix used across the Thunderbolt public interface (such as
> > > struct
> > >   tb_nhi and struct tb_nhi_ops).
> > > - nhi_msi() is named after PCI MSI, even though the ISR simply
> > > schedules
> > >   the interrupt work and can serve as a generic ISR for non-PCIe
> > > platform
> > >   controllers as well.
> > > 
> > > Rename these functions and symbols to conform to Thunderbolt
> > > subsystem
> > > naming conventions before exporting them:
> > > 
> > > - ring_msix       -> tb_ring_msix
> > 
> > I think we can move MSI-X completely to pci.c. As far as I can tell
> > ARM
> > stuff is not going to need that. While there we can drop MSI, that
> > has been
> > never used (MSI-X was supported from day 0 by the HW).
> If move MSI-X completely to pci.c, then will rename and export another
> two functions:
> __ring_interrupt()
> ring_interrupt_index()
> 
> is it fine for you?

No that's even worse :( But I was thinking that we can do the same for MSIX
as for regular interrupt in nhi.c:

  nhi->irq set -> request_irq() for that
  ring->irq set -> request_irq() for that

This would hopefully limit the number of functions we need to export. Maybe
it allows us to get rid of the .request_ring_irq and the like in the
tb_nhi_ops?

