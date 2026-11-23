Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C78A606A330
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 20:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wuQ04iks;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zVMQUZkG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3VcpHnSiwyTeiDddBV3SmBxGPQ1li3vFXIux+h2TFxk=; b=wuQ04iksf1bRDrh5tkQ8MGxkgJ
	ps9Z6U4T6YvQ+9IbkOCxJ2jjkWutN0G2YzKBmMEa9HU974L00dvh7F+U1VN+VwIApVFO7qT5IO+Dn
	WZmKk2DyXB8kAl7n2kdbVasMcGzyFSVBrDWYnQXhpzibo03Xfinuu5rMDMobtVyhLSP0IkIAqzqpg
	5SIv8DJZHtpZNMt7M2WbHS3X/NCRRtC4/9MtPin9MN4oNDLfuqafZCIW58Ig+JHr2mhKPpngL68UZ
	rreHtn1puH7CixwfrMCXVn0tSeLdoKBp/CKf/8LQyVALO9OjILJdEKhEe7cDJd5zQBZTJcRP7oHH/
	DPxmQsFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVabX-00000004om3-1Cg7;
	Mon, 23 Nov 2026 20:25:35 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVabU-00000004olB-2fsB
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 20:25:34 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-15ea896ddc8so6274311c88.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 12:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795465532; x=1796070332; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3VcpHnSiwyTeiDddBV3SmBxGPQ1li3vFXIux+h2TFxk=;
        b=zVMQUZkGcYjBLQEcHvzCLkhlcfeVu0vRQD4TIY0md3C78kBHbB5FJmzCDumpmV9IDt
         SGLQdYUIY9wsIGbMQnilGxwXPPqKDrWm+X+HwEaATcIzVaJFvUe1+7g+j/fHNstJEUj+
         bjgCGwozH4+4GfNOSeTZQQ14J0Qptz81boQJqmaGYa85zl8rwWOb6TROnv1uhRxaV+o8
         J+yqnOJMNZbcS21XF9Iu4TZEn62fDiU8sfRCN8d3Qqii4qzSswUOhYbUyztcBNUMYAG5
         hNxj5ochOn/aPDLlUHrk6XcaaSnPpZ3IpuPOjsDdrMAEwGJQ8UVvRSig43h25DLCOjSp
         FJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795465532; x=1796070332;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3VcpHnSiwyTeiDddBV3SmBxGPQ1li3vFXIux+h2TFxk=;
        b=1Wx9a+U2ltwNsS8yr5y4aKZsvSdWtkYS1X1qFSezPjvwWZwKTnt2AmHP/nne73DD25
         pLx9p6JkzRu+68gPjRAhq/DkJ6Omy35QBuLTSLVWNi3ML1T+nb/B8rbfFpCQMVKqyfZZ
         hjldSyoeElMHOONjXwSoPAt0t1euicUlJ1s21k5/p384CUDXOzuujT2F9T2mlIOAGQeY
         PwPCyC7lE0soudHAnESOCHc4JtKY8CYAbTrfi+Fg73f4xkNNM+qZYxGfEmdO9Suo44Rj
         te0r7jwaHcZEFOVxMBwcxpDtgp/JjCz9t8+j2Ea9679NHLbpzDZxRQnawhhioUhPtVti
         /N2g==
X-Forwarded-Encrypted: i=1; AL+hErFv/FLkrdcCOS+WH8JzCbUig0Lq2M3Yk5+AM+x70EoE+XKo2MtwauJboLD8uJP47JpJkL3QLL0wk5/G+AqJEQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+k+0f9uI1j4scRniBhm+lV12or00VaFtcX+A/rktVvb9qHChbJ
	5c6fA6ht8rkdhvm8vZfSd3FakwAMmssPGFxgHkvGfjIhI5mKYN4viWus
X-Gm-Gg: AZFdTZcksL0/VoWepGWoJBu0Mbuclmk3ylbzPzUlU6+J3/bphghS++Jnxca6/MX/TZb
	59px5Ft07pvc+Gduh7hMyH/4zeSwHXac00ogWSBb38EY8iic/z/ksBk0y4EtKzimvUSFLOqWoxi
	BnLPbo8opuZH/0oMNLjgFpbAdwE7fhxAn1Iy9mIsF6AiAu9VwOguXAWNjasWeDb0x5UUkKlqgKv
	4FQb7ZMynIwLu7JY9JoB+xp2mrusBwxGiktKaT4OYbfWWTeVyorVmLeDFcZB/sgqUMKi+49S8nr
	C7bVtmg8tuhLr/DCjGM2A2+Bbo9qOw+uYJU3RCwaR/V0Sv1jyZBVBtb0JoyjekQqTAEl5Fs4+nK
	1u0gYo8+NIxmKlnkpBCcIAt0s3A3lZz0guJwJl2iSs8fTR9uijpNI+w2XIFATxYFrXjMJGCpFV/
	RCif/hvxGYp5o8wO5QE1fD2sxn2HM3sUROC41HX+WACBAdiS1nOrRlUNUwdxSTyGne0jFyLHl7E
	fZqHuLjXy9M8CGxyYFEsFjQoImQ0yVgGF+ds05UxrZWvifMs0p9g4VpEEQ+A8S2DW6Gnd2mRkFJ
	/RVA8bwUHDCZh6hgLSnLe6JmR4w3YSLg3HN6Xi90+Hcz9OT95Mri9kB+rYOOO1oA5eMO3fM=
X-Received: by 2002:a05:7022:290:b0:1b5:dc3:209b with SMTP id a92af1059eb24-1b5568ac6b0mr11976416c88.22.1795465531758;
        Mon, 23 Nov 2026 12:25:31 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm29277191c88.3.2026.11.23.12.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:25:30 -0800 (PST)
Date: Mon, 23 Nov 2026 12:25:27 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fengping Yu <fengping.yu@mediatek.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH 08/10] Input: mt6779-keypad - enable keypad clock before
 programming registers
Message-ID: <awShM65vJT7DhZLT@google.com>
References: <20261123183200.3900004-1-lee@kernel.org>
 <20261123183200.3900004-9-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123183200.3900004-9-lee@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_122532_682153_8D03973A 
X-CRM114-Status: UNSURE (   9.23  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 06:31:14PM +0000, Lee Jones wrote:
> mt6779_keypad_pdrv_probe() writes the debounce and matrix selection
> registers over MMIO before acquiring and enabling the "kpd" clock via
> devm_clk_get_enabled().
> 
> When the keypad clock is gated off at boot or its clock provider defers
> probe, accessing unclocked keypad MMIO registers can trigger a bus abort
> or silently drop the configuration writes.
> 
> Acquire and enable the "kpd" clock before accessing the keypad
> registers.
> 
> Fixes: f28af984e771 ("Input: mt6779-keypad - add MediaTek keypad driver")
> Closes: https://sashiko.dev/#/bug/linux-fc15622a-407a-48b2-88db-195cdb311dbf
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Applied, thank you.

-- 
Dmitry

