Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8103C4167D
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Nov 2023 14:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/pQmloQJnPzW3AQi+grxv5YPEbH7FoGxYsG2frmI2Ik=; b=WoBtn5e9YSBekDLaZN6csL0bM4
	GnNgCkkDROqTb5KLUw5tTtz7yc/wYmWdMLP5gVEMBIxmEFeesqs+tm3ojreEqthwy4F8S/uvIUIgT
	c5Z3NUx15EPLcIslo7z5lW0DVvBBD+Z7ifshPG84xMinJOo4/Kt/wSG3vIQKb2/N274iHh+kyIYB6
	BXbKvHFASAF/LSWTEq9+oSNXjWm6TT1zpCdmd3EqRvXUZyXc4Toya5aO9kAQKo3fUTo/3assKysuA
	/oxRQqFOEhM9M0jGfBuLfxe8XRoY5w0ZkSovlA2sip+QZsk24LjhGKfzMDpdsgvH2LKMsnoP/CKYq
	cEAXPA+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyvc1-00BdVq-1g;
	Fri, 03 Nov 2023 14:57:29 +0000
Received: from mail-pl1-f181.google.com ([209.85.214.181])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyvby-00BdVH-0p
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Nov 2023 14:57:27 +0000
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1cc3bc5df96so17787445ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Nov 2023 07:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699023444; x=1699628244;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/pQmloQJnPzW3AQi+grxv5YPEbH7FoGxYsG2frmI2Ik=;
        b=YksZ9CpkCZ+o2vWIzy9P8kLkitwgLO1Z4IhOGoXJDzY0RB86JSIfMmsfDZy29UJHcZ
         uuRdVG62Wz5F3/k7U38L0OwdaFWTzmMEir1WBPdfhmTLhpyzaHOJXDbMorpI+u3slZhp
         yR7ged5V0KaFFgOwCINJ5vPUDWftkKbv9kMLo9pY7QyrJAreW36oZmSZo6cSRpXZcnAz
         AWM7eZ7XI+XduJPO9d6hXKfpJyI0jK8hp2EEiAfXea6JLxOGcj5IPHaX2Srq6aMgxoaE
         I6TOwCIMyxEojC9tPLs+62zUHtzPCUhGnqtFcPpTgRSVnfbobBdBWkPD2MIx4fyqmeAX
         uFKg==
X-Gm-Message-State: AOJu0YzR3jwQ9ylh5guVLJbTY9yjroR/k9+/4s6ijCUIRnha4MqHxRte
	SmV4MgqcrKOpHARP9aiH8h0=
X-Google-Smtp-Source: AGHT+IGw7ClGS24M2p/OtXtTzs7B2bXAaeiosKkYdtiBRLKDcjbT9LerWlVVCM0Xu0491oL017zk/g==
X-Received: by 2002:a17:90b:111:b0:27d:61ff:3d3b with SMTP id p17-20020a17090b011100b0027d61ff3d3bmr18548594pjz.38.1699023443825;
        Fri, 03 Nov 2023 07:57:23 -0700 (PDT)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net. [73.231.117.72])
        by smtp.gmail.com with ESMTPSA id ml3-20020a17090b360300b0028010142010sm1558584pjb.21.2023.11.03.07.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Nov 2023 07:57:22 -0700 (PDT)
Message-ID: <a017262a-b367-4500-90a9-bc099fe08a5d@acm.org>
Date: Fri, 3 Nov 2023 07:57:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: core: fix racing issue between ufshcd_mcq_abort
 and ISR
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com
References: <20231027084329.4067-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20231027084329.4067-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_075726_312076_26635ECA 
X-CRM114-Status: UNSURE (   5.04  )
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

On 10/27/23 01:43, peter.wang@mediatek.com wrote:
> If command timeout happen and cq complete irq raise at the same time,
> ufshcd_mcq_abort null the lprb->cmd and NULL poiner KE in ISR.

Please add a Fixes: tag. Otherwise this patch looks good to me.

Thanks,

Bart.

