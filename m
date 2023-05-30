Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FC4C77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 23:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+iWViYCQVb/xzSsBfREywiRrxXxPKruIfOn3/8DPd0=; b=qYgg8fpH+d/9Ht4evPSrnrpJqn
	x+V7ySi+pwNt4TBSQEGSx+s6pI3QWWsibXBUPW1N5gXCwkIF9YqqU8G/SFwMBrHcKDhmWs89hW3L+
	MeRWSCrvLHYuATu5JiWfwPZh1Qps2oO4PcOGbzO0w3I7SWpTULaQTsaOPFmggTkibNtKxacoODFVq
	kPPdBaIVBierZ1kGR7Z8H0U4SYW5qmlZJlt2jnbo10Meg4Qt8k0VLC0xnmvH0ZUspw7MQWTepnr3Y
	AapbJgWHHRQYrEzDPftQPm/QoKaIdna44kbr80vJt6jqzxrGsvOlVh9pwpK5cZnl1ia9ffu5C80RI
	DGx84zGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q49Aj-00FWvB-2G;
	Tue, 30 May 2023 23:54:37 +0000
Received: from mail-pl1-f170.google.com ([209.85.214.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q49Ag-00FWtZ-2k;
	Tue, 30 May 2023 23:54:35 +0000
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1b00ecabdf2so46574295ad.2;
        Tue, 30 May 2023 16:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685490870; x=1688082870;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f+iWViYCQVb/xzSsBfREywiRrxXxPKruIfOn3/8DPd0=;
        b=OmfyNm9ChOuLhFxUdru3NVmV4vTz1+/xedHaAEiZ3KMnWYym7z0yXVLN2DOfunybTW
         x5Y49hmaVSkFWqXyBV9qu94kuPp+mCfcxfRV7hI33rgFcDEKK2HzJ1lbT+g+8biXS6dC
         /76STKFRHp+0nJXRCApoQgXxv/jGQdaz5RjZ2ogxG74YfbE6uY8dvcCbIkn9nvDhu5/A
         mLXxWjk1qcziwhck3gcYj/ZkVG/B2ZSfVk8df7frlpmf+8D0f8v02sDU0zuDxUqL38uj
         LlY4VjAMdtSj7BW1YnM2c5N3HQ/NeylGCamoydPWXyRgpEVCL5xvnBpbiZGXJWqQQwXI
         0VSA==
X-Gm-Message-State: AC+VfDxxMGQ/63bJVJNXI8npxwWCA22SqEI/GSlc96Xu9nb5cN1N/zNm
	TCzjxb9C6HnuaRrhJf5CNzI=
X-Google-Smtp-Source: ACHHUZ6aA6UX+ERfkedHwLCP3QGXLJg26VTfEDrtGYzZXT3pXM/s2icGJNVn/HpUNxbK93SptJYO0g==
X-Received: by 2002:a17:902:d4cc:b0:1b1:1168:6571 with SMTP id o12-20020a170902d4cc00b001b111686571mr1192834plg.36.1685490870603;
        Tue, 30 May 2023 16:54:30 -0700 (PDT)
Received: from [192.168.51.14] ([98.51.102.78])
        by smtp.gmail.com with ESMTPSA id jg3-20020a17090326c300b001b033873744sm6111930plb.249.2023.05.30.16.54.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 16:54:30 -0700 (PDT)
Message-ID: <1c182151-6e8c-5068-b38c-f8e842e6e13b@acm.org>
Date: Tue, 30 May 2023 16:54:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/3] scsi: ufs: core: Introduce mcq ops to config cqid
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
 <20230530023227.16653-2-powen.kao@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230530023227.16653-2-powen.kao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_165434_912954_50FA4576 
X-CRM114-Status: GOOD (  11.61  )
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
> MCQ sq/cq mapping is not just one for one, could many for one.
> This patch allow host driver to change the mapping, assign cqid
> for each hw queue.

What use case do you have in mind for associating multiple submission 
queues with a single completion queue?

No matter what the use case is, I think that which submission queues are 
associated with a completion queue is independent of the host driver and 
hence that such logic should exist in the UFS core instead of in a host 
driver.

Bart.

