Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76556C43461
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 17:51:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 238AF21D46
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 17:51:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="00uC3/xo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UifUi1aR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 238AF21D46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BYn+pEGh2WE+5Us9mDht7qapyiWpTEzKXVTaT1FnRuQ=; b=00uC3/xo/d7gFN8CQYaVYx9gM
	7dhMcnm66oHbjDtLO7C9VZV0J//TkISTzWjA7aQ1TtgdUTF4UpFKB3YasTwmJtjshxAgKGDYOXr8p
	oSv0mmgftM8xyebZaRo4JBEj1JN/6ovOOOeSsq6W3nhHIQCIyvOwDSwNuHO6ugs3P03wjNTYmc7XP
	ZIcG4p8kvcde+PwFgI6rrE1Y8zCHUj9j9FBgkt0Zax+YPYwgfXUg0HS6ILAW06VQEwvutRAVpj1mm
	/NRvaRzlbuHsb5BO8GMZosGaaYc6+YR5h59OP5YjNFizxm7U5d5A7/0nj4JgGxpuwOeFoyeWnKIMp
	VJ6gqMtDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kG4FU-0005RC-JD; Wed, 09 Sep 2020 17:51:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG4FO-0005PR-DQ; Wed, 09 Sep 2020 17:51:08 +0000
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8494B21D93;
 Wed,  9 Sep 2020 17:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599673865;
 bh=pGHphgmWLyo/dufTuQiMNTxw/j6Mkqzz2RqYRRi2qIE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UifUi1aR6vTY1YCFohz0MrsKIbjiUVfmrXU2POWfD05x3TzEfeUPlesFCVlJ6ghfj
 9vIKHIkvaeFpbqdu0l6Nr9FuDgfyQP+9Asr7rOvSE/4V1z1OUqkQV0RhMb5NGdIAUa
 Bu91FIcOSqIl/6c1IQ0N9sRnIsOWjX/dOz2z9lqM=
Received: by mail-ot1-f50.google.com with SMTP id g96so3014651otb.12;
 Wed, 09 Sep 2020 10:51:05 -0700 (PDT)
X-Gm-Message-State: AOAM532gbLcJjFkuD6bFHtYqiA3XanSQSNxopOnxdIxgjuN3NBHSDpHt
 k38NXRbONUhMJdPYvecf36eKnane7y6e5ziOIg==
X-Google-Smtp-Source: ABdhPJxkJmq457j4MdDwATy4hh9FtiZDSM5Hwf51HIx/0/Kwnq9MhZuGO4CNBKKY+8iKB00EhwOE4N/A7bj1yse07sE=
X-Received: by 2002:a9d:411:: with SMTP id 17mr1478163otc.192.1599673864818;
 Wed, 09 Sep 2020 10:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200907120852.12090-1-jianjun.wang@mediatek.com>
 <20200907120852.12090-2-jianjun.wang@mediatek.com>
 <20200908195050.GA795070@bogus>
 <1599620917.2521.9.camel@mhfsdcap03>
In-Reply-To: <1599620917.2521.9.camel@mhfsdcap03>
From: Rob Herring <robh@kernel.org>
Date: Wed, 9 Sep 2020 11:50:53 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+NrfiJ-DAwtYG2b_chfivXi-aazHH8kiApuHS1G8JF=Q@mail.gmail.com>
Message-ID: <CAL_Jsq+NrfiJ-DAwtYG2b_chfivXi-aazHH8kiApuHS1G8JF=Q@mail.gmail.com>
Subject: Re: [v1,1/3] dt-bindings: Add YAML schemas for Gen3 PCIe controller
To: Jianjun Wang <jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_135106_833156_433BF42C 
X-CRM114-Status: GOOD (  24.40  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 PCI <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sj Huang <sj.huang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Helgaas <bhelgaas@google.com>,
 David Miller <davem@davemloft.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Sep 8, 2020 at 9:10 PM Jianjun Wang <jianjun.wang@mediatek.com> wrote:
>
> On Tue, 2020-09-08 at 13:50 -0600, Rob Herring wrote:
> > On Mon, 07 Sep 2020 20:08:50 +0800, Jianjun Wang wrote:
> > > Add YAML schemas documentation for Gen3 PCIe controller on
> > > MediaTek SoCs.
> > >
> > > Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> > > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > > ---
> > >  .../bindings/pci/mediatek-pcie-gen3.yaml      | 158 ++++++++++++++++++
> > >  1 file changed, 158 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > >
> >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.example.dts:55.56-59.19: Warning (pci_device_reg): /example-0/bus/pcie@11230000/legacy-interrupt-controller: missing PCI reg property
> >
> >
> > See https://patchwork.ozlabs.org/patch/1359119
> >
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure dt-schema is up to date:
> >
> > pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> >
> > Please check and re-submit.
> >
>
> Yes, I have already found this warning message, but I'm confused with
> how to add this reg property, since the interrupt-controller has inherit
> the pci device type but does not have its own registers.
>
> Could you please tell me how to fix this error, or which docs can I
> refer to?

Actually, disregard this. We need to fix dtc for this case.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
