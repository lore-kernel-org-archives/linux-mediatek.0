Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970F9606B993
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 10:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RzYBZAko;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=TNCFRS9K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EhDjNoe3/JC0Wvq34jTb4Txp8C72674LsLZBKo4ri38=; b=RzYBZAkoTloiafTkm//oSEp4Hd
	XulAQAh8YDm/Qq0z53iXFvxncQJrK5h9HnHiUaF5BuD1BcWDMpRDqsr9tUAUb1DYBanF6gbl2Pftq
	HFifBLZEstUfP1afmn6lDHOXMUVZio6Z8IjjMbTp8Gyr8skCqbzIRVkEdCAYIuVHOTjefijhggYo5
	tcg7svdfpRYZWt4U4XHkl0UNGoXZGjNgLWJL0XHqo3xWKh4NY1wN2VM1vb/bq7CtQPbLILKWQPpp6
	XBIr0TVX+omd3vLz4M2hAxxJEW4Tuz3ZmePayCgYY9b93+yDJG8PktuFXZ8PlYNKr3E1UdFOvHhVN
	7kTC6EhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQj29-00000003S72-1I4P;
	Tue, 10 Nov 2026 10:24:57 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQj1y-00000003S2i-3XFT
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 10:24:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=EhDj
	Noe3/JC0Wvq34jTb4Txp8C72674LsLZBKo4ri38=; b=TNCFRS9K+hFp4Rdn4i0u
	ltnPkaWkMoaqydg2WtduSpQ34JwM3o5hAunPza0rJ0+Me/aJc+YUUUTteWx5vBbd
	xJ/MXF2iC+/sZixjVWv8RYDMNNAv/M9bF1H/w9KGgdPI9cCGt6jEp5h/HXhbLMn4
	kuAzNSsaSyurbxWzChy+HzOiG6uPrhsqvhsq2UbLqLqiNlgpxie/aVPduwzN2PJ5
	+jMwd8HXrVynOZ3V2fPayIXM6jiTno2QTKRGI9+fDqJn4Q7/Z5ZlP/hSmPxUcllT
	NMb8ibdtlIDHaEz3yXy5ucxgIRJvcOWi2Lygae3YKRB6MZNzQAJImk56YbPuo3uF
	1A==
Received: (qmail 188051 invoked from network); 10 Nov 2026 11:24:44 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2026 11:24:44 +0100
X-UD-Smtp-Session: l3s3148p1@tqO2fOlf8JsujnsO
Date: Tue, 10 Nov 2026 11:24:44 +0100
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
Subject: Re: [PATCH v7 6/8] i2c: of-prober: Defer regulator_disable() on
 successful probe in simple helper
Message-ID: <avLw7DllX_VM7wex@shikoro>
References: <20261103043734.2179858-1-wenst@chromium.org>
 <20261103043734.2179858-7-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103043734.2179858-7-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_022447_175828_9FEA5699 
X-CRM114-Status: GOOD (  20.46  )
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

On Tue, Nov 03, 2026 at 12:37:30PM +0800, Chen-Yu Tsai wrote:
> When a I2C component is found, its device node is immediately enabled.
> This triggers device creation and driver binding. The prober will hold
> the regulator enable reference across this part. If the driver probes
> synchronously, then it happens within this window. On the other hand,
> if the driver probes asynchronously, there is a high chance that it
> happens after the prober's cleanup function was called, in which case
> the regulator would have been disabled when the driver's probe function
> is called. This would then require the driver to wait 100 ms for the
> hardware to reinitialize, even if the probe function was just a split
> second late and the regulator was disabled a few milliseconds ago.
> 
> Recently, some of the drivers for the components that are targeted by the
> I2C OF component prober gained the ability to skip waiting for hardware
> initialization if the regulator was left enabled. This happens when the
> PMIC has them on by default, or if the component prober left them on
> after probing the component.
> 
> Tests on the Hana Chromebook showed that if the prober and trackpad
> drivers are both builtin, then the time between the prober enabling the
> device node and the trackpad driver asynchronously probing is between
> 5 ms and 30 ms, though sometimes there are outliers exceeding 100 ms.
> 
> Wait 100 ms before dropping the enable refcount on our end so that the
> actual driver has the opportunity to catch and increase the refcount on
> their end.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


