Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3293606A33A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 11:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H2SWcZBv;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=i02rXB+p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=URNm3AaV7OhkF+44lQ7GzK8Lve00n5qQDwL4NE/x4Rs=; b=H2SWcZBvsrI7I8kAciWtMI8qgL
	OO1/LLMfaTT2qYJfad+J343CrO66QKQ1FFzGgTaT+8hVBmcH+p7ywtoVgPpyvAy2hTiIjpmuLI66/
	vH8JIF1NVYY13IMMnGFcXivzw/XspnjjBn45H9kOyV1JcG7fSEHs19anY3L9jXQZRtJtIMGLfwnP9
	gshFX+cMlzPzxXpgXh54PuKMtD6MEK8U/VoSh67h2jT7O2ttpRuT7LwFXUgSKy+SEoPFkorvk8K8t
	GceoxXUf9fsWwIBNgsXqZ26maDuwzuWNErQI0/STf5WoqjkxVRSIdXAYvnbC8+5xKlAHQVAr8AQfh
	8kaPi7Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjlR-00000003aay-2iBy;
	Tue, 10 Nov 2026 11:11:45 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjlO-00000003aZj-1PCA
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 11:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=URNm
	3AaV7OhkF+44lQ7GzK8Lve00n5qQDwL4NE/x4Rs=; b=i02rXB+p+ezyY+T9IzNM
	Qg2/TbI2j1IeV/mdj4IIhfjWhMyv16kR7h8KHBe7WvPbbRwzqIAO6kKL5kZt7SZu
	l8RDOCA24sMzfes2GshnBEOLdXameStP3o59qX/+Fe3mhbk1zso39dc/Sz8KGEof
	d6Tmlb+fvXpfodwK581vA53aIjzj/iPeIiTOeeDAWbIVodLaK6Z50EozW3xTO8Yv
	6vH01sByRlmBMYbHfbO9bvonGnvVwVkUCFwaKQ4DH5v6bDS7JWuys49PF+PFul4g
	zt2GzSbpMy7NGESJRKYoTmp0GnbAX9IreOiLjSNgpHp4jU1Wr2ZC+7GibPjFCJ7g
	RA==
Received: (qmail 205301 invoked from network); 10 Nov 2026 12:11:40 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2026 12:11:40 +0100
X-UD-Smtp-Session: l3s3148p1@FtiBJOpfzIQujnsO
Date: Tue, 10 Nov 2026 12:11:39 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stefan Roese <sr@denx.de>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: mt7621: Document an7581
 compatible
Message-ID: <avL76_zF5NizIRMK@shikoro>
References: <20261103210542.15965-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103210542.15965-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_031142_706181_B3395987 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
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

On Tue, Nov 03, 2026 at 10:05:40PM +0100, Christian Marangi wrote:
> Airoha SoC implement the same Mediatek logic for I2C bus with the only
> difference of not having SCL_STRETCH bit.
> 
> Add a dedicated compatible for the Airoha AN7581 SoC to account for this
> minor bit variant.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Will apply it to my for-andi branch.


