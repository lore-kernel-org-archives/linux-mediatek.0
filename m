Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED90606A319
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2026 10:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=flzevda/;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j8rmS0Bg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0O8KxR/u4jNMtz6RpoxRSfPGCbbGOO4Hji6U7RyM5SY=; b=flzevda/FLRgDRwYmOKFHlrbmH
	7TNGAAAi8JM9AYdlboBPsAnG6w296RwZ16/fPU7nZm6Ua+kgQLBVrc/ddWqZYqaNYeDIbwcpu2Vog
	/JI7qRXo76oNGlW6WHpjpX9pigoyYwsSjw2Qoio3OW70Mzp4DeW3rCoOyqmHNBGf6FDD6Hr7gviIe
	yn2HMQeMpAMJDZwuQbNSBu7/phi0VPQc6wg3xcb0+A/qsjMjX0sU3kOeZ3l9vXbrEe4XTpyUo4aZ8
	COhyIyszfy3lqmFgONBcFxJjNLEn32mMnoQL1gk0KpdjiQPM6bKaeoHYXEc9Qnckdhs3LWXucgZS/
	H7SuEaLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTQx-0000000BakY-1GfF;
	Wed, 21 Oct 2026 10:20:35 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTQu-0000000Baja-1gjD
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Oct 2026 10:20:33 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6aa8d04fcddso1208165a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Oct 2026 03:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792578030; cv=none;
        d=google.com; s=arc-20260327;
        b=dx+TKKXau7IMd8UnWLqa+QRDZIW/DYjgnCMG3oR9qwToMr5yPUxtSE6DpG4pja2gNL
         tss6KK4qCduyClkk01O7RJw8bEn5KgAYo0MhCA7gBoYptik4ddKy1nDh86VbO9ziJBUE
         Nv8hNQtWX7lsiVfRMavNhF1N5wZGE3r1bHQRlf/g0zXj2WGJ5Ls75r4mFj1nmLRGydOw
         yydvLbowEFSPM72dlR64qpOt5xW5sUsB2iH9V9TFBTDwW27Tl/pBvANdBeLtAUnLnx+W
         JD6PMVWAkBmU9RfifduGYMAdqOageGgQm7OxGTrV9sYS0YoMkyRNp+QG+bwkPTJPiYPp
         BFSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0O8KxR/u4jNMtz6RpoxRSfPGCbbGOO4Hji6U7RyM5SY=;
        fh=3QmKAGgipgn45z7m/UF1m1ApIjr5wKNYVLBuYDSF72E=;
        b=sCH3vO/hmb9RKWqijnN+ofOIz9IC76st/qi6I/SimPt2F2VJshbkEUYPuu6bY40A3k
         ooc/Qf0/svFVHZL5963WvskwMAKsl6RPbhcrWxI7CIp2akk5hfKxcRULVd2VPswAPb9C
         dv+N6p6oVeRluibnBHxQiAKrkEQzwU1v9+yP2TtMKRWzQtvMZxaNcS64ycEdz7bTPAht
         oD2Qk38jSEdsRy1jbrup5dwXniRe2JPihc3SK/wON5Ng7Z1ogh15+9XMViGsJ+2cM5KB
         oC+se5LqaZAm260pozDmVHv//DfXHTX5yR6sYGVWcptfwSuyQ2qyOrDe3x6JhUyUeoJW
         26zA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792578030; x=1793182830; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0O8KxR/u4jNMtz6RpoxRSfPGCbbGOO4Hji6U7RyM5SY=;
        b=j8rmS0BgKJCJGXcxvwRkux6jd0rijBZm93DnTFrPNW/WVjqdnLKPj2HRxiIcqlIMwk
         y/7SybL7fXlH3bqWjnNLHuIsdi3aGQc/d3LjQ8xaHjw7Q4FBXV1NM0x/2U7HYUmNq2vt
         QXiQKuPoJWF8/6a6JJvbzUE2FUScbXqaIU4eAkbSOdBS2mgzZqrrWqaPboTtHX2tonL5
         JC91D2T0xhrWw3u/uARlSodc711+WVi6qBg8kZWv7b+LyZMGzPOu5N0e3Zq9eYnkTpyn
         +joGw6lpKq+ZVWALu0aRWMjfwueOBBHm/H6Llz8oHBv5FvLRFOnon0yOCSWLwgNPQoU7
         b8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578030; x=1793182830;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0O8KxR/u4jNMtz6RpoxRSfPGCbbGOO4Hji6U7RyM5SY=;
        b=rsN1lTrzIjT359A73XQ4Z+5ItRRsmcv5ZecUWDsKcY2OI+UbPCnmx8h5a8nw0jPuyu
         Iw1AnrYvKblvNHO/L11IrMwkXAP3vESNYSRR781BdBkyq27c7hyoo+ETfiHkho6S9xUd
         Rd5MNBGJ5nwuLJ0UJNL3tc8atmlWsKTU7YefqU0Z4mEMk3ZJDR9rYhJoQuAMq7Q2Ap9F
         PqIBOfnYN+QyeKlBcM7PXnknBSr8FjrDWRReUiq5h8PkuBrfp1dpiFtUkTft3blM6xjp
         +lxWKWyULr+RQ3txWOCFe8prTP4TsBaK2ajBX11TDKj4JULwMKBAhaHc1IpnJaIvMhiK
         DX0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwlouhki1tdcjxqHqdlWGatn07/uTP/h3X21CGWm85V6rElR37PtAd4ufcHfRUTBgcJXxAF0PlyMM8SFLx4mQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIX/Fw8yiNiR/cCprkTFmEoz4MNyWGrQT4BTuxtpfZbkszXsHpW
	916JCsBLXQ7v3+rUHd49ZSbjKstt0Ai/Lr3njWsjZqoMKy0oBAP4koJ13qSuAHcFJLX5g+l9K85
	1IGITbfmT2quXiLEvr1W1r3LoBCNsJrJ62l4bxo0=
X-Gm-Gg: AYBFou3LRBNWr/NJdpqP7r2MJL3lM28IINqg6ZoUXUi7jkI6b6E4bNAb1jWisJif0iX
	TbjXX2wzm6/BmZqFMe23M6y8OmkTToidBDYr85Y/25HKBQJZzhMR10Ksf6ZOYcvhBJMddCykugU
	plUk5eef1KK96E3u/gozY1ODiOdoTz8bI5H1IvGYVDBy4MpABZnqwRACTk3V6BgUx4WN0iUU1U7
	q8YoK7WHEnRqBmA4qMHp7QItS+MADKo/CNblcrORnT+MkBmT8vIoEtcZqjux+Zymz1U4cba87eA
	5rhcTwnLrOvfqfH5ifP+BGEdDRyZCZBA5JKFJ/x9tABcUfoFtb9TaazsfdiV47BUPe+mdkcUM5V
	U4OWBw3zZb8Sa5M94YJ2F0NNxJwhBHqy8HsMd
X-Received: by 2002:a05:6402:1ed6:b0:6b3:afe6:4fc1 with SMTP id
 4fb4d7f45d1cf-6b408dc32e0mr1130962a12.2.1792578030234; Wed, 21 Oct 2026
 03:20:30 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921102522.1640072-4-akkun11.open@gmail.com> <20261021094542.59417-1-l.scorcia@gmail.com>
In-Reply-To: <20261021094542.59417-1-l.scorcia@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 21 Oct 2026 12:20:18 +0200
X-Gm-Features: AclHuK_9WSUvbl7lxj9ijaAvYmNx-kmxqZkezsuL4zt-K3i_hWfIEDEOQ1AATPQ
Message-ID: <CAORyz2JODezexX2ZGwDk8LcBbFA+Jm0hRBAamJ7Nmk7Q+a4R1A@mail.gmail.com>
Subject: Re: [PATCH 3/6] clk: mediatek: Reserve missing MT8167 clock ID
To: akkun11.open@gmail.com
Cc: angelogioacchino.delregno@collabora.com, bhelgaas@google.com, 
	bmasney+clk@redhat.com, dakr@kernel.org, jbrunet+clk@baylibre.com, 
	laura.nao@collabora.com, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, 
	nicolas.frattaroli@collabora.com, o-takashi@sakamocchi.jp, sboyd@kernel.org, 
	sjoerd@collabora.com, u.kleine-koenig@baylibre.com, wenst@chromium.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_032032_456360_4A7BF0CB 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.4 (/)
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I apologize, I just noticed that your patch adds the "_dummy" suffix
to the clock name. I had originally applied your change manually using
the DTS clock name "hdmtx_dig_cts", that's why I experienced that
error, but when using the name as you sent it it actually works fine;
the additional dummy clock does not interfere with the one provided by
the HDMI PHY.
I apologize for the confusion, but at least I can provide a tested tag :-)

Tested-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

