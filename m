Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA68C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 17:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=/jLwRiL15+ELQq8toT10zLA1YWNvhZDFJ68YVwBYRB0=; b=vU2Ui9wsvEx9Y0
	1JjkgCO2z9jDctl6+hPy+wwL5r68OLKTueULslzcKfRLUO1MC6ckloj6cNFxGL3MoOFxsgFMSBWnY
	5ilOF2CDgkKC9bjlk+ym05iHfHuCW3ZX5LblBs4Pn8EzkkNcDJmDPx8aQuFLhsuBB/So90BD043T3
	oUx/NdvWCbIvQ6xuN/LtRhzyA1tWLW3vuKdfH4ZAVg9aL807X0QHa8dN1e5Hh8I97+clF19Q4CV4E
	RD4bCM+0upJnE/ql6H8U39NHJLNBjV62ewkxTGO+UFD0xRwsU4t6/Ud3WMEN3/soaFfPHRGgAhblX
	3YAd8eaBktnUiDtn5btg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muefk-009bYx-9M; Tue, 07 Dec 2021 17:54:36 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muefX-009bUk-1F; Tue, 07 Dec 2021 17:54:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 37B07CE1C96;
 Tue,  7 Dec 2021 17:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3AFC341C3;
 Tue,  7 Dec 2021 17:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638899658;
 bh=kVi8XrFSssRXT3rgDgO1jjnYQhug1iemGioceZ8LSLU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=CVEsPspzTJfq0TiQD74as4ZI7nk6iN/8wQrz6kGsFg6ZuWh/GWh/cQHLh8JrifBmT
 81m9io7385vE4X8Zif3qRfiinKAHvDun7SCo4KTQKJR15Xl022OBYBL7xqOu9tjqnx
 JjmEZGlvMSx7nQNRuOUUaNv6DrXXvutdAO0kRV05t9kd8RW/+HU6ULnIPbeJhgnXna
 jPMJPi9GFiMtFPaUW8vLH1qZ4GS/xz3GT5QQGAyg+9EQMO4a/908g2IPoS6Sw7aO6z
 VBeK9zTKkCGAkltLbR00Vb1/jw/T4r/cj8qCxjrZNMx+YPC5bdTOfvgt/20BLdkrPD
 u5SS4yQi2T5cQ==
Date: Tue, 7 Dec 2021 11:54:16 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: qizhong cheng <qizhong.cheng@mediatek.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, chuanjia.liu@mediatek.com,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Mark Kettenis <mark.kettenis@xs4all.nl>,
 Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [RESEND PATCH v2] PCI: mediatek: Delay 100ms to wait power and
 clock to become stable
Message-ID: <20211207175416.GA42725@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211207084153.23019-1-qizhong.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_095423_519753_B9C2470D 
X-CRM114-Status: GOOD (  20.76  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

[+cc Marc, Alyssa, Mark, Luca for reset timing questions]

On Tue, Dec 07, 2021 at 04:41:53PM +0800, qizhong cheng wrote:
> Described in PCIe CEM specification sections 2.2 (PERST# Signal) and
> 2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST# should
> be delayed 100ms (TPVPERL) for the power and clock to become stable.
> =

> Signed-off-by: qizhong cheng <qizhong.cheng@mediatek.com>
> Acked-by: Pali Roh=E1r <pali@kernel.org>
> ---
> =

> v2:
>  - Typo fix.
>  - Rewrap into one paragraph.

1) If you change something, even in the commit log or comments, it is
a new version, not a "RESEND".  A "RESEND" means "I sent this quite a
while ago and didn't hear anything, so I'm sending the exact same
thing again in case the first one got lost."

2) I suggested a subject line update, which apparently got missed.
Here's a better one:

  PCI: mediatek: Assert PERST# for 100ms for power and clock to stabilize

3) Most importantly, this needs to be reconciled with the similar
change to the apple driver:

  https://lore.kernel.org/r/20211123180636.80558-2-maz@kernel.org

In the apple driver, we're doing:

  - Assert PERST#
  - Set up REFCLK
  - Sleep 100us (T_perst-clk, CEM r5 2.2, 2.9.2)
  - Deassert PERST#
  - Sleep 100ms (not sure there's a name? PCIe r5 6.6.1)

But here in mediatek, we're doing:

  - Assert PERST#
  - Sleep 100ms (T_pvperl, CEM r5 2.2, 2.2.1, 2.9.2)
  - Deassert PERST#

My questions:

  - Where does apple enforce T_pvperl?  I can't tell where power to
    the slot is turned on.

  - Where does mediatek enforce the PCIe sec 6.6.1 delay after
    deasserting PERST# and before config requests?

  - Does either apple or mediatek support speeds greater than 5 GT/s,
    and if so, shouldn't we start the sec 6.6.1 100ms delay *after*
    Link training completes?

>  drivers/pci/controller/pcie-mediatek.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> =

> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/control=
ler/pcie-mediatek.c
> index 2f3f974977a3..a61ea3940471 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -702,6 +702,13 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_=
port *port)
>  	 */
>  	writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
>  =

> +	/*
> +	 * Described in PCIe CEM specification sections 2.2 (PERST# Signal) and
> +	 * 2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST# should
> +	 * be delayed 100ms (TPVPERL) for the power and clock to become stable.
> +	 */
> +	msleep(100);
> +
>  	/* De-assert PHY, PE, PIPE, MAC and configuration reset	*/
>  	val =3D readl(port->base + PCIE_RST_CTRL);
>  	val |=3D PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
> -- =

> 2.25.1
> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
