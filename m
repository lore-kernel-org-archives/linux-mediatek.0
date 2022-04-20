Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0F5C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 18:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zvMq/tcvv2KPvG7siWzXrS6nKvru98LofO9gq2sCRcA=; b=Y0Ijtmx+FDqm7c
	6JxZwL9cHm7oCoBXVqz3l9jCEh/A7vrZLbc+0DLOrIoUZKAwsVr2xyt3kGrNo5aZSkhlVmoRTNk5R
	q6L993XtE/H4fauCadHlQ1ikXJ2upM/Co8nKfRJQYDrohAUCJvsrxiVW/qDKiQTU+Kl0ikVkcj8ZW
	4P3nZOmtUZmRo7YiGrpR3LfgyY3mHrg+r7xbTKvF/m4Z42oA3OrfMdi5bvjYOGMZelKDDfzlO9qZf
	Vh9YOQInSO1vfU+/XMwaG0VuvbFKs0ugFsa878H5RyTtkKwItikWtAsdJRL0fOgEvZ4I1RVeyyurg
	OonXj4kzvvF7W6FNpnug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhEmM-00A1TQ-0H; Wed, 20 Apr 2022 18:10:14 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhEmC-00A1RJ-Bn
 for linux-mediatek@lists.infradead.org; Wed, 20 Apr 2022 18:10:05 +0000
Received: by mail-pg1-x535.google.com with SMTP id x191so2338042pgd.4
 for <linux-mediatek@lists.infradead.org>; Wed, 20 Apr 2022 11:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=XaJY3EGAz8IrKktJ7jqA438SOYFnRuWQecgSNO+leBU=;
 b=6whRglUKuXephhd6SgaPhbA1evrYCdAON/20A5S1FZvtkfDJdh3JTWCwkEf1CkkFEn
 6A4XUPmM+ZvhiQnACXBxVvDutFmvnYnxjpIJk0guG/ywg6hUg+tt0ndE28xvR0SvdeSS
 AiMxmzDLcIWD3mhUVXtbQwXeAwiDLiO8hYC++cz7QJxUR4kE1C7akRCoKBdffeF26CAA
 yzIqO3yN8DaK/3T6M5u342oteB/TXx8slbO1S5tFzlMlVj/+9D9TYKIDJX2Bce0u3St4
 iA+UHj8ON91PN+Nz7cDdxPBuvJGvMz5l12EBljdN6SEAzE3S5z0NLu9PyiPkutueGQBv
 SwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=XaJY3EGAz8IrKktJ7jqA438SOYFnRuWQecgSNO+leBU=;
 b=pbRUw8DrOz8ZstoTQJg7Smv6ku57DGlG/qZTnpeWmKKM6Iz7C7oSwHAPxDWiVGU6mF
 RM3WRwLHPZqj7X4j0T4tthI/ALdlo8sjYT1+642Mc2r/vdQEsX0nQ6bc7CL/WNyUKYd9
 PnViXil4k90ZU6yPrbN176hjbad4Ut07sMtcizeFs+jP2XV6xJHyjB9ZurIWBn+Y3Uca
 wgk1Vi/83Mouk+x9+UaT3ubjMv81TvsJ5kNWLgVE6tlNPKZt4NGAWfGgwqx4+v3bhV5q
 uBR3gjU7i3mkactskGASfqk4kYlHyNknjic+Dikpu/QxLxZhQczOnyUab4ZcP0Cz1Bg0
 kelw==
X-Gm-Message-State: AOAM530RVfYzCR33chcYooEOg3tNfe1SnGhffntADrXPWG2iQeHfo3ZA
 GBvdMvlniKd557MNSBLKFqkB3Q==
X-Google-Smtp-Source: ABdhPJyXMqgKR4UfzMmgODjJ0nqV/iezghtHQLHP5i9ubbX8iLWYJ9p/TXuwbBQV0KOTr/z5WohRsw==
X-Received: by 2002:a63:c008:0:b0:3a2:4b:ab0a with SMTP id
 h8-20020a63c008000000b003a2004bab0amr20287450pgg.588.1650478200471; 
 Wed, 20 Apr 2022 11:10:00 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.gmail.com with ESMTPSA id
 g1-20020a633741000000b0039958c06c53sm20024838pgn.61.2022.04.20.11.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:10:00 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: jia-wei.chang@mediatek.com, roger.lu@mediatek.com, hsinyi@google.com,
 angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH V3 11/15] cpufreq: mediatek: Link CCI device to CPU
In-Reply-To: <20220415055916.28350-12-rex-bc.chen@mediatek.com>
References: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
 <20220415055916.28350-12-rex-bc.chen@mediatek.com>
Date: Wed, 20 Apr 2022 11:09:59 -0700
Message-ID: <7hv8v3eidk.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_111004_454027_71ACA7CE 
X-CRM114-Status: GOOD (  10.08  )
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

Hi Rex,

Rex-BC Chen <rex-bc.chen@mediatek.com> writes:

> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
>
> In some MediaTek SoCs, like MT8183, CPU and CCI share the same power
> supplies. Cpufreq needs to check if CCI devfreq exists and wait until
> CCI devfreq ready before scaling frequency.
>
> Before CCI devfreq is ready, we record the voltage when booting to
> kernel and use the max(cpu target voltage, booting voltage) to
> prevent cpufreq adjust to the lower voltage which will cause the CCI
> crash because of high frequency and low voltage.
>
> - Add is_ccifreq_ready() to link CCI device to CPI, and CPU will start
>   DVFS when CCI is ready.
> - Add platform data for MT8183.
>
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

The solution of keeping the max of the CPU voltage from OPP and boot-up
voltage makes sense until CCI is ready.  Thank you for the rework and
the detailed technical explanations.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Kevin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
