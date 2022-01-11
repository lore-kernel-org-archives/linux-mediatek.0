Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CE8C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 23:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QHVKPyqMB/XxAHAFeK8YtKLlAbUl822TJXegQfIqf3A=; b=v3u3qtjvBLSDRC
	QbW6P4YJ6hxnWZ5iVyvzDO5S/QUIZlGXpU8eMHitMguU0rvOIoGdiAQcjU5NIoEpuZjRCKG2Gq+le
	fc4Iz09nSEwZsvIy84wB+zoN5dFj495p6EQHG+ffWMrL3NLCIJVECeMxcwU/1HoY/dyl4nh8V+dZd
	FU2txHjhNiGBUYSrhzFq2WPoSdwK1WiczGafUvDTCK82/+0SMsZCbSkc5dpUNvogpW6gVzg94CWAI
	F+OZI7y5LKVoiLXPrFhgYtEc94bw7FdzWFK7QhPA8ipgl+shoIrwau4dmU4FBjyjt5s6nzdJJRvjy
	D/Mo8Md293naSJM8L6zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Qhe-000RsZ-Lm; Tue, 11 Jan 2022 23:37:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7QhS-000Rr4-DR; Tue, 11 Jan 2022 23:37:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C039A615DC;
 Tue, 11 Jan 2022 23:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F79BC36AF8;
 Tue, 11 Jan 2022 23:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641944228;
 bh=v20NyJnnrpRCSXRNC/bxgBQIPv65XMpppqdhmj/Hzvs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=s9qNkpwcKPVuanI5Kw+TTgMfk7JJRYxrLKhky2VaBe7JNusoldsDzVbrjJtz5IJls
 Dsap4Rdhc6KW5naVyUP3cl1e1mVMROZxwCoexpiuLfl8u40GZbm3ya0Yw9twDUA7CB
 8CkqCDJpa1VfiCFRLF3GovLW4tn4VdSbg+3mJTu/JPKY8eqLzxK4cO6GbhCwzoZ5pu
 ybvTJ1zkHXn24U3x7EsUMl44HQiT6Nxp9pIRjH15EP6d6GaRUU4QitjRXpw30E+v6Z
 /0XUi3/R0tE6lQvSGunHAc+KbF7DcXE9z9iWN3n3WPB+8oYnVy4gwT7gt7heV3QF15
 MvdeUZUFYqkAQ==
Received: by mail-ed1-f49.google.com with SMTP id k15so2550044edk.13;
 Tue, 11 Jan 2022 15:37:08 -0800 (PST)
X-Gm-Message-State: AOAM5323S1IJmmIBhr/ZJbNMs52FkmScaRyR6myKqG7oRHscu9Bq7UhA
 EkY/4+flR0ELpC5ZTXGUuYgvGXBysNoPRg3SzA==
X-Google-Smtp-Source: ABdhPJw710G1pZDb3HvgWDjTL63fkfcrpRHCZFpw//6sxrytQyY8zszFTXytk0jVWFHu0ZF1BEoxLUB6BT1sM9dzczw=
X-Received: by 2002:a17:906:d184:: with SMTP id
 c4mr5387166ejz.20.1641944226855; 
 Tue, 11 Jan 2022 15:37:06 -0800 (PST)
MIME-Version: 1.0
References: <20211216055328.15953-1-biao.huang@mediatek.com>
 <20211216055328.15953-7-biao.huang@mediatek.com>
 <1639662782.987227.4004875.nullmailer@robh.at.kernel.org>
 <be023f9d2fb2a8f947bd0075e8732ba07cfd7b89.camel@mediatek.com>
In-Reply-To: <be023f9d2fb2a8f947bd0075e8732ba07cfd7b89.camel@mediatek.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 11 Jan 2022 17:36:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLo7z-KWtwFx+Kng2aQuCpQwJaO6mHnyBzmCKCJDK5n+Q@mail.gmail.com>
Message-ID: <CAL_JsqLo7z-KWtwFx+Kng2aQuCpQwJaO6mHnyBzmCKCJDK5n+Q@mail.gmail.com>
Subject: Re: [PATCH net-next v10 6/6] net: dt-bindings: dwmac: add support for
 mt8195
To: Biao Huang <biao.huang@mediatek.com>
Cc: srv_heupstream <srv_heupstream@mediatek.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 David Miller <davem@davemloft.net>, 
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>,
 netdev <netdev@vger.kernel.org>, dkirjanov@suse.de, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Macpaul Lin <macpaul.lin@mediatek.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org, 
 Jakub Kicinski <kuba@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_153710_580493_91558E30 
X-CRM114-Status: GOOD (  20.76  )
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

On Thu, Dec 16, 2021 at 8:06 PM Biao Huang <biao.huang@mediatek.com> wrote:
>
> Dear Rob,
>   Thanks for your comments~
>
>   For mt8195, the eth device node will look like:
>   eth: ethernet@11021000 {
>     compatible = "mediatek,mt8195-gmac", "snps,dwmac-5.10a";
>     ...
>     clock-names = "axi",
>                   "apb",
>                   "mac_cg",
>                   "mac_main",
>                   "ptp_ref",
>                   "rmii_internal";
>     clocks = <&pericfg_ao CLK_PERI_AO_ETHERNET>,
>              <&pericfg_ao CLK_PERI_AO_ETHERNET_BUS>,
>              <&pericfg_ao CLK_PERI_AO_ETHERNET_MAC>,
>              <&topckgen CLK_TOP_SNPS_ETH_250M>,
>              <&topckgen CLK_TOP_SNPS_ETH_62P4M_PTP>,
>              <&topckgen CLK_TOP_SNPS_ETH_50M_RMII>;
>     ...
>   }
>
> 1. "rmii_internal" is a special clock only required for
>    RMII phy interface, dwmac-mediatek.c will enable clocks
>    invoking clk_bulk_prepare_enable(xx, 6) for RMII,
>    and clk_bulk_prepare_enable(xx, 5) for other phy interfaces.
>    so, mt2712/mt8195 all put "rmii_internal" clock to the
>    end of clock list to simplify clock handling.
>
>    If I put mac_cg as described above, a if condition is required
> for clocks description in dt-binding, just like what I do in v7 send:
>   - if:
>       properties:
>         compatible:
>           contains:
>             enum:
>               - mediatek,mt2712-gmac
>
>     then:
>       properties:
>         clocks:
>           minItems: 5
>           items:
>             - description: AXI clock
>             - description: APB clock
>             - description: MAC Main clock
>             - description: PTP clock
>             - description: RMII reference clock provided by MAC
>
>         clock-names:
>           minItems: 5
>           items:
>             - const: axi
>             - const: apb
>             - const: mac_main
>             - const: ptp_ref
>             - const: rmii_internal
>
>   - if:
>       properties:
>         compatible:
>           contains:
>             enum:
>               - mediatek,mt8195-gmac
>
>     then:
>       properties:
>         clocks:
>           minItems: 6
>           items:
>             - description: AXI clock
>             - description: APB clock
>             - description: MAC clock gate
>             - description: MAC Main clock
>             - description: PTP clock
>             - description: RMII reference clock provided by MAC
>
>    This introduces some duplicated description.
>
> 2. If I put "mac_cg" to the end of clock list,
>    the dt-binding file can be simple just like
>    what we do in this v10 patch(need fix warnings reported by "make
> DT_CHECKER_FLAGS=-m dt_binding_check").
>
>    But for mt8195:
>      the eth node in dts should be modified,

I hope you are defining the binding before you use it... That's not
good practice and not a valid argument.

>      and eth driver clock handling will be complex;

How so?

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
