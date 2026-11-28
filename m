Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6DC606A324
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2026 15:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ArwCxD63;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WvHJCEKA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=boJHVtZaNd2Ip0sYxyQoGj4OCG9SDHvMT5R5+mkI9p4=; b=ArwCxD63GfK3W2
	GHQ52Cj8NXT6LV5Uu7WBJ0Ht/4K3Gb/EHElcJGPjKkzs/njjRRoSIHKoyBBuofWOqNVUYJ6UUZTaX
	bt9FACIoh34sWCglJJZQ8Nw37nAUwRNk7n2WYdMfdmrK1s2CppCWR2GXfpls2ZqGrPPdpYammT56a
	K20D6kcFFu3D8Lfw433wrOYM6ki6hZOYooOYIS5YYaH5BoWTm/OAqwUN2NL7ptVkF2cQkZDFQ4trM
	6/eUGrcajmiwa3MJxRtnrszxdX7X7QqmsQf4xu/bn83/G0nei8fQ0dpf2piPj2Xsi2q3g5XFFtfu3
	wjkXicJbXPHauX6WTRyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKBX-00000000uTf-0OMG;
	Sat, 28 Nov 2026 15:17:55 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKBU-00000000uT0-1z1T
	for linux-mediatek@lists.infradead.org;
	Sat, 28 Nov 2026 15:17:53 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2efddf749e5so37801145ad.1
        for <linux-mediatek@lists.infradead.org>; Sat, 28 Nov 2026 07:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795879072; x=1796483872; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=boJHVtZaNd2Ip0sYxyQoGj4OCG9SDHvMT5R5+mkI9p4=;
        b=WvHJCEKAvOJjl5MZ2obA6KP1BLk2w6fXI6Bp37p6AAWfelq8QcfYp2hliFzB5BunWS
         iVDt+jU+mEeBMTX/BmMV1zNvi7YUCRhjbUu5gHNPHaYEOKMM6Jqen8V76y6Cq3fVJxwy
         4g1RF1hDYW0PPdFpj3LM0qa1MQBdXXcXvsz+bAlLbWYdglDjOSQqJXxRWYZK5e+UfQh9
         sJAuBtc9KAWVOeOnbbO7dTt+rDehxwYNwgbZ/O6ndI5pPqYdr1vDe5NybkehJBkqpZoA
         H1DYEOwuU8cQ+h1qAaQkExpf8TSAoczjZev0B/ZLRxaPjgrnMuz450CdzfcLdkUG+9e8
         HgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795879072; x=1796483872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=boJHVtZaNd2Ip0sYxyQoGj4OCG9SDHvMT5R5+mkI9p4=;
        b=qr09ueQSrYUG2kSub1pRaUX/iHeAy72dgY9TPSTv/neAPAsA/yGHi725BhhIaFFAmx
         kPWXIFDU417a+0g09a7Nf5k0SQW7XYgaOQD1uAdzc4PZPiSj7YY2oJcz6rGR1cDj3S6A
         FEHWEhkw3g/Ccy/qg978EhXL6VP/8VvPy5ouyeAPsBVIPH03K4V1QvzyeuDcITrEQXFT
         v0W1G1S37vH6s8XopoU5mblmOEEZF7k8AMkHO3DNXDr2r328ROpyS5xUQQSFucj81JLo
         psw/Gb/pEHMyv5t6fH1FB4v6F1v06nPbBgHumaUAQYmRX4gqUTtw/E+2SRZf93xihjtn
         D9cg==
X-Forwarded-Encrypted: i=1; AL+hErGnSCIa7ha62HqG+0ddk6Aa4UdxJYpsTuIdEVFvya5VUz236Y1lqSK/QuYIiM6rhOah2EEAgBofu7pbR/aAXw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8TelrzHtEytJPpVuSy4N263fn9Fsu03A3EMrX1nXAkKJLkm96u
	GgcRbimskTuyYIZpSB05PaqsDjLXNaQ4XRzZrmLi9U1tnkDbN4mCOQmc
X-Gm-Gg: AZFdTZfm2SanyQRUS569+hoPPPUwTEsujdYg0n648fQ8k/bajuDmuA6pqM9tgs/9+v7
	Labf9HKqMNA8CCZGz+X7CPniw4ELwsxaiW4vOIBexYYmrOClodjyeVGA7sLP7riwyjrZkZgprqJ
	ew5mjs0wkvVdAZkr468wpNuFqIDhFcUEh7OhDJB8YIpRHIU3huFOif0wGC952pvzAjWDUS1Seo4
	I/y8FqYYLQpdHxMg1XcJjPJNJaDxBzVNfgpEQSyrwkihp2GMu+nVACu4aLZ5n2R6SKfQWZr7nfD
	tklpQ8E7QxcrVdFOGWqJbeozdTmlYcr3tp5+0H4c4M9nLoHEAapDNQKhYe5aR+vfBkm6UNBxyAc
	870aOv2ke8kO6fjbzml/ihzkVPxV/2NejqNUbjulx1mzoXdwrRsKj/IRdQzqJb5XhBUA0/Ux/+t
	2T/7ZeDs0f3Hcx7SWgzGV5hMa6a6yw8k4OvziDJd576WRmfZx4LBVXEI+uya4hnm8j6pDhNPYvm
	PuKytCzJ7pGaRPhSj5mHNQ7Vuld7fVwaIUBVB/MHQX4eMox1XwWOIzTkrpklmNCAsN7wNwqKEhs
	pUJBQloJjUVrd8Wi/k96jOnMpjxLaqh/++Sr4KKkBsGKn42YeQ1L/NOQCKZ5u2hZEK8cMjG6sBQ
	4O+QlSajQgA4fcJETEzXQO6TaI6pmArqeVBgrEDGTHz2V32y8
X-Received: by 2002:a17:903:244b:b0:2e5:457d:6c20 with SMTP id d9443c01a7336-2f031f7a49emr234013155ad.23.1795879071469;
        Sat, 28 Nov 2026 07:17:51 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:241f:982d:147f:bf76])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c6e50sm138078425ad.13.2026.11.28.07.17.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 07:17:50 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] arm64: dts: mediatek: Add MT8189 Skywalker based Tarkin Chromebook
Date: Sat, 28 Nov 2026 20:47:32 +0530
Message-ID: <20261128151743.17053-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <9ec63a02-b5bc-4053-a57e-73fd8d290531@sirena.org.uk>
References: <9ec63a02-b5bc-4053-a57e-73fd8d290531@sirena.org.uk>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_071752_510024_0FC22428 
X-CRM114-Status: UNSURE (   8.34  )
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

On Sat, Nov 28, 2026 at 02:39 PM UTC, Mark Brown wrote:
> This doesn't apply against current code, please check and resend.

Sorry about that, the dts patches depend on the Genio 520/720-EVK series
which is not merged yet. I have resent the SPI binding on its own with the
subject fixed, it applies to your tree now. The rest will go to the
MediaTek folks without you in Cc.

Thanks,
Aryan

