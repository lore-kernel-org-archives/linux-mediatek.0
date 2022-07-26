Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A013FC00140
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 18:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iC4DHntD7xvX1eDSC1HBk4kQ5QLIBClygzO/QGwT38=; b=QXXPX31ypnAstmHDvBPMQ1kEx5
	irHlfmgr7ne8SE+TmINFONbmNTUTipOs7tuBIIrl5uwEZjVeFkkoTpwE9ksL0XuNt2HjfuUypQ1Ar
	eYDq7GFJ6Sxffb4oyANcBm4YU0q1BgVJr/AG7+nyWOAnVHy3dGCMNcOppcsx4Ch63ouP5DrJyPOQl
	fN9VTlt1n/4ChDjDbvWsI0uMroKRloNbwj5ZCQR8Nl7CQ2F9LpEwtPqwn8uXJyPdVOZJcJVidGO1E
	PklGZIV1jg8fMJ9S5wt2o/sCqANYvuczPzzwSlRkLaUpfiftlA6+smXm0akm0y7ed0Z5giCDza+Pb
	AMiSiHZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGPO9-002A7H-HE; Tue, 26 Jul 2022 18:34:37 +0000
Received: from mail-pg1-f177.google.com ([209.85.215.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGPO7-002A3w-BF
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 18:34:36 +0000
Received: by mail-pg1-f177.google.com with SMTP id r186so13873730pgr.2
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Jul 2022 11:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9iC4DHntD7xvX1eDSC1HBk4kQ5QLIBClygzO/QGwT38=;
        b=Mnb3szsgIDLRj+k5aWvQQLbyWeS/kBVXFRnDbnjDdrE++eHte4ED953/hzuqWRlahN
         Oq9ZzZCA+aC4+uu8PHM082n7vOzvOtAWz8Hg/iAKoRySwVHVuk23Fah6R/D0Uh/xZML7
         7w/hjwVuZZ4LVRz3BeAzQodH/6cDJP8WbJ+NGwlXw3aCFDmPWOj/y9CbIcE1mRmtoTFf
         M7p+YZnqKJ9t05rYNDVt2pQ4A7KEm323EVWH0DdacGCsWwM71RQxH4uYDcRRDiVWWMpQ
         X0VZvrid8kiULHBbaYyI9lwHc+skYVeuye53DjEXyzLvOowAoGtZLsptLA0LHVKKS6tr
         4RVg==
X-Gm-Message-State: AJIora/xgymGCAQGr8pgN8euOu0jveX+svulWYvlBhFetKK29e9ZWlNo
	eQu7HiK8GvpP0CBENyNqr54=
X-Google-Smtp-Source: AGRyM1trXbSNGbtwlha5HjgkQeZN1fwHLv0GvtlpTt7idl6MXS34Uje3AbSmSUUjU1P1n8BRbnpuRQ==
X-Received: by 2002:a63:6116:0:b0:41b:29b2:f6c9 with SMTP id v22-20020a636116000000b0041b29b2f6c9mr4189599pgb.300.1658860472246;
        Tue, 26 Jul 2022 11:34:32 -0700 (PDT)
Received: from ?IPV6:2620:0:1000:2514:d651:8cbe:9208:2d2e? ([2620:0:1000:2514:d651:8cbe:9208:2d2e])
        by smtp.gmail.com with ESMTPSA id f4-20020a170902684400b0016c1cdd2de3sm11812609pln.281.2022.07.26.11.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 11:34:31 -0700 (PDT)
Message-ID: <99a93de2-70ee-da5f-4e94-676c0666acc2@acm.org>
Date: Tue, 26 Jul 2022 11:34:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4] ufs: core: correct ufshcd_shutdown flow
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, stable@vger.kernel.org
References: <20220726113653.25024-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20220726113653.25024-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_113435_413273_C3E31775 
X-CRM114-Status: UNSURE (   8.09  )
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

On 7/26/22 04:36, peter.wang@mediatek.com wrote:
> In normal case: ufshcd_wl_shutdown -> ufshcd_shtdown
> ufshcd_shtdown should turn off clock/power after ufshcd_wl_shutdown
> which set device power off and link off.

The above sentence is confusing: it mentions "normal case" which 
suggests there is also an abnormal case. Isn't the order in which 
ufshcd_wl_shutdown() and ufshcd_shutdown() are called always the same?

Otherwise this patch looks good to me.

Thanks,

Bart.

