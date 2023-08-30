Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3F7C83F01
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Aug 2023 19:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pu+v5TcyzpQLtUTlfHhtPfmsTcuZLW0rXfwL8u5p7aU=; b=AlhySSLbxzj2eGtQpOARvD9iDf
	LwCC5/k/o//AmggVdHJDsqUjndpOOswaCYvHJPNo8PytT+yjyZmm6jjQ+Ni3l/iDTxL9ngpszZlVW
	L58bPvPIcnucogHybVNpLtONzGph+O61zsT6YtoPlLI/t7krKURt+HTDfdDV3bN4mRn2HXahMUCgT
	qTnmSC0/po+lbJ5BvYWE/RKYTC5lpHq2O1Rk+sH8ont+5BfKHS/OROSN2gFloPxeH9OkaI65mur/6
	cXxRHIBSLlSqSeBw1Y9B+AndMbExcfpsoXdmRvoBhtilv/+RRHjcHWUpUioHv7XsnYVSjWqPlGKj9
	ijk8NXaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbR3z-00E4Xh-2w;
	Wed, 30 Aug 2023 19:41:15 +0000
Received: from mail-pf1-f169.google.com ([209.85.210.169])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbR3y-00E4XK-0w
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Aug 2023 19:41:15 +0000
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-68bed286169so32896b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Aug 2023 12:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693424471; x=1694029271;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pu+v5TcyzpQLtUTlfHhtPfmsTcuZLW0rXfwL8u5p7aU=;
        b=TECZXIPdLOz/fjTmrAiVKFtW+0VepkqbQqlueUfNQwSOMqXfFEM1FR4uH+Qs2AYJKq
         bE+PnHnZnaGuJWVRlJXVRTADciCZJy6fir3eltVUx7Mi7BcnBfbSVVD/U6ahDSs0h4S/
         P5G1Y+KsUxpTAe5NIxM82fD5Xio/DfvyisIAfmXu0JpliG8PwbWpLkss7ecld+XxMc6V
         DAhTzu9+QDe6qusKmsNfxRxV+whvHcbcr1zA0CX3hEWzPAvB3DENg0gUqfA8lIgZ650S
         JUuIt6WcL+QS/a1Q4ulFQionjYTombkkiKU26r2KCvX/5hbBC3+R8r80BYGAFQNpcTBO
         DDHw==
X-Gm-Message-State: AOJu0YwbpYNXffO9YuBYHsCpmYtcriBguGBbiGcgZcxeaZcJIYcVrJN8
	NJu8SMK3YQOowQv26wW6Blo=
X-Google-Smtp-Source: AGHT+IFSVljawPLxfiOGWs3tuZoCeomEGtwAcIarN3V/KEUAA8oEDaI18lulp3iPv7mcjjE/JJk9cA==
X-Received: by 2002:a05:6a20:4281:b0:14b:8023:33cb with SMTP id o1-20020a056a20428100b0014b802333cbmr4045233pzj.11.1693424470787;
        Wed, 30 Aug 2023 12:41:10 -0700 (PDT)
Received: from [172.20.4.71] ([208.98.210.70])
        by smtp.gmail.com with ESMTPSA id i25-20020a633c59000000b0055bf13811f5sm10542568pgn.15.2023.08.30.12.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 12:41:10 -0700 (PDT)
Message-ID: <884c6a53-cdef-4a38-a2b0-a40d46cd9d88@acm.org>
Date: Wed, 30 Aug 2023 12:41:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] ufs: core: fix abnormal scale up after scale down
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com
References: <20230823092948.22734-1-peter.wang@mediatek.com>
 <20230823092948.22734-4-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230823092948.22734-4-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_124114_351912_CB3685CB 
X-CRM114-Status: UNSURE (   6.08  )
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

On 8/23/23 02:29, peter.wang@mediatek.com wrote:
> When no active_reqs, devfreq_monitor(Thread A) will suspend clock scaling.
> But it may have racing with clk_scaling.suspend_work(Thread B) and
> actually not suspend clock scaling(requue after suspend).
> Next time after polling_ms, devfreq_monitor read
> clk_scaling.window_start_t = 0 then scale up clock abnormal.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


