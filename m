Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2958C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 18:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=efafKPDXaotfifV7ioMYf9voysdJTvPoHFHiRmXnzh8=; b=uyDc/l3RGhmluBKxqfqUA1cEs3
	t6+ivD9ljPH/dWIfDHcJwkV7pyUwGf8VtGzLUDklnM7XvEouWLaK2rM8FFQ4wK7ODbQJxSfCCpBGj
	4OamCiFTaMosz7GI9Dc0QcV0vQ87hGnjaqChYkNEWBSwFhGad5ou1I/Fx4YPGk6SfQJjg7OGw2CZ4
	PQXD/KTdeL3TjQ4gxVLav1wDtv8d3DlmWJrYNT7SE3JXSBHGnCjzgxdbpPn26DwL26s0tAjML8J9C
	Q4dddRB5ltiaUr+VSPfIwZR6YDAK4euxZHtLoA7enSKpWMrOdWqlx7aQ0jrro823fffE1b+GdRO+5
	a7bhc5CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeKtX-00B2EM-4I; Fri, 30 Sep 2022 18:37:55 +0000
Received: from mail-pf1-f171.google.com ([209.85.210.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeKtL-00B298-2r; Fri, 30 Sep 2022 18:37:44 +0000
Received: by mail-pf1-f171.google.com with SMTP id a80so4974999pfa.4;
        Fri, 30 Sep 2022 11:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=efafKPDXaotfifV7ioMYf9voysdJTvPoHFHiRmXnzh8=;
        b=6Gtf3CUtRpUabQdeCpHaxhvqD36ELjaB5aQiE1jvNz6GJ6A0EeXAbDytZJiQ4vLO5s
         FmbcbBo2hJdd2hr5SS9XKatpUCULJ/pl0wkJ81PhEfH3KuKZhcheqP21uGE2UpQbds9p
         hS4alUz12Rv1WUx8hSeA6ANA/5ieYAYPGZCHEeP3kwLvyuAUoINIRwsb0p0Ux3T6OruY
         tB2an+qgn2LG6IMQro7D0WWJDZekICAkYU1sIqtcxNbGrujij/D2dQKtnmWBaGGWGAA9
         Kg8AIciQ06m29+R4+xX5AzZFVE6PCb3OcyHg5WdzKJ+s2xEWLLWkVnE2yQSksT/ziKz1
         KrTA==
X-Gm-Message-State: ACrzQf0yd1HGGpRpmVYrcQiLefiVs5O+RBtSSAdIsQyYyBrPLfYuGZTQ
	cmAkT0tTFe3JuLG1v8jqHX4=
X-Google-Smtp-Source: AMsMyM7pHUBp9AyBR4mQyCzjDLxGnbHWvFKk4bh5EdnF2qd0BzZ9SwQ7YzOyXC+UxyR5MekpDcDBOw==
X-Received: by 2002:a63:d30b:0:b0:42b:9ca4:15f4 with SMTP id b11-20020a63d30b000000b0042b9ca415f4mr8631548pgg.146.1664563059451;
        Fri, 30 Sep 2022 11:37:39 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:56f2:482f:20c2:1d35? ([2620:15c:211:201:56f2:482f:20c2:1d35])
        by smtp.gmail.com with ESMTPSA id p8-20020a635b08000000b0043bed49f31fsm2064027pgb.8.2022.09.30.11.37.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 11:37:38 -0700 (PDT)
Message-ID: <feb4295c-e31d-1bf0-2176-a844c1c9197e@acm.org>
Date: Fri, 30 Sep 2022 11:37:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 04/16] ufs: core: mcq: Introduce Multi Circular Queue
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <cover.1663894792.git.quic_asutoshd@quicinc.com>
 <e0ae0fccc579fa17b6cfcf3b8bcf963f5ebe67fa.1663894792.git.quic_asutoshd@quicinc.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <e0ae0fccc579fa17b6cfcf3b8bcf963f5ebe67fa.1663894792.git.quic_asutoshd@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_113743_151256_4DB2F36A 
X-CRM114-Status: GOOD (  13.03  )
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
> +static int ufshcd_mcq_config_nr_queues(struct ufs_hba *hba)
> +{
> +	int i, rem;
> +	u32 hbaq_cap, cmp, tot_queues;
> +	struct Scsi_Host *host = hba->host;
> +
> +	hbaq_cap = hba->mcq_capabilities & 0xff;
> +
> +	if (!rw_queues)
> +		rw_queues = num_possible_cpus();
> +
> +	tot_queues = dev_cmd_queue + read_queues + poll_queues + rw_queues;
> +	if (hbaq_cap < tot_queues) {
> +		dev_err(hba->dev, "Total queues (%d) exceeds HC capacity (%d)\n",
> +			tot_queues, hbaq_cap);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	rem = hbaq_cap - dev_cmd_queue;
> +	cmp = rem;
> +	hba->nr_queues[HCTX_TYPE_DEFAULT] = min3(cmp, rw_queues,
> +						 num_possible_cpus());
> +	rem -= hba->nr_queues[HCTX_TYPE_DEFAULT];
> +	cmp = rem;
> +	hba->nr_queues[HCTX_TYPE_POLL] = min(cmp, poll_queues);
> +	rem -= hba->nr_queues[HCTX_TYPE_POLL];
> +	cmp = rem;
> +	hba->nr_queues[HCTX_TYPE_READ] = min(cmp, read_queues);
> +
> +	for (i = 0; i < HCTX_MAX_TYPES; i++)
> +		host->nr_hw_queues += hba->nr_queues[i];
> +
> +	hba->nr_hw_queues = host->nr_hw_queues + dev_cmd_queue;
> +	return 0;
> +}

Please consider removing the variable 'cmp' and instead use min_t() or a 
type cast.

Thanks,

Bart.

