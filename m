Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65EEC636CC
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 13:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYAnZ/YKKMZS0ESVTb/QD70EINljsBIpkmayN7aaRjY=; b=qvqPAPn7w7+w9I5K3lYveayiEP
	4gCgnrtdlaczwAlD5Ba1xVT51tEqdwPwaUJTGHl/W1ka4Zr2PV5P8yHxrb0sspo2fsW5cIm3qkVLj
	axVsE/tLefmE/XlL/cQXcgx9dzJmUqKHulW6ssnD906vCUMPe68bCglBCQrRob2BNnA11ThLEUlke
	26HRIUm+8Fo8xAke00aoTuJpDYYgUNtPWJ2sMZpDKWJh1HV8acc4l9fu1ouu0OCvJeIZgG2ALYFk9
	8hQfCHIqULk6ts3+q0nM7b3D/oa7wkX4aQsda6ul18gcIdWuD2DrGM5reWN18HI9nl9KmpmwiGRtW
	IEX1Kg/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqcj-0084rR-Ne; Tue, 31 Jan 2023 13:24:33 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqcM-0084gz-K0; Tue, 31 Jan 2023 13:24:12 +0000
Received: by mail-wm1-x335.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so12447523wma.1;
        Tue, 31 Jan 2023 05:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uYAnZ/YKKMZS0ESVTb/QD70EINljsBIpkmayN7aaRjY=;
        b=oThxhhvGEHzBRodyxvZhenx9d/DdJBBOrLzYg3WN6xin/pwCMuCMZSRjIJNX5tJl1m
         4WIsMGxZllazPJS8FWgre5+cUPGzId2umKrw2Mc0mCJRVC6P8tMi4syNXMiXZo0T5EzE
         3bFMu3IXVz+xwhzgWC24XZ0pM+x7sq+XW4CBkBtMUIcst9PGNMmj7As8gixEW4sGkXFv
         1xSljzi9FpAoxU99dDynD21Y1+wHmBhHxqvwguKmWkmMu9FnvxVdQZFPkjCWS5FQnvUb
         1zFXACdPYiEsVdB/qaSrqDomknSSnTkUFVffFWP72yjiOZCqN7WvxLO4y725cr+IYldH
         2sLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uYAnZ/YKKMZS0ESVTb/QD70EINljsBIpkmayN7aaRjY=;
        b=E8cO1s0bfGZ7Kaxe8OQT0qc6gt+mrvS+sjugib5EVL7hwdkp3OI1jAkpcMrsl92oMX
         YZeBoI7N65S0FmLRw4gx8g8EwKfBe/SHyqltPaeuVhssvXGdhxObncDXVH9fOiy4AkQe
         OUwcORooKKvrfrCr+kGy5mNPCNTEyYbNbpmKI+4WqKi6HWmyMlYLB9kJ23fGVH7YI/hR
         AFq6LIBseXzb53KpgcURvZ7IjVA1MdfiFEkmkRsEPyxZ75JOo5jeQsntWkkOL2TOGheo
         c4ZWlac3nFY90BjsVTkjQcB7Q/JALAdHN+A3Heuv5JWPPeaxDowF2lvzaKi/tzI1XFgJ
         ElZw==
X-Gm-Message-State: AO0yUKWLJkEobGSUwGlaqZ77BxQpWWPE7ZnzJOYod+JdrWgdtosfKNXg
	X82UvxcxqU0BBUhYdm3rUi8=
X-Google-Smtp-Source: AK7set+wO+ccUoqK04iTl8+nmE2aEHP+M+nzLL77INW0lcsGsDqoKdu7CQsLyWZX//2uQN7rA/neTg==
X-Received: by 2002:a05:600c:1d0e:b0:3dd:1bcc:eb17 with SMTP id l14-20020a05600c1d0e00b003dd1bcceb17mr3459855wms.28.1675171449053;
        Tue, 31 Jan 2023 05:24:09 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id u20-20020a05600c00d400b003dc5343188dsm8198730wmm.24.2023.01.31.05.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 05:24:08 -0800 (PST)
Message-ID: <6ef5047f-5728-3729-ddcc-c3a90eeb0483@gmail.com>
Date: Tue, 31 Jan 2023 14:24:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 07/14] soc: mediatek: mtk-svs: keep svs alive if
 CONFIG_DEBUG_FS not supported
Content-Language: en-US
To: Roger Lu <roger.lu@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Nicolas Boichat <drinkcat@google.com>
Cc: Fan Chen <fan.chen@mediatek.com>,
 Jia-wei Chang <jia-wei.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230111074528.29354-1-roger.lu@mediatek.com>
 <20230111074528.29354-8-roger.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230111074528.29354-8-roger.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_052410_713812_2ED1680A 
X-CRM114-Status: GOOD (  17.83  )
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



On 11/01/2023 08:45, Roger Lu wrote:
> Some projects might not support CONFIG_DEBUG_FS but still needs svs to be
> alive. Therefore, enclose debug cmd codes with CONFIG_DEBUG_FS to make sure
> svs can be alive when CONFIG_DEBUG_FS not supported.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>

Applied, thanks!

> ---
>   drivers/soc/mediatek/mtk-svs.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index a3c84e819bc5..70ca9c9acae0 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -138,6 +138,7 @@
>   
>   static DEFINE_SPINLOCK(svs_lock);
>   
> +#ifdef CONFIG_DEBUG_FS
>   #define debug_fops_ro(name)						\
>   	static int svs_##name##_debug_open(struct inode *inode,		\
>   					   struct file *filp)		\
> @@ -170,6 +171,7 @@ static DEFINE_SPINLOCK(svs_lock);
>   	}
>   
>   #define svs_dentry_data(name)	{__stringify(name), &svs_##name##_debug_fops}
> +#endif
>   
>   /**
>    * enum svsb_phase - svs bank phase enumeration
> @@ -652,6 +654,7 @@ static int svs_adjust_pm_opp_volts(struct svs_bank *svsb)
>   	return ret;
>   }
>   
> +#ifdef CONFIG_DEBUG_FS
>   static int svs_dump_debug_show(struct seq_file *m, void *p)
>   {
>   	struct svs_platform *svsp = (struct svs_platform *)m->private;
> @@ -867,6 +870,7 @@ static int svs_create_debug_cmds(struct svs_platform *svsp)
>   
>   	return 0;
>   }
> +#endif /* CONFIG_DEBUG_FS */
>   
>   static u32 interpolate(u32 f0, u32 f1, u32 v0, u32 v1, u32 fx)
>   {
> @@ -2476,11 +2480,13 @@ static int svs_probe(struct platform_device *pdev)
>   		goto svs_probe_iounmap;
>   	}
>   
> +#ifdef CONFIG_DEBUG_FS
>   	ret = svs_create_debug_cmds(svsp);
>   	if (ret) {
>   		dev_err(svsp->dev, "svs create debug cmds fail: %d\n", ret);
>   		goto svs_probe_iounmap;
>   	}
> +#endif
>   
>   	return 0;
>   

