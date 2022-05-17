Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EB2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 10:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xE5E8Y/3ZDi4FLln0rWLeqtwXn1f5AyL6+uNzEOGo04=; b=i5hT7/zWOfTQWe
	fsvaz3ZPjX5f9JBPnXlD3V6APuHQ6mc90jn3pOERaIhDFj+NelH5FZEnwmgbmSxDSs4h0c6E3cE8W
	NlKE+och8gm5fzCkh4Jwb98yY5ZLiKZiI9t5hdkmDDIx4WlbBayogWqAwTD8owosOgpRouGsfX1I/
	5YkApMztT/isksILXsoFAvMNGDCGDe3G315lnvQV4m4FOKY3Y4Ui2z957J1oHJyWmd+cqXkERUb25
	ZhhaABJKenmE7HZ0MHrjFXNtgPvjnZcIqE6Uxblyhxmxd/ZN2C/+eXvHLXklKvfa+KXJeeGDXqRnS
	UOxFRvt7OEHLGa5W6iCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nquSX-00D6PG-C5; Tue, 17 May 2022 10:29:45 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nquSK-00D6Kk-8L; Tue, 17 May 2022 10:29:33 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 p5-20020a1c2905000000b003970dd5404dso1028155wmp.0; 
 Tue, 17 May 2022 03:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Vxisw3Hi44x5twaMivDjLGFhUD0fUbxKpcmcLxOdkIw=;
 b=e/qh6WLxUTS+sXD6t/Mhvgl+X9qerZPVQ2gX4wXKahJJrVmDQ2z1lFt/r8dvU+xlDh
 yboCALSNrqACdnL3x5d6WZO2R0BjYwqr+zmLSQVILMXypRqhiC9Eir6lGEr5QH/+qdkX
 JtOUZVBVu7GVl8QbFNo8rMX3JYoV4CPZMxjW2mvRbFtvetfULTJwG2dZej9uTj/VpP/7
 Jv9W/nQGsF4cFKUHT7zWsz6d4aQa02PY4INtnUHWGO48joLipKxTctp8kSDJVkU7jm5p
 jtGrqVqrkFpRw8vpvvmlYFSOL7IlrApUu3GfD1R7SoJOuu+2nnE7+40/drHmKe6tJF5M
 oloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Vxisw3Hi44x5twaMivDjLGFhUD0fUbxKpcmcLxOdkIw=;
 b=eRbdHAqwxBi2DkpbxDB4C+/nZ/oQtmYsVhZqBjuyqTKYbK5LsHkSWRWHCibR4gJfRM
 /p1s48Wnu4JgU0hQUsUbI5Opu6MKLYyB0f6Z0vNZaJCGs3Lbv6PFHNz0U1uDHYysP3Zo
 rlKPr894f0WGyqSIGJJp+UD3uOHdtJxGTajIsx1VFGMAK9uop8x+XtoEjyZed3P2Ks0P
 8JqpKPhO+aXR4CbsoQ8blbfE9dPIZS1akCGojVRvbw7v25q7NaOHw4Mfkn04JkZ87Zy/
 Q9LFf4HQoRtOXZQI4VwKv3GXb9Jcsg8SzK2XlyTYVhF+u7JYkwfepiUXIHJNjx0s0OOd
 G21g==
X-Gm-Message-State: AOAM532GO10WGVqSYUhdCqIssmr2XVKBRDNTNfkJO10McRXggb8HBjW0
 7Lf5eVJ8+W0aqiied9OMmXI=
X-Google-Smtp-Source: ABdhPJxeHmi/dJgRvCtWQ+8Nrr79od0BB1V9M9NaLxo9VbirJO3YvMd+eVgoytq9QwTzYynRNSCbHw==
X-Received: by 2002:a1c:f30b:0:b0:37b:b5de:c804 with SMTP id
 q11-20020a1cf30b000000b0037bb5dec804mr31022786wmq.166.1652783370091; 
 Tue, 17 May 2022 03:29:30 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 m29-20020a05600c3b1d00b0039429bfebebsm2204390wms.3.2022.05.17.03.29.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 03:29:29 -0700 (PDT)
Message-ID: <96742ddc-5989-2538-a5f8-4b3ce637ecb7@gmail.com>
Date: Tue, 17 May 2022 12:29:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4] pwrap: mediatek: fix FSM timeout issue
Content-Language: en-US
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, lee.jones@linaro.org,
 robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 eddie.huang@mediatek.com, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, fshao@chromium.org
Cc: srv_heupstream@mediatek.com, hui.liu@mediatek.com,
 tinghan.shen@mediatek.com, hsin-hsiung.wang@mediatek.com,
 sean.wang@mediatek.com, macpaul.lin@mediatek.com, wen.su@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220513034356.5268-1-zhiyong.tao@mediatek.com>
 <20220513034356.5268-2-zhiyong.tao@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220513034356.5268-2-zhiyong.tao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_032932_345450_E434A461 
X-CRM114-Status: GOOD (  21.87  )
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



On 13/05/2022 05:43, Zhiyong Tao wrote:
> From: "Zhiyong.Tao" <zhiyong.tao@mediatek.com>
> 
> Fix pwrap FSM timeout issue which leads the system crash on GFX VSRAM
> power on.
> The crash log:
> [ 3986.543401] mediatek-drm-dp 1c500000.edp_tx: drm_helper_hpd_irq_event
> [ 3986.670756] vsram_others: is_enabled() failed: -ETIMEDOUT
> [ 3986.670765] mali 13000000.mali: Power on reg 1 failed error = -110
> [ 3986.670768] ------------[ cut here ]------------
> [ 3986.670770] unbalanced disables for vsram_others
> [ 3986.670783] WARNING: CPU: 7 PID: 4125 at drivers/regulator/core.c:2761 _regulator_disable+0x194/0x1a0
> [ 3986.670785] Modules linked in: rfcomm algif_hash algif_skcipher af_alg veth uinput btusb btmtk btintel btbcm btrtl xt_cgroup bluetooth uvcvideo videobuf2_vmalloc ecdh_generic ecc mtk_vcodec_dec mtk_vcodec_enc mtk_mdp3 v4l2_h264 mtk_vcodec_common videobuf2_dma_contig mtk_vpu videobuf2_memops v4l2_mem2mem xt_MASQUERADE videobuf2_v4l2 videobuf2_common cros_ec_rpmsg mtk_scp mtk_rpmsg rpmsg_core mtk_scp_ipi ip6table_nat fuse 8021q iio_trig_sysfs cros_ec_sensors cros_ec_lid_angle cros_ec_sensors_core industrialio_triggered_buffer kfifo_buf cros_ec_sensorhub mt7921e mt7921_common mt76_connac_lib lzo_rle mt76 lzo_compress mac80211 cfg80211 zram r8152 mii joydev
> [ 3986.670830] CPU: 7 PID: 4125 Comm: mali-cmar-backe Not tainted 5.10.78-CL2781499-v287 #1 b899b40a63da40d4767c6c0e96b6700d2f3eb242
> [ 3986.670832] Hardware name: MediaTek Tomato board (DT)
> [ 3986.670835] pstate: 60400009 (nZCv daif +PAN -UAO -TCO BTYPE=--)
> [ 3986.670838] pc : _regulator_disable+0x194/0x1a0
> [ 3986.670840] lr : _regulator_disable+0x194/0x1a0
> [ 3986.670842] sp : ffffffc016203a10
> [ 3986.670843] x29: ffffffc016203a10 x28: ffffffb7c3186b28
> [ 3986.670846] x27: 0000000000000002 x26: fffffffffffffdc8
> [ 3986.670848] x25: ffffffc017225000 x24: ffffffb7c0e94880
> [ 3986.670851] x23: ffffffb7c31840f0 x22: ffffffd6b4f3e275
> [ 3986.670853] x21: ffffffb7c3181a00 x20: ffffffb7c27e7800
> [ 3986.670855] x19: ffffffb7c27e7800 x18: 00000000ffff0a10
> [ 3986.670857] x17: 0000000000000020 x16: 00000000000000ec
> [ 3986.670860] x15: ffffffd6b44fa17c x14: 0000000000000003
> [ 3986.670862] x13: 0000000000000004 x12: 0000000000fd8318
> [ 3986.670864] x11: c000000100029ccd x10: 00000000ffffffff
> [ 3986.670866] x9 : 7dd6d080afd6f400 x8 : 7dd6d080afd6f400
> [ 3986.670868] x7 : 0000000000000000 x6 : ffffffd6b5459f0c
> [ 3986.670871] x5 : ffffffc016203a58 x4 : 0000000000000000
> [ 3986.670873] x3 : ffffffc016203668 x2 : ffffffc016203670
> [ 3986.670875] x1 : 0000000100029ccd x0 : 0000000000000024
> [ 3986.670878] Call trace:
> [ 3986.670880]  _regulator_disable+0x194/0x1a0
> [ 3986.670883]  regulator_disable+0x4c/0x8c
> 
> Add a usleep delay to avoid busy read for the H/W status.
> If (time_after()) be turn first, it maybe cause the system behavior
> crash problem like above. so we change it after sleep delay.
> 
> Fixes: 1f022d84bd19 ("soc: mediatek: Add PMIC wrapper for MT8135 and
> MT8173 SoCs")
> 
> Signed-off-by: Zhiyong.Tao <zhiyong.tao@mediatek.com>

I prefer the solution send by Angelo on this:
https://lore.kernel.org/linux-mediatek/a8bd608c-d94c-f4a2-e3b1-3381c9098caf@gmail.com/T/#m44170235be954f39bafc404b266d2c5b59dd4853

Please feel free to provide feedback on this.

Regards,
Matthias

> ---
>   drivers/soc/mediatek/mtk-pmic-wrap.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index 952bc554f443..f9e7c2f35157 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -4,6 +4,7 @@
>    * Author: Flora Fu, MediaTek
>    */
>   #include <linux/clk.h>
> +#include <linux/delay.h>
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
>   #include <linux/kernel.h>
> @@ -1197,10 +1198,13 @@ static int pwrap_wait_for_state(struct pmic_wrapper *wrp,
>   	timeout = jiffies + usecs_to_jiffies(10000);
>   
>   	do {
> -		if (time_after(jiffies, timeout))
> -			return fp(wrp) ? 0 : -ETIMEDOUT;
>   		if (fp(wrp))
>   			return 0;
> +
> +		usleep_range(10, 11);
> +
> +		if (time_after(jiffies, timeout))
> +			return fp(wrp) ? 0 : -ETIMEDOUT;
>   	} while (1);
>   }
>   

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
