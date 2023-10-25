Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0F2C0032E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 18:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2iMDVchob+o0oV/0w+uz7B6gj0y4M0k4PlyjKILH9gA=; b=i4HAVNfsr0kCm/lI/tHAJ7qnKI
	w9vgFMPLfSeHSFDvTOPf5lIac1DpCu1knx8rkbB3mXH6m9tlH89jWozmT0tzbRJFNOSppEPOy29vL
	jmvjQtqKXIdzJ9x4bBUblaHp9ioO1VntJuZMboS+2f4oN6lYij6DZCqeD5GtHztClcnMTUnpmYvBz
	rTlaOTR8XyLmx88OCY9sZodpWOM8WeTAP9ZPTdk1TkkF6Y0LrN2OWOrhoFjnTGmfdhCfnlyxx/h0R
	1KwsYd7CH2k1NxsAw+0bwzVfpg1X38m7SAlrKGDvT98bv6I3tVnTl82TpFBHlAO/AQ0+g+GkmTsOP
	VNiCY74Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qviLY-00CqRN-03;
	Wed, 25 Oct 2023 18:11:12 +0000
Received: from mail-pl1-f173.google.com ([209.85.214.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qviLR-00CqQ6-0R;
	Wed, 25 Oct 2023 18:11:09 +0000
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1ca215cc713so40362885ad.3;
        Wed, 25 Oct 2023 11:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698257462; x=1698862262;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2iMDVchob+o0oV/0w+uz7B6gj0y4M0k4PlyjKILH9gA=;
        b=T7xUfoIritS/uTNBhcpejv4P9K0PJzIrAQGww7POIDnyqT7V/+DYzYFbCZwzdBldbF
         MmgRspgHmjaqWjBEBL8zEwkSL1pBBKjeKZh3R/+lnKvQepVsA7nZd82ft4LBH6EvX+EN
         T7ls7iiXf/v5Q29wcZfX3Yg4lzUU7gW1uxuQ4WBsSVX8iP4Kn9x6W02ii84cnnA2j711
         FFBaOvGtg/SeI0zT/y/KiSiviRNjKdWztw2zSakYhsgDhKotCb/RHMAYfpzlxcxtBLMB
         SbVUMo7WCRNvqyc/bJIf78YIQL+6GZrqDAUjQ0+DpVCzYB+RVh4iTgCG1x1aZ/qOeTje
         3Gwg==
X-Gm-Message-State: AOJu0Yy+nFuDaFT0XC0kMso8eK+pRboAd0/7652GUBwoJEjtUHG6/BT6
	FM4LC4Y6ISKjkkgu/OmUykc=
X-Google-Smtp-Source: AGHT+IGtLL78u4rxM6Ezz9EpLFh9pOezvZDqe0pqsvnGikICyGsJSHiluvDfQH+FuAEE/xdAf7UhSA==
X-Received: by 2002:a17:902:c404:b0:1c7:8345:f377 with SMTP id k4-20020a170902c40400b001c78345f377mr17227158plk.29.1698257462403;
        Wed, 25 Oct 2023 11:11:02 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:4dcf:e974:e319:6ce8? ([2620:15c:211:201:4dcf:e974:e319:6ce8])
        by smtp.gmail.com with ESMTPSA id jw15-20020a170903278f00b001bb99e188fcsm9560717plb.194.2023.10.25.11.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 11:11:02 -0700 (PDT)
Message-ID: <3056c6d8-1e54-4954-9141-e0760a0d935a@acm.org>
Date: Wed, 25 Oct 2023 11:10:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] ufs: core: Add host quirk
 QUIRK_MCQ_EXPAND_QUEUE_SLOT
Content-Language: en-US
To: Chun-Hung Wu <chun-hung.wu@mediatek.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Can Guo <quic_cang@quicinc.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Asutosh Das <quic_asutoshd@quicinc.com>,
 "Bao D . Nguyen" <quic_nguyenb@quicinc.com>,
 Yang Li <yang.lee@linux.alibaba.com>, Eric Biggers <ebiggers@google.com>,
 Keoseong Park <keosung.park@samsung.com>,
 Arthur Simchaev <Arthur.Simchaev@wdc.com>
Cc: wsd_upstream@mediatek.com, casper.li@mediatek.com,
 peter.wang@mediatek.com, powen.kao@mediatek.com, alice.chao@mediatek.com,
 naomi.chu@mediatek.com, cc.chou@mediatek.com, chaotian.jing@mediatek.com,
 jiajie.hao@mediatek.com, tun-yu.yu@mediatek.com, lin.gui@mediatek.com,
 eddie.huang@mediatek.com, qilin.tan@mediatek.com,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel-team@android.com
References: <20231025085656.10848-1-chun-hung.wu@mediatek.com>
 <20231025085656.10848-2-chun-hung.wu@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20231025085656.10848-2-chun-hung.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_111105_193763_CD4F275E 
X-CRM114-Status: UNSURE (   7.65  )
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

On 10/25/23 01:56, Chun-Hung Wu wrote:
> This quirk needs to be enabled if the host controller cannot 
> distinguish queue full or empty.

 From the UFSHCI 4.0 specification: "When the head and tail doorbells are
equal, the queue is empty. [ ... ] When the head and tail doorbells are
not equal, the queue contains queue entries."

How is it possible that a host controller cannot distinguish queue full
or queue empty? Which (head - tail) values cause trouble? More
information is needed.

Thanks,

Bart.


