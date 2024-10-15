Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D46D1F9C6
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 20:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bnovl7mhsVUYgyGCl10tPPZ3p9Byxc7FghXpXb9oV4w=; b=i/PCHYaA/zrFj/NkucBRCBDGmh
	9vR/e7GecTO1MQb9fjE3RN9rU6jNUbPp4XINfin4RXYTYV3ecuKylGg2VrgRp6E0hCUYQ8CyBcxRA
	ts7hLSeub50PqbVe/Fw1gOKgQNxYBV9gXxpIVjPWh2zaj3huCtDfEq4NoZdiDIS7Q/0wQW7WNRprD
	cXWhCeDGas5R782x+6zo7dbUwskdSrEsQgZEpy0rGogQOWUCrbqIcY9YSnRPNThAI1u3qsEnR2RYF
	UCVOtOsBLsXEmPH3jtIfWtnnURVNUl/ZVR4XLwy//YQcKrc7VTZ72H/YIDaKBXbWaCzMWxtU0IU7L
	q8hnQMbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0njc-00000009Sbz-03le;
	Tue, 15 Oct 2024 20:01:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0nhX-00000009S9l-0Edo;
	Tue, 15 Oct 2024 19:59:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 53B2BA434B9;
	Tue, 15 Oct 2024 19:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C3BC4CEC6;
	Tue, 15 Oct 2024 19:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729022366;
	bh=EMfBa+kZ3Nwqgly7t1kejexdHZzYJ3YfJ+fRC7UKu0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MnrM/xUuog6hHfkqZzJwRbWtVg3sMCQ5DbWbGishz973zmU8BBrbYkfsvzdPTMCtp
	 AzZIr90aVIrFGZoDMXB90Zq0nUSInpwZu23vliTqKSfWRBJhtUlQ2gClKVdameMTdU
	 fLYy+uBj5+XfmzxDqbNzMp4lNZNJvsxXsURVgz/p4+JQA2wlRND+1f6soGksfO+Yon
	 d1cc64JRQXa3WrULBi1hV+shEu839J+8LHS/oHlB0ME6XlORlxazKAeAybv+bFGICC
	 FKE6jmHkx8qauLjY79aQ9kje2zgLxT/dYNsbX9HgDQ/4A9RctfyLzrG4RkZ092x3Es
	 DADvLz6ddUopg==
Date: Tue, 15 Oct 2024 14:59:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-mediatek@lists.infradead.org,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	upstream@airoha.com, benjamin.larsson@genexis.eu,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pwm@vger.kernel.org, ansuelsmth@gmail.com,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v6 3/6] dt-bindings: pwm: airoha: Add EN7581 pwm
Message-ID: <172902236421.1701795.14798814698922784274.robh@kernel.org>
References: <20241013-en7581-pinctrl-v6-0-2048e2d099c2@kernel.org>
 <20241013-en7581-pinctrl-v6-3-2048e2d099c2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241013-en7581-pinctrl-v6-3-2048e2d099c2@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_125927_799315_E74DD520 
X-CRM114-Status: UNSURE (   8.88  )
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


On Sun, 13 Oct 2024 00:07:09 +0200, Lorenzo Bianconi wrote:
> Introduce device-tree binding documentation for Airoha EN7581 pwm
> controller.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../devicetree/bindings/pwm/airoha,en7581-pwm.yaml | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


