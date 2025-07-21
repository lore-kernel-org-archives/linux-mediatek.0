Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BEE5C83F1A
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jul 2025 10:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3yINSIYOKnlG72q+H8TJGwWdSKvTYXgBsNmDnQteh6E=; b=URxrMQK56jy19fgWuu+lBfyDd1
	XDZwWHAhX6+kRmxHfA7JylLZM7vqbtDWFsngSievh5LKY4mRoeg+ZOC0kFUR3x8Gs7CzIiydgMHzQ
	q1a8s8bBjf3KgFM6H1SltTzB4yUa5jqP6VKKum0FO5ws9JSOHWC3U48wZfQuprJwpl05nc0CYSYWT
	10P4H5po7uHgpFo01tERBUdLffHHPrQH5r0r62iSnRU0jokRr9GAiGvnzl4kwNvb9qR5qCfLuIhRz
	vHTMy1CywZLl0qL9gOcMZ8mD2CXeTWOTSr9O+guFB00WPmn9u98vkYh+qqswG3NTrQZ/8P7zCzQ+h
	KRObMmgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udna3-0000000GwVd-3pI6;
	Mon, 21 Jul 2025 10:17:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udmsO-0000000GoiM-2KjM;
	Mon, 21 Jul 2025 09:32:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F5E143416;
	Mon, 21 Jul 2025 09:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67591C4CEED;
	Mon, 21 Jul 2025 09:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753090324;
	bh=tMQd51DR2PhlSANSMzu8tnUKCfa7HWDsrUeedOQDGV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YAoj0vA4RH1GRqkxXn895QzFv0xG59k/y01og9h9chrcRef6I1zl+kY8HjU/CScJO
	 fY6cqeDqwoJnAHxHg5TT0pPw09FzspU5f5hyj8JuGqtHfoWALjOkzT+D1yKkCVCLir
	 LkmBbUIU1HkWq/06QbM/t0zB4AjvW2jMyvv0tuPNjzt/l9bsiKFDea2bnq8JBtnwn4
	 lEN+sm57+hqBfZ91Bs8LemSMzLfr5/ulb8jaQXyTYeM5sbgAtv1iZnB/jRYbe2Olce
	 X0eZUchellO9l6S2rSHcDoS8eZy12eh7DMSKJ4kpvXVOYnAbij6mH1lfnqStNVZ6KI
	 bFeg8JqF8qZPA==
Date: Mon, 21 Jul 2025 11:32:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stefan Roese <sr@denx.de>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/5] dt-bindings: i2c: mt7621: Document an7581 compatible
Message-ID: <20250721-amorphous-perch-from-jupiter-cecfaa@kuoka>
References: <20250719125617.8886-1-ansuelsmth@gmail.com>
 <20250719125617.8886-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250719125617.8886-4-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_023204_615021_3B0DA6F9 
X-CRM114-Status: GOOD (  14.49  )
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

On Sat, Jul 19, 2025 at 02:56:13PM +0200, Christian Marangi wrote:
> Airoha SoC implement the same Mediatek logic for I2C bus with the only
> difference of not having a dedicated reset line to reset it.
> 
> Add a dedicated compatible for the Airoha AN7581 SoC and reject the
> unsupported property.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/i2c/mediatek,mt7621-i2c.yaml          | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
> index 118ec00fc190..38118007b601 100644
> --- a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
> @@ -14,7 +14,9 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: mediatek,mt7621-i2c
> +    enum:
> +      - mediatek,mt7621-i2c
> +      - airoha,an7581-i2c

Keep list ordered.

Best regards,
Krzysztof


