Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A373606A31E
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 06:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=km6AYjVc;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bZAnhFj9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k13cl8AnOgXOYxh9rMCZd+VqMKK57TsIjB6ASgYtOw4=; b=km6AYjVc2xHhryN11JWsoouIc1
	Y8Imc88TQy9NCx2MdcoXSGCDz+md1yjiTv66pUbXdbvMrKmOVl7FNjYxHotQztquzKT6zaktNgzl+
	UNfG69Ydjwh+vyD+4y/IkutXqboti428RaGsE3tgTteiw2pGPuhcTQYT/1OrOuIRKG0gsHLtWUcb1
	E6fXLP1GWIcJMVKqm/FiYp1s9yZvJtqoMqyWoqUxjrBGNJzPa3XFmx7PYXC0zHTfdk0Ne01EtHFgl
	zRDl0GPLpxbdhuKOKogLyCctqR05gde5tqbcKB9fbifGXcfTxZ2gtXqllqDlq+uyeoXkuiOV+Ny9r
	3oqC0F1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVjz7-00000005eUq-3YzK;
	Tue, 24 Nov 2026 06:26:33 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVjz2-00000005eU4-15LD
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Nov 2026 06:26:30 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-380c28f9e35so5318760eec.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 22:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795501587; x=1796106387; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k13cl8AnOgXOYxh9rMCZd+VqMKK57TsIjB6ASgYtOw4=;
        b=bZAnhFj9D2naQZFjNvuE6o0Mimt4M4gbKcArGMcn/l7ssqJcSt0ELPdy/PIZIz9Dmv
         qNax6T07Q3W6Kb8BIa9tmcrOAB92R46SD8JBDSCl79XpOsaXzUHYwq2MJpx5Z2wk9QqJ
         IEw5RJuokDWQwFsGlBSKnEhiztnwm4dPwTee7n6hEsw4x4gg3Q241zkxj7WGcaIDlG8/
         eSTDUrPvyEaypnKR9LkU0j8IK2gwRa+Z6fbpKnhJ+QEtUdurmGHTgVnvVxwVZWtFeQ4g
         Q4mnbLCHMetWtVacgr6fZbKU9aG5e6ig0cnovZB61t72qybTrwgr8YIvFupKdyBwcLQW
         Sjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795501587; x=1796106387;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k13cl8AnOgXOYxh9rMCZd+VqMKK57TsIjB6ASgYtOw4=;
        b=LxgukpdON4I5s9xdNTNmVcEbYQc6IaOg0Nm/+bCYHTICaRXUiou8zSmQiYcPIzmxC8
         FiTn5WsdIvH2cBmWB5ZhT6JbcQHJMb5YEl3+hQBCqrI8NjoMVL6vQJZLS1b5bK14ongA
         PPwJijQxvIyuxz0PHRk69TEopRuttmQQCkq22ZBmLXXg+kSh1NMeoAmivPa+G67aHBok
         v/8Pa09GZ+VQxcre0OAmC1oRYWzVwHV03u9JO6UHB3zxLPxZcDRkmnNzv/cMkolSmi/9
         xKgFHde30X6UrKOsMLrbLoNYMc8Y0/E/Splmu7021qGPz6Dx/kMfEwXVilV6qMiWG/cH
         lUbQ==
X-Forwarded-Encrypted: i=1; AL+hErHMr4biepyVzpIziImEFaOwN2emL2DMy8bZN6xT21hqd50V2XatO7ISAfld7NaIGMtU+mATWwjc0YhCJyEv6A==@lists.infradead.org
X-Gm-Message-State: APuU4Z/08gvtB5LRtDHkUE3pBEa/aE664Ui5jnSyLvnikDWw3d8ziFlq
	P8L5cgUzXU4G1bHhYv573EOSsiY2CXD9OsNOs0GpF8pB16bkIl6GOW/o
X-Gm-Gg: AZFdTZeX1IZSdPugCLbzGeI9ePBVjk7di5f1Qq9JoXmtNWaBdLuXa/V64xbvk9b6nr1
	C1IQP2QxvrSYEL1XqE5eBAC3nHWWX90Gf+L2d9Z2UNiOh3g0cfTorb5KNCoGcVXo24PqJv9uOvX
	44utVUYe/f6Z698DCWgydB/mVWj5+RZhnt9iGtgKQCOu7zILchgLhDq4adLq/eVQc4AhnaeDVYU
	jZtBUCtY+bOhasuCOByKrQKmTXV5WfqXz3fQ5PKQ4JNarZ5S9l58ZbKCeNzHEuxCZS6s6YvkJ3m
	8y0AnFv9SmGGfRM0N/GNodGgO32s22Cs/TsbiIcfOHBGYSJH9YuO43Vxtf+5S8oJXeJbrNGWNwk
	Hr4O2fUFI4smI3ABlpyFfgTEnCXMjRN+72sqJmiByS23OpPdZysvXdWE+Barj7aU3lJGUCFA0Bs
	V1MvyJE5Tjyt7DRDbezdQwBXweqh/z6XYUDrWiZtnFkH/ymDBWkNbIbpzbHux3RkSRGgLNy3KeE
	za7ToCFfHB6ZePCPUKgKtOr7LnGuUz8WJM7n5E93QH02o5ZtlwlQrp0hYMOoYiMDZJh71pqd1jZ
	fesohx9J3HcyelI8IVqhTNUW5BC438T4xWFj1390PI3qP699Y9CtcCzTThAacFhUuM33oGjB
X-Received: by 2002:a05:693c:880c:20b0:386:ab85:a011 with SMTP id 5a478bee46e88-386ab85a718mr6427409eec.27.1795501586545;
        Mon, 23 Nov 2026 22:26:26 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:ee3b:b892:771b:3bc7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm72739389eec.3.2026.11.23.22.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:26:25 -0800 (PST)
Date: Mon, 23 Nov 2026 22:26:22 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alexander Letuchiy <asalde.le1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Mattijs Korpershoek <mkorpershoek@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org, 
	linux-input@vger.kernel.org, phone-devel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/7] dt-bindings: input: mediatek,mt6779-keypad: Add
 compatible for MT6895
Message-ID: <awUuAzGu3ZoADKyB@google.com>
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
 <20261123-initial-mt6895-v3-4-95c46597e63d@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-initial-mt6895-v3-4-95c46597e63d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_222628_306342_C80BF02B 
X-CRM114-Status: GOOD (  10.44  )
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

On Mon, Nov 23, 2026 at 02:18:37PM +0300, Alexander Letuchiy wrote:
> Add a compatible string for the keypad of the MediaTek MT6895 (Dimensity
> 8000/8100) SoC. Its registers are the same as on MT6779, so it works
> with the existing driver through the mediatek,mt6779-keypad fallback.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>

Applied, thank you.

-- 
Dmitry

