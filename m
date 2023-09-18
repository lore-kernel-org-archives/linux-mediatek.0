Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B324BC46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 20:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ml2kkY1d1Oa1BMFOcizFrXpw8UPU0TUZTsxm0nPwMA8=; b=IFxpYwKOaXxxwjei8T0TDyiEjP
	Ka2XgN7ospeh9Wc461NwZcBn/ITOMc8x4nZG8FZc0DSZ1VMXC2Gqwxs1QjYPfAXMDWfbAvv/cgk3G
	JzVCHX4SNoUy9OYaJyxcUpnfaXpZDXAMfpub44rLQR8+ZyNMSZFZIaApGQaZPmXeD227mMYAKFD0l
	gwx/sGVBBdIXNRskABPErOvzlUWkHUEdH+uFMSewjKU8gyvZ4KM2U86/mcHwuKFXLTU6Ot/wUuMgp
	0FCR7lkxseSgquPb+u81kUjj3+X1FnZHbYbd4i0z3ySl/a3ge1WwP19yIl3GuIXpZjAG7w3/hRuxj
	qyiyFwDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiKtJ-00GHj8-28;
	Mon, 18 Sep 2023 20:30:45 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiKtG-00GHho-2U;
	Mon, 18 Sep 2023 20:30:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4458CB810E2;
	Mon, 18 Sep 2023 20:30:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C1CC433C8;
	Mon, 18 Sep 2023 20:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695069039;
	bh=DprrhIgDzelvIyTWIr8SzEXHEnNRh4jr4L7DY+L6emo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VJlG/awENwdxcwFxJlc1MwJX/+v8YirCPiKNbHUqYoI+WJYdYGzrFuwaEnwhPGEzm
	 uDdDiWxLHbqUFiaI7vJgUVzqgWy048P7VX2iQ9s6YhYd0N5HzuH/AHo/+CyUcMFI95
	 GQymhqgdw9mXMdTK5n+6Jq7WunLJocXlxyBs3Mtv1VLggfn9nvHpj7rhHLi25Sy3S6
	 SNRajqFCrNxC0RrXgaF9vw7SALDJ7DnKkJgzKr7cnznuMFbA46ME41Xxxn1jVvgyKu
	 jeD8UvDWPtdAj5+NnHnUvcit5++VQCOpTiROFa5ayQHCBeuGtHZbrk9hmVU0p6g9T/
	 iv7lM11J5EcUQ==
Received: (nullmailer pid 1723759 invoked by uid 1000);
	Mon, 18 Sep 2023 20:30:36 -0000
Date: Mon, 18 Sep 2023 15:30:36 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: netdev@vger.kernel.org, erkin.bozoglu@xeront.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, mithat.guner@xeront.com, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@nbd.name>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: mediatek,net: remove
 reference on top level schema
Message-ID: <169506903453.1723676.13767276753325939381.robh@kernel.org>
References: <20230917124723.143202-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230917124723.143202-1-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_133042_943606_CC4BEB39 
X-CRM114-Status: GOOD (  11.95  )
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


On Sun, 17 Sep 2023 15:47:22 +0300, Arınç ÜNAL wrote:
> The top level schema does not represent an ethernet controller, the
> subschema defining the MAC nodes does. Remove the reference to
> ethernet-controller.yaml on the top level schema.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  Documentation/devicetree/bindings/net/mediatek,net.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


