Return-Path: <SRS0=xc+O=5B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29F0C18E5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 16:23:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B995B20658
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 16:23:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mlu9OMvz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B995B20658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DXolnThFw5IcxOany9JVtT27+FYxJ0WlfkogWrM5EMY=; b=mlu9OMvza6QSQGNl19Ym4U5qa
	41raLflhU53tZ15MFMLqy2VJFrfX6PdTBekdv73R2TtlZpATC+iTgxN/SBJAy+n3nwYrO/iQR8ECc
	FMOrLn2mGMGmlX8PQF1Rbfe76t9AyH4ok0dmfEa4sP28Dfj8BFf6BOUhLkvtUSierDtqxofBybAg8
	hdGnAM3Yq6U+eIQ84b1jJifLt23Bl3RWQX4KNW/5h3k4b2V9u3vGJLEUFYKGnk8TScQOpseA4Yj3a
	vjudGk6+A3tagNd84cG8Mi6MvzPWYSxQ0kohDnck1gPXmElr0IlWPQVpOO23b453S9BMyDAjj2HBk
	KbKxjUGng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDsWO-0000zS-5i; Mon, 16 Mar 2020 16:23:20 +0000
Received: from mail-pg1-f194.google.com ([209.85.215.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDsWF-0000sE-OL; Mon, 16 Mar 2020 16:23:13 +0000
Received: by mail-pg1-f194.google.com with SMTP id u12so10020426pgb.10;
 Mon, 16 Mar 2020 09:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MPeWvE1ynYMgmBjcIfuACly8OXPEjkr9woxJje4Vp+k=;
 b=Ynu7D155zNdMizfno52OJOHSmT5lXvXR+MPCmfHCg+2OkQOZ7sy6BLMEAywmxluUWV
 rWWJEd9T790C4Zf/4OiFISrC53dHoAolU/Yr7WG1WVTD6BG1Q2c+YHPVAGKduSCYosc/
 YAmxOXATv74eIDXeu/7Qa0zPlF+nXsw45C0TqWY8VEv9BPNV8srroj593Fy+g7uiB6iO
 kaErRDcsFJodBcDRL113ZpLKCle1s4H1N75LW+/xq6QBwZT5qbOUM8E5xNz553PVVDJa
 7E/s0xQ+GC80O+UBAVRkRgjOPMn7LMgQZOv72mF1wwlrGK95NPIqtGZ7nwpyQpau9ITR
 8KBQ==
X-Gm-Message-State: ANhLgQ2qOFsOu8liRG/YsoFb0V444SsurxkdRsAnHnAeGZIT2U0NWNjv
 PcOOXgqAgTlXUGpbs2V7fxc=
X-Google-Smtp-Source: ADFU+vteq0ZXl4bflTQr64JEC/RlOF0r9XRD+1FB4C6nIb76oOWRP1WchB6mng5hWY132x5LhHMaqQ==
X-Received: by 2002:a63:921b:: with SMTP id o27mr659097pgd.364.1584375789493; 
 Mon, 16 Mar 2020 09:23:09 -0700 (PDT)
Received: from ?IPv6:2601:647:4000:d7:af99:b4cf:6b17:1075?
 ([2601:647:4000:d7:af99:b4cf:6b17:1075])
 by smtp.gmail.com with ESMTPSA id z20sm66684pge.62.2020.03.16.09.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2020 09:23:08 -0700 (PDT)
Subject: Re: [PATCH v6 3/7] scsi: ufs: introduce common delay function
To: Stanley Chu <stanley.chu@mediatek.com>, linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
References: <20200316085303.20350-1-stanley.chu@mediatek.com>
 <20200316085303.20350-4-stanley.chu@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <fdf91490-9c7d-df34-1c1f-e03e12855378@acm.org>
Date: Mon, 16 Mar 2020 09:23:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200316085303.20350-4-stanley.chu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_092311_795442_7225E2BF 
X-CRM114-Status: GOOD (  13.85  )
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
 matthias.bgg@gmail.com, beanhuo@micron.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 3/16/20 1:52 AM, Stanley Chu wrote:
> +void ufshcd_wait_us(unsigned long us, unsigned long tolerance, bool can_sleep)
> +{
> +	if (!us)
> +		return;
> +
> +	if (us < 10 || !can_sleep)
> +		udelay(us);
> +	else
> +		usleep_range(us, us + tolerance);
> +}
> +EXPORT_SYMBOL_GPL(ufshcd_wait_us);

I don't like this function because I think it makes the UFS code harder 
to read instead of easier. The 'can_sleep' argument is only set by one 
caller which I think is a strong argument to remove that argument again 
and to move the code that depends on that argument from the above 
function into the caller. Additionally, it is not possible to comprehend 
what a ufshcd_wait_us() call does without looking up the function 
definition to see what the meaning of the third argument is.

Please drop this patch.

Thanks,

Bart.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
