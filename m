Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74022C6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 03:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4LgpIpQnXfACsVW0Sr0WyWPrrO9CvQ3IEdJzoWk7M4=; b=k4UgYOUzRvOgVqUw0LotRoLcSQ
	QxC3jNBQuj4zlxWkc3auNWB0KUo1OAyAno7/XvK4B7tif/iDQdzR/TKFvZBoVJHUbWxbn+Fm2BPOm
	PO8SjZnMCPLUfHEPW4h7o3UZRlXxhXa+dm6iriLoESOjLT5oPIVyuqic3Q0+dfHMewtVUKSzPFYwH
	VT4E/e7iu1V6ivawScX5giLu11lEWwIlbu76M/wCcqFXin4e753s0LDlnYzz8UVOO80DIU2IJIYAW
	FmYeobNAOvp9DtLM0VDtl2CwAriPHjHbIDz4136hk7AUVO0X9MGx74KIIgCJHOfIQRUwC3kLam9BD
	uu8LMf/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phMAe-00GQVR-2E;
	Wed, 29 Mar 2023 03:08:20 +0000
Received: from mail-pj1-f47.google.com ([209.85.216.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phMAb-00GQTg-29;
	Wed, 29 Mar 2023 03:08:18 +0000
Received: by mail-pj1-f47.google.com with SMTP id a16so12774582pjs.4;
        Tue, 28 Mar 2023 20:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680059295;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y4LgpIpQnXfACsVW0Sr0WyWPrrO9CvQ3IEdJzoWk7M4=;
        b=mxlU4FCauFuXoD/MKT1JDDcNFBgDQMC3gNRHnae1iA2T3gfQFiOo252c8zmz+/vQC3
         PUIiX68hnkIv98evZ7kK8bt8e9Iy1VyEbN35pLwvS6zXV0B7iM5sXTXB5pFGNl3v1GWi
         DWcRzdpcPVQ2oTP2vttp/82caV8+zRktb200NloHvbuZ4B+TYibRdKjReV5Ll7ZlXsWK
         sLVpOOTdGyi3CZKkkR/v2k0p1CB5azDXamZu/GA//+QmdnNijnmsxwi3NmkeB6mSY2F9
         38yikKKA0a/36y70YADqvfVXTSOsOTEEnvnDPcJYKqCNKn/Wa4ctEZ2A/ko5foq5UsKL
         TcyA==
X-Gm-Message-State: AO0yUKX3wYvRHbIcnxxfAy1qe42QBLXPXQHyqizrVzK6+kSKs7AslDtI
	G9BXU44ccoeYiqb0Nu35DUs=
X-Google-Smtp-Source: AK7set/Q12xf+jqguzPY9SwUlBFl3T2v1sDCZ9j6DZ2UAHKLcyqvrkIjxH4SQUNUFMYvcvNSrqJ+eA==
X-Received: by 2002:a05:6a20:2056:b0:db:bc99:1f4f with SMTP id x22-20020a056a20205600b000dbbc991f4fmr13341518pzx.32.1680059295427;
        Tue, 28 Mar 2023 20:08:15 -0700 (PDT)
Received: from [192.168.3.219] ([98.51.102.78])
        by smtp.gmail.com with ESMTPSA id x23-20020a62fb17000000b0062d35807d3asm6295202pfm.28.2023.03.28.20.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 20:08:15 -0700 (PDT)
Message-ID: <6f1cf671-d8d3-b958-54b7-5f65db8731b5@acm.org>
Date: Tue, 28 Mar 2023 20:08:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] scsi: ufs: ufs-mediatek: Add
 UFSHCD_QUIRK_MCQ_BROKEN_INTR quirk
Content-Language: en-US
To: Po-Wen Kao <powen.kao@mediatek.com>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Stanley Chu <stanley.chu@mediatek.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wsd_upstream@mediatek.com, peter.wang@mediatek.com,
 alice.chao@mediatek.com, naomi.chu@mediatek.com, chun-hung.wu@mediatek.com,
 cc.chou@mediatek.com, eddie.huang@mediatek.com, mason.zhang@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com
References: <20230328103801.11198-1-powen.kao@mediatek.com>
 <20230328103801.11198-2-powen.kao@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230328103801.11198-2-powen.kao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_200817_716930_B5EA6969 
X-CRM114-Status: UNSURE (   7.01  )
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

On 3/28/23 03:37, Po-Wen Kao wrote:
> Set UFSHCD_QUIRK_MCQ_BROKEN_INTR for mtk driver

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

