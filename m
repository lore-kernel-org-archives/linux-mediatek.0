Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BFFC77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 12:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqGnCPChL19fXfFgwza4KZGrYtNeSBi3Wbd7oMZ8AFA=; b=zxbR7drPIy7UNRz4/8Bx6rnA/N
	y0MXXt3bdnBRfZWK1MQJmID/elmkYQoCL4LdbjRKK2y/GES6n65q9lLzkz8d38fEBibB1YEuKOFFi
	Defh6cneb3FHqTpjvq7NQ0ibocPG2bczSEcwkDzy4cnnTJvOV0HBFdbdwZsWPO8rA1HZPOAWgr3nM
	CzVZc1lYhKJ06KtvOh88s2ufq+MGypYx4UQyV1ol3D+ZK+aEtxCEsKh5KUpRPQ9HJRGblreq3z91I
	sk20u2+Raw7hpOxeQBVwZCWcdcMMkQYih5HdS7FOL2PRF/CdXx0aA5ip5F/QxAEISJuELlulQh+c2
	ruhT6e3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4LFj-00HPOo-2Z;
	Wed, 31 May 2023 12:48:35 +0000
Received: from mail-io1-f54.google.com ([209.85.166.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4LFg-00HPNo-2M;
	Wed, 31 May 2023 12:48:33 +0000
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-773793070a4so149872839f.2;
        Wed, 31 May 2023 05:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685537309; x=1688129309;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xqGnCPChL19fXfFgwza4KZGrYtNeSBi3Wbd7oMZ8AFA=;
        b=EjxOYoYkNgSccCqOQZEwPEeFrhUX5ydu2Y5IW2c932gTuRAx6k2ySXVHPk5dHJpZac
         xEEPsoMMoZSFiqpVvpvFFYV4tXMuoXKLKfNrwdyiHVRmiS1o3bnPALN3fZ4lIbhvQazk
         tGYoXqEdax8tnjSB4+osjpsoZ/0bbjIZz01LWn/HjW9UxnjdLLjs2py7dKWvLMp72uEP
         FXwozMbHvV/q4OyVRCpdmsXJAFquTdxEqtyae4GDmFekhK1tEjcFgNxibbXj9qDTxMCf
         MmxGSe8o6DMgsMCCoR7syRmlnM36yHEXJFbKI9Rs3Dw35SRksDNzezOp6rrwvsTyeZx1
         7xgg==
X-Gm-Message-State: AC+VfDzOMYnZaLqVnYPb0W+XBGoIITA5mVmwYH6Y8eUguTL1Z74hd0nm
	FN+qT3OmWKDOtdZj/akxRGQmqj8vHuk=
X-Google-Smtp-Source: ACHHUZ4R4uX8mr/AZ2HXFs3fevTI77W0Xf8YIKy1DNJDCRdolpMdohmafLKGMFXSOzxIB2JLuXEyKQ==
X-Received: by 2002:a6b:d914:0:b0:769:a826:2818 with SMTP id r20-20020a6bd914000000b00769a8262818mr4531978ioc.16.1685537308401;
        Wed, 31 May 2023 05:48:28 -0700 (PDT)
Received: from [192.168.51.14] ([98.51.102.78])
        by smtp.gmail.com with ESMTPSA id c12-20020aa7880c000000b00646ebc77b1fsm3295119pfo.75.2023.05.31.05.48.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 05:48:28 -0700 (PDT)
Message-ID: <ec9c378c-fedd-5a90-bb12-085395e0d22e@acm.org>
Date: Wed, 31 May 2023 05:48:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/3] scsi: ufs: core: Introduce mcq ops to config cqid
Content-Language: en-US
To: Stanley Chu <chu.stanley@gmail.com>
Cc: Po-Wen Kao <powen.kao@mediatek.com>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 wsd_upstream@mediatek.com, peter.wang@mediatek.com,
 stanley.chu@mediatek.com, alice.chao@mediatek.com, naomi.chu@mediatek.com,
 chun-hung.wu@mediatek.com, cc.chou@mediatek.com, eddie.huang@mediatek.com
References: <20230530023227.16653-1-powen.kao@mediatek.com>
 <20230530023227.16653-2-powen.kao@mediatek.com>
 <1c182151-6e8c-5068-b38c-f8e842e6e13b@acm.org>
 <CAGaU9a9TsoaUtoMX8cNmAhfBnCddRtWYEG8ACdRNJfri+sdasg@mail.gmail.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <CAGaU9a9TsoaUtoMX8cNmAhfBnCddRtWYEG8ACdRNJfri+sdasg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_054832_767751_FCAF11B3 
X-CRM114-Status: GOOD (  12.21  )
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

On 5/30/23 18:54, Stanley Chu wrote:
> In addition, some benchmark data shows that the performance can be
> improved by using fewer CQs to aggregate the interrupt handling of
> completion requests.

What has been measured? IOPS only or both IOPS and latency?

How big is the difference? A few percent or more?

For which number of SQs and which number of CQs has performance data 
been measured?

Would the following work instead of introducing a new vop?
- Introduce a new capability flag, e.g. UFSHCD_CAP_SINGLE_CQ.
- Set that flag from inside ufs_mtk_init().
- Modify the UFS core driver such that the number of completion queues
   depends on the UFSHCD_CAP_SINGLE_CQ flag.

> Therefore, we would like to introduce a vop to allow the host to
> configure it accordingly.

We do not accept new vops upstream without a user. Where is the 
implementation of the new .config_cqid() callback?

Thanks,

Bart.


