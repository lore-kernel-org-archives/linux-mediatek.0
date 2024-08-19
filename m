Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41252C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Aug 2024 19:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ca9zlKH+Q7bU2XT4fvynhJpHFuCG3NuFNg7EfuIWOp0=; b=NpVYVEysHUY1diY0vWLJ9axmLV
	NMQfHK2szXsS3yOoUIaBS+I/pXgzCL39/VMxY4sWWqcNXu5QcwL/JtMK9tVuZrF2qH5iC5rnroM68
	F6VCAWm93Z+0nJxbnJmL1fP+fvv9Fg2xd0IjlmZIBT8wP3KtsvdzYUGrfqelfJugjiYHlT0z1wkc5
	9r3uyPJFypPt37RWN8yWMevwDh5dIL2eU/zL0CZeTaqV5OiZK0Wd39ImcmPvR+EmmfPjwnSkRVEPd
	vk4C8dWuKTQzwza3RqAv70r8OBYnQ/O+vXBrpa81u1Q9k52C88Pm8BZwRSBpoEXt9iqvGpGMfs86y
	AmIUGzGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg8FL-00000002ksu-3m6r;
	Mon, 19 Aug 2024 19:40:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg8EA-00000002keR-1aUg;
	Mon, 19 Aug 2024 19:39:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C463D60C8A;
	Mon, 19 Aug 2024 19:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358B3C32782;
	Mon, 19 Aug 2024 19:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724096381;
	bh=Nvm/PgOp1CtTfrld3rrYgbfJrfZpStaSgqLXHx2UqMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XulFbR3mkxtGByoAg3Xfj7XL2pAwdpy2gCjkwHZFO8EEGXB5xgy9bXxOunlwGwL4D
	 3jxGeLaFosIAb5xYnILDYZLVVG3kxe/5L87/Wthx05mI9AjGSaHik2ahGHPLQq3dLE
	 hH0MqB+5i51jpELdJ2ETl/ALiTqrSRkFSNsCO0bMG5urroZQ50EELBsTFdZ4J6CfL+
	 oPvD6rntWuXnGO3MLQuGodHpuyCavK+wfHo+LU5J0M6uMY4VPsqAlI/8qPODQosGtT
	 0X2Vy+nf9uMlgDvRtvEV0FPeWKGMBI8P4AeqocgHiU1vjIfHzzh3Lwsao6ESA91O+f
	 9R9t9PAlShLww==
Date: Mon, 19 Aug 2024 14:39:39 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Johan Hovold <johan@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Daniel Kaehn <kaehndan@gmail.com>,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/6] dt-bindings: add serial-peripheral-props.yaml
Message-ID: <20240819193939.GA2371766-robh@kernel.org>
References: <20240811-dt-bindings-serial-peripheral-props-v1-0-1dba258b7492@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240811-dt-bindings-serial-peripheral-props-v1-0-1dba258b7492@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_123942_542689_33523EE3 
X-CRM114-Status: GOOD (  15.75  )
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

On Sun, Aug 11, 2024 at 08:17:03PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> Add serial-peripheral-props.yaml for devices being connected over
> serial/UART.
> 
> Maybe the schema should be rather called serial-common-props.yaml? Or
> serial-device-common-props.yaml?
> 
> Dependencies/merging - Devicetree tree?
> =======================================
> Entire patchset should be taken via one tree, preferably Rob's
> Devicetree because of context/hunk dependencies and dependency on
> introduced serial-peripheral-props.yaml file.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (6):
>       dt-bindings: serial: add missing "additionalProperties" on child nodes
>       dt-bindings: serial: add common properties schema for UART children
>       dt-bindings: bluetooth: move Bluetooth bindings to dedicated directory
>       dt-bindings: gnss: reference serial-peripheral-props.yaml
>       dt-bindings: bluetooth: reference serial-peripheral-props.yaml
>       ASoC: dt-bindings: serial-midi: reference serial-peripheral-props.yaml
> 
>  .../devicetree/bindings/gnss/brcm,bcm4751.yaml     |  1 +
>  .../devicetree/bindings/gnss/gnss-common.yaml      |  5 ---
>  .../devicetree/bindings/gnss/mediatek.yaml         |  1 +
>  .../devicetree/bindings/gnss/sirfstar.yaml         |  1 +
>  .../devicetree/bindings/gnss/u-blox,neo-6m.yaml    |  1 +
>  .../brcm,bluetooth.yaml}                           | 33 +++++++++--------
>  .../marvell,88w8897.yaml}                          |  6 ++--
>  .../mediatek,bluetooth.txt}                        |  0
>  .../nokia,h4p-bluetooth.txt}                       |  0
>  .../bindings/net/bluetooth/qualcomm-bluetooth.yaml |  4 +--
>  .../realtek,bluetooth.yaml}                        |  5 ++-
>  .../bindings/net/{ => bluetooth}/ti,bluetooth.yaml |  5 ++-
>  .../bindings/serial/serial-peripheral-props.yaml   | 41 ++++++++++++++++++++++
>  .../devicetree/bindings/serial/serial.yaml         | 24 ++-----------
>  .../devicetree/bindings/sound/serial-midi.yaml     |  3 ++
>  MAINTAINERS                                        |  2 +-
>  16 files changed, 80 insertions(+), 52 deletions(-)

Series applied, thanks.

Rob

