Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5310F606D80B
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2026 18:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h1Tyl/bI;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TEBAhAmn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TlsbZRohfYY9Acfo1HZrz4sd0DFYcL5H6Bh8ImzlihE=; b=h1Tyl/bIbexGcqiDC2B/hFz0te
	3k/JMDqzEujzNW11YDc48fC7FfbDkRdy8PrNFm2edCpUH4wfQikSbjrnge8TSrXKRc+s1ZFo9rSk2
	G/yn0K6fjoXqSRdzrr2QcglhxNL0LFnNuSqJRSiIB2D83gcxnTT7W+pQRIL7Kz8Nv0xEuJpcCZhVq
	FAfPw6aQh4wxSnhFu7OUtNwzK/YaMcjdSMeiARm+xwLYt01zwArjqg0BI6V2/JBACFyiScwH+1lzf
	Tjd/6vk9SwSMyQFJp1sYWPvQGOb+dfxT5zoTfFOf4Vpv0F4E+8eqJhE4eCMMGUCkFgtxTz7V4g3d2
	M0bspx0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOMb-0000000DLhK-3FYJ;
	Fri, 06 Nov 2026 18:08:33 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOMY-0000000DLfT-2GQ7
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Nov 2026 18:08:32 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-37071c0f42aso906215eec.0
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Nov 2026 10:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793988510; x=1794593310; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TlsbZRohfYY9Acfo1HZrz4sd0DFYcL5H6Bh8ImzlihE=;
        b=TEBAhAmnSoGyxIkeT12Rdn6L7uidFXASr/rRbtkA8PwGceoheeP4m//EVWG4wFFTHX
         kI4230V2y6M0o7FQeL8MN9pA3NCw89kDw92LUzjNKYtyeXHUKTQtxZ8d15BRp+VU/mu2
         hc3bKLeGhPQ00BBCBL9s/HM5xkQrXxGyUtaWMxYyuh0g6I0wNUVw3t7WUucwHUxvSlAb
         Z44Zq3vV45WRszzkN6dhvxHXkQ/ftsp9Qu+QyolipregUOv0M7ckhA4Mu4+yFw+KDY3F
         DDlZHQSZFdWzDr3Acj+wCafXsFdSvO4ZyPdtx9e6dYknvE96Z+Ve3vaL4RsAqrg9ZYwg
         ogkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988510; x=1794593310;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TlsbZRohfYY9Acfo1HZrz4sd0DFYcL5H6Bh8ImzlihE=;
        b=PPdyR4IezEiqo9oSb0p08Uzl9AGZvPQTfnsQm9L5SxxTAra/OycI9PNAiRSbwK3+T9
         snoG/AlblqCArM2txpPCI7VxCz4XsohNt77GIUclAzq+bg1U2WbvHPz8e5KGVjA/NOYk
         BWs8TdqKzGT384/VHMLX88MI5gxvfs4LR7JBmDeIv3eD3oLzh6ZUuvMssrztNEdAVZoy
         6i7AKVeL34ltEvAz9/JmJZt70MgpH8fzDXooetcsk8gRB5KjxZs+bzJ5vMdEneeYRaH1
         dxFlc+XWEtMxF98lIc3YOWYhCW2WnWG3mwTOWcU3ezsI4CPlSeIx947VfeIOdOlhyqyh
         nplw==
X-Forwarded-Encrypted: i=1; AKwUvBz/kij2BgM6Xc7K7O3iobe/JIAh9jB3HEQ6vUTYMzYAaDIJ5r6zy9uTSdjVTC7Qzdk3vLitrbfzhqd2pau6sg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/U2XmCi+DNPQuOgYtJzozZyTx7/DMKfUHapMGg1sjdIN5Hy39E
	vXPS142ZIMK1XFySXT/4hlZJWakabXi73ZcUvLYNva1+toZlogzdpxF+
X-Gm-Gg: AYBFou3Tw92zpnoieQGLVWQNoxKKcKV85lyqYv7Hwv52WDlags6e81Uq1ycTmzMIsK2
	7vrv3Emo/9M2/uCg8NudbzfyXn1czBa2UvowlfGJfNHMi/xtE2jB/IOGV/L+QHAcmhLUAQ3l+63
	/BSPM/mOKSL9chD6i8pexQtXdrBlga+YiTusfrtOoy863BT8UoJAPzMHD+D4XyvujjEMbQaQ/z0
	iH+he1wMRogxIlzEMhtimszafo35dVCGCuou3O0cW3s6+WJyu+C61HGk8bIlmBUOYOCqNhEBMHE
	+l+D6A3orxFHZfnlP/nq7VKR7xH2eyrhdQOudjIxme0Hy6VcLxjj/Go6bhcdHj9Bvp+QgSD+rD9
	gDVqQnEZlrQPGy/SWkmP7DRW9Jc25EL1KPR44rFXdREL0jBOr+5PcMdeWHdfBpqIXG8sRkjZI8L
	DNvq3l0BVIF9yDqJGdQni3uHaLugBqJlyA+R0V6xbMMNou5lZnGEWv+RttMoqkCBqKGcCIbSpxO
	QspXfD4x8cCA4pG5cH8GurcyFAWF6zkx1xUp1JDdRVhqsKhUCgxnUztx32xUHvTBypNRJGr5+tB
	Ji0gMhSlEm9qc/1cGNJro9M15rDnGWWhjrQCHQQyoNfIRsaVvS0hlj4ZG/11GCPNzOnE
X-Received: by 2002:a05:7022:5f07:b0:1af:16c4:d06b with SMTP id a92af1059eb24-1b25d31e658mr3453567c88.10.1793988509569;
        Fri, 06 Nov 2026 10:08:29 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4fd2d6sm7443467c88.23.2026.11.06.10.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:08:29 -0800 (PST)
Date: Fri, 6 Nov 2026 10:08:25 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: rva333@protonmail.com
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add mt6595
Message-ID: <au4Xis7Ei2th7xFZ@google.com>
References: <20261105-6595-dt-keypad-v1-1-f0911f40d3ad@protonmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-6595-dt-keypad-v1-1-f0911f40d3ad@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_100830_601870_1436EE43 
X-CRM114-Status: UNSURE (   8.95  )
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

On Thu, Nov 05, 2026 at 01:29:12PM +0200, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add a compatible string for the mt6595 keypad, that is compatible with
> mt6779.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Applied, thank you.

-- 
Dmitry

