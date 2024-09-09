Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D0AECE577
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 19:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hzdIyFwes5E7fNP0XbG/FRyMiugQp0LAX05kqVps+ao=; b=kfabp4rgX2iScU/Nve1oA2Txoi
	VXgxCJpBSraQKZqVWMHUKciLReScIZjHcofEmLURm/B/+Hf8T39SkOnHxr2qH86sMa3oRbWwVu7md
	hDCJ2ZnKdyD2mRMgboz6WiqeywMneFsIUWFDxetdW4xeAZ1J/e/ExtDm3YLrSRBF19WnEp+wU103e
	djuJQlTWfD8KfRQL3RYdb5INMc/9lf7Mcpu3ATbfwUoa4TvAaiCExZa1LnEWM019NLwHAs+XQ1TR2
	XUWCIg6dnYKdVAKAyYumXTsgOxdYB6xtOcL3Q5RNvrISj/sJgZEXlDEcwSgPMmOT7EqUc1suQroSB
	HpoYwjtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snjkp-000000032kQ-13bj;
	Mon, 09 Sep 2024 19:08:51 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snjho-000000032NY-1owD;
	Mon, 09 Sep 2024 19:05:56 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-42cb9a0c300so9834355e9.0;
        Mon, 09 Sep 2024 12:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725908742; x=1726513542; darn=lists.infradead.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzdIyFwes5E7fNP0XbG/FRyMiugQp0LAX05kqVps+ao=;
        b=Vqlht0i8rY9oHx/+a+2+wWpqMOy0M/Ffu8mx2TPyeZfEokEf6m7OSLpIZtBknl+yOd
         38UjL359p6munLn8UignBr6RKiFjeabHo0YixAy6BUkKz+T6CRBgNBf6l4WRut8DQ477
         xFaz662B/md/v5PBAV6es1w6Zv2oTW/LS5Y9rSqaI80E1RZX8uNlHXsUj7D12pWLF0ee
         wWuQsP6t91N+/4aLd1Co7uMlxKE8a//YWuZ9ETyULBVCv7FABnZ1uIHxDvTXnKmNjI6+
         /91eH8rpkriHUrx2GCsKUSkcqg062XcZKTwbaThvC25JIpvuzhvnuZFgIUsqmZfb0k2o
         6OoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725908742; x=1726513542;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hzdIyFwes5E7fNP0XbG/FRyMiugQp0LAX05kqVps+ao=;
        b=eF6dUX46gl8WkJv5gIW7GKV+x5qjIjZSII9WGrn+KBiekew7DZbqola4n4Q43SpAJU
         vEDkycC6dfwZzUz8JIyaFYPHNiBZGbhm1T1MYF4iYX9D5Dk77RoOYfyczV9cv0aqVEHT
         Ld+cgEq8vw6K+ud+lu8waIcxyFLlBuxIkvMfW0lNBXxvWXKzhYcHgC2P614cb1gmlVHP
         kltVQLHTpPz6R+gF/dZrjhSVGGDmm5y4ZnnX9fG//+CYUHRavN2Rmi/cOg9kdRvUKEQH
         3FTW7hpZ20T68bXpK/TZ+l6D3vUlcfJ8L/P3RjqF5NHHKpoFjpjkq7u1N/nLxMCDZm7+
         52HA==
X-Forwarded-Encrypted: i=1; AJvYcCUnmN+9Lr+MzukqCZB6rj4yoKQtyYugYHxn2LlowPnuvNksR5+7GNrEzMFOd3NmAFIWpXTMG2fCQlEduR1tB/xh@lists.infradead.org, AJvYcCWFabah6jQaxtfyo/RrM4nAsea4yS/nXwWwVipCCFN7WIRXXiLcRzQw6CY1TN5Oy33FrgiaQGSYybDnNZxINrI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwv21kzUXC2ZvE1Q3+p13VgA+Or7hlIkZ8vM6hfHg44Mr4vXra
	TUfWmlTUpYF0OH/FIcfu67mh2IHTAZFAW/R2plvebpclkjhOu5lT
X-Google-Smtp-Source: AGHT+IGGFS6+SNzhStLak4DTSssNfwHMJp+x/lO5SGNb0RMvaiFuXTAvIydG+lDYr7vGpowfqu+5Yw==
X-Received: by 2002:a05:600c:1d9f:b0:42c:bf0b:c489 with SMTP id 5b1f17b1804b1-42cbf0bc58cmr456635e9.18.1725908742222;
        Mon, 09 Sep 2024 12:05:42 -0700 (PDT)
Received: from [192.168.2.177] ([81.0.7.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cae117aeesm88930315e9.6.2024.09.09.12.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 12:05:41 -0700 (PDT)
Message-ID: <bfa9ab87-9de8-41fc-bfd1-de5ec324cfe0@gmail.com>
Date: Mon, 9 Sep 2024 21:05:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, ca-ES, es-ES
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] MediaTek driver updates for v6.12
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_120544_509627_1A9C42F2 
X-CRM114-Status: UNSURE (   7.85  )
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

Hi Arnd,

Please find below the changes for the SoC driver for MediaTek. Sorry for the 
delay. Hope we are still in time to get the patches in.

Matthias

---


The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ 
tags/v6.11-next-soc

for you to fetch changes up to d1e5d531d20b085bb83d9ab1868ed99fdeb0cc42:

   soc: mediatek: mtk-mutex: Reduce type size for mtk_mutex_data members 
(2024-07-30 10:58:46 +0200)

----------------------------------------------------------------
pmic warpper:
- reduce size by constifying data structures
- use devm_clk_bulk_det_all_enable

mutex:
- reduce size by changing variable bit size

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
       soc: mediatek: mtk-mutex: Reduce type size for mtk_mutex_data members

Christophe JAILLET (3):
       soc: mediatek: pwrap: Constify struct pmic_wrapper_type
       soc: mediatek: pwrap: Constify some struct int[]
       soc: mediatek: pwrap: Use devm_clk_bulk_get_all_enable()

  drivers/soc/mediatek/mtk-mutex.c     |  52 +++++++--------
  drivers/soc/mediatek/mtk-pmic-wrap.c | 118 +++++++++--------------------------
  2 files changed, 56 insertions(+), 114 deletions(-)

