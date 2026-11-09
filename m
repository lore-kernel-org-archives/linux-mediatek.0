Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892E6606A326
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 12:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W8Zr68ni;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nlX/lCT3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Pz9Hpm8j1u82FYaXh8nr33sjNtVErXhzD75hDRVTwoY=; b=W8Zr68ni8lrkIQKngIzkiHS2fy
	tgZywnAMphZ3Nm8OwoZO9O3/GmToQiQvKV85wNVGnDVKauCzPcfYNyX7cDzXgJCYCHccFKBqWsJOx
	xZzGU3x7bd+w7yJYVS6jPSqUpgfjGsNu0aPskuNX6tDb77ACHBVkG3GELJN5H/Sq5QAXrDOOVKibX
	K13qxMqa7IXsYSDCIsK6v1XtkiZYbAQSyaAT3JfHumRsPl4g85GJhfbEDlnAjW7GJB+MTOnJ9pzU/
	yiFmYTzv7haAz2uID8qzhi+A11Sdbo6jjqle1hml8i/e/y3KDswtROdrqLoBGLuMPLWG9epXXIe7N
	m3BbmWgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQO5j-00000000bmo-16F6;
	Mon, 09 Nov 2026 12:03:15 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQO5h-00000000blV-0wDe
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Nov 2026 12:03:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794225793; x=1825761793;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=sYbfKgh8lkl7yxvDpMidYJPRN6EgAMxRg2ax/bIvwq8=;
  b=nlX/lCT3G8XZnDZJKH91ZuhOjs3A9z7MXyzw/0vuVOePY2EOVUlupE8y
   wKel9erEWxsaT+86jU5hUnE+/xdZemp1h6YDuWFvzyadWpQVv78E4Mida
   HLEcLFM6hfD09Ph8LnZyEUk/zxpU8hzhq8+3H6r8hszwox+uZzwx655dv
   wsT8CbEdjh3ZMoSzh36rzh0vgQKBYfR6pwJcmJ75SuKtlEbv/Z9Yfrk2f
   wt2W99TqoMvydk1v303pNAuw1GkrbaDhweGsGxLcSlaWYOGVH25sJPznA
   NerK4ufY9c3sIo+E7uB/ntizd+NVh/cPHRCh89SNkbaO2LBc1cBn1TIg4
   A==;
X-CSE-ConnectionGUID: Z1lNVbhDQ1mRpUosDyUBkg==
X-CSE-MsgGUID: VVCyvtb7SMmzZb4XGZjWjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="3047383"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="3047383"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 04:03:12 -0800
X-CSE-ConnectionGUID: xYJiNJYtRwe4WKF5bJna/Q==
X-CSE-MsgGUID: pa3sT1BRSxiuFmlUIbzTqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="9707620"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.139])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 04:03:06 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 9 Nov 2026 14:03:02 +0200 (EET)
To: Hans Zhang <18255117159@163.com>
cc: bhelgaas@google.com, mani@kernel.org, lpieralisi@kernel.org, 
    kwilczynski@kernel.org, thierry.reding@kernel.org, ryder.lee@mediatek.com, 
    jonathanh@nvidia.com, robh@kernel.org, linux-pci@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org, 
    linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 1/5] PCI: Use pcie_get_link_speed() in pci.c
In-Reply-To: <20261108094034.679945-2-18255117159@163.com>
Message-ID: <43198b7a-b0f7-49e4-731a-807e7d9e5959@linux.intel.com>
References: <20261108094034.679945-1-18255117159@163.com> <20261108094034.679945-2-18255117159@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_040313_277500_E3FBFDC9 
X-CRM114-Status: GOOD (  13.79  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 8 Nov 2026, Hans Zhang wrote:

> Replace the to_pcie_link_speed() wrapper with pcie_get_link_speed() in
> pcie_link_bandwidth_mbps() and pcie_bandwidth_available(), and remove
> the now-unused wrapper.  pcie_get_link_speed() performs the same lookup
> with bounds checking and is already exported.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>  drivers/pci/pci.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 7c6f2aba8144..92ede1768caf 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -6025,11 +6025,6 @@ int pcie_set_mps(struct pci_dev *dev, int mps)
>  }
>  EXPORT_SYMBOL(pcie_set_mps);
>  
> -static enum pci_bus_speed to_pcie_link_speed(u16 lnksta)
> -{
> -	return pcie_link_speed[FIELD_GET(PCI_EXP_LNKSTA_CLS, lnksta)];
> -}
> -
>  /**
>   * pcie_link_bandwidth_mbps - get the current bandwidth of a single PCIe link
>   * @pdev: PCI device to query
> @@ -6048,7 +6043,7 @@ int pcie_link_bandwidth_mbps(struct pci_dev *pdev)
>  	if (err)
>  		return pcibios_err_to_errno(err);
>  
> -	speed = pcie_dev_speed_mbps(to_pcie_link_speed(lnksta));
> +	speed = pcie_dev_speed_mbps(pcie_get_link_speed(FIELD_GET(PCI_EXP_LNKSTA_CLS, lnksta)));

Readability seems worse due to cramming everything into a single 
statement.

>  	if (speed < 0)
>  		return speed;
>  
> @@ -6089,7 +6084,7 @@ u32 pcie_bandwidth_available(struct pci_dev *dev, struct pci_dev **limiting_dev,
>  	while (dev) {
>  		pcie_capability_read_word(dev, PCI_EXP_LNKSTA, &lnksta);
>  
> -		next_speed = to_pcie_link_speed(lnksta);
> +		next_speed = pcie_get_link_speed(FIELD_GET(PCI_EXP_LNKSTA_CLS, lnksta));
>  		next_width = FIELD_GET(PCI_EXP_LNKSTA_NLW, lnksta);
>  
>  		next_bw = next_width * PCIE_SPEED2MBS_ENC(next_speed);
> 

-- 
 i.


