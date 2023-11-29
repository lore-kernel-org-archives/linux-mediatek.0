Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E452C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 22:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I514WpKhed4nrQIz3BqBn8ospI7mOLbqMpjJBTq6ymk=; b=gYWQPB5chpjaNQQK0uVKcu007J
	+kpXscKx9cEtv0bOJIM1ZgrQUTpFYr0Cs1qIo3t2ECrO3Yll7pE+mqd6l+IVPMCPivGAyKooWohVQ
	RugeLNF76nB5LaXfpF+IQCtNKe/nx2tUgdpCV4XjDzzCVI7IUVDVh5jehlc9zr8ju8GObIq08DrWH
	/cf5h3hv4R7nu/eTjyPCV19xF9sV7o3y6xrfy0DeqxZbe4HiFmHZtAyiPyjHUcvOPVSvhRqjEJXxx
	V6IBqxEmaB/dYOgIDdp6x5JosviGg6qr6IrdutgWJ+/tqbSWabip7R6J01NOR/cNjUGUEnPm8B5aE
	YhkjYoRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8T7b-009Rbp-26;
	Wed, 29 Nov 2023 22:33:31 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8T7Y-009RaA-1L;
	Wed, 29 Nov 2023 22:33:29 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5bdfbd69bd5so1173475a12.1;
        Wed, 29 Nov 2023 14:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701297204; x=1701902004; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I514WpKhed4nrQIz3BqBn8ospI7mOLbqMpjJBTq6ymk=;
        b=l9UdOGp1gAQpToLDm7SmCvU6vJuDqA4g4WNhuF88NTH8v0dzdmVMdtb1BzwUPNfVpq
         8c0/KvbtFFrjfbiuckobY08iI3nKMz+jd1y0j2abuq4FGoKGmKmEO2QfBE6zpIBHuXOM
         /vTz0pj4x+7Ap+VpklBtWf7ZY0cVEfP4AfTzcWhlDsUnotCFeYcy1yTmuL6Gx8uBjcZg
         wyGfpNftNUvzmAujNsO2vjjjeh1/QMewjrkFVZrMzXX1H/tqKMGw3J5EIodSmrXNDxoo
         gFk51WbOI7dSENlURHugyBDttKMhd+3GvIOpmN9MjLu4culwTn5ToyOIZrha/CaHX6yL
         emPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701297204; x=1701902004;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I514WpKhed4nrQIz3BqBn8ospI7mOLbqMpjJBTq6ymk=;
        b=mqAW/EizjHKpZh/XY0K2VfhpDxDABP7s5wXz9pOGUJHCSktbI87hgfv4/tIyia0ADk
         QrymndPsYq/NA3qsSoYcrKYlXLBlHczzmLZxRzyo0894KRApqyJ2vwGlOZLVIZPPwaqC
         YXkEJiAczV8nrdEFQ3fPPPGxuro6GCBx9nYaiprSDpMk7UD6ze6mVrSWsu1PT5JM+U5i
         +CxeF1U8vnsvtdkxOicdBmKPe+eR3SzHuhVBjjQcnMaRn/pCh9lvMzUxlDuxQeLu/pht
         bv1Cje42bwY9IjoEx2VUrc75WRwK4stuSUyom9zG7MdrxVWPSeplD4HmpF2x4B9mi49h
         P9Jw==
X-Gm-Message-State: AOJu0YywhMtAclcXZP+RRQG4FMc9M8BNkHcBnyxJsTP0lSLYOKxN6drS
	ckz/o8593KDrKe4XBKZMMf0VjAhKjGQ=
X-Google-Smtp-Source: AGHT+IE3ZS6fBgIZrU2HaJY5dQVHSaIR5sQW0MA6Oe5+Gz0QY2Tn9XeHc+eVzspjQkI0SKLmVHLiFw==
X-Received: by 2002:a17:90a:ca08:b0:283:967c:4e6 with SMTP id x8-20020a17090aca0800b00283967c04e6mr33689697pjt.12.1701297204224;
        Wed, 29 Nov 2023 14:33:24 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id g4-20020a17090ace8400b00277560ecd5dsm1879096pju.46.2023.11.29.14.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 14:33:23 -0800 (PST)
Message-ID: <cf0da74e-4440-4ad9-975a-53b77f3121c5@gmail.com>
Date: Wed, 29 Nov 2023 14:33:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] scripts/gdb/tasks: Fix lx-ps command error
Content-Language: en-US
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew Morton <akpm@linux-foundation.org>, Oleg Nesterov <oleg@redhat.com>
Cc: casper.li@mediatek.com, chinwen.chang@mediatek.com,
 qun-wei.lin@mediatek.com, linux-mm@kvack.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20231129065142.13375-1-Kuan-Ying.Lee@mediatek.com>
 <20231129065142.13375-2-Kuan-Ying.Lee@mediatek.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20231129065142.13375-2-Kuan-Ying.Lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_143328_455474_892F187E 
X-CRM114-Status: UNSURE (   8.42  )
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

On 11/28/23 22:51, Kuan-Ying Lee wrote:
> Since commit 8e1f385104ac ("kill task_struct->thread_group") remove
> the thread_group, we will encounter below issue.
> 
> (gdb) lx-ps
>        TASK          PID    COMM
> 0xffff800086503340   0   swapper/0
> Python Exception <class 'gdb.error'>: There is no member named thread_group.
> Error occurred in Python: There is no member named thread_group.
> 
> We use signal->thread_head to iterate all threads instead.
> 
> Fixes: 8e1f385104ac ("kill task_struct->thread_group")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>

Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


