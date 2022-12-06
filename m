Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984B4C352A1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 18:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XIPweIwuij1QW1uQnto7kf0CevT66V2jnSmHF5fZ+JE=; b=Ds5pMQWjoWyKb5coiWrr7w+M91
	WXwoTrmSxsGqf9k901BMeiOILBNuHVcn9w9aTYEQ0BiK42Nd9nN++1DZcNEMwN94xt5+7zlMdfDLU
	V572JW8a5CugFaXAoXjtpeAt5p30D29OlLQwNQTvEO1CntZyz/C/NwDNqrrd7rESSXKqseeUVT8Kv
	SaKS7UfHvw5QxLUzl59zK777CeT24idye5V4UEmlldgX1lQvn6TtqLp4T+DqjP03owOmfIYiG7lJN
	84/UaJpF87pWjImYyS3aOPAUQK5NxOUiHHuFkvmY4nc8+PM12HMADiAC5NOCkzG0hhgwzGZsT4o59
	Zgn92e1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2dAE-00098d-UW; Tue, 06 Dec 2022 18:59:34 +0000
Received: from mail-pg1-f180.google.com ([209.85.215.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2dAC-0008z4-Bx
	for linux-mediatek@lists.infradead.org; Tue, 06 Dec 2022 18:59:33 +0000
Received: by mail-pg1-f180.google.com with SMTP id f9so14187734pgf.7
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Dec 2022 10:59:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XIPweIwuij1QW1uQnto7kf0CevT66V2jnSmHF5fZ+JE=;
        b=dopfthQ7K/AxdeRH5vgVB4+8XTkZSvI4JgRcmR/L+8nL+bL6UMKeLhRpXgwL2xQLuZ
         X7XMgPBNaabg3hXM9vx0rBJIeOHS6AY8uHODZRMMjI8ONMXBdKsHJW3tM6Blua68/Q6t
         X1Xhx3JIed8/KkRwjIOPrdvPzh5apUTMVE7r1qkoEpcxXIbdZTSk9fKs1r93s9rxk5V1
         uoT9JuGLBDB8ntYIPrFlVeXS1KX2EINgTBrfb+mDuirzHHQV4Hw++vS9SLUvU3CvKBi3
         YePSxPb4vRReEu0KiJx+DN60OoIria4Zzg8OJU38twyuZFSWXjf8GRqypQixLxaNB1rM
         NBgA==
X-Gm-Message-State: ANoB5pn1lPA8Mvsi/m8aRjOpMIc1QjovMwi2Ol9a2yQGsJEYXWO6u7va
	vXwLPCpJUhxnB246pvW2S5s=
X-Google-Smtp-Source: AA0mqf4p6i2fAAhb1xdnLc/NBlN9AkOTc6XV6rVLPFHKAOyjaZJVPHTqkCLTKcmMw/Jigu8uw18DTQ==
X-Received: by 2002:a62:1c49:0:b0:575:b4c0:f664 with SMTP id c70-20020a621c49000000b00575b4c0f664mr34524264pfc.56.1670353168873;
        Tue, 06 Dec 2022 10:59:28 -0800 (PST)
Received: from ?IPV6:2620:15c:211:201:6220:45e1:53d2:e1cb? ([2620:15c:211:201:6220:45e1:53d2:e1cb])
        by smtp.gmail.com with ESMTPSA id q15-20020a17090311cf00b00176b63535adsm13052736plh.260.2022.12.06.10.59.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 10:59:28 -0800 (PST)
Message-ID: <2f88c2df-abc0-2415-8085-162e96de356c@acm.org>
Date: Tue, 6 Dec 2022 10:59:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v4] ufs: core: wlun suspend SSU/enter hibern8 fail
 recovery
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com
References: <20221206031109.10609-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20221206031109.10609-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_105932_434406_E3051F93 
X-CRM114-Status: UNSURE (   6.34  )
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

On 12/5/22 19:11, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> When SSU/enter hibern8 fail in wlun suspend flow, trigger error
> handler and return busy to break the suspend.
> If not, wlun runtime pm status become error and the consumer will
> stuck in runtime suspend status.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

