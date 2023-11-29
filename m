Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551A9C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 18:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gLDX8cWt3JEEqgRokj5ykqsN5muXxo/Ge+Xctz4FUg=; b=U4hDiLSux302ImATH8FtypKrpi
	G/TYbmX/ivYLAh8sR2hc8TVsTaWzVmSHstHwcbZfWITnVl+vNTYcKI26KMxWlC+sRTFhDC85qF4Gj
	E7HIy0ooNBGj+Uxc/KuE7aGKfiAl0I17zWK34NRA2xuPEP35wqAnnAQq4MhSrJFCx/skFwopE0e5s
	VkIwhcU5/DKmPXr4Xpb4ujLDcP3CaeLRY6KRI8POyNgP1ATl+GW//3GyY4dAwh3l7pZH2fBQoYxzm
	XX8VSe/yPx6RoEOGYLmHw/bKCujXCU18vTQVTqDawHwMJz64x0gJ7V9qO7sPQANfwC89TTIOvimy3
	mwdm9KfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8P2K-0094pO-0L;
	Wed, 29 Nov 2023 18:11:48 +0000
Received: from mail-pf1-f178.google.com ([209.85.210.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8P2H-0094ob-07;
	Wed, 29 Nov 2023 18:11:46 +0000
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6cdd9c53270so24240b3a.1;
        Wed, 29 Nov 2023 10:11:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701281501; x=1701886301;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4gLDX8cWt3JEEqgRokj5ykqsN5muXxo/Ge+Xctz4FUg=;
        b=ON3Gw9w4eCtMizfGO6GkJSb3b08BGwHgJljoovRKi84WR926PXIvXPvPB5efXAqiZ4
         +Q0SkTSBF3jTQteEPHGfmOmJWtv3dB1CPWrqzNaPLuXfK0ZsCCuZgoivBtyxdfNRDYcx
         1VUsqa0ZzSKAVUYlJKT34u9FWwA9viVBapdNlPjff38ilT7BQryWvPh59J3nwvtsHY07
         jq8OTtaG52wdq+6FlnCkeSSzR9YelZFtQzh1aJdRQ9/7mgfwfDpWCQxt3+6tI7VOhFyj
         71aEJoFsL8s4vaLXtApUoepzbIbMLAMPe4Z2rLpXpV+dCZ6+bhoG9zo/PwGt0CI7g4Bu
         XILQ==
X-Gm-Message-State: AOJu0Yy/e7MuNZUxw3zZWFCRvw4gja7MthVG6ZJzDrCTwthc9HLv6LLH
	HSDdtj8XTgHrr794nwR8yA9MstHll2M=
X-Google-Smtp-Source: AGHT+IGy+4WYJhTiQIOswP/E41L9YL8AuNEuZh5o79tqLq/ynbibB9mZf/1DyU/qOz7NtDQNLElZ2g==
X-Received: by 2002:a05:6a20:e68c:b0:18b:d344:6acd with SMTP id mz12-20020a056a20e68c00b0018bd3446acdmr19899607pzb.10.1701281501391;
        Wed, 29 Nov 2023 10:11:41 -0800 (PST)
Received: from ?IPV6:2620:0:1000:8411:af8d:714d:9855:3f9d? ([2620:0:1000:8411:af8d:714d:9855:3f9d])
        by smtp.gmail.com with ESMTPSA id a9-20020a170902ee8900b001b7f40a8959sm12648546pld.76.2023.11.29.10.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 10:11:40 -0800 (PST)
Message-ID: <0cc74796-2369-4c02-a78f-4f1d5e8337dc@acm.org>
Date: Wed, 29 Nov 2023 10:11:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/10] scsi: ufs: host: Rename structure ufs_dev_params
 to ufs_host_params
Content-Language: en-US
To: Can Guo <quic_cang@quicinc.com>, mani@kernel.org,
 adrian.hunter@intel.com, cmd4@qualcomm.com, beanhuo@micron.com,
 avri.altman@wdc.com, junwoo80.lee@samsung.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Stanley Chu <stanley.chu@mediatek.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Nitin Rawat <quic_nitirawa@quicinc.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Brian Masney <bmasney@redhat.com>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>
References: <1701246516-11626-1-git-send-email-quic_cang@quicinc.com>
 <1701246516-11626-2-git-send-email-quic_cang@quicinc.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <1701246516-11626-2-git-send-email-quic_cang@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_101145_076052_15ECCFD3 
X-CRM114-Status: UNSURE (   9.32  )
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

On 11/29/23 00:28, Can Guo wrote:
> Structure ufs_dev_params is actually used in UFS host vendor drivers to
> declare host specific power mode parameters, like ufs_<vendor>_params or
> host_cap, which makes the code not very straightforward to read. Rename the
> structure ufs_dev_params to ufs_host_params and unify the declarations in
> all vendor drivers to host_params.
> 
> In addition, rename the two functions ufshcd_init_pwr_dev_param() and
> ufshcd_get_pwr_dev_param() which work based on the ufs_host_params to
> ufshcd_init_host_params() and ufshcd_negotiate_pwr_params() respectively to
> avoid confusions.
> 
> This change does not change any functionalities or logic.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

