Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3B8C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jan 2024 17:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FsJws2GBQTqVuL0zDyeQXawwmM6nlw+BJqfE/TGg9/g=; b=aCKiXA3dX32AMqvhyUMamRra/c
	6gl/W7dGUxv1tgNLnMvEdHd+OcTILQgOzYewGPLAYRVgw8h2+s3rvXAXSUdadiX87v6PFEpGGLyMo
	iWqbisoO2hEdwnsGIIE2Kw6y9Zo1juxtnkx/TFNusjlS+fV7xIpsoZDub9ubbplgBL7Qkhc7TXsQY
	XfOlnnvIFlJAQWm/NuIM66COpKiVH4xsMB0wp/q7oCDXVT50YjKnKpdVwB6u8WSN/nNWMnsGTzHZ4
	3h8P1ZzJHjE92LEtAdHCXdJTmFegwMyJybNl/8UDspD+z/1eqlBEO7dzKxc9ZOSQ7h4aDOudDRsPh
	1u+EPKEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMtsu-005otG-2y;
	Mon, 08 Jan 2024 17:58:00 +0000
Received: from mail-pl1-f176.google.com ([209.85.214.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMtss-005oso-1z;
	Mon, 08 Jan 2024 17:57:59 +0000
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d3eb299e2eso10019765ad.2;
        Mon, 08 Jan 2024 09:57:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704736676; x=1705341476;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FsJws2GBQTqVuL0zDyeQXawwmM6nlw+BJqfE/TGg9/g=;
        b=mca0yyWqktgGPdAEMfq7mpLBd3POb9REh2QA+kULUAk0pxS1Z4kTvP2iA/cCnq/YL1
         85GfkPmwNDlKDOFjLphZ3XHArrxdlXlrPf7gaOqsUUUK0t+0HGU1iDP698hAQohqrTQG
         +fAAr0tU3Dpo9Q0LZpp+aA365bF0Q6Fck9gVh4KvevjzCuG22CFXGB+5YvChoXPeja3d
         y5FjBxzebm/E9tXrmDUoLPxC/xvNBNoAjJNpERtMchJWbH6l3u6Sfi/bN9Yz4F4RgPAk
         jmachVOzq3bD/KpQE8LhDJf6YOhrXzT4R/eIF0qp76Uq58RSw3McAi7I2YotzLP9w90a
         7rNw==
X-Gm-Message-State: AOJu0YwSd/6b8W6XkfOSDXWw4x17b3ssq+MfQYuIO5bZBudoFM4iqKIE
	RwnuwVDWW3YAhc/oS9YwL1k=
X-Google-Smtp-Source: AGHT+IHLtStDtgCU08Axpj6/fVlaoUMqBauKXKas/k+5UZBD649yTmWj4FpPjb982/WaQgr8+5tSGw==
X-Received: by 2002:a17:902:b681:b0:1d4:6274:b4fb with SMTP id c1-20020a170902b68100b001d46274b4fbmr1489185pls.20.1704736676177;
        Mon, 08 Jan 2024 09:57:56 -0800 (PST)
Received: from ?IPV6:2620:0:1000:8411:cee:c48d:78d6:ed9a? ([2620:0:1000:8411:cee:c48d:78d6:ed9a])
        by smtp.gmail.com with ESMTPSA id n2-20020a170902e54200b001d058ad8770sm169957plf.306.2024.01.08.09.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 09:57:55 -0800 (PST)
Message-ID: <f95ce17f-f42b-4784-b725-8081df27a7a8@acm.org>
Date: Mon, 8 Jan 2024 09:57:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ufs: mcq: Add definition for REG_UFS_MEM_CFG register
Content-Language: en-US
To: Chanwoo Lee <cw9316.lee@samsung.com>, alim.akhtar@samsung.com,
 avri.altman@wdc.com, jejb@linux.ibm.com, martin.petersen@oracle.com,
 peter.wang@mediatek.com, chu.stanley@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, stanley.chu@mediatek.com,
 quic_cang@quicinc.com, mani@kernel.org, quic_asutoshd@quicinc.com,
 powen.kao@mediatek.com, quic_nguyenb@quicinc.com,
 yang.lee@linux.alibaba.com, athierry@redhat.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Cc: grant.jung@samsung.com, jt77.jang@samsung.com, dh0421.hwang@samsung.com,
 sh043.lee@samsung.com
References: <CGME20240102014248epcas1p4d49dcf2cd3f020bed88eebaeba648789@epcas1p4.samsung.com>
 <20240102014222.23351-1-cw9316.lee@samsung.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240102014222.23351-1-cw9316.lee@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_095758_685074_1F10309A 
X-CRM114-Status: UNSURE (   5.73  )
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

On 1/1/24 17:42, Chanwoo Lee wrote:
> Instead of hardcoding the register field, add the proper definition. While
> at it, let's also use ufshcd_rmwl() to simplify updating this register.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

