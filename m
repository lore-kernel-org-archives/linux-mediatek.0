Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C30606A31B
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2026 13:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4khlxF7R;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=VaLGlG5u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30kfx+f5OMbhpYMMm98MeKilykOWKFy2lcIJ5DpS4GQ=; b=4khlxF7Rat7qyVbLplV+DqmXNS
	E9qeBZnIoHb9+KqqAjYnnQFOuL08rzx3YbCEBaS1iCzpq12AMJzSeYRMl1rad26z7QLQ8g+2ckGpJ
	y9hi7uvci0Rziv5zgrJURlKBuxHmogr7OSSOIt5Lb156hus/HReA4IKdS/eo6Qk6U/aq6SVrsik3J
	oK4cW/n9gsh8ch1B0sTI4enRY2owZhOmboi+Vmz258ku5bo2S6USreZeD2AE74mSIu3Xwkrm3EgcY
	57U5eyPZKEmdk81NntnJkFqhb5Wdf3Q/6XRJJ+hs5hpqOE5zp+TkW9WIZwImC1nxSN4Y+AZQ0g6U7
	+xPAYxTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWG6-0000000BtNJ-1Na4;
	Wed, 21 Oct 2026 13:21:34 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWG3-0000000BtMG-1m7f
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Oct 2026 13:21:33 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso5919575e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Oct 2026 06:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792588888; x=1793193688; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30kfx+f5OMbhpYMMm98MeKilykOWKFy2lcIJ5DpS4GQ=;
        b=VaLGlG5uDeRGgaelcq4IywadSGQGNIMb4iXDgEBLFWZgMMf3jgQf9Z6lmnVBypTFjT
         Kg00JL6hpZpVQkt9Y6ZJbwnuEhDweACgA81KLvsZ2BnOD1Qc0P7/QqE1l2IBbu4lOc4p
         fahnnJs667zKD7Q6KOmvbX1prGtjED/boC30Zvq4EXPNdKoft5C4P84eGsRuqbP6CYeo
         VxBtICZktUSb6+FWGXPa5YpGQZ0+tb5xN3tqBREGjCQC/R69qi8BoEHtacFE1/RYIW/N
         9S0MKtidn5olYTFZv5xGB128kIW1OdtflOGiaQTEM8piTbt6VTTddXvobKyq37NpAwRt
         bLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588888; x=1793193688;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=30kfx+f5OMbhpYMMm98MeKilykOWKFy2lcIJ5DpS4GQ=;
        b=2Dl5oy1deJtlgZP3I6QjicnfpgALz4BC3nSv3wl8TnshZ16h/MvzOLq8wSck46o/9h
         UGmNio7Bvw9Sw/WS5soaoMecclty8KwTqqZ6idQ4AhYYQPUpASIdUZjnKC6YWZYRvApY
         rUYEFgmxfgmZgW58I//Wz+xSQWuWtr2Q9cnHT2/yst0FTawGbtcro0tTFeiPBPMwKTjq
         uhhHN6VMxsw/eeB6wh3IoTCUMzYpr0uqNGHNXsfRDnQLGynqevIcDEbHNWgqCQExbc+5
         TjAuNMLBlA2bUcAnrissXsVsLBzT8n9/cphtxOwdug2wBCnG/WBh/PndDiflMZAr5m/H
         jqhw==
X-Forwarded-Encrypted: i=1; AKwUvBxh+1e8cw6KNcdOmTmoG6KG9tE2oeBuFfLvlIGhSV03N22C1xC1nJZptSYNyLSYcQ8QRQQ2YXvBiV+XpKZrYQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ4oBScTAiQN+zPLF9zhoCFbkFiLWTAJO4VsGp+gaez3XcgHN6Y
	mr6bmvRsabDEfWY2cJsR79t8dxQOEwgJ5gFY8RW+QrasYtVBYuKArVuoL1otpkzMhao=
X-Gm-Gg: AYBFou2bUMj5Dck5cxIphNAiXafGezDHL+0ORhQ5VYjrLLx4jKYjPCrfIfl+KXQ7iXX
	Wp2NW9Cqg1JEd4w/1oTfB+GuRhCO/F7BawDCs0kOD8N6+gCRGdXOltWyiDCkiO3Xr/xDXwDLWz9
	PR4OXv0CV1GGC4SHo8XqU6qBlR3tPE3bj+xf5f3WyjghGRd35UlKpCk5Cfh/EbXorXG7TI9HdAE
	xQ88yXNzEYv16LJs32D8MOTdpeKbFgRM8GO2dM6XFvXmqssZwYDjU9wO4S6tRyLNnuri2lmB5eS
	d/vEjYMWCb1mbMD23mRGREZ0JwvwkSubPwaJMBkFymXrODcT8pUyjbFNnA1BftFkUI5DwVX41Dv
	khDcJWUTKrB7vH7xf8t0vLX9Yrd5Ok2lMBlZhU+dCIAkD6fzAQcpMhbDllj8tLSoLbfhAREyykk
	MwKTFej57vG3vP8O3Skb9sHAXAKymDtkU5s6J7fcabFaZqa/FBlgC8u9q5HHqSBrvmiz5sQCU9F
	N3gyEHctQKGkAXuXABy29N7GowR6SPEczqa//NW9H6aB+x+piSZPFBYqwKXDzZbDuMJw00I3Po=
X-Received: by 2002:a05:600c:6097:b0:4a1:d456:ddc8 with SMTP id 5b1f17b1804b1-4a1fdaef8b0mr39864365e9.7.1792588888044;
        Wed, 21 Oct 2026 06:21:28 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm112679735e9.5.2026.10.21.06.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:21:25 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ryan Brue <ryanbrue.dev@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: mediatek: mt6795: fix the FHCTL DDS mask width
In-Reply-To: <e8389c1c-e858-4171-adff-5bd94909120c@gmail.com>
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
 <20260912-mt8173-fix-dds-mask-width-v1-2-3d0c0292c85c@gmail.com>
 <88272aca-2a9e-4a75-b7f2-4f7aac8b6d18@collabora.com>
 <1j33ux8of7.fsf@starbuckisacylon.baylibre.com>
 <12e0953c-5181-45f2-b409-05163ab2a031@collabora.com>
 <e8389c1c-e858-4171-adff-5bd94909120c@gmail.com>
Date: Wed, 21 Oct 2026 15:21:24 +0200
Message-ID: <1jy0brgpez.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_062131_762286_F7F7AC8B 
X-CRM114-Status: GOOD (  12.80  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On sam. 17 oct. 2026 at 18:03, Ryan Brue <ryanbrue.dev@gmail.com> wrote:

> On 9/28/26 7:22 AM, AngeloGioacchino Del Regno wrote:
>>
>> Please collect the changes that I've reviewed for this cycle... I'll 
>> start
>> sending PRs from the next one.
>>
>> Thanks!
>>
>> Cheers,
>> Angelo
>
> Hi Brian, Jerome, and Stephen,
>
> Gentle ping, in case these slipped through the collection Angelo asked 
> for above: this two-patch series (FHCTL DDS mask width, mt8173 and 
> mt6795) and the related mt8173-mfgtop fix [1], both reviewed by Angelo 
> on 14 Sep. Neither is in clk-next yet, and both still apply cleanly to 
> it. If it's too late for this cycle, just let me know, and I'll ask 
> Angelo to take them in his PR for the next one.

Hi Ryan,

If you do not see it in the clk-next now, it means we missed it and it
too late for this cycle, sorry.

>
> [1] 
> https://lore.kernel.org/all/20260913-mfgtop-no-clk-api-power-on-v2-1-b84771a3d5bd@gmail.com/
>
>
> Best regards,
> Ryan Brue

-- 
Jerome

