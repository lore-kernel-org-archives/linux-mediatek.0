Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD25C35274
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Dec 2023 21:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIl3+miZ0G9Vwo7dKjzcYHAwvEgr2VOComYZIqzlsP0=; b=XvkVYvic9cOyewNow/aXVMKCT+
	pdjIBnuiwIG5S38Lqlj1sly2PqTZcBSNyJTK7ZAfwqnXUmQsVw+YlAIBlLwK1DzvfNOHM6jlnF/JS
	bre904K529WKbeJVo9uUlqt3DDlnk2bLUuX9gKT5D9sms1lNnNLD/NYZ79kq45m/wQ9dGa9wt+dnW
	UKOhmFGF0SjmexksZ8ss/a3qVprzB/hQ7ImTAxWvcObTTQ26JMxu84VJknS2+bvOmARhobcz3T6yH
	Vs5SkHYdtLZvso8ap8aAqZXizKxAXCNEKjAJAVLplhVp5u6pTS/loh5VqcgYzRv/fPc2X1kDNRDm2
	DYXBDjgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFLak-00CBgf-1M;
	Mon, 18 Dec 2023 21:56:02 +0000
Received: from mail-io1-f41.google.com ([209.85.166.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFLah-00CBfk-0c;
	Mon, 18 Dec 2023 21:56:00 +0000
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7b712c0fddeso147627739f.3;
        Mon, 18 Dec 2023 13:55:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702936556; x=1703541356;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eIl3+miZ0G9Vwo7dKjzcYHAwvEgr2VOComYZIqzlsP0=;
        b=Gdf3OeZJ604CCgm0ANKgy3i0c6qhh/dDoWJ5USt979yLJoNI2wh9WUW8VJs14sm2Sf
         a+Vo2GA/jlfjnmMPzFxnwBwhZY/Tth1bD7P186EgvWpA8R3xNtX3kYyiAME9iePXA4Hh
         I+q0KhPR1D006JUB846laky5Zq+xMWVSyMxDUyR0lZe3aTzQrm10XDwnSJOGgE7zarwd
         4RoZGouqEZNEkKpc7xN75yizYOoLJINywisPm0TJrVGGiLmyKX26eJUNOlcYOCX841wH
         xxNA/VZfJ5RfsYx7dAn3tjQtk7ggdS1HFMrjRCzVogslYqMw7VA1vSwLnnMyAUoojCRy
         lUIA==
X-Gm-Message-State: AOJu0YwhEwMa6NhxaTOZ7isbQa+UxM9Vy9HDyNd0qURB36KDQGSEPJU2
	BPMvfNUsHbf8wA2A7D9uM/94llx4dYA=
X-Google-Smtp-Source: AGHT+IHEewjCipB4PIrKNw9vqIIP/VSnGW9Uiv52Wv48DEo+dTLjJlbTKJ/7N8EqP5QpL2LNEbx/jA==
X-Received: by 2002:a92:c90b:0:b0:35d:59a2:92a6 with SMTP id t11-20020a92c90b000000b0035d59a292a6mr15410019ilp.58.1702936556465;
        Mon, 18 Dec 2023 13:55:56 -0800 (PST)
Received: from ?IPV6:2620:0:1000:8411:e67:7ba6:36a9:8cd5? ([2620:0:1000:8411:e67:7ba6:36a9:8cd5])
        by smtp.gmail.com with ESMTPSA id s7-20020a634507000000b005cd8bf50c13sm3114268pga.58.2023.12.18.13.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 13:55:55 -0800 (PST)
Message-ID: <9861ce52-8163-40aa-b156-dd656143a73d@acm.org>
Date: Mon, 18 Dec 2023 13:55:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 1/2] ufs: core: Add CPU latency QoS support for ufs
 driver
Content-Language: en-US
To: Maramaina Naresh <quic_mnaresh@quicinc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Peter Wang <peter.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Stanley Jhu <chu.stanley@gmail.com>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, quic_cang@quicinc.com,
 quic_nguyenb@quicinc.com
References: <20231213124353.16407-1-quic_mnaresh@quicinc.com>
 <20231213124353.16407-2-quic_mnaresh@quicinc.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20231213124353.16407-2-quic_mnaresh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_135559_229940_6A43555E 
X-CRM114-Status: GOOD (  10.39  )
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

On 12/13/23 04:43, Maramaina Naresh wrote:
> +static ssize_t ufshcd_pm_qos_enable_store(struct device *dev,
> +		struct device_attribute *attr, const char *buf, size_t count)
> +{
> +	struct ufs_hba *hba = dev_get_drvdata(dev);
> +	u32 value;
> +
> +	if (kstrtou32(buf, 0, &value))
> +		return -EINVAL;
> +
> +	value = !!value;
> +	if (value)
> +		ufshcd_pm_qos_init(hba);
> +	else
> +		ufshcd_pm_qos_exit(hba);
> +
> +	return count;
> +}

Please use kstrtobool() instead of kstrtou32().

> +static void ufshcd_init_pm_qos_sysfs(struct ufs_hba *hba)
> +{
> +	hba->pm_qos_enable_attr.show = ufshcd_pm_qos_enable_show;
> +	hba->pm_qos_enable_attr.store = ufshcd_pm_qos_enable_store;
> +	sysfs_attr_init(&hba->pm_qos_enable_attr.attr);
> +	hba->pm_qos_enable_attr.attr.name = "pm_qos_enable";
> +	hba->pm_qos_enable_attr.attr.mode = 0644;
> +	if (device_create_file(hba->dev, &hba->pm_qos_enable_attr))
> +		dev_err(hba->dev, "Failed to create sysfs for pm_qos_enable\n");
> +}

Calling device_create_file() and device_remove_file() is not acceptable because of
the race conditions these calls introduce for udev rules. Please add this attribute
into an existing group and update the is_visible callback function of that group.
See also ufs_sysfs_groups[].

Thanks,

Bart.

