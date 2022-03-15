Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33078C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 14:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HbM9+8b67FW6z16HtieEjyA2svGizYi2AOOnXIcHYLk=; b=YzYROA+yJ+hPr3Y4MaRxnSVJ9r
	Ahm47oMX3tuHxvg2+GAggHYPe81+U0rdwHhvdKuqWj/JXihkV6jQZD1sOEvRafvw2IDvO+7nOwm2C
	Hz47CJMjGlYFpa3c2dAPVJJvoaCFMVrZlWj6wfgDMFpYxrLYjaeqpYOTiHDl17UZCJeUsa2AravxB
	u/mJ9JzW/v7tbMozPO6xqL98akcRyLh0gkSxacr09jJ5gvZUenVc1aZbYS+LYIRMd2vJrvcsRG2uS
	jV6pUbAdgbquY0xGa8mMKVAOegGfCEOYXaDK5syaW1L88DKo+pn8uRJRE9I9iDUJkX0Gh+lOdPgAV
	YBI6/tpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU8J6-009UNa-5a; Tue, 15 Mar 2022 14:37:52 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU8J3-009ULf-Dk
 for linux-mediatek@lists.infradead.org; Tue, 15 Mar 2022 14:37:50 +0000
Received: by mail-oo1-xc29.google.com with SMTP id
 q1-20020a4a7d41000000b003211b63eb7bso24467073ooe.6
 for <linux-mediatek@lists.infradead.org>; Tue, 15 Mar 2022 07:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rpmKOoeraRuQGQUThehNRRx57Aisb5avAtGzINvQREA=;
 b=btYHhIM/2AcNT2mHGxMQPLP23iKlNVDyc/vZohM3qpDd7+3O/i/a2gd+sL94O0MNmE
 as02/VxgKVf31ZMRpUKgErJLODlFTaVhOcYu2+ESfiqlzPXtbyWkfTDpNmxPt3xVMhOn
 iL2pIzOqtP63EW/rpznJdR20E2Czy/P7+hFV+9+d7A9r1IsR6el4+qICVp6d9tudWqyy
 PU5vc4wCDO0tSwkcVXStOPm02tVPmKINAIcxy/vE4Kljap5BICXGKBemh4RtgicAlEgS
 ZUA/oAcTydN2vOzeCEFHuwNx1PP/KdrPv2syTmdHRAvKTtjKivWUkdgXTfsJM+NddxMG
 1msQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rpmKOoeraRuQGQUThehNRRx57Aisb5avAtGzINvQREA=;
 b=YA6Pd9V0t+SqFAfFWXVRZrCb4ubOGep8WnFpfSxK1p5ktNgHZ8dVFnHTDd/B5Pr0Wc
 ThsVbyW+VxtdJcEd6LhWGUKywzuWR8EaU1gbxyu3EifcHLf/cVjDTODYXmgekqVlaEm+
 pXVxIV+a0I8NZfbxQSWqk7DW/m76ztZuUOOKGF932Nwlpgx5/WObOzaGd99hzybs++4m
 p8tSlA9+zoXW+uXyP12Rfw1Qt6zL9RpH0VoeVPzdV5yBx/0jXP2hbN/0cH5R13pfHgK3
 RxRHLAwi2BvuotwV+RMUjRuXq8E6jBvGa4wXIvQ1lLp4RAYNYMkCzNj6Nzsuv5LelRBu
 lKHg==
X-Gm-Message-State: AOAM532p9a/NJdanUky7KcGc7OxnZEwfWMlAWIqu7YlqrFNf8YjmnFvM
 ZEkG4iiyFujVjwLW/Na+COig8Q==
X-Google-Smtp-Source: ABdhPJyvcljfmAWOAbxTQiajM8RYB5b1DsFb2rJguap6VrzxZaYDzEGfjeZQOutf0ny2oZHd4aTvXw==
X-Received: by 2002:a05:6870:4251:b0:d9:b7ee:f0ab with SMTP id
 v17-20020a056870425100b000d9b7eef0abmr1726880oac.56.1647355066566; 
 Tue, 15 Mar 2022 07:37:46 -0700 (PDT)
Received: from [192.168.86.188] ([136.62.4.88])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a4a8f4a000000b00320e5ecfecdsm8863070ool.46.2022.03.15.07.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 07:37:46 -0700 (PDT)
Subject: Re: [PATCH v13 1/6] soc: mediatek: mutex: add common interface to
 accommodate multiple modules operationg MUTEX
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Moudy Ho <moudy.ho@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 tfiga@chromium.org, drinkcat@chromium.org, pihsun@chromium.org,
 hsinyi@google.com, Maoguang Meng <maoguang.meng@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, menghui.lin@mediatek.com,
 sj.huang@mediatek.com, allen-kh.cheng@mediatek.com, randy.wu@mediatek.com,
 jason-jh.lin@mediatek.com, roy-cw.yeh@mediatek.com,
 river.cheng@mediatek.com, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220315061031.21642-1-moudy.ho@mediatek.com>
 <20220315061031.21642-2-moudy.ho@mediatek.com>
 <ed5418b4-e353-d879-f9b0-7a9de8fed862@collabora.com>
From: Rob Landley <rob@landley.net>
Message-ID: <4fa1dd33-adeb-a8ae-0ded-51a813347252@landley.net>
Date: Tue, 15 Mar 2022 09:41:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <ed5418b4-e353-d879-f9b0-7a9de8fed862@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_073749_610401_4DD83DEE 
X-CRM114-Status: GOOD (  13.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 3/15/22 4:10 AM, AngeloGioacchino Del Regno wrote:
> Il 15/03/22 07:10, Moudy Ho ha scritto:
>> In order to allow multiple modules to operate MUTEX hardware through
>> a common interfrace, a flexible index "mtk_mutex_table_index" needs to
>> be added to replace original component ID so that like DDP and MDP
>> can add their own MUTEX table settings independently.
>> 
>> In addition, 4 generic interface "mtk_mutex_set_mod", "mtk_mutex_set_sof",
>> "mtk_mutex_clear_mod" and "mtk_mutex_clear_sof" have been added, which is
>> expected to replace the "mtk_mutex_add_comp" and "mtk_mutex_remove_comp"
>> pair originally dedicated to DDP in the future.
>> 
>> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
>> ---
>>   drivers/soc/mediatek/mtk-mutex.c       | 122 +++++++++++++++++++++++++
>>   include/linux/soc/mediatek/mtk-mutex.h |  33 +++++++
>>   2 files changed, 155 insertions(+)
>> 
>> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
>> index aaf8fc1abb43..778b01ce9e8f 100644
>> --- a/drivers/soc/mediatek/mtk-mutex.c
>> +++ b/drivers/soc/mediatek/mtk-mutex.c
>> @@ -156,6 +156,7 @@ struct mtk_mutex_data {
>>   	const unsigned int *mutex_sof;
>>   	const unsigned int mutex_mod_reg;
>>   	const unsigned int mutex_sof_reg;
>> +	const unsigned long long *mutex_table_mod;
> 
> Can we change this to u64 instead?

Linux is still LP64, correct?

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
