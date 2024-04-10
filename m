Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18D4CD128A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 18:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1RQDj9iEJSO584+2M+cJTmEzdDUfR25bucjcdJa0ATQ=; b=FACITqcImtnxfICM5Yx9/z5Q8A
	U+EJflJNxD7YiURt1FQ3RHIbkgyZ4TqtUHvZVj9WhNWImE2iOAqexWKFMVo4Q+BHRnxNHq4qVZKkC
	dI6GSP+34AdjIDme2bmbJEw04JLw3OwwoArZyAZKTgafxXSVlhYOTzQL1SB0PkTpiXjtuBf2DFbvr
	TgJmOoX0jNyIZvc8LjgZM4fq2RjHXn0+ob0BWhKLuQqLcet0JMd8IMyyPXQnNvRxFNimXgS2zNsFp
	ISI13yTKAFhHowuGluWy/PxV2+ofzLPwunZDhiUDef8uqEPEg5sQT5sxy5KCofOS9wmlamQ1vXwd8
	CIuJ3YpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rucGk-00000008OlP-1fHk;
	Wed, 10 Apr 2024 18:01:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rucGf-00000008Ojz-3Eh6;
	Wed, 10 Apr 2024 18:01:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3960E61E27;
	Wed, 10 Apr 2024 18:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD29BC433F1;
	Wed, 10 Apr 2024 18:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712772113;
	bh=MZz1uscgJjUE91n5tjQi9OI3q1nd+HG3AgIM789afzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AINa+PdNFp2FCpEmv4ZIW+885N91+KeYCUrAbRLFpl4pInTP8rlhn2mkDVfSsGCsR
	 z806KoDPRzdBHefAaGd2TRxSL7hWDmJFKoZWRYobgjg+vnc/mxKc/Pm9qDuuH9ACxC
	 f1eVJ5+U++lOzsq6HK4ZAveKtAviN/DRE0eSjuE3ohKXpI7QpqIxQCEZ2rYBwgE+fL
	 19I9oUKzh3N8ZPrJifJ1GaBXV7uaPFAnAn3pjsqW2FyNCw9OB3LdQfI+czpnWVsiCe
	 1y6VRlLNokRsjeU+Zr/60RPDs5+TzGECHdxxQNx4w1sXerguZKGL6LQ29r5mY7TFbK
	 xNoahGyNrXH3w==
Date: Wed, 10 Apr 2024 13:01:50 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: mediatek: mt7622: fix array
 properties
Message-ID: <171277210827.817137.5601296332288288674.robh@kernel.org>
References: <20240408090506.21596-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240408090506.21596-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_110153_880176_7EC56D47 
X-CRM114-Status: UNSURE (   8.93  )
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


On Mon, 08 Apr 2024 11:05:04 +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Some properties (function groups & pins) are meant to be arrays and
> should allow multiple entries out of enum sets. Use "items" for those.
> 
> Mistake was noticed during validation of in-kernel DTS files.
> 
> Fixes: b9ffc18c6388 ("dt-bindings: mediatek: convert pinctrl to yaml")
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../pinctrl/mediatek,mt7622-pinctrl.yaml      | 92 ++++++++++---------
>  1 file changed, 49 insertions(+), 43 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


