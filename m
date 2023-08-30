Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD68C83F15
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Aug 2023 19:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7uxS6jFbfP3ewnHJ55rgEk1lcD4TZvwx/MvbvZ9/xs=; b=uQicq9d7fLDpbyg2Azz9gf8/jC
	sS/rM2s2xZ1GT0fETTzY5mTIATAlGM1yxxxQL6kXYxXp/qBxK3gNYz0wEpEBWX6Tku5dHEhj9zaDl
	EuLW/ZTx+gGvDDtk7PvLz9m9XOHN7LScZJoc7dX4dkklw0/RWQKtigjj4ii5NmZuQ2y72pzYJH81W
	G7mSzRdqQP7NWwTEBFGOvgknCCP+AaGjuJiar3iAB+dxkUbkxsPT5bKkE00O/8f/77umE74VBAue5
	ZtlHiHO71tWxSGYWS8wpV+mnRNhqOQogSLAyAY5p+8tqJNbp9P2Ex6LuQvvpn0i+Ln+Z7MKqSb+I6
	jnoHHXwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbR2r-00E4UC-2b;
	Wed, 30 Aug 2023 19:40:05 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbR2o-00E4TD-2o
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Aug 2023 19:40:04 +0000
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6bd066b0fd4so119836a34.2
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Aug 2023 12:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693424401; x=1694029201;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7uxS6jFbfP3ewnHJ55rgEk1lcD4TZvwx/MvbvZ9/xs=;
        b=MpEtSeX7qTm+aECbIuf4TfPOK7yrGoRqIdBlYHRzXL4Ft96g46zqCW3wRvLLmDUhOC
         VdRgJxgkIrux+yaM12+W5lcmkbJukKhbmEFJ+NPFis1KyPZv9K/pcKJyqvV4SuMfDcZZ
         r0C2BXzidpsnPnBaKV93PAg/j7X3CuzoYIr4fQuqwajA461iFIIgP9O5perjZOiYZ4F9
         nclhbrhsgycwYfK2JKmrNjXqxEanxn6AMkPkibMJp9CeV9DIkKRDEhCt7jQS2Za3kaPh
         Bj247UeZBEE5DI9Nx67JF7aNNBgf5M4vKyXfhgyj59QCFX7X3LzZ/ssFcz49joKDriSk
         G3nQ==
X-Gm-Message-State: AOJu0Yyhi0QqEbYSNeXoPzklA0xG7EhNjjZXQEhpniu1AxGgFOotf+u6
	iutzLPtXUH2TOA2nlkLiBTMicpf1ufs=
X-Google-Smtp-Source: AGHT+IFzfrpd0+O4IZE90kBv0R8G1oWwBoCEhJ57vyOKcHcq8Wll43vHKGECUr55ZT76Ox9+eyURhQ==
X-Received: by 2002:a05:6830:1dad:b0:6b8:8f20:4cbc with SMTP id z13-20020a0568301dad00b006b88f204cbcmr3250425oti.13.1693424400868;
        Wed, 30 Aug 2023 12:40:00 -0700 (PDT)
Received: from [172.20.4.71] ([208.98.210.70])
        by smtp.gmail.com with ESMTPSA id i25-20020a633c59000000b0055bf13811f5sm10542568pgn.15.2023.08.30.12.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 12:40:00 -0700 (PDT)
Message-ID: <e2e7ad5b-a588-4c2c-8335-97d8e6b87368@acm.org>
Date: Wed, 30 Aug 2023 12:39:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] ufs: core: only suspend clock scaling if scale
 down
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com
References: <20230823092948.22734-1-peter.wang@mediatek.com>
 <20230823092948.22734-2-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230823092948.22734-2-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_124002_924372_3EAC88BF 
X-CRM114-Status: UNSURE (   5.52  )
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

On 8/23/23 02:29, peter.wang@mediatek.com wrote:
> If clock scale up and suspend clock scaling, ufs will keep high
> performance/power mode but no read/write requests on going.
> It is logic wrong and have power concern.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

