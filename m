Return-Path: <SRS0=vtlS=EI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1601EC00A89
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 14:28:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EFEE206F8
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 14:27:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ioBStDy/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="TA22Kf8S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EFEE206F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d0UiFck2noHaLb6WnFGpS/0OgELHQtSVBZqGeqX7D38=; b=ioBStDy/a6NT1ayaAQrMd0yBy
	nXPLrcvxUXR2oaXDaZHEIN/2vxC/MdgX0906R5xHMr9n5L7t1gsggBLz311BEs0EwHyJS4yC/vOe6
	+8sUoKLrHR693pd6uc5g1rHK5iwy3Cf9/ISesT5bKq711XAOn0nFKlNKgaPUR3tLlQflMkTf5VhAz
	wzYFlK0tDR5/b5fjxBOunOUdrmOLuXTM5Hva/wkG4RZlhfaM78A4UFT8l3GoCH1BkDqow7um8pbp3
	k7kfAJUkpesQDcmTyVAhJCKcWwjnIbrz1IJUeixN2/nn76t4z2Px/nadIW/LjeQ62WhrrKxZRPOVv
	G260iaR9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZaoI-00033v-JT; Mon, 02 Nov 2020 14:27:50 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZaoF-00031k-0B
 for linux-mediatek@lists.infradead.org; Mon, 02 Nov 2020 14:27:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1604327244;
 bh=AcU6jbrx1riv+Wdlt3eWYyaQWzNIBJIHnijeALTKPwg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=TA22Kf8Su+5fPlV+NmRLldPyD0XDaR8d0CkbARd/ntxyoKf+nuM8PhCBWVQccUFL6
 ytCU01NVMarR30I5FrpzMc0YIxAkFGuL/I9l+QeK45S2vcpaIUx49mFQ1PaStwiUfU
 bfJOy3XeyFqyiaw64i0/bCI9XhEBt3GMphYRu5Dc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.76.97.212] ([185.76.97.212]) by web-mail.gmx.net
 (3c-app-gmx-bap57.server.lan [172.19.172.127]) (via HTTP); Mon, 2 Nov 2020
 15:27:23 +0100
MIME-Version: 1.0
Message-ID: <trinity-769ccf2c-6962-4e27-8a78-619cd16fab25-1604327243865@3c-app-gmx-bap57>
From: Frank Wunderlich <frank-w@public-files.de>
To: Marc Zyngier <maz@kernel.org>
Subject: Aw: Re:  Re:  Re: [PATCH] pci: mediatek: fix warning in msi.h
Date: Mon, 2 Nov 2020 15:27:23 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <336d6588567949029c52ecfbb87660c1@kernel.org>
References: <20201031140330.83768-1-linux@fw-web.de>
 <878sbm9icl.fsf@nanos.tec.linutronix.de>
 <EC02022C-64CF-4F4B-A0A2-215A0A49E826@public-files.de>
 <87lfflti8q.wl-maz@kernel.org> <1604253261.22363.0.camel@mtkswgap22>
 <trinity-9eb2a213-f877-4af3-87df-f76a9c093073-1604255233122@3c-app-gmx-bap08>
 <87k0v4u4uq.wl-maz@kernel.org> <87pn4w90hm.fsf@nanos.tec.linutronix.de>
 <df5565a2f1e821041c7c531ad52a3344@kernel.org>
 <trinity-4313623b-1adf-4cc3-8b50-2d0593669995-1604318207058@3c-app-gmx-bap57>
 <336d6588567949029c52ecfbb87660c1@kernel.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:yby5m6QFQy2Reuk7SqSaUU1Eu/PTwr1ZUMBtAMxlDwxvkbPolpmCM+cXzUiu8lzFk6TcY
 VFSSJGXqKyPUGl8Dvr519WpTTtnT+x96enLFcyvMgi1yDXqTcnXnE9e/O8p2NKZA475lS7P/wkGP
 IktsqpRoisIw2h8RIbfCWBceIKpt0QwpHqRiiiA0qld/PxLkY7YnD2Xobm6rhK3BBzCNhpbV9s75
 Y8emVf2EmfxQimQmXLVM7a/v+NH0z4LChYnLtqkSEVfOkbnzCAHlJLtIu8/+JxryRkHG7VUX3VzJ
 q0=
X-UI-Out-Filterresults: notjunk:1;V03:K0:jzhFKPbKFHY=:BO8Lhdoqk5kdjdCQ+5k5o4
 Pl0A+jnhBAluOiuqmz4W9n0Er09cRvKrCbWqZESIOeZ9YuogllZ4uEfvtwSw5b8GWubmTBSNk
 9VGsRgIx1uZKcVI3veiiDCjrO+azUfx3gbHZ22lzYeWqVZ6efJoFxhtrJMECSfaYJ4JBg8cR+
 agwFjakbG6pSoYOswIiXuk82rMcvzUWy0f9Z28RFOdn/+Tm3tvccgOG32Lkaf+inGrQer2Tmf
 JQ1dkfnMUADKc1pWIZyj7HooqeHorxG48kZ7VjGrMuEzrdChSyo8eEQZkJywASNJZsxw/No8U
 I8isKlNAi4wiEJzsbyRrvHZMlYnPz6Gr4bxsyqXI9B8BTISQMW1odi3ZitfX6rW0xKVHkLm58
 zjhAkJy9RK35E16eKXHsobRLzextP1MBU07v+nqknHQvSMkvmJls0ya2rrlo5H+ZhH3MIxZGC
 VL/tp7IVd6dXiIPKQge8UIUdiIvLUOj74p2+fvpyKkSAEPDbKg8nGWlr/eEAp8eKDBw35q5sS
 8wo7AvD0BNarVAMnv0BF/G0jI4ho7BEWcklvK5eT+WEkQVWZ9Y2AgNJy1utLUexaRUOKWBPfZ
 vj8g8anfj3C00=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_092747_301163_EAF9CAE0 
X-CRM114-Status: GOOD (  19.17  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Frank Wunderlich <linux@fw-web.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Gesendet: Montag, 02. November 2020 um 14:58 Uhr
> Von: "Marc Zyngier" <maz@kernel.org>

> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index d15c881e2e7e..5bb1306162c7 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -387,10 +387,20 @@ static ssize_t msi_bus_store(struct device *dev,
> struct device_attribute *attr,
>   		return count;
>   	}
>
> -	if (val)
> +	if (val) {
> +		/*
> +		 * If there is no possibility for this bus to deal with
> +		 * MSIs, then allowing them to be requested would lead to
> +		 * the kernel complaining loudly. In this situation, don't
> +		 * let userspace mess things up.
> +		 */
> +		if (!pci_bus_is_msi_capable(subordinate))
> +			return -EINVAL;
> +
>   		subordinate->bus_flags &= ~PCI_BUS_FLAGS_NO_MSI;
> -	else
> +	} else {
>   		subordinate->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
> +	}
>
>   	dev_info(&subordinate->dev, "MSI/MSI-X %s for future drivers of
> devices on this bus\n",
>   		 val ? "allowed" : "disallowed");
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 4289030b0fff..28861cc6435a 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -871,6 +871,8 @@ static void pci_set_bus_msi_domain(struct pci_bus
> *bus)
>   		d = pci_host_bridge_msi_domain(b);
>
>   	dev_set_msi_domain(&bus->dev, d);
> +	if (!pci_bus_is_msi_capable(bus))
> +		bus->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
>   }
>
>   static int pci_register_host_bridge(struct pci_host_bridge *bridge)
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 22207a79762c..6aadb863dff4 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -2333,6 +2333,12 @@ pci_host_bridge_acpi_msi_domain(struct pci_bus
> *bus) { return NULL; }
>   static inline bool pci_pr3_present(struct pci_dev *pdev) { return
> false; }
>   #endif
>
> +static inline bool pci_bus_is_msi_capable(struct pci_bus *bus)
> +{
> +	return (IS_ENABLED(CONFIG_PCI_MSI_ARCH_FALLBACKS) ||
> +		dev_get_msi_domain(&bus->dev));
> +}
> +
>   #ifdef CONFIG_EEH
>   static inline struct eeh_dev *pci_dev_to_eeh_dev(struct pci_dev *pdev)
>   {

Hi,

this Patch seems to work well too...no warning, pcie-card and hdd recognized

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
