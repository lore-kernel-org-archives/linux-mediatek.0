Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE48C83F12
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Aug 2023 17:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pu+v5TcyzpQLtUTlfHhtPfmsTcuZLW0rXfwL8u5p7aU=; b=vF0WFJUHWKNn14Tpu4W9ZWfXDu
	T59LF+y+pQmyb9FJt6vsX6JJlcz+W57ef20nWDixyqknadMckRBsMvvO0MDAmYzvrv/qYENm/GUwx
	cZ0jsX68oC/iU9hujbX1R6DWtMf4KZqhSmMUFmsZRyNTIhT0LWUmu0tFtJ8/gj/8OHwA2/AV+eALQ
	IWIFDEnLcgRCwngTNhnpAYfoTe4hj15C8xA40656Cx6la04lqnOX4zACemj7eYkg/3s0WP9F/GdBK
	5VbCyfKqdunR+kxtkXdATgKA1m7mJhfwOsZdX7n3GHwGJ7kRWxnpcFB/I6RkKY7Xd18qsQnGt5NwP
	rsnJrk4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qb2A5-00BuBc-0g;
	Tue, 29 Aug 2023 17:05:53 +0000
Received: from mail-pl1-f180.google.com ([209.85.214.180])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qb2A3-00BuB1-1X
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Aug 2023 17:05:52 +0000
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1bf078d5f33so37171425ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Aug 2023 10:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693328750; x=1693933550;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pu+v5TcyzpQLtUTlfHhtPfmsTcuZLW0rXfwL8u5p7aU=;
        b=fFZjesJJwSXPW9hpikp8y5MxOteJmp3ijWQRgbEgOP+LN/Dcje+g5bpG/JQWeFdFQR
         iLXpigylPCClsaPYQMLlz4MTYdZVg69xFYRsn7BRdXj8SklvPEf5uFVNOK2WlvSQk11T
         g+nAxXtxnQke8klnekPHlS1vUENiBo/Cdn0GlGHX/MZNPRz8+z0rDIBJvgw4m5nq8Ehq
         3Ag5dTdxUwuFeU1pL4A3txURbNf6KDRZg+OfgtY1cNORlbXQHJMk9U6bsLFHyimzHuGk
         FwP32NnGzDkGmT5q1Ip6srHjy5u/MvakCi6rpRKDP0Rd9w4JmDOEEjExIxIdtDT0fLwz
         BRSw==
X-Gm-Message-State: AOJu0Ywk3oVMoGMUS8l070lS68c5mC+l1eO33Hmx0CcHfhj9ZB+a8Z4/
	JIexM69zm7IeGDCY+8I9lgw=
X-Google-Smtp-Source: AGHT+IEGg1A2gfIRrv0r2UaCtqWnbAB21E1HF+udH5pncfGtzM4fik1xfDzyAqvExxp9SxJ++KBxBw==
X-Received: by 2002:a17:902:d4d1:b0:1c1:ecff:a637 with SMTP id o17-20020a170902d4d100b001c1ecffa637mr6896911plg.15.1693328750112;
        Tue, 29 Aug 2023 10:05:50 -0700 (PDT)
Received: from [172.20.4.71] ([208.98.210.70])
        by smtp.gmail.com with ESMTPSA id n10-20020a170902e54a00b001bf5e24b2a8sm9595806plf.174.2023.08.29.10.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 10:05:49 -0700 (PDT)
Message-ID: <739965b5-346a-49ab-bee9-997cd8b5d7ae@acm.org>
Date: Tue, 29 Aug 2023 10:05:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] ufs: core: fix abnormal scale up after scale down
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
 <20230823092948.22734-4-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230823092948.22734-4-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_100551_521048_E951CE00 
X-CRM114-Status: UNSURE (   6.57  )
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
> When no active_reqs, devfreq_monitor(Thread A) will suspend clock scaling.
> But it may have racing with clk_scaling.suspend_work(Thread B) and
> actually not suspend clock scaling(requue after suspend).
> Next time after polling_ms, devfreq_monitor read
> clk_scaling.window_start_t = 0 then scale up clock abnormal.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

