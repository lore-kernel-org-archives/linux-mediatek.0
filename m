Return-Path: <SRS0=Aqg+=2Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE8DC2D0DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Dec 2019 17:38:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2766206CB
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Dec 2019 17:38:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XOhpYgvN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2766206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iGF4HCZ+RQ0d/nrxqTokAkLnd0YatB/UTW2wGRUSk7U=; b=XOhpYgvNPhAxOUa16HQH5rvmd
	1WrfupfE8tcRI/7wwDOu2VVJTa+Lui23HPje6L9heN2BlYf+1pnjvSAz89VrpwvmXmpXRCmKcF77X
	vyOS+Fy0RW4PHjw8B93cAjop1VklsNzSMmbstuJRU9LhcMTDzxS0ySqk7DS1hnRhD8YWVs+4PwTCr
	OZVsslWFHJI+cJTroAhyx9tzWoV/k1X+VNYDhmB0mJ4LCpmCtbf2swV1Va/XXbtCiRiDR/o92OdSV
	zI0u743QZANpAmKyBjLLnaUxuMht0sDJ+oyEqliInROeqVGjEMjCYTZIuRfZgyt+OLo2HDyEwxEth
	X5mXEHcmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikX5S-0003D8-MS; Thu, 26 Dec 2019 17:38:14 +0000
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikX5J-000347-AU; Thu, 26 Dec 2019 17:38:06 +0000
Received: by mail-pf1-f195.google.com with SMTP id x185so13467035pfc.5;
 Thu, 26 Dec 2019 09:38:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MmHJMhL/ClL96dvLO618jh4MTLRMaTH5YzPmbcG1nUg=;
 b=HA1sWAJRjZNNNAtHZFawyj+baJJfAxM5TzPKC2qMlSETm2J98/m1/7XfVgA8SU0suB
 tCL96EjtcLtbAdheVycpUKYY3JqozYTpz/zUrwGAfkc4EPojCytAa6VSkzb1mSFupQyv
 uuDx8Hyn1AIzpvmoXv+0jOD3ayUlZ4P7WUnbeBhQl1vE3yOWgF1Op8DuIppLrFF44v1m
 hMSa2K0Bem9DCKv5xfo2gvOWqDxnamUa7W3pAH2c7EUGo5yT9wcYPpIhd/z4B1cJJFex
 GfdmJur257p58MStYCOYXACa8+thN5A2whovWH5YsTx3kTK4TIO3LQ+l3OKLUxhTO+Sj
 uhZQ==
X-Gm-Message-State: APjAAAXTMS2qL7u4pQbLS8E/Sra92gJW+HUkfc7akkaoJTuO9Q4L/3C7
 hqGwMGw1Ezk1fFsEra/hU68=
X-Google-Smtp-Source: APXvYqyascaaQ389fbn+3f8vAXtesPLJnuQSNGE9PhWj5Y6WVbwdID0iWpamDa9hSnWdFNKZeQ0HZw==
X-Received: by 2002:aa7:946c:: with SMTP id t12mr40719359pfq.137.1577381883806; 
 Thu, 26 Dec 2019 09:38:03 -0800 (PST)
Received: from desktop-bart.svl.corp.google.com
 ([2620:15c:2cd:202:4308:52a3:24b6:2c60])
 by smtp.gmail.com with ESMTPSA id q193sm33834849pfc.132.2019.12.26.09.38.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Dec 2019 09:38:02 -0800 (PST)
Subject: Re: [PATCH v1 1/2] scsi: ufs: unify scsi_block_requests usage
To: Stanley Chu <stanley.chu@mediatek.com>, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 pedrom.sousa@synopsys.com, jejb@linux.ibm.com, matthias.bgg@gmail.com
References: <1577192466-20762-1-git-send-email-stanley.chu@mediatek.com>
 <1577192466-20762-2-git-send-email-stanley.chu@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <96961682-9455-907d-753d-40c87cfc6b15@acm.org>
Date: Thu, 26 Dec 2019 09:38:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1577192466-20762-2-git-send-email-stanley.chu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191226_093805_363996_61BC9282 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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
Cc: andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 12/24/19 5:01 AM, Stanley Chu wrote:
> Currently UFS driver has ufshcd_scsi_block_requests() with
> reference counter mechanism to avoid possible racing of blocking and
> unblocking requests flow. Unify all users in UFS driver to use the
> same function.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
