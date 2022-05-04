Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82869C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 08:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B0Ii99+1fea6RnvVpOxbbb0Y79DhdMBkXnkBq09rJww=; b=tlkVavceHvT+Nm
	eYQJqPcAqD/KBmCVJ/wjYoNZu0c9qxv28k+eimuclenE6ZIff4SD9ECCZvtCX2sDzoXetzTYVIcim
	+RmgrUMd5DW1lrs4EgWUV2wEVlIN5Mgk5B/zhDBSyV5UtKFjOHm9DlZsuy/xK4n5yxTNTqSShGr8D
	53ahh9BX4+2llTByTWc/V3yu1wLafTSxQLuAAjnURwfh/FOXIj7OomfeGhocpLmUD/X0U5PJU/oB6
	VQ4K9NAPJy5YLehg+vhXt2DaCTVy+47bNUG4B1UhxRsyJZE4SRsUHDny+YA51/7SoQ73W06m9UmO+
	UjirQweiLL9FqrDOuaDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmAHf-009V1Y-BW; Wed, 04 May 2022 08:22:55 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmAHc-009UzN-NJ
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 08:22:54 +0000
Received: by mail-pf1-x42a.google.com with SMTP id z16so594353pfh.3
 for <linux-mediatek@lists.infradead.org>; Wed, 04 May 2022 01:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SdK0VTClXf0YNc37VM3s8fuaeXHi8SET3pp3ZISSadQ=;
 b=kI3XGnNupu3SzP3j+gsgoUyARk2Wrt2S+bwMeFoftnnsUUT/IKfAPwJBbymvvv7sKI
 MtZiTor/k7fZWZr/pOd91PQ32xe8gk7O8UluhjaoD80iCQq5KR0ElvLOv/+jc5Sk3mTp
 f97GhVWt/tC5JoVDdHJkcpwOFJU+HmA1gUkCOkTFU/nEj4A1jik9+4unIxwkoLU3AM4U
 sB9N2gr+d+eo/1Yc/QkRtRvFlPcxYxsL1WUXNERbUCluf9OeiK43keT2zDGB8ybGKtnJ
 dxk67XdrwEwuYFABcrd90pMCJDxKfIwcmp0BVvmdZgG32cqOH4V+rcUsOte9Mo8V12Mb
 xaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SdK0VTClXf0YNc37VM3s8fuaeXHi8SET3pp3ZISSadQ=;
 b=iljF6/1FV4S6/sANWHW+dSk3ElJDMuOWN1XSmKg/oVNqgH98JHgK4QcK/nh/g7sKXo
 b+Tewth/mF+nkwGpH4mVKzHlMdL0qghG/bFDIdalWj57PEfhTe/ejkat00AIWI7+NpDr
 dWCy1FYT+DHHYM85gK1bUwrd78CYWL8c1Arlf5C4KLqsZ9fBVxSzP1q+Jhym2J5L17zc
 MCYilwcS368JfMT2dAckC8QVd5YMnxb3SssP8TT/ak6q/WGnMRg6rREXi8deMVE1S4kS
 CsohJNn9QseYkcBraJN6Q00iXGAJrDGAZbIvXsnc7ePgzMIG1I1i774tBNggW4H+VF30
 JQmw==
X-Gm-Message-State: AOAM532IRnqkNpwko9MjwEsKH/K5+qMNlOnv0Tu5rMzgGxOyIWlZIucE
 0KeZYF7qaGU8q4QewOAbCNxqiA==
X-Google-Smtp-Source: ABdhPJwfha0ZWyhE1MyC7JONGEsucCB5kCwPDXSeGpREJK9mLcP9oTgoHlBBtf6lTMLv8gsdZ0zvRQ==
X-Received: by 2002:aa7:82d9:0:b0:4fa:2c7f:41e with SMTP id
 f25-20020aa782d9000000b004fa2c7f041emr20107812pfn.1.1651652571708; 
 Wed, 04 May 2022 01:22:51 -0700 (PDT)
Received: from localhost ([122.162.207.161]) by smtp.gmail.com with ESMTPSA id
 az12-20020a170902a58c00b0015e8d4eb27esm7653617plb.200.2022.05.04.01.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 01:22:51 -0700 (PDT)
Date: Wed, 4 May 2022 13:52:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: rafael@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, khilman@baylibre.com,
 angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH V4 07/14] cpufreq: mediatek: Add .get function
Message-ID: <20220504082249.anrvkf2ssbxyzz5m@vireshk-i7>
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <20220422075239.16437-8-rex-bc.chen@mediatek.com>
 <20220425053548.72w2jh2g6lpzgz6g@vireshk-i7>
 <64c690e8edf493ec0a4a14e0fdaad2d8e88e6da7.camel@mediatek.com>
 <20220425100058.4kbvmpi63ygni6k5@vireshk-i7>
 <078b1f9b39690da98cbd3c4528ba28374a097083.camel@mediatek.com>
 <20220427031141.or2owu5wrh2cadfo@vireshk-i7>
 <346736a339bed576817179ded3795d61f71fa06a.camel@mediatek.com>
 <20220428114835.3ktimyz2tzzqdcbg@vireshk-i7>
 <27a5dddd91b3dcbd69f08c10108cdec808237ace.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <27a5dddd91b3dcbd69f08c10108cdec808237ace.camel@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_012252_785743_34CFEFB7 
X-CRM114-Status: UNSURE (   9.02  )
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

On 03-05-22, 19:33, Rex-BC Chen wrote:
> Our observation tells us cpufreq_online is setting only once at boot
> for one cpu cluster.
> But we can see the problem repeatly occurs once cpufreq_get is invoked.
> 
> e.g.
> [ 71.154560] cpufreq: Warning: CPU frequency out of sync: cpufreq and
> timing core thinks of 500000, is 499999 kHz
> [ 71.155880] cpufreq: notification 0 of frequency transition to 499999
> kHz
> [ 71.156777] cpufreq: notification 1 of frequency transition to 499999
> kHz
> [ 71.187241] cpufreq: target for CPU 0: 500000 kHz, relation 0,
> requested 500000 kHz
> [ 71.188246] cpufreq: target_freq/policy->cur: 500000/499999 kHz

Lemme know if this helps:

https://lore.kernel.org/lkml/39e39a7d30c8ee6af81fb64670a330abeb87402e.1651652493.git.viresh.kumar@linaro.org/

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
