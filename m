Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B11CAC595
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Sep 2025 07:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=naZ08eZHvCTGd2t3B5pVc16gcjutotIgoHB2ezgmeNA=; b=DJ6G3raPs/YU5jki+AVRl+KEGe
	eVr27IpVxBWf5p2jbeskoHxhJQEMV6iGs1/tkAoGpL8iHOHTdH9yOdDIk/6utPHT87d/neCb7AzYU
	XrMlP8saUxQics22l8+n6+HP1kH4Sxx9b9CgadhutlLnz1nxHu5TZp24cgYIK3Ik34PfDx7oSlcGQ
	n5zO+iCytK6VhV/gwavwFpPa4XyLozPWYjJaXJFByXfenzV52ZOwcGJTzl16hU9WK+Tt8Lf45bF4z
	ALEh+OJMx9JgdyG9DlB9n7iU/Ug5XGXVpKuwlV5xsWVvDrw7xODveLnixOVeOXS6Zwdt6A5ROsEyz
	eZyMf0Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwxqA-00000007Xm7-1uaG;
	Fri, 12 Sep 2025 07:05:02 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udmvu-0000000GpP6-32La
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Jul 2025 09:35:44 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b170c99aa49so2862354a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Jul 2025 02:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20230601.gappssmtp.com; s=20230601; t=1753090541; x=1753695341; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=naZ08eZHvCTGd2t3B5pVc16gcjutotIgoHB2ezgmeNA=;
        b=kViu4ZAqkNlki70RALuxmyKnbiYosGprPZfHr98ezyHFwvNrqGvWCkpvpuTOoCNGAX
         Qe5lraITi2xo4w7wB9c61h76GRxuWkFYECwsLqR6+CwgVLxc2o3mdCkw6R5BT0j9Wrrf
         u4zhkm9XIO9mf1zy/P/C108pwO/T3a1QXpHuW8BROp1Md+ahLNyEcsapHw3ricJ8ZA06
         w/zbBfZUQ9gLviAZvG5HAFZsdCUEtZDfsZ7Pl/v+nbtuMN28LnGXtAZQ6GFEpyV9UNtj
         tbpFrH3QxF6VXZxKgQMq3bVdsib5JxhKlAckCf4AXjOV2qkoJZqDEdH5aVoBno45eWMV
         YYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753090541; x=1753695341;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=naZ08eZHvCTGd2t3B5pVc16gcjutotIgoHB2ezgmeNA=;
        b=nk2xPZJwkevk8aNHg3USUtl1iBzk+OEeP/PqwQANSmD95NW+ec+JA+y9bBBmsarTls
         oYoTL239hoi/OwShRO0pckq2DSMionb9CjgAbnpaNWVmfeCdRTavm36MUVQiFStZHtwM
         s21sG7zfPo9nERZinFe7cijR7HFmXddDS1qk8A+F5mfZRzIzKKwSzSIvk/A1VqyUFGej
         vN1iuqgly5VWB4LNS7jSp1briL5WZP6w24o52adGH4peGxO6fLDtvzqrK8ibxMRDfGp5
         K6/1PsqtwBbsjQqm28mRWj6NP52+zHZoYOMvTHVxoKNGjMGSHV4q9NPaEyaGpih1aviz
         l1uw==
X-Forwarded-Encrypted: i=1; AJvYcCWZzVAjhRilE+dPQQJODFYyljDG98hMKHRGO2X6TgH+jXrE8RVVq+gZsVTf8liK3HvmTpeMdw0yqQ8ySghXBg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwE71cSZOampfHkfABF8gqRE44LvU1U4tOMpAwRHwTass0voQcC
	JUMi9WqCq2iGx+EynCCssDFy6hbBMZhBdHjkkGcQPbn9G36RKzlP2P+76Sf/SahV5yrCqd+wCX8
	9ZCwi0r7DnasbCho+f4/SWIUS5OtoMD/HoZ00riAl
X-Gm-Gg: ASbGncuGXNiSSlz4oljpJApyBs4Mr0ph3EN+Tc02nZUCUX2x7HJXxb2Jbju7ukJzJv0
	XLcFGMq0Z1tJaZSY5OTzjktbv8nG3sXIC9Kr5MgUR9GyJH5VCjqdv4+ChirL3hCe///3XoPo60J
	JE2pj/ekfWl+sEXhhHEVQaZqtUURdcdhoTXuA2kPoAFKN8hSU9hOuBF62gIg8EBBKJ1eb/wwlpT
	UNZbohDuAxDVqgNd2nGp8x6gijhUVoz670RMf2ouA==
X-Google-Smtp-Source: AGHT+IEmGl8oHtP/ZY80q8/nt0kMfo7G1cG1EHfeOtSqBLGRr1JBiLzQDQKV0rqaHt080HFfakgzt+pVfNLopOCBnX0=
X-Received: by 2002:a17:90b:28cc:b0:311:b0d3:865 with SMTP id
 98e67ed59e1d1-31c9e7931a3mr23557065a91.32.1753090541568; Mon, 21 Jul 2025
 02:35:41 -0700 (PDT)
MIME-Version: 1.0
From: Mike Lothian <mike@fireburn.co.uk>
Date: Mon, 21 Jul 2025 10:35:30 +0100
X-Gm-Features: Ac12FXw7QcT0NXYbODghRoxTCBGSd_SUNDYC9GHU9pvPg9XuP0F2KafmxpIpWpg
Message-ID: <CAHbf0-Gae=dYa=Zkx3ZJkL1SQOgHQWAMMvm68T9PPu8_=5oT+Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] wifi: mt76: mt7925: ensure all MCU commands wait for response
To: mingyen.hsieh@mediatek.com
Cc: Eric-SY.Chang@mediatek.com, Leon.Yen@mediatek.com, Michael.Lo@mediatek.com, 
	Quan.Zhou@mediatek.com, Ryder.Lee@mediatek.com, Sean.Wang@mediatek.com, 
	Shayne.Chen@mediatek.com, allan.wang@mediatek.com, deren.wu@mediatek.com, 
	km.lin@mediatek.com, linux-mediatek@lists.infradead.org, 
	linux-wireless@vger.kernel.org, lorenzo@kernel.org, nbd@nbd.name
Content-Type: text/plain; charset="UTF-8"
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_023542_869482_BC340A9A 
X-CRM114-Status: UNSURE (   6.21  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Fri, 12 Sep 2025 00:05:01 -0700
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

Hi

I've just raised https://bugzilla.kernel.org/show_bug.cgi?id=220353
and I was wondering if it might be related to this commit, is there
extra debugging I can do to help pinpoint the issue?

Thanks

Mike

