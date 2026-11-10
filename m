Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB80606B9AC
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 10:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ee3ofos4;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Xc1z0BjF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=132X4kEugYv0DZ68KeYi71Q6KKe1Gy7rUBXRX5SCGWo=; b=Ee3ofos4ZnJ66Esuq0nJR4zS1E
	f3RF43yoon3X5MhGSsrYVWkq2HWCPIZclnC4aUw621WiEROaXcDpLvsv/tZ1xMMys4EUayJYJMnTc
	yKirSN8HGoH4QCwTwf/6RBXlg13Co2q5ObSu8JJeGQJbeGD/O+WUbhYrOmw0p3tSRGN9HuqXu5+iZ
	HzUySlsQ4lBkVkLCTOUo6GMjJP8xRPh8gkmK24edkFUBsrBtYYDfvGqGEtlFL3+5uqaADSCFKLami
	rDtudYYjdNFj6/JrkdSns0S0ZvdZoB98ZuCzP4T1q1GGhNWDjVgNXcC8UCOSSmHpo3OCmYACZ+Xx6
	iZggblsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQj1s-00000003S00-3XJy;
	Tue, 10 Nov 2026 10:24:40 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQj1p-00000003RxX-32jU
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 10:24:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=132X
	4kEugYv0DZ68KeYi71Q6KKe1Gy7rUBXRX5SCGWo=; b=Xc1z0BjFQqgkvGOLnR9+
	OyhAU8VyWf7eyOFIGj24cvVLNQ5vmQv8+TXX1n8Ap2kUrVdmmYXmwMfah+ryYnuc
	+ekewvukinYw3GkscbrpWqCCTe6N/GbrNg2o4DwoUdGhFHFr83C4wRo+9xawVXrI
	BB/xRHXCHfBjwCuw/bUmUAMUQnZSs8nzEXDKUCIWBMoacmTMYS17z7jbJALehaeo
	I/Ysu2pq2oWOaxDfYIJHrE+Gj9X0XrmjQsr+uUA44BG7zgDNpv4OlvZu+9+zIbKz
	6N96RuRjCc51wBADleWnmTkT/i1wulxc+V7Tt5ClfKKyQL30Emu9u7Rx9Lo0y9bt
	uQ==
Received: (qmail 187945 invoked from network); 10 Nov 2026 11:24:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2026 11:24:35 +0100
X-UD-Smtp-Session: l3s3148p1@xMwtfOlffIIujnsO
Date: Tue, 10 Nov 2026 11:24:35 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 5/8] i2c: of-prober: Let cleanup op know if a device
 was found
Message-ID: <avLw4zVtmr9WEQLR@shikoro>
References: <20261103043734.2179858-1-wenst@chromium.org>
 <20261103043734.2179858-6-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103043734.2179858-6-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_022438_068434_44BBE2BE 
X-CRM114-Status: GOOD (  11.10  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 12:37:29PM +0800, Chen-Yu Tsai wrote:
> The prober's cleanup op may want to do things differently if a device
> was found, such as wait for the actual device driver to pick up
> resources.
> 
> Add a parameter to the cleanup op to pass this information in.
> 
> Also fix up an incorrect reference in i2c_of_probe_ops's kernel-doc.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


