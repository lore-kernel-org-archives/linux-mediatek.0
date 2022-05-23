Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE487C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 11:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yTvgJ/mzsSRvLJA1UOKvMMEFCTKzzPNYxvS399vM1Bw=; b=wZ+KHnVqU49eek
	fpz2daXlk77wEYLxvvHCxphQ29Hnf+vHBmatGVAm7slhfPHl8l4SWxGjQPXFUi7VV9r268gtGTn4w
	uaz8Xt1EqeLmbwUv2LbHx1XjIUGKWtsEux9yPaIpLiKYuS8l+f2yEDpW4GnY97ABR1tQ4DstpuYck
	WhGPVL7Mnk6oXqyQKrPsDoKRrx9VIUQn3ejxW8pojrao8/yAc5bQ2eJZfbXhveXZ1iscX3bkYt2qe
	+OYsjmEHZLBy/eglC7jyNLWdlu/r0NqrpTWAFYECkW4+aI0Mu+wFPr++wDdhee/2nM+76zjBXmEzi
	+r6X2lI8CFU+ZHMRQAhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt5zL-003a8U-8k; Mon, 23 May 2022 11:12:39 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt4wG-0035Vi-Eo; Mon, 23 May 2022 10:05:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 708351F424C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653300323;
 bh=hyzoYsUfBPMt2w65TtM4E/48BZdlAw/F0S4w7MVe23I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ibFDRrkcUQuTq/dhq7xF6dFMKOooP2nCjmq4nQveMhwVt/tBvEMtWih+xHGI+SAq+
 WHXedhOfRhOdAt9Q/e9oC9GW8B5pSgNGhIW5lUVEqv3scktOSCt2ddAfIk9hMmeTFG
 LyPGgnibzGxDR+xfXpVWykL4oYlC1LvBHZkxEraz4b6JrFNQNjA72R5QjDnSMNMq1u
 53HSwmSHRNRdln3qn65/+QPFi7oQcvwuj+Zbt7OJbk2lqvZH0o3t76YA4quB8QXUUQ
 +4vKmvPX3wjO72xocYLIbrMZ65vbfXgoOfqo0eMxvRM8tl/EoVEXLDjO3mBtgEot+2
 iq9Uc6uLJINyw==
Message-ID: <29641040-f6f1-a3c1-cad4-96911c8e38a8@collabora.com>
Date: Mon, 23 May 2022 12:05:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 4/4] clk: mediatek: mt8183: Add clk mux notifier for
 MFG mux
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220523085923.1430470-1-wenst@chromium.org>
 <20220523085923.1430470-5-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220523085923.1430470-5-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_030524_698683_63C20AF6 
X-CRM114-Status: GOOD (  12.21  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 23/05/22 10:59, Chen-Yu Tsai ha scritto:
> When the MFG PLL clock, which is upstream of the MFG clock, is changed,
> the downstream clock and consumers need to be switched away from the PLL
> over to a stable clock to avoid glitches.
> 
> This is done through the use of the newly added clk mux notifier. The
> notifier is set on the mux itself instead of the upstream PLL, but in
> practice this works, as the rate change notifitcations are propogated
> throughout the sub-tree hanging off the PLL. Just before rate changes,
> the MFG mux is temporarily and transparently switched to the 26 MHz
> main crystal. After the rate change, the mux is switched back.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
