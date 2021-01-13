Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33375C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 05:38:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5BAB23122
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 05:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5BAB23122
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QlXdF1RpxuCTx2awfKwp0eOEXPk+2O7kyX54D4ibM/c=; b=K6N0To2PKk2qG4UVxeNXy3CeU
	5XtYdsZ5LO0mPuPGifBuvDEOwno2d5bihC95pBH6lzWD0ZqmImBV6Q2WfgC8m0PIEVIzq09U2X6Ou
	WdXcZVaRbbJVL8WYJ5eL+cilFzZM1AhDQpM+L4SwtdG7kZ4G4mipZMLmcPb9Brp6ul3XCN2ZLaqTr
	epnqn3b6C/t4AHjSIw3V/9noPNTe/3eOE3DY2MspquGyWHf+3ZjrqzTIgNaD10MqVvQF/nqA+TuWx
	FrwDXe0F+DXwDIpTyINhSbIegVYf62n8aC2tNBSp1AjwFUi60VdcQB0M6NfBCUPeFDg8Jttjyltia
	3OjqWBWwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzYrl-0006jG-E5; Wed, 13 Jan 2021 05:38:45 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzYri-0006ii-2I
 for linux-mediatek@lists.infradead.org; Wed, 13 Jan 2021 05:38:43 +0000
Received: by mail-ed1-x534.google.com with SMTP id c7so573391edv.6
 for <linux-mediatek@lists.infradead.org>; Tue, 12 Jan 2021 21:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3eSHLU0tsnB/8YZodS1JHYyVuvZP1q+Jh72EF+LlqTo=;
 b=kH9y5HDmn14mKPIgiSh0+j61km8jiNYl7Jz2izQAcbV/5id9R9NlXd1WoPfZ4Cqp12
 DC2YZgYFU3CAG0ZYQdxFQiMKzJqP8Q+nkXFfCI9yrpeJDZ6lzD4Ld6GCkOfgQtLnoGLA
 KxDo2CyZ1EsNF43VAwEawZpbStfqt1FOzQm8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3eSHLU0tsnB/8YZodS1JHYyVuvZP1q+Jh72EF+LlqTo=;
 b=kZ19WwgmLJuF3r3kLPhMvL+mkPMtNVkfcuWMU3Ofpys+ccqMAUAokEof6c+g7dWUwk
 /8PJo9y0W8ofwTkIHAIHQ7qKkO5BgXL4eXcOFBvJKndPZpnUHKqrL0MRnx9xChc0Jce0
 xlUgsG2LC0Jpg2vJ6tapelRASzLkhlwsRMwvnc1A88tlcL/qH4HNuVT6plIICPHPNy2q
 gb3w3r4D27AGh19aoUidRLPa5W7uXaoY+K/lWPPQKi6ugmtMJg58m350UytmhiWL2GYF
 JJD+e07Uq08HNxqMuowSfyoUVhuq17JdR2xBp0tV0CS+sIJ0vZcNDYqrzaVv9MvEkmnN
 SBCg==
X-Gm-Message-State: AOAM530DEu6uR5Ws0J+xa8/Rxw+c9geDA5L9JiAxj61gzqynfAHpskvl
 KwcfHmkm9FjpLdekiTWGl1yErfdJ0XR8vP5G
X-Google-Smtp-Source: ABdhPJxgH5Z5AqFS5r30xqn85Oib0w/Ps61z9LQQLwVoaYcBvFwl0CAmLD4q6a/CForRjjnL3je7Qw==
X-Received: by 2002:a50:fd88:: with SMTP id o8mr430043edt.386.1610516320258;
 Tue, 12 Jan 2021 21:38:40 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48])
 by smtp.gmail.com with ESMTPSA id p12sm246264ejc.116.2021.01.12.21.38.39
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 21:38:40 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id y23so450296wmi.1
 for <linux-mediatek@lists.infradead.org>; Tue, 12 Jan 2021 21:38:39 -0800 (PST)
X-Received: by 2002:a7b:c773:: with SMTP id x19mr382042wmk.127.1610515837254; 
 Tue, 12 Jan 2021 21:30:37 -0800 (PST)
MIME-Version: 1.0
References: <20201209080102.26626-1-yong.wu@mediatek.com>
 <20201209080102.26626-7-yong.wu@mediatek.com>
 <X+L9XpkoII7tw/tX@chromium.org> <1608809713.26323.262.camel@mhfsdcap03>
In-Reply-To: <1608809713.26323.262.camel@mhfsdcap03>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 13 Jan 2021 14:30:24 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CCJv=0q=V45Z7mtq7FSq1c5TcH6vyqfp3MWxaA=ZexJQ@mail.gmail.com>
Message-ID: <CAAFQd5CCJv=0q=V45Z7mtq7FSq1c5TcH6vyqfp3MWxaA=ZexJQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/27] dt-bindings: mediatek: Add binding for mt8192
 IOMMU
To: Yong Wu <yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_003842_177116_0B91D927 
X-CRM114-Status: GOOD (  32.56  )
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
Cc: youlin.pei@mediatek.com, linux-devicetree <devicetree@vger.kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Evan Green <evgreen@chromium.org>, chao.hao@mediatek.com,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 24, 2020 at 8:35 PM Yong Wu <yong.wu@mediatek.com> wrote:
>
> On Wed, 2020-12-23 at 17:18 +0900, Tomasz Figa wrote:
> > On Wed, Dec 09, 2020 at 04:00:41PM +0800, Yong Wu wrote:
> > > This patch adds decriptions for mt8192 IOMMU and SMI.
> > >
> > > mt8192 also is MTK IOMMU gen2 which uses ARM Short-Descriptor translation
> > > table format. The M4U-SMI HW diagram is as below:
> > >
> > >                           EMI
> > >                            |
> > >                           M4U
> > >                            |
> > >                       ------------
> > >                        SMI Common
> > >                       ------------
> > >                            |
> > >   +-------+------+------+----------------------+-------+
> > >   |       |      |      |       ......         |       |
> > >   |       |      |      |                      |       |
> > > larb0   larb1  larb2  larb4     ......      larb19   larb20
> > > disp0   disp1   mdp    vdec                   IPE      IPE
> > >
> > > All the connections are HW fixed, SW can NOT adjust it.
> > >
> > > mt8192 M4U support 0~16GB iova range. we preassign different engines
> > > into different iova ranges:
> > >
> > > domain-id  module     iova-range                  larbs
> > >    0       disp        0 ~ 4G                      larb0/1
> > >    1       vcodec      4G ~ 8G                     larb4/5/7
> > >    2       cam/mdp     8G ~ 12G             larb2/9/11/13/14/16/17/18/19/20
> >
> > Why do we preassign these addresses in DT? Shouldn't it be a user's or
> > integrator's decision to split the 16 GB address range into sub-ranges
> > and define which larbs those sub-ranges are shared with?
>
> The problem is that we can't split the 16GB range with the larb as unit.
> The example is the below ccu0(larb13 port9/10) is a independent
> range(domain), the others ports in larb13 is in another domain.
>
> disp/vcodec/cam/mdp don't have special iova requirement, they could
> access any range. vcodec also can locate 8G~12G. it don't care about
> where its iova locate. here I preassign like this following with our
> internal project setting.

Let me try to understand this a bit more. Given the split you're
proposing, is there actually any isolation enforced between particular
domains? For example, if I program vcodec to with a DMA address from
the 0-4G range, would the IOMMU actually generate a fault, even if
disp had some memory mapped at that address?

>
> Why set this in DT?, this is only for simplifying the code. Assume we
> put it in the platform data. We have up to 32 larbs, each larb has up to
> 32 ports, each port may be in different iommu domains. we should have a
> big array for this..however we only use a macro to get the domain in the
> DT method.
>
> When replying this mail, I happen to see there is a "dev->dev_range_map"
> which has "dma-range" information, I think I could use this value to get
> which domain the device belong to. then no need put domid in DT. I will
> test this.

My feeling is that the only part that needs to be enforced statically
is the reserved IOVA range for CCUs. The other ranges should be
determined dynamically, although I think I need to understand better
how the hardware and your proposed design work to tell what would be
likely the best choice here.

Best regards,
Tomasz

>
> Thanks.
> >
> > Best regards,
> > Tomasz
> >
> > >    3       CCU0    0x4000_0000 ~ 0x43ff_ffff     larb13: port 9/10
> > >    4       CCU1    0x4400_0000 ~ 0x47ff_ffff     larb14: port 4/5
> > >
> > > The iova range for CCU0/1(camera control unit) is HW requirement.
> > >
> > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > ---
> > >  .../bindings/iommu/mediatek,iommu.yaml        |  18 +-
> > >  include/dt-bindings/memory/mt8192-larb-port.h | 240 ++++++++++++++++++
> > >  2 files changed, 257 insertions(+), 1 deletion(-)
> > >  create mode 100644 include/dt-bindings/memory/mt8192-larb-port.h
> > >
> [snip]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
