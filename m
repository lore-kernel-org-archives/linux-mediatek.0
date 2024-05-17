Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C29BC04FFE
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 May 2024 09:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2L8RSK1UXgr12jXF9ubAdgAxLZaIH1liHhgWTNSlMsQ=; b=dtgoBBRJXxfvloiF1Nug2eGRue
	lNlWVrNPX7G7TPQOrAstMXriwmUXJ/UOWFU4m8xCwuDHJGPLZ8Fz9ISDJcejR0odqXQk2MUJoxHge
	TG8wWn3WSpEqAIR8IiztYeYhFKy+BCvadHca+IgJ+LrS1QKK+b7li3fbJuoWvmOsCeYM2Y3Xf21fY
	+MrYqPDAGl8cZBdkOnP6MOM/349Gifp+7Yp1J5CfzeY400WDIk1OCdnaGTFu8+Bf5DfXNToIYEBit
	JiG1YHSjUuG/7Gki4VksThM/bAI5f7C/i0Sb1UDrvvLj4W3Rp4K6rPOT7qUq5tKlmr+auBSdjNIHx
	QOQn9QuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7uFH-00000007QBm-2j9z;
	Fri, 17 May 2024 09:51:23 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7uF0-00000007Q1C-0clr
	for linux-mediatek@lists.infradead.org;
	Fri, 17 May 2024 09:51:17 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2e1fa1f1d9bso6872681fa.0
        for <linux-mediatek@lists.infradead.org>; Fri, 17 May 2024 02:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715939461; x=1716544261; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2L8RSK1UXgr12jXF9ubAdgAxLZaIH1liHhgWTNSlMsQ=;
        b=u28terh6aOU/z9IbQrpHkIgUSgRATBrYU4PfOcEqTFMowjE8SjSqkyU1i5l9RM4ld8
         q1cpFheexSGa/KNSvhtIBLNipuS9roOlMtgNBYk/tHmkImWaN82B6+6pdoNEzR8RPgDQ
         QfK4feiEHETF1OjnbdVkHFwMOJMChxBxyY9whLS9tr7d/G1aZiA/ZUpoDgdc363KlKGa
         OUUOSP+BhtrVbu7D0Bo19dEqVvQ7hSOraLLQE6Xp727YZeoZRZY8dsOP9CD60BedQPev
         iVsBmSc/tJsGzWih0gBZVovkt4bwRxjZRvVsGDD7dkslhX0yZ4585EDNf9RwTZK9v7qb
         0Ccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715939461; x=1716544261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2L8RSK1UXgr12jXF9ubAdgAxLZaIH1liHhgWTNSlMsQ=;
        b=cYzS++C2tXSMSQ9ZCc//IboYn/YkwQu6XcTkEtkdO5nn3a9Y9Kpt1h4tXTHv44gxNk
         Ru7sUu4R00Kw1hZKlIInVyYSZfiky0rtYscV+8kJ8CNHwyowHTb4RDCvn2FrhA57IjX3
         YBXRLtaNupH79SqRZd1qVIoOvyEEBwemxQeSHS89z9Wo1YpPTiUVxD5RwOe3SYKHICUo
         gCJEICibcgZk2hxOoWMvecCxI3oO1MFCd4XPiy8njAKnAwMsePcJjPyURUGZAiMoE2ME
         5ZHi9MOjVu40v22Cg8JSIgAdUwW9RwzGjvHEaCcf4ZhbYOksAuuh4q9Hp49mt2PG7E90
         +SEA==
X-Forwarded-Encrypted: i=1; AJvYcCXnCuJ1U7jQ5SHpi9Mnm+ERGQOfc34KywvqCW5h0j816K3BjKETfEtkhvN/w5MAt+SJ8NqNDs2MG5loGukoX+AGNcX3BCinrSgcnn7nOCNQN759
X-Gm-Message-State: AOJu0YwYHRfIltOJmPqLo9imYy3VeRqLLMHLQTiJkz+ps405lpuIH7vA
	qh8fdaVBZJbAAfqfPPil6M84U4ib3vF5w6YosKEgEnlZJBr5yD7L2h9+MigA9W4=
X-Google-Smtp-Source: AGHT+IE/i6HrkK9a32WnwA2ipdftjxu8Y3Zxt+EzO3KENJBumi5p2N0H8j3JeSeqai45ufNVMCWpLQ==
X-Received: by 2002:a05:651c:546:b0:2e5:4c78:1227 with SMTP id 38308e7fff4ca-2e54c7812famr187118681fa.31.1715939460955;
        Fri, 17 May 2024 02:51:00 -0700 (PDT)
Received: from localhost ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5cfbd73547sm147700966b.171.2024.05.17.02.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 02:51:00 -0700 (PDT)
Date: Fri, 17 May 2024 11:50:58 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Icenowy Zheng <uwu@icenowy.me>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kang Chen <void0red@hust.edu.cn>, Dongliang Mu <dzm91@hust.edu.cn>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/2] thermal/drivers/mediatek: fix a regression affecting
 other subsystems
Message-ID: <6b643d19-bdd9-4c35-a775-b8e3c21b75f5@suswa.mountain>
References: <20230529162056.3786301-1-uwu@icenowy.me>
 <40546a57-27ac-8bf9-a2d8-77f7d4ab4aad@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40546a57-27ac-8bf9-a2d8-77f7d4ab4aad@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_025106_315436_2A6101BF 
X-CRM114-Status: GOOD (  20.72  )
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

On Tue, Jun 13, 2023 at 10:44:51AM +0200, Daniel Lezcano wrote:
> On 29/05/2023 18:20, Icenowy Zheng wrote:
> > In the commit I reverted as the first commit of this patchset, the
> > of_iomap function call, which allows multiple mapping of the same
> > physical memory space, is replaced to calling devm_of_iomap, which
> > registers exclusivity, and on my system (mt8173-elm), preventing display
> > from working.
> > 
> > So I reverted it, and to really solve the problem that the original
> > commit wants to solve, I read the source of auxadc-thermal and realized
> > that the address of these two memory blocks are not saved after probe,
> > and they're only used when initializing the thermal sensors. This leads
> > to my final fix, which is the second commit here, that adds of_iounmap
> > just to the probe function.
> > 
> > Icenowy Zheng (2):
> >    Revert "thermal/drivers/mediatek: Use devm_of_iomap to avoid resource
> >      leak in mtk_thermal_probe"
> >    thermal/drivers/mediatek: unmap foreign MMIO after probing
> > 
> >   drivers/thermal/mediatek/auxadc_thermal.c | 46 ++++++++++++-----------
> >   1 file changed, 24 insertions(+), 22 deletions(-)
> 
> I'll apply only the revert and let you revisit the patch 2 which could be
> improved.

What's the issue with patch 2/2?  It looks okay to me.

regards,
dan carpenter


