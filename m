Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAE3606A331
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 12:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wY16zgwm;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q2q4cieC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IDaAvYVXZ58edhDcqT25CtUAFfFh9zrLMuk/nutn9Sg=; b=wY16zgwmf31v9frSheQj+LI/rH
	D9rGQvuY/p83E7UI9s3fiZ8DEJO5YQsO+Qgj/0qnDQpXd9oPyxoxwou0PxZnn+oe80MSRunLfOjLA
	bCUU66OFcBJxfSPvbGuWZpNsv/xLhRA1hKT6OhFxD67IuBhrLktyjzXyHwnCF03f3Xa8pzA92vw7m
	d27rc1Ndlrsf25sZ/a2GKbkOw/GeObFrgX7wlIIBLSMMZUelmneEkn0X5FDP9pCNMt/4eXVFsaFYn
	wlaV96VPHZkIxgyph/jJl4UeWW5IL3ebFzcCa+smA1+Qm5pgYAqxrCRhOPDCSEpTBCIwx/BeAKx7S
	Nhl/KXww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIb7-00000005j1B-397o;
	Tue, 17 Nov 2026 12:47:41 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIb4-00000005izf-1pXI
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Nov 2026 12:47:40 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6b785ca42ebso7022335a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2026 04:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919656; x=1795524456; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IDaAvYVXZ58edhDcqT25CtUAFfFh9zrLMuk/nutn9Sg=;
        b=q2q4cieC8NWR+fxn44RT+e0VgSbC6B2IVxLUgbbBvX4DEMy2n2zFbOE9Z2Q4A3u+n7
         h82uBGtkSrK7iyXH3WgUfR8wq6TS5Cr2XTqrNNUjFRxq6kAbXxCXWqXicmU8GkkC91Hk
         zl6Dq0oJomnOZJC19htM7q8vUJIUygSgvKD8ILMuV/SRIUl6NGGlRflhgmeiSx/JkYcp
         ylFV5pmRstGiy1tU7cwIaYqrv7j34qTYvfAGGbSK/jBaV0+4enAptNC3gTTCWp8j/xKN
         1byliAOJ5teXi+zI3zRhgvymP3l2qTAHIImUJ5MhEm52ZYDeFeXPVOWnAHEyOdlNFHiA
         3ViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919656; x=1795524456;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IDaAvYVXZ58edhDcqT25CtUAFfFh9zrLMuk/nutn9Sg=;
        b=Ul89UizRawtieCpL7QyiMxflCF99go79OWyPDwwwNQ6VbLvN1PIhLgtRq23yW4JMVM
         fD6kq1oiH4ZgciO1mR8J/i8tucC75B1WHOmquRx3A7p2seiA9Ieql3vaRwxISPaSK5V5
         3/NIiItdIww9EoDJKzgikZxeHeCbMOYdgrrrrf6UqNNzkG9fhRk046HPghqKu/718lQX
         CI8c0GS8dEaCLcjfSsW6g4mTj0007l9zYEpooXPP/2c8YcurnwkSo3zuRzp+YbdUG5iN
         TI6Wqkp8wIkvZCbk/jkLckMloUFJA9lFzUIYhs9cQ6XXft1GIUJheaWykS3OsG1Z+rh9
         YESg==
X-Forwarded-Encrypted: i=1; AL+hErGmkwHofusbcWHjzw52xZZYoZ/KJq8G/1Rhn+3hduG9BhlI0Zs7zlnq4SXQN/eI0Q6kNRFQvKqapZ0CU2WVKQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9haaTlugiuogr50NbsaYBfO2E/KTg/VlPRV9fdimV96cGWR7cl
	ZSdm0k49rn7/SaKwcD26++BkX2FHPCiYnUtns2rlGJCbzSrQKASRAmz7
X-Gm-Gg: AYBFou1U9pjb5nzveTfRUM2UBOGT9n9JbAGLNc1F8VPpXxgV9rIr0XfnuYFWnf+085l
	82r8q8kRl/yP+FLn46xV+GH8dwtTW+vDccPG1AfCiMJCEBCOemzHGPD3TiJ35QJAsWb6IqP3yJT
	chg/lSwhwh6FFCTWs0WLD2d5JwlXKX6133A1qXz+EAKvcLE4oSOQjVObdX7UA6gQsOtS57yB/hQ
	gWvWmbiezyop14bmxyU8omT5DRE2WUXqBdlTu43DjizkEfMbDwVZ1QO/iLaNWhVksk4da6MUoxG
	hAApjFOXtbtEjGdrqV6i/8XyTG8MOU8eg17t5ZOMuXM/ptaj/AGRDf9sMw5kj9E2B9gs6zqPRIY
	6E8A6au+Dn193YLHM79OgnlX2Gz8xQIhglqQiEKDPqh0HTd37Xp18unRckxlDk9Rkl7cM6nkICq
	kur35x9NIJzbgnGIVx1dwEOhBmLyEm0gXV15LYxhMuFyEo7LXLlIaW4yvKTKy2NyqkrU30YUr9Q
	IvUl3SMzMaV9juOYpByLtxM5WQBGFZpTMTIje00teRHnD+jsDUoHwRLjJqYLhxl9fyazuYbctXE
	9bmRKNTNo/siaOJhTZHImeJ3cLuxD03fq+Q66WhwXnpGw2ZMc1V2ufWXEOep2gIxnIozSLLIL9L
	6EIfJQw6sRKtPNTLN
X-Received: by 2002:a05:6402:2347:b0:6b8:7d2b:4dcb with SMTP id 4fb4d7f45d1cf-6b87d2b5390mr750722a12.14.1794919656177;
        Tue, 17 Nov 2026 04:47:36 -0800 (PST)
Received: from Ansuel-XPS. (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b87368c70fsm430430a12.23.2026.11.17.04.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:47:35 -0800 (PST)
Message-ID: <6afc4ce7.4b925a68.31e7c.7768@mx.google.com>
X-Google-Original-Message-ID: <avxM5Ldccuc6TgM_@Ansuel-XPS.>
Date: Tue, 17 Nov 2026 13:47:32 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: netdev-bot+sinfo@kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v22 00/15] net: pcs: Introduce support for
 fwnode PCS
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
 <179491941687.3291.11313796890436002644@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179491941687.3291.11313796890436002644@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_044738_533501_E0456CE5 
X-CRM114-Status: GOOD (  21.70  )
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,WEIRD_QUOTING autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 12:43:36PM +0000, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
> 
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
> 
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> -- 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

The RCU """bug""" was found while evaluating the code. It's hardly possible
to have such bug on real world scenario since PCS and MAC are currently
tightly coupled. Nonetheless with VERY BAD PROGRAMMING it's still possible
to trigger it.

It's both a fix and a prerequisite for having standalone PCS support.

(hope I don't have to repeat this message for the next gozillion revision
of this series...)

-- 
	Ansuel

