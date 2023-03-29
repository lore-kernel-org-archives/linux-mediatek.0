Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD07C6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 03:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLjUKExRZYqRLUfr3tzAXkQagcsDKdjQLlBbO0Cmu08=; b=Gst7c8SsTpThIpwvUkzI7IlPoe
	GBPr4oK/7DjeGpc4RIT/N+t0pNsGqcm5KDDuhZmjSeKxpC6J+RJEiWbqxIhDwgxLGXte1ipmklimT
	u4/oszGJWK4bGCIUXCHiSshx53sv/PJsy45uarCFriRa7kl1XtJR+esHaJRZ0+lboOCQchfIlg9QJ
	lcFdm6tor6wNmaWCAxgOFAK3ptwKeCurRTCIk1RPCAUtd4CxnYh9czY0Z6sXXDnl9KxfYxTvEtoIA
	kVCGc3SwRYt8u9Ilu25Ai84XJzfLqVVsuH6ItDht7qyqkMfF7ng5Wz9in5iOIGovfKhLhMagOUpcg
	2+NjpkpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phMJb-00GRLB-2A;
	Wed, 29 Mar 2023 03:17:35 +0000
Received: from mail-pj1-f54.google.com ([209.85.216.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phMJS-00GRJ8-0F;
	Wed, 29 Mar 2023 03:17:27 +0000
Received: by mail-pj1-f54.google.com with SMTP id gp15-20020a17090adf0f00b0023d1bbd9f9eso17254013pjb.0;
        Tue, 28 Mar 2023 20:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680059842;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uLjUKExRZYqRLUfr3tzAXkQagcsDKdjQLlBbO0Cmu08=;
        b=NLHHn/QQXQXWYVY8lnKnCjrPREGRE3FnosClOtBd/UWHZfuxKQz4Z+kIfDj3K8frnI
         74jckFnNuBEWkpCw1Vfh/dscFjKW9GI1YYNIJK9iNG+0JZniExqKIHxjcvW2iIIWuVZ8
         qM/bSru5naxT8xmZ6ot/pl1stCHCmGHHuKk1gF8ZDnAh8q3+RXLy4Pau0vu12F2wzOIE
         7nrjhBUPFKBfrTT4eEzua82igFMSt/bjR4OXrQwlTd8vEsep8cB7J4UOQSqbOKIoQ/of
         IhbhggtjuVmbIz0htL6ge0KYOGc6krG9hhOAGL5KLrLsM95B1kzcmuk1QNKet606smlh
         pJ/g==
X-Gm-Message-State: AAQBX9fekCDDo2ebPVrAB+2jNj6nRT0x4fYCaTy13RBaN0L5CHe4c5wI
	mY+pXkjrD/jWKlH86R5YaT8=
X-Google-Smtp-Source: AKy350YzVZu7jRaQqedo3XXu6FnU0XGFplGppJjGk6e5le4T7qcgACa5GO7OfY6ejksf9kF5QL3ZAQ==
X-Received: by 2002:a17:903:3092:b0:19e:786f:4cac with SMTP id u18-20020a170903309200b0019e786f4cacmr14079031plc.53.1680059841938;
        Tue, 28 Mar 2023 20:17:21 -0700 (PDT)
Received: from [192.168.3.219] ([98.51.102.78])
        by smtp.gmail.com with ESMTPSA id ji17-20020a170903325100b00199023c688esm21853735plb.26.2023.03.28.20.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 20:17:21 -0700 (PDT)
Message-ID: <9266aa1b-2d63-43d5-f06e-5a228bc131be@acm.org>
Date: Tue, 28 Mar 2023 20:17:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] scsi: ufs: core: Make UFS_MCQ_NUM_DEV_CMD_QUEUES a module
 parameter
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
 chun-hung.wu@mediatek.com, cc.chou@mediatek.com, eddie.huang@mediatek.com,
 mason.zhang@mediatek.com, chaotian.jing@mediatek.com, jiajie.hao@mediatek.com
References: <20230328103000.10757-1-powen.kao@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230328103000.10757-1-powen.kao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_201726_119557_464AC2F4 
X-CRM114-Status: GOOD (  12.03  )
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

On 3/28/23 03:29, Po-Wen Kao wrote:
> A dedicated queue for dev commands is not mandatory, hence let
> UFS_MCQ_NUM_DEV_CMD_QUEUES become module parameter `dev_cmd_queues`
> to allow sharing first hw queue for dev commands.

Which queue is selected for device management commands?

What is the impact of this change? If a device command is queued on a 
queue with multiple pending commands, does that mean that it can take 
long for the device command to reach the UFS device?

The answer to the above questions should be in the patch description. 
Please expand the patch description.

> +unsigned int dev_cmd_queues = 1;
> +module_param_cb(dev_cmd_queues, &dev_cmd_queue_count_ops, &dev_cmd_queues, 0644);
> +MODULE_PARM_DESC(dev_cmd_queues,
> +		 "Number of queues used for dev command. Default value is 1");

I prefer a solution that does not require any new kernel module 
parameters. That means either a dedicated device command queue for all 
host controllers or no dedicated device command queue for any host 
controller.

Thanks,

Bart.


