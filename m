Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DB8C41535
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Dec 2023 17:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LgJX2iXSXNpamsAV8ozi86d6tRWgjGnRgb3PlM33YpU=; b=21DHz0D3pebvRRNjUKiWtCXaU4
	MRn0jUIx/krtgbe1Eu2w0SCwdS7IZ5DJGzOhylKczWDCfGYrHOM6DiJlYjOuN/K7C1CFUfDm7Swab
	ymE0RJZ5J9v+rZEvR0s6VZJxFPeLxdEqBz+6trbRFVc2STLur9l/tvDsXZgC8BMT0ZXRyDjuX0wIN
	6X19KTGh8JpTxk7trMEdFN/EMOvJN8j+qT46JwGqXeB6fMIz/+xJvslRvzCEJ62PysGaVVKft+Z89
	q4u2S4oX/BkXWEbMnuiwSSRPPF5ZqOBwUd9RLYu+jRZ0ekBTaHgUBKy/tjSuIZxvIC9IxcmxG6v8Y
	jrKPIzzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFdSe-00Enqq-1F;
	Tue, 19 Dec 2023 17:00:52 +0000
Received: from mail-io1-f52.google.com ([209.85.166.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFdSb-00Enpf-1W;
	Tue, 19 Dec 2023 17:00:50 +0000
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7b712c0fddeso182397539f.3;
        Tue, 19 Dec 2023 09:00:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703005248; x=1703610048;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LgJX2iXSXNpamsAV8ozi86d6tRWgjGnRgb3PlM33YpU=;
        b=vBT/Hq6t9ApsKGIR2iG4eIwEEFdfhZOnm1aCCZDoT7zzyONwJFBjUnpP8rEOg5PfGF
         Buu9JxRHr2UyyNjaa+n9bS/xJbH33cyNnXY+jJmVsGsfFPvRD3ZBAWjfRk/+IPq+8InH
         fJq8N30xXvuXqXgk+k+6M6db6719ADVin4cfCk0xcBDxNqwFGGO25GQ1pY/m6hmKc0IV
         MRW/01ff2ZdvGwSi2OfbSsbTLeI2tBcbRgw8ylRvlrEhXnXr+ZswRqQ+RH8cvbWC4akX
         rIb1119kZxvAodJVSTbcvHW7sbgjkNWVqrI3PVfkT4AkvduJ3GGjMs8XD3nxAm8c9BkD
         u3Ag==
X-Gm-Message-State: AOJu0YxVEZqf7ekD3u3t3ZBfIbVTzWR/wTn3DAAR5ZUbJOezb4N4Dj0U
	ZWPNcxTs0N/PLZ6KxWoikds=
X-Google-Smtp-Source: AGHT+IE/pXRsxDbNpnav7+8+DbpUu0omybNbu8s/xeK7S/bDGQfZgSlrOcqQHPwT4Qt848RSe0jwWA==
X-Received: by 2002:a05:6e02:1c8a:b0:35c:e8ee:f7d7 with SMTP id w10-20020a056e021c8a00b0035ce8eef7d7mr23488887ill.8.1703005247984;
        Tue, 19 Dec 2023 09:00:47 -0800 (PST)
Received: from ?IPV6:2620:0:1000:8411:2c02:6167:94c9:999b? ([2620:0:1000:8411:2c02:6167:94c9:999b])
        by smtp.gmail.com with ESMTPSA id o14-20020a63e34e000000b005c67bb1585csm19711949pgj.68.2023.12.19.09.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 09:00:47 -0800 (PST)
Message-ID: <04a6f477-2666-4873-8612-a4fc643a462f@acm.org>
Date: Tue, 19 Dec 2023 09:00:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 2/2] ufs: ufs-mediatek: Migrate to UFSHCD generic CPU
 latency PM QoS support
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
 <20231219123706.6463-3-quic_mnaresh@quicinc.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20231219123706.6463-3-quic_mnaresh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_090049_508665_DBCEA612 
X-CRM114-Status: UNSURE (   7.40  )
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
> The PM QoS feature found in the MediaTek UFS driver was moved to the UFSHCD
> core. Hence remove it from MediaTek UFS driver as it is redundant now.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

