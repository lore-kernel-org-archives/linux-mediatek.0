Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93431C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 11:40:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 585AA60FE6
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 11:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 585AA60FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I9JuI524l6Wq76NeHPtrUUL3E6EUllQQO6/KkONdPR0=; b=K2j+RQ/ep9dnv+
	wBQZpSHsKnyS/DGO52rDIJGXV0UTfliQ/8xd62zYf2w26GiPINbPrVLyyRPvMouy5CHSc6P7eFiOd
	lCtGGGD8adf1ww9PU+Eaqg9JDHkMQ4tTmoNbI3+AB5E8bhypI1PQINl5cYeCrIAvSt92PE+9Wgp2T
	SDDCSHZDV7A64rTrcKrdd76G7NoYu76kyjlaN+No6Wu6qWHV+D0BVmIemj4BqN4Fz6N8B0k0H1YtI
	xNvpcPJ67v2U1PfY8mBSkpUHGEfTibpfjg9e+FxveIgqWj6/tJCOyT38z/l/qpuIOJBaujsqS6NtT
	rtpssSLFFYpG11xmN4HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIrGZ-006rF1-IV; Wed, 25 Aug 2021 11:40:23 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIrGK-006rD1-Bp
 for linux-mediatek@lists.infradead.org; Wed, 25 Aug 2021 11:40:12 +0000
Received: by mail-lj1-x236.google.com with SMTP id y6so43098202lje.2
 for <linux-mediatek@lists.infradead.org>; Wed, 25 Aug 2021 04:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EBZuV88pzuw+Utaj04PasP/41EJ4vd/yd+gwCxY9UrU=;
 b=mZa9ODjFAlloFGduYEqaTO902w+oDyx3AX1SSokAkNLaVDfKLBrLXZbRbxaKd2VsNX
 CLf9p8nVSdT4Bj8/5mV2PzNe9XR1Gd9xy9RYjvSk3UiHCLUGpRvJX4l3Vq259dcrtmhL
 8/0MXnNb5kz9KLlqjOPN3SB33PNFiNdXspKaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EBZuV88pzuw+Utaj04PasP/41EJ4vd/yd+gwCxY9UrU=;
 b=Nv8O71mzGSd58UYDlCzhvDFiZwTKCh6AENz0y1WQbCwrguixHQRdcBf7QQagaPGLO+
 5RAoCz4CPR3vKCwk+0O5zbAOWRZKOLtRDDu/G7L1dfAt8fa2ECCVS60tCEQmSWJgih9K
 F/yF2qDTCbtfLA19RhnAO+binbXqda40AaO0WPATbSp/f7PTDBfNRy1tKxvUB8ygLHka
 pELBgsT5IswoxCUylaR9kgP+qM91Wb8S15egD1qsvHy7JAjZ+/Dww8Z2aeKcIkNlazR0
 sXKzmt/BNeN8KxLsTX32a0wohYgIqso1nsBXKFduBGqgdE5/HqlK7t4EiOAXuqnWhNad
 bbpA==
X-Gm-Message-State: AOAM530Epk62QNCAOn3M9bswPbIBSBEmToAUmiL+lLB2WCOHNeM5FKPK
 F266kAz1uoztQp46zR22LmxhrKYZpy3IuRFXos6zeg==
X-Google-Smtp-Source: ABdhPJzCtvn8fAS4/q6M3YBoqbcAFrN7nTepCa+MUbbEZGiTzZRCqQ+Z7ipvuJp8aEquToQ/qlt7CrzkIDbTsII0zEs=
X-Received: by 2002:a2e:8546:: with SMTP id u6mr24817270ljj.185.1629891605061; 
 Wed, 25 Aug 2021 04:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
 <20210820111504.350-3-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-3-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 25 Aug 2021 19:39:54 +0800
Message-ID: <CAGXv+5Eb4ZiXZXURvoApSEk_myhNpEugOhr2DrzvkxGfDKJneg@mail.gmail.com>
Subject: Re: [v2 02/24] clk: mediatek: Add dt-bindings of MT8195 clocks
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_044008_431613_FEDAEAB3 
X-CRM114-Status: GOOD (  14.53  )
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

On Fri, Aug 20, 2021 at 7:17 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 clock dt-bindings, include topckgen, apmixedsys,
> infracfg_ao, pericfg_ao and subsystem clocks.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  include/dt-bindings/clock/mt8195-clk.h | 864 +++++++++++++++++++++++++
>  1 file changed, 864 insertions(+)
>  create mode 100644 include/dt-bindings/clock/mt8195-clk.h
>
> diff --git a/include/dt-bindings/clock/mt8195-clk.h b/include/dt-bindings/clock/mt8195-clk.h
> new file mode 100644
> index 000000000000..95cf812a0b37
> --- /dev/null
> +++ b/include/dt-bindings/clock/mt8195-clk.h
> @@ -0,0 +1,864 @@

[...]

> +/* WPESYS_VPP0 */
> +
> +#define CLK_WPE_VPP0_VECI              0
> +#define CLK_WPE_VPP0_VEC2I             1
> +#define CLK_WPE_VPP0_VEC3I             2
> +#define CLK_WPE_VPP0_WPEO              3
> +#define CLK_WPE_VPP0_MSKO              4
> +#define CLK_WPE_VPP0_VGEN              5
> +#define CLK_WPE_VPP0_EXT               6
> +#define CLK_WPE_VPP0_VFC               7
> +#define CLK_WPE_VPP0_CACH0_TOP         8
> +#define CLK_WPE_VPP0_CACH0_DMA         9
> +#define CLK_WPE_VPP0_CACH1_TOP         10
> +#define CLK_WPE_VPP0_CACH1_DMA         11
> +#define CLK_WPE_VPP0_CACH2_TOP         12
> +#define CLK_WPE_VPP0_CACH2_DMA         13
> +#define CLK_WPE_VPP0_CACH3_TOP         14
> +#define CLK_WPE_VPP0_CACH3_DMA         15
> +#define CLK_WPE_VPP0_PSP               16
> +#define CLK_WPE_VPP0_PSP2              17
> +#define CLK_WPE_VPP0_SYNC              18
> +#define CLK_WPE_VPP0_C24               19
> +#define CLK_WPE_VPP0_MDP_CROP          20
> +#define CLK_WPE_VPP0_ISP_CROP          21
> +#define CLK_WPE_VPP0_TOP               22
> +#define CLK_WPE_VPP0_NR_CLK            23
> +
> +/* WPESYS_VPP1 */
> +
> +#define CLK_WPE_VPP1_VECI              0
> +#define CLK_WPE_VPP1_VEC2I             1
> +#define CLK_WPE_VPP1_VEC3I             2
> +#define CLK_WPE_VPP1_WPEO              3
> +#define CLK_WPE_VPP1_MSKO              4
> +#define CLK_WPE_VPP1_VGEN              5
> +#define CLK_WPE_VPP1_EXT               6
> +#define CLK_WPE_VPP1_VFC               7
> +#define CLK_WPE_VPP1_CACH0_TOP         8
> +#define CLK_WPE_VPP1_CACH0_DMA         9
> +#define CLK_WPE_VPP1_CACH1_TOP         10
> +#define CLK_WPE_VPP1_CACH1_DMA         11
> +#define CLK_WPE_VPP1_CACH2_TOP         12
> +#define CLK_WPE_VPP1_CACH2_DMA         13
> +#define CLK_WPE_VPP1_CACH3_TOP         14
> +#define CLK_WPE_VPP1_CACH3_DMA         15
> +#define CLK_WPE_VPP1_PSP               16
> +#define CLK_WPE_VPP1_PSP2              17
> +#define CLK_WPE_VPP1_SYNC              18
> +#define CLK_WPE_VPP1_C24               19
> +#define CLK_WPE_VPP1_MDP_CROP          20
> +#define CLK_WPE_VPP1_ISP_CROP          21
> +#define CLK_WPE_VPP1_TOP               22
> +#define CLK_WPE_VPP1_NR_CLK            23

If WPE_VPP0 and WPE_VPP1 end up being identical hardware, then there's
no need to have two separate lists.

[...]

> +/* VENCSYS */
> +
> +#define CLK_VENC_LARB                  0
> +#define CLK_VENC_VENC                  1
> +#define CLK_VENC_JPGENC                        2
> +#define CLK_VENC_JPGDEC                        3
> +#define CLK_VENC_JPGDEC_C1             4
> +#define CLK_VENC_GALS                  5
> +#define CLK_VENC_NR_CLK                        6
> +
> +/* VENCSYS_CORE1 */
> +
> +#define CLK_VENC_CORE1_LARB            0
> +#define CLK_VENC_CORE1_VENC            1
> +#define CLK_VENC_CORE1_JPGENC          2
> +#define CLK_VENC_CORE1_JPGDEC          3
> +#define CLK_VENC_CORE1_JPGDEC_C1       4
> +#define CLK_VENC_CORE1_GALS            5
> +#define CLK_VENC_CORE1_NR_CLK          6

Same for VENC and VENC_CORE1.


ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
