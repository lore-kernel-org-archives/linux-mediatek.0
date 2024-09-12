Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED83EED617
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 16:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gF710t5JWz6krDpN4bAmAu6kbw+sgXtobcCu70VkUao=; b=P4v47qViyxko37VtOm8ZDh9Die
	AVFJUYP4EMd9fMKQpHuih70o81Swjow4C3l/ldx7XRL5TM610LH43sMBGADtYdgkYSVGHM7AoXeTn
	Prym3sCy/3nOf/Jt8mUAbBXvRmNODsQaiwcHZW910xPS5T/XfL4eLmZFz+CHkskcS7csU9HePjdxw
	VwmVqVloZura7zJAmKK98zCwPKL9QUPx2o3Ujzho7H+5LuQbP5TZvkmy0E9kPhCw4WpQIop6Nk+Jk
	pVH3H8As+qhm0K/fUozpD99zBp8BfH+xJzurfXca1btnhk+9+FO84fIDXpDPoC8fg3P4LkWMSY+uj
	hKxmK8nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1somxV-0000000DkU1-3Fgl;
	Thu, 12 Sep 2024 16:46:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1somwF-0000000Dk44-3to4;
	Thu, 12 Sep 2024 16:45:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 64FD95C5A06;
	Thu, 12 Sep 2024 16:44:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87591C4CEC3;
	Thu, 12 Sep 2024 16:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726159498;
	bh=cQOBR1RFFJm2nw3OSuvbO0QAyXdcXwsUsCSGIOSeBZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QmbP61qR54CqLXNE72/2T1Gh09yTKcsW6iN6O2WsmjMFmrZdDHukqG9VR5ZFS/ZES
	 86oR8afTlD8zvpqzrQ7T71KSeYdkDjxwdEtY2AfoVv2qIsIoXkszp3gvpDdDa3jSki
	 AEa2e05nQrqpVBso9AH5DmyfG5uGHRqAbW9XVJIyB8XfojTKxwsOpsddwi//yuvm1I
	 IV0dlHj3LLObqExc0wi7Z5etE5TIUvLf682w3JxBz2N2TeN34HdUXxtjcfburwcC/o
	 dOstkNvb8xwlR2rUW9J9adWEY/E6EbnX22a+7jahFJG3QXIxvBAYosSkU4k6VZCq7q
	 9QopKYXzChmLg==
Date: Thu, 12 Sep 2024 11:44:56 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-pwm@vger.kernel.org,
	ansuelsmth@gmail.com, Matthias Brugger <matthias.bgg@gmail.com>,
	benjamin.larsson@genexis.eu, linux-gpio@vger.kernel.org,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-mediatek@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
	Lee Jones <lee@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Subject: Re: [PATCH v4 2/5] dt-bindings: mfd: Add support for Airoha EN7581
 GPIO System Controller
Message-ID: <172615949582.3911596.4077414513470594513.robh@kernel.org>
References: <20240911-en7581-pinctrl-v4-0-60ac93d760bb@kernel.org>
 <20240911-en7581-pinctrl-v4-2-60ac93d760bb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911-en7581-pinctrl-v4-2-60ac93d760bb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_094500_060764_6F5798C0 
X-CRM114-Status: GOOD (  11.89  )
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


On Wed, 11 Sep 2024 21:50:02 +0200, Lorenzo Bianconi wrote:
> From: Christian Marangi <ansuelsmth@gmail.com>
> 
> Add support for Airoha EN7581 GPIO System Controller which provide a
> register map for controlling the GPIO, pinctrl and PWM of the SoC.
> 
> Schema define cells for both gpio/interrupt controller and PWM.
> Moreover it provides a dedicated pinctrl node for pins and config
> definitions.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../bindings/mfd/airoha,en7581-gpio-sysctl.yaml    | 433 +++++++++++++++++++++
>  1 file changed, 433 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


