Return-Path: <SRS0=0dL+=DQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5997AC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 12:36:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9F4522284
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 12:36:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iWyHFmvh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tq8ecdMt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9F4522284
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1cvg5ev3YefGlrq4cHk77VdsWLBlS6r2vkgeSfiELPo=; b=iWyHFmvhGI5Qdg9FcEHK4+ilD
	YDHkZ3EUtLKxgIZWRSHw1vzSkf7Y9Ufmw4Ar2HpszjU9aE7qaUrUClJ91o7em03kPiVvUsSWNvcy2
	rJvC9eIu4G2gDqjl1SGODoTtUcOA/g9eHy2w10HrPzGuAErBVetBKrJxfys6jhLcY1LaOWfA6mDHO
	bghT5avlNdInh7+AVH7pspQIjPtOYOOjYcfz/bSd31s8KVRfPb9G/MwxwX5XZ8dHTZ+TTdLYX5sdj
	CnZx22Mdg8BMZRJ3cu3DGmfs7js560yeKqPD1bSjHgyi/abYsRMGKqJkqZFiJzvGydEk/BOr+H/eL
	dnjMgMDfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQrcp-0002OO-Bv; Fri, 09 Oct 2020 12:35:55 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQrbv-0001mp-JZ; Fri, 09 Oct 2020 12:35:00 +0000
Received: by mail-wr1-x442.google.com with SMTP id e18so10105759wrw.9;
 Fri, 09 Oct 2020 05:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=arXJ0tK64lVD474SrsZL15lNj1CHd4/0uMPQBKlDggM=;
 b=Tq8ecdMt/vmkX053Pg++C4Uk9SVuUFiz/TBkJqmMb1jS7pj76ybDA3YzHnxVeWjXQt
 stdvLakFE4syOiug0U1lzbEhQjmc/Eo2gQ5sSBksTqn4AeJEYsP6KFPYSkimnO2/Ti5J
 49KTc6+mqXPkvb6bXYZKx3Z2U/ojMr/zizEVuY8nu44sdywnDxytiL6RUd3vXyQrmhnb
 HTrRlCuESnPvJE0sLChuLFS2hUUXM09YxctLadYsgkF/ZYyDbHXTQEWTpjQTe/BlfeQX
 WPIkFjkUJqlEpGP7yKJQnNfMuxqJTBr7RlrVQID5IKWePFF8mwL/+Ag0I6eYZgL8geUe
 Hubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=arXJ0tK64lVD474SrsZL15lNj1CHd4/0uMPQBKlDggM=;
 b=pw6xm2jA5DEBT/5Bm3WXbcwDr/vgFALkvWnQ12kPq2j9+owS1HG8JK1S3zAllKX+Z3
 mPerH7GstV4a9a+2+qrR9Q5/Eu3bs92cn6VEo3hzRrxwnjjDcgbncM+6IdbwZAPRTGMj
 f08gEg0B4EeG/iA09LEfdFfTJR8w9Wou0EaMAQeoTdqqQiHr1ujHrnIfCdQuS30KEfsq
 Qbq6PRUugMOLd008Yvits4IfDU5p3RsjP9/Dc/2lSpUVcZypJZnFZVkDWa1Ca22SGevb
 igSF3y5i8rFQVHpI1jtRXPLOscDuTWODirVT4PVSoPLahukZzjZr8GDksvw+Dqmpc8TI
 1OdA==
X-Gm-Message-State: AOAM5317Gf2np7fQO/1OGRjysjbDHoP7dSIyz5wBeWkylQX3QUAU3Xk9
 nU/ffahkM6DIa+uKkavMwwQ=
X-Google-Smtp-Source: ABdhPJzb0l67YtCO8ZRSDEv7cjHsgr+7vKydt2IU/L5UzsOFSlUrERISoXTabfEwY/6OrPCc0n/8eA==
X-Received: by 2002:adf:a405:: with SMTP id d5mr8547724wra.421.1602246898481; 
 Fri, 09 Oct 2020 05:34:58 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id 13sm11086386wmk.20.2020.10.09.05.34.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 05:34:57 -0700 (PDT)
Subject: Re: [PATCH v7 2/2] soc: mediatek: add mt6779 devapc driver
To: Neal Liu <neal.liu@mediatek.com>
References: <1598497593-15781-1-git-send-email-neal.liu@mediatek.com>
 <1598497593-15781-3-git-send-email-neal.liu@mediatek.com>
 <c41ec664-73a0-3c63-a31c-48c89028dfac@gmail.com>
 <1602124514.28301.17.camel@mtkswgap22>
 <d8aec3a3-10b6-8c9e-6b2d-f9d9c0418b33@gmail.com>
 <1602149965.8784.6.camel@mtkswgap22>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <0ece983b-2e55-cf06-aca8-02a014fce090@gmail.com>
Date: Fri, 9 Oct 2020 14:34:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1602149965.8784.6.camel@mtkswgap22>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_083459_697329_4DA86631 
X-CRM114-Status: GOOD (  24.18  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, wsd_upstream@mediatek.com,
 devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 08/10/2020 11:39, Neal Liu wrote:
> On Thu, 2020-10-08 at 10:45 +0200, Matthias Brugger wrote:
>>
>> On 08/10/2020 04:35, Neal Liu wrote:
>>> On Wed, 2020-10-07 at 12:44 +0200, Matthias Brugger wrote:
>>>>
>>>> On 27/08/2020 05:06, Neal Liu wrote:
[...]

>>>>> +static int mtk_devapc_probe(struct platform_device *pdev)
>>>>> +{
>>>>> +	struct device_node *node = pdev->dev.of_node;
>>>>> +	struct mtk_devapc_context *ctx;
>>>>> +	u32 devapc_irq;
>>>>> +	int ret;
>>>>> +
>>>>> +	if (IS_ERR(node))
>>>>> +		return -ENODEV;
>>>>> +
>>>>> +	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
>>>>> +	if (!ctx)
>>>>> +		return -ENOMEM;
>>>>> +
>>>>> +	ctx->data = of_device_get_match_data(&pdev->dev);
>>>>> +	ctx->dev = &pdev->dev;
>>>>> +
>>>>> +	ctx->infra_base = of_iomap(node, 0);
>>>>
>>>> Does this mean the device is part of the infracfg block?
>>>> I wasn't able to find any information about it.
>>>
>>> I'm not sure why you would ask infracfg block. devapc is parts of our
>>> SoC infra, it's different with infracfg.
>>>
>>
>> I'm asking because I want to understand the HW better. I'm not able to find any
>> information in the datasheets. I want to avoid a situation as we had with the
>> MMSYS where a clock driver was submitted first and later on we realized that
>> MMSYS is much more then that and we had to work hard to get the driver right.
>>
>> Now it's happening with SCPSYS, where a driver with the scpsys compatible was
>> send years ago. But SCPSYS is much more then the driver submitted. In this case
>> we opted to write a new driver, but moving from one driver to another one is
>> painfull and full of problems. For that I want to make sure we fully understand
>> Device APC (by the way, what does APC stands for?). Is it a totally independent
>> HW block or is it part of a subsystem, like for example SCP?
>>
>> Regards,
>> Matthias
> 
> It's a totally independent HW block instead of a subsystem.
> I think it's more simple than MMSYS or SCPSYS. But if you would like to
> understand more about this HW, we could find another way/channel to
> introduce it.
> 

If it's a independent HW block, then we are good. No further information needed 
by me. I'd just advise to rename the infra_base to something like base, as it 
made me confuse.

Thanks!
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
