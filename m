Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BEA606A32E
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2026 08:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EJ98HZ7q;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pqqtQl9/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JL/ejsWQpZh4uIBI1fUZsT9Ty7diuDK7PLmVq35sQrc=; b=EJ98HZ7qqhnXHfCbn/JNRI3urd
	jsevWTLPWX7nsfJnJDKiFeFhGBZ7KtLkqU+9xejQV/02uWeg8L3SEeoUs2oCY6W7M+hLlz36bxCTY
	lNCq10gOwRQMkbtfMCrN3wK4EuXw/dAUBhrYCEjOaNIRO/arrV9LMJ0mZ/YMtivKNdf1lYkJ4vmWN
	NALpVxNLLH4yWIsePPOOcwnKthAiU5j8Y237uiXy3pacUUfKk4Wlh0tJKtHard9EJdEWqG52KZU3L
	stZhUVncsGEhnsck9McMWIlzsUOapzY4ULQwQ9amhgYTtnsC3AcM8zPz1ZNVxfkckLEx9zR3ofZLm
	1VtZNq/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEs6-0000000BVou-0eSq;
	Fri, 06 Nov 2026 08:00:26 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEri-0000000BVja-0s4e
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Nov 2026 08:00:25 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso330173a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Nov 2026 00:00:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793952000; cv=none;
        d=google.com; s=arc-20260327;
        b=gjWLBHKorG/wnYHMCJc/YO4jqcsJKQHfmZeJvY2mt54xMGxzI5JGCLL52n3dmwSLxe
         bToJ+bJ30MIussE3JifUbtsQ8BrvgOmklBXbl8cHykX1bNys5G3YL/Ie+2ELGkB8TbdQ
         0oEE5S78ZF2FtayJ+ZARZEHxYWqQEQJK+tAh0q1hxFS3oBku53m+1feqMDl8u5V+dscL
         aDaJcZXRv1M/bkUY+vmZQ/aNow2m6sy3FGjrkkUjAf9gctpGapcyXjeHqho6oObecirM
         uHwkIrBOtr124v/CyXsYq1lBYnfg8TrgHAWq7voqjJVjCv/7unTwwfiomgs2RcmB18b9
         o1fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JL/ejsWQpZh4uIBI1fUZsT9Ty7diuDK7PLmVq35sQrc=;
        fh=JE0sa4+HnPOZRmklAbp6O9KtHj6M80s1tnbI6vqq6YM=;
        b=giCz3UrhKZt2MAiER0f554quUzT9aQgFuBuOwygyy4mp7qOF4lFrZ26nbvh4fKsnvj
         W1hqdd/M8ai5xfeZfxMVBmm4fnZuky59fkMUUBCBcQVmvJvtl2eRYTGL0AJFxC19+8Kf
         Y0RhM11r9TGNoRjoHvmbTU1Y1DqSXBqjl194BGFFNL66bzw3kGMaNO8O92SwUW7UqXgy
         WfN3ZjvYhIaJa/0IKH0LTbjl0HnHPmU1V99v0tDOuzZhvFKU4GT4tjSpsjWH1KOgISf8
         2b+UDpmBfezQ0njw/b8lL42rqvklyW7mt/sMxPwGLbymcBToWqSPzwdimeFohx8ZfTI8
         uV+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793952000; x=1794556800; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JL/ejsWQpZh4uIBI1fUZsT9Ty7diuDK7PLmVq35sQrc=;
        b=pqqtQl9/sNC0nFWgcvY5XEjxVELpMPV3DcXqzYweC7rpnYhQ8H1mFbd3Ci10xc7gN9
         U2CKOAoRHt9svR0rYDGKX3htmekO2K/l9IkE0o3nRcuBZtyw0EDa9SkD0Fh2JpaF0TwI
         0ivr49eKcELRGtjg99aFzhvGo6rbsu5tGfXW3J3QweO59qE9IEpSy8a6IbJO7dFNd6lh
         vWTaO6/SmlVSkYXixnrB+iKEgUXko9c/BbaJZ/jXisTVHPw1Xmia7qjNkrnw8veHM9Mn
         BiHkaIY+fnH9KxqG62A3hJBsIKd01pcT1W+6RXwJtF4xpyriKp/WA5nYY9triBnJY3Z4
         N8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952000; x=1794556800;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JL/ejsWQpZh4uIBI1fUZsT9Ty7diuDK7PLmVq35sQrc=;
        b=Ixmo1MQB9L1BlAZx05/MBCt490fvqdnYGimQCuVfR/qc6fGLZteqZ8Znx+qAPeJHzr
         WYqCDijJD9F2JN2mZLXcbTF1YdMkKBgFacTopJCv5liauk4UrdB8SFsbbUnswbMXp41A
         WWufqtJcdMsaB6nZWVQmy/QO7FKCv6ehoiV/wHriV0wui8KvijcVvDrjy1xj6sGWeT72
         ITSC5m0HA9TZvEBPeGoZLxZRXNifuzzTlAfbf33+zaGaJ39wwkpNFBAbcH7XzsBr/mor
         6GFgB5WQTZ6knNN9hWx6RSxSmEcVoUc+PYWbf4lycpSvK65vGqmpfvNFpb6vcBLngHeu
         tc/A==
X-Gm-Message-State: APuU4Z9/1unonPY/5deFeRQ/BvtVH/749pLMSYeiQL9h4qWszq6B3FB3
	4d7afE7+ZXOPNP1sRVPlmdZ7Kqj36H4Sw0bfZam79ddLqJjLQ1HTztL1LKxg5kY6xpf6wROwWMP
	aWG8knoQF4tLyo5Jpnb83TOPRfSk/smU=
X-Gm-Gg: AYBFou3M9tJ8w/wHLM1gzeh1D3MSomqXCEnimlHcJsAWZvdTmzima78U/Xhn+36LHA7
	RT9/4hefo22DXXHbeIG9/HNQq59jyCIjTLzcTRJMTG2956fQUqSOKEVCY+hnceGxLkI7wQk7/Gj
	4lfw6b5F2Nb4b0mTnjwmFm5/agcnEh5U1vh7EUR+kDjA7os+WtZaizYci/n9Vwi6n8FAhSmBaiK
	XIkFaIrc3dOkFvczAOnmzZgkTArCU6N7HUPXw/CYuK2YttPU9Da6aWlQWniKYlL4FmicNcCFrWR
	qP6NRp9Tyt8ArYVPOmTcFyeimQma9nQJrEZze2gxL3E13Kz6AhKFyHLYxr64vQ50iVUByWXKfLT
	EvPuCEzL/s2sJUoW2Cbs/cMkPBY50rnH94QHr6tRYkxtU31xP6aK4oGSB
X-Received: by 2002:a05:6402:440b:b0:6b5:9849:e335 with SMTP id
 4fb4d7f45d1cf-6b5985927b4mr1117288a12.1.1793952000065; Fri, 06 Nov 2026
 00:00:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021105109.199886-1-l.scorcia@gmail.com> <20261103150936.GB792264@google.com>
In-Reply-To: <20261103150936.GB792264@google.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Fri, 6 Nov 2026 08:59:48 +0100
X-Gm-Features: AclHuK_yxwIK0Nk7bFmyEO_n6HuxXT4AJJgazikzKXrXwadabrKuwJfTV_QGR20
Message-ID: <CAORyz2J_J0dYtg2BMKq9cuzo7U0j-cMQoFXn+2pOTztHz8dS-g@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] Add support for MT6392 PMIC
To: Lee Jones <lee@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_000005_307069_CCE6B78E 
X-CRM114-Status: UNSURE (   6.99  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> How many more Acks do you need now?

Still missing acks for the regulator and pinctrl device. Yesterday I
sent v12 of the series [1], rebased on v7.1-rc4.
Thank you

[1] https://lore.kernel.org/linux-mediatek/20261105194426.1113050-1-l.scorcia@gmail.com/
--
Luca Leonardo Scorcia
l.scorcia@gmail.com

