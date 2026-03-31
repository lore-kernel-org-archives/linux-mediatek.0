Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43366FF60D5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2026 07:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZwQ37QmKFOw/uTjbsYcIUcTXIElgAtvLmq04hj/OnUs=; b=JpEfSDZAevJaUWdPEX/J6WH3DU
	9bd9WkQEVyVaujmgmPvqTYJxREyghIDHuPDE2Fa14uadsdVnScPm9yT/gqa8Pyi8VvLO+BknnJKJV
	8Fa1CzHhKGd/9BsE4nAaMS+WJbhVBgPDQUIg87MNy5oIcYbLFN5iD4qqNShyGxHh7jXAZ4TbFxV6r
	SxYeV/o14DvTKYDN19ZNhXoudQC7D6oS3+0dJCYo8Xmzvg9J3tUQX+RCPHDcoCq//z/Y0yqfGA0kB
	oR9VA4gq6ns86O7Dj5s5ek28mgKXkRfLkqqWIxYkXF+3PIttk4cD6w0nWkLks6FzBiBeh5r26oq6P
	9Tzl+YGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7T6V-0000000CQNB-0Qgg;
	Tue, 31 Mar 2026 07:01:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7T6S-0000000CQMO-10mW;
	Tue, 31 Mar 2026 07:01:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2DB7C444DC;
	Tue, 31 Mar 2026 07:01:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 835A1C2BCB0;
	Tue, 31 Mar 2026 07:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774940491;
	bh=GzzLKAM7HohgpbhX7Jt24n8lQNb/+gcmxOQdZGYzy2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kYmtxUd7yP70LJIdwmBli+tq6dX5Y/2Ui7J8KZWxYW9ikaun9TIbA1m/EA8J+SYW9
	 vwVnbO7y4rfYzwYxb+LbfW8xjiauMSGmzVBZxEEQVokRa7chI1K9zj6mFIUPzHmf+A
	 TGBL+pcRCNUMQNHtrUZxU/ZWde7UQrqqv40ISXPLuQmJQjoqFrQo1wiXjOjRz3+uxk
	 vsVG18fyH9euB3nFroZB1rOteT63tE2UocB+NuSgJAfgUWdb1x2g9D/ANwV6ZFvtKj
	 ulAYXzoAIeEBXg7aTm81E3+SNZ8M6ZLm+2t9L+1ZbICGB7O9wNXW2PGbxoYOZBqh58
	 jB3U6aNVa/neQ==
Date: Tue, 31 Mar 2026 09:01:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>, 
	Val Packett <val@packett.cool>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Julien Massot <julien.massot@collabora.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Message-ID: <20260331-flawless-bronze-lorikeet-59a6ff@quoll>
References: <20260330083429.359819-1-l.scorcia@gmail.com>
 <20260330083429.359819-2-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260330083429.359819-2-l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_000132_299397_E83DA4AA 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Mar 30, 2026 at 09:29:35AM +0100, Luca Leonardo Scorcia wrote:
>            - items:
>                - enum:
>                    - mediatek,mt6366-rtc
> @@ -99,9 +107,6 @@ properties:
>                    - mediatek,mt6366-regulator
>                - const: mediatek,mt6358-regulator
>  
> -    required:
> -      - compatible

Not really, this affects existing ABI and might make the child schema
being applied. Basically regulators node can be anything now.

This is definitely not a binding we want. The syntax for parent schema
when listing only compatibles is requiring this compatible. You cannot
have here whatever empty node.

Best regards,
Krzysztof


