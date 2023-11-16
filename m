Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27395C54FB9
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 15:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1xEO5MYelACJVsJ4H6pwDtv3cXRTLIOXgC9CSDPEQk=; b=ENrcaFABNJHJepoa6H98/Pvucm
	x3Z8zRcFFd6A5iAqQPyUDhrQHt1fU45cakPwStLrc87U3g5gL6JtDkwLFgTty/rbpRyiOrcR3WORr
	cqBplCosykd3x7O7VgoRiV5ZUWHGBWhsq6uIB7496dTx7f4xnynN2sYJvQSNK+cnvMWxsHwXb2mPq
	nCUI959H3R0T5ijSTOrDPZdkR/ikI2q2Pmjh2ncQCFScSREsm9QFD9Wb2fosSA1gW411v/ZCSnUgf
	4B1maXgLLmENYbgRdLOQI9+m+2f3BjyWcnnOORGILIKELOwMb5mHa8UfUOpFnkNM5G1SJj+nawYdD
	PT8ktylw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3eTu-003pvk-09;
	Thu, 16 Nov 2023 15:40:38 +0000
Received: from mail-pl1-f171.google.com ([209.85.214.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3eTq-003pub-0E;
	Thu, 16 Nov 2023 15:40:35 +0000
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1cc921a4632so8609395ad.1;
        Thu, 16 Nov 2023 07:40:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700149229; x=1700754029;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S1xEO5MYelACJVsJ4H6pwDtv3cXRTLIOXgC9CSDPEQk=;
        b=h19G0WFNd5JWTymKPaXjcAG4t9JyOQw6gkvc2lw0mcP7zO3KfhLWQEG/reKGQ/K5M7
         spZ2XT9keuv9rlPDuj5vbfUVa4PAizBSq1qdwHSnCectX5tJLd9A5sx/4t1FT8k4l5p9
         xfQFDVRcUVjOUCK2Pd2udEoIl5+2I+ayk4hb+oVRV1yWnwRA0TlTmDImSztZ9BJpWVZE
         Q6KgTlp8BqY1MHN3ol5yeO1Ms3QJ84l91SgCe67TYdANYFTr08G4msWh+p7+S5/aVfwV
         e6zsZ9Q6LKsdI0t6Mt8vfGLF2QpftF9JZc0W2FH+rAvqxlXSqNlC9wcPFRk5Hfm/3XMR
         9eVg==
X-Gm-Message-State: AOJu0YylrfMP5+eRiXWrPWMIgF1S1HSvP2qyMykBfMohtZ0mSZ/vFi3e
	rz6MH6H5IfAxHdVjB1RFWe8=
X-Google-Smtp-Source: AGHT+IFnxCAdrAhgyQ7GBItotGlUi3W1GVkooDSX3heWLobAARQE1dsZUTt8pupZqsdGxWzhy+Oqdw==
X-Received: by 2002:a17:902:e543:b0:1cc:4146:9ecb with SMTP id n3-20020a170902e54300b001cc41469ecbmr10060719plf.47.1700149228811;
        Thu, 16 Nov 2023 07:40:28 -0800 (PST)
Received: from [192.168.50.14] (c-73-231-117-72.hsd1.ca.comcast.net. [73.231.117.72])
        by smtp.gmail.com with ESMTPSA id s14-20020a170902ea0e00b001cc2c6cc39asm9357113plg.243.2023.11.16.07.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 07:40:28 -0800 (PST)
Message-ID: <c29c90e1-903d-47de-89b1-af81195843a7@acm.org>
Date: Thu, 16 Nov 2023 07:40:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] scsi: ufs: mediatek: Change the maintainer for
 MediaTek UFS hooks
Content-Language: en-US
To: Stanley Jhu <chu.stanley@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-scsi@vger.kernel.org, jejb@linux.ibm.com, martin.petersen@oracle.com,
 alim.akhtar@samsung.com, avri.altman@wdc.com, peter.wang@gmail.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
References: <20231116024744.10795-1-chu.stanley@gmail.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20231116024744.10795-1-chu.stanley@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_074034_114569_7BFC841E 
X-CRM114-Status: UNSURE (   8.69  )
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

On 11/15/23 18:47, Stanley Jhu wrote:
> Change the maintainer of MediaTek UFS hooks to Peter Wang.
> In the meantime, Stanley has been assigned as the reviewer.
> 
> The original maintainer, Stanley Chu, who can be reached at
> stanley.chu@mediatek.com, has left MediaTek,
> so please update the email address accordingly.
> 
> Signed-off-by: Stanley Jhu <chu.stanley@gmail.com>

I think patches that update maintainer entries should Cc the email
address that is removed, in this case (I know this email address is
now invalid):

Cc: Stanley Chu <stanley.chu@mediatek.com>

Thanks,

Bart.

