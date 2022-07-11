Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF0BC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 17:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSFkKSsB61cSencPZX5e8kmY/fgnez67OIo3PXDb/O8=; b=MYrVvabrAgrAg83uOaGmM5p+ZC
	yCTPtlMBwkgYqBq2A12nCudX5x4au8Asr3DRqbn5h/wdfuYIHVru3vvKA49mcBZUBdfZ4pWrkr93o
	E+bvLuwsGgMY7NG4k6BhPDMoDpgo8P2wWV+D2EXEdNVT8uDM9JQmZ7aZphc7/aq1df3skH0UGAMrp
	g5P3cM/J3YZrt4DL4goHExx3EglxVi4+94ZaHb1vypGqGkBH4CT8fiLm9k9UFlJ5N1DA+uQVpWkK0
	yoAbHH9jBBV/zXwP4NPZhxxwVLz9v2S5bGgxWjhGIjHuqH8MAiMnNguq9jLonrzmFc7RWj/Diyw8K
	1SkZGiEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAx2J-003RW2-3l; Mon, 11 Jul 2022 17:17:31 +0000
Received: from mail-pl1-f173.google.com ([209.85.214.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAx28-003RLg-4E; Mon, 11 Jul 2022 17:17:21 +0000
Received: by mail-pl1-f173.google.com with SMTP id j12so4977199plj.8;
        Mon, 11 Jul 2022 10:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qSFkKSsB61cSencPZX5e8kmY/fgnez67OIo3PXDb/O8=;
        b=y7mwE452Qh6qg2bXcJDog6soCpoDGLIlXZMFgKe2XM0Rgw9qyjvWSumfDKAKm24en8
         w+Cjs7BjyQ+WarGwSzoZ2AgLHxQLNj58lKUIbrJCzZMwhnvYOGgAjN5kx0FzI9DrxLJ4
         BQzc0mGwloBHlcPR4FT3qIvc3u7ejfq3lDFXRPXKMpDxNXmSn0WqCGTwoNJNZtWta0pJ
         hzDuBNW17lO3cu6jRmD8tQOnru9HGy4k2j2qyKUDlP1MQRtBvcGX9uIRSp19trKElKgm
         JZkrCxLf9TEsHJJc4Dhl+X7UifaAer54l5pE/PKa7AfNo96gvSmT08qfdzOqKALxz4Uq
         tL+A==
X-Gm-Message-State: AJIora+kOwBihr/MICxWc+Olq01cEQQRWvU5weECCxOOqmS6w2OxJkEx
	3LZuuhIZHTQ3lpbqg6OTefs=
X-Google-Smtp-Source: AGRyM1vTWWIhdhxc86vQkxgnZb04W+HRgqmSHxh7cnXsSMnOb9PJSuvMZgj5M8eYDCdY3nEB9iyA+Q==
X-Received: by 2002:a17:902:c7d5:b0:16b:ea78:4eb4 with SMTP id r21-20020a170902c7d500b0016bea784eb4mr19399565pla.65.1657559830453;
        Mon, 11 Jul 2022 10:17:10 -0700 (PDT)
Received: from [172.16.225.97] ([99.0.87.44])
        by smtp.gmail.com with ESMTPSA id e11-20020a056a0000cb00b0052974b651b9sm5042485pfj.38.2022.07.11.10.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 10:17:09 -0700 (PDT)
Message-ID: <317c8196-0e79-7b1d-cc78-64dfb9f7ca8e@acm.org>
Date: Mon, 11 Jul 2022 10:17:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/1] scsi: ufs: fix missing clk change notification on
 host reset
Content-Language: en-US
To: Po-Wen Kao <powen.kao@mediatek.com>, asutoshd@codeaurora.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: wsd_upstream@mediatek.com, peter.wang@mediatek.com,
 stanley.chu@mediatek.com, alice.chao@mediatek.com,
 chun-hung.wu@mediatek.com, cc.chou@mediatek.com, chaotian.jing@mediatek.com,
 jiajie.hao@mediatek.com, mason.zhang@mediatek.com,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220711144224.17916-1-powen.kao@mediatek.com>
 <20220711144224.17916-2-powen.kao@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20220711144224.17916-2-powen.kao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_101720_201675_6D29F1B9 
X-CRM114-Status: UNSURE (   8.68  )
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

On 7/11/22 07:42, Po-Wen Kao wrote:
> In ufshcd_host_reset_and_restore(), ufshcd_set_clk_freq() is called
> to scale clk rate. However, this did not call vops->clk_scale_notify()
> to inform platform driver of clk change.
> 
> We propose to call on ufshcd_scale_clks() instead so that clk change
> can be properly handled.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

