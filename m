Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44DCC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 23:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ULYKkoPXl0jx0JUsIbUu7pIcG4mmCQ7QtlHEyCeZtuA=; b=QbsUF7P0MwRvYk
	jZcFpMhw8o4fPrOOupQnmKu08Oi5Ys1GUnBT5Ch36hbKmMJ67Gjn4AsUdlsLgwzp9dwJoDiJgJS6/
	JDNTYqBp//dNzjrQ9h5/icp8ACCEPvMzf0/sivm9lIEoghvB/kw7jPcmtmDfWC7ahSD5I6VFKcktJ
	PWoCJfVe5ohmDB1lAWK2NnDztY3v1P3uV2qJwGX6KlLqOMz4afGgZ62nUIpRla5ErmgpTwrJ5G0ES
	jz+zGPlNIrdxZ5mPL3XWgwjbJ6ctCU5xbhUxMNqpiQiZnhtikff/WYyay9qIWIraw1GkERG6Laqjc
	Xa74kdHkujBgJ72UM+mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhJeh-00ApiS-Vz; Wed, 20 Apr 2022 23:22:40 +0000
Received: from mail-pj1-f48.google.com ([209.85.216.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhJee-00Aph8-Tf
 for linux-mediatek@lists.infradead.org; Wed, 20 Apr 2022 23:22:38 +0000
Received: by mail-pj1-f48.google.com with SMTP id
 i24-20020a17090adc1800b001cd5529465aso6251564pjv.0
 for <linux-mediatek@lists.infradead.org>; Wed, 20 Apr 2022 16:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=fV4JkmrG7edeYR97GeotnP7wPuRJ0USB98sxOGhu5Ko=;
 b=nc5UQun7RX6LMMTHnY7WA869JDbETYGJp0bjqr1qzHGKLpwNWw656cdKreBgTkQHFv
 +KomBgAjgGeNzuOWIOwmcWipToUgQ5usk/e0ii1o80dAwBuFSylnYygTz+k1UcGFFXMj
 hpPLTqdT5wW80TX+f6w+O5H39g7Uz2p5LsmjMCL4VjcOs4T6VjfnPvuSFzvEgoXKGgUi
 funG6xyKMfK+Qq57RtfNICkqPKjrOpBivZNiWp7Ff4/f40RVjul94QvF7ws1ls7bEElT
 sK+AiO4F5oUOcdHMW6TPsRf3Lkdhu1++xoBryeZqAsWh8a3iPrs+oR2waTnTwUgw6W0J
 MGtQ==
X-Gm-Message-State: AOAM530wv2wV0bQfRwOtRivGb+bsd4jEvAdt6mjn7sFkycWRaTN0bNmT
 AQrnPkgrs4jLkhz4+Js/D/bZUQ==
X-Google-Smtp-Source: ABdhPJw1U+sE5q5vVGNJMiWtWbA91DsbiUZKDbDGss51Ta+5DIVK209skvrhfVxxVAgBCnpsiz/S9Q==
X-Received: by 2002:a17:90a:b014:b0:1cb:ba36:8fe1 with SMTP id
 x20-20020a17090ab01400b001cbba368fe1mr7229694pjq.67.1650496954035; 
 Wed, 20 Apr 2022 16:22:34 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.gmail.com with ESMTPSA id
 l13-20020a056a00140d00b004e13da93eaasm21870519pfu.62.2022.04.20.16.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 16:22:33 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Roger Lu <roger.lu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Enric Balletbo Serra <eballetbo@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Fan Chen <fan.chen@mediatek.com>, HenryC Chen
 <HenryC.Chen@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin
 <Angus.Lin@mediatek.com>, Mark Rutland <mark.rutland@arm.com>, Nishanth
 Menon <nm@ti.com>, Roger Lu <roger.lu@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, Guenter Roeck
 <linux@roeck-us.net>, Jia-wei Chang <jia-wei.chang@mediatek.com>
Subject: Re: [PATCH v24 0/7] soc: mediatek: SVS: introduce MTK SVS
In-Reply-To: <20220420102044.10832-1-roger.lu@mediatek.com>
References: <20220420102044.10832-1-roger.lu@mediatek.com>
Date: Wed, 20 Apr 2022 16:22:32 -0700
Message-ID: <7hczhbe3wn.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_162236_995692_C1D024CC 
X-CRM114-Status: GOOD (  13.79  )
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

Hi Roger,


Roger Lu <roger.lu@mediatek.com> writes:

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
> Change since v23:
> - Change wording from "Mediatek" to "MediaTek" (uppercase T) in mtk-svs.yaml.
> - Use cpuidle_pause_and_lock() to prevent system from entering cpuidle instead of applying pm_qos APIs.
> - Add kfree() at the end of svs_probe() when encountering probe fail.
> - Change MODULE_LICENSE from "GPL v2" to "GPL".
> - Add nvmem_cell_put() in error handling when nvmem_cell_read() encounters fail.

I also gave you a reviewed-by on v23, but here it is again:

Reviewed-by: Kevin Hilman <khilman@baylibre.com>


That being said, it would be really nice to see an integration tree
where this was all tested on mainline (e.g. v5.17, or v5.18-rc)

For example, I can apply this to v5.18-rc2 and boot on my mt8183-pumpkin
board, it fails to probe[1] because there is no CCI node in the upstream
mt8183.dtsi.

I'm assuming this series is also not very useful without the CPUfreq
series from Rex, so being able to test this, CCI and CPUfreq together on
MT8183 on a mainline kernel would be very helpful.

Kevin

[1]
[    0.573332] mtk-svs 1100b000.svs: cannot find cci node
[    0.574061] mtk-svs 1100b000.svs: error -ENODEV: svs platform probe fail

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
