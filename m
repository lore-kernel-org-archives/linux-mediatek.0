Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61871C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 18:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGmxq8tDBSfiPNAIZ25qzZIB0dRZb2RCLRuZ0IccZag=; b=I8RAYcVr5WzANU5Whyu6LlLepg
	SrnZjkVFSBw6HmXWibk3j7CDo4wCCKiXcMIWbTcqftx62CXYbzrQv6CN46xsqA0tlUchKtIOuMZm7
	bgTruT1O0qH5IdlTBrj/f1JZzPLC87aoRbQ5lbIqhiinIcHN93jEysDNabvlN8qg/YrcOU/vIGhpM
	uEoa3oVZmZ5x8aWM1bKMpp2sR2WGzY6qD/cQB2D8iKaInf4HPe7YwPN6F6QKhCPKCpHo7/AaepTnk
	ZmcPGvW4fBOhxYoqxkceXB8qZONjds9aHn2Zu6aEdxXZE84yTUKur6XYNSyMk+ppX7l+k45SkSXCf
	DTyhNzMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeKob-00B0mv-UF; Fri, 30 Sep 2022 18:32:49 +0000
Received: from mail-pj1-f42.google.com ([209.85.216.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeKoR-00B0kZ-LE; Fri, 30 Sep 2022 18:32:40 +0000
Received: by mail-pj1-f42.google.com with SMTP id u59-20020a17090a51c100b00205d3c44162so9874010pjh.2;
        Fri, 30 Sep 2022 11:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=pGmxq8tDBSfiPNAIZ25qzZIB0dRZb2RCLRuZ0IccZag=;
        b=CpdaPQepD4E9vB037PAeQ63WWMGJv6DJIWuCIC2YeoaUyvdundh7/jJ+OI9kISVm0j
         kDPyMYSP/EPLLLAMKyOWhXvX6ubm05/S2cK6OJarhaEyEN3HXT2m2q1a+XFs701Tb/y4
         fpMGu509zaUUzyDioPNTxzcXTuVhP5x1uvyC/FV4VD4Wmr4cu0hcNCvYrVsuD9qd60jf
         4hqqhiG2MeAY7jeXa205vg5EDJ6TWXtMLRi71AqsbjG7J2aq1Gksc4cc3RG1yGWB9546
         KIb2RsdcLUdeTu4MyNhR6jaZSmRjfc6RKXb2AEAoLEbPaMcalvG9074A+KyskWIzaGxr
         87/w==
X-Gm-Message-State: ACrzQf1R5kdE052fczRqJcJbB18WZfJ09htVH5KbHl/3fRd2Ai+PEsay
	N3syql5mFmDyQFjPKdc5qkQ=
X-Google-Smtp-Source: AMsMyM6x9mzhkst02rDj+5NHQLQ9eMpWzm75K1RoD0MiFIcFrYfU9xdTvfahB327EwcQNCkFcvulvA==
X-Received: by 2002:a17:90b:1c8e:b0:205:783b:fe32 with SMTP id oo14-20020a17090b1c8e00b00205783bfe32mr24053856pjb.39.1664562757664;
        Fri, 30 Sep 2022 11:32:37 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:56f2:482f:20c2:1d35? ([2620:15c:211:201:56f2:482f:20c2:1d35])
        by smtp.gmail.com with ESMTPSA id w27-20020aa7955b000000b00535d3caa66fsm2106983pfq.197.2022.09.30.11.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 11:32:36 -0700 (PDT)
Message-ID: <4767355d-e7b0-d38b-88f3-c070ed0b5e5b@acm.org>
Date: Fri, 30 Sep 2022 11:32:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 03/16] ufs: core: Defer adding host to scsi if mcq is
 supported
Content-Language: en-US
To: Asutosh Das <quic_asutoshd@quicinc.com>, mani@kernel.org,
 quic_nguyenb@quicinc.com, quic_xiaosenh@quicinc.com, quic_cang@quicinc.com,
 quic_nitirawa@quicinc.com, quic_rampraka@quicinc.com,
 quic_richardp@quicinc.com, stanley.chu@mediatek.com,
 adrian.hunter@intel.com, avri.altman@wdc.com, beanhuo@micron.com,
 martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <cover.1663894792.git.quic_asutoshd@quicinc.com>
 <197a8bcca288f9c36586099aa07606ed3f067c9b.1663894792.git.quic_asutoshd@quicinc.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <197a8bcca288f9c36586099aa07606ed3f067c9b.1663894792.git.quic_asutoshd@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_113239_726463_47153B61 
X-CRM114-Status: GOOD (  12.52  )
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

On 9/22/22 18:05, Asutosh Das wrote:
> @@ -8218,6 +8219,14 @@ static int ufshcd_probe_hba(struct ufs_hba *hba, bool init_dev_params)
>   		ret = ufshcd_device_params_init(hba);
>   		if (ret)
>   			goto out;
> +
> +		if (is_mcq_supported(hba)) {
> +			ret = scsi_add_host(host, hba->dev);
> +			if (ret) {
> +				dev_err(hba->dev, "scsi_add_host failed\n");
> +				goto out;
> +			}
> +		}
>   	}

Calling scsi_add_host() from ufshcd_probe_hba() seems wrong to me since 
that function is not only called when probing a host controller but also 
when resetting a host controller. See also ufshcd_host_reset_and_restore().

>   
>   	ufshcd_tune_unipro_params(hba);
> @@ -9764,10 +9773,12 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
>   		hba->is_irq_enabled = true;
>   	}
>   
> -	err = scsi_add_host(host, hba->dev);
> -	if (err) {
> -		dev_err(hba->dev, "scsi_add_host failed\n");
> -		goto out_disable;
> +	if (!is_mcq_supported(hba)) {
> +		err = scsi_add_host(host, hba->dev);
> +		if (err) {
> +			dev_err(hba->dev, "scsi_add_host failed\n");
> +			goto out_disable;
> +		}
>   	}
>   
>   	hba->tmf_tag_set = (struct blk_mq_tag_set) {

Please make sure there is only a single scsi_add_host() call in the UFS 
host controller driver.

Thanks,

Bart.

