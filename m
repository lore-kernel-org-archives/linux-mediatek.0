Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A4AC46CA2
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Dec 2023 17:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCKdQO85kQLbRZb+7q6diSEi1hXX9QrYCjY7VxGpZ0w=; b=L2vT8cBMaox/5PeNMSlyBLX1sf
	1EZrI72FEfTbhzyYodGBTdzBtvsSEwtR1ornVbH6E+F3g4MVRnRiPbYINldo9VV6u3CrmigDhdr9l
	44ygplpJFAMGm91gDdiDvnEdmm7ME2aQTKKxWIFrWg09PDY6pW1TgxhVKDYyc4qq/6vRRuvuq6nf6
	7MzW1UQpKuLZcOozaqJo5EYx7YUGyQFozdesUeN4+eQfZRd2UfnIu1nohN9Gy1tzhCPc0rKrQoJ4q
	QHz13LCGxEv1VXVas1/7qAbhkF3IntiKWJ9WqVDdlfHea01AN8jVbjvl9cCCChv5W8UDzgPn+4a92
	nJqbgF2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFdSQ-00Enmp-0J;
	Tue, 19 Dec 2023 17:00:38 +0000
Received: from mail-pl1-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFdSN-00EnmG-2Q;
	Tue, 19 Dec 2023 17:00:37 +0000
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d3dc30ae01so7558215ad.0;
        Tue, 19 Dec 2023 09:00:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703005235; x=1703610035;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GCKdQO85kQLbRZb+7q6diSEi1hXX9QrYCjY7VxGpZ0w=;
        b=BS8wwZLmHb0c8JGi9pwD/PkPGXSRqkq8gXpiJkPW9UpkoGkkIKG8DgNtJfGeDGKhtN
         5swh70Bx1eJcsccGwL2R7tnJxhrb35x4PkzwGfXhd/cglQEzkXyWo3wCUxU4nl3Eaa6L
         vyZAn0qz4UCMt1+oDthRANfq5BHipsH7u9qTQpwkAShJwmUm97cjFfMCRocMUuLLovPL
         Hax6LXLsh1DsOUt+eGNnV6PXZTSIl3JYBejgNcG8c58jBMGeX5y/F6HdguP4UnVqV304
         0i/orpZ/nWVGnx+grAba9bLSIC9HfNXDy0veWoSg22V0PN7jFG0MOr6KGYV91uDtTTGo
         Impg==
X-Gm-Message-State: AOJu0Yx1mbVl65PSpH5r4F+TZnvvmcTPItHJINZ69hfKoXS5AjQq+PHz
	5bcyFp7cN9D8UberGTP5KU4=
X-Google-Smtp-Source: AGHT+IHjYDf4pLbHjRZhEwzGoga9cTlLdC9BiKX+JX/lxqRBvLuTDO73ZsFEUGEiQv1HqWpmnoEB6g==
X-Received: by 2002:a17:902:ecc3:b0:1d3:deb7:7c69 with SMTP id a3-20020a170902ecc300b001d3deb77c69mr1299161plh.20.1703005234420;
        Tue, 19 Dec 2023 09:00:34 -0800 (PST)
Received: from ?IPV6:2620:0:1000:8411:2c02:6167:94c9:999b? ([2620:0:1000:8411:2c02:6167:94c9:999b])
        by smtp.gmail.com with ESMTPSA id o14-20020a63e34e000000b005c67bb1585csm19711949pgj.68.2023.12.19.09.00.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 09:00:33 -0800 (PST)
Message-ID: <90d13f1f-79aa-4067-b949-6f18cb1bb229@acm.org>
Date: Tue, 19 Dec 2023 09:00:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 1/2] ufs: core: Add CPU latency QoS support for ufs
 driver
Content-Language: en-US
To: Maramaina Naresh <quic_mnaresh@quicinc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Peter Wang <peter.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Stanley Jhu <chu.stanley@gmail.com>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, quic_cang@quicinc.com,
 quic_nguyenb@quicinc.com
References: <20231219123706.6463-1-quic_mnaresh@quicinc.com>
 <20231219123706.6463-2-quic_mnaresh@quicinc.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20231219123706.6463-2-quic_mnaresh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_090035_787050_CFD4AD65 
X-CRM114-Status: UNSURE (   9.95  )
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

On 12/19/23 04:37, Maramaina Naresh wrote:
> Register ufs driver to CPU latency PM QoS framework to improve
> ufs device random io performance.
> 
> PM QoS initialization will insert new QoS request into the CPU
> latency QoS list with the maximum latency PM_QOS_DEFAULT_VALUE
> value.
> 
> UFS driver will vote for performance mode on scale up and power
> save mode for scale down.
> 
> If clock scaling feature is not enabled then voting will be based
> on clock on or off condition.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

