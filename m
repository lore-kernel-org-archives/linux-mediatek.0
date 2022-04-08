Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D1AC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 20:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpB/mbEWXA4eHn2IHQCMCKMGZxqDq5lSGC4u5Ls1EaE=; b=FVM1f8KHGnDd9b
	n8eSkO6GiN13Eaogp63cq5Kuk2cFvnhZP2kg2QB49HhRZj7hj97myPgRE1lez7rn+p0axSK3auZX1
	0GpC91WGnQy3MxB97CC23hJnSwXd9tGgt7isxHYQX6VL9GFlU7i1Xl/ZyDBdi9j4C3B5wLawpa/PE
	LBBdtanch9Vc8e4k/9rLfk8RBN88d8psuKbdnSAW2U42bycLZdXLdtlnUYCEWaMdAs7l59Dc2IA3A
	deS8HfFvHvrrzLyRd3SZt4i6f+W9uAbJLVhmsc1z7I/Hr5erPAqQ7kGQ/i+whvP64nbjk11PWCCxA
	13TIGmF4qEyf/gxWj1XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncvEV-001C05-50; Fri, 08 Apr 2022 20:29:27 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncvEH-001BxJ-Nh
 for linux-mediatek@lists.infradead.org; Fri, 08 Apr 2022 20:29:16 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 2so9664070pjw.2
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Apr 2022 13:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=HD9KWxYgHovL4d+swYpmuaTcGaPIaYm36t/rSV4RSvg=;
 b=Q0KeoqDnCa8t9t7sVZPbYG3qKLWKWSwjPdVPsqLNyYAIkNInfvFrnib1WBJF0cFwPV
 cS88dBGtsAWScifpLSaO+kVpUGO8xGswNZgPNdhGOFmClE5dE1T/mSRm+cmRZvX03LET
 vP9besdhVUGIMppcb/yOkqKHoE8YUfnOTbgL48zbFm+MKrKJlL59Z62zG0lP5qZKbd8C
 P8ZQUoDvx7UGRpcUIa7VokvDC02Y2wGLGOTj7/BGPLKFLWg/j4a4j3DqqtljU//u7sps
 iKvkuYkzerCCmTAseaxt4wrz8EffCcexE6DaU0McLwY4AdgJaXXMFUzw3XUhZEHLN3IZ
 sYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=HD9KWxYgHovL4d+swYpmuaTcGaPIaYm36t/rSV4RSvg=;
 b=5mAFE4O/3T/vJTP4kpzzUZhSy1dH5oD2AZtW/Gmw1DJCFOPK44FfAzX9kv0zWt8eMn
 NkoxEwE/1dlxz+7Tgf499L3OfqGTC5ro9k1U+nGv9GhClOc4pvU4QJq9KPaOfjKa55gk
 //0h1UOBsYPQy9KPus9okkpeSIgaqEI8FqhduJB2i/+3AMP8LxmvPPNPbgqgmbwvINz0
 tmSgVF6MxFgU3RKcQwEG5qIIQZfx7iNhs1AnG+Sa8qmq+nMNlLuxNwWddambnTqTe9vy
 vB6jDbS1g5GwqmNSUWwpXbWddRekT2T/rJqTLCXOXxJvpo9ORWgwY7+cCNu61slQxPBz
 Chzg==
X-Gm-Message-State: AOAM530SlaCG6MOvBhoZU7iCR3WxjNdn7oZhbHNpMzBG4tyGlfYb9BOy
 c4++Lyl7CB4jpR8ChyzLe/XKwA==
X-Google-Smtp-Source: ABdhPJz1t8RKOgx1OockyWLTtqK9N64BneuYukw0ht7tEOMRQDgSerOayaO2vT0LBXJsp4/C/ABSyw==
X-Received: by 2002:a17:90b:4f8e:b0:1c7:3652:21bc with SMTP id
 qe14-20020a17090b4f8e00b001c7365221bcmr23626082pjb.38.1649449751645; 
 Fri, 08 Apr 2022 13:29:11 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.gmail.com with ESMTPSA id
 x8-20020aa784c8000000b0050577c51d38sm3849034pfn.20.2022.04.08.13.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 13:29:11 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, "Andrew-sh.Cheng"
 <andrew-sh.cheng@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH V2 07/15] cpufreq: mediatek: Add opp notification for
 SVS support
In-Reply-To: <20220408045908.21671-8-rex-bc.chen@mediatek.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-8-rex-bc.chen@mediatek.com>
Date: Fri, 08 Apr 2022 13:29:10 -0700
Message-ID: <7hsfqn5nft.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_132913_999533_773E1C53 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

Rex-BC Chen <rex-bc.chen@mediatek.com> writes:

> From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
>
> The Smart Voltage Scaling (SVS) is a hardware which calculates suitable
> SVS bank voltages to OPP voltage table.
>
> When the SVS is enabled, cpufreq should listen to opp notification and do
> proper actions when receiving events of disable and voltage adjustment.

So listenting for OPP notifications should be done only when SVS is enabled...

[...]

>  static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
>  {
>  	struct device *cpu_dev;
> @@ -392,6 +455,17 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
>  	info->intermediate_voltage = dev_pm_opp_get_voltage(opp);
>  	dev_pm_opp_put(opp);
>  
> +	info->opp_cpu = cpu;
> +	info->opp_nb.notifier_call = mtk_cpufreq_opp_notifier;
> +	ret = dev_pm_opp_register_notifier(cpu_dev, &info->opp_nb);

...but here youlisten to OPP notifications unconditionally.  Seems there
should be a check whether SVS is enabled before deciding to register.

Kevin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
