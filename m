Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0BCC27C53
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jun 2024 15:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRf/oY4tHfL4Wd/KvWxDSgX2je52MyvWWq8dE0wAq3E=; b=TZvh3KRMc334iNpt5PYCgBJ1pl
	rrTMVlGAw/YNQorn1foFdhPcSnVKd5wxVDvHOupOAgrWhmP9K5qcYCbbC4j75Wzc0N/VJcqS39zgi
	m579O8EO0nQFYpUGV63iribvcTsa+moH7fiBXLAd5oVP3eTWtckhy8i32VI2i8w8VxvvOCuVUoTXP
	y6c1mfDhSh/VvAETnsGygtfoMSRryB5ek42pYxs/r729/v5vOc5dg1hJ8B5vqaUHTcPEZlg28J1eE
	4GxHda0+JlCZ2hu6D0tngwLb+UNrEcBHGbNXPs+Kkf7kt5KSH7e4I6GAG3nhqzymaFAleHVQQajNC
	7Vhb8K8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFb7k-0000000Eb4t-2B4E;
	Fri, 07 Jun 2024 15:03:24 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFb7f-0000000EaxT-2NTX
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Jun 2024 15:03:22 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7024791a950so2283162b3a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Jun 2024 08:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717772588; x=1718377388; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yRf/oY4tHfL4Wd/KvWxDSgX2je52MyvWWq8dE0wAq3E=;
        b=hk6No6ZZE2GIEa1Az3+/LnC/QdOftF8dmE5zAfbpgCNqYzRg2S9JD243nRvltHx88h
         4VzgnbWO9hdGTOWih0mDo1Ztz/3Bng3AAIbag2SfYQp25r65f3SlAeEn326bGZzN2bPy
         PRkQBBgNx0/DJICwfAN5W1xDuWXtL9ICuv/L3pl2Zg7qZWZ4m5Gla07qp8xeWy210bTr
         hIOPt44nXNiZMzaCoocE3DFwN66sBfcPuHjiV+Knl9e6tVsSBoqN8o01mZsLHcXUPjE4
         jQVqIj8su0IB6j+Wsr+4/5VCrwYWt8YyBK35KPY72Qis2GlffaHcCvkUX0dPA2TQBsWq
         r1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717772588; x=1718377388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRf/oY4tHfL4Wd/KvWxDSgX2je52MyvWWq8dE0wAq3E=;
        b=RWxn2e8y531cpg5VUdYJ2YgGU5IkkK5jVCJXHG46OYKrAumVikbI5EfUqL2T3w+VeR
         n1B/g/4qoRkkHQBj5WP7mi+r5EFHLSO/VPHxWlDQtS5Ck+3TuVHdaHcLYGpcGZxCayDC
         SwgHYUpXRAI3WdpLJ3Ft/Ai0/yo2zHH+IrM9cLhFPUxyk1ADCG3PWJWbXH9WRxUAYt7k
         xqdo5vgv2qNG+6Xld02/BXUgDzwVKOAz3hJb3Ev2XgHxFGZhW0ZgPa19iLBvO+a9In0e
         oDy7W9IlRrLxfNaVgyRbOyNQnUGj5ZaJEolOTqI0sueoKKPw5PYO2qVfiGn5EDB2MYVH
         x5Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVvJWta8MVadAFCWAU5NyCVVZukUhwvrJK9LCMjktuTqw9i83TVfKNjI66l5spEN9m6ynEc9e0bPgfuwWZuWLXTqmHLWZP4Pab+5cQq31FG/IDz
X-Gm-Message-State: AOJu0YyHI1LHWUzzuuXA6j0dEOl2vJL5ZOzl+ZBa+ctpXYpOb74q+x0U
	GHPGBxROcmp7az8BsuNOiAZc8jJeby6Ss6uGGlGYj9ZVmmPFipwjGNweta+djA==
X-Google-Smtp-Source: AGHT+IFXCKFu/IlWHQySet+WNDAS0ItyhZSgv46yBbo7aKQzQitGfnGJDgfGp0VrjBaTG/BqHILrKQ==
X-Received: by 2002:a17:90a:f2cb:b0:2c2:c991:346e with SMTP id 98e67ed59e1d1-2c2c99134edmr1955488a91.18.1717772587137;
        Fri, 07 Jun 2024 08:03:07 -0700 (PDT)
Received: from google.com (226.75.127.34.bc.googleusercontent.com. [34.127.75.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c29c494a51sm3779545a91.48.2024.06.07.08.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 08:03:06 -0700 (PDT)
Date: Fri, 7 Jun 2024 15:03:02 +0000
From: Carlos Llamas <cmllamas@google.com>
To: walter.chang@mediatek.com
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>,
	John Stultz <jstultz@google.com>, wsd_upstream@mediatek.com,
	stanley.chu@mediatek.com, Chun-hung.Wu@mediatek.com,
	Freddy.Hsin@mediatek.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 1/4] time/sched_clock: Export sched_clock_register()
Message-ID: <ZmMhJlQwBTAUzyP_@google.com>
References: <20230517022557.24388-1-walter.chang@mediatek.com>
 <20230517022557.24388-2-walter.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517022557.24388-2-walter.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_080319_698888_585875A6 
X-CRM114-Status: UNSURE (   9.67  )
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

On Wed, May 17, 2023 at 10:25:45AM +0800, walter.chang@mediatek.com wrote:
> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> 
> clocksource driver may use sched_clock_register()
> to resigter itself as a sched_clock source.

nit: typo s/resigter/register

> Export it to support building such driver
> as module, like timer-mediatek.c
> 
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> Signed-off-by: Walter Chang <walter.chang@mediatek.com>
> Acked-by: John Stultz <jstultz@google.com>
> ---

Reviewed-by: Carlos Llamas <cmllamas@google.com>

Thanks

