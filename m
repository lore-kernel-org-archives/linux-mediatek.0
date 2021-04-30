Return-Path: <SRS0=r4MK=J3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C77C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 16:35:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C536D60233
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 16:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C536D60233
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=iTUa1GLk98CP56SX12FPGvrFmKVBk1Lqh3EUbFjaQkY=; b=mjMNsnX7LwmI0oOeOgiIHtAEW
	4RjaNCYgfRaHrzms6/sVYe4ReZP8tHPmYvfbEp14VuAlhUcfPx+2OSLgToedl9USs4h3SrMuZX5Hv
	5qJbiPhD/H0khTWSDbJ5ve/uzxlMIKxMmELfdsD8Ze1+CAZA1/BkCIdkkmHd530B85PW3/CSpgxFZ
	LRBVL6g/Zz/vuG35MAqnegK609DPQgfnkDbqpsTpd7/IG9PQ8+xZmqMm03+GDuFnf95shL5SPNiZh
	h6PPHy9hRuyD2nRHhGpy++xN1bZV8WLdJHHITHbojr3jVLj3sKYLSJoBErQU90Fx9FyaLoyAihCdB
	RDVvVaWOg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcW6e-008Cci-2I; Fri, 30 Apr 2021 16:35:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcW6Q-008CaL-Vx; Fri, 30 Apr 2021 16:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To
 :Content-ID:Content-Description:References;
 bh=HwbXm3kw7lRhkn/zHkvNcxUj/t3dvmO36nGD1FbN5Lw=; b=dSr4z6CwtPMRK0DeJZhkNFYWqK
 ihw17IEcvYAiM1oRKV37r6EjVe93rRb8++yJ82OJvhR95xIoJSrTvDTOCgm1oNe3dV4dG2+xIllxT
 3cT03tuEXWxV0+jqSYKzYG3RnXyx2p9mnYxdwUQP54IweS9GOhwHR99az6x/SxuvEpcLvfggfc1Lo
 wRIafD+xi0FLtHnuj3Ydi5lkEfopNneQ/b/q6L7hnMqTfuXUG8eX/8btA0wPoFjiiBiRtRBTGxDR2
 6KT38iZe3WKtpr89QlkCyR9abLb5QJCUdzYP9RfidgLX79m4UD9vp3G+bB+lAqafXouODVtggeqpC
 WeuammyQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcW6O-001WWI-9y; Fri, 30 Apr 2021 16:34:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 881D860233;
 Fri, 30 Apr 2021 16:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619800491;
 bh=CTKqzMvOc6YCJvRdNUuExGC6a82/6LKQAJ0WVAxwTHI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=HcVnRRoN6PJV0PZxkh2SBFKELhCNx2XmJ+OJDu3mRyWzYHMRNkMciQVXCumFAekqC
 YCz6QclpGMiYgurI5/ZjQrZ9zmHcdXaeyiKGLpfyUTpMM7OMPMgwdK2TDpGcDd8kAc
 XUQ9koyWLfJaF7xjXZDy2tW/LjUkZCdLu71d/NtQXmv0brxgoTVAyDHIwHzc7XOL9F
 jTn2O6wUqTjEGEUSVBFo8aJRlP74s1/s7K3xkGcYSNVrurbvKkboyKRAHgNOFB1rhn
 FexsQ7BigHsIs+5nRzS8RgccqusV/3IgXfVj7yy+xYxJKdC2RcqNpxHvJBn4DBru9b
 4yeikauXWCrbg==
Date: Fri, 30 Apr 2021 11:34:50 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Colin King <colin.king@canonical.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] PCI: mediatek-gen3: Add missing null pointer check
Message-ID: <20210430163450.GA657994@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7a512e3a-2897-ac12-ac6e-06be28735279@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_093452_390162_9241273C 
X-CRM114-Status: GOOD (  20.00  )
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

On Fri, Apr 30, 2021 at 09:47:06AM +0200, Christophe JAILLET wrote:
> Le 29/04/2021 =E0 13:00, Colin King a =E9crit=A0:
> > From: Colin Ian King <colin.king@canonical.com>
> > =

> > The call to platform_get_resource_byname can potentially return null, so
> > add a null pointer check to avoid a null pointer dereference issue.
> > =

> > Addresses-Coverity: ("Dereference null return")
> > Fixes: 441903d9e8f0 ("PCI: mediatek-gen3: Add MediaTek Gen3 driver for =
MT8192")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >   drivers/pci/controller/pcie-mediatek-gen3.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > =

> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/=
controller/pcie-mediatek-gen3.c
> > index 20165e4a75b2..3c5b97716d40 100644
> > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -721,6 +721,8 @@ static int mtk_pcie_parse_port(struct mtk_pcie_port=
 *port)
> >   	int ret;
> >   	regs =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "pcie-ma=
c");
> > +	if (!regs)
> > +		return -EINVAL;
> >   	port->base =3D devm_ioremap_resource(dev, regs);
> >   	if (IS_ERR(port->base)) {
> >   		dev_err(dev, "failed to map register base\n");
> > =

> =

> Nitpick:
>    Using 'devm_platform_ioremap_resource_byname' is slightly less verbose
> and should please Coverity.

Not a nitpick at all.  Jianjun is correct that devm_ioremap_resource()
does check "regs" for NULL and it fails gracefully before trying to
dereference it, so the extra check shouldn't be needed.  And most
cases in drivers/pci/ look like this, without the extra check:

  res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "app");
  base =3D devm_ioremap_resource(dev, res);
  if (IS_ERR(base))
    ...

If devm_platform_ioremap_resource_byname() keeps Coverity happy, I
think that's what we should be doing across drivers/pci/.  Coverity
false positives are a hassle.

Seems like something for next cycle since we're in the middle of the
merge window.

> Also, which git repo are you using? On linux-next ([1)], your proposed pa=
tch
> is already part of "PCI: mediatek-gen3: Add MediaTek Gen3 driver for
> MT8192".
> =

> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/=
log/drivers/pci/controller/pcie-mediatek-gen3.c

I think this is because Lorenzo already squashed Colin's change in.

Bjorn

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
