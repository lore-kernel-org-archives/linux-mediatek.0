Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20765C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 22:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GEwjeeO4+xsKSb63X8/1ZAmB/dAdMZgdy0JQ19w3CXc=; b=wmQs5VLqzHi71c0rLvLnxc6ALd
	frjTL9wz1Gblkxacbr1Uwa643qUKR6nUaVbBciUv8zoKmGkOhVXHFQ+MK0Uf8PdskzAJMNTmKi/P7
	toop2vCdi3qSrw6gDfywFWaOSu7p+9m4kmF8lW+WA/qpdS7s/6oBzqEs3DotAdO0DzyGfGnYkXLqt
	BiDWSmHhzi78B4SBNggM4iCLbJPBMHa2Z40YvbL8awgY7BQ80BSI1V6QN9ZyxQOhZrX41eNidqDU7
	RUcWlLuvW2aJKb39qFKVG4mtYvsnnV9gssowWbaf6kkQizZl9AOw2DeK9TQ6qkeJw5i8/FfYf0MKs
	22+eEPBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sf5pG-0000000EF7J-2zBC;
	Fri, 16 Aug 2024 22:53:42 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sf5oa-0000000EF50-2EWY;
	Fri, 16 Aug 2024 22:53:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B1A8ACE1DAC;
	Fri, 16 Aug 2024 22:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC7BCC32782;
	Fri, 16 Aug 2024 22:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723848777;
	bh=8DDeC1Xe7fCa3QZwCHDRLsEPNaCzKydJaYmyPNmvTCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iGbZuz/YjNrLSltqIoaEoV1mBiKn9M1Dw8zMz1Xvme5i6npcryIJQVZw6CtogXpm9
	 jOMy77y6DWB9SKRozIpKqWWAICb5e7QR2cQQmyv8MOBiNrKj+Ka1yhLMa8+kVXnRsf
	 A/c+i+84JCeDGMuX8CWvJSanoWCsEQISjZ9v0rTE4lnagXMD04qFNmlRYDXq2f0Lw8
	 7RlxKGwZ/Y4u2Do5f55+fd+9xCyzEtUDmzyu5DjB4A6xnKVBVGQWSXMJop2eHJHneY
	 EXcjlogrCnGedNqSrwpC7oAEy8h778MSkQjx7rBjFl2+jQ7qn7+Em5Uc6TjY2u+oTd
	 EGuynJmfAQRdQ==
Date: Fri, 16 Aug 2024 16:52:57 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org, sean.wang@kernel.org,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	krzk+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com, conor+dt@kernel.org,
	ansuelsmth@gmail.com
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
Message-ID: <20240816225257.GA2411475-robh@kernel.org>
References: <cover.1723392444.git.lorenzo@kernel.org>
 <0d537e88b64847bc4e49756b249b2efdcf489b92.1723392444.git.lorenzo@kernel.org>
 <22144671-fc7c-4cb2-8bb6-ee7d3fbfcb0e@kernel.org>
 <c8a74be4-be63-477d-9460-1d5ef5e3d84a@genexis.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8a74be4-be63-477d-9460-1d5ef5e3d84a@genexis.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_155300_769121_85BF04DF 
X-CRM114-Status: GOOD (  13.22  )
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

On Tue, Aug 13, 2024 at 10:06:41AM +0200, Benjamin Larsson wrote:
> On 2024-08-12 08:48, Krzysztof Kozlowski wrote:
> > > +      pio: pinctrl@1fa20214 {
> > > +        compatible = "airoha,en7581-pinctrl";
> > > +        reg = <0x0 0x1fa20214 0x0 0x30>,
> > > +              <0x0 0x1fa2027c 0x0 0x8>,
> > > +              <0x0 0x1fbf0234 0x0 0x4>,
> > > +              <0x0 0x1fbf0268 0x0 0x4>,
> > > +              <0x0 0x1fa2001c 0x0 0x50>,
> > > +              <0x0 0x1fa2018c 0x0 0x4>,
> > > +              <0x0 0x1fbf0204 0x0 0x4>,
> > > +              <0x0 0x1fbf0270 0x0 0x4>,
> > > +              <0x0 0x1fbf0200 0x0 0x4>,
> > > +              <0x0 0x1fbf0220 0x0 0x4>,
> > > +              <0x0 0x1fbf0260 0x0 0x4>,
> > > +              <0x0 0x1fbf0264 0x0 0x4>,
> > > +              <0x0 0x1fbf0214 0x0 0x4>,
> > > +              <0x0 0x1fbf0278 0x0 0x4>,
> > > +              <0x0 0x1fbf0208 0x0 0x4>,
> > > +              <0x0 0x1fbf027c 0x0 0x4>,
> > > +              <0x0 0x1fbf0210 0x0 0x4>,
> > > +              <0x0 0x1fbf028c 0x0 0x4>,
> > > +              <0x0 0x1fbf0290 0x0 0x4>,
> > > +              <0x0 0x1fbf0294 0x0 0x4>,
> > > +              <0x0 0x1fbf020c 0x0 0x4>,
> > > +              <0x0 0x1fbf0280 0x0 0x4>,
> > > +              <0x0 0x1fbf0284 0x0 0x4>,
> > > +              <0x0 0x1fbf0288 0x0 0x4>;
> > Why are you mapping individual registers? At least half of these are
> > continuous.
> 
> Hi, this is by design because of the register placement in the gpio block
> and the fact that the pwm functionality is intermixed in there also. As
> example the following registers are all GPIOCTRL:
> 
> <0x0 0x1fbf0200 0x0 0x4>,
> <0x0 0x1fbf0220 0x0 0x4>,
> <0x0 0x1fbf0260 0x0 0x4>,
> <0x0 0x1fbf0264 0x0 0x4>,
> 
> To simplify the driver code logic the complexity is moved to the dts because
> of that.

DT to OS is an ABI. Don't put the complexity there. The driver is easy 
to change.

Lot's of h/w blocks are just bit soup. This is not special. If a few 
regions is helpful, then that would be fine.

Rob

