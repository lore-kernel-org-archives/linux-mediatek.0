Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9249DC83F12
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Aug 2023 17:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjLjlOoM3U7ufc084yNH6TsVvgqYkEghyhOyk5lfcBI=; b=0leZqZKRxH9bci55jcfvpWGW2N
	ISTpzt5atUZjfA59bYrJsrXEipTZUBTW01oWW/NZiehB75LSbUefQgirSi+ZpXOEiKcui2Ciu8lUz
	VMPYAbJUMURheylILrp2TbaJsaC8+PeRpjLYPgMHud1sjF6pywIBF4c9Gwrix3aV/gjMmodhxiwz0
	AdgLnfn5mlhQ7rfmNFxYcuyC/MAgEgxa1WF0A+31Mkfyc7narOjz2F0yBV7mmhl8e+6dK9uLXyHpk
	A3bMDnAW1+Vj6RIYiCKc25F9R/IxQsQt0aLzWmJcoWErJrJao5dzKfdR3uxKV2++a1eqm9q8qk7Cq
	7Z+6r3pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qb2BY-00BuPH-21;
	Tue, 29 Aug 2023 17:07:24 +0000
Received: from mail-pl1-f181.google.com ([209.85.214.181])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qb2BW-00BuNR-0Z
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Aug 2023 17:07:23 +0000
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1bf48546ccfso24140175ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Aug 2023 10:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693328839; x=1693933639;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KjLjlOoM3U7ufc084yNH6TsVvgqYkEghyhOyk5lfcBI=;
        b=bggnppxhLhNnddYYWjp9f/HB5QkZKbGzNCazsR8bR6N/jJGKyBXQAGr3Q9wgr0B+mt
         qS4ACSI85LNvpZydmXnDiwXioEW+rh+6GNcP9KSccK6GGyGfxWe+G8S2ceYCNuabOQFG
         c1KOp83b0OjmIYs8omda2iPuo6wl8EavxtgcT8iN9D3uRKrdMVBLLbr8nPBsdhJfTYfx
         oXHlXwjfVW3iQWbL/Z5bwl1bwdTe89srLjHXDUingLMHAkW2zeMGIqBD7OfUs0PmHPB8
         COABNUehUWJzAvCnQtrYqOhMw3qMAoyPsqkRNB6XZex5g/wk/UdfRR1EHsy1jjVbFQua
         UMEg==
X-Gm-Message-State: AOJu0YxhJaKPew8azDNFYZPmXwmPiykJLGGGtzuQkPstUV76mSqohLbU
	jV8UHOm70lbKPMkw9Zj6DRY=
X-Google-Smtp-Source: AGHT+IEf9JRdhde0NpVHWh/jMcgw/6waXQCMJHJCnTw1/Y8ifCZ1+YzbGmhjKtuTM0c52SIkVlgmVQ==
X-Received: by 2002:a17:902:6b0c:b0:1c0:e6e1:4a11 with SMTP id o12-20020a1709026b0c00b001c0e6e14a11mr6784755plk.54.1693328839525;
        Tue, 29 Aug 2023 10:07:19 -0700 (PDT)
Received: from [172.20.4.71] ([208.98.210.70])
        by smtp.gmail.com with ESMTPSA id n10-20020a170902e54a00b001bf5e24b2a8sm9595806plf.174.2023.08.29.10.07.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 10:07:18 -0700 (PDT)
Message-ID: <3aac6dcc-cf5e-4e22-8c0d-aa408667a746@acm.org>
Date: Tue, 29 Aug 2023 10:07:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] Fix abnormal clock scaling behaviors
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com
References: <20230823092948.22734-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230823092948.22734-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_100722_213048_49F87B8A 
X-CRM114-Status: UNSURE (   6.12  )
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

On 8/23/23 02:29, peter.wang@mediatek.com wrote:
> This patch fix abnormal clock scaling behaviors.

For a reason that is not known to me this patch series did not show up 
in my mailbox. I have imported these patches manually from lore into my
mailbox.

Bart.

