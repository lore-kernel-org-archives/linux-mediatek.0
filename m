Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CAEC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 07:55:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5995060E08
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 07:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5995060E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m/PTxQ/JpEwMdVhXgzhj65R0BC4Xau+rskLiHFZFEQw=; b=ySfE/Q1xdp257L
	demzPrwkJL4/fVOKZfa+44kncNVdNYZShbK+uyk7/78j5P18tpbtc0m8VSztCKY/zpwO2kO9ohsf/
	e8/sKFTLGB5PEOS0prUa3G2L91vSuoNp5QOGrDDYHIDpCxlLgFCXJqFqzD5ZzNPH5QSFUED5ElUvm
	BsrttSUhPrfHjkeWJT/WE8fRIGwDAQTccTRuA3iQvXvbvZ4Y742OhKuoS4Ihhyw8w+Nt5DgVIFL7D
	1hloedZeEjlWoPg1fTneNziLYSUpbG5MvVOQOD8KnlXT5DwR5XXF3NqBWY52Bd5r/2xPHJUe4bNUO
	JWqnu2X3RphjHmWPaiTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTg3G-00DQ1V-HD; Fri, 24 Sep 2021 07:55:22 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTg3C-00DPzc-MM
 for linux-mediatek@lists.infradead.org; Fri, 24 Sep 2021 07:55:20 +0000
Received: by mail-lf1-x12a.google.com with SMTP id x27so36922595lfu.5
 for <linux-mediatek@lists.infradead.org>; Fri, 24 Sep 2021 00:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JGmW9C+VJgClTUsrZKCeV0/J9rVWIZQmzpXvw/rQpIk=;
 b=Ahrt2ozoHr1F1XaGJc8UFWICEWx8gXzt2P8DnqE+76I7f+qcZ4PJLWcuYI7YYLRuRF
 295dBHmchEjQ+f5oiSMLwpl0RZfub+JdzvYGDp7mjQ8AaIXLVPfVNgYDTMO7EVOxbxg1
 dGIlLtwfrbge+SQVQC4xuZMPe1HxIqWieoegc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JGmW9C+VJgClTUsrZKCeV0/J9rVWIZQmzpXvw/rQpIk=;
 b=JWbG+TGHYOHT229MnuTix3PywKrbeUDt3jNITWJLcbyQg0dw5s3PM2hsbJdhHMrBHC
 +OEIlthUVX/Wp6uSTIT1ey8e2yXUqIYur9Ucn/aN+MiVd2ivmFMu7VyPSr+fUMRAr56l
 5wFDd93PgpCsgLDQA9yd14jgl5zAAuF70kQHniXNjLpyY86Cc36UGgqht+WnCOuowsiI
 3w9aUx6Yj4LVBpBcx4/9qIL9QZTmnX3CdoQjYjpFM+tGoGyyMqMFi5wGTkbVdAONE36G
 BSDuqShBsfM/mTElyIoP2kTG3iLrc2oOkybW9vD848rujwicgWeayeeFINwu6NJTgNk0
 VnvA==
X-Gm-Message-State: AOAM532UEJR94wZQl8b4iTNsxurLgZS1y2K5xz6gAtmlrmo5hjJV+gHS
 wmz23vsp6fipxQ0AuVj3egphCoQPLFcRQEWhRmclMg==
X-Google-Smtp-Source: ABdhPJzkFv7HLV5oiZBfchGG412aWLIODM5Pu3aEuCwVKvIU5JXdh28L0/JBma6qNUvVyNbpJPJPjk4Mep/rE15SXIc=
X-Received: by 2002:a05:651c:1505:: with SMTP id
 e5mr9964384ljf.9.1632470115670; 
 Fri, 24 Sep 2021 00:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <1632469543-27345-1-git-send-email-kyrie.wu@mediatek.com>
In-Reply-To: <1632469543-27345-1-git-send-email-kyrie.wu@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Sep 2021 15:55:04 +0800
Message-ID: <CAGXv+5H3MRhSi=x0UA2vsXheDjVR0Cdig0DmEvS5dLLgSBCnvA@mail.gmail.com>
Subject: Re: [PATCH V4,0/5] Support jpeg encoder for MT8195
To: "kyrie.wu" <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Tomasz Figa <tfiga@chromium.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Devicetree List <devicetree@vger.kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 xia.jiang@mediatek.com, Maoguang Meng <maoguang.meng@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>, 
 Irui Wang <irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_005518_737753_D9A87B67 
X-CRM114-Status: GOOD (  25.22  )
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

On Fri, Sep 24, 2021 at 3:46 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
>
> MT8195 has two jpeg encoding HW, each one has its own
> power-domain, clock, interrupt, register base.
> The two jpeg encoding HW can work together to
> achieve higher performance.
>
> Generally, one HW needs to register one device node,
> and the APP operates the HW through the device node.
> If there are multiple HWs, the multiple device node
> needs to be registered. At this time, the app needs
> to design software logic to use multiple HWs in parallel,
> which will undoubtedly increase the difficulty of
> app development and weaken its compatibility.
>
> These serial patches use the component framework
> to achieve the purpose of using multiple HWs
> through only one device node. About the component
> framework Block Diagram, please check below:
>
>                 Master(device node)
>         ________|_________________________
>         |                      |             |
> component0(HW0) component1(HW1) component2(HW2) ......
>
> As above, the component framework is similar to a
> master-component two level architecture.
> Both master and component have the compatible
> attribute in the device tree, and the corresponding
> platform driver structure is defined in the driver.
> Therefore, when the compatible attribute matches,
> the corresponding probe function will be called.
>
> In the probe function of component, operations
> such as initialization clock, remmap register base,
> registration interrupt will be performed.
> And add the component to a component linked
> list to find the corresponding master.
>
> In the probe function of the master, the device
> node will be registered, and the master will be
> added to a master linked list to find the
> corresponding component.
>
> After the master matches the component,
> it will obtain the clock, interrupt, register base
> and other resources in the component,
> and operate the HW through these resources.
> At the same time, multiple HWs software function
> interfaces are designed in the master driver.


Please include a changelog with your cover letter (or in each patch).
This is the fourth version of the series, and it's unclear what has
changed between the versions.


ChenYu

> kyrie.wu (5):
>   dt-bindings: mediatek: Add mediatek, mt8195-jpgenc compatible
>   media: mtk-jpegenc: Use component framework to manage each hardware
>   media: mtk-jpegenc: add jpegenc timeout func interface
>   media: mtk-jpegenc: add jpeg encode worker interface
>   media: mtk-jpegenc: add output pic reorder interface
>
>  .../bindings/media/mediatek-jpeg-encoder.yaml      |   3 +
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c    | 395 ++++++++++++++++++---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h    |  79 +++++
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c  | 298 ++++++++++++++++
>  4 files changed, 730 insertions(+), 45 deletions(-)
>
> --
> 2.6.4
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
