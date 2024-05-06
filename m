Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75EEC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 08:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TmFzsPThFTZVil5iGqbx3Z9kbbktmZ6ossWtR6tAl/s=; b=yzV2O7wp5eFOKlb1NnhFDsAgYm
	h1EgmNDlysEpXpnLIIkmbt1Y4XpPKK+JN/kvYhtYFAgW8bhS9fi3S4dd6zqERzTjye2AYJtwe4mU/
	Z/LLh023xDkIJf0iek9xV1GhRxE8+j+LZy2YzB3NxEBOJzdZlmIY735xRCOAdF3V9V/QmEhsWfluy
	yXgUzO5CoV9WCzL/H6l1fOvES2ceM8fHIYiZamKILixCi6tJL+UlVMwrd+DUwhAiLYOFLRg4T2w/H
	TOx9xbzaugDL+8H2d/SrB0BqIjfqwMzVaw4iHQ12hHQ0kKwIzN97+lgYrFLwP535luMSOXGKYlot8
	yH0QUxWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3uCC-00000006iy4-0gRV;
	Mon, 06 May 2024 08:59:40 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3uC9-00000006iwz-3YEd;
	Mon, 06 May 2024 08:59:38 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1s3uC1-0000000057d-1grd;
	Mon, 06 May 2024 08:59:29 +0000
Date: Mon, 6 May 2024 09:59:25 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, Tianling Shen <cnsztl@immortalwrt.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Eric Woudstra <ericwouds@gmail.com>, linux-clk@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [RFC v1 1/5] dt-bindings: leds: add led trigger netdev
Message-ID: <Zjib7STAHIikWnLp@makrotopia.org>
References: <20240505164549.65644-1-linux@fw-web.de>
 <20240505164549.65644-2-linux@fw-web.de>
 <8e9fd4c9-f537-4413-b8c8-988b001b64c0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e9fd4c9-f537-4413-b8c8-988b001b64c0@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_015937_903467_3CDCE6D7 
X-CRM114-Status: GOOD (  17.83  )
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

On Mon, May 06, 2024 at 10:18:09AM +0200, Krzysztof Kozlowski wrote:
> On 05/05/2024 18:45, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> > 
> > Add led trigger implemented with config-symbol LEDS_TRIGGER_NETDEV to
> > binding.
> > 
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> >  Documentation/devicetree/bindings/leds/common.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> > index 8a3c2398b10c..bf9a101e4d42 100644
> > --- a/Documentation/devicetree/bindings/leds/common.yaml
> > +++ b/Documentation/devicetree/bindings/leds/common.yaml
> > @@ -113,6 +113,8 @@ properties:
> >              # LED indicates NAND memory activity (deprecated),
> >              # in new implementations use "mtd"
> >            - nand-disk
> > +            # LED indicates network activity
> > +          - netdev
> 
> "dev" is redundant (there is no flash-dev or usb-host-dev). Two network
> interfaces are already provided, so your commit msg must provide
> rationale why this is not enough and why this is useful/needed.

Also note that using 'netdev' assigned via DT via linux,default-trigger
currently doesn't work well. This is because the assignment of the trigger
from DT happens when the PHY is being attached initially, and that's
**before** the network device is registered with Linux.
As a result, LED event offloading is never used if done in this way.

I know that bindings and implementation are two different independent
things, but yet I believe that adding bindings for a feature which doesn't
really work would be misleading.

