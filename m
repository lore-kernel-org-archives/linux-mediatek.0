Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CA1606D815
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 08:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ntwwOU2L;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qEl9anL7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=; b=ntwwOU2LTh4Ppx
	GVOknQvV3JO6TsqpI7sK8rl5umNyVEea3cHxXMPil+QFRWMicv5c7w3jhIVi45JOZ2AWj6PRH2IJe
	8CZH7KJACqBC8GSvpQ29cmrIg+OR5CI8vU9hFkrOuX24YYPmy/HqgGSxGB2Y6Rf327VETNGWAr/lv
	sI9IUbfPlUoPA/gdvQWsAkXcR9Wy8d/6HrIfCeZefL64jh/pOu37MTwbEVdJfoz3J6vx430aPCJ4c
	5kxK4M9+KQ9BcnU39vhYdQzL6OyzVm4/dyiJBh9bNK2KJFsaaGTuJfMxdLj1WeKDQ9PSzrcPQogcl
	NDj9LuybQQAQyjHXepAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPyaa-0000000Fs4F-3ZJe;
	Sun, 08 Nov 2026 08:49:24 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPyaX-0000000Fs3B-3JJY
	for linux-mediatek@lists.infradead.org;
	Sun, 08 Nov 2026 08:49:23 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-36a315ed211so47838eec.0
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Nov 2026 00:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794127760; x=1794732560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=qEl9anL7w2vR2ezxx3xDpYGl1rsoLrQ5w1PPkwkuHhGBB6bj90SBTeMyKZiTxPgxBC
         PisySOeOoK1z2jYk0J6mDHsAZzq0e107dzvdkxQR+4hmk5z4pL1pkpS8FmT3b2JwZnwN
         xypOWT7hbYoACdstrDv10ib4fih+dIIIFcexSS+sKv4coc2fGddv9wfkRkzRuN4O0M9R
         M6whRKK89swYjx5NFbjQuVcTWCXjhantzboH2kTST5kzBcVBLDbhW6Gh29ULjS7HrQss
         17RTgERiEUbyy7goXCzw+UYUhY5JKZCatVP6FRpY/4m+l+FTWOh8geZOGA0H4Ggn6ISE
         Pi8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794127760; x=1794732560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=sheah2Acba0YEcvQTa578TWI7GPfrLsTmJ5DJy6PtN7ETQ7FPS91i8/QqPepzGtHpz
         stlSJKD4h8V1ZoWTOv/iYfz7p/57rAohJNIG+l1kTKPrQAv+IjsN0k7dt2DSL+2yTrD3
         mRHqAzFhJlXRcgSu+Fp75wiTBaRGv+Hu8lhpXwCA1CgrVf8sL0zb4TRyKN6P9mXGexG+
         7do3b9Bj+Z956l0XXa5YSK5abhvETUMMHSqzFbRJncbRPrgutxfjOaDmxGYf1fkDYr0n
         jJH8UuSiz/j0pFmtYoEjS5zwLEy7y92tyAXdCmYU9LMVBVFeDw9KpHno9H794Ood1TU8
         a34w==
X-Forwarded-Encrypted: i=1; AL+hErF3UVOjVjzwMPYSRjx+Sgfpz9LpBTvy6rWLoh8CLuD+KGRr4gyskqMBa+DBA4OMPMxePEZe1hl9JdpHd9YhXQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8JuK+8cviZAVvyyFlf8YRdAV/cfKI9ifS5tr4XIG7aCHHqvHMU
	HwtAJ6n8IJ0zUcamTETobYKu7A2PadegwyATuL998mGdRQVMi5e1fsga
X-Gm-Gg: AYBFou0qPXZtM3akVALHnOhZ88amJbN7D76gAZny+KWTwzSOBieMssUrYxYjMApK7jM
	MZUtNluUvOVZgvwvjQugjm3vShCv1/jEbZudGAqXhLtWbN0CkhmEdJkIbXVgRt8QSoOjHRLFhpS
	mDFIXdIMIIDlKd600aM5Gs6WG9tNqhVyTBrOBPDYQY6XLx9o7C/AGbAUFpK9EpPN5LeB3r3ZEQ+
	9MYpKxxTYIfeMOAVj+l9udRH1KOrixefuwMbW3olEKza/d9X8egmCCV1+57liip0V22vX8ghTOq
	0sdEAkSc/viUDwHEEL962oVy+wUzwSE9Tg4gV98XZSLXrYyJpTlNlqF8+JVHgU3aKMmKKXrBFjX
	/M1D9lJ33LFvvmviSyKPXNCWV2fbEgFT++mIK22MP3cWugu8g+dt4fFahccsjZp3zXP4GcBM5Ei
	PdiPBDsnzI8LULQk2Uqlzx5GFabsl8BNgYuhJMTE4tSofl66juMhwuBlG5V4IFevmNGulWGfva0
	SKVcmA5DHffoQuAq4e9ezzUixmjm7CcVnA3+yRk8w5E1+QiVOxYKXAw9U8BYpGNrVh9wnntFN2D
	3UbWNDMFgk2hxvd/jubFqej+OpBuUERDjPNBsoAtGnwX7gD2m4o=
X-Received: by 2002:a05:693c:20cd:20b0:364:377c:cabe with SMTP id 5a478bee46e88-370f8170360mr5884840eec.24.1794127760230;
        Sun, 08 Nov 2026 00:49:20 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.80])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d6088sm4445529eec.25.2026.11.08.00.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 00:49:19 -0800 (PST)
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
Subject: Re: [PATCH v6] PCI: mediatek: Fix integer truncation and handle oversized resources
Date: Sun,  8 Nov 2026 08:48:21 +0000
Message-ID: <20261108084821.2827-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179389361906.20463.1092137538074974205.b4-ty@b4>
References: <179389361906.20463.1092137538074974205.b4-ty@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_004921_829182_8EBF47D2 
X-CRM114-Status: UNSURE (   5.27  )
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

