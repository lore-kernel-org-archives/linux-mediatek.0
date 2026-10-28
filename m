Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700DF606A325
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2026 10:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VZ7A7EVr;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u1lLMUf1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fJvqHOk07FUa6s5/fD4Hq7cD2mBklo9gU81ggaCJZwE=; b=VZ7A7EVr35LIm/
	WQ+xYBM4b/Lj8qBHUqgCMkq5LXNOE36ThEp+WAW5yuLKaz5cU6e9Tm6nmSbpkEdsNu+aadjHtFdvx
	ibmnM1pCOfQW/UyKS6HNJYJZpEE1AWxXjllDEFrGGfGDmoaipTk36raVSyQnSMcENDyyDkI8s/XEX
	GmkgaXJpMnuNlYS8XpE5d824RlmVVzFbkgVB5O9WuYOVNIzGMVxqtT/vLzhk1a+eHIPPTPxKErgWZ
	o5ow2kxLeGayQMvXK9fKZmUlLV+YrXQ/qSsfCh/yopIvO2ttdB3YpVHqX2gHs0rFOQYce2YZehRat
	ppYjNyW8rjcY7tFd3mnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0zO-00000006lcC-480N;
	Wed, 28 Oct 2026 10:34:38 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0zN-00000006lbY-1TdL
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Oct 2026 10:34:38 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-3535a54bed9so1158055eec.1
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Oct 2026 03:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793183676; x=1793788476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJvqHOk07FUa6s5/fD4Hq7cD2mBklo9gU81ggaCJZwE=;
        b=u1lLMUf15URu6373vjeKsLbdD6E+qcB1b2SA/y1r/ExpGtXff+0zDHGCR5JV2/am60
         wCrQUSJxC7SSoXimFNbEPRvtAtz5qhaDE7xstTMcx2YfF3XiWtq9tsKX4xOwIDPbG1X+
         uUnQURRRq7V1K+AjegnE5GG2e0xwwF/cRwUlN2pBGyrSWuk4KwL6w6nA5VYgQWprCIL2
         AG93WH4fUio6Emim2TeUKIkC+jHeuX29IT8xx4faI4bvTvtwzKi2bImrjrHqKGreFusU
         8tQRUi23gdAmYm/rO+mR4roV8lsA9jSQlrZ70VvySEEVOwwZQCpYWG5mAxMWRK/bskKo
         iIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183676; x=1793788476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJvqHOk07FUa6s5/fD4Hq7cD2mBklo9gU81ggaCJZwE=;
        b=oppyDFymmcbKWQLFdh2DSwgo5LoqWQm/fW3WBP8mk0rlYcypiVNhiu1cLrqlddN7tz
         5OB6lqP6Upt6ITwSjqEHK74C7uDCvSaLR4SAQEoi78chvvGhvyBCxS1z3IIbRgQk2kvw
         /eqSFHHhC2s5YVB3Do9QWyfMUK03EFUbiFwasi7rZQEera1+6WvCCEUY2IeietEHLTWv
         K857hRzMkWMN+Hj5YLWqAu34A5/811jt4eGppthWiMFMI8Aso1zqEXo4cse9+HLbBn+k
         rErnDHfXge60+FJ5FALS+Z7d8e6WVYyi3OndPMfqToL/aDkuKRUZbh2DPgPGxaNmINX6
         oEQw==
X-Forwarded-Encrypted: i=1; AKwUvBz6/NsndcwV8ORXXt+A17LlToMg6S4cTARaToFw6s6iH3oG1nV5iX0QvIOy++AZFA6xG3kqrF5NFC0CpgVvLA==@lists.infradead.org
X-Gm-Message-State: AFq9FYL1aGM33KC/vBZmxZ29dSPcSQdsKekkix73d6m/9NNMghQAW+8b
	PZ6eHlUfuF1OlLRyChLIz634PgYKW18ANCcCizU0YjTwI+bVwSngE3Mr
X-Gm-Gg: AYBFou3Beda1Nvl0dWa94irIWbDUTgi4HgYtR7hvYlVJOVtffBGevD4hscGA3zggE7d
	vPEf5O8pKvOx3PFQ1RsTkgc/ay7ppo7TxjDnP8KqyP21s2TclT8RB43Ea41UfvgkIKBQm3GqMVt
	3Ki/9Ak6ajsAhxqmOnAHIZOzMR2Fz/uXzS5Hs4TXEXKikRBf7QjmojPibFbdl/9Eyc5R7MU/j6J
	nG+208YYVZ3H5qPZZ9dQ9quCpVVtyvHv2Th8PSxkgH9eASvkiVBsy5X4noEAFtJ+mIkaAulR9AM
	Wuvf5L2wWhANIQZrT6CjdIzJ04JP5NSU4yDE88kxB4RumMA8O6zwE3pE9XtjjEXR0SRxpWHAbi4
	UkBS6A6XydtAB+L1HtMn08RhAEW/8Kq+SSGJrp54ZL6dBr4pgFoAMZDTlb2V3JQquMayDq6n7hB
	4PKuaESpELemdEwewuY8YkYYTwTXQosm8BOh2qBn501c2+kWZA/2Ho+RpLbM9uHm64rbco/AdPf
	GJSF21ZLyzlusnbZrn1abklqVkMDtAXi/GHWIYITra1tQAfXiI5G/3snCkmIAksI12pLPpTf1+7
	4zwb0/w5NSmWqKnfR8EFyfCUjOgimRyrH0M4NGDDmXCk2LCT0DU=
X-Received: by 2002:a05:7300:2406:b0:35c:8b96:94d9 with SMTP id 5a478bee46e88-36a203bd31bmr2926356eec.19.1793183675982;
        Wed, 28 Oct 2026 03:34:35 -0700 (PDT)
Received: from localhost.localdomain ([103.177.252.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2399b05dsm5723047eec.25.2026.10.28.03.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:34:35 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: mani@kernel.org
Cc: angelogioacchino.delregno@collabora.com,
	bhelgaas@google.com,
	kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org,
	lpieralisi@kernel.org,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	ryder.lee@mediatek.com,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v4] PCI: mediatek: Fix integer truncation and handle oversized resources
Date: Wed, 28 Oct 2026 10:34:00 +0000
Message-ID: <20261028103400.2532-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <kfnxuro5xf4mhokabg773zcyp7otcjxwpzcn3dlo6y3kpv4uv4@bne4qf3vcif5>
References: <kfnxuro5xf4mhokabg773zcyp7otcjxwpzcn3dlo6y3kpv4uv4@bne4qf3vcif5>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_033437_390709_4D762CB5 
X-CRM114-Status: UNSURE (   6.65  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mani,
 
Thanks for the review.
 
I've addressed your comments in v5:
 
- Removed the redundant zero-size check.
- Changed `fls64(size - 1)` to `fls64(size)`.
- Kept the full resource size calculation and added validation to reject oversized windows rather than silently clamping the size order.

 
I'll send the updated patch shortly.
 
Best regards,
Sreeraj

