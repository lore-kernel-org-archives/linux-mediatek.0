Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B00C10F1A
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 May 2024 19:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEummqX/7CNV+npZQYwcX7ZinA5/ghMnMOmClzlzkyo=; b=0lV03SSANPqMjyGQP3nk7CIPyc
	81CAVpXQJsQRnwzciO6nR6JAvNa2ymlFTJbW5e6bJXlQVKXv0/sYZ41j8+POtGv026jChOPmjT30b
	6EPi3tuH5PMd82QCMOB34U6ZBcq+TVxEWel+h6fbHrbU4PiMuAkHHALzo+PqUT4bEDD+yU8zE1egw
	dU1Obo6a010n7FIgBhVEqoSu3HAv06Qf99jIun5mt0JmbZdsvCDkhx8e32ax2266zHIPy1k+HUsZR
	JTberZl5Zn3pZu4DeeuUOxnhYxuMR0RxzdXf7DNDXE9KcwwEfIMNZEE5axQr+i0r2z6Pt5eodKnw9
	wlBGiFQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Qcn-0000000Ca0I-3QDj;
	Tue, 07 May 2024 19:37:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Qck-0000000CZzM-3DTK;
	Tue, 07 May 2024 19:37:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 316CC6187C;
	Tue,  7 May 2024 19:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98449C2BBFC;
	Tue,  7 May 2024 19:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715110633;
	bh=yHasmc7IXw0fuXXWeaKDZcjOs9eO4PtyDEOjKl8QIqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HuMAi3Uo+48/zh7gwr6CF6sqB/AfQOyO29HbMEul4VDj+mQ7Cmo6jXTxix6coyh1i
	 nLF1WL9TejJJAdr9tSIihlfXLYdae8f7or4pYSmnGCl7B30sQ5va/ZrAM/mGUvrzh+
	 hVqgpj9vD86UYT85h9gB+9Qe6cnqHCunIIxxTNmzPH+lxCQsu9d1U1Izvs5OpZ8WDh
	 5g+8QxxeBRBav46kWSBcptZJjbf3yw96B6LnZTyL0f0/Tbsh4HXD7XHH8QVq2MT62Q
	 13S9SECt+eUSvdrfkUQHnch/t81uunAUy8i1JON93HEtJVlKWpCfyt2s138SOKa8Up
	 eaxAfVokPa3uw==
Date: Tue, 7 May 2024 14:37:11 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [RFC v1 3/5] dt-bindings: net: mediatek,net: add reset-cells
Message-ID: <20240507193711.GA933697-robh@kernel.org>
References: <20240505164549.65644-1-linux@fw-web.de>
 <20240505164549.65644-4-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240505164549.65644-4-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_123714_880485_FCB8FF41 
X-CRM114-Status: GOOD (  13.43  )
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
Cc: Pavel Machek <pavel@ucw.cz>, Michael Turquette <mturquette@baylibre.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-clk@vger.kernel.org, linux-leds@vger.kernel.org, Tianling Shen <cnsztl@immortalwrt.org>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Woudstra <ericwouds@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, May 05, 2024 at 06:45:47PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add missing binding for property used in mt7986a.dtsi.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  Documentation/devicetree/bindings/net/mediatek,net.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> index e74502a0afe8..5214927c0fe8 100644
> --- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> @@ -101,6 +101,9 @@ properties:
>    "#address-cells":
>      const: 1
>  
> +  "#reset-cells":
> +    const: 1

Also fixed already.

Rob

