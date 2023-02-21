Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39DAC61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 18:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2cL3ZFx6aC3gkxJxvOMXx9WjSRbCkQiOWXyY6yTANeM=; b=h/ltZ15vlaT8McDmAEhc7Re2QU
	ZquskdL8zo0DWHCt3jLV/iVMqTGftTdGDYdc9bxgzrM7PHuRWClVIZmeixWLRXICCx8JgruEeDX9p
	qvbyrtKg5W+ZLT/zeexPnKBTHQkkLirqWLLyT9VnqgC9nF57nNbdcDI+LZ0mfkMxDYGd0PzwbFvgN
	tFwCobvf2w4dAN+gHO5s1Jo2p9v3KCx8x+z31fGjdeQE7nYylfHKLUKjMgFPcdXP4yoel0aY3Dmda
	pCMKhz6O0E1wi5L9A+WEgipxUYWiID1iw1kirWRRxlK+KGx1urbyF45EoiTfc6d6Mqb8ceaWYjqJP
	ZqgNcjmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUXrY-009SvI-JK; Tue, 21 Feb 2023 18:59:40 +0000
Received: from mail-pl1-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUXrM-009SrY-Nb; Tue, 21 Feb 2023 18:59:30 +0000
Received: by mail-pl1-f177.google.com with SMTP id bh1so6132348plb.11;
        Tue, 21 Feb 2023 10:59:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2cL3ZFx6aC3gkxJxvOMXx9WjSRbCkQiOWXyY6yTANeM=;
        b=S2e6NTuwXewYq3/EazPUzOhuMQvi7lHkKzBKFaP0WpilNP8h2mVzz7OF6P7HVGp/jy
         CsyzI3V5xbc/VpdIRzb1yYuN/wDBqGuAuRtAX0GUYvAcdO5HB0WcyZQjw7taKPdq3yAW
         muPswFpcd0ti3T+Abeu8A0fojEwN/YRf1e8Li1J9Ql8binu/ICiizl4ibMYdktgpCV+h
         8hZO8Irfsg0IV+si0imBc2zkAY3NRP67luGiEQus5b/nDOtYHYRiiR8v9p5pAc5QRNtm
         MEZaLwBAtga0vcuek2dC565fS2udNM4tvmYwMRwgD8Cv7hwDqhKyGh6rV6iwg3hTXdV3
         WfTg==
X-Gm-Message-State: AO0yUKXm2mHvp7bhFft6p9ET3wXeIQQ+L22jq/T64dzLoj/xaaIrsv+S
	HP946Mom2cKAkOMBaKu6NiM=
X-Google-Smtp-Source: AK7set9lPF6cFg2TrDVnvULDaoSMrKvHt5cnFIbWmkWdEjEjRHpTKCF9iv2Q8wwA/KX5Nq0Lme09Rw==
X-Received: by 2002:a17:902:ec8e:b0:196:89bc:7100 with SMTP id x14-20020a170902ec8e00b0019689bc7100mr10171339plg.16.1677005963782;
        Tue, 21 Feb 2023 10:59:23 -0800 (PST)
Received: from ?IPV6:2620:0:1000:2514:6f67:63f5:599a:2f4c? ([2620:0:1000:2514:6f67:63f5:599a:2f4c])
        by smtp.gmail.com with ESMTPSA id bf3-20020a170902b90300b0019aa4c00ff4sm10231070plb.206.2023.02.21.10.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 10:59:23 -0800 (PST)
Message-ID: <8268452f-cc33-81cb-32be-a9e37f97894f@acm.org>
Date: Tue, 21 Feb 2023 10:59:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/4] scsi: ufs: core: Fix mcq tag calcualtion
Content-Language: en-US
To: Po-Wen Kao <powen.kao@mediatek.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: wsd_upstream@mediatek.com, peter.wang@mediatek.com,
 stanley.chu@mediatek.com, alice.chao@mediatek.com, naomi.chu@mediatek.com,
 chun-hung.wu@mediatek.com, cc.chou@mediatek.com, eddie.huang@mediatek.com,
 mason.zhang@mediatek.com, chaotian.jing@mediatek.com,
 jiajie.hao@mediatek.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230221152919.25837-1-powen.kao@mediatek.com>
 <20230221152919.25837-2-powen.kao@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230221152919.25837-2-powen.kao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_105928_798901_82656E72 
X-CRM114-Status: GOOD (  10.32  )
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

On 2/21/23 07:29, Po-Wen Kao wrote:
> Transfer command descriptor is allocated in ufshcd_memory_alloc()
> and referenced by transfer request descriptor with stride size
> sizeof_utp_transfer_cmd_desc()
> instead of
> sizeof(struct utp_transfer_cmd_desc).
> 
> Consequently, computing tag by address offset should also refer to the
> same stride.
> 
> As suggested, sizeof_utp_transfer_cmd_desc() is further renamed to
> ufshcd_get_ucd_size().

This patch includes two changes:
(1) a bug fix.
(2) a name change for a function.

A Linux kernel patch should include only one logical change. Please 
split this patch.

Thanks,

Bart.

