Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E66AC0015E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 08:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AkkrtcaqDGBWrw52HatIJT2zk1dqkR6AFmKRstPz9Cs=; b=ed8afgSrxESGGq
	gg86BHVxaPXm3BmKbZhRms39r0GMMDkD7V/CNpGBmTGonImTHJjtS7qhEl2oJLSyvp0ADmWs2cyxy
	TDbaUXHz/L3eSRggkIofrL7knYW9uBye7EikB/07PB0a7mz/sGOjXoElp/zsN8K/q+Pe2S5d/QszO
	dWOFwYohsX+5shquzxurva42/iJMmugR31wcai1tMWWVCGxtl2Y4CivWlMo/odfbnrE27TLBBMhXj
	BeS/I3nu/ME08VELn1bYogHiAR+uJRtjoo3OIPX4t5gSMMyHCbXgERYP9b0Sqdyb2POGLcU6S/qUt
	dPWsheGvoutQp448nY1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlto-00DRHd-2t;
	Fri, 21 Jul 2023 08:54:08 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMltb-00DR9n-32;
	Fri, 21 Jul 2023 08:53:57 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E2406660709B;
	Fri, 21 Jul 2023 09:53:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689929634;
	bh=ffw2ebh9MH9Vj8Efzuv/Nuu595JTYxBbopA83mVf6zA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=orGIBjYu+/go1gVsfDbth2LtGWUYY62TI6MVc6tGgJbFb2EvtgzoT4COfPU8kmCxT
	 PZcQvDUjGyKaPSNmaetkwhh/txGhaHDPnRNnK8ON2/vfuoq8EkRAVeiRwWd+mDAYvw
	 9b1CiZn+r2L2AJVbhoyRrZ99USPYwSnyWldw8p/G24fldbKKSv69oCUkVW2QjkNCxG
	 8JtvsneNK6GsTluXVAXrHazPKlDMNP6Tq0ChzZb3kB8UzHMkgQN6DPfz4OMKAk32c3
	 3EajEW8Hxcg+t05oeazMWceeL6YaKmn36nqbJOOwTycYotnOWAb6d8zOMwTentrOS0
	 oKpLnfqgriJwA==
Message-ID: <fac4a7e7-55bc-10da-fa8c-223a2b716caf@collabora.com>
Date: Fri, 21 Jul 2023 10:53:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v2 3/7] regulator: mt6358: Fix incorrect VCN33 sync
 error message
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230721082903.2038975-1-wenst@chromium.org>
 <20230721082903.2038975-4-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230721082903.2038975-4-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_015356_104517_6531509B 
X-CRM114-Status: GOOD (  10.08  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 21/07/23 10:28, Chen-Yu Tsai ha scritto:
> After syncing the enable status of VCN33_WIFI to VCN33_BT, the driver
> will disable VCN33_WIFI. If it fails it will error out with a message.
> However the error message incorrectly refers to VCN33_BT.
> 
> Fix the error message so that it correctly refers to VCN33_WIFI.
> 
> Suggested-by: Fei Shao <fshao@chromium.org>
> Fixes: 65bae54e08c1 ("regulator: mt6358: Merge VCN33_* regulators")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



