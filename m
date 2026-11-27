Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56748606A33A
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 02:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aW7gcLxI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J+9yl8Dr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-Type
	:References:In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lEdmfvtDYf59q6HkpOhInvb9oPzLhNZI7PhqbULg+04=; b=aW7gcLxIjvdRZtjEuNzsG/MgnD
	HLkQBYUcS7c+kcdW0ukAjB58qIGFqXiCWOHa2oVZg74VCtG7p9F8J07Bwnw0v9ImbLzva98d3l6Gc
	eeFo5ZCCiUyVVUbq34TeUy2cl4AwEJEwlYJfolNnmjAUHwOga/+TbiJ/SFoVsRy3ssVWQveIpmwza
	9nW0jdPKts/T0+KvuRPcLxAQmtcYaq249qHT3OcgqU0CnHn7fyhfY8qA0ut6OaLrbnn0bC9FnwVsj
	aQhs9zU5lUHa9hKDyekIgcZMu1JWdNfgysBW7DVFJUiYHked0WkpSPQxZub9LiVBlpQ02FappVJzt
	OpSjsWwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlYp-0000000Elpf-0Bvv;
	Fri, 27 Nov 2026 02:19:39 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlYm-0000000Elp2-1pi7
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Nov 2026 02:19:37 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3b413d04c93so4379745a91.1
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 18:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795745975; x=1796350775; darn=lists.infradead.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lEdmfvtDYf59q6HkpOhInvb9oPzLhNZI7PhqbULg+04=;
        b=J+9yl8DrEu5vfv+Tev/LIOCsC03nDTuhEmkDQATZvhMDphK6RVaPOx8lx7+ozjzUGa
         //LWyD+B8dXG9iz9sOgqST3gsY1xgkX7qkzQXBoHtC6UwrEHTvSzTBbOAYeSjIJERt4I
         jnrlOdiiXCDT76CuDu96UuQojbdXPZA2whqu0BgEifQlD4Y8o9f4M3S1q5REwXd8tByA
         mik+3HY40oM5NPBHt5oECW/zqtCMrONir+t38g1QsETJ2fYdqa0gjqMi/cEpczGQCsBT
         0Y8iliWyVk4gs5BLR4KwmGg7vSt1dUzpxTHcTLZY+BwGwHLrRj6h76CX+PI1Frmzu6J9
         LKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745975; x=1796350775;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lEdmfvtDYf59q6HkpOhInvb9oPzLhNZI7PhqbULg+04=;
        b=SWKVydZgyAB6fPsx1OAaX/Ad80AoErkwzl5JQwT6FLbdzAUxrd77dhu8HsOkdVyw4p
         7pVa2ogNPlNM6mHY2Q07t9CTZIKZT3b3qJhvzJwI01KWXMqbZNEDwFWfW8a99uhcwDrj
         ziSzRflr8OawXZdzVGUYNMt5nRB1/U8Td3gQaSH8n0H2y0TK1/c6EGlP7lNmIySCFCjI
         nI52Ed5pSikPacpnB5wuKGd9bCG6fLscp82mA5XSdOjrWnAZDcbdZtuWK0oAOPhOrkms
         DCri0zR39LiE7ToP1AMP/jkRNhHnDeBP7vNdLYhSNT5CnZLQFddIRu/+qD4yYl48WSy2
         iiTw==
X-Forwarded-Encrypted: i=1; AL+hErFMF3ew73OE2rdSiOFdvr+HbTIylWItQTyAAjX1pBNgS/r1s2qunN/2DJwUqAcCQVp1ZzuEfJ+Jc3D66CIO9w==@lists.infradead.org
X-Gm-Message-State: APuU4Z8HPnvG47yYb9HeujOndAnwdRwidLz4OrhVuy8neeKEykjZquul
	0H2dbzL2O6YdducXa9cvocoqt0Htyj1n++QAAQjbGP6k0jHlKsUuLU5I
X-Gm-Gg: AZFdTZfXacWHAaD2az2YhfMOd3WLmZ13gfu5ljDNqP9vkTw+EkwDgJSOjbqaLIb7vM4
	VxF58sevTJKqndNww8Wf2nDv4+VKKVk/gX8zScbX4Rqy0PTkGV57CFZwCCmJglEKzqMoUtggT8M
	pKmNiJP16KoQCLtyGl8+fBTS6QpMaOsqI2d9b79fv1+hfqpFLKCwaGbjqG+MQaj96FSkxXDTJ8D
	O5fF3+ZJKjE4Fu3ewpKTIjHPapq/dAPqm5vGXsYniMiOivr313eFQ+AB0OxKVKpkImtf3N91eZb
	ShEfIXDIhx9z7macEKgAnYhy0Is7OgjwLIZMtCVKwnooMu+4B412D397fCjYAlHso8ZnzYkBmtJ
	mfwsC77o88oUcoiXV8fNVuOhy8Hy+L1pYmumTwzCGiW2610pwYy5VIuto3Ob/h1VEjMZEaliaob
	4sNz/TxDqfQUgf26U3rnuJ2DDAat7C5CVvzgLrmIMQ/CinfrxCho7vyfyWW4EijG6C8h8Khgbr5
	QWHH3ULIZcOaUbe6TW8wFW8BAl/QnsWNJTu/ZOgOFucGGpr+lH/VLQc1M0nJSA9325m+8nO8ewW
	rIcXRAnDo9gjhywPnubDqWeAIIaxxTNvGYFgiBfdNO/PS996VisbfoKtIfMsbiuRq3F9gqC4Bng
	=
X-Received: by 2002:a17:90b:4e83:b0:3b3:ff70:4d06 with SMTP id 98e67ed59e1d1-3b41c9b324emr21488621a91.16.1795745975421;
        Thu, 26 Nov 2026 18:19:35 -0800 (PST)
Received: from mac.lan (114-45-165-38.dynamic-ip.hinet.net. [114.45.165.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm37964315a91.11.2026.11.26.18.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:19:34 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-iio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] iio: adc: mt6359: divide scale by ADC resolution
In-Reply-To: <cLdx9oABQCqAoQThLiQ2oL34p3QMP4Xjq-kkFh6bkQfY16c-wXzqrKm06VYO0rxMkR56vn2ycUamZ7i6zv0metPym3UtZP2DUW-7H1KKyB8=@protonmail.com>
References: <20261126031013.27701-1-iasnezhkov@gmail.com>
 <20261126031013.27701-2-iasnezhkov@gmail.com> <cLdx9oABQCqAoQThLiQ2oL34p3QMP4Xjq-kkFh6bkQfY16c-wXzqrKm06VYO0rxMkR56vn2ycUamZ7i6zv0metPym3UtZP2DUW-7H1KKyB8=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 10:19:29 +0800
Message-ID: <179574596911.3233.3328617859832706425@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_181936_503341_134A38C2 
X-CRM114-Status: UNSURE (   3.95  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 2.2 (++)
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
X-Spam-Status: No, score=-1.9 required=3.0 tests=BAYES_00,CTE_8BIT_MISMATCH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Hi Roman,

Sorry for missing your series and for respinning v2 too quickly — both
were my mistakes. I checked my other submitted series on lore and
confirmed no other duplicates, and I will give reviewers more time before
respinning going forward.

I will drop patch 1/3 in favor of your series and send a rebased v3 with
only the remaining fix.

Best regards,
Ilia

