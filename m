Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B082BC87FCF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Aug 2025 18:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ZVlhV6ndThCFd4+zGJNIWInZ4a60Ev1vYWmuIdzmJ4=; b=XIU0wamXq50jnDpp8E4lyj3ok3
	NS/USXJJ4HuGVd0GQo3W8wwiylVH3qiN45l+VBTAjZm/Z7ySEd+alF4cZkXwUc/QK2v6jDtwjreA9
	R9uqQsS70Pd+ub5g9SJ4WC9s18pbZ0yYYagY+pgybH+4dONwbdl2auQEORpjo/InABvOSU6Gq8klF
	Vzkvqo6wpd9snEYbZ6EDnxi8yYaDqqVudjsE62N40KoupYAzqpat6dZ9NhybgQ7NzMKBI5k/eGau7
	WM34We+mMZ/Vdmau0WYXsq8uPzutrFSGr3MvWneQB9yOGbts0KGzSWtNUgp7pj0U8z9zYBLZMo3lz
	JD3gLGDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uizy2-0000000BAT1-3Xgf;
	Mon, 04 Aug 2025 18:31:26 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uizy0-0000000BASD-3S0V
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Aug 2025 18:31:25 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2400b28296fso67924115ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Aug 2025 11:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754332284; x=1754937084; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZVlhV6ndThCFd4+zGJNIWInZ4a60Ev1vYWmuIdzmJ4=;
        b=yNEJw04nP701nA2AsybblJk3Pit2eqpZOxZmByFf1RozNUyHaefbubgv+eZ3ZT/x3V
         JzGmlAODAhoGXtWzjgJoWRmDW57XtBKQ3HgxYzA4Ky4BuQpBAK2mLfOqnM7O338z8uSV
         ZxqUpAH5Fgf1Nl1THq8RqCrmDKIGqnPsgq4W1gMyoeRTqO+RsI9lYfFO6ggirhe6IHJ0
         hCZdiv5ytnzqo/Jz2Cc/SOcjVnCOr2cFbSbIbFqQWH2JWtSiqGqUrx7xg8S9+8Y9tjrE
         r7RuxMXnf0WdgYB8b7bt7ffGPr+0ewFxvgoIC25dYQgZUcxBwvAMO2Aoe71ib33IQ83o
         1WLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754332284; x=1754937084;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZVlhV6ndThCFd4+zGJNIWInZ4a60Ev1vYWmuIdzmJ4=;
        b=RsxdYe6RliEGs3uuM2WFCfSJwE2+4/ly3bgB6fAkOi8TeEqp5pg7YV67Ta9YImA0QN
         GgAov6syr6/+kid0TOEBg0uA78CVyWcDzZcHuWgVGgHGqkzSaHyT2pQhgBlxifrLru48
         Zoe8H1ulr0eoxa5FDED4jP04OBZqUlnwjcHu4ZA+VcnUV1xfEc2d0MtP6L9pVsBo2qvb
         hBXrsaaJeYQZzOsUXF2xnGifDXzjG15DiTvHMLNfNBvlJ/yZRnT1VQiELObvj7G09d7+
         bIHQoEsNNt2to2v/OSNGauqcJctHx1genuurZyJWvBzZjCLgjr4b0NpaJF8OUsy1t0J9
         wvoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaqUc9LI2w6gT+gnXTrIdNXKi2h5lM7eKSM6NZr+dLQPITj2Rl1qgX9UOwy9PRq19/KCjuKVOv+5MOM64VCw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyL10Nm0gFGni5Ju94E26LVMs/0s0fVi870oyHyA0eHgkzSblso
	QULRpf/KCfjGc4cOOYfzrCq7D3LI5NwoBV1ZXSU0Bp0x+fwA8Xgo9YK55JUnHWAIM71GQwJyrXb
	TMJ/gz0wULA==
X-Google-Smtp-Source: AGHT+IHWBu3VQz8pzZ+1rcfbz3HxJNSMQP0rdBf6OTWgijBCozRjoOUWrc/UH4pOKHcnDrH55Kq6u4Oao4QE
X-Received: from plgw17.prod.google.com ([2002:a17:902:e891:b0:23f:fded:852b])
 (user=jyescas job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d506:b0:240:52c8:2556
 with SMTP id d9443c01a7336-24247023afamr130598435ad.39.1754332283728; Mon, 04
 Aug 2025 11:31:23 -0700 (PDT)
Date: Mon,  4 Aug 2025 11:31:21 -0700
In-Reply-To: <67a54f31-e568-427a-8fc8-9791fd34e11b@redhat.com>
Mime-Version: 1.0
References: <67a54f31-e568-427a-8fc8-9791fd34e11b@redhat.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250804183121.2892827-1-jyescas@google.com>
Subject: [RFC PATCH] mm/page_alloc: Add PCP list for THP CMA
From: Juan Yescas <jyescas@google.com>
To: david@redhat.com
Cc: akash.tyagi@mediatek.com, akpm@linux-foundation.org, 
	angelogioacchino.delregno@collabora.com, hannes@cmpxchg.org, 
	jackmanb@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-mm@kvack.org, matthias.bgg@gmail.com, mhocko@suse.com, 
	surenb@google.com, jyescas@google.com, kaleshsingh@google.com, 
	tjmercier@google.com, isaacmanjarres@google.com, vbabka@suse.cz, 
	wsd_upstream@mediatek.com, ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_113124_857941_6718981F 
X-CRM114-Status: UNSURE (   7.68  )
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

Hi David/Zi,

Is there any reason why the MIGRATE_CMA pages are not in the PCP lists?

There are many devices that need fast allocation of MIGRATE_CMA pages,
and they have to get them from the buddy allocator, which is a bit
slower in comparison to the PCP lists.

We also have cases where the MIGRATE_CMA memory requirements are big.
For example, GPUs need MIGRATE_CMA memory in the ranges of 30MiB to 500MiBs.
These cases would benefit if we have THPs for CMAs.

Could we add the support for MIGRATE_CMA pages on the PCP and THP lists?

Thanks




