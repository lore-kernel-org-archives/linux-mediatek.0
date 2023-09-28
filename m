Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C16E732E7
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 16:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2iqyjYpQGTrxNm51cwmEMqS/kvTM8R+SxrC6ZJz7Qc=; b=LQsNB5ZnIztfiNoGq2rHqa+WlQ
	aCBuBgLRh1/MfnSWPQdm5zX5veI7KtpHhCLWkSyQn6h/Ci0+jAazNTY7+9Kd8IPs/ydHiOtB8t/zx
	pihOUcTfaXnpLTMcFSpFbm75Usq2bNzqzeafEo+tMX+3A3pgLY6VY1VYNKdDDomRhE379O2794vNB
	rNClt8P3+n/BXjiuo+LbvzkASmEhU1EwR+dZcrKFcYHkB/OTdTvTZQ/3xzXbdG3C4G6GWvB8sjYE3
	JRPicH+RO31d0/Aekp2DG+LyyFZCPAhPvTN2xwgE3/FZ3iq274F2Fn2fiVxUh5FuIm+WCSCewAtmv
	tu+oUjUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qltui-0061dR-1U;
	Thu, 28 Sep 2023 16:30:56 +0000
Received: from mail-oo1-f43.google.com ([209.85.161.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qltug-0061Zv-1J
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Sep 2023 16:30:55 +0000
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-57bb0f5d00aso5355239eaf.1
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Sep 2023 09:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695918652; x=1696523452;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2iqyjYpQGTrxNm51cwmEMqS/kvTM8R+SxrC6ZJz7Qc=;
        b=I3X1ezih3HmIAyPCO+TOhqLAkCYaHxi6NAOYMLKv/wMnYIXTpw8fUu+Cxe/yQ/Seav
         Hp0XM1U5GRfw7X07gcs8uwWSOppQtOW7BAAwIZdKHBEEp3VlU4o7mJn+Y9jXAWrpHVqi
         Y/5EUEloDfq9z0IvW1tG86ol3z6UDAFZWQr/6lVEdbaV16gZ3Q4c5GoiA6OOfjP0r3Qy
         2faS7LdnfqaZHWF5QyOMl/D+X43MyMc89JL2Bj2XVP3z16tBmthrn9H2AbnCL54i1uvk
         tEMH3lovbPeOUq3s/CqP0w2o0B3w4wzF1oMwPHlRXuJMnh1dxDmaG6nVP+J+zc0TrR9A
         BXeQ==
X-Gm-Message-State: AOJu0YzrgjuivOnB4/lKtzTptblC/2kdIMjVhdC+/M6RiJ3wqHQzKQHm
	4TN+piQ/fA0iK+lgAh9Q/BpCnwYAIrc=
X-Google-Smtp-Source: AGHT+IF7pCy57fl4xj1AT8sSnvd4RelGdW4sNUL0MQQFCnsQevUl9J895xnVbGqCHtzAiiVC314krg==
X-Received: by 2002:a05:6358:4297:b0:143:9b23:e850 with SMTP id s23-20020a056358429700b001439b23e850mr1942507rwc.24.1695918651885;
        Thu, 28 Sep 2023 09:30:51 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:4d78:c1af:9677:9afd? ([2620:15c:211:201:4d78:c1af:9677:9afd])
        by smtp.gmail.com with ESMTPSA id c15-20020aa7880f000000b00690d64a0cb6sm13592829pfo.72.2023.09.28.09.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 09:30:51 -0700 (PDT)
Message-ID: <ba3a0af8-8464-43d4-a2e6-a82de7ebe2ae@acm.org>
Date: Thu, 28 Sep 2023 09:30:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] ufs: core: wlun send SSU timeout recovery
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com
References: <20230927033557.13801-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230927033557.13801-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_093054_464551_E7D3C534 
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

On 9/26/23 20:35, peter.wang@mediatek.com wrote:
> When runtime pm send SSU times out, the SCSI core invokes
> eh_host_reset_handler, which hooks function ufshcd_eh_host_reset_handler
> schedule eh_work and stuck at wait flush_work(&hba->eh_work).
> However, ufshcd_err_handler hangs in wait rpm resume.
> Do link recovery only in this case.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

