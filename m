Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05633C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 19:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ByNGz8QHGhR+Vd9aCH+drnejO/bHFCUWJrrhHpWGgV0=; b=ds7VWhhlEouUcb
	c/hrY+WjwK69K6xyWhllLc7f++6KsAVs9RDbf21nst7eRLvIX8bGISn9PjeuXYKPkED387HsiRIvt
	omzOCFSVSD0EkorB5oy+tToEk2PO9WiuNCJRHs23v93Au8zwHezXJdwAEmS/lel4Uj7ThPRzS4AmF
	PSwPjjI+uNb/PF0RfhveTgNFJR3slMr3CanmaDQNrcAXU8OW/pWKJu7TWkodPLsGZlVpMq4lOWFUS
	knOC2IO5Ov5eStDC29Wq7DiCrcpbq633FMFxxjxdeBghcZN3h9rhOmIOpP0qXtsMJDlRbx9SYstPb
	WNEgQADQFdSzLCvHFVfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nctvK-0012I3-EA; Fri, 08 Apr 2022 19:05:34 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nctv9-0012GA-NK; Fri, 08 Apr 2022 19:05:25 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id j2so16814270ybu.0;
 Fri, 08 Apr 2022 12:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZEcUtO2v/WlLzjxpQ7XpDI1V7ziKO5fo7ZWmNgWyPtE=;
 b=PmwYKhlSZA/KBCRPNtd2dgeerhXTTV4HcPhWCqhmVQW8rqtZ3ySJOyOZFE6SFTuT2/
 6LHy2CXzw3E3h7dMJu6eUYQG+i59cBdqrD1F64GyYqj97zF/tUFotVrnMMF08n2cnHvH
 oUxSxlpOBnwNQ6UWf+BF+tExLLL+eygA9CCm7LrNOWEiFv+75805wT9u0r7YFVk2YwB+
 zpf/6e1qHwN/SEq3cWF+GsxgUC50vvLutdnY0J/5lmjS0g+s4NqmAu2V0f6i+41WGaZe
 S7C+IKMWEeVKIGgmqB4ySdzYdCp9/gzS9/RdP/hmxfnxM3df2yXJ3dP4qGVaDnTTycz4
 +K6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZEcUtO2v/WlLzjxpQ7XpDI1V7ziKO5fo7ZWmNgWyPtE=;
 b=vVjstoZ0ljGx7f0wi54tnrPjRBSl1os0ugRaFkxS9pKfIhGG5zc2QJ8LvHu4NKvCeO
 gVO5p110ASGiPfIT2aulZKqbwkQrHPLhy8VJE8iveQXq/2eA6JECbshZvnSGnE6whpE5
 6O4q/ooRJKaLyJ4a8gxCvjccYTaDEyGfUPuWbkZn5Nsr8IKyuErBAAv43qo4MLXI6bKv
 ILgRwLnZpp9o/6cYY0uaqtm2i9oDJHBak5QC3TCcyLZupuYiqYWqjydKJeRzWXBANtPq
 30HzW0ihGRo1zUEUXjz5N04l45cXEEf+XgDBfGTlUt+SDcSFyH5amUpZx9NbcP/zdZ22
 /eQg==
X-Gm-Message-State: AOAM530Wq2EALDt2HSz4rmXUY+VL6uPq1ozHna+g8o5HG43YLwTcnZLP
 m7v8zX9doyFU6Ub5d9czMPaPLRkXvCEVtfhg7GM=
X-Google-Smtp-Source: ABdhPJz+8CCXiO27jq0dSiJ6LlWduDnYBfFknVvzuuyWJRga0JVZZhWwKMlh3h+sIxMLVSFCj5zFUulBf8L6BaQRT9A=
X-Received: by 2002:a05:6902:1083:b0:63e:5325:d6b0 with SMTP id
 v3-20020a056902108300b0063e5325d6b0mr7319082ybu.431.1649444720478; Fri, 08
 Apr 2022 12:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220404155557.27316-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8tM3EiZkNSCG+CtrOnfGBc5WSaac__FBsRn72zrsjQ2ew@mail.gmail.com>
 <YlB07XRDWPHF7VaI@matsya>
In-Reply-To: <YlB07XRDWPHF7VaI@matsya>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 8 Apr 2022 20:04:54 +0100
Message-ID: <CA+V-a8uJPk48p4sE6eLTdaGyE5FwuLYD3oke5GPqf05ocHFESw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220408_120523_793758_92C398F8 
X-CRM114-Status: GOOD (  13.39  )
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

On Fri, Apr 8, 2022 at 6:46 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 07-04-22, 03:52, Lad, Prabhakar wrote:
> > Hi Vinod,
> >
> > On Mon, Apr 4, 2022 at 4:56 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > >
> > > Hi All,
> > >
> > > This patch series aims to drop using platform_get_resource() for IRQ types
> > > in preparation for removal of static setup of IRQ resource from DT core
> > > code.
> > >
> > Fyi.. the OF core changes have landed into -next [0].
> >
> > [0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20220406&id=a1a2b7125e1079cfcc13a116aa3af3df2f9e002b
>
> Is this series dependent on this?
>
Yes, if this series doesn't hit soon this will break the drivers.

Cheers,
Prabhakar

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
