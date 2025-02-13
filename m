Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40487C0219D
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2025 14:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Z08yf7xSn4ebRxWVhDq0V9OGTjDmF+4LyuWzts2+yN0=; b=V+ku8BZbKmE9tg
	6vwC0+xzqijdoVePaRvTnyu7UKmcP4ssfM9gKJBPk4EPAxDiYygjCRGn9vb8PbeAMF42RTkMj8skB
	i5FmW+J8jra+f6J607lE8oMrZ5WaWCsXPxa6S2h+7stZd/LRZnThpSoHUwJCdk8HkqvPpQ3l4DQVr
	E54ZIAIGk3rnz9u1lLKFparTNTzrRF573UHEORj26+LiHeau6uoZOemeEQ5R/7VkUZ5j/WfcJGDaw
	CdnmVzcfPYH/5Hz0lx2xWgshjGEyJ7F6SJGltFjKTZleEz+Y73e2x9FLFYksVfYqH2bm3S9AOMfy6
	3uf1782qsQx6JqDf+3Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiacc-0000000BQgY-1Gdc;
	Thu, 13 Feb 2025 14:55:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaO8-0000000BNmH-42nI
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Feb 2025 14:40:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 83364A42101;
	Thu, 13 Feb 2025 14:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592D4C4CED1;
	Thu, 13 Feb 2025 14:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739457623;
	bh=c2EICeY4G2Sh4ub6i//PddhAY/cHWby1P7zXvPMW3SM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=tsx9dFEjBaK+AawFbQcXoElNPU7qIwnloBmvgufjKOAwVh5LLDuVNyz5hpceHJO2T
	 3qpOWYilaa/vs/YHgU60T/29cv15HjCgIKss0ibnUz+8k3fOcrafSM3dvnfkgKViWG
	 9GU3ujspmzjIDN1rBVI8c0r/uNK7DinvsZ4js0NihiJsIYvJo4ECDOuJI0WQyq3Bv7
	 PSGws4wLn8+tG1bv7ue27JqdnpVV4JySewDSfbSErYgDXn4m3YNQlDgiEJ/3glPQ6F
	 KlVm0zFwVSoMqYMG8Kf/n4LoCv+wwAToYy5BJPmbJyF2M8AC9uqcS591VKr3+FzosD
	 BpAcj9zg4ZAWw==
Date: Thu, 13 Feb 2025 08:40:21 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	linux-pci@vger.kernel.org
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>, Jan Beulich <jbeulich@suse.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Deren Wu <Deren.Wu@mediatek.com>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Shayne Chen <Shayne.Chen@mediatek.com>,
	Sean Wang <Sean.Wang@mediatek.com>,
	Leon Yen <Leon.Yen@mediatek.com>,
	linux-mediatek@lists.infradead.org, regressions@lists.linux.dev,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] PCI: Avoid FLR for Mediatek MT7922 WiFi
Message-ID: <20250213144021.GA114126@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212193516.88741-1-helgaas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_064025_143797_BECCDA2F 
X-CRM114-Status: GOOD (  23.81  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 12, 2025 at 01:35:16PM -0600, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> The Mediatek MT7922 WiFi device advertises FLR support, but it apparently
> does not work, and all subsequent config reads return ~0:
> 
>   pci 0000:01:00.0: [14c3:0616] type 00 class 0x028000 PCIe Endpoint
>   pciback 0000:01:00.0: not ready 65535ms after FLR; giving up
> 
> After an FLR, pci_dev_wait() waits for the device to become ready.  Prior
> to d591f6804e7e ("PCI: Wait for device readiness with Configuration RRS"),
> it polls PCI_COMMAND until it is something other that PCI_POSSIBLE_ERROR
> (~0).  If it times out, pci_dev_wait() returns -ENOTTY and
> __pci_reset_function_locked() tries the next available reset method.
> Typically this is Secondary Bus Reset, which does work, so the MT7922 is
> eventually usable.
> 
> After d591f6804e7e, if Configuration Request Retry Status Software
> Visibility (RRS SV) is enabled, pci_dev_wait() polls PCI_VENDOR_ID until it
> is something other than the special 0x0001 Vendor ID that indicates a
> completion with RRS status.
> 
> When RRS SV is enabled, reads of PCI_VENDOR_ID should return either 0x0001,
> i.e., the config read was completed with RRS, or a valid Vendor ID.  On the
> MT7922, it seems that all config reads after FLR return ~0 indefinitely.
> When pci_dev_wait() reads PCI_VENDOR_ID and gets 0xffff, it assumes that's
> a valid Vendor ID and the device is now ready, so it returns with success.
> 
> After pci_dev_wait() returns success, we restore config space and continue.
> Since the MT7922 is not actually ready after the FLR, the restore fails and
> the device is unusable.
> 
> We considered changing pci_dev_wait() to continue polling if a
> PCI_VENDOR_ID read returns either 0x0001 or 0xffff.  This "works" as it did
> before d591f6804e7e, although we have to wait for the timeout and then fall
> back to SBR.  But it doesn't work for SR-IOV VFs, which *always* return
> 0xffff as the Vendor ID.
> 
> Mark Mediatek MT7922 WiFi devices to avoid the use of FLR completely.  This
> will cause fallback to another reset method, such as SBR.
> 
> Fixes: d591f6804e7e ("PCI: Wait for device readiness with Configuration RRS")
> Link: https://github.com/QubesOS/qubes-issues/issues/9689#issuecomment-2582927149
> Link: https://lore.kernel.org/r/Z4pHll_6GX7OUBzQ@mail-itl
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

Applied with Marek's tested-by to pci/for-linus for v6.14.

I also added a cc: stable tag.

> ---
>  drivers/pci/quirks.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index b84ff7bade82..82b21e34c545 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -5522,7 +5522,7 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x443, quirk_intel_qat_vf_cap);
>   * AMD Matisse USB 3.0 Host Controller 0x149c
>   * Intel 82579LM Gigabit Ethernet Controller 0x1502
>   * Intel 82579V Gigabit Ethernet Controller 0x1503
> - *
> + * Mediatek MT7922 802.11ax PCI Express Wireless Network Adapter
>   */
>  static void quirk_no_flr(struct pci_dev *dev)
>  {
> @@ -5534,6 +5534,7 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_AMD, 0x149c, quirk_no_flr);
>  DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_AMD, 0x7901, quirk_no_flr);
>  DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x1502, quirk_no_flr);
>  DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x1503, quirk_no_flr);
> +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_MEDIATEK, 0x0616, quirk_no_flr);
>  
>  /* FLR may cause the SolidRun SNET DPU (rev 0x1) to hang */
>  static void quirk_no_flr_snet(struct pci_dev *dev)
> -- 
> 2.34.1
> 

