Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7039C76196
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 00:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FiulECJ717UIjnEQ/bfZ3fY+Qq9nK5MwD1KFG6BtFFk=; b=0oVI5eF6KfNMAQKFewroulLHGp
	aBZedVpC3u/HQKOioXsIGWAqKRM0VhTPlZP+6ZnBtRGiJ/CCeqgcDWW2j7IJ/lWjal2pZ5Q/MZ+rS
	/UUfOl2vGyPEk05PCtCK5mRnjik9PBUD9qegU48M8yUfMbDmW6Ff9hQJkkG2a51Gn0fYikeWoE9Kg
	12gaQoq1oyq85+tu8UdDtbmiebgJp1z5W1PMbncsHXCI2nlWEqnWeVYAWlHdkhpToB3nOSPtiZALR
	q/lXqrIfviPIZc8va0csnpiM8ZsqmkuIm2yhCigIvZ1OWU+S82cGiFOw22OSgTz9Xpni2hePqGATg
	vhCCmdWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piOkX-009GpM-0o;
	Sat, 01 Apr 2023 00:05:41 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piOjy-009GNG-1V;
	Sat, 01 Apr 2023 00:05:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 33D7ECE2EE1;
	Sat,  1 Apr 2023 00:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82189C433EF;
	Sat,  1 Apr 2023 00:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680307502;
	bh=FiulECJ717UIjnEQ/bfZ3fY+Qq9nK5MwD1KFG6BtFFk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=fkRdnMTc8/3djIwBOqEeF1Gn92PqmCT3YjNtsBSXPe5kfXrojtLcM/jRztv5sFtq0
	 Mvn1+sZ3PhAUcgfY4IRtyKZQk43hX/AOzF5STViO+sqPN0oFLBEBimIvss5mXZUCXt
	 VwBo+1Oyf+r7egP3Ojvc8o9/w2HVk5zjqkbFlo5v3pVx6ENGcY15PTRpWNfAdTQfRq
	 Z96Zamp2D+H0oG1mSju3AhWVeaQgo+LH7O7GqSmXnyeNKWFDjMPOIoNYWh536xK/5L
	 tRw4wbJkr6KjJ4lgA3dWrrAKiVsBAcVNc62f36OXUxEMmcnWqizryBuYtbNawDaQps
	 KdoKxTosntxKw==
Message-ID: <27c6d46fbd56a8d91a803c33886282ae.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230331123621.16167-19-Garmin.Chang@mediatek.com>
References: <20230331123621.16167-1-Garmin.Chang@mediatek.com> <20230331123621.16167-19-Garmin.Chang@mediatek.com>
Subject: Re: [PATCH v8 18/19] clk: mediatek: Add MT8188 imp i2c wrapper clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, netdev@vger.kernel.org, Garmin.Chang <Garmin.Chang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Garmin.Chang <Garmin.Chang@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 31 Mar 2023 17:05:00 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_170506_708344_1201AE7C 
X-CRM114-Status: UNSURE (   7.09  )
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

Quoting Garmin.Chang (2023-03-31 05:36:20)
> Add MT8188 imp i2c wrapper clock controllers which provide clock gate
> control in I2C IP blocks.
>=20
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

