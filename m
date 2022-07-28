Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824BAC04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 21:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lyi8U+Ii4fVfb5gf7+2FrD8JGQrjhTiU6yH1xtTTg/w=; b=r0qYiDi+R3leh9URdaORmo/Td2
	DVs3+xza4HuEvVfDFBO+rKa7oZZJuxOlLVAVaPG89M+2RLdoV5ovyqLD5/G4wooRL2bSc1++bvGR+
	lceya27HLJwbZl0nND6WO6zSzeZ4+VQ07ywG6s/nOH4K2PTQEmJv5vgpI5JSmS6Da8JdexkLg1Csg
	tQdbo5iUFXNQfe4goWfwGO2kU1mXwcd/ld4hGvmWQOwhOzomR5Yave5tvZUzT3lAQ9wV04odyUSat
	MuodoTyx20EcFON4j41KZQJkBtUVCKWeIgTCGVPifowp7B8Qyv2gUB+eOx+cklGF91jOaLd6GZQsi
	rvXudOjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHAl1-00Ean5-5x; Thu, 28 Jul 2022 21:09:23 +0000
Received: from mail-pj1-f54.google.com ([209.85.216.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHAkx-00Eam7-HG
	for linux-mediatek@lists.infradead.org; Thu, 28 Jul 2022 21:09:21 +0000
Received: by mail-pj1-f54.google.com with SMTP id f11-20020a17090a4a8b00b001f2f7e32d03so5890730pjh.0
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Jul 2022 14:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Lyi8U+Ii4fVfb5gf7+2FrD8JGQrjhTiU6yH1xtTTg/w=;
        b=y8K+VPIoG45lx5vHwwT8yMVr6RGCfm2JP0W5vCziajxGMu/fCYPccd0G6doxQBY8WO
         t+4mGCLp5LaG5vbG+1ZF573i5VN/+kivmjrRbzLAjCPNYqB0Rvb280+iYvsHcLzyy8KY
         Rb3AIf7F8cknEoqBcpckQyICHHPxh+c8uXEZq1xTUqrsSSKGMMVfJf1PoCI3JBu45elM
         fGEQRF3/8gcHvsDzYUdhPjUF8/ZVONZdVrkEFY3qKZDAvh0x7idLGCeYsZplxSHxIRKo
         3zyfmNBchns8MPfYiMKqfZj6YjTfRqAMkzYgW2kohHwRQoj25HR+0cgPcvGWt+V/5mgJ
         FXqQ==
X-Gm-Message-State: ACgBeo18hzlMdpRpA36xx9nYpiLEPXrm9uH0EiJAQclXEM8lET7FT8RH
	LWMgOqQrqE+jXoEOk6QXU2Q=
X-Google-Smtp-Source: AA6agR64abIOX2ysY7VcL3JkGNB0p5eUsBWTITWET/AvauG63Mt114Tw/uFvUHgzRplDX9SS0QSR3g==
X-Received: by 2002:a17:902:a382:b0:16d:9b15:83d5 with SMTP id x2-20020a170902a38200b0016d9b1583d5mr669128pla.101.1659042557265;
        Thu, 28 Jul 2022 14:09:17 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:9520:2952:8318:8e3e? ([2620:15c:211:201:9520:2952:8318:8e3e])
        by smtp.gmail.com with ESMTPSA id l13-20020a170903120d00b0016b8746132esm1889851plh.105.2022.07.28.14.09.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 14:09:16 -0700 (PDT)
Message-ID: <968f5255-f7b9-e011-2bd3-aa711bdd142a@acm.org>
Date: Thu, 28 Jul 2022 14:09:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 0/2] ufs: allow vendor disable wb toggle in clock
 scaling
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com
References: <20220728071637.22364-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20220728071637.22364-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_140919_593137_D756622E 
X-CRM114-Status: UNSURE (   9.38  )
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

On 7/28/22 00:16, peter.wang@mediatek.com wrote:
> Mediatek ufs do not want to toggle write booster when clock scaling.
> This patch set allow vendor disable wb toggle in clock scaling.

I don't like this approach. Whether or not to toggle the write booster 
when scaling the clock is not dependent on the host controller and hence 
should not depend on the host controller driver.

Has it been considered to add a sysfs attribute in the UFS driver core 
to control this behavior?

Thanks,

Bart.

