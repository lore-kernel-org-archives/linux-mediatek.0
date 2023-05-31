Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46A7C77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 00:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G6f9p6Ip33TWg0QRs0/JjpOq/znW7u5TyerI2zaL1Kw=; b=RNWVJEVt8WMLsjQ0NGjAkrr2HV
	aL88gbMN6O3eeYYyi1m4XRjxyba+J0MHXdhhqIltw21uKpdxvgqUGzq1dk3oSZHkJdRknaC5Je6QI
	O3scCQRlImXvXVngWcxC/o7Z5oD/EDOeo2A+1iDPzDi3zb/UAkyL6XEEMbOEhqnZzN19+BqxJ7EZz
	jlsPqgqUMZvPhWzo2UyQt05LwKDGiw55Pkk7c7LJZ2EN7RxrvkJvPq0lasMLC2RthFama6Zmsh/55
	xEj/mgOPSov7Qpygr2G5xBkELAE/GE8aeNHY+DMuHjvFMGRdKxQLrY9Rm5oje77Imu6ZK215KPNJJ
	2XAjNNDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q49Gf-00FYLu-2Q;
	Wed, 31 May 2023 00:00:45 +0000
Received: from mail-pl1-f181.google.com ([209.85.214.181])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q49Gc-00FYL6-2a;
	Wed, 31 May 2023 00:00:43 +0000
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1b01d3bb571so28343825ad.2;
        Tue, 30 May 2023 17:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685491241; x=1688083241;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G6f9p6Ip33TWg0QRs0/JjpOq/znW7u5TyerI2zaL1Kw=;
        b=Atw6k57A87rivyoOVcacV+aoiRC2BlO2D3mddflyk+9kamMDveEM6/LgfxE6dOa2pK
         1QE5HgUjXP/MC4YxDG/VDwykjxTw9X+H3BTswVMsht12rjQqRZSa5dAMTvQEZBDPokh1
         uCw6QG8YubB3IJwGeFFfpWIuLrdFQbHTOhwVTunwe98q9N6yav8ymJP9oil478zi52ZG
         n08zqB1uWn9x7nuuw+Hsy07dVEpBonIb9zNQhQIZUiF1q4xE4U8ztIMvCq84TTDOn868
         Mm6i0HtKg7ne7ovrk0Xh0qr6veigZ4zwYhpBIGlHaJGUZEVaIBKOIEnkSWzADNo8KEl4
         S8UA==
X-Gm-Message-State: AC+VfDyfDtcBStlqzKuTpuupc7B3/GM2Ryd//Zttj6dPc3kGWEwMuZZR
	HWEOVyv29sv45+F58C9z8jg=
X-Google-Smtp-Source: ACHHUZ6KHbtIWEo8uC7vWZab/C/5aBiWhIjwNwa+qTpWZHhYAbQ+wZaWF65z/EBJMIeMAB/BO8nC8g==
X-Received: by 2002:a17:902:e993:b0:1ae:40ed:4b8 with SMTP id f19-20020a170902e99300b001ae40ed04b8mr3647056plb.22.1685491241359;
        Tue, 30 May 2023 17:00:41 -0700 (PDT)
Received: from [192.168.51.14] ([98.51.102.78])
        by smtp.gmail.com with ESMTPSA id m17-20020a170902db1100b001a65fa33e62sm10836138plx.154.2023.05.30.17.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 17:00:40 -0700 (PDT)
Message-ID: <3bb2386a-8cba-6ee2-6034-60af4d37c4db@acm.org>
Date: Tue, 30 May 2023 17:00:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/3] scsi: ufs: core: Export symbols for MTK driver
 module
Content-Language: en-US
To: Po-Wen Kao <powen.kao@mediatek.com>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wsd_upstream@mediatek.com, peter.wang@mediatek.com,
 stanley.chu@mediatek.com, alice.chao@mediatek.com, naomi.chu@mediatek.com,
 chun-hung.wu@mediatek.com, cc.chou@mediatek.com, eddie.huang@mediatek.com
References: <20230530023227.16653-1-powen.kao@mediatek.com>
 <20230530023227.16653-3-powen.kao@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230530023227.16653-3-powen.kao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_170042_848853_255DC0CF 
X-CRM114-Status: UNSURE (   8.59  )
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

On 5/29/23 19:32, Po-Wen Kao wrote:
> Export
> - ufshcd_mcq_config_mac
> - ufshcd_mcq_make_queues_operational
> - ufshcd_mcq_read_cqis
> - ufshcd_mcq_poll_cqe_lock

Please use the regular style for patch descriptions and use full 
sentences instead of a bullet list.

Anyway:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

