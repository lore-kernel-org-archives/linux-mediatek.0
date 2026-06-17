Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6059CD98F0
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 12:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtZpg6+SNfqVKkCzu8nevfRevHrYlcFg9kiIrAq1Sj4=; b=kil+Y9NPStp4yckJ/yv8j1DSlo
	80QqXwOGTQx7I1qedMH9lHRAw9fD87nfNLKKurc5yJ+Aip77JgOjpuBj0xA+A4MJRC/c9peXvJZmB
	i/1wzGeokWqBi4Kzr4IoxvBdfhBZzynubMZ+9ObOpM1Tlw27OK1jFKQECUZMfzh0kIwvnJ5FGdjmH
	LKNW/m3wkyv05nJxWner5niyHq2zxiQHFaRmLCtAUw617wPn1ADTIB/MIcvVKDmUQ6J0W8JTNZB0o
	ffdv3SJwhANFveHwC80r6MYpfO6HUpWchHewRHYeNIYqVaHKDHSShAipUUwOiKYBfUfpuAvBoGdKV
	E0IS4d/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpdD-0000000HMUh-2mBp;
	Wed, 17 Jun 2026 12:44:35 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpdA-0000000HMTw-34gf
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 12:44:33 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-36b95eb4bb4so3546920a91.3
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 05:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781700272; x=1782305072; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtZpg6+SNfqVKkCzu8nevfRevHrYlcFg9kiIrAq1Sj4=;
        b=B0KVcj+nxG1LqVn8mJCEy56RSkjEKL8nHiHsom51Svo7zpucaZRrhBSa6jMuG3UtUX
         Q/a32y8v7Ti4fZFiDVtqf6Zxrb6B1vmaEaeautmZIUSYEfX6sWdRNqEAi2YyOabbgcrU
         qocwampiHZHTG//8HAcX1etvUj1zSe4+c+mxCXTLJ5LQLinIoCzEltA1uu3gSzolcb6H
         yB0udEZME2JBJ52b8wQ4WEgfeVy0i8DoeY5AqRg5MFiSPcxxiWYTvsZNpFlNAUDZNvtv
         TUBvI2RSz1wzlyQ+k+F6xGgdms7NNuVkEWNPNOx66pGM1FIjg3g8ou893XnAmWp7XRAs
         tQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781700272; x=1782305072;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qtZpg6+SNfqVKkCzu8nevfRevHrYlcFg9kiIrAq1Sj4=;
        b=LoGFbEO+SSUtUyCWGttu3Esh41yB+ImSFlsYph/3MwrFWH+THFwPh3b43NnF+m7prz
         oxYapNkZLZVj94I/KYDaoBnlvRIr45eA/ZXS2b7XWsvKoG1pKPQcRLTMMZ1vVuwjPTP4
         nzF3iuQoaag4YYXGBsv7V0cB5qiwyF68hOULCM4pGfcU9DGdyzRcb7lAZpq4cdE861Ni
         1pQEhgDJZpPPUZqrwWfCuR8JxJgOn14idtlcKDVcoHs9z+9UPwpKYFAXAD7oUmyqOgV2
         BD5Eosab+obj+OcG+peDi8Sa3VFuPgefZBl2DOhxoG3e/VCaXep6DAk2s8hGxt5wi+i7
         Wx7g==
X-Forwarded-Encrypted: i=1; AFNElJ/BWAXwOumeLCwXcnrnstbBnhB7oTbQ5mNgH5NOUXCIDTW77Ql+Ka+IZUGfcHdt8eRa0nhSMAi+4Wf1SUm7Nw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxkrwDSf95Fq4/P8k7MXECpvroZhWp1qjgUsbLBfMCjZOlgzpEC
	W/OtMhbr+MGjSseK4s/EnQPSTAVFO4k+3gixcoyoECVW8DH7YNDm4HTC
X-Gm-Gg: AfdE7clYxaEvbT66eMXCtZY2w2mq0RLMaNmvTK4kM8qwst5u4TtLtValGUycYz4k6/g
	ABztRe28YKyT35HhXN9JC7B/LYUO85dww97kMpWXO95gkrYvJRm4IxNHgPK+wDMpEXSuvvOEnGZ
	/NXZrCVmGpfprJED4TUUdEw/MooS3nOaquz0yN4RHboZ42N4gPhUeiAaTVmu6AfbGbKJxNwD4l3
	p8XZbWSx5aQKWxHmM57Cy6ae8GSwtibyQZoXjVxYTAgtYNshVLXZ/d9szbDrfL7vmF7OoeXc/FR
	4PfCx2G6DMkmcqowSJUjZWT0CP1I1fgxP8pJKvhmTzF97WoPxfO0n/t52GDIytdAYs8O5zen/Gq
	YNpC5F+VLjEa892eDOsGot3vWm5P+LTsEShXAiCBFvzNfad+SClW47xbIpMp2CCyNeaWwmvBqsI
	wygBFzd+Pn
X-Received: by 2002:a17:90a:7347:b0:36b:b4a1:2939 with SMTP id 98e67ed59e1d1-37c9366b4d2mr2876234a91.15.1781700271792;
        Wed, 17 Jun 2026 05:44:31 -0700 (PDT)
Received: from [127.0.1.1] ([58.240.122.156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521ae78csm5987071a91.4.2026.06.17.05.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 05:44:31 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org,
 edumazet@google.com, andrew+netdev@lunn.ch,
 angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] [net] net: airoha: Clean up RX queues in airoha_dev_stop
Date: Wed, 17 Jun 2026 20:44:26 +0800
Message-ID: <178170026659.2238511.17652659042899875248@gmail.com>
In-Reply-To: <178161160256.2165161.14322392784449633554@gmail.com>
References: <178161160256.2165161.14322392784449633554@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_054432_794101_F8AA5FF6 
X-CRM114-Status: UNSURE (   7.10  )
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

VGhhbmtzIFNpbW9uIGZvciBmb3J3YXJkaW5nIHRoZSBBSSByZXZpZXcuIEkndmUgcmV2aWV3ZWQg
YWxsIHRocmVlCmNvbmNlcm5zOgoKIzEgKE5BUEkgcmFjZSkgYW5kICMyIChSWCByZWZpbGwpIGFy
ZSB2YWxpZC4gIzIgaXMgdGhlIGRlY2lzaXZlCmlzc3VlOiBhaXJvaGFfZGV2X29wZW4oKSBoYXMg
bm8gUlggcmluZyByZWZpbGwsIHNvIGRyYWluaW5nIHRoZQpxdWV1ZXMgaW4gc3RvcCB3b3VsZCBj
YXVzZSBSWCBzdGFsbCBvbiBuZXh0IG9wZW4uIFRoaXMgYWxpZ25zIHdpdGgKTG9yZW56bydzIGVh
cmxpZXIgZmVlZGJhY2sg4oCUIFJYIHF1ZXVlcyBkb24ndCBuZWVkIGNsZWFudXAgaW4KZGV2X3N0
b3AoKS4gSSdsbCBkcm9wIHRoaXMgcGF0Y2guCgojMyAocS0+c2tiIGxlYWspIGlzIGEgcHJlLWV4
aXN0aW5nIGlzc3VlLCBub3QgaW50cm9kdWNlZCBieSB0aGlzCnBhdGNoLiBJdCBleGlzdHMgZXZl
biBpbiB0aGUgbW9kdWxlIHVubG9hZCBwYXRoCihhaXJvaGFfcWRtYV9jbGVhbnVwKCkpLiBATG9y
ZW56byDigJQgZG8geW91IHRoaW5rIHRoaXMgd2FycmFudHMgYQpmaXg/IEEgb25lLWxpbmVyIGlu
IGFpcm9oYV9xZG1hX2NsZWFudXBfcnhfcXVldWUoKSB3b3VsZCBjb3ZlciBib3RoCnBhdGhzLiBP
ciBpcyB0aGlzIHRvbyB1bmxpa2VseSB0byBtYXR0ZXIgaW4gcHJhY3RpY2U/Cg==

