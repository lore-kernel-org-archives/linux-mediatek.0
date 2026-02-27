Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2755FFEFB70
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Feb 2026 17:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIpo4Qj00b6qJvtZCixbXNb6vReXLlefaIzRQdEaQEs=; b=sc0VXbhvcGuFFhexFwpp7pSYSA
	Nq0qaihsqmboT90rL1/f2it6ieVukS7G3KJk87FqGU1IQADfdvrDV43jgpBpLB3PC6KVJqESkQHFH
	XsIFZEZIfKDdlXygQ8x1zEpF9D1OEjiJzQdy/suJfUloHWThgWDdUnAe+qruH+pFcwnz+rUFBeLJk
	JWJolL9i9BvtrnyKjsy9cUre6uu0khFakh8SAYt/w30RK7p7gsomDEbRryG54+Wy7Q/ZGq07f8TZ/
	bcLA4aWwBqAR4GdIp45ZSXFDMFKigv2gBBwaMdZAG2Y4cILhO3A8selG2tble3CaoZE3jMe7+j/5k
	Za/++2nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1bS-00000008o2k-2C6M;
	Fri, 27 Feb 2026 17:26:14 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1bQ-00000008o1m-2uHu
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Feb 2026 17:26:13 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-437816eae24so124136f8f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Feb 2026 09:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772213171; x=1772817971; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uIpo4Qj00b6qJvtZCixbXNb6vReXLlefaIzRQdEaQEs=;
        b=OMP1RDJpijou2yo9S3zIG8p1cx3Uibzk/LbN7H/VCLfx23GXcsegxqC/SEyqzQlJKZ
         TTq7WQljuKOacyrXdMgC2pBX/ZoH3HlVHn8irW1ON4HCj43Q7OmGDGo3XifPpVhILjZs
         lbeNQ9SYbMynIDG6rXgSB15vtNVz+ZIvpEmr7XRdbeA5Ll6TMktYy1RiNgDsAK7vZ2BP
         5ON7QWs0TqQiD6pN2zSVNmLWKwe02R4cqUVSZwgMSbEty1IbbmYs+3BynuG18YnAExGk
         zG61sIso5i8YV7dcni+AzlgkXklTD9vEPq/hGrcycZPE2AfCqASimlY8nKCYl+0Ar04p
         h7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772213171; x=1772817971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIpo4Qj00b6qJvtZCixbXNb6vReXLlefaIzRQdEaQEs=;
        b=IEbNOHfi0x9ip+mwOdkanBsOZcq0/dUcJEVueB9uZ/ihk9jq2T4RRSC+WcBcYcf2gK
         nO0qv6W0WtjG+Slkx5jou2PV9RHvhJNpsqUR11ozwqC1xEv2SuLhXfu4vj0Qm2GQJP7c
         bzGxON6pawfFrUKvWV+0PE3D5V3feqMTdyszGOy+fZbfs8Evvcm3Xgl/Nl1Owfk/aap+
         uYfsw//7LgQS72TLn4LpXMANofMfNVWzwHfyAJ+lcD0k9gekkft6O7RHEI7Y9HaoO8R/
         01sLLvgNPIQ6mZFPNMdAfP+3lvbWHkHMDKeqO3UGqJXLVBhIZGX6auL0OU5bvFQPhEoY
         SxQA==
X-Forwarded-Encrypted: i=1; AJvYcCUarUAMuknKTSYpILf1eWDnrM2m82/XF5NsnsDoIdo5ni8FBn4LNxz2J+sVUx1OuLkC8AGIrNFKy3NspDLqkg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/cRhRTw8TB6F8REK1fYE1nfx9lFriAFHVA3QixEfs5QtWrjBT
	/dQmBVzVd+lT+MmiLNF9OOJDEVKwH+PtWvtKB42QuoAE+AQhYdgpdyRA
X-Gm-Gg: ATEYQzwXl0Gf5FKWv3WgYXykTWEWm/LlYwSQ/Rxuvsb9nZKCP6dQN474G2LZ57yqqkU
	wcSEBixqgXJaTsjKfHWOR4xgkz0gjs/VHUWH8ZpR5QSeSjaRrXGMmnKGlTnSoqg8VkIBr2om2fh
	uqRq4f84hMalKwbwfNdH5UAC91BK0NRHx/9YElAmOTua7/2/pJr+qu6Wgi1o/huPs866a7+gX9l
	7g5xV0sa6xzHmjyp8J571b0DoQ3YpzxeT+gsTRcb0TqIghn+WYf+KE4XKTb3zIJSsoNU9wlQkbM
	5x9J88Fyio5vMiKtgawkkSWHeGGkLZbffqEKmRH3BVfUTAe1jYWRkDWR5tGZ0TveeU6nh5PHhIz
	5wFGQNZNct7Jq6aiRkxLHyCe4NFn5IjCI0ELSbwFyT6Z44/0pbnoXQ7Qu25Kxi/10K+lKwm8o5j
	8XdXLB3MFP2xDoPppYtQ==
X-Received: by 2002:a05:6000:186b:b0:439:8487:73c0 with SMTP id ffacd0b85a97d-4399de2c2eamr3410785f8f.4.1772213170472;
        Fri, 27 Feb 2026 09:26:10 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:ac95:d4c:390e:fb0a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60e404sm9220541f8f.8.2026.02.27.09.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 09:26:09 -0800 (PST)
Date: Fri, 27 Feb 2026 19:26:07 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Shiji Yang <yangshiji66@outlook.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-phy@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: mediatek: allow building T-PHY driver for MT7621
 MIPS SoC
Message-ID: <20260227172607.e5x3izmhzwf6tfka@skbuf>
References: <OS7PR01MB136023DAF6E893E8110CEF777BC6BA@OS7PR01MB13602.jpnprd01.prod.outlook.com>
 <3c2dcbf4-7702-42ef-9e61-5f4091e9a85e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c2dcbf4-7702-42ef-9e61-5f4091e9a85e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_092612_734689_7516CD57 
X-CRM114-Status: GOOD (  12.01  )
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

On Mon, Feb 23, 2026 at 02:47:09PM +0100, AngeloGioacchino Del Regno wrote:
> Il 19/02/26 13:53, Shiji Yang ha scritto:
> > MT7621 also has compatible T-PHY which attached to the XHCI interface.
> > 
> > Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
> 
> MT7621 seems to be a bit special among the mips/ralink platforms, so I agree.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

I wanted to see for myself, but I didn't find it.

arch/mips/boot/dts/ralink/mt7621.dtsi:

	usb: usb@1e1c0000 {
		compatible = "mediatek,mt8173-xhci", "mediatek,mtk-xhci";
		reg = <0x1e1c0000 0x1000
		       0x1e1d0700 0x0100>;
		reg-names = "mac", "ippc";

		#address-cells = <1>;
		#size-cells = <0>;

		clocks = <&sysc MT7621_CLK_XTAL>;
		clock-names = "sys_ck";

		interrupt-parent = <&gic>;
		interrupts = <GIC_SHARED 22 IRQ_TYPE_LEVEL_HIGH>;
	};

Shiji, did you also submit a device tree patch somewhere? Not that
you're required to, for this patch to be accepted. I'm just curious.

