Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A033C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 18:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZe80/zTgMqnxaX4R7r16UgMLE6glhJPyTnx+OtT0xk=; b=JCHSpCFZ9vghDaS9+tNRkTswqA
	c/LE4FzFSNqEgk+YTHXk6LJGP7L1CzHWC5FR3njtOf1Ep4bduybRFfnB5thDmT0CRnIANUQo6bGgZ
	VIV795gIOgfRX4Nn3Kyfl7EKxSqQ45opesN7zBgkqPxLtDdnpXE5DwRbgsByIBRtTapdnUzSTnot8
	/v3gSdvAygetQGihMHBF6yIXVMEuv+1xBr7CZGKjIMu7UHQBfgTltKpyXCZm7CPWgPn4nsV43ga1H
	zXVkfJ412ctoyHFK9ppDwKMOIQlW6eJIU8fPlzx1CTQ8Fnd3382ZtF1AA51N/lxgYtv44HlRtPN9b
	mAxs9vLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeKfe-00Ayp7-A7; Fri, 30 Sep 2022 18:23:34 +0000
Received: from mail-pj1-f45.google.com ([209.85.216.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeKfS-00AykD-Fu; Fri, 30 Sep 2022 18:23:23 +0000
Received: by mail-pj1-f45.google.com with SMTP id g1-20020a17090a708100b00203c1c66ae3so4959440pjk.2;
        Fri, 30 Sep 2022 11:23:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=NZe80/zTgMqnxaX4R7r16UgMLE6glhJPyTnx+OtT0xk=;
        b=AiZclKtSJdcMf3eQexSniwTSBpmV8UHl3by5foaaPuTDlnEJqJXOHhY88Tlq8tCOsA
         kZNRkeQm9KL3aOAbA7CXPYa8xf/c2reRIkrUr45KAJEU8OVgdkVYWccLDUCr9ePg19O9
         KP5nUYSZBu7KnYhsMo+2qc77B3hhUu0ephDQ77G2WalQmLgCiyg8RDGwOz2RYgMneZFr
         HIbZS48WeVr9swUuTbuC3ccE79t6bSRUV8R2MMFN8eR3OyW12bfrjvVcUqtz4uy94fXr
         kSHJeatcWA5L06kwqEdqP6TEvCs8D1VBYg9f3X0ZfGMCrmBR+yb76Djq07WKkW01OPeW
         Q9lg==
X-Gm-Message-State: ACrzQf0A668XHNxHy8Ws6DhiduD/YKtQFinZuJycVv+12DWz2g2LB6Zf
	9lH8nPyn0Q/fGa16HmlE0YI=
X-Google-Smtp-Source: AMsMyM55IZv799oNZvH6mNiV43YPr5wp4G3loeXCfRQxQVutt4Q0JGulW2iD/+AcbGjDMSs9TtA7cA==
X-Received: by 2002:a17:902:ef52:b0:17c:f072:95bc with SMTP id e18-20020a170902ef5200b0017cf07295bcmr2356069plx.28.1664562197903;
        Fri, 30 Sep 2022 11:23:17 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:56f2:482f:20c2:1d35? ([2620:15c:211:201:56f2:482f:20c2:1d35])
        by smtp.gmail.com with ESMTPSA id x64-20020a17090a38c600b00205d85cfb30sm5631068pjb.20.2022.09.30.11.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 11:23:17 -0700 (PDT)
Message-ID: <2f5a8742-b25d-d6b3-c6a4-1c119a94d569@acm.org>
Date: Fri, 30 Sep 2022 11:23:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 01/16] ufs: core: Probe for ext_iid support
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
 Jinyoung Choi <j-young.choi@samsung.com>, Kiwoong Kim
 <kwmad.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <cover.1663894792.git.quic_asutoshd@quicinc.com>
 <ff7cdcdef82f6c9d709e2b6ed5d91e255327b780.1663894792.git.quic_asutoshd@quicinc.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <ff7cdcdef82f6c9d709e2b6ed5d91e255327b780.1663894792.git.quic_asutoshd@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_112322_554766_BD83DC47 
X-CRM114-Status: GOOD (  12.18  )
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
> +	hba->mcq_capabilities = ufshcd_readl(hba, REG_MCQCAP);

What value is reported when reading the REG_MCQCAP register on an UFSHCI 
3.0 controller? -1 or 0?

> +	hba->ext_iid_sup = (hba->mcq_capabilities & MASK_EXT_IID_SUPPORT) >>
> +		EXT_IID_CAP_SHIFT;

[ ... ]

> +	if (dev_info->wspecversion < 0x400)
> +		goto out;

Isn't this version check superfluous? Only UFSHCI 4.0 controllers should 
support the extended IID feature.

> +	ext_ufs_feature = get_unaligned_be32(desc_buf + DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP);

The above change introduces a third instance of this code. Please 
introduce a helper function that does something like the following and 
replace the above line with a call to that helper function:

	if (hba->desc_size[QUERY_DESC_IDN_DEVICE] <
	    DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP + 4)
		return 0;

	return get_unaligned_be32(desc_buf +
				 DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP);

> +out:
> +	dev_info->b_ext_iid_en = !!ext_iid_en;

Please remove "!!". This conversion happens implicitly when assigning to 
a boolean variable.

Thanks,

Bart.

