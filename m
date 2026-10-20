Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F86606A322
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2026 01:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SbYvqmtc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=spIguJxe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWPo6Ih0/scjWj9tcKOojGIcqQqtvEcjo0ZHZ/nTgDU=; b=SbYvqmtcpRHSksl06U1Wk3O4/G
	C8dtm9rUoIvEKqLJfArJrxPYRhyZJw30IA3yf+kMva8RZcQikQ0A12vqZQSViyuXXn37ny0cUwSuU
	dm05HwFMBri4BhBfnwp8/Pw5+dy9Pv6N1czZAu193hEKNfd9CVv0wT18pTIIbfrYxv6R1iXt08ozg
	00O9e1ZJcwJeJvU8cAtMd0RkUNsCCjZ/Vhz47H7n2mkqrn5dn3+NAoRiMs/m2rv35E1oGwP9eQLol
	hKtVpx2YfJFZ9A8vyYgn6gDqfMFuoCpNszij6ujBa18JNqQa5lkA2sHvUTRDwsC2ev+bS4RB50bCk
	+28dMbSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyu3-00000008e0T-09Yj;
	Tue, 20 Oct 2026 01:44:35 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyu0-00000008dzO-3nkW
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Oct 2026 01:44:33 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-35f1f76ea84so4979482eec.1
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Oct 2026 18:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460672; x=1793065472; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qWPo6Ih0/scjWj9tcKOojGIcqQqtvEcjo0ZHZ/nTgDU=;
        b=spIguJxe0C86H/jqBh6byu0jm649V/a4A+L7g3MtYAF11iLAL9VPFZIF49wkI4vmqJ
         JoXEzpj/EyzUiWlYYS7db+gYyic/Jj2rMU45h17t5IwsjdP/9AOHoshSRJ3fWcEEMBZx
         83zbUc81lZHlmeix0EPWm8PbXP1aDlPlkvBvdEGrfmSyLbmJtd5PjKyjjZkPSmApfNgy
         Cgp0fC1WsMxgnlKbQMACAftSLrOKnHD7XSqFQNy9qMstmNGisXYAhdT5++R4nUgpz40j
         fFK27i72v6PhxNnmgvCtYxgm4kto4geMj54vCW0sy7E/yIGM9EWGYjD9/J/tA+1ITDOM
         AufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460672; x=1793065472;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qWPo6Ih0/scjWj9tcKOojGIcqQqtvEcjo0ZHZ/nTgDU=;
        b=L0Ky5f1NfJKonlesYNbld6x5uMto5Ph79Sr7trU2LH6XyTB9bIjvaLPPTkr0sZz+lF
         syrn/h4PJaiheEVLY8y9ThXtLrktKV7zvzSK5wQyBiqQVBmmfnlj1rn5DNM7DX0MvMWM
         Ub7iIuGTlyJsRFIF6Bp261nh5YEmp4kC2Uj78gGR+lrOCdA/LQqpaIwk7Muv7LvWgq67
         ridYl9lkW38SBV9O9BgqPtWAwsfZd9dMSx9e+rDnoYSadkjFQh9xZTrP+zD5ZgPiCT/b
         c/5ZjqmGPlvE3hXkm1Yj973igd5UwZXR0E19zb0KJ4RBiZCiKT7r5MV/zf0foDps7lkH
         x8aQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPG0GVYNNe4/qjkHj4Cje31xmzTBVqKHP7fPIdRCop5GUu7jTHlUmEIJqAFw/HVFtxORP2j3mDdpeKdftlug==@lists.infradead.org
X-Gm-Message-State: AFq9FYJADJCEGhuLw1HBv+Njn0bDRLfWk5EY+YcpynorrHkjKOcS93JW
	hRG3BDozPedZU8oD2YWFlv1RkSFFAXscxYthOVqJspH8Cd9YuKIvuz5j
X-Gm-Gg: AYBFou1lHlKeW/j82m7V/3GxRbq+yjnaC2A6Lyi2w4cZ4bHI8n5bwzTTHRnGzOynJve
	9AxxMgqnHjJis53P2BA9d5J69qa622aT+MRF4G2rNmbRYCAen6UGk6AaDIn2+V2yL+1kPUA8uoU
	X4AIcS+AT2+fwB4BeHS4ukklt3NxGUb/BHyOxhZlmQkpERwG0HJSxGD9wZQWfhiIJ90GBd7Occp
	Si1WOBqGuoD+O1SN8tYPItseertuGZ2SgngOK72/4fvgz8dBJheT46Bqxjh8ZslX8jSfRZaG2RP
	sO55DX5TM3L364Gs5TFntlQpnYm+6e0lq8u/5iGKnkYSpO5/RLU7VdAb2wbXXzCeZXmXqGrEoN8
	qq/e/9jg3IXEny05VSpx0NW/r2Sp433JMeBoxeuwQH8WJ7PPcMgt2JsJ4+ASk2rrdKHN7JEhRbo
	4mz/8BDZxFZEwTH44DAKf6nstds3XlIVkT34w7XQsWTzLA6e68bU22ftxTKiUW2/h7Lshh29G1K
	SxDAt7hKxR3
X-Received: by 2002:a05:7022:ea47:20b0:143:2719:566e with SMTP id a92af1059eb24-18515a66a98mr13183669c88.42.1792460671660;
        Mon, 19 Oct 2026 18:44:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm37657407c88.0.2026.10.19.18.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:44:31 -0700 (PDT)
Date: Mon, 19 Oct 2026 18:44:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: zoan37 <agentzoan@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Freddy Hsin <freddy.hsin@mediatek.com>,
	linux-watchdog@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] watchdog: mtk_wdt: Stop a running watchdog over
 system sleep even if not opened
Message-ID: <c34d9fd1-6fc6-4229-8aad-0377166e5768@roeck-us.net>
References: <20261011013631.1149228-1-agentzoan@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011013631.1149228-1-agentzoan@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_184432_966126_E736E6BA 
X-CRM114-Status: GOOD (  18.48  )
X-Spam-Score: -1.5 (-)
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 10, 2026 at 09:36:31PM -0400, zoan37 wrote:
> mtk_wdt_suspend() and mtk_wdt_resume() only stop and restart the
> watchdog when it is active, that is, when userspace has opened it.
> 
> But a watchdog that the bootloader left enabled stays enabled at probe,
> marked WDOG_HW_RUNNING, and the watchdog core pings it until userspace
> takes over; that has been the case since
> commit bbece05c0d3a ("watchdog: mtk_wdt: Remove mtk_wdt_stop() in probe()
> to prevent the system freeze and it doesn't reboot by watchdog problem").
> If the system suspends before userspace opens the device, or userspace
> never does, nothing stops the watchdog and nothing pings it while the
> system sleeps, so it resets the system one timeout (31 s by default)
> into the sleep.
> 
> Also stop it on suspend and restart it on resume when it is running in
> hardware, like sp805_wdt does.
> 
> The watchdog core keeps pinging such a watchdog until
> mtk_wdt_suspend() stops it, so it stays fed while tasks are frozen
> before the devices suspend. It may also ping once after resume, before
> mtk_wdt_resume() has started the watchdog again; that only reloads the
> counter of a stopped watchdog, and the watchdog stays powered over
> system sleep (it is what resets the system from s2idle without this
> patch). watchdog_stop_ping_on_suspend() is deliberately not used: it
> stops the pings from PM_SUSPEND_PREPARE on, which would leave a running
> watchdog unfed while tasks are frozen and could reset the system there
> with a short timeout.
> 
> Fixes: bbece05c0d3a ("watchdog: mtk_wdt: Remove mtk_wdt_stop() in probe() to prevent the system freeze and it doesn't reboot by watchdog problem")
> Assisted-by: LLM
> Signed-off-by: zoan37 <agentzoan@gmail.com>

Applied.

Thanks,
Guenter

