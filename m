Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3D9C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 06:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YnYyqZeZjF276AMJIICthjCfaGRMU69OPzzPWULvvb4=; b=Zj2xGM++Hs8OUd
	m4ojlrjD0E7fBE/mcaOwyssihViLa9c4laiv1fbGvSdjfsNz0DQtHk7BiZ02QEIF35Rno3FIx7fZ8
	twcpvYZAwEZSfT+ZNwtLAWou7wM8u/dupyiDridsGzTvziuXfw8Bf751twp2S2j1/Hcnn/wfxAMBD
	6j7iIpkespvoCkQiZFykx60mKrUkSp2OSMDPqyyic2wr32gLY/ikqRq2BbtrQVFWvtP94nztLvzHh
	IiKEGGsdBEH2C0b5DnGSbH+pPU7FIL79R3ao/VVzJ9BomxObf+wDQUs1vP2msGqmidltPGKbUcqRg
	7UbwnJeL4M8ys5yuiIcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfFWC-0091LI-RA; Fri, 15 Apr 2022 06:33:20 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfFEU-008v9z-Dh
 for linux-mediatek@lists.infradead.org; Fri, 15 Apr 2022 06:15:04 +0000
Received: by mail-il1-x133.google.com with SMTP id y5so4388139ilg.4
 for <linux-mediatek@lists.infradead.org>; Thu, 14 Apr 2022 23:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QmEp/mMGdmvE393WWBsKkqLvzhV/lIHVVl2pgkJlWKw=;
 b=Ea5b0mKvenPORYSnxIMfP0qRj7CZ1UXeFgpAe5H/W2rXWzn5F9X8ulED/rqpBJluHo
 geM986PtAN2iggf05Gn1CU+7BD6TKXfzir94MtF1E1pVyPZ50vBL+UDJupZ8Ay3xt0/b
 XqJbGSC7k3t+1eJfmSGsNwer1Q1S0udoyi55O2188QJUYfJjchKJ4XI4eDaS43x/yDKS
 fpCns2xJA7mc6IKkJBmZeA0Lc0FdqOFD3PidE4WUjwKG4bCTczjFs68+iVn0/Yq1mkvt
 JiEqzzI9R/HNlQXKwM2Sv2aAMATrwNR4+eoqj++55rCTlOBbvd0QaJfb31LYTKeVs4XP
 +6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QmEp/mMGdmvE393WWBsKkqLvzhV/lIHVVl2pgkJlWKw=;
 b=hnkqUG8u4hmh3glynfC/wDsLiD9LiKLH49eG5DvsfsZsB8/9aHob7SLLUyL60rQOZx
 hWfqMvsJfz4jUfBjz1gUe2V+GCGocK3ARdR5W3GW9h0MejiOnL3fgKmOniMiP43z7ZnX
 kWe83K33/mLkzuz6+wTIz7NnnsXPDm66MOgZrIgyIMP7d9umS0VyoLOBLLkj1ZmP9I8K
 xBprf0CLLHHn2uBCSJ033xOnjgks1iFT+gIR1p6+GDSgyNxvSJUq5N4onz3yv8u09/cR
 1yh/K5xBlgkFYP/KmVP/up0oi36G3H0D5swARFpbOlerKGZWor96IQfMW0LfIQPGKc0F
 pe0A==
X-Gm-Message-State: AOAM532EdLi41k4tPS+7eVdK+lXkKbAjEIkPKC7W6ps3RYwTarm9mnhO
 jaBj8oXHdjFp+pbtnAadZM/HayeUxTMJpfTJejleZw==
X-Google-Smtp-Source: ABdhPJwcLVQCaKCPBevFx2nnK/pH8pbVZF8DcOsfzTmPQwBuqON2D1SO/RpJYvdJAlXbD/we/fGnqSHI6X1Xd9LlmcM=
X-Received: by 2002:a92:cdad:0:b0:2c6:7b76:a086 with SMTP id
 g13-20020a92cdad000000b002c67b76a086mr2742492ild.5.1650003300783; Thu, 14 Apr
 2022 23:15:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
 <20220415055916.28350-11-rex-bc.chen@mediatek.com>
In-Reply-To: <20220415055916.28350-11-rex-bc.chen@mediatek.com>
From: Hsin-Yi Wang <hsinyi@google.com>
Date: Fri, 15 Apr 2022 14:14:34 +0800
Message-ID: <CACb=7PXykpUgZ+QG93Bd-vWstq2V-k6G0zTg+D1q2WchJHPbig@mail.gmail.com>
Subject: Re: [PATCH V3 10/15] cpufreq: mediatek: Add counter to prevent
 infinite loop when tracking voltage
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: rafael@kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, krzk+dt@kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tim Chang <jia-wei.chang@mediatek.com>, 
 roger.lu@mediatek.com, Kevin Hilman <khilman@baylibre.com>, 
 angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_231502_549066_E940F5B3 
X-CRM114-Status: GOOD (  20.21  )
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

On Fri, Apr 15, 2022 at 1:59 PM Rex-BC Chen <rex-bc.chen@mediatek.com> wrote:
>
> To prevent infinite loop when tracking voltage, we calculate the maximum
> value for each platform data.
> We assume min voltage is 0 and tracking target voltage using
> min_volt_shift for each iteration.
> The retry_max is 3 times of expeted iteration count.
>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index cc44a7a9427a..d4c00237e862 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -86,6 +86,16 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
>         struct regulator *proc_reg = info->proc_reg;
>         struct regulator *sram_reg = info->sram_reg;
>         int pre_vproc, pre_vsram, new_vsram, vsram, vproc, ret;
> +       int retry_max;
> +
> +       /*
> +        * We assume min voltage is 0 and tracking target voltage using
> +        * min_volt_shift for each iteration.
> +        * The retry_max is 3 times of expeted iteration count.
> +        */
> +       retry_max = 3 * DIV_ROUND_UP(max(info->soc_data->sram_max_volt,
> +                                        info->soc_data->proc_max_volt),
> +                                    info->soc_data->min_volt_shift);

mtk_cpufreq_voltage_tracking() will be called very frequently.
retry_max is the same every time mtk_cpufreq_voltage_tracking() is
called. Is it better to calculate before and store in
mtk_cpu_dvfs_info?

>
>         pre_vproc = regulator_get_voltage(proc_reg);
>         if (pre_vproc < 0) {
> @@ -151,6 +161,12 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
>
>                 pre_vproc = vproc;
>                 pre_vsram = vsram;
> +
> +               if (--retry_max < 0) {
> +                       dev_err(info->cpu_dev,
> +                               "over loop count, failed to set voltage\n");
> +                       return -EINVAL;
> +               }
>         } while (vproc != new_vproc || vsram != new_vsram);
>
>         return 0;
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
