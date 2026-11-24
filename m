Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15F8606A321
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 16:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b8feJrOB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=UEm0aSJR;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jMB28q3R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vQ6vW3sYbcgyOH9bAhfE5XUba6QBbadxNG/psr8B7AQ=; b=b8feJrOB9hxpAYRAvnvSkNgsIp
	YlQchXs69k7hM5J1omary2Ok2nKplF+mFQipCqdMwlDFKBauFGsdpB0EE2B7ZpGet7DulmTzW7lPG
	fvyvBU6XYdRmFk0esI6hFzHxhH9eXZqnIg+6VpW+eHe0L9k2quAfgos6VUdN5bm5F1/QgrAsm1C/r
	sG2FmeWcyI4pV5q5kJ3e4bFoJrvfP7AqLWkYhrsO5Zui8FQFhUw6mv2wX6/fcU/DCijyiud8o2rir
	pA7YoSCiV4tqlR7b6Ta4d4Zb+puFqtMriYKyRcY0bUYraU4lY+rCCPJp3jlGMpUOUPZovh0ar7RxE
	1oqBNmqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVt88-000000074VG-1Rcx;
	Tue, 24 Nov 2026 16:12:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVt83-000000074TM-2cps;
	Tue, 24 Nov 2026 16:12:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vQ6vW3sYbcgyOH9bAhfE5XUba6QBbadxNG/psr8B7AQ=; b=UEm0aSJRaJt+LCz28ezmXuPX7B
	+Pt/c8nMJNSmZkaeIbFAi7UXfNILf4z+A8f290IxKxXWl5XXnxBnkoUybeZRKhESPV3h3fv6PSmtp
	XlQ5vNu8pfaw73pM5Nk/ThmPR0BdFuVCiS/131E7TT3b8Pkc0uY8AslN3nu+lOhuzRbjVNQF20KcL
	WXkYjAffYQ0Eae1u+ap4yMTz0ZQYZeJovNRohyrjnlAuEHSCJhISIuggV5ik/wcCkRoB2cSUqBuz2
	TlAwkqh6P1M2T0qWWmHMTVwOSgwB1GzaS7xaVLKK8EkDBUZHJvcBXKlI3zmh5jDAoZg82PKABiK92
	hll6ID4Q==;
Received: from mgamail.intel.com ([192.198.163.14])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVt7q-00000004K8w-3cHi;
	Tue, 24 Nov 2026 16:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795536731; x=1827072731;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8jNXelQh+v0UQsg1z1NZYZFU+UF9jDOrLrEkTGht43Q=;
  b=jMB28q3Rqb3QGr0LEnnxh3RGwkOVpXH7czujAdRzmAJo4ltBijv5qqaq
   tWOeAYae5fPRD0LY7D0i13qVqwIZkCZiDUCiyznlgkSJOge7eDn/AS5R8
   S61P0nKbxUu3Wpz6LhsZpU+rkSKQR4syqgJPP/KV7UbGoSGhC09BIxvqf
   Vw6DOrxRhKJcvzRJjZiee8diBkiUeyN5gu95WXkRTDOjexGn1NLoik7gj
   OJES0vq55pYLuEp/az5oLshQE+gqNvH4mmn6CYoifgPJJOzLsbAQcWH5i
   ee2MZ15kJ6NGfcLKoUUDJXLuvyC/tEykNI2Blnvn/tUnj3KmBpc+lCTjx
   w==;
X-CSE-ConnectionGUID: FXhI4XvSQxmbpv14XAJaWg==
X-CSE-MsgGUID: D4NIvkvPSluOaH0BVYDbwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4295124"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4295124"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 08:12:04 -0800
X-CSE-ConnectionGUID: FH2dgkoDSi+u1P9aQStNLg==
X-CSE-MsgGUID: PVd8xENCQ86iO+qjC6OoJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11946919"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 24 Nov 2026 08:12:01 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0321C94; Tue, 24 Nov 2026 17:12:00 +0100 (CET)
Date: Tue, 24 Nov 2026 17:11:59 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Sven Peter <sven@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/8] thunderbolt: Prefix NHI core functions with tb_
 and tb_ring_
Message-ID: <20261124161159.GT229695@black.igk.intel.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
 <20261123113705.2297329-2-chunfeng.yun@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261123113705.2297329-2-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_161216_999336_46B222B1 
X-CRM114-Status: GOOD (  18.57  )
X-Spam-Score: -2.3 (--)
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

On Mon, Nov 23, 2026 at 07:36:48PM +0800, Chunfeng Yun wrote:
> In preparation for modularizing PCIe NHI support and allowing PCIe
> and platform NHI drivers to be built as separate modules atop the
> Thunderbolt core framework, several NHI functions and structures will
> need to be exported.
> 
> Currently, several of these functions lack standard subsystem prefixes,
> risking namespace pollution or collisions across the flat kernel symbol
> namespace:
> 
> - ring_msix() lacks any subsystem prefix and diverges from all other
>   exported ring functions in the driver, which use the "tb_ring_" prefix.
> - nhi_probe(), nhi_shutdown(), and nhi_pm_ops lack the standard "tb_"
>   prefix used across the Thunderbolt public interface (such as struct
>   tb_nhi and struct tb_nhi_ops).
> - nhi_msi() is named after PCI MSI, even though the ISR simply schedules
>   the interrupt work and can serve as a generic ISR for non-PCIe platform
>   controllers as well.
> 
> Rename these functions and symbols to conform to Thunderbolt subsystem
> naming conventions before exporting them:
> 
> - ring_msix       -> tb_ring_msix

I think we can move MSI-X completely to pci.c. As far as I can tell ARM
stuff is not going to need that. While there we can drop MSI, that has been
never used (MSI-X was supported from day 0 by the HW).

Then I would just make the glue driver to pass ->irq to the core driver and
if that's set it does the request_irq() and so on. And PCI side does not
fill that because it uses MSIX always. Then we don't need to export the
interrupt handler functions either.

> - nhi_msi         -> tb_nhi_isr


> - nhi_probe       -> tb_nhi_probe
> - nhi_shutdown    -> tb_nhi_shutdown
> - nhi_pm_ops      -> tb_nhi_pm_ops

These are good.

