Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A9CC00140
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 18:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VPF0vMX22RY8iv0joXSl/t6XXMxjwgYOrNmCNv008jw=; b=ygDO9ZfPc2GO3ENQxTjJ6ebH+h
	FfcU+vQ8BYgwLaZXP7STSB+EdCKvddyy8sZ1cHB4E35H/IzcaPb4kBdUooecGXtAck1qT6ODLOo+4
	tk3dH2vM+w2HK2ppaIXGTrVi1qQkAtLlGZBDUMqJRjXZAnLGZk6mtweUFY/Zq6/Rn10eUuaG3MdH+
	nHx5vJjEXBQmLy46QmtALaHtOvFBp5dVuw0J8tFOU7VfpewO0O1rHxsb5wjtlVNbVFxpBrLIcIV5I
	w4urRApHZqv1RJLYaFKJ657T39HLwa3gm6s0bjKLuuSLjy3Q3oKfzvE2CKwAkxX8nDjiLCwGUd28H
	fFhV+C+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIwt4-00Gccp-28; Tue, 02 Aug 2022 18:45:02 +0000
Received: from mail-pf1-f177.google.com ([209.85.210.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIwt0-00GcYn-PG
	for linux-mediatek@lists.infradead.org; Tue, 02 Aug 2022 18:45:00 +0000
Received: by mail-pf1-f177.google.com with SMTP id g12so14365669pfb.3
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Aug 2022 11:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=VPF0vMX22RY8iv0joXSl/t6XXMxjwgYOrNmCNv008jw=;
        b=2SdvFF4BYQZJj/hcT1Iz5tLgkY9IXiCwsJrakJai/L8uyPmGgfIwSTMj2MuLgI/KtU
         e/etfXbbVdboRFQXyIYHEHaK/KOZl4UpaQ6Nk0O3TqHFzEAHEEPv3LB29BbulcTiqSHV
         3MIW37vZeXI15heKxDSQWpbot64f6MDD5hjqNTmdT16IlXdJxgwjeQEVfM3WeK0hQEmW
         CXiKZWpsd0Rl7sBf0n+hNwiEikv6lPItnEHv6uAf/Ue7Y2vRkU9z8FPjATdfdVbOsO8E
         CwxFhREh7hX8Ad9utjpdkAkuKd7rZ28RCeeS+vZf9J30/VDQHU8ktsWdWxe5CHpr64CW
         yotg==
X-Gm-Message-State: AJIora+gdVWOv8HLffb6LqK9h+dIBk0aG9P3c57K9TTZ2tHaKFXdVshl
	Jqr5zq0X9Dg0lEkiTSgzhxo=
X-Google-Smtp-Source: AGRyM1tH5gORP4aBc94gwhTvKp5cvaXIpWrglluF9eeJJY69FzUxUTThyoizYO5+OT0B7hgQ2HI8sA==
X-Received: by 2002:a63:1324:0:b0:419:afb2:af7b with SMTP id i36-20020a631324000000b00419afb2af7bmr17856752pgl.367.1659465894715;
        Tue, 02 Aug 2022 11:44:54 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:5297:9162:3271:e5df? ([2620:15c:211:201:5297:9162:3271:e5df])
        by smtp.gmail.com with ESMTPSA id e19-20020a17090ac21300b001f320faea95sm11265245pjt.2.2022.08.02.11.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 11:44:53 -0700 (PDT)
Message-ID: <06b8cb30-f308-63bd-b073-83c9add87cd3@acm.org>
Date: Tue, 2 Aug 2022 11:44:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/2] ufs: core: introduce a choice of wb toggle during
 clock scaling
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com
References: <20220802143223.1276-1-peter.wang@mediatek.com>
 <20220802143223.1276-2-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20220802143223.1276-2-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_114458_884194_59B8DFF2 
X-CRM114-Status: GOOD (  11.80  )
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

On 8/2/22 07:32, peter.wang@mediatek.com wrote:
> +	/* Allow WB with clk scaling */

This comment is misleading. Consider changing this comment into 
something like "Enable WB when scaling up the clock and disable WB when 
scaling the clock down".

> +	UFSHCD_CAP_WB_WITH_CLK_SCALING			= 1 << 12,

Whether or not the WriteBooster is toggled when the clock is scaled is 
not a host controller capability. It is a policy that is tied by this 
patch to the host controller. So I think that using the "UFSHCD_CAP_" 
prefix is misleading. Consider using e.g. the prefix UFSHCD_POLICY_.

 > +static inline bool ufshcd_can_wb_during_scaling(struct ufs_hba *hba)
 > +{
 > +	return hba->caps & UFSHCD_CAP_WB_WITH_CLK_SCALING;
 > +}

The name of this function is misleading. Consider renaming this function 
into e.g. ufshcd_enable_wb_if_scaling_up().

Thanks,

Bart.

