Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C18C10DC1
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 19:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1TuqS/7C7MDnJYXgnCCq7sNkI/3dfj9oPHuyt6Lz0g=; b=31BOqGUPeVNyvuJXuTzl77EVqd
	3W67Cu4lSEj+b9ncctFhv9povuNz5BMr8Ry4fi0SsbyukIGzaQ+cCVsMKqd4pA5SyiX1wonZG5bHt
	wzJZfCMKyb6jmza1gfjhmnFRmIoShydBJ7nKhNkQoE7vQhlwb/mT+tZ/OWHnfrBMfjk1qglpBQggl
	Jc53wnZZ3xB6Vo2yqz0zfej9vJhtNYQg3m7bW8Zt1kxQ0sjWZcwFRMB4CvGn0+8LfpegeW9znRCRR
	x3mjCuvpJJp9ejBA14ZWlC0M8B/FqD8+V8xbj8Ts6CJfPU+xWLxe6fv+aoDSAoXCsuv2fNeAV5f4k
	n8F9n5+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAEBQ-005Oh4-2G;
	Mon, 04 Dec 2023 19:00:44 +0000
Received: from mail-pl1-f169.google.com ([209.85.214.169])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAEBN-005Ogh-0I;
	Mon, 04 Dec 2023 19:00:42 +0000
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d001e4cf7cso19426795ad.2;
        Mon, 04 Dec 2023 11:00:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701716439; x=1702321239;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N1TuqS/7C7MDnJYXgnCCq7sNkI/3dfj9oPHuyt6Lz0g=;
        b=VElJe2k6e8MSetGCBn2FP1S7JCvoSwvFWArUCfogwKKcv5pjuXGBqDGeFguQ+SqOwD
         zVUG3BZtPKSNodOLHkRngplol6WuC/TFnmNRXxmj2i5LUFtX1fdY33HW+IvCxfiE9FHr
         yicG8SL+y9TT9k6HNaCG3miN7R1VB97AMR4vSrEysqQbvtJT4I52JfB8K/aGLWbwFvv+
         4w28DStfLb/qk+Y0kHjACeND1sLwoZRXIXlz8cUShsWvYHPf6/WJJgmRXBQGp4ODs819
         Saaay3KmKuvfngQ3jJ0SAtH4XYByrOhkMHBpMImNVucAusDEcE8hRGb3bmK8EHcNKauT
         VPxQ==
X-Gm-Message-State: AOJu0Ywoak8YjOCwDJqu84FdoyFOLXyEeEE85Ne+unNFHRM+y9TC3FL2
	Qp/dZuzeRm63wMQaGklB3bc=
X-Google-Smtp-Source: AGHT+IHHQ2rAL0Tvz4EmLO23SEvKXkdcMniEXebNQQPfxw8obQEF0UOva9F7zaPNEHq1byNEaiZN3A==
X-Received: by 2002:a17:902:e5c8:b0:1d0:7d9a:3bc3 with SMTP id u8-20020a170902e5c800b001d07d9a3bc3mr2090541plf.79.1701716439379;
        Mon, 04 Dec 2023 11:00:39 -0800 (PST)
Received: from [10.46.23.145] ([156.39.10.100])
        by smtp.gmail.com with ESMTPSA id i31-20020a63221f000000b005bd2b3a03eesm7940081pgi.6.2023.12.04.11.00.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 11:00:39 -0800 (PST)
Message-ID: <590ade27-b4da-49be-933b-e9959aa0cd4c@acm.org>
Date: Mon, 4 Dec 2023 11:00:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/3] ufs: core: Add CPU latency QoS support for ufs
 driver
Content-Language: en-US
To: Maramaina Naresh <quic_mnaresh@quicinc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Peter Wang <peter.wang@mediatek.com>, Manivannan Sadhasivam
 <mani@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chu.stanley@gmail.com
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, quic_cang@quicinc.com,
 quic_nguyenb@quicinc.com, Nitin Rawat <quic_nitirawa@quicinc.com>
References: <20231204143101.64163-1-quic_mnaresh@quicinc.com>
 <20231204143101.64163-2-quic_mnaresh@quicinc.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20231204143101.64163-2-quic_mnaresh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_110041_153173_F27486C3 
X-CRM114-Status: GOOD (  13.79  )
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

On 12/4/23 06:30, Maramaina Naresh wrote:
> +	u32	(*config_qos_vote)(struct ufs_hba *hba);

Please remove the above callback since this patch series does not
introduce any instances of this callback.

> +
> +	/* This capability allows the host controller driver to use the PM QoS
> +	 * feature.
> +	 */
> +	UFSHCD_CAP_PM_QOS				= 1 << 13,
>   };

Why does it depend on the host driver whether or not PM QoS is
enabled? Why isn't it enabled unconditionally?

> + * @pm_qos_req: PM QoS request handle
> + * @pm_qos_init: flag to check if pm qos init completed
>    */

Documentation for pm_qos_init is missing.

>   struct ufs_hba {
>   	void __iomem *mmio_base;
> @@ -1076,6 +1089,9 @@ struct ufs_hba {
>   	struct ufs_hw_queue *uhq;
>   	struct ufs_hw_queue *dev_cmd_queue;
>   	struct ufshcd_mcq_opr_info_t mcq_opr[OPR_MAX];
> +	struct pm_qos_request pm_qos_req;
> +	bool pm_qos_init;
> +	u32 qos_vote;

Please rename "pm_qos_init" into "pm_qos_initialized".

Thanks,

Bart.


