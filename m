Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99753C5478C
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 23:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2cPQ/qamgYKQiZt6F8JxqkMkeMuHMsMrjJV8QIW4+s=; b=jjz9eJ/mgeF/jLIsl6yrpNweNs
	I42XZywwi8qNewirYHyr16cw7jT2uVvRI8aFfbbJgfLm81It+rZ8T0WF41FIZElCJpkOG2C4ZRQVN
	gTwpIqpq3yP/9ba0O940nooiSDQOBHRvJiuI5IXxovJDaUfeXvY7/L/UWcMrBMjGLF0iqhpBZPOFK
	4OcpchnUSnR4QeQraAykYxzJ38H0UFjSRVnlPad4+RR21gaYYFCz17/4ZTliFeFSqY9ZJQWPV0bGL
	XO6eBwjZsJqhnWsJK24VCk9SIdIQJhtM69AO/36e9TByzM0ULEz6yjuRIxWvm8+m3C/FEiVWMOuWX
	uYVJmurw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgBw4-00000002D6T-08Fv;
	Fri, 01 Mar 2024 23:05:00 +0000
Received: from mail-il1-f174.google.com ([209.85.166.174])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgBw1-00000002D4s-0Jnz
	for linux-mediatek@lists.infradead.org;
	Fri, 01 Mar 2024 23:04:58 +0000
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-365337ad3e7so8993535ab.0
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Mar 2024 15:04:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709334293; x=1709939093;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N2cPQ/qamgYKQiZt6F8JxqkMkeMuHMsMrjJV8QIW4+s=;
        b=TFQQSxIroFGnBXcY/aZlZvQUU1x64Q03+/0aEmqMZcj4m8RKFaQ1tREz6A702CXof0
         213zBCNdpfpkcUL3Ba85OszjhYlR8/AkQMwAt7WTKcycIZbpAU9LTlYhS3YnO8fioxuP
         2Iu0tghaK/QrBsF1UN0PTrHKPFZYSY1PPAZlRlnn6gDOIuMspVZ34zcprwVfdaKC+hAM
         bgmBf+f/QI1E9bFswL3DbBB28KOvaBNF+08J3uS3Ht1fWIzCI/ES0n9zQMMWdlHA2eHQ
         qj1Emc/Es7FIoywOw9LqV/56hISfyUM0tWFKZcuKbXG1+sfYH2Am9UwtVleGT6LEWlEu
         wKgw==
X-Forwarded-Encrypted: i=1; AJvYcCVDqfLyrsm4GwvL7xXg+6Tt9jnFwl9hBQmLFpbXFwZZVyQCHeYcPAWdO6KPomN+xfykXdisn6tjaW3z1kw8SM4aM8911ZgSvXkF0nBDpNHs/hUw
X-Gm-Message-State: AOJu0Yx1C37lNv6lv6XZ9I+JT2XKSc6FQ555TA2MYGuYANBCJEKbobCN
	my8TE8VM3tuzqPjhh87fG3Bqdb7N3K6DE3yTWyGQ0d2EoFcUNnf8
X-Google-Smtp-Source: AGHT+IGYfruGgWePt93txBq/IzJsO9JFDu0K4CcG1F+Q7Fo5ZePPsJZnArBCEiDtRkSM5H9l8TJ3jQ==
X-Received: by 2002:a05:6e02:b47:b0:365:b485:734c with SMTP id f7-20020a056e020b4700b00365b485734cmr3728724ilu.25.1709334293285;
        Fri, 01 Mar 2024 15:04:53 -0800 (PST)
Received: from ?IPV6:2601:647:4d7e:54f3:667:4981:ffa1:7be1? ([2601:647:4d7e:54f3:667:4981:ffa1:7be1])
        by smtp.gmail.com with ESMTPSA id y6-20020a634b06000000b005ce472f2d0fsm3105554pga.66.2024.03.01.15.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 15:04:52 -0800 (PST)
Message-ID: <967e329a-7114-4857-b79a-01b751be759c@acm.org>
Date: Fri, 1 Mar 2024 15:04:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ufs: core: add config_scsi_dev vops comment
Content-Language: en-US
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, chu.stanley@gmail.com
References: <20240301034610.24928-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240301034610.24928-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_150457_147934_ACFAE583 
X-CRM114-Status: UNSURE (   3.87  )
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

On 2/29/24 19:46, peter.wang@mediatek.com wrote:
> Add config_scsi_dev vops comment.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


