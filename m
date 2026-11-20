Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FA060A260C
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 14:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RSGu7N/B;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PTdc3rl5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=; b=RSGu7N/B/xGQSA
	pzg1dyaFS90ieuXN/1GNaMvvRdPQYoByl9whDiySh6pS3MWwjKcavZHZbnkHuhNTxNqoVKZ8VCmEf
	NE+pFBu8wwlgTs7RiQQL3tHEDNXqMS5bFImE6hZPETTftRYQRaOOwjMBjwpYleTq14CvkZQ93cBPv
	TXlb4PKyTliyLDzWVuOxSotCsb3bywkYpOi9ZxsJDokB1GI1u+Qp8IJ7DKHQXYlqbUaKOZYUdWUZm
	nR42T1X7nffHSzYAJKlbz6ahs9GGag2Vla1CzOVygFDFT8/8miUbhcAZh7+2P0fqU/C1/vxqv056Z
	mZv/jv7fxELbzE1oNn0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPNp-0000000FDwK-36Xp;
	Fri, 20 Nov 2026 14:14:33 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPNm-0000000FDvR-47OH
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Nov 2026 14:14:32 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-38587f3de36so1062947eec.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Nov 2026 06:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795184070; x=1795788870; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=PTdc3rl58MWPHQuqnjVoqCuwprhMOUJYgE2njGAi2g9I3qaGajYT+0QyZGJ2amAbh6
         p/Rsf5Q7b7edUjRoPDPIREI5CNe8cbtBCN0dXVjQNNmyMSLkFlshX9Wrc0rRtjISasE0
         1XKwFqVU6XuxXLoqBFlh6S0IjfJmOVMhClm0OoEeTqpVWiUEFvUxWf2n3MKGCEUuYQKR
         9Uhlq62/8YgalP2eZlkmwBpJZC6FhcZDUJaLBLwNWJ3ffKDq6VAJSkr31MkHnHoFC+P9
         qi7QEoKw1O+OB2FaYFMhrvjym1lktF/UQ9id3fIcAvUNZl9BvF6A3jdxjwsXUFm+DXJa
         SmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795184070; x=1795788870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=XJG//otjVbFeJVT8WitmPUpgskqhF8IOw5GLM57asZawRDJDMhJY0Kiids6255T/ot
         Wr5UxwsqWbRCJqpRhgw+ZeQhP4ZRzjS9QC0CmNoiccfbExu2izG0nqGoumSxl8psC0yI
         s2JZqRbMC6ErFjeDoDUez/RjcuJC/G86irxLhlXgcAOrh0BNtAktQylIWaXqbM5SdjeF
         44od8vZ8M9gfDvGK8qX/d+1DR2gGFj4cuGQc6YlsP9RExBPbXGyMiqoziKExzPwQvbn9
         xDBouijyLbuHyNzYfCEyr80JCXTgjklkwRwu4l/sM9lgArSaYa1o/AzmsHtIb/9lv0RX
         qzhw==
X-Forwarded-Encrypted: i=1; AL+hErFvM279OpAwDEx16Ay1LdUlIrP4gbjN5Bn8pAfbejqKaX98iAW5z6fdXQZoGIZ1oCkzQqh+sAryluIdgY8DNg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+n9j4PQKgRzi2krZrYmlS0LvAIAbpjFBrbvJCZYn8OCEBRZ7Li
	LFVXqjCtZbfdYxqTjR1/8WCGSYXKk8QV85mpJ2wnpenX6II8l9LGJbyvrQdOhBxQ
X-Gm-Gg: AZFdTZcC9zpmfzqFvclzloiwmvnX9IYeBwlldm1DqEkNYuuMOCaLZXtbotrTekM7xRx
	2NXfCMhEF2Ig76ugRjSM/ejZhSkP5eEzp/chWZny0Mk3q6fKuHC45ABddNPgnwsMuGud/roH5xQ
	g+fIObddixEvw7+dhKDmKLzFZxlje4HqGjgZRonL2f/tvI3stOM9pSI/3fJx0/TxVLolAOBoVpp
	fDQLjUYQK6puPlZjmhc5iR1se+fkWCe2eAUZgrKlFxaTCZiDAneZkYQsnsVT1uQOcPhMHaziHi2
	L9EekNXERgYrhDd5CtC4hPmdHgKGxqPkrNbe2ox/EMDC06B+h9Hy4K+o/UwUk+zsguYB4TbiOkG
	cFf9k14oisY2IYNuaP3+dhzgY8ppR8IOCgFIKUz7Y9i8db04K6mEBs6WpdskFtqYS6fUEZ0Wta1
	kSFWAOCHRMSJaWVHts99FXSSYOB3nmHRUJg3vndNcFPw1xiGyxCS63xVYHr8CDOsmI9mJVA8K2i
	oSF2CEScXIUEOYifJX6gNZNvI2p2jc8z2xDa7co0qAnQoZMQMjE5XSKdXPJoNJFQPDl6elMBsYn
	wMB4UEFagp4K7pdkLjtjst86CVmpfXbTlpAyyJDdshyx3qtvaAs=
X-Received: by 2002:a05:693c:87c2:20b0:36c:dbac:705d with SMTP id 5a478bee46e88-3856f65a86emr2607885eec.15.1795184069954;
        Fri, 20 Nov 2026 06:14:29 -0800 (PST)
Received: from localhost.localdomain ([103.179.231.88])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm8954893eec.6.2026.11.20.06.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:14:29 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: vkoul@kernel.org
Cc: angelogioacchino.delregno@collabora.com,
	chunkuang.hu@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	mani@kernel.org,
	matthias.bgg@gmail.com,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH] phy: mediatek: mt8195: Check PLL driver setting return value
Date: Fri, 20 Nov 2026 14:13:59 +0000
Message-ID: <20261120141359.2532-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179510544374.1370333.8388939289479267591.b4-ty@kernel.org>
References: <179510544374.1370333.8388939289479267591.b4-ty@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_061431_074461_4FCB4E54 
X-CRM114-Status: UNSURE (   4.56  )
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

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj

