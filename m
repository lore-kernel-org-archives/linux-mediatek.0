Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EA6C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JzlTWhv62VaZiRKLsbAHxTcR/RMyd3VLsnHpLPYjrZ0=; b=ei9GQvbwGc2JlZd0yiDC19wNP+
	bTLZHQtYtBhzmhpojJ2YsyG29mTFfTQqg0GHaHscJHQJcmRs96MUfdpqzovBeeJYHf6kxv/Slq4Fl
	lDz7nLV5qZtEHdhLGeKqsAgIO7vTJxwYFltdKjb7Tq7jl25LJLEg3p/D4mounq2tDgj5+MMvGtN3c
	iWGb06Z0JUfwKqAhW36RBuj8lJi9WWhykyNWLi3QmmL0eUAatpJM2M/qIriXNBM89JlZjZdHqtLnI
	NkBGYPL8z0+gS6YmAOEjvoJc5IQbJQMrFkIf+ELSreWEw2WxnG70/eF858qluN8bSe1vg0YooIzMS
	98pKAc7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYzY-002wQ2-0i;
	Wed, 12 Apr 2023 11:50:24 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYzT-002wNL-1P
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Apr 2023 11:50:21 +0000
Received: by mail-wm1-x330.google.com with SMTP id i8-20020a05600c354800b003ee93d2c914so7604953wmq.2
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Apr 2023 04:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681300218; x=1683892218;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JzlTWhv62VaZiRKLsbAHxTcR/RMyd3VLsnHpLPYjrZ0=;
        b=HITWWXT1ZzgwSMkiDkpU3WdtyXJc4v0U9neVhd181NDfHOUczICq3WXhblylRXoyzu
         Jpllv9hABzVEP4o6rQaXal1iPTHlN4SdKPrmPIuyDHqJ3JA+O7GhBUNnKR9kwIpuc345
         U4T4N/hGTsDpfB+06tBUdnUZHCfOgK90gGvXaL2v93gv7ekDQfyL4vntnNkLwtoRkbYY
         8xzJGAyrcX/Wj38O/dGgEhp2P1FJi6bBoZpEHLH2giOWTRkRbLshk/j5eHoxwJRX/tGo
         l2GHDoeAVvBCn3Nwlf3DNtEffGNKsUHWQhobjc1kJVWQj58C10D/v0Mzt2uXvH2Eievc
         LL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681300218; x=1683892218;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JzlTWhv62VaZiRKLsbAHxTcR/RMyd3VLsnHpLPYjrZ0=;
        b=KeMl/SnVu1ZlytMKlUj4KxWRiIKNwC9Su7b7hn0NEUfZPhxC8XRSp957iLmftdRxsS
         gSHxhds072EuFqvTl5iL5pHZG5dhA5vgObZChJdH2ps8Eg4ju05qR+y1taBoSMv0bD2r
         3cW/iYNeFHDWii44XGqZZwI+uRab0TMWNT0qrUOwP7gINlZ2wUrzFWZTinLk+orKNS9O
         Lc39uoxf6JjXD5+KkG+el8+kJi4zgtTQFyeLWGOxAvG1Ms+JW8w2YBO4noaRWXfForX+
         Q5y4h0LcOyitiXipGFKR8GJYuH0Strq3OUq8exXcDOkYHynPGBh13Tua6ByBLfv3VHHL
         ealQ==
X-Gm-Message-State: AAQBX9dVP7Vl6FbmgV5bWtELBNVXIo+nvlZcjDF8uUK+WtLHj5ZdBkQE
	OrjIFmk1TcqgPIl8ToutdU7kTA==
X-Google-Smtp-Source: AKy350ZoKAMx3Ue6bjpGi/c1fA/CMA+3bO7CJPgucbkUmBjCfM2fVW6GejBg7uF/c/JaGaaF/y1McQ==
X-Received: by 2002:a7b:cb86:0:b0:3ed:cf2a:3fe8 with SMTP id m6-20020a7bcb86000000b003edcf2a3fe8mr12684691wmi.8.1681300217907;
        Wed, 12 Apr 2023 04:50:17 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id n20-20020a05600c4f9400b003ed51cdb94csm2189863wmq.26.2023.04.12.04.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 04:50:17 -0700 (PDT)
Message-ID: <aabc8050-2bf2-131a-6ce7-5b9580ff86b2@baylibre.com>
Date: Wed, 12 Apr 2023 13:50:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] clk: mediatek: clk-mt7986-infracfg: delete the code
 related to 'base'
Content-Language: en-US
To: Xinyi Hou <Y_Ashley@163.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230407083729.31498-1-Y_Ashley@163.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230407083729.31498-1-Y_Ashley@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_045019_479218_913F0579 
X-CRM114-Status: UNSURE (   8.82  )
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

On 07/04/2023 10:37, Xinyi Hou wrote:
> In clk_mt7986_infracfg_probe(), 'base' is allocated but never used,
> either not released on both success failure path.
> 
> Fix this by deleting 'base' and the code related to it.
> 
> Signed-off-by: Xinyi Hou<Y_Ashley@163.com>
> Reviewed-by: Dongliang Mu<dzm91@hust.edu.cn>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


