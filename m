Return-Path: <SRS0=Q4g2=MM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D16A4C07E95
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 16:27:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97E586024A
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 16:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97E586024A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZVSt2Y21bdJuUnD++weJ4wrM0ysFSq3TPXjnu55hKH0=; b=yJJltfl0lfXVyx
	Xhl/P2Rp3pwOE/yJyr7vcWOqmbkOmW9a74k+OB6hO00fceGjXWrwEdc+P+E9Y3mwocfbx89j3JAWX
	eJuHVeqgCE/nvnMPP9A7HfqWq+iYPjx4vnQzkIvxqS9t0DW0LSlqoYZpf81AU+eEhgpQiV8EciRA1
	fpXvGp7yZXIxtPMcfpduiYPE7i8TtqUk24qlzOGjjNBPAalLuBEpwXUFe6QiljVzTOjclc7dVjdEu
	hTog6NKO8PrVTb/UrEhZ+9pDeWgk+9cySzLRklVDOVF7iLEezA2Jvzv9xe0r9X9hL+2NbmW1xyRq+
	gpqSf056dW0dyIV/+DaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5saI-00DY5J-8o; Tue, 20 Jul 2021 16:27:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5sa3-00DY40-HE; Tue, 20 Jul 2021 16:26:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 37430610D2;
 Tue, 20 Jul 2021 16:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626798411;
 bh=oQdXwNsnov3I71IUbI4ZalJPD3H1vclSOvDUrvDehgM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BEDlTQJuCNmRb0S80L1HreKgM5vWdFUH4cWiZ8lcGEm31+R8K/+B4SgxU9uY3K1Ne
 LbWmBKlvczn8+JRc1QifwdZNDa37iS+EGa+gNCpLkUFJGx9q6xY64tgrHbauenB5B4
 5vJaK3F3kbbUSISyPa5XN8nah484lGaBnTiapH2gbhtIPVv1iYMHPOnONUIeOsJid2
 sd5EmaawZ0eIG2AE1/Gt9qoeEwYRVhM5R2OChA/f0qMfD1o4K7b9YW6WlqmI/GhxVT
 04fV0zs2soVWAc0/DYgxFNVd6wg9pDR1G2rvm8dO1a2ZNPc7h3fDIiND6RJJMNii+t
 5VcfZlZCQjpmA==
Received: by mail-ed1-f51.google.com with SMTP id t3so29151974edc.7;
 Tue, 20 Jul 2021 09:26:51 -0700 (PDT)
X-Gm-Message-State: AOAM533WAcTiWveSetjNHF2nSAVO4p1+ieO4+1stBxc8aT564cLMpIuK
 ELxmdkYJ+qHUYhlRaLaxxASaBPk2jHyc5D8yfA==
X-Google-Smtp-Source: ABdhPJx0GdcRkiEP/Wr+vbI5/kjYFGNAHGXTDhqcSZ1dJavWwEGC3uFmRTPWxd/i8V27bJovNBzDreGIuAsGuq7iyRc=
X-Received: by 2002:aa7:cb19:: with SMTP id s25mr42328404edt.194.1626798409815; 
 Tue, 20 Jul 2021 09:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210719073456.28666-1-chuanjia.liu@mediatek.com>
 <20210719073456.28666-2-chuanjia.liu@mediatek.com>
 <20210719224718.GA2766057@robh.at.kernel.org>
 <1626746843.2466.10.camel@mhfsdcap03>
In-Reply-To: <1626746843.2466.10.camel@mhfsdcap03>
From: Rob Herring <robh@kernel.org>
Date: Tue, 20 Jul 2021 10:26:38 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJXN1b5Tq7uAngXfDmpTJoPvDmSzMedK3kr6efvuCgQ=w@mail.gmail.com>
Message-ID: <CAL_JsqJXN1b5Tq7uAngXfDmpTJoPvDmSzMedK3kr6efvuCgQ=w@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] dt-bindings: PCI: mediatek: Update the Device
 tree bindings
To: Chuanjia Liu <chuanjia.liu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Ryder Lee <ryder.lee@mediatek.com>, 
 PCI <linux-pci@vger.kernel.org>, Frank Wunderlich <frank-w@public-files.de>, 
 devicetree@vger.kernel.org, Yong Wu <yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_092651_660732_71A7CAE0 
X-CRM114-Status: GOOD (  23.13  )
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

On Mon, Jul 19, 2021 at 8:07 PM Chuanjia Liu <chuanjia.liu@mediatek.com> wrote:
>
> On Mon, 2021-07-19 at 16:47 -0600, Rob Herring wrote:
> > On Mon, 19 Jul 2021 15:34:53 +0800, Chuanjia Liu wrote:
> > > There are two independent PCIe controllers in MT2712 and MT7622
> > > platform. Each of them should contain an independent MSI domain.
> > >
> > > In old dts architecture, MSI domain will be inherited from the root
> > > bridge, and all of the devices will share the same MSI domain.
> > > Hence that, the PCIe devices will not work properly if the irq number
> > > which required is more than 32.
> > >
> > > Split the PCIe node for MT2712 and MT7622 platform to comply with
> > > the hardware design and fix MSI issue.
> > >
> > > Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
> > > Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> > > ---
> > >  .../bindings/pci/mediatek-pcie-cfg.yaml       |  39 ++++
> > >  .../devicetree/bindings/pci/mediatek-pcie.txt | 206 ++++++++++--------
> > >  2 files changed, 150 insertions(+), 95 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml
> > >
> >
> >
> > Please add Acked-by/Reviewed-by tags when posting new versions. However,
> > there's no need to repost patches *only* to add the tags. The upstream
> > maintainer will do that for acks received on the version they apply.
> >
> > If a tag was not added on purpose, please state why and what changed.
> >
> Hi,Rob
> I have described in the cover letter:
> v11:Rebase for 5.14-rc1 and add "interrupt-names", "linux,pci-domain"
>     description in binding file. No code change.
> if you still ok for this, I will add R-b in next version.

Yes, it's fine.

In the future, put the changelog for a patch in the patch.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
