Return-Path: <SRS0=IDfX=PQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C43D0C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 04:11:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D47760200
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 04:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D47760200
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rsRSGLXacrDlM9e3aelaJ+AsVuMYZ78Fp9r/UgFq87k=; b=tJmcDncRc+33z1
	J6suaMJZxQfIOA0mqnwP1BoNAXkcspW0hLwESe9aitVYo2g6iaL5DAONtr9TdNWM0UyTqIPc8IgNT
	4m6RpHE+QlufDObmsKl2W44N8ZxJvL3LiM+3Kgwx7w/p5CXN3Y1NZsxFQ3GU7nPs4tKYTTKvRFgZP
	LqU7vZv+6Xf3i0Y90GBSDTgbH7jnGn3cl3VZAj59D4VGxKFJyK3TcM2nTkhBOnEh+wAtTW1fZRSuL
	fwm53y8tfI7AcTHSqYfe3J1+/IC1NiJ9z9MqZ3tF4nNxol1iSx9VD5/b70CXyP3LR+H1i7ttts8P1
	3jK357Fw8LJMLdb+VIKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfwlX-006pjS-06; Thu, 28 Oct 2021 04:11:47 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfwlH-006pfD-38; Thu, 28 Oct 2021 04:11:32 +0000
Received: by mail-ua1-x92a.google.com with SMTP id e10so9118303uab.3;
 Wed, 27 Oct 2021 21:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xn8PEIn0HAm5g7c6x+2BgzMv0cNlTzK/SeJ2DFv191s=;
 b=STpsRI6+Bb8KeAqyuiI1+I7dNwJJujec7wkUoOAVQuBRZ/C7QfZyBz59JgQq4GhbYu
 NjYEsNJNFjK4Sx6Q3K3uOV5ctqvxgtzXsBq3mMrzcCRZiiObeD+UP/eGXmNWgcW7YZBD
 rQdmXkQFcIfs1CCzAlVtjY1wwkvmOyT8xC7AkTIbgd1MbUO5P9WiXAHXvq0/UTuVtOoR
 Q9pIh84Yf0rMNJclh8co5E90boxr6Np73XYvChU703VfjMMd5AMVgYm49IXUTSbP/Ppg
 nZvbBJbs05rUz75C9U56IURzVDAOLIs/dFk7GXkIh7KasxEi3CbcmiqVCj67rdlSZJwc
 daCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xn8PEIn0HAm5g7c6x+2BgzMv0cNlTzK/SeJ2DFv191s=;
 b=ORl/GNLJKkKbfevvXFgneByuFA/0LoU2sRp2H2vJ5m27Jkge+QwWXKKe58u+NtLpAk
 0rRTqL13SJ7rjtLZA6oMG1+HiRuGeYJyxpFnGN9iUackzP47qPBTXOAYELIkVB+caolW
 U+0gjDzD+0dwJVeowo8k3AevlIeFr+QRZokXO9wc4W1mfvjcVRQet1+YV+xsvP9QXWi/
 Zc+CDYSKYZoRJzWTNNBbdtiKBnzKs90Xr+2APaf3V/2JLHLddZSPFt2RLYcQgd5kfuPK
 rKQbFwiIiVdeDNGlfmGkhWmE5O5sPgnNn/tZU8r3s8+HF1hpQmCn2ORcsTROkHPCQQ/G
 62yA==
X-Gm-Message-State: AOAM532+TKZOkWmN/CXeu8zz3/TCl0vphRTV5WCJ44/+iSmGXb8waohw
 S9xym0TJwUaLis8vavspRr0HEKRZdt34Y54IAhQ=
X-Google-Smtp-Source: ABdhPJwFblgYg4X1L8DosH99640DqXOIO09uy3Cj7pYiyIdsLNYjKJLPnEUlXY/cMqutEFK2vOnKuDsHlwTUwiEzP0o=
X-Received: by 2002:ab0:5925:: with SMTP id n34mr2193803uad.46.1635394289059; 
 Wed, 27 Oct 2021 21:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1635390750.git.siyanteng@loongson.cn>
 <112fea0c8c1b65a762ac98412216239160721263.1635390750.git.siyanteng@loongson.cn>
In-Reply-To: <112fea0c8c1b65a762ac98412216239160721263.1635390750.git.siyanteng@loongson.cn>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 28 Oct 2021 06:11:18 +0200
Message-ID: <CAMhs-H9LUQ6Km=sA992LH=+E0MbGuMf9YhM6w2HoyeqE0QbzJQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] MIPS: cm/cpc: export some missing symbols to be
 able to use them from driver code
To: Yanteng Si <siyanteng01@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Florian Fainelli <f.fainelli@gmail.com>, 
 bcm-kernel-feedback-list@broadcom.com, Yanteng Si <siyanteng@loongson.cn>, 
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
 Rob Herring <robh@kernel.org>, kw@linux.com,
 Bjorn Helgaas <bhelgaas@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-pci <linux-pci@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>, chenhuacai@kernel.org,
 sterlingteng@gmail.com, 
 Linux Next Mailing List <linux-next@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_211131_175909_8A9EB59E 
X-CRM114-Status: GOOD (  12.09  )
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

On Thu, Oct 28, 2021 at 6:05 AM Yanteng Si <siyanteng01@gmail.com> wrote:
>
> Since commit 2bdd5238e756 ("PCI: mt7621: Add MediaTek MT7621 PCIe host controller driver")
> the MT7621 PCIe host controller driver is built as a module but modpost complains once these
> drivers become modules.
>
> ERROR: modpost: "mips_cm_unlock_other" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> ERROR: modpost: "mips_cpc_base" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> ERROR: modpost: "mips_cm_lock_other" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> ERROR: modpost: "mips_cm_is64" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> ERROR: modpost: "mips_gcr_base" [drivers/pci/controller/pcie-mt7621.ko] undefined!
>
> Let's just export them.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  arch/mips/kernel/mips-cm.c  | 5 +++++
>  arch/mips/kernel/mips-cpc.c | 1 +
>  2 files changed, 6 insertions(+)
>

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
