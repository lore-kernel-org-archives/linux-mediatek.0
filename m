Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9096C98321
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2026 14:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0I0TIKEyiasgHy1ngA6HhdOkD8Gr+np1P2q8hO6FMM=; b=UXDal2kqDtKvTZmdia+UaEr7/d
	MxY9R5e8v/MmvHCimrlnbKYIzUZLBkxP5hXMHqyWVF507APl8I06b2qYrfiU7D0wgs3xXpMVTrJHX
	bkxjnRPDjUKDNLH6WReEg6Bmp0gLXiqqk4jPFA3C1rM3ks2Icbv050vGmv0OPeeDZJb4zr9V7Xsu5
	HHVlBbYSlvdRjAkz/t2d2sHLzGoEvZAFq9T9P4nid5SrWlTyUGubhqLCs2knwpdrycjNW5SbkCtF1
	DgiD3Wm7Gno8bthgc7AMxhVLtquSLeiU+YAJHjTEbP8hM3vzRzWgPEiX3VcS5ifZ7DAcAQvg/9nAV
	h3dJgOhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6qP-0000000DZOP-1LHU;
	Fri, 25 Sep 2026 14:24:09 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6qN-0000000DZNj-0FNn
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Sep 2026 14:24:08 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2dd88a115ebso5089785ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Sep 2026 07:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790346246; x=1790951046; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E0I0TIKEyiasgHy1ngA6HhdOkD8Gr+np1P2q8hO6FMM=;
        b=Ho6cMfC7dhp1rQ+h4v+1olLNoJ85jIPyJ/YozX0QHy7ITvNxt99zo/1JjCdxN68ZsB
         QARZb/2VK7FyOKtn8hizpBUzenAxjTTKrK+SSLXwG+RQPf3o4MHz5spQDjcAmFUVuG7V
         9g+eJBgz1XQ67uiWFDOtvuKyZW0jRCPNZ5MOwAl7Gh/X7m20PQMet91qiyTphUgOEmnP
         +BWvv7Yol62H/OSr9e1/OVm/YnVZ5/a8cQqX4BVvbPeghfgK2hrFJXEEC6MLuuU0LAmg
         lc/i9CHMABXDHiSar6MqVa8Q1vUT+bNNrstWsZ6EuvJhxVmvnOL0fngfoeOBNPvm0uTt
         SQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790346246; x=1790951046;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0I0TIKEyiasgHy1ngA6HhdOkD8Gr+np1P2q8hO6FMM=;
        b=vspS+1HdYke/pPThwzld9Ry6RLY0VDsS1KKGpuOICBq0Ts65hQXHSzKo030cbSzqKi
         thSa1q9qGAi5kTns0IoeUInYoIdUOZ3FjIFi0U9maSTCOLoDLHIsZ0cRfgPvMcPW0ZiS
         Ya+vtxiPpf1cnhTNJTswr4uRRLvbrveE0kJ1vb7AvX+x2j07qvU6qqJyV9fCH0A5c7Iv
         yqzk226otHjdokHj/w3ngu3ijCAyxwkLM9BNsQHAH8iDjWl0erOT/WecPmaUda7EkeAZ
         pzjAdceArSGDrQgyRZudPMHHNl1RwtSu/UOCTbJHQToXnWRDLv0XvTRUYk9EmU4lDXr8
         VDKw==
X-Forwarded-Encrypted: i=1; AKwUvBzHIAEA4LZNFNg1pZYe7Dnf00OXzd0OvYGvI06e4wu+GdamTC3tyTg663skrNrY5l/q8PebOeLKoSwUTCVX3w==@lists.infradead.org
X-Gm-Message-State: AFuF++lGb1OhUw5cYqC3J0YjUZ4/4m9xqOKnpA+0kJf5vhUCY31kyEXJ
	U/TOAXxlaBaw1pziYuPOZ3VM9Xd8QxiXF1+0ZGHVOiiQ42TotmYj1GfE
X-Gm-Gg: AYBFou0bfBIa4WLYWD4wU7PdhbetLtfEWkToupRc/sF/1tp6twSCi4ZU4TPn69qNLOr
	tDGzspEEzy71l/pTbx5oX5A8nCKCX5Um4fQZuofBSDhQt80OUOhPeyy4eOUMOYu8+IoYLpiJer5
	y2miT0IHbH2/sMu2QVLbah07Kpbl8vpxcMBzVfqHM17ENOOJ3aA6qUGKeU9bZfbCrt9QXY6vtRN
	Ltk6jAyD1DflE+g1woFqsulAni5jVmDh42LODTyfkEn595k7GjZ1BBvThlWLeUfXCmTVaq+lTyE
	wGQ1UlBKeqLRglBnnCs3sio6JJfJfh3jP8Uw9mnnj32VLcN5Zvex3lfGrurAHALQVjssQLx8PfT
	WV82gFaAJMSA+a/KR4aTbh1QAujDBzv304VKUpzpnkrvl+ZMu+coeaTQu4Y2Eqp/7A8KSYnJGJQ
	gaMWlXDDwwVwNZsAGyHnQ8Yyi70/iw2lF30NADdwjP4MUJJtLEKBx+PqvfeE2xPOgyJEXtNkjX/
	XlYEv81eI1H
X-Received: by 2002:a17:902:d481:b0:2dd:b83b:fe1e with SMTP id d9443c01a7336-2df7de9309fmr49802315ad.22.1790346241220;
        Fri, 25 Sep 2026 07:24:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913e032bsm11754115ad.27.2026.09.25.07.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:24:00 -0700 (PDT)
Date: Fri, 25 Sep 2026 07:23:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"freddy.hsin" <freddy.hsin@mediatek.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] watchdog: mediatek: Apply the driver's mode to a
 watchdog left running
Message-ID: <559c625b-8191-439b-b613-d35afe24c4b1@roeck-us.net>
References: <20260923-rbrue-suez-upstreaming-mtk-wdt-dual-mode-v1-1-0970852315e4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-rbrue-suez-upstreaming-mtk-wdt-dual-mode-v1-1-0970852315e4@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_072407_157349_0F7AC3AF 
X-CRM114-Status: GOOD (  12.51  )
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

On Wed, Sep 23, 2026 at 10:10:41PM -0500, Ryan Brue wrote:
> When the bootloader leaves the watchdog enabled, probe only marks it
> running and sets the timeout, so WDT_MODE keeps whatever the bootloader
> wrote. The Amazon Fire HD 10 (2017) bootloader leaves dual mode with the
> bark IRQ enabled, and no pretimeout is configured, so each timeout only
> raises the IRQ and restarts the count: with the 20 s timeout systemd
> sets, a hung system was reset after 37.95-39.76 s, and after 18.25-20.92 s
> once IRQ_EN was cleared by hand.
> 
> Program the mode as mtk_wdt_start() does, which also applies
> mediatek,disable-extrst and mediatek,reset-by-toprgu to a running
> watchdog; read those two properties first.
> 
> Fixes: bbece05c0d3a ("watchdog: mtk_wdt: Remove mtk_wdt_stop() in probe() to prevent the system freeze and it doesn't reboot by watchdog problem")
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> ---

Applied.

Thanks,
Guenter

