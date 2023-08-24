Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D13C6FA8F
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Aug 2023 22:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=KgegSaM2X7+F9e7biE3IGcSPne5a08FbekBjZF8pU6E=; b=w9wDqs+ilFHVAX
	Ljin0DGlOvilp94GPasRuzr8wZvLz/XmT+OSbitWaNpIRkx54VBpJMBmyALGnVZ4qNSKz6DYKLJxX
	y8pWRPVF/jp4Xyua+3uMH/12tblZaSRCEh2W+VelM1BBENaZqFx/18hudZ8LdjwJBRDQoMLBvm872
	8g6xMxO/i1JZ00wUwUio+U5H63vlo6guVZcPH5C/tUEleqU1yVgmS95Vyiz5xt9EXba7lYYifhNZf
	zFz6/ykOs1GbVbY6fX7updMyFqfy1Gbd3ET7epQvax01U51KC7yNaq6QCpxssFCx9HyM8qOrhDvcA
	VRqhHAM9qgt3KWr2gb/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZIca-003ud2-1m;
	Thu, 24 Aug 2023 22:16:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZIcX-003uc6-2z
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Aug 2023 22:16:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A97966276C;
	Thu, 24 Aug 2023 22:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDAC2C433C8;
	Thu, 24 Aug 2023 22:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692915363;
	bh=p/moKQjZMNODvvy2GHX9hSPQkLTq66Zh2rENIHnBAUk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=NRhbiPj0YA4I0UrGSAiCeV0JIBTGlxv942sx9EVGCkjQ3HIf95PjUrVcftjIcGOTv
	 5bXqZphv31KIL6tNyTuBAm4Lsc05qYFIDOvJ/+kEZVthuqZv4w+qdnnQaQ/z0yz1ti
	 PIdqKQcNjybbdGv1fwNzs/pvL3XkbaFYc7EdT+E5a5uT9Oh1zkuVONeXu2lLI7OQ1a
	 uiBziLiAzhTxoAJfvlmK38DU/hnwuKqAZ0/jrf7D1WeHVlKurngqgFxyAjiVrtNznV
	 +8RS8b4aJXeGE9UM0Axg2ljRbHh/LT7KjOqd6C1kc1gHLlWKUj+fsBme2BVtM6FXwa
	 Ma+MxUY1VEJYw==
Date: Thu, 24 Aug 2023 17:16:01 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ingo Rohloff <lundril@gmx.de>
Cc: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>,
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH] wifi: mt76: mt7921e: Support MT7992 IP in Xiaomi
 Redmibook 15 Pro (2023)
Message-ID: <20230824221601.GA604994@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824135232.5000-1-lundril@gmx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_151606_024356_9CA32875 
X-CRM114-Status: GOOD (  14.11  )
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

On Thu, Aug 24, 2023 at 03:52:32PM +0200, Ingo Rohloff wrote:
> In the Xiaomi Redmibook 15 Pro (2023) laptop I have got, a wifi chip is
> used, which according to its PCI Vendor ID is from "ITTIM Technology".
> 
> This chip works flawlessly with the mt7921e module.  The driver doesn't
> bind to this PCI device, because the Vendor ID from "ITTIM Technology" is
> not recognized.
> 
> This patch adds the PCI Vendor ID from "ITTIM Technology" to the list of
> PCI Vendor IDs and lets the mt7921e driver bind to the mentioned wifi
> chip.

> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -2126,6 +2126,7 @@
>  #define PCI_VENDOR_ID_MYRICOM		0x14c1
> 
>  #define PCI_VENDOR_ID_MEDIATEK		0x14c3
> +#define PCI_VENDOR_ID_ITTIM		0x0b48

Please add this in the correct place so the file remains sorted by
numeric Vendor ID and Device ID.  If you look at other PCI_VENDOR_ID_*
definitions, you'll see the pattern.

>  #define PCI_DEVICE_ID_MEDIATEK_7629	0x7629
> 
>  #define PCI_VENDOR_ID_TITAN		0x14D2
> --
> 2.25.1
> 

