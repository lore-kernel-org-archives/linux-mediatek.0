Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87A2C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 18:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Hd8uhGvTzF9AgKLCd+Lbl7J9eRzvxUH/L+jeg+epcU=; b=b82KNQDoG870IHtmXIN2rwpgnu
	3/TP5cJ845QFTWo2UvOYS7tX2+i0CL1wan+72M6TZRhgGxcHYOJ98oxTb5++nIWjHyfd+ICMw0mlc
	FBv4LQpHDUMYTOsSvQkT3n7z/bpWT2hInyEX+bIAyVVmij+SagRBnSY8fnw+kQw2fJSYbr9A1AjWj
	pDXQcFd4O6uKsvP8uppbxZrzPWquEraeXw2WFzXDwfG5HAvNtkhvnCP2ShR548dUrdwQBgzbexwD3
	eoXCoXmYRMqkXMEL1C1MWNQSMP7rJHTMeBLfHFMKIq8U+n7GgI4dZgULPFTMlTz+vLJnJW2qOSgki
	9JzWwQUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r03y8-00HHx6-0C;
	Mon, 06 Nov 2023 18:05:00 +0000
Received: from mail-pf1-f179.google.com ([209.85.210.179])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r03y5-00HHwH-1C
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Nov 2023 18:04:58 +0000
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6c3363a2b93so4265176b3a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Nov 2023 10:04:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699293891; x=1699898691;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Hd8uhGvTzF9AgKLCd+Lbl7J9eRzvxUH/L+jeg+epcU=;
        b=kS8s0lmCJoRTBX35JzRX3EpZDTUCH+N1UxdLeJD/C8ibKoBgx8Fp8HrVQf5Atw1eFV
         Bd/8AKdIO+gtSC2/e5I1ELdXOTOeyUMpLh+MZc8gfl8AIbnw4Qw96ao8zNtoK6rylpxg
         iOQy9/i6swx5xLjTAzGiidDnucKKjgV3YlnSkqnmSsMvaumMizzfuozzDwoz09tz1q2G
         68OztVa9A4yUerUiNOg7+F79VfK4Gtuwh5RQWfADVCRPzXPAh5WcPqwhFjltiz1ia+29
         Ez9SCzTHegn6nZofFScf28ByGwMIwnbDdJoyv9C8oa2sQ2kY7pXi8Btz6HwyTwwBpU3O
         yAbA==
X-Gm-Message-State: AOJu0Yz3jGhb31VyfQQisd5+bieCRhhy7Io0yzZVUSOKUY2pBG6p+Zo/
	KjANUaOajU1JvrG5mGE4WlU=
X-Google-Smtp-Source: AGHT+IG67a2JGponoHPmNCrlxe2OH3T4lJvGgK8UtvTUsThCl+UbtrEA9Chm1YEYKJhc0HFBHSl80A==
X-Received: by 2002:a05:6a20:8427:b0:16c:b95c:6d35 with SMTP id c39-20020a056a20842700b0016cb95c6d35mr39820960pzd.50.1699293890807;
        Mon, 06 Nov 2023 10:04:50 -0800 (PST)
Received: from ?IPV6:2620:0:1000:8411:ac50:9303:758b:edb9? ([2620:0:1000:8411:ac50:9303:758b:edb9])
        by smtp.gmail.com with ESMTPSA id z19-20020a63e113000000b005b7e3eddb87sm74212pgh.61.2023.11.06.10.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 10:04:47 -0800 (PST)
Message-ID: <c5f9e06f-a098-49d0-9255-7cfc4dd3db10@acm.org>
Date: Mon, 6 Nov 2023 10:04:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ufs: core: fix racing issue between ufshcd_mcq_abort
 and ISR
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, stable@vger.kernel.org
References: <20231106075117.8995-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20231106075117.8995-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_100457_426198_DD2A9711 
X-CRM114-Status: UNSURE (   5.94  )
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

On 11/5/23 23:51, peter.wang@mediatek.com wrote:
> If command timeout happen and cq complete irq raise at the same time,
> ufshcd_mcq_abort null the lprb->cmd and NULL poiner KE in ISR.
> Below is error log.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

