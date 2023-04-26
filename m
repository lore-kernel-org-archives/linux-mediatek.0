Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFD5C7618E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 17:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnrsEB7Na53/pN7K0RQxU5xYX7Pua/KH6NC5ctAUi7I=; b=GcyljSXeunoBWzBN3lp9dOYFLE
	jXn+cM5s4x88uoKcb01Uvmt6Fdj23GmYd+uCUdv8zjLcUOMVmWq28st3Ot7wmD5JW3h8MmErXvUCz
	A6AXhaFq5AvF99KnveYoag3LoEFkUKsnf+dZr7cZ5kcYJcWTIiYIlmmfh7BwUQgsXe3QynjNzexEN
	bGFbfqAF6L52pBV09Jygkx4GZUzBUEvxt9HHKL0Huh0g7MomytpUCpyM3x2SbEuGhvrVPCMcIzdXq
	nEPim6o8J8j7x84RlKeUJ28EdNm05FseRN6f7aO4fZQCTdHH1eugnH/1TnVDA+TXMYR6v+Ztbz6J4
	bOJS92mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prj9Y-004YXH-1z;
	Wed, 26 Apr 2023 17:42:04 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prj9V-004YWi-0T;
	Wed, 26 Apr 2023 17:42:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1682530907; i=frank-w@public-files.de;
	bh=fzBJ9aehgljKPhYXz04ylxft46ZFFyfph0GM2HpSX6A=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NixrjmA8i3Beg06Lq02m7wWxG+Yk1fc0N1mn2pCZWB+GmCNBsRnyF5CQ4Yv/a+KYa
	 uKkYDovjyxp0gPRVelMaN/nWtXJniW/iZLV5dBFLwkWUC5+kvy1Va2ltROViJsNv9G
	 o4nTP0PyKQixWHRHu8SY8f2pl1Vm7uA5F5bJLdlrFESA7QdTBw8SEWTWxvMduWDC7y
	 AcftTYKE+LLUOv3A79Gv2q50/fHuIGB17uKpuQTv8/A0lsEQY5Te+5r72RlEHrcEVl
	 IB1siCJKwBrRMdjjwa18V6f+mopynDWdUA0f2uWUB2KLvEtDkMQ9rMfM6W5O0k/KRa
	 eoikXsOBNtc0Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.146.19] ([217.61.146.19]) by web-mail.gmx.net
 (3c-app-gmx-bs05.server.lan [172.19.170.54]) (via HTTP); Wed, 26 Apr 2023
 19:41:47 +0200
MIME-Version: 1.0
Message-ID: <trinity-8c5502f4-34bc-456b-9e4b-37edac37c3ed-1682530907724@3c-app-gmx-bs05>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <linux@fw-web.de>
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Aw: [PATCH] PCI: mediatek-gen3: handle PERST after reset
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Apr 2023 19:41:47 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20230402131347.99268-1-linux@fw-web.de>
References: <20230402131347.99268-1-linux@fw-web.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:dzORq1CAzMS2PqaF9FBOyc0gBlknMTC94Yf2KX1DHMdfdevuyPq8M6Ei6iJ7PM5D9PeKN
 8L+RD84dEQ4WCZpamp7vgRtYvOMf0Y9aCwthhw0qFpBa34dMx7A5mYqQpvHltcvN4C3cNhcjydGG
 eUWPVPzEloSvIMAzNvZoDm3QK6vxi0Y6HvZZ4msiato/LLTZc5/hOLwwIAs9fe9OzLesvIVNSmAj
 CaIc2miW5cxVFMKcl1ijALj0px70aIJ+bFJtcMIlnGNDPp1LQLdvSeB4yG/HxTP0LqNMbyFI9MOl
 v8=
UI-OutboundReport: notjunk:1;M01:P0:ZJ7W47MwB30=;LKsCmYzAPuDvFS+HNRFqVjZU1lF
 mdKzDe116qQyuDI2RanO1UYZ8pecJImM2lKT/paapBa02gD1iANY8Jf3AztrQudk3ljBfFk8P
 7oL6paNP7Iltz06q7neYttlPG+8nhVUpj/Jicv4+5SQ8HG96EekPSha56/92G2VuKwUGVufku
 kkKCEVSoWW/h0lwKHVdFN0oc2C9SI9+YF66CQozj2GckutLB+IJZp5L3NdfJGw4fCTJTyWXbp
 Rb+gEFzNArmMyHzkMbgrc6GHASVXIrcfcrFW2vjql7ty1qCF1bwXOG4x8IFkNABkSWRxMNJQQ
 yhDGkqr1spNyYTUwJHOpayxNFyriCl7MpiSgYZECykoBmlkEDmwUhhj2HG619JxrD6pBGKlzX
 s569ZRGb3yy1HVVZd65iF/iqp+nPNZZuYpSqilnVPYGgJY5ZwsEP0pHtB9SfwniApiv/UbeQJ
 WY9bekR8z/E21BBOO2BN18tAejf2exZDzM4en1Xi0QcskuLOQF2PlCY2S1imDw1Jj4b2c22o1
 sYcpD8VepJem38lXLJtUyVfriPNhux0nKAYaFCFD6Kb69sCogKyV3IbbTI/WFEl5eHVFPmTGp
 PSEAbFDznQ3CDaCm8c+IGiZ/+SuEKOqhheNcv5aJFR0TXHLHDMEUgaHgAirhRAGRR16YA/nnB
 j3onTZRjj277pRTG+if9nBBbABqEAp9Ku1acg5E6YXKzHWlq/IEVtLyKswLnGonkfXW9e1/Bx
 Crx8j3lY9fbvXvfdK3oQZRepH7pmXrPR/QxYyYDVMbMhSkTk6QeS6u4JfPuIpgtRwCyeBxaG2
 2AkVrWbi2BnKs6yPvTA8CfgojJpW2fdOE5Q0z1Stfg+ao=
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_104201_474221_F239BFD3 
X-CRM114-Status: GOOD (  16.13  )
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

Hi

> Gesendet: Sonntag, 02. April 2023 um 15:13 Uhr
> Von: "Frank Wunderlich" <linux@fw-web.de>
> De-assert PERST in separate step after reset signals to fully comply
> the PCIe CEM clause 2.2.
>
> This fixes some NVME detection issues on mt7986.
>
> Fixes: d3bf75b579b9 ("PCI: mediatek-gen3: Add MediaTek Gen3 driver for M=
T8192")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> Patch is taken from user Ruslan aka RRKh61 (permitted me to send it
> with me as author).
>
> https://forum.banana-pi.org/t/bpi-r3-nvme-connection-issue/14563/17
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/c=
ontroller/pcie-mediatek-gen3.c
> index b8612ce5f4d0..176b1a04565d 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -350,7 +350,13 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pc=
ie *pcie)
>  	msleep(100);
>
>  	/* De-assert reset signals */
> -	val &=3D ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RST=
B);
> +	val &=3D ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB);
> +	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> +
> +	msleep(100);
> +
> +	/* De-assert PERST# signals */
> +	val &=3D ~(PCIE_PE_RSTB);
>  	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
>
>  	/* Check if the link is up or not */

Hi

just a friendly reminder....do i miss any recipient?

regards Frank

