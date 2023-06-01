Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D44C77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 14:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RhsrhrqIeqPr3ExRU8r0xtf++kKW8doMcoMqRSUUN8Q=; b=OVg4MdjDI+SGq9LxP34XzobOSb
	iy6b3BF+7YjPnp9YSC8YPme2xuqf1fDx463K0HFQTHIJc852k1dqVzrANJLwfxWQ001mDVej+4eQA
	mJxJeVOBu0wv72eFUye5sTme9W5wrYq68Ezn/q6CYG721LmatFycfCCOW4EfORiS0/0MgORp27ymI
	S5159h5Qqe/+K8/4Vp6TtbGV4ObezntumJHybXL+4NAJj+IaoA0Jm7+e6w69xqmL8fx0DNBj5X1ur
	TM304BCxxcBTQqFNQTASgu6YG94O8U18sTaHuPQNKw/c2tLipmZwaVU2Lo70ZECgKfKN8Nverq6Z0
	TFaqTTyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4jDQ-003pv7-0g;
	Thu, 01 Jun 2023 14:23:48 +0000
Received: from mail-pl1-f169.google.com ([209.85.214.169])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4jDN-003ptr-1O;
	Thu, 01 Jun 2023 14:23:46 +0000
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1b00ffb4186so4852225ad.0;
        Thu, 01 Jun 2023 07:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685629424; x=1688221424;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RhsrhrqIeqPr3ExRU8r0xtf++kKW8doMcoMqRSUUN8Q=;
        b=hGkNq21IaNo2Tzq1Mt570qpnWgzRImGhmvo6SC4MXmUw00cTIVZB/cWpWsIyD2zbMi
         59fX9xZuZ7KJj2aP1RBl7q8iaHRYLiFZQ06zE4StvbiZwhgiRUycptvQhP1ybLlEE65h
         WwbYJfjaK3ojJvDlqX7UaOH+5XWxri7fL751HC4oO51CCATyw6QSBGKO5vcVM3txrfvs
         beLZbVz6hfCZDSNDrL1o3Wei9CMOPsqzh5GRyV+6mI5EMhAHOHfjhELoTDrpvYRu5kxC
         DLXYhJcTX0J1XhEb1ySw8uKUMy01Zif3TsEKqTez89FO2nh3U4suYDtaRosEt9BD5TJR
         l0jA==
X-Gm-Message-State: AC+VfDz5CYr3ehSBOT8pgNfwB6NIxBHeW7CkdqIGkHSxRR4AFjjyOwKT
	T8r3VASs4m97nvi0qfxvXzY=
X-Google-Smtp-Source: ACHHUZ5mcym6G1j1+2kPrrHLCN8HX/Oa2eNbTlDZ1np2rvThUuhej8W26v0jWfskDo64l5S1V8M8yA==
X-Received: by 2002:a17:903:2285:b0:1af:ccc3:25d1 with SMTP id b5-20020a170903228500b001afccc325d1mr8091853plh.62.1685629424240;
        Thu, 01 Jun 2023 07:23:44 -0700 (PDT)
Received: from [192.168.3.219] ([98.51.102.78])
        by smtp.gmail.com with ESMTPSA id 17-20020a170902e9d100b001affb590696sm3519890plk.216.2023.06.01.07.23.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 07:23:43 -0700 (PDT)
Message-ID: <4ea8427d-8b09-d35f-0e2c-2df486b79692@acm.org>
Date: Thu, 1 Jun 2023 07:23:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/3] scsi: ufs: core: Introduce mcq ops to config cqid
Content-Language: en-US
To: =?UTF-8?B?UG93ZW4gS2FvICjpq5jkvK/mlocp?= <Powen.Kao@mediatek.com>,
 "chu.stanley@gmail.com" <chu.stanley@gmail.com>
Cc: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?Q0MgQ2hvdSAo5ZGo5b+X5p2wKQ==?= <cc.chou@mediatek.com>,
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
 =?UTF-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 =?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 =?UTF-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?= <Naomi.Chu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?U3RhbmxleSBDaHUgKOacseWOn+mZnik=?= <stanley.chu@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
References: <20230530023227.16653-1-powen.kao@mediatek.com>
 <20230530023227.16653-2-powen.kao@mediatek.com>
 <1c182151-6e8c-5068-b38c-f8e842e6e13b@acm.org>
 <CAGaU9a9TsoaUtoMX8cNmAhfBnCddRtWYEG8ACdRNJfri+sdasg@mail.gmail.com>
 <ec9c378c-fedd-5a90-bb12-085395e0d22e@acm.org>
 <fd0fceb04efa34e6d86f09c5554746cfcc5c993f.camel@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <fd0fceb04efa34e6d86f09c5554746cfcc5c993f.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_072345_471449_D03C0B46 
X-CRM114-Status: GOOD (  19.75  )
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

On 6/1/23 03:25, Powen Kao (高伯文) wrote:
> According to spec, driver is free to assign any SQ to CQ mapping. I am
> not sure if it's ideal to constrain mapping to specific kind.

As has been made clear several times recently during discussions around
LSF/MM topics, implementing all features of a standard is *not* one of the
goals of the Linux kernel. Whether a feature is defined in the NVMe, a SCSI
or the UFS standard, we (Linux kernel community) only support those features
that we consider useful and that can be implemented with a reasonable effort.
An example of a feature that probably will never be supported by the Linux
kernel is the "domains and realms" functionality from ZBC-2.

> Yes, please refer to
> "[PATCH v2 3/3] scsi: ufs: ufs-mediatek: Add MCQ support for MTK
> platform"
> 
> +static int ufs_mtk_config_cqid(struct ufs_hba *hba)
> +{
> +       struct ufs_hw_queue *hwq;
> +       int i;
> +
> +       for (i = 0; i < hba->nr_hw_queues; i++) {
> +               hwq = &hba->uhq[i];
> +               hwq->cqid = 3;
> +       }
> +
> +       return 0;
> +}

Thanks, I had overlooked this. Do you agree that the above shows that the
flag I proposed in my previous email (UFSHCD_CAP_SINGLE_CQ) is sufficient
to support the MediaTek use case? I want to keep the SQ-CQ association code
in the UFS driver core because the next step will probably to switch from
one CQ per SQ to one CQ per CPU core for UFS controllers that support
multiple completion interrupts.

Thanks,

Bart.


