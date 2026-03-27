Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDA110AB82D
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2026 00:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eM3czdkR0yxttHYmgsTZ/HXsvHpMNubNVykJRwRdhuE=; b=iz6lZDUJGPBMhmff7hem7LbGl5
	XkPjBF2k3S13K+bUA8HjwBeQljkmrVnOn7ATcBeJbSuLzsKGSlgrA5ajWEocROw3ZwKdydSaUXGFV
	qH6pBKdulOHm3i4aJLrkuf1ijynyCb8tz1hmAbo8OQ3b9Y4oTpCsp7NumZh2KYg9hRJOS2X+sTW8v
	q586aG52oBYIS9nhpBZfy5VH3dOA9ZJzYkb8EuZa70oRdbXEci4IfxRt51FgV7fNL5NMUf3gM0Pxl
	JLZQ5Y5KYqDdmGUbBRm7MFebd/AqqjsF7yfs4LSqxRSIjMHdQvvSlpIpktJsebp3YOoxNRK7Cu73a
	Z3oJT6Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5uz1-00000006RBM-2RMH;
	Fri, 27 Mar 2026 00:23:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5uyy-00000006RB1-0zug
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Mar 2026 00:23:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 683E043ACA
	for <linux-mediatek@lists.infradead.org>; Fri, 27 Mar 2026 00:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49C47C19424
	for <linux-mediatek@lists.infradead.org>; Fri, 27 Mar 2026 00:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774571003;
	bh=j7Nt31dFKaFsqumzsZqmv1ULny9RxvGi6/PdugPHf8A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PaFQqGjX1eFsZ1D99arFtVc8P858lwfiJf6V7kHdPTbRL192i/VAhoF+gDOnGtQod
	 jzmJ1sVKX3JdO0n8zBpolrOkLrQuH7uqyHKFwudOrdfFPMpmxYIk752Z1WAtTXpMoU
	 nivndNlgjc/pPmfntH73czCQT/+vgNIy6ytFZDURtW2H+HCom+rvhj7gdryozV/IBC
	 T16ZsDqMmpWVXiCk7GmlUWoIgBtf7eZ/seer02riTn3/YZLOLEjXpnDL8fd42wBzvu
	 iNmC0GN9usYVlXuqWnaOXsZ2v1hAbIKzUGHBlqDlq040HyO2+XiAK+eSXi8aSvSWz1
	 ILLJFCf1HIX7g==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59dea72099eso1906178e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Mar 2026 17:23:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWTHUKIcdUP/VWgvivZTDJKqbFMLOSbjVXZJAod4ePbskSDdvrwRCqsAXA6utSZ54d7C0beIlyM4f2qAHPdiA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7Y4Bp73wN4HIvrGCHEODHCbw6YOHLUe1FfTmFNqBOe/o+mNWd
	uDHcxuqQSVuFr8SGToC5a/JWAyyeY5N8iM8/45EYN+iobKNuntNndxQJMr6ptCRAA+VsPpMuJEn
	BA3XcIGlR3YGBuYPrCSh1zMfKRzti2Fg=
X-Received: by 2002:a05:6512:401e:b0:5a2:a8ab:ab57 with SMTP id
 2adb3069b0e04-5a2ab91ca08mr138533e87.23.1774571001632; Thu, 26 Mar 2026
 17:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260325043318.13298-1-sean.wang@kernel.org> <20260326170407.406431-1-lucid_duck@justthetip.ca>
In-Reply-To: <20260326170407.406431-1-lucid_duck@justthetip.ca>
From: Sean Wang <sean.wang@kernel.org>
Date: Thu, 26 Mar 2026 19:23:10 -0500
X-Gmail-Original-Message-ID: <CAGp9LzoCyu7Qh9m7qURgemwa9UObKrTbmTXfL54Jojv7S-FoBw@mail.gmail.com>
X-Gm-Features: AQROBzBQDOYHgObrcEwJLMytH3mvTj3OvwfZEabjO8J-Nyk1beiReUrH1rBGPG4
Message-ID: <CAGp9LzoCyu7Qh9m7qURgemwa9UObKrTbmTXfL54Jojv7S-FoBw@mail.gmail.com>
Subject: Re: [PATCH 1/3] wifi: mt76: connac: use a helper to cache txpower_cur
To: Lucid Duck <lucid_duck@justthetip.ca>
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, morrownr@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_172324_321299_B220B1AD 
X-CRM114-Status: GOOD (  15.08  )
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

Hi, Lucid

On Thu, Mar 26, 2026 at 12:04=E2=80=AFPM Lucid Duck <lucid_duck@justthetip.=
ca> wrote:
>
> Sean,
>
> Tested the full 3-patch series on MT7921AU. All three bands working
> correctly -- txpower reporting is fixed.
>
> Test environment:
>
>   Kernel:     6.19.8-200.fc43.x86_64 (Fedora 43)
>   Device:     MediaTek MT7921AU USB (0e8d:7961)
>   Firmware:   HW/SW 0x8a108a10, WM 20251223091148
>   AP:         Tri-band (2.4/5/6 GHz)
>   Regdomain:  CA (DFS-FCC), also tested US, JP, DE
>   Note:       Internet maintained via separate USB ethernet
>               adapter during WiFi testing
>
> Baseline (stock 6.19.8, pre-patch):
>
>   txpower 3.00 dBm on all bands
>
> Post-patch txpower:
>
>   2.4 GHz  ch 1   (2412 MHz, 20 MHz):   36.00 dBm
>   5 GHz    ch 100 (5500 MHz, 80 MHz):    26.00 dBm
>   6 GHz    ch 5   (5975 MHz, 80 MHz):    12.00 dBm
>
> All values match expected CA regulatory limits. Connectivity verified
> with 0% packet loss on every band.
>
> Stress testing (28 tests, 28 passed, 0 failed):
>
>   - Connect/disconnect: 10 cycles per band (30 total), txpower
>     correct and ping 0% loss on every cycle
>   - Band switching: 30 sequential hops (2.4 -> 5 -> 6 -> repeat),
>     txpower correct on every hop, ping 30/30
>   - Module reload: 15 full rmmod/insmod cycles of all mt76 modules,
>     txpower correct after every reload
>   - Throughput: 100-ping per band, 0% loss on all
>       2.4 GHz: avg 2.4 ms, max 23.6 ms
>       5 GHz:   avg 1.9 ms, max 8.0 ms
>       6 GHz:   avg 2.2 ms, max 3.3 ms
>   - Soak: 20-minute continuous test per band (60 min total),
>     txpower sampled every 30 seconds, never deviated
>       2.4 GHz: 40/40 samples at 36.00 dBm, slab delta -4 kB
>       5 GHz:   40/40 samples at 26.00 dBm, slab delta +16 kB
>       6 GHz:   40/40 samples at 12.00 dBm, slab delta -16 kB
>   - Memory: 50 connect/disconnect cycles, slab delta +64 kB
>     (negligible, no leak)
>   - Band-hop marathon: 200 random band hops, 200/200 pass,
>     ping 200/200 OK, completed in 1232 seconds
>   - Concurrent managed + monitor: txpower stable on all bands
>     with a monitor VIF present, ping 0% loss
>   - Regulatory domain switching: txpower correctly adjusts
>     per country on 5 GHz
>       CA: 26.00 dBm
>       US: 24.00 dBm
>       JP: 23.00 dBm
>       DE: 26.00 dBm
>
> Zero kernel warnings in dmesg throughout all testing.
>
> For context, I originally reported this bug and submitted a fix in
> January (v1 through v4 on linux-wireless, as Lucid Duck). Patches 1
> and 2 in this series address the same core issue -- capturing the rate
> power loop output and subtracting the path delta before caching
> txpower_cur. Patch 3 (the per-vif-link get_txpower callback) is a
> good addition that was not in my series.

Thanks a lot for the detailed testing and for confirming the fix on MT7921A=
U.

This was my mistake. Patches 1 and 2 do overlap with the core fix
direction from your January series, and I should have credited that
more clearly.

I=E2=80=99ll add a Co-developed-by tag for you in patches 1 and 2, along wi=
th
proper attribution in the next revision.

                  Sean
>
> Reported-by: Lucid Duck <lucid_duck@justthetip.ca>
> Tested-by: Lucid Duck <lucid_duck@justthetip.ca>

