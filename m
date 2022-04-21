Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A0AC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 00:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=scHY1IdedNQfLOQ+ot2Wb8BbAFrESjALZc8nsFzLAx0=; b=Xh6aVck6LxjTM/
	IZftldrU6adp660TeAoiAAgOM8CHNuSCl14HuM3fVULRawEj6TF97Huoha8xUkUzCjDPoSSv8glpi
	2hEYyjVInHF+nB8l93XZHqfb2lk2+6tHb4GMHxrSHgsZwz91NfnPmGjIWH9/uGJaw6U9h2r2Fi7NM
	U/AO3Yn28vuYR/eT2icFaAeObDt39TwZ4C9Y49lEZZzb8JUWitsHadH/O9sY0In8sFNoNAqlROZo8
	S53jaS502J8rugvj4OLZlgj9vq9Gz+jOWAanJ3jkQ/mvyim76V8rLdEaVcol1NOod1EtN9puzw6kb
	mHsn7yjwhTiNCbiyR1hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhKLQ-00AwIA-Hw; Thu, 21 Apr 2022 00:06:48 +0000
Received: from mail-pg1-f172.google.com ([209.85.215.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhKLE-00AwEv-R0
 for linux-mediatek@lists.infradead.org; Thu, 21 Apr 2022 00:06:38 +0000
Received: by mail-pg1-f172.google.com with SMTP id t4so3211327pgc.1
 for <linux-mediatek@lists.infradead.org>; Wed, 20 Apr 2022 17:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=IfHap1dlOBr5gDAC0VqPSKp2nHM5B6kQ59uiY70TBVI=;
 b=13Wz+EZK+tgqv4O4+VmoOSNOYN9c4dvCCIKuFRWchiWbNtnfOAvBcElyAv61hsYJQf
 usO/QPGSVKVv8gkDghmzqZ5ysTAE5jWURLmbEkKQcLWsOtIJvqaPfCBTaY4RIOHvcroE
 4jl1CQNzOOfDk5hNQkLwPGwViOy+9WnI4eflOQ4erGVNAC+NuK1nyOItkZyKvWIuBAAu
 ieqXT8/lAK9Pi9Vx1loepb+0S2bw4Jo24dfvjAmgIi+PHeX9uT7re62JsK4ltiniJiOc
 8lxn03aOusAcTvNQmZvfPKhlv8GIAJbW4ShoVLhFCCR4v82dxYlyGGx0/SxPOgk2ouXW
 usLg==
X-Gm-Message-State: AOAM53106B5kj3oGhJDrMCGhufbnFEgs60F/4yWtJuRgOU7d4r0muw9C
 AStBgaYvoD3xOSiZfCED8R/fYw==
X-Google-Smtp-Source: ABdhPJyBccHfNaH1A30eRpDRBC9j4Q7GiILCDsil3xPBkNRkvmISVOA5FX0e7H26MH7xr/3847BX1w==
X-Received: by 2002:a05:6a00:1ac8:b0:4fa:917f:c1aa with SMTP id
 f8-20020a056a001ac800b004fa917fc1aamr26016985pfv.2.1650499594990; 
 Wed, 20 Apr 2022 17:06:34 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.gmail.com with ESMTPSA id
 u10-20020a62d44a000000b0050ad4053840sm639105pfl.149.2022.04.20.17.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 17:06:33 -0700 (PDT)
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
Subject: Re: [PATCH v24 3/7] soc: mediatek: SVS: introduce MTK SVS engine
In-Reply-To: <20220420102044.10832-4-roger.lu@mediatek.com>
References: <20220420102044.10832-1-roger.lu@mediatek.com>
 <20220420102044.10832-4-roger.lu@mediatek.com>
Date: Wed, 20 Apr 2022 17:06:33 -0700
Message-ID: <7h5yn3s3jq.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_170636_916691_B8D3291F 
X-CRM114-Status: GOOD (  11.53  )
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
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Can SVS work with one or the other clusters disabled?  It seems like it
should still be able to work.  However, if you disable the 2nd cluster
(e.g. by passing `maxcpus=4` on the kernel command-line, the SVS driver
will fail to probe.

I dont' think it's a blocker for merging this series, but making the
probe a bit more robust so it can handle the cluster being disabled
would be nice additional fix for later.

For example, upstream kernel on mt8183-pumpkin board is very unstable
with the 2nd cluster enabled (I'm still trying to debug why), but I have
to boot with `maxcpus=4` on the cmdline, otherwise kernel fails to boot,
so that's how I noticed this probe failure with SVS.

Kevin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
