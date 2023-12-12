Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C336C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 09:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zD4C3Ub/1zdZLMKHBGjv+fG++RkHAM/NPOBwkxlFFgw=; b=DcOUUqVkKF4207ASXHAzbdxX/g
	GYr6WmrFHGbQReBNrI0OA2F5szXWORYu30ExHGh2wWMBY3tw0qKTRqrnkAyG5KLU42GuDg9mRvOX5
	emLXiPkHtoVXDiPZ/tVw7ePX5wH9BEojuwCCJz9hccq+40kDooktC5T2rXRX+o6dzDd+kwYphoptF
	QIpj9c3IBXt/JbUgf0XlQkbaukK4yiGn3QwEBKSL2FcUxTWRHhO8RHrAnDT6GMKdpdIdZOE7PkwEj
	L2zIrz1+gnRpOhS7DpbtV7GHfsaU1zYte19kk4fw6uT7g5vKGdkKpaD1Upw+YX/Q0+jDQZS2EzC9a
	jlc131gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCz8M-00BDDK-1G;
	Tue, 12 Dec 2023 09:32:58 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCz8J-00BDC2-1n;
	Tue, 12 Dec 2023 09:32:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702373574;
	bh=MBQO5oF6xCPSn7HgAU1t+2l9sLLdykkBin/8woDzJ9g=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=EDEkk/Bnyi8puXgMo1g521hdsSapVIKyggdM1wYlr97I3/+aw9hKO5u/EQwjMs4NI
	 fBO+A2DQRs4wdBdfsgw5Xw5FJjEcatWuoUkSxcTcg6cNdeOevbVcKdNhMU/fzMDkGC
	 UFBR31xHa4B7V1H4sXzRMypG5kmC4bU84HhKqN0+hz+JNbYjBNHJ2qDu7XoXz2Eh8S
	 4WS++GSApUzlYzWjHC6pl9pCrA0Mj3+TSYTT8Z7JxP9fdbiBm+ryibJ3O7hGiK18yl
	 bOo9mVWfoM8t6YO5bhlojzqrX0Q3svrRzPKWi8DDJDa0J8VRrRzYUJ6Bz8ZqV9DF81
	 NDfz2uNornPeg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1B8EE3781423;
	Tue, 12 Dec 2023 09:32:53 +0000 (UTC)
Message-ID: <4215d31d-99f0-4a47-a8c9-7324e5b51c02@collabora.com>
Date: Tue, 12 Dec 2023 10:32:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] dt-bindings: reset: mediatek: add MT7988 ethwarp
 reset IDs
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sabrina Dubroca
 <sd@queasysnail.net>, Chen-Yu Tsai <wenst@chromium.org>,
 "Garmin.Chang" <Garmin.Chang@mediatek.com>, Sam Shih
 <sam.shih@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 James Liao <jamesjj.liao@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <152b256d253508cdc7514c0f1c5a9324bde83d46.1702350213.git.daniel@makrotopia.org>
 <a60f5b5ed58626f3dbac1eab8a5845c3ce9bd17c.1702350213.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <a60f5b5ed58626f3dbac1eab8a5845c3ce9bd17c.1702350213.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_013255_722226_CA0450D9 
X-CRM114-Status: UNSURE (   7.26  )
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

Il 12/12/23 04:18, Daniel Golle ha scritto:
> Add reset ID for ethwarp subsystem allowing to reset the built-in
> Ethernet switch of the MediaTek MT7988 SoC.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



