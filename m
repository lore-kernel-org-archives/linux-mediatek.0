Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6F1C04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 18:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RNVMJ4oZ8yHzMS/5F5vQFWD6tQYWHNz7yT3+sY7HxXA=; b=VOcmHYL+L9wtT9KA4YZ9fCkNP+
	BAsIAFilmx2dbH2R/yaSE6CdbyGvnYZeOL15/JIhidEcapDLvZH763uJUK410t/rY4Vx/OkMktGeP
	9EHCHmjeunjV5f451QYpn+Z84GnXFE2IHuGa4XHLxKmb38+nSgQZVz+pTgLwnq0NW3IEvIS5MW4hS
	Cxgwy4CAFWfFlVEZtkhOIaTVwGWtd6f7eC/LsCmYyuXddhHaCHwPrceQaJawyxoT9U+RPzW0AUcQ8
	1oqYqVp+TN28T7QVHbdiOJ/1Pd3KLSsiXkSjoIu1CJpgOfFLgFr16+ouCPXMzAbFNSKSMN/D9QKTq
	krdFfqjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGlWH-00GSpE-1N; Wed, 27 Jul 2022 18:12:29 +0000
Received: from mail-pf1-f175.google.com ([209.85.210.175])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGlWD-00GSkY-0G
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 18:12:27 +0000
Received: by mail-pf1-f175.google.com with SMTP id b133so16802782pfb.6
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Jul 2022 11:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RNVMJ4oZ8yHzMS/5F5vQFWD6tQYWHNz7yT3+sY7HxXA=;
        b=2FmCRM5LoEnmWQ+DDgprGi5oZFRUtup3XSPZp211EhhOgj4q3iyIQO/mkR73Znvzg9
         B0q6NzSfr8mrJdr6m6whgEds0I90veUSzwsL14SWBvunOns7bfsftSX9YF5fRXM81z9a
         PBkrpgEV7ZcSEnNDCDAapVzHdUf7HPD9jPuT3eySIGJ/atD+4FiH5CSEPTqZ7u/swdbQ
         GAguWy17zAh7+uBIPy9ybEqOaz5hLjgzwTxLPgxcKnG9yXtsMACZRMngs76HijI8zEOD
         /I7U5ju7H2yrAd3cn6vxcJ/JZy02717IVSHXC9zHWoPuMKMBzwwYyQD35Sb79ahlPRtq
         3jFQ==
X-Gm-Message-State: AJIora9JTrZTzeipEwpH3l68IrchTA/OIYCV8xdse2V1/b5P9bSlPty0
	WeXYobpV/sExUxL1StD/XFM=
X-Google-Smtp-Source: AGRyM1usI0Gt657atV+HPb4lgLIOIMc5MiSpXSfWbHnB7XKqfY5gstwVxG7jNUFV+C3r+yvf7zuFPQ==
X-Received: by 2002:a05:6a00:1946:b0:52a:e551:2241 with SMTP id s6-20020a056a00194600b0052ae5512241mr22626795pfk.29.1658945539275;
        Wed, 27 Jul 2022 11:12:19 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:a84e:2ec1:1b57:b033? ([2620:15c:211:201:a84e:2ec1:1b57:b033])
        by smtp.gmail.com with ESMTPSA id h13-20020a170902680d00b0016ce31cfea6sm14180388plk.159.2022.07.27.11.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 11:12:18 -0700 (PDT)
Message-ID: <5fab3d4f-914e-63f8-a3e8-7dd92ecdb04a@acm.org>
Date: Wed, 27 Jul 2022 11:12:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4] ufs: core: fix lockdep warning of clk_scaling_lock
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, stable@vger.kernel.org
References: <20220727032110.31168-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20220727032110.31168-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_111225_077944_877FDB51 
X-CRM114-Status: UNSURE (   9.93  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 7/26/22 20:21, peter.wang@mediatek.com wrote:
> -	/* Enable Write Booster if we have scaled up else disable it */
> -	downgrade_write(&hba->clk_scaling_lock);
> -	is_writelock = false;
> -	ufshcd_wb_toggle(hba, scale_up);
> +	/* Disable clk_scaling until ufshcd_wb_toggle finish */
> +	hba->clk_scaling.is_allowed = false;
> +	wb_toggle = true;
>   
>   out_unprepare:
> -	ufshcd_clock_scaling_unprepare(hba, is_writelock);
> +	ufshcd_clock_scaling_unprepare(hba);
> +
> +	/* Enable Write Booster if we have scaled up else disable it */
> +	if (wb_toggle) {
> +		ufshcd_wb_toggle(hba, scale_up);
> +		ufshcd_clk_scaling_allow(hba, true);
> +	}

I'm concerned that briefly disabling clock scaling may cause the clock 
to remain at a high frequency even if it shouldn't. Has the following 
approach been considered? Instead of moving the 
ufshcd_clk_scaling_allow() call, convert dev_cmd.lock into a semaphore, 
lock it near the start of ufshcd_devfreq_scale() and unlock it near the 
end of the same function.

Thanks,

Bart.

