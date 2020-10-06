Return-Path: <SRS0=UyV0=DN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 742D9C47095
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 07:20:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1824C20760
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 07:20:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1vRa2lUw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1824C20760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ugs2l5X135fa9KP/LaZm3rpYGsgxr4gc/1YD47lr2jI=; b=1vRa2lUwpUfaferx5SxUwwiYu
	A+UEW+lfwTJl+IKebnElPMPr2ci4HyzdW5sIML3OhA+Kbo+gDQh2bfzVPN6Ao6bDld6vlFzrkSjd9
	Hqj5pMevF7/eXteUGiZamrb1yTtKR2RpYdCfrCGOO4qorEYBMDW0OWxHgRiXWMg3AyCAxm1xcBO0w
	ZwdSJLe02ZZJGqSWmiKHJYMNZ7e6vCjmLEpDQAUw3V2k31QAjJMRPfA8u8l/JvYg2NpjSH3Uo8MCQ
	H0pMa4CGI4WxWIamPeM3oKKO2q29/boWRNCyEh40Jk5+2MY86jBlIuUInVnILj5Y7dhG+pI/bwOL/
	SAa+HFnsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPhGL-0006Qu-8V; Tue, 06 Oct 2020 07:19:53 +0000
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPhGJ-0006Q1-Cs; Tue, 06 Oct 2020 07:19:52 +0000
Received: by mail-wr1-f65.google.com with SMTP id n15so6441411wrq.2;
 Tue, 06 Oct 2020 00:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tLX8MUE8fMwR/rmRJeOX+yduwkBmzQAbVy+FfpGJiXk=;
 b=fm5DUMvo5uVFY7Sgqj367iK26fCiE0Rt5VeidH+8jE4gHU/LWbqgMeFC/loDZVJSc/
 VRjG5haSlmDkwPRcYR/XCzeE6LyEHPIgFbqBFBI5WfQQATHkf6qgIKIdQgYNiO0MpdiU
 xZrbi7JjFK4mjkHa/z0bV701pxBAtgjlim+tutPsSzjUbimiK94o3IBkGtQgjSAkYVnL
 XCCoqD5KxKQqYIvPwfpUCfHohnT7kRURkSv1GOUVJGzVO3BymlPTo5VzUFJdyyBKjz8/
 AdjJgIoweosoY0YmOZHNAO7YLGStNFp9ZTr8kq+sSkhg+BcaJUMDiDiwfzK1Fejodj8T
 SDSQ==
X-Gm-Message-State: AOAM533798iyNHVK6nesCZ6aKwN0S7Oro9hR77s+tYUWFFEGv3d+hVCi
 DD3IgeTgnA+DsZacH+QUEdF3E7sSp9NN4Mhk
X-Google-Smtp-Source: ABdhPJwcFPFaKk+kQGjarLysXTsJkvJxJ59r7qmNrLo/3p1ufBJ3CMZyj51pjjHZbxZ26R5kk8lplA==
X-Received: by 2002:adf:9461:: with SMTP id 88mr3236215wrq.307.1601968790024; 
 Tue, 06 Oct 2020 00:19:50 -0700 (PDT)
Received: from kozik-lap ([194.230.155.194])
 by smtp.googlemail.com with ESMTPSA id f63sm2746288wme.38.2020.10.06.00.19.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Oct 2020 00:19:48 -0700 (PDT)
Date: Tue, 6 Oct 2020 09:19:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v3 06/24] dt-bindings: mediatek: Add binding for mt8192
 IOMMU
Message-ID: <20201006071946.GA5759@kozik-lap>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
 <20200930070647.10188-7-yong.wu@mediatek.com>
 <20201002111014.GE6888@pi3> <1601958405.26323.24.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1601958405.26323.24.camel@mhfsdcap03>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_031951_452431_18352448 
X-CRM114-Status: GOOD (  29.95  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 kernel-team@android.com, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Greg Kroah-Hartman <gregkh@google.com>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Oct 06, 2020 at 12:26:45PM +0800, Yong Wu wrote:
> Hi Krzysztof,
> 
> On Fri, 2020-10-02 at 13:10 +0200, Krzysztof Kozlowski wrote:
> > On Wed, Sep 30, 2020 at 03:06:29PM +0800, Yong Wu wrote:
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
> > >    3       CCU0    0x4000_0000 ~ 0x43ff_ffff     larb13: port 9/10
> > >    4       CCU1    0x4400_0000 ~ 0x47ff_ffff     larb14: port 4/5
> > > 
> > > The iova range for CCU0/1(camera control unit) is HW requirement.
> > > 
> > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > ---
> > >  .../bindings/iommu/mediatek,iommu.yaml        |   9 +-
> > >  .../mediatek,smi-common.yaml                  |   5 +-
> > >  .../memory-controllers/mediatek,smi-larb.yaml |   3 +-
> > >  include/dt-bindings/memory/mt8192-larb-port.h | 239 ++++++++++++++++++
> > >  4 files changed, 251 insertions(+), 5 deletions(-)
> > >  create mode 100644 include/dt-bindings/memory/mt8192-larb-port.h
> > 
> > I see it depends on previous patches but does it have to be within one
> > commit? Is it not bisectable? The memory changes/bindings could go via
> > memory tree if this is split.
> 
> Thanks for the view.
> 
> I can split this into two patchset in next version, one is for iommu and
> the other is for smi.
> 
> Only the patch [18/24] change both the code(iommu and smi). I don't plan
> to split it, and the smi patch[24/24] don't depend on it(won't
> conflict).

It got too late in the cycle, so I am not going to take the 24/24 now.

> 
> since 18/24 also touch the smi code, I expect it could get Acked-by from
> you or Matthias, then Joerg could take it.

Sure. I acked it.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
