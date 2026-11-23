Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230FD606A31A
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 06:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=itkTziJW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Rn0lInkE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B4or4yeY8OHZRKSj5APXjf36hThUdnZ1Yx/De8GBlX4=; b=itkTziJWdnJJCwxJSMvDZf4t9E
	AT+LKUcNJfoyf80Br2BaF4S6UCpkPVJS9PgbK0+kW2ce36CbA9ucVDNOk1QG6BO+7lCgX10PZuCI6
	0T5De6cE3gIU3U1se71lJOmd1DYD3P67AZ/nfcEeYoAE3h7r7PEtgUii0wi5p0ih8wWSPxk07HlIn
	qOCRhIR23WM736YSWAS41h1z1iyU8XvfTj2PunNfhKXE4YHVc3QWnxHx52RoOSf3iRAYI+Z18Xo2f
	quXWDzau3symrVBrL05pbr5nRySyJrAmD40F0D0ps/YCsQIDpGkV6GMHKtLxhf25+qsd9CSM22j2z
	3zrVOoZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO0d-00000002Pav-3bVx;
	Mon, 23 Nov 2026 06:58:39 +0000
Received: from mail-dy1-x1345.google.com ([2607:f8b0:4864:20::1345])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO0A-00000002PVw-0Qvy
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 06:58:24 +0000
Received: by mail-dy1-x1345.google.com with SMTP id 5a478bee46e88-386b8624cf7so207732eec.1
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Nov 2026 22:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795417086; x=1796021886; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B4or4yeY8OHZRKSj5APXjf36hThUdnZ1Yx/De8GBlX4=;
        b=Rn0lInkE5FpEBDIWbMoT7Smg6ChrklLmh73X58fsa+Jz86hBIklxuGqY23lEly+Srn
         63/duwJiQXYDeynSRq6AtUZJhM1D0NbA6yYA4C1liWvmuPQNAtmNbxINyQ1C3tBslfuH
         7TiXqpV6UpV3IGBs8WGp23zHl8d3OuxSLNMgzxW1BGgpb6POISL2TRKrcoZHiLsIGtgo
         jq7ZhUE9xcqlDP8V3fhZZaKQ8AhV2f/M9NT5+BUmpTm83wvMv6IQFG6p3F4lBMl9Es0/
         uUekihARVAFVZQ1sDvzsUo3OAnRPIE8bzES0E2hdDJ5qt0XH5STLUuUzYCGM+bRaHafw
         YCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417086; x=1796021886;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B4or4yeY8OHZRKSj5APXjf36hThUdnZ1Yx/De8GBlX4=;
        b=DEGsFeOIMD3m6pH+QRR+DZ4iC/mwLzrbVnYJ4ngI7kBedje2hvpYqFkwv8lBDuWQs8
         E6KHothpYmTf4IJwcKY2XYaqhow3hAoNLN2EaUYSlhL2BHCofi+VdXhxU+vPr/kQknB0
         eVaHBEWY/kBXBcT+FF5PpgmJTmer0TDTBHhc3Ji+z3CkIJRU1MaPNK2f9yB6AcpKuh6V
         QzE51y2WEvRErAxRI9cNi1FcEDyoFecj1MI+SgGxLQihvuyYKg13VQwZ2j/l1WcxEhGi
         1ULgYEqYvME8rwedg061MaifMY34vbM8mvv+m4+GhT99bh0QbhEi1nJbCaXS7lpnm9LQ
         YJTg==
X-Forwarded-Encrypted: i=1; AL+hErFd4zK9mJfrAhYjMx/rGlNBBNCXDSFUOIaf3e+jW+BX2LhTRFEEgNAfxchz/VMpK1MS8Cekrf6R8XC0jghoNA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8hQkQ90h6xBUy3CtkeTPJtqIp9U4fSLtf4efUMuTqhZI315cTA
	bpc6EESpbCCaxQqhVJos4GlABOT3RjYFrrADqoVSLg3G1wAJs7op9wlBEZ7Tiw9YuKJ0kk7qXqQ
	+nbETrWgUnw==
X-Received: from dybmw18.prod.google.com ([2002:a05:7300:cd92:b0:380:c63f:6b75])
 (user=yidilin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:f68e:b0:383:d3d1:f31e
 with SMTP id 5a478bee46e88-3856e94760dmr10863514eec.6.1795417085859; Sun, 22
 Nov 2026 22:58:05 -0800 (PST)
Date: Mon, 23 Nov 2026 14:58:01 +0800
In-Reply-To: <0964123eb95cd4a6516df05003f59f3cdb260d00.camel@mediatek.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <0964123eb95cd4a6516df05003f59f3cdb260d00.camel@mediatek.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123065802.322838-1-yidilin@google.com>
Subject: Re: [PATCH] drm/mediatek: dp: Wait for the complete AUX reply before
 reading it
From: Yidi Lin <yidilin@google.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_225810_594956_9A588833 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi CK,

Please don't apply this patch for now. It breaks AUX reads with one eDP
panel (CSOT MNB601LS1-6, EDID ID CSW 0x1106) on an MT8189 Chromebook:
the wait for AUX_RX_AUX_RECV_COMPLETE times out with the AUX RX PHY not
idle ("AUX Rx Aux hang, need SW reset"), so the EDID can't be read and
the panel falls back to conservative timings. The current code doesn't
hit this because it reads the RX FIFO as soon as the write pointer
moves.

I'm looking into what is different about this panel's replies, and will
either send a v2 that handles it or drop the patch.

Sorry for the noise, and thanks for the review.

Yidi

