Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E69E63FF9
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Apr 2026 00:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:In-Reply-To:Message-ID:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=igv1X0Jh9R3lolDJfbtFzOBAbeGQ8wEXL4Lx+psSqc0=; b=iygFHzeG/CM1vKLjjn08fky6c0
	ShnWSyd7ODhyKCYiqC3iMvIAjwINNcmHVB7eiVKy3d9d74EvEqCcU6BJYqCwvPj6k5iIlwnPQJ+Ya
	WbEBfE9wwpX0bYDPOGcTPDrdSR4xyl8ucFJQubvewa7ZfoqdCMZ5b9SAVFH30G3IT1aO33o9Jp170
	hC+fz5fen3Lyg7PzKBj+bdmFIKouEGqf2gYvYEbUtlYtx9+QcoKf1qD/DIQxHPjFFsf1kUzqTaVsT
	PZRcqFYguwH063OFOQ5xKpnIIePJygfaRrKekNix/MtJvY18Jk1CJpu5cP/xNQqS46HTZaAfbC+4J
	NEBewThA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9BpK-00000003rah-2GBy;
	Sun, 05 Apr 2026 00:58:58 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9BpH-00000003ra1-2fsP
	for linux-mediatek@lists.infradead.org;
	Sun, 05 Apr 2026 00:58:57 +0000
Received: by mail-pj1-x1041.google.com with SMTP id 98e67ed59e1d1-35d99bae2ebso2596020a91.3
        for <linux-mediatek@lists.infradead.org>; Sat, 04 Apr 2026 17:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775350734; x=1775955534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igv1X0Jh9R3lolDJfbtFzOBAbeGQ8wEXL4Lx+psSqc0=;
        b=KltLKZ1Xx63TeeuNWAs0yyJ3vahQLtOzuutogfpFvuxEiFK+SQvLCPMVrFeYQAUptH
         ZqGBIRE3SU1Y9oLldwV279tFDnxct576Y5eZjgovlfE+WYRwH8wjLw9vwJ3WhNt6ib1J
         IJFJxxa/ctMFfaY3EaV+jnA6j1M6NecfhhXjwZn93Q/qV0ErVv6uj7KHZXvIVcbrTsL/
         WLvZbuNlBoLQ+Vf6+0zEKcaCsLrl4XTsHOZFKSyObOxRIV0Z39iNe4/VnqFl3cfQOZTU
         zS7LTibLUP38I9g6rV9f52e3Nns+HMNrgWWS3K5+4EO3eVXDGsuGK4kza3CfvT+0UBX1
         abiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775350734; x=1775955534;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igv1X0Jh9R3lolDJfbtFzOBAbeGQ8wEXL4Lx+psSqc0=;
        b=TTB1r4ZrHHcxJY9UjbHqBPU+u/o76zGTgoGP45hKDrnH3LFqkW1TMwn/yOB0GaGOHD
         q+DLZSCwVUANoN9Da0bEXMjRxpTxLvXtF2aZa/fzvJzdQ/Peh8PmcCTlQVDwA2K+K1M4
         T67zpFNZLj5mBXpsl02NxFYnnjX8hbUsgskq0Gy7wCM67WM3h+wiDBKJAbV+ZVSjF4yJ
         CI+MW+k1MEUDar8Mkcob7z3SLZHjMc/S4NqGQrQwUhQ29Kh6c+p4oq9IqtaNBBSu5V7C
         L1SZamKu8kIwi4rR3E4RingVYqvEdQ43QhZ3DoNb0Fu6xaNfs3E2qbkZ8So9uRSt3ch1
         15Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXbm6fFzpwQOyD7tLG4N3ADvWvVybN0wbHPDq35VMbgNkEgyKOfloPFKvhsFiSIkPyKYqcFk4+/3vU8C8rkQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwwVgIwFAfIBTgOkYumtHdeJw8GRUpUzj2+uUAWrxOYsiiEAzVi
	ceABNVnbJ2EOlc+xJ+unR9ncv3A/5LJgrKQR8Sa8VHYHNtk7uHOUAy5c
X-Gm-Gg: AeBDiesOd2k0+Xa/iKxTJf0nmtaZ6i7ir9RtGCcJwD8sFMc2+l2Zy+pIRzhOrPXKwEI
	EYBOjxO6P5emhpu1mQSLySNb87Kdj/iSVPX4xeBB7tPlcJMGc3nanawg7mrmvLljBg/amJTxTAR
	PCUA0ij6/fRuegMEsmNpCJVsfGR75D/sklbmnArdz3GFkPtuxuveBC3SaB6mBbtMAhOxzUmPRRj
	v6Z/ohIbdX6PgNFGaTUHbpM+zFMjkLcil4WfoIiPYOhaEd2xJ7BxBkwpK7mjRUmvUfQWx8+YRq/
	i7Ok2bmjO9PpsA6FqpHZIgvAJsh7/xP1Wf4xDGPmysJOpriZQ4nLPo+COegnioDoszrkV+ZlX8I
	+lzAxxd1sA9lpoD3LeJygkLqq9B0N5bwEGL36f1/BhM/YDm3kqAVNe0Smi2Pw/0Bi+CJn9grt4/
	u2oW5J3e3mG7xo2i3ps7Ro/hE=
X-Received: by 2002:a17:90b:3d4d:b0:35b:aca5:db39 with SMTP id 98e67ed59e1d1-35de67ee6bemr7012077a91.9.1775350734065;
        Sat, 04 Apr 2026 17:58:54 -0700 (PDT)
Received: from [127.0.0.1] ([142.91.102.47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de6860cfbsm2876078a91.6.2026.04.04.17.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 17:58:53 -0700 (PDT)
Date: Sun, 5 Apr 2026 08:58:41 +0800
From: zhang <zhangweize9@gmail.com>
To: joonwonkang@google.com
Cc: angelogioacchino.delregno@collabora.com, jassisinghbrar@gmail.com,
	jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org, matthias.bgg@gmail.com,
	stable@vger.kernel.org, thierry.reding@gmail.com
Message-ID: <8710cb76-78e7-4e7f-8be8-0f059b9cb0ac@gmail.com>
In-Reply-To: <20260404124428.3077670-1-joonwonkang@google.com>
Subject: Re: [PATCH v3 1/2] mailbox: Use per-thread completion to fix wrong
 completion order
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <8710cb76-78e7-4e7f-8be8-0f059b9cb0ac@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_175855_686963_21A386E6 
X-CRM114-Status: UNSURE (   5.48  )
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

Hi! Joonwon Kang.

I just looked at the content of your email, and I think we can design a resource priority scheduling system with 70% and 30% priority allocation. The specific idea is as follows:

During task execution, each task can be tagged. Important tasks can be allocated to the 30% of resources, while the remaining 70% can be used to run low-load and repetitive pipeline tasks.

The specific algorithm can be written as follows: reserve 30% of the runtime space for the system's critical processes. For the remaining 70% of non-critical processes, a judgment can be made: if resource usage exceeds 70%, the excess processes are marked with a priority deferred tag and run only when resources are freed up.

-- 

the-essence-of-life

