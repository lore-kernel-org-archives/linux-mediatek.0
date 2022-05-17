Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9CBC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 10:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yWjMecHuNyLyofF05z9MmIuTEXBOy/gF8VD1HBoD2wk=; b=FDw8IZ3aK6HPdH
	qhtTIMknVsdoGu8DNlS0pFs3m0U52eFp7yi+8ah5BveWajp8DIYJuBlhJ7b7VplwcsHU1NbUCiAoX
	Gi5EKW2A9T0e+cdaTRGpvtgFv1jgDaP+uejjOgoSlwoEus9CoAVjMrO1ku/BxK19+wczY/61nnmMP
	NG5KBtDKH8f4Rd8yBinHylsPQpkltKfpVrN3q/KoCwBkEhU1DYHr/Mf5vjOW+92bzOykd2wufLTTV
	kPPwvInmUCwdNfztHLqE7JnJjtaYhAJWp2GpCurnqADr0S7SnGEOFjev2L76z3aa8iCSCk4kk/IjK
	GswhdQNDfKp6zC3YPFXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqu9E-00Cwmv-G9; Tue, 17 May 2022 10:09:48 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqu8v-00Cwef-3v; Tue, 17 May 2022 10:09:30 +0000
Received: by mail-wr1-x42f.google.com with SMTP id r23so8009949wrr.2;
 Tue, 17 May 2022 03:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=t4zPUKpv7XaTfwCy6u8+Y9X67AplsbkFXvPulu0ea1U=;
 b=aEs+kBHg2LKI6or1oWTOXdLQLX5BKJra6ZJ/JQVkHM6rAssedHYEsM5LLwYPaUnEW1
 Er8hzUj6HM+y4+yiwXyGVakR9K1eW0wFG7ntWYX5PrRIhZBrwU73bj12BVqv7NW1xe73
 rziM/EwhIps3HhQpVH3xaVdy9KwZFJThIxS8WO2QzKsRYwexHJQ5FVMx/yzgcCpRvCX3
 /cEjZ9eofAuUBTLY2ZjgATPazGtrs7j+Kro5NGKhNPAU9Qsj1jj4Xk0gUlM5P2xco1/S
 iWjuFJt8aUKqornzfztDZjF2cIMAHiiJJ4upNIaJSphy/O4g63nrhNzt3IXXaiTJKFZi
 6qgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t4zPUKpv7XaTfwCy6u8+Y9X67AplsbkFXvPulu0ea1U=;
 b=UyY1k2GNXRv1Fc5kSPQfmONcrOnwlCOHPBZGnCMPy2JvenBWcbFP0Vv4xMRUuXynug
 EUaAGKy3zwoEAZbFmWlYeWnjVyGFgkpiOEY9ijBkQET1u5csgbWJsP6FeQsvLbtRFntZ
 zsj6IGiVc6XuI9heNWhLvspUPHNswCR1TytGa31+joe9rFAoeoEdaFas/y6LLm1H4Rdn
 RcXT1L+7TMKjUfTFI2Lam+W/I20JphYQPQwq/a3vsY8EGkJnFqEWmj590WREMc1wjRHz
 z1nHULG2pVgPEteaGUvFeqv/+1gm9jaLzAg9HY61dIETFgbRz5ZW1AEaM//F3z53rt52
 x0lQ==
X-Gm-Message-State: AOAM533CfKg0OaXuzyD5AR9Yd21hiL019CjZCJPlYixC11qYSmwSElA9
 Qi/eUBg0KPrkdNGTMN55b4w=
X-Google-Smtp-Source: ABdhPJzK4FAOgEnNQs53gtSOtT0Y8b5G++nzf2lJHnk/cY7kMsd4pENS/ntIKs/HT0Xr5wKaUtO4JA==
X-Received: by 2002:a5d:6989:0:b0:20d:b25:f5 with SMTP id
 g9-20020a5d6989000000b0020d0b2500f5mr6372658wru.616.1652782167330; 
 Tue, 17 May 2022 03:09:27 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a05600c29c700b003942a244ec2sm1443015wmd.7.2022.05.17.03.09.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 03:09:26 -0700 (PDT)
Message-ID: <3e9f0936-efee-cedf-6e2b-4dd9de79fc4e@gmail.com>
Date: Tue, 17 May 2022 12:09:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v7 0/3] cpufreq: mediatek: Cleanup and support MT8183 and
 MT8186
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: jia-wei.chang@mediatek.com, roger.lu@mediatek.com, hsinyi@google.com,
 khilman@baylibre.com, angelogioacchino.delregno@collabora.com,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220516111130.13325-1-rex-bc.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220516111130.13325-1-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_030929_247972_68C7ECB8 
X-CRM114-Status: GOOD (  17.49  )
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



On 16/05/2022 13:11, Rex-BC Chen wrote:
> Cpufreq is a DVFS driver used for power saving to scale the clock frequency
> and supply the voltage for CPUs. This series do some cleanup for MediaTek
> cpufreq drivers and add support for MediaTek SVS[2] and MediaTek CCI
> devfreq[3] which are supported in MT8183 and MT8186.
> 

Series applied to v5.19-next/dts64

Thanks!

> Changes for v7:
> 1. Drop all drviers patches because they are all accepted.
> 2. Correct clock/clock-name for cci in dts.
> 
> Changes for v6:
> 1. Reorder patches in this series.
> 2. Add a new patch to do unregister platform device.
> 3. Modify drivers from maintainer's advice.
> 
> Reference series:
> [1]: V1 of this series is present by Jia-Wei Chang.
>       https://lore.kernel.org/all/20220307122151.11666-1-jia-wei.chang@mediatek.com/
> 
> [2]: The MediaTek CCI devfreq driver is introduced in another series.
>       https://lore.kernel.org/all/20220425125546.4129-1-johnson.wang@mediatek.com/
> 
> [3]: The MediaTek SVS driver is introduced in another series.
>       https://lore.kernel.org/all/20220420102044.10832-1-roger.lu@mediatek.com/
> 
> Rex-BC Chen (3):
>    arm64: dts: mediatek: Add opp table and clock property for MT8183
>      cpufreq
>    arm64: dts: mediatek: Add MediaTek CCI node for MT8183
>    arm64: dts: mediatek: Add mediatek,cci property for MT8183 cpufreq
> 
>   arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |  36 +++
>   .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   4 +
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 286 ++++++++++++++++++
>   3 files changed, 326 insertions(+)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
