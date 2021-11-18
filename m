Return-Path: <SRS0=mmGE=QF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166B7C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 05:55:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D869561B3D
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 05:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D869561B3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=txqYb3xZ9RdqNPX5Bv7G2Mg30LgKSzlh8rvDcr+CPqo=; b=HqXAmd3MZfJkPN
	9C6spBGTBXmajNkn8uStTHhxqwtokiIfYBYIt+DumOvja/G4tnt69Gog3uT1z0TZp9LgZUcy/720F
	mBZcZtUhT5un/U5qb460gaGEhees7Z9hBLQCNeh8KplZDsx/F4YMFFZBVTvw6kWQ7EZJXpax6tuCr
	z0bYpgfc4cG85baiVfEy2ZE76P6bZ21MXFqx7zJ95b7asQkvCE4nmXbNwzCmU+7Yd3JomJD9Wttwm
	NSyjKfMNMB5TjbCLvNOUdcnz0RKe6Y4p6C9CoF4u2G4DMWwHrnMbqurUK7UZT0yJHXL4KgdHSw8Cv
	TiNX56QivPGZsUcRHEhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnaOQ-006w9G-N2; Thu, 18 Nov 2021 05:55:30 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnaON-006w6P-UP
 for linux-mediatek@lists.infradead.org; Thu, 18 Nov 2021 05:55:29 +0000
Received: by mail-pj1-x102c.google.com with SMTP id h24so4249711pjq.2
 for <linux-mediatek@lists.infradead.org>; Wed, 17 Nov 2021 21:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+LR/apPrtZKwX6W08eJakocjLm3Seep1Fatf1AgQePE=;
 b=WczWOO1s1XTU4qJAIKd234QMOX1cq2L4vu4MeG5F0oiY0ZpKWJC9OrpLq+8JJqpEeB
 nGDoz8QYuloO/gaGIUc3NFyL5sPJU5eRawPT7FnaUHnySMUX8IMueKpOKpMMENQGQVN2
 VqZ3CvkiyTKzPG29KaIQVSwJzDxHf/dq4yyoHRArFNV1IS5iLXyAZvFqMaPeOgyVoYer
 qnSeCmnXvmmEKSWdBOTuLemf7Y3DgfNH1a9ilXjXpG8+SK6GUZ+geCR9C/cSnzur94SN
 KUXyZuFq5kc2O4oYQLQhJDw1DMB3R7fm4AYmZE/3nVk5jrKgsa40daUJw26YfSVW7/Qk
 3isA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+LR/apPrtZKwX6W08eJakocjLm3Seep1Fatf1AgQePE=;
 b=jFg9p7X9iGPMHUuXbu20Y64iUUcS05LuQyAT6m2B4TZqGtRSSR8Zup3loy52YSS1Lq
 auFJ6UYCcjJZxV/Itadk0E2UVTyatz+3Mfk/9/C2+5XCYKZI0l3TbdshsBQwRlaaZyQ4
 oFvc0k0d1+jRhR/5esI6dzgNk8YuWIqv5E6vbRj+VMmV73hu9qw8yVQIBxJ6NqH/hyhh
 jSEeYi1eO9A+xuuhSyfasQ+LIG5vX77dzS75IGteLfuL6jUvLzLvmb82WQ0avinW553p
 pjUXPER0g7jvbuJgl8WdtyicsFryJkjIB0iIscEeVlUIrP5L2mH69sRS4ZWW2rBdw2lJ
 5QPg==
X-Gm-Message-State: AOAM532AZTUMf83fpfKu5aUlCy7boNngpbgtIibLDQoNJA5HARW7uGzA
 ZakOaQO/RkGycjM8uuBb4OGltg==
X-Google-Smtp-Source: ABdhPJwQu46s7ekkE9XfTwzdQPD0BH1cjVXVpoAOyFEXdDui27VB7CUt0BHK6NpvxLu2wbCzqw6+Vw==
X-Received: by 2002:a17:90b:4a89:: with SMTP id
 lp9mr7478443pjb.6.1637214921042; 
 Wed, 17 Nov 2021 21:55:21 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:8f8:11d:a96a:74d2])
 by smtp.gmail.com with ESMTPSA id j6sm1180718pgf.60.2021.11.17.21.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 21:55:20 -0800 (PST)
Date: Thu, 18 Nov 2021 13:55:17 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 hsinyi@chromium.org, fshao@chromium.org, nancy.lin@mediatek.com,
 singo.chang@mediatek.com
Subject: Re: [PATCH 1/3] mialbox: move cmdq suspend,resume and remove after
 cmdq_mbox_flush
Message-ID: <YZXqxaVANvrv53t3@google.com>
References: <20211117064158.27451-1-jason-jh.lin@mediatek.com>
 <20211117064158.27451-2-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211117064158.27451-2-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_215528_002871_51E8F5A9 
X-CRM114-Status: UNSURE (   6.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 17, 2021 at 02:41:56PM +0800, jason-jh.lin wrote:

Typo in the commit title "mialbox: move cmdq suspend,resume and remove after cmdq_mbox_flush".

s/mialbox/mailbox/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
