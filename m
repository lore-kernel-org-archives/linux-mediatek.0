Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608A5C77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 23:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i06h5BK+XtAu5jXCBUd3D2Pr9DE1D8oH6P1s8vIA0QM=; b=hhOKFHtDzU4E74zlseYftb9vD4
	QfZhsAjlrfVMMIb3Malv2IRSRi50DBB/JHb+htUzoczILcE9rZV6DgCGNDk9uRkkmazVeExkYrRHg
	8IvRnLtp8Ovom/gLEDuuJ0xMRBED5/fRpiHl/RX+yKTSuXJ1khJEouyhAXDGcUcZW6kCDiOjZ8kgS
	RYAKwimeA1S+nLtDHY6sk14tiZg/5LrGj4+MCrwWQs+Ok4/WRYYFgshdPAOqMU5r7JxlbeGiS87w4
	neKbrFdzF0jNUUPBSujcTDjP8ehDonQ7G0YduR5zrmNhOvIkIrvZLHer38Cb+xn/SWn06PrIY+5nK
	l8kfulRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q497D-00FWBQ-3D;
	Tue, 30 May 2023 23:51:00 +0000
Received: from mail-pl1-f181.google.com ([209.85.214.181])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q497A-00FWAD-2e;
	Tue, 30 May 2023 23:50:58 +0000
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1b01bd7093aso29467045ad.1;
        Tue, 30 May 2023 16:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685490655; x=1688082655;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i06h5BK+XtAu5jXCBUd3D2Pr9DE1D8oH6P1s8vIA0QM=;
        b=NtHrWUZjU/H67c0Yz2yIY0XnbPlj0CvOWblYGxTXttjs+rRdToc2ieuUbuXUSzNfSo
         WAwIyP5iG7lAUxnczwqYWvQ4jNOEpQKbgoTd/U1nsTXYMHMW+uJKHbqc/OS4BEg5vC2A
         Y/s5SM5ENsqbxyvAcz2uKk+5lk9eAYrB7DMZb/Wraho080pzT7iD4NASzJFJNlWlJfaf
         vElVcOxJOAr0krGBc+T3lC9HAxYDGrbVTH7DyTCaJMcZiVOWODMHkanEJUGfoFs0jagv
         V3tosPFwe5AGExu9cMBziHV20C0tW+S1JXWER11WHZYOBtd1QAt1dTyQArRHVPjXUXlq
         8J2Q==
X-Gm-Message-State: AC+VfDzKLqPqr+k+EdMOBUscBYGJUKE+lkZKPFxha+MifwkJYTo3I3sh
	ld+FK6MW5+F46pWIwQiEt3w=
X-Google-Smtp-Source: ACHHUZ5q2rHhMeGb6KiH+LiODYM8ZJD5Z/27qCZSHx6XU038OIaBVsCApVD+YW5jC3EWzB+l3X8JCA==
X-Received: by 2002:a17:902:c40f:b0:1b0:286f:233a with SMTP id k15-20020a170902c40f00b001b0286f233amr3875945plk.61.1685490655006;
        Tue, 30 May 2023 16:50:55 -0700 (PDT)
Received: from [192.168.51.14] ([98.51.102.78])
        by smtp.gmail.com with ESMTPSA id u14-20020a170902e80e00b001aae909cfbbsm10839276plg.119.2023.05.30.16.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 16:50:54 -0700 (PDT)
Message-ID: <ecd8d769-4143-550c-13b5-ae96e6a76ff6@acm.org>
Date: Tue, 30 May 2023 16:50:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/1] scsi: ufs: core: Make UFS_MCQ_NUM_DEV_CMD_QUEUES a
 module parameter
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
References: <20230530023518.16965-1-powen.kao@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230530023518.16965-1-powen.kao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_165056_879057_C77E060F 
X-CRM114-Status: GOOD (  12.15  )
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

On 5/29/23 19:35, Po-Wen Kao wrote:
> A dedicated queue for dev commands is not mandatory, hence let
> UFS_MCQ_NUM_DEV_CMD_QUEUES become module parameter `dev_cmd_queues`
> to allow sharing first hw queue for dev commands.
> 
> When `dev_cmd_queues` is set to 0, the hwq 0 will be shared for I/O
> requests and dev commands. In the same hwq, commands are processed based
> on submission order hence might take longer to dispatch dev command
> under heavy traffic. For the host with dedicated hwq for dev commands
> can benefit in such scenario.

The UFS core has already too many kernel module parameters. I don't 
think that we need more kernel module parameters. Instead of adding a 
new kernel module parameter, I propose to never reserve a hardware queue 
for device commands. Reserving a hardware queue for device commands 
seems wasteful to me.

Thanks,

Bart.


