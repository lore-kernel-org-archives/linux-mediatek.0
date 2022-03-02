Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFB6C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 14:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Gji3WPJJEa7gjX0HtobC7I5z6+BMQzJljk33vfLEzw=; b=njir5F5v6V4gOm
	A0ZZQmEksd3hM3/K07pLQXYt+p8JHCNa81jocSxdelKqIetEnGfXzHhJpcbLE3H4yDWcSyJ2AI8fQ
	baFpNC7M4lZ8+LImy4OMgYPGlKrfhYdGavWm8wafNG2ntOXbrAvyJwyK0q8GzimG8fv+7eOzrQVBt
	JYA82Yz7JS7Sr86FVL7osxc88JIUvpybo6UpQTUiqYGra+PkH1eHGxB0RmbJbYMFuWbXuPJHNcQuM
	t0TuxnNXWSAssdukBZ1kvKauCqs4mdOJRx12CHVFbIkK5GTnbWeAKOQk52mSKPy754KMiH3aAm14a
	u13vv9Ppvr1q0cLSGF4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPQ4j-0030cW-6n; Wed, 02 Mar 2022 14:35:33 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPQ4W-0030Yj-Lv; Wed, 02 Mar 2022 14:35:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D54CF1F44E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646231718;
 bh=8MD/q6vToKa+aCUMTtabBugzOlMLPxFtpWBZnt1o7Ig=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KT8JwP+eIhA73Zrb/w0vPcNU77I6YJjXQ8R48YUI3dR54axXZlhKugetbJ6gMEYd1
 yWRJdoUlHOF7CHABqFkFlctkvjiirtm1qV2F2Zrk49i4ugt/JxFGCTXwSCEu2YqKC+
 kU1qDfo1XGQ3RaRxDzyCXGyoXi1jb81CD69J5hPmZN9ShPwybyxeWpOMqd5YydFN07
 T04FWpnHmAD5BivLLO4LJU8pgTGD8aLJKnWkq5owzCKtnfd748gbNdVBoRrz1KJGv8
 h1Stx2tyXnDB5snvTEdAtZcF5QED61gnajKXaUOPgb2OO0yMxkvK4VuFaLG4iTLdso
 VbZ0Vc1BGD/WA==
Message-ID: <60613d10-f7fc-03ea-900f-4255ebe0d5aa@collabora.com>
Date: Wed, 2 Mar 2022 15:35:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v23 0/7] soc: mediatek: SVS: introduce MTK SVS
Content-Language: en-US
To: Roger Lu <roger.lu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin
 <Angus.Lin@mediatek.com>, Mark Rutland <mark.rutland@arm.com>,
 Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Guenter Roeck <linux@roeck-us.net>,
 Jia-wei Chang <jia-wei.chang@mediatek.com>
References: <20220221063939.14969-1-roger.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220221063939.14969-1-roger.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_063520_927250_8968D570 
X-CRM114-Status: GOOD (  14.44  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 21/02/22 07:39, Roger Lu ha scritto:
> The Smart Voltage Scaling(SVS) engine is a piece of hardware
> which calculates suitable SVS bank voltages to OPP voltage table.
> Then, DVFS driver could apply those SVS bank voltages to PMIC/Buck
> when receiving OPP_EVENT_ADJUST_VOLTAGE.
> 
> 1. SVS driver uses OPP adjust event in [1] to update OPP table voltage part.
> 2. SVS driver gets thermal/GPU device by node [2][3] and CPU device by get_cpu_device().
> After retrieving subsys device, SVS driver calls device_link_add() to make sure probe/suspend callback priority.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git/commit/?h=opp/linux-next&id=25cb20a212a1f989385dfe23230817e69c62bee5
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git/commit/?h=opp/linux-next&id=b325ce39785b1408040d90365a6ab1aa36e94f87
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.16-next/dts64&id=a8168cebf1bca1b5269e8a7eb2626fb76814d6e2
> 
> change since v22:
> - Make "svsb_volt = max(svsb->volt[i] + temp_voffset, svsb->vmin);" become one line.
> - Remove voffset read/write commands for better system safety.
> - Add more comments on @turn_freq_base.
> 
> Roger Lu (7):
>    [v23,1/7] dt-bindings: soc: mediatek: add mtk svs dt-bindings
>    [v23,2/7] arm64: dts: mt8183: add svs device information
>    [v23,3/7] soc: mediatek: SVS: introduce MTK SVS engine
>    [v23,4/7] soc: mediatek: SVS: add monitor mode
>    [v23,5/7] soc: mediatek: SVS: add debug commands
>    [v23,6/7] dt-bindings: soc: mediatek: add mt8192 svs dt-bindings
>    [v23,7/7] soc: mediatek: SVS: add mt8192 SVS GPU driver
> 
>   .../bindings/soc/mediatek/mtk-svs.yaml        |   91 +
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   16 +
>   drivers/soc/mediatek/Kconfig                  |   10 +
>   drivers/soc/mediatek/Makefile                 |    1 +
>   drivers/soc/mediatek/mtk-svs.c                | 2398 +++++++++++++++++
>   5 files changed, 2516 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
>   create mode 100644 drivers/soc/mediatek/mtk-svs.c
> 

Hello,
the entire series has got reviews, and this has already reached 23 iterations.
I personally have no more complaints about this one.

Does anyone have any KO comments about this series?

Cheers,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
