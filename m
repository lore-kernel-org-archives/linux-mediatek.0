Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756A0C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 16:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U38Q/fCeXyPAElR4Xpo9bm5XmCOzb/31meqjGRE3cxA=; b=AgtSNkSOtOWGZq
	GVGJ6YTgNFqDA/T8BoSAqsEKNUq04PBagOjMfs8flePYRnVuOKdZLkRljjf8Kx2QEJ4a5qLciqjC/
	+tAztxnlQsV5oR+D7wmMCRZXgnfHkYL6NxSezQB8lz4Txcs6AV66io89yYfvWrGcfb2dAoqMYyJVu
	v61vsRvSMQ8wDvIaUJIw6/jx4Z4QMcUlPAvnQKesm3SzpuhHvvUs4Sj7SWPAFEqOR0ieepgHmt2eu
	QpOO37zJGs5IPGE/KNq4Wgc0nfEsHa4LbY2oSMuKEJ75SWUV8kMLY0CIINyeNYKWBHqlI8RbRhB7c
	7Ni8CYUaBLoHXH8/H14Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVFlq-002R4o-7T; Fri, 18 Mar 2022 16:48:10 +0000
Received: from mail-pg1-f182.google.com ([209.85.215.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVFlm-002R3q-Dp
 for linux-mediatek@lists.infradead.org; Fri, 18 Mar 2022 16:48:08 +0000
Received: by mail-pg1-f182.google.com with SMTP id e6so5419325pgn.2
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Mar 2022 09:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=UiwMNQAcJybAKewEM0dZcEYqnf9WKLLDT9V2nDkKi3Y=;
 b=XlmX96QLo4lYHBUfVNxxjUprVgWnQsOLNglJc1TVpnk0CTLuHQqFfhVgBvTybxKGY2
 S83mjtrdka/vlcsTRu8A9eiwKPqcoLjSUSEHRAjo1CgYf3xR3Mfz4PqcR8yKqhyvm9GU
 RIWSQPn3TcO0yO4c8Xf1VRP5DYhSCDEglvk3o7kvuBd6H+FL50fJz1GL/oSRANV5oniH
 BUVkPWnHhjdcq6JdDq+LDYUq5trGroFSYy6Rs+3DzIF6NCHJA3r9Uoj03lZQxyEmYz9r
 xlQvvRW5W9WduWDIzSzOXXPVXZKphbsLyNS37v0tRSmfrg831InfblLnujKi1RgOXPo3
 zJ0A==
X-Gm-Message-State: AOAM531N5/XgjyxFLXunm98bGYA/KNfEg22LvXsD5owbFQhzOUtdqE5n
 Vd4mGxiLUcQj2Qd/+PSJmbPCLQ==
X-Google-Smtp-Source: ABdhPJwwVK19S8VwNYG9iLz/w3CUg34rZ/2OYsNz+NiHLrH99YHMdqQhKsiphPx4pIEeAHDV0b6ogQ==
X-Received: by 2002:a63:7b57:0:b0:382:2edd:fcc4 with SMTP id
 k23-20020a637b57000000b003822eddfcc4mr2914667pgn.559.1647622084331; 
 Fri, 18 Mar 2022 09:48:04 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.gmail.com with ESMTPSA id
 oa12-20020a17090b1bcc00b001bf430c3909sm13497665pjb.32.2022.03.18.09.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 09:48:03 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Roger Lu <roger.lu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Enric Balletbo Serra <eballetbo@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Fan Chen <fan.chen@mediatek.com>, HenryC Chen
 <HenryC.Chen@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin
 <Angus.Lin@mediatek.com>, Mark Rutland <mark.rutland@arm.com>, Nishanth
 Menon <nm@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, Guenter Roeck
 <linux@roeck-us.net>, Jia-wei Chang <jia-wei.chang@mediatek.com>
Subject: Re: [PATCH v23 0/7] soc: mediatek: SVS: introduce MTK SVS
In-Reply-To: <60613d10-f7fc-03ea-900f-4255ebe0d5aa@collabora.com>
References: <20220221063939.14969-1-roger.lu@mediatek.com>
 <60613d10-f7fc-03ea-900f-4255ebe0d5aa@collabora.com>
Date: Fri, 18 Mar 2022 09:48:02 -0700
Message-ID: <7hlex7p5q5.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_094806_512052_CAAA63C7 
X-CRM114-Status: GOOD (  14.96  )
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

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
writes:

> Il 21/02/22 07:39, Roger Lu ha scritto:
>> The Smart Voltage Scaling(SVS) engine is a piece of hardware
>> which calculates suitable SVS bank voltages to OPP voltage table.
>> Then, DVFS driver could apply those SVS bank voltages to PMIC/Buck
>> when receiving OPP_EVENT_ADJUST_VOLTAGE.
>> 
>> 1. SVS driver uses OPP adjust event in [1] to update OPP table voltage part.
>> 2. SVS driver gets thermal/GPU device by node [2][3] and CPU device by get_cpu_device().
>> After retrieving subsys device, SVS driver calls device_link_add() to make sure probe/suspend callback priority.
>> 
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git/commit/?h=opp/linux-next&id=25cb20a212a1f989385dfe23230817e69c62bee5
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git/commit/?h=opp/linux-next&id=b325ce39785b1408040d90365a6ab1aa36e94f87
>> [3] https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.16-next/dts64&id=a8168cebf1bca1b5269e8a7eb2626fb76814d6e2
>> 
>> change since v22:
>> - Make "svsb_volt = max(svsb->volt[i] + temp_voffset, svsb->vmin);" become one line.
>> - Remove voffset read/write commands for better system safety.
>> - Add more comments on @turn_freq_base.
>> 
>> Roger Lu (7):
>>    [v23,1/7] dt-bindings: soc: mediatek: add mtk svs dt-bindings
>>    [v23,2/7] arm64: dts: mt8183: add svs device information
>>    [v23,3/7] soc: mediatek: SVS: introduce MTK SVS engine
>>    [v23,4/7] soc: mediatek: SVS: add monitor mode
>>    [v23,5/7] soc: mediatek: SVS: add debug commands
>>    [v23,6/7] dt-bindings: soc: mediatek: add mt8192 svs dt-bindings
>>    [v23,7/7] soc: mediatek: SVS: add mt8192 SVS GPU driver
>> 
>>   .../bindings/soc/mediatek/mtk-svs.yaml        |   91 +
>>   arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   16 +
>>   drivers/soc/mediatek/Kconfig                  |   10 +
>>   drivers/soc/mediatek/Makefile                 |    1 +
>>   drivers/soc/mediatek/mtk-svs.c                | 2398 +++++++++++++++++
>>   5 files changed, 2516 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
>>   create mode 100644 drivers/soc/mediatek/mtk-svs.c
>> 
>
> Hello,
> the entire series has got reviews, and this has already reached 23 iterations.
> I personally have no more complaints about this one.
>
> Does anyone have any KO comments about this series?

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

I haven't reviewed closely since much earlier versions, but reviewing it
again now, I think this series is in good shape now.  Thank you Angelo
for all of your detailed reviews.

Also thank you Roger for your persistence and dedication on getting this
feature upstream.  It has been a long road, but you've stuck with it.

Kevin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
