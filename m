Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F51C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 02:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HlADf/DHB9apssk5o8Wfp+4QskF9yjvvcfN3eVeoKtM=; b=FvgFgXVBXsTnf0
	Q3qFNB0HCpBZlvcY2xPjkEFDjRhv/ezUcWC6CT+f8o/j9SD8vj+MfFugU/AdFqyKfiGM39uV7qRh0
	V85xWyaPG3RPri+4DXlci5cHvK/mZ/4XIIhAz+1lqZfBuHeQBCEX1HDg7w957FFINSojXZkM5KBav
	vtVrp7pakcRU5JVedosgIW+F2wy+KmoKfqh94FlFLiYxBY4MIPLmkxL4KFvdp7Dxu1cF8z4aSZT8K
	sO9olSjDHLGcGyOY0QuEX1Gp4MuClJSf5f5GO1qTXevOVVGi4O91xVJd610Eg6BU9GLXEpyILBOUd
	fNe45h2e6PjI9RnPhBBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncIH2-008vZT-5r; Thu, 07 Apr 2022 02:53:28 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncIGq-008vWZ-9Q; Thu, 07 Apr 2022 02:53:17 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id o62so7362428ybo.2;
 Wed, 06 Apr 2022 19:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hOqVy6gRmDIPKGJRDzX2KezvYez3k9c+5+AVEHVzz40=;
 b=P+y3+ScFd24nfq3pBIZYA+8O6FxPw+aM0oWT3No1p4/eJWXp4tSN7e7pplFy2odInW
 k+Y2CG87GauHiaQn82wzVPVzC8JhMnCTn/Rhwfyf1Eu2E3i91TOlHB75JZw3Gho3aGRI
 FWFTneC/EN+zh2FWeG2rXGRHUvg+rKk11H+iThCnjEvk24X/tPXdpimt3x3qRQgGVeEZ
 WwF9R/lV3Fkn1DkohWLc6zI9S9LjiK3uaZvwsL9GhdSQ0QlZMRDemK/kfDSiABkldMGm
 FnIFehGAF/fwgBt2JjT+Yu8pJ/KXBS4aGrD9nYE5s4xU+70XAEnUq2RzN3XPfKNyhcO1
 rcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hOqVy6gRmDIPKGJRDzX2KezvYez3k9c+5+AVEHVzz40=;
 b=k0c5EGNbEIEX0lyWkB2DBTmJAK5bhYwCHmgzlqzrEfJkblbSzbc8trcwq9xyyVEgLk
 MpPx2dWg/b4fFLnc25bhn88yi692+dvVeN1E2zO6+JHEG3SuoI7zcGZbZozIKIZhDfnF
 nJYOsnCLmdyEKAGbCgcJh12LZcWJV472zIAb0mJRa3cTa4OSI30WnEpGm+EqIUKEw3rh
 TMi1P8pf2dsg1/A0LKS3Xbj0qCb2a1ZFMyynwxhzwIwEqxk9ERkoG/m3Xm3biqAKcEY6
 +RWHwDdKmub192Ox0VLT0Qb4x/k6AOtRzptzmvaoHkB9dzm7P3Qpfeo0jCohCTRKW3RH
 nqdw==
X-Gm-Message-State: AOAM531ns1/aGFeJNQw28gckGP1nuqJHdL0Xxp6Gi3+ZkWVr4Ij4fZfr
 q4kIqpMbrk+4xuDLQiatqSC4i6GsY2Bfz7GdJnc=
X-Google-Smtp-Source: ABdhPJyfmfZEIsyG6RM9aPwpCdyCsqYhqtBZg/XU9g0EImsIbaZJa4T9PtaA/s6KvzGLSkuXzN89+rCyWiE2pyGr4Fo=
X-Received: by 2002:a25:e0d3:0:b0:63d:c615:afb8 with SMTP id
 x202-20020a25e0d3000000b0063dc615afb8mr8436525ybg.182.1649299991734; Wed, 06
 Apr 2022 19:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220404155557.27316-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220404155557.27316-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 7 Apr 2022 03:52:45 +0100
Message-ID: <CA+V-a8tM3EiZkNSCG+CtrOnfGBc5WSaac__FBsRn72zrsjQ2ew@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] dmaengine: Use platform_get_irq*() variants to
 fetch IRQ's
To: Vinod Koul <vkoul@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 dmaengine <dmaengine@vger.kernel.org>, 
 LAK <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_195316_357490_0A5746C8 
X-CRM114-Status: GOOD (  14.20  )
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

Hi Vinod,

On Mon, Apr 4, 2022 at 4:56 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Hi All,
>
> This patch series aims to drop using platform_get_resource() for IRQ types
> in preparation for removal of static setup of IRQ resource from DT core
> code.
>
Fyi.. the OF core changes have landed into -next [0].

[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20220406&id=a1a2b7125e1079cfcc13a116aa3af3df2f9e002b

Cheers,
Prabhakar

> Dropping usage of platform_get_resource() was agreed based on
> the discussion [0].
>
> [0] https://patchwork.kernel.org/project/linux-renesas-soc/
> patch/20211209001056.29774-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>
> Changes for v3:
> * Included Ack from Andy.
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (3):
>   dmaengine: nbpfaxi: Use platform_get_irq_optional() to get the
>     interrupt
>   dmaengine: mediatek: mtk-hsdma: Use platform_get_irq() to get the
>     interrupt
>   dmaengine: mediatek-cqdma: Use platform_get_irq() to get the interrupt
>
>  drivers/dma/mediatek/mtk-cqdma.c | 12 ++++--------
>  drivers/dma/mediatek/mtk-hsdma.c | 11 ++++-------
>  drivers/dma/nbpfaxi.c            | 14 ++++++--------
>  3 files changed, 14 insertions(+), 23 deletions(-)
>
> --
> 2.17.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
