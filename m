Return-Path: <SRS0=hgkd=NY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFFCC83027
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 16:31:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 175806023F
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 16:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 175806023F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WhUKkiQI0SpYl81zxOp9azxk07ikoikdVSrQUYwOHHU=; b=XWZIeWTu6tfVo1
	RZhUiEkoVpvlDeIDPkplIx6PBJoaXsCS+DHTbwqIP+9yOOBddcfk1y+/wruq0iSvsymjS2SjXdQq1
	4+wV93acJ24A1GKo4YMkFCLj5b5IRJOcEzJ9bR58HuZFgmrg3aMp6UZCsPIMIYC+y7B+OcDYAl8y8
	V1WihqUIJJu9pXnvuHk7T5pb+3/eotvVgMEJSheB3TghYOJm8uNi3Q2bfVf2Q5nUvILMZ91bdfUFR
	dJBD/sITRFmRZbOmZDFrkJ/0XNYN4igFlOgo9BdL07Tc1KovQRLt3Vx1O3r+zz/rxSuJC16biWihY
	N8gT06uNImMeIHJrK9kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLpcW-009zrC-8j; Thu, 02 Sep 2021 16:31:20 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLpcE-009zku-62
 for linux-mediatek@lists.infradead.org; Thu, 02 Sep 2021 16:31:08 +0000
Received: by mail-ed1-x529.google.com with SMTP id n11so3759076edv.11
 for <linux-mediatek@lists.infradead.org>; Thu, 02 Sep 2021 09:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=USYcfZjcg7/rxlJ01qDkInwsA0jQO3CoE6DaEmLtMHw=;
 b=SDXUXUjmEVYZVRMiOjlF6C4d8OElSn6OzwvpYK2P3+X6vbGGhNs3jl1Ah1E0/7xecX
 WWKAnRPN44pWc3rcAL4fQhmzfslDo5omfiE/1QZB2cYPVDj2K3bHJezEtHeyfh4cZlHb
 d8c+n71v8TI/B/n08wsJhylVzu1ptUpffH6Tj9cHySfMqmneUXvCAGax3A+ws/lnAOzo
 o7vHeWehks3XPV9NwG3j6PWL5/2PsZisukEAt1fEfETB+2q4LMGvOHld5BCtF9YHg0LS
 +TDuif9usO4s7ySKeqHgR01drPlO+/7cMmNeK7GuHBQiBM6gtzzq7oAPTXu1Grr4gx3+
 C2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=USYcfZjcg7/rxlJ01qDkInwsA0jQO3CoE6DaEmLtMHw=;
 b=GtfPPX2nutixO7CZBvIdMuxuQKc9l7p1Pbhlc3B8jpHXpdo4dIpET4YtB26+NLBrg9
 UdERjlRhgWOgRjUFHzjeecKqqLK+EatzCZtnd/tYEHSANKbSAM4E2RNt6Ac6dOtSmwls
 X3xYBaCRCgEURXzwM9qv4GZTMi/HTjMNWTNp9cdFOCzlXkFft4OFPkUGmrcsNXwTX2aH
 gMXEX+RZKNBcJQKaqF6cqS65Dki+VOzduVmQB0JG3AB1NBeKAcg5xgh+aiL/RD/cpDg6
 29nKlayVlKIXApUxm5iF6WmT/1XlGMk6T4XtVdYJl5MUI4BxG1pl4PONiWoSQIcQko7N
 f08Q==
X-Gm-Message-State: AOAM532umVqeiXdkJnV0AU14yt+CEnQjUl8htwQvzE9KoojeDW8SE5X/
 w/S4zwEHSsetASQSV8s1g2L4HWOIWrMBR0vxeNA2vA==
X-Google-Smtp-Source: ABdhPJy5d8mB0+bh+1dUQc9dMKYmM1vESBNDZccve874Sy179Xy0j7+SM+XKQHqNCiicfZiEUKLtVAnozq+y+AYfH1E=
X-Received: by 2002:aa7:d157:: with SMTP id r23mr4287441edo.322.1630600257783; 
 Thu, 02 Sep 2021 09:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
In-Reply-To: <20210901083215.25984-1-yunfei.dong@mediatek.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 2 Sep 2021 13:30:46 -0300
Message-ID: <CAAEAJfDOt_GyDPojcj5P6Wou9HC2GC8YzRt2wYyqdrCOjfeOog@mail.gmail.com>
Subject: Re: [PATCH v6, 00/15] Using component framework to support multi
 hardware decode
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, linux-media <linux-media@vger.kernel.org>, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_093102_256631_F2893604 
X-CRM114-Status: GOOD (  23.34  )
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

On Wed, 1 Sept 2021 at 05:32, Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> This series adds support for multi hardware decode into mtk-vcodec, by first
> adding component framework to manage each hardware information: interrupt,
> clock, register bases and power. Secondly add core thread to deal with core
> hardware message, at the same time, add msg queue for different hardware
> share messages. Lastly, the architecture of different specs are not the same,
> using specs type to separate them.
>
> This series has been tested with both MT8183 and MT8173. Decoding was working
> for both chips.
>
> Patches 1~3 rewrite get register bases and power on/off interface.
>
> Patch 4 add component framework to support multi hardware.
>
> Patch 5 separate video encoder and decoder document
>
> Patches 6-15 add interfaces to support core hardware.
> ----
> This patch dependents on : "media: mtk-vcodec: support for MT8183 decoder"[1] and
> "Mediatek MT8192 clock support"[2].
>
> 1: Multi hardware decode is based on stateless decoder, MT8183 is the first time
> to add stateless decoder. Otherwise it will cause conflict. This patch will be
> accepted in 5.15[1].
>
> 2: The definition of decoder clocks are in mt8192-clk.h, this patch already in clk tree[2].
>
> [1]https://patchwork.linuxtv.org/project/linux-media/list/?series=5826
> [2]https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?h=clk-next&id=f35f1a23e0e12e3173e9e9dedbc150d139027189
> ----
> Changes compared with v5:
> -Add decoder hardware block diagram for patch 13/15
>


The discussion on v5 was still on-going, so sending this v6
is not helpful. The context for v5's discussion is now harder to find.

Please avoid sending a new version without properly
discussing all the feedback, and without reaching consensus.
This is very important, please keep it in mind.

Specifically, the feedback on v5 was NAK, with the request to avoid
using any async framework, and instead try to find a simpler solution.

For instance, you can model things with a bus-like pattern,
which ties all the devices together, under a parent node.
This pattern is common in the kernel, the parent
node can use of_platform_populate or similar
(git grep of_platform_populate, you will see plenty of examples).

You will still have to do some work to have the proper
regs resources, but this is doable. Each child is a device,
so it can have its own resources (clocks, interrupts, iommus).

You don't need any async framework.

    vcodec_dec: vcodec_dec@16000000 {
        compatible = "mediatek,mt8192-vcodec-dec";
        reg = <something>;
        mediatek,scp = <&scp>;
        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;

        vcodec_lat@0x10000 {
            compatible = "mediatek,mtk-vcodec-lat";
            reg = <0x10000 0x800>;      /* VDEC_MISC */
            interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
            // etc
        };

        vcodec_core@0x25000 {
           compatible = "mediatek,mtk-vcodec-core";
           reg = <0x25000 0x1000>;      /* VDEC_CORE_MISC */
           interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
           // etc
        };
    };

Thanks,
Ezequiel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
