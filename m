Return-Path: <SRS0=yOeO=IO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD755C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 14:33:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C88464DD7
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 14:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C88464DD7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EnUU37sH+ByjNFA0EXApcUjVVZ3YuurLyoQQbTvDd18=; b=WQxTrOfzdz+6p9683yHU48jw/
	8kYzCcqmeQbJROeAjDQsCOjfxsAkBwVRI44gry0zKSW5a4kjB127l5ydGh2hy1cP87L1oXVSrB5Kw
	xxqxXFZTRHlrhjy6sKrS2K2++OpBmUOj0RxEMv5j1k2qsyXp32fxmYLcOvgeSJnVJOulIJQlTzzZg
	nWq33IzpF9DYr45iOpau6yUejwQbxUAErEEjosCsPRoqDWhD8nvujP3vFQfFEyhifeZgv3A3puM0v
	eSNLMFrdeiBMk00h5akphPeQzByzeXqs6g0pEeCJnINFuftk43Ze2dnnsIB+zoJvW557IHNBeMXV9
	hsGtCv/DQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMAlM-000xZl-LX; Tue, 16 Mar 2021 14:33:36 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMAlA-000xXr-Mz
 for linux-mediatek@lists.infradead.org; Tue, 16 Mar 2021 14:33:27 +0000
Received: by mail-io1-xd2d.google.com with SMTP id 81so37346503iou.11
 for <linux-mediatek@lists.infradead.org>; Tue, 16 Mar 2021 07:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q/7bUx2ojAKrW6WgffbugKW8m/FPOBCZYXbC80AEUMc=;
 b=z76CH+WeqlQ+pu7RK+WzjqujAOQ6/CmXvi4GjO0DCt3fs5AYzWpny3D1bjIokaY/pC
 JA3rYTf4VVtgGp3EdjZ78U9ODvIVKbq5hBBWF6VDrqqVuGrScMLGFVToGl3B+E+njJGO
 QpvtNAWnjUJUakiX5mY5bypyERM2o3TTfIa79bYsVMew23xqPtea7cPnWoQ1QtEPI63C
 coIscGADK9JfYQyGe6Qv9ozlIFwHwszMW50AXhUyBVEAnaSM6GiEfoq6xEI9668T9t5M
 8o1IFbAf89Mf+YxlXhe0kYgymsD+N4lCX0jPg8BfgvJdzlYX/UwHVXE9PaQusIxkVlmF
 uy8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q/7bUx2ojAKrW6WgffbugKW8m/FPOBCZYXbC80AEUMc=;
 b=N1VvEX3bqXAlKbghy9QI/rr5zUsNEqzFQIKwdt6Tv9ENmT+c1C6Y74IG7Y7iFJACLm
 9HQLrf+JbjDfTAm681RNvM3hu90BI2QQAbMPHAXmRb9GGBBcVW+PqzRbKrzXipi66ZQY
 hfV3wxroZ/iWoRwJfetgn658ECryIAjW8MhVbNXMQmv1T0EXyo1uBHG61loFba7p/8Ui
 KIgegVxCYezg4pt/r7sTEYeZxoS/OPkFLOiayeP6VNj0I3j84GAKQrPhOtQ/sVipe1yj
 eC3lBhwdy25GT6R5Mn7W/rIQsoQNt2oSPv+tWnEQrrcQkl10YjueLf6mBg34mDNHJX9a
 leQA==
X-Gm-Message-State: AOAM530q48Psdglx58PyYyVr+V88zb/pvKez9RsTGgPl4yRQxHn91InC
 Iu+4f7tfpXDgyiAlxVo91Uysg50sHK56xg==
X-Google-Smtp-Source: ABdhPJwPO1EQcYJZ3fJbKhMNm75wFqtlTEhkQOWrkrVPpM2B92os95Di1BLlnJW0D1fpwToyGzkhIA==
X-Received: by 2002:a5e:8d05:: with SMTP id m5mr3570773ioj.114.1615905201756; 
 Tue, 16 Mar 2021 07:33:21 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
 by smtp.gmail.com with ESMTPSA id d22sm8423199iof.48.2021.03.16.07.33.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 07:33:21 -0700 (PDT)
Subject: Re: [PATCH v2] task_work: kasan: record task_work_add() call stack
To: Walter Wu <walter-zh.wu@mediatek.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Oleg Nesterov <oleg@redhat.com>
Cc: kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 wsd_upstream <wsd_upstream@mediatek.com>, linux-mediatek@lists.infradead.org
References: <20210316024410.19967-1-walter-zh.wu@mediatek.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <7d5b6e38-2e11-06f7-0a6b-356bdda0cd5b@kernel.dk>
Date: Tue, 16 Mar 2021 08:33:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210316024410.19967-1-walter-zh.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_143325_633444_913FE386 
X-CRM114-Status: GOOD (  12.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 3/15/21 8:44 PM, Walter Wu wrote:
> Why record task_work_add() call stack?
> Syzbot reports many use-after-free issues for task_work, see [1].
> After see the free stack and the current auxiliary stack, we think
> they are useless, we don't know where register the work, this work
> may be the free call stack, so that we miss the root cause and
> don't solve the use-after-free.
> 
> Add task_work_add() call stack into KASAN auxiliary stack in
> order to improve KASAN report. It is useful for programmers
> to solve use-after-free issues.

I think this is a very useful addition, especially as task_work
proliferates.

Reviewed-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
