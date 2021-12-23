Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6371C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Dec 2021 16:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=NSXafdoJLWJioEIj6EENUdbxmT4AsOiwfv7fTcnbVJ0=; b=WzLrDuaHDPWQOr
	nrqdmKPLTJLzUM4Kr/QuD30zWccikyZA41txZEP1mB5hKTLD8HGQnuROt6LNqUwy0ryZDjpAUImCg
	vQF9fUQrhRTva0+ikLMfkDfdydhtwssZgfaKpLgwiaKLQ9frVBeE354XWRHq8KojCSH5+ehiAzEYg
	TTdiCPh5dwCyUtQ/x3a8jkgWjouSc4wXAGCgDlaMD5fgcNKe/I2OiW0XZ55PMnUHC+1dr1gm0AJJr
	2VOlSiPl40K0BibFZe5Skbt9Sc2wg+wnfAOXRrVNJKIWgDHnDtcA6tlczY6p/WGeVXFjXK9cNZJ8G
	GiOuF1BKe9tMnxkWprIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0RBX-00D6CY-SE; Thu, 23 Dec 2021 16:43:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0RBM-00D6Ai-I8; Thu, 23 Dec 2021 16:43:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E05A361C04;
 Thu, 23 Dec 2021 16:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AEDEC36AE9;
 Thu, 23 Dec 2021 16:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640277787;
 bh=NL161JDeCDIM/xYNPhiC2ONE2NUXcY75vDiM159xu5U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=PksqG2PWGf4RtwEqs6ZBvoY/axiIf4Sf9R3Q7ijq4zxConWpi5QScPKc1J1wRl1YF
 VPF4WLJVQSBOF2NRURrWTMuicoXgsqwIjnpbSQsuQgoljTVFBjcGJNKaj8npFSXmQE
 R6dJzXmYW79WzXlhCyFB48jys5FQTOZCrHWYG+Tt+INp9LcH2fj57ufedZZxcqA0ws
 R6BF0NiWq1QW6X9qweE3WjJoIlLzKSMV5IfrmL+Xf3T8S2mwhFephLL76xGB5J37QS
 FkfBcAUKj+cBc8LAqtRQhzvzdcXDb6FoAZjyU4z3C6PUqelnTlpgN0uZzij3k8e2J0
 MOqQT2HPVMHtw==
Date: Thu, 23 Dec 2021 10:43:05 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-pci <linux-pci@vger.kernel.org>, Fan Fei <ffclaire1224@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 17/23] PCI: mt7621: Rename mt7621_pci_ to mt7621_pcie_
Message-ID: <20211223164305.GA1270275@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMhs-H_dTkp6_1Loq973JqotW26GtRYQv-vdQ2i6Heo7oGCL3w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_084308_663660_747B1CFE 
X-CRM114-Status: GOOD (  21.11  )
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

On Thu, Dec 23, 2021 at 07:10:22AM +0100, Sergio Paracuellos wrote:
> On Thu, Dec 23, 2021 at 2:11 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > From: Bjorn Helgaas <bhelgaas@google.com>
> >
> > Rename mt7621_pci_* structs and functions to mt7621_pcie_* for consistency
> > with the rest of the file.
> >
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-mediatek@lists.infradead.org
> > ---
> >  drivers/pci/controller/pcie-mt7621.c | 36 ++++++++++++++--------------
> >  1 file changed, 18 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/pci/controller/pcie-mt7621.c b/drivers/pci/controller/pcie-mt7621.c
> > index 4138c0e83513..b8fea7afdb1b 100644
> > --- a/drivers/pci/controller/pcie-mt7621.c
> > +++ b/drivers/pci/controller/pcie-mt7621.c
> > @@ -93,8 +93,8 @@ struct mt7621_pcie_port {
> >   * reset lines are inverted.
> >   */
> >  struct mt7621_pcie {
> > -       void __iomem *base;
> >         struct device *dev;
> > +       void __iomem *base;
> 
> This change is unrelated to the commit message and the rest of the
> changes of this patch.
> ...

> Other than that minor unrelated change, this looks good to me:
> 
> Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks, I added a mention of the struct member reorder.

Bjorn

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
