Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD71606A894
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 10:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PGBASoVE;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eBKokC8Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lxPVBhcy06dXvZmyYLom70AEmMv9TuOdMz9vd3zbC7g=; b=PGBASoVEpus+FoBrE7SCi7TxB7
	P9o2XPiYTQPWROw4GnsQBk78ZD4JzUu+aKTQjuBDBpF8o4HQ7pgbmIB35mH/AsILNlUtGv4FoAJ4Y
	M5/JyFhoHpjrQ+wHJB+0vHvvNIh1zBeXilA10mtpQ6emqBBiP2PYGAR3/fhVIanWy+6Sxl6WTaGvh
	SGMKFhBHWhzWB2UiaknsLZIbm5fLWppsTtTJFrCMKbEZBO18OUq3t3tKO4f6PPWTCC8R4KgjQdtAI
	/g8nJi4ClhYGB9DIQnXRqhW5ESScbH9e9h7aOe8//hJuRJm9z0FySiSt8qsP3ILc6TfWmYgMxM1Mc
	yi7Gxebg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRzl-00000009WCv-2y1t;
	Thu, 12 Nov 2026 10:25:29 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRzj-00000009WCS-11dm
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 10:25:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794479127; x=1826015127;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2p/RyeiAyLTxYQvMmItUdpk9jwAXyRCO4NDKMIJUjzk=;
  b=eBKokC8Yai7hobsEON8sanWVO8psRnczF7JGcyklkAP1K1GmSUI2M/7K
   vVmiwvjCknbaNTDlBzslIlMg3Ry2VF14mfAv6B9UK7Ok5hPMyYPxQwwzB
   5XgcIZvj+Yzrpb6ZFhKlVIGKIcdbI2mTwqSYsAlTnBzpOvLru1Yg7oNLW
   DolVRFTbHos0pAI7PidiszdtE7EDUaOi+EaxdMA2PBEJpk5tzGQ7lNrYb
   lUnZi5EM1T0cAyZ9nr9eDdL4TKDupzlAwaTeRanOdD+tT10sV7w63XTxc
   0tEA/wMU3DigsZLVcT6UcUCM7hFeIb7pNqacNFcUVOS3xQSrfYtb+4NDD
   w==;
X-CSE-ConnectionGUID: l0rXKVNRRtas5Hspvv8tVw==
X-CSE-MsgGUID: hJXpJQe4R5iW0ySFZvyknQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3160835"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3160835"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 02:25:27 -0800
X-CSE-ConnectionGUID: qCkVLhX8S0exzL3CKAvgRw==
X-CSE-MsgGUID: SPIvEvuxSMyYa6gVmNCZFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="10352881"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.68])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 02:25:22 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 12 Nov 2026 12:25:19 +0200 (EET)
To: Hans Zhang <18255117159@163.com>
cc: bhelgaas@google.com, mani@kernel.org, lpieralisi@kernel.org, 
    kwilczynski@kernel.org, thierry.reding@kernel.org, ryder.lee@mediatek.com, 
    jonathanh@nvidia.com, robh@kernel.org, linux-pci@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org, 
    linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 1/5] PCI: Use pcie_get_link_speed() in pci.c
In-Reply-To: <20261112022405.1230200-2-18255117159@163.com>
Message-ID: <0c4e7529-c658-f841-8967-d32252e83dc5@linux.intel.com>
References: <20261112022405.1230200-1-18255117159@163.com> <20261112022405.1230200-2-18255117159@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-844207116-1794479119=:1181"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_022527_874797_F9707EA9 
X-CRM114-Status: GOOD (  13.55  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-844207116-1794479119=:1181
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 12 Nov 2026, Hans Zhang wrote:

> Replace the to_pcie_link_speed() wrapper with pcie_get_link_speed() in
> pcie_link_bandwidth_mbps() and pcie_bandwidth_available(), and remove
> the now-unused wrapper.  pcie_get_link_speed() performs the same lookup

now unused

I suppose Bjorn can take care of that while applying so no need to send=20
another version because of this alone.

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

> with bounds checking and is already exported.
>=20
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>  drivers/pci/pci.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 7c6f2aba8144..594ee7aa4cad 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -6025,11 +6025,6 @@ int pcie_set_mps(struct pci_dev *dev, int mps)
>  }
>  EXPORT_SYMBOL(pcie_set_mps);
> =20
> -static enum pci_bus_speed to_pcie_link_speed(u16 lnksta)
> -{
> -=09return pcie_link_speed[FIELD_GET(PCI_EXP_LNKSTA_CLS, lnksta)];
> -}
> -
>  /**
>   * pcie_link_bandwidth_mbps - get the current bandwidth of a single PCIe=
 link
>   * @pdev: PCI device to query
> @@ -6041,14 +6036,15 @@ static enum pci_bus_speed to_pcie_link_speed(u16 =
lnksta)
>   */
>  int pcie_link_bandwidth_mbps(struct pci_dev *pdev)
>  {
> -=09u16 lnksta;
> +=09u16 lnksta, lnksta_cls;
>  =09int speed, err;
> =20
>  =09err =3D pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnksta);
>  =09if (err)
>  =09=09return pcibios_err_to_errno(err);
> =20
> -=09speed =3D pcie_dev_speed_mbps(to_pcie_link_speed(lnksta));
> +=09lnksta_cls =3D FIELD_GET(PCI_EXP_LNKSTA_CLS, lnksta);
> +=09speed =3D pcie_dev_speed_mbps(pcie_get_link_speed(lnksta_cls));
>  =09if (speed < 0)
>  =09=09return speed;
> =20
> @@ -6074,7 +6070,7 @@ u32 pcie_bandwidth_available(struct pci_dev *dev, s=
truct pci_dev **limiting_dev,
>  =09=09=09     enum pci_bus_speed *speed,
>  =09=09=09     enum pcie_link_width *width)
>  {
> -=09u16 lnksta;
> +=09u16 lnksta, lnksta_cls;
>  =09enum pci_bus_speed next_speed;
>  =09enum pcie_link_width next_width;
>  =09u32 bw, next_bw;
> @@ -6089,7 +6085,8 @@ u32 pcie_bandwidth_available(struct pci_dev *dev, s=
truct pci_dev **limiting_dev,
>  =09while (dev) {
>  =09=09pcie_capability_read_word(dev, PCI_EXP_LNKSTA, &lnksta);
> =20
> -=09=09next_speed =3D to_pcie_link_speed(lnksta);
> +=09=09lnksta_cls =3D FIELD_GET(PCI_EXP_LNKSTA_CLS, lnksta);
> +=09=09next_speed =3D pcie_get_link_speed(lnksta_cls);
>  =09=09next_width =3D FIELD_GET(PCI_EXP_LNKSTA_NLW, lnksta);
> =20
>  =09=09next_bw =3D next_width * PCIE_SPEED2MBS_ENC(next_speed);
>=20
--8323328-844207116-1794479119=:1181--

