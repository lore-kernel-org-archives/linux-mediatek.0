Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6F2EE645A
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Dec 2025 20:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VsMmsjULczenxpMYCebUbiZhoHlkwzGJJhQaJAbMaHs=; b=wv/3bEW+bLhKRNcXOAtSpAiF5D
	zAMDB5EN2Ytcxqu2eRQ2ZXxvaYyt1V+l3WezAMrrrkw6iIuoA+a2h2Dp8Q0/L+L2SA/Fpm+GaDSD5
	UoUVbyJ07ko2UDm6aCC03rfNrPlHGqzMI5YtHv6j4elxm3Hj94vb3c4q1ZXueVVlfIRQmutJ5N6ed
	4tEjZqgU+ZcEGSiCojlSzzxB5+w1sezvCDkmLE6qbgGpUi4FZq2NIoLuD10+E+jvLvhFBbspW5xsK
	eUrXLW7CMri1OR6bKwhQT/l8eK7jK7Vv+hJvVM2fRDRYbIUdC//rNvPPTMs25mwnZHBFWjfzrdjvf
	WdW4wi5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb2ZC-00000006IrQ-2WNv;
	Wed, 31 Dec 2025 20:13:10 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb2ZA-00000006Ir1-1hJu
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Dec 2025 20:13:09 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-34aa62f9e74so13963618a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Dec 2025 12:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767211987; x=1767816787; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VsMmsjULczenxpMYCebUbiZhoHlkwzGJJhQaJAbMaHs=;
        b=dq0VWG+ieJCpdHWci7nIN8In2+mhwahVtsHq4SFxq8V5kBKaCYuQTUiZ/DMs0YBNyA
         +gmklkBAVlLgXGmUyg47qbMBv0UYcfjXMPIotP9cHT10JnLBoXwb5UMRkXoWtpQAjEVk
         lGB+QGqbIilWc0gHtBnxhvWWdo4TJcX1vZJmga7WO6g8kDo6UHwGm/EuyCBcCn86v9+y
         M8V+LGndYjjEUx3bLwTMduYzv0lvxwKM1cST+dUra0hcj/Y73RpNm4PDD1W90FJ1bsLl
         CGgUS82zHipTdGh1UCGGwp6ljF5g8fnl77DARZw2mmlrKjpUhDmG9ECP5wCpPBUynFRI
         awYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767211987; x=1767816787;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VsMmsjULczenxpMYCebUbiZhoHlkwzGJJhQaJAbMaHs=;
        b=MLHH9RUlUbRqlcMRnzGbBXMzUApXwJeTJCFCY1eJKrkRwupbr0bFet80YbBeo+1Ac+
         07OhBGZDe4oDsoueDOxCTIoePV+nfD/6bpCQEySHn3ul+l9ra7/n7QcZBSfAGjnOUBAh
         wjUd7B+olDoZ7je4b1c5ZwdGNp1A+69SbtdzM1zYGF0txY/LVIoRdS1m3+EAXiNoCjLb
         +AYm2A2hlzDOQsZxKCkodl87V2J9uDChite8uH4W5yjlZ4LnjGozBnMUYAKoaZNaHHAJ
         VimXq3eYBlvfawWHpQ5OfghcCUr+Q0P8nQJGZgYyl9did9N+3X1GrQLkVzBkVJrhtD3b
         vpzA==
X-Gm-Message-State: AOJu0YwkdFZUbGtFwJcCGwAQII7R2lqMh+NLb6UnwgSty4fohcjbGQ27
	JuGzFGKfxnSsoyoG3vI7v+EaFg8c7py2ifbB4ZjAo6oVJ+KlpQZG7csTUu3wI2XP3zUqkpFZpsD
	tX9iF7eqPf9VAX5imYbCGumloM1M+9A==
X-Gm-Gg: AY/fxX7GLMx8n3He9oeQ6/nxbGBWp4mPMCyy4NV55yOnsxhx4+U6NnNiNhbGcIMJFkO
	pDPa1i17MrslLLz1KvMEL3jJZ/+Q6o9hMpL3MthZVccpYg21NzuQNkIJHQXVzXjPdKZCiDDQtK2
	EbhEaTknWYCu+ht3JI75menJJXP/zvjxqNpWvLMePy5a2Vl0z5tyrVwNOFcGoXR82Nea++SOf6p
	m4JS/8gAotnbVIAy5qFOM0BYjDXNVuqwBIjy+z6vr0b+eNvBxO9X8aQT7g3I03lC3GrQcu0oePK
	0iDD6a/fT2fhJpuTEhEgosYWTSVu/tpg4bBQkdnnv6P0I4sSfAi16eWjSY2ULyKr0o+ah/1zz/D
	3Hw/IqNSYxgsu
X-Google-Smtp-Source: AGHT+IGZVkrI1bkAGjHBjP1/6f0/vOPsrDZ0YHXv/ZpJ17I8pKin0GPgfbTc/m+KQ9dbV6U8et2gTojfzRhFws5I1PU=
X-Received: by 2002:a17:90b:37c3:b0:32b:65e6:ec48 with SMTP id
 98e67ed59e1d1-34e921222e4mr31708602a91.8.1767211987137; Wed, 31 Dec 2025
 12:13:07 -0800 (PST)
MIME-Version: 1.0
From: Steve Andrews <steveandrews2@gmail.com>
Date: Wed, 31 Dec 2025 14:12:31 -0600
X-Gm-Features: AQt7F2o7sA7olUEyiptoZj3CFYJr15DdfjNMI0Nx7bLgI9wRZNPPaXGbzfAGgRU
Message-ID: <CAD2w9es40oF2u_fZwgg2E5M26d4QkxrX2LEnFL+v81Hrz3ZsNg@mail.gmail.com>
Subject: [REGRESSION/REQUEST] MT7927 Wi-Fi 7 Support status on Kernel 6.18+
To: linux-wireless@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_121308_455452_B85C2530 
X-CRM114-Status: UNSURE (   3.99  )
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

I am running a MediaTek MT7927 (PCI ID [14c3:7927]) on Kernel
6.18.2-3-cachyos. The MT7925 is supported, but the 7927 remains
non-functional. Is there a timeline for the 320MHz AFC validation or
firmware release? I am an experienced Linux user (Arch/CachyOS) and I
am available to test experimental driver branches or firmware blobs if
you need validation data.

Regards,
Steve Andrews

