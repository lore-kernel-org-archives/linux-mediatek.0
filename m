Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DB5C6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 21:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dZytMHjh8b67xix8O8bZdnN1Cx47vlb8v10mIqLg8o=; b=AQ56GGEkcy0lcTa0PKxRDOS/JI
	Dlbs69lGBcy3OIHHzUm1fAEg4AdVesBmMSql11u9z/+f5cIDm/fLbFmLPRj/pMLLyC9OTa+vciSdv
	vWlb04bX7KS6sQcYYaHVdZxF264vzE9Z/cUcD13K64cwmNSk/KzO0LPS+kIEq4P4vRniUzE23Y6LJ
	NcI1h1OXd+aOz/QNFXhpi3k5+ft0+ceWB15/YJ4Vm3ymYvWJ4yJMG2EnQ6suIhrKEBvHy7zzKsVEw
	UXw2PQHUhPKWjUw6B/oUxbU0cOKLFqpjqDeFLentET9HCE2Ke8NSRAGU7+w5VQR5i637ZTLLQpPO3
	Ea5W840g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpqX-007wuv-WF; Mon, 13 Mar 2023 21:36:46 +0000
Received: from mail-pj1-f52.google.com ([209.85.216.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpqN-007wsv-4i; Mon, 13 Mar 2023 21:36:36 +0000
Received: by mail-pj1-f52.google.com with SMTP id y15-20020a17090aa40f00b00237ad8ee3a0so13128482pjp.2;
        Mon, 13 Mar 2023 14:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678743391;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/dZytMHjh8b67xix8O8bZdnN1Cx47vlb8v10mIqLg8o=;
        b=1lTBgKjDLzHfDlrvDg3BmcKeYgyFthHKL8uslseRCUbKAQaM9cTD96P9OITkYfCRpM
         vWJ5HNWbyV+aflT3H/AhWqVCEfb7XDCEl9B++Rm4Y9aA90i9q8l3aRTUDHCuZjWJ4Rr3
         9XI6lRh2Q1cVBOZghza6acm4q+kZKfrwzMvKbtQ/AJAM8z7DGVbZ1EaTJmVBjg6Tv9aJ
         U6yErkEfU9lL769xZO+ZIyveB5boXSTg+MzYSKVrUUeXP/bzM2t06RI8ZlZk1XgIMqwe
         VW8yhBEK7ILPimkdnzhvv6TKUWlSz3TrVoXOZhnCijqkjDlbMqOBLAqT9c02T9D8bv0/
         ijkg==
X-Gm-Message-State: AO0yUKXywUOhdWLbvPr8e+OQ4CbmiPbYTEOB5Jq7IQQI0o/BO5njcKnz
	OeeC6FONQCpXWn1yfwJYGIY=
X-Google-Smtp-Source: AK7set95DQi/rzm/uIe/p/jfOg3q8h1plmMCNBcRUGzfD97ucntNbYRG/dNYXe96dkgT9h0Tp7WxCA==
X-Received: by 2002:a05:6a20:7f8c:b0:d0:36d5:cf1f with SMTP id d12-20020a056a207f8c00b000d036d5cf1fmr12093386pzj.5.1678743391250;
        Mon, 13 Mar 2023 14:36:31 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:9cdb:df66:226e:e52a? ([2620:15c:211:201:9cdb:df66:226e:e52a])
        by smtp.gmail.com with ESMTPSA id a17-20020a62e211000000b006247123adf1sm172621pfi.143.2023.03.13.14.36.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 14:36:30 -0700 (PDT)
Message-ID: <5d317f56-b1ba-e35a-a558-e462a70a4717@acm.org>
Date: Mon, 13 Mar 2023 14:36:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 5/5] scsi: ufs: ufs-mediatek: Add MCQ support for MTK
 platform
Content-Language: en-US
To: Po-Wen Kao <powen.kao@mediatek.com>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Stanley Chu <stanley.chu@mediatek.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: wsd_upstream@mediatek.com, peter.wang@mediatek.com,
 alice.chao@mediatek.com, naomi.chu@mediatek.com, chun-hung.wu@mediatek.com,
 cc.chou@mediatek.com, eddie.huang@mediatek.com, mason.zhang@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com
References: <20230307065448.15279-1-powen.kao@mediatek.com>
 <20230307065448.15279-6-powen.kao@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230307065448.15279-6-powen.kao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_143635_200049_CDC56F60 
X-CRM114-Status: GOOD (  14.80  )
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

On 3/6/23 22:54, Po-Wen Kao wrote:
> +static unsigned int mtk_mcq_irq[UFSHCD_MAX_Q_NR];

Shouldn't there be one instance of this array per controller such that 
this driver can support multiple host controllers instead of only one?

> -	err = ufshcd_make_hba_operational(hba);
> +	if (!hba->mcq_enabled) {
> +		err = ufshcd_make_hba_operational(hba);
> +	} else {
> +		ufs_mtk_config_mcq(hba, false);
> +		ufshcd_mcq_make_queues_operational(hba);
> +		ufshcd_mcq_config_mac(hba, hba->nutrs);
> +		ufshcd_writel(hba, ufshcd_readl(hba, REG_UFS_MEM_CFG) | 0x1,
> +			      REG_UFS_MEM_CFG);
> +	}

ufshcd_config_mcq() in the UFSHCD core already calls 
ufshcd_mcq_config_mac(). Why is there another call to 
ufshcd_mcq_config_mac() in the MediaTek driver?

> +	/*
> +	 * Disable MCQ_CQ_EVENT interrupt.
> +	 * Use CQ Tail Entry Push Status instead.
> +	 */
> +	ufshcd_disable_intr(hba, MCQ_CQ_EVENT_STATUS);

UFS host controller drivers should not call ufshcd_disable_intr().

 From the UFSHCI 4.0 specification: "MCQ CQ Event Status (CQES): This 
bit is transparent and becomes ‘1’ when all of the following conditions 
are met:
• Controller is operating in MCQ mode (Config.QT=1)
• ESI is not enabled (Config.ESIE=0)
• CQES set only for Events in Queues that do not have interrupt 
aggregation enabled or the Events that do not belong to MCQIACRy.IACTH 
counter operation criteria.
• At least one bit in CQISy is set and associated bit in CQIEy is set. 
y=0..31"

Is there perhaps a bug in the MediaTek controller that causes the MCQ CQ 
Event Status to be set in ESI mode? If not, can the above 
ufshcd_disable_intr() call be left out?

Thanks,

Bart.


