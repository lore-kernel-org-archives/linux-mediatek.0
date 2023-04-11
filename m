Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4798C7619A
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 08:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXqqFBg7SDVzwJkmN1Tw4+u3UyGoiHJ+I1HI/9ZXX2s=; b=Hc4H8fnUHiYLX9btObJB80FMCc
	s7v9P7VdGe6JEEqORtU4ydEWQ/lafEBubz6/LS2OgZMmbHpco702OuCa/ZXwrMsGKOolzjSGpdbjJ
	hh76SElgOcamg8pwH3OjAPVakHrGGcw33ZOUTFcTUuqTw/gkvLfUi9pFsf7IQCG2VPNXJa7NP2318
	hSq0+BG8eBiYRX/IGiDNl6iRsjA0lBn4xL0V+EJ7J3UbHBQgUB7DAOF9yPhW9gTgNt/j/PW86O3ng
	qIupifrXraB80v7sQZcEb8jxZciPYwBrakP1sxr4fNifBjJmgDwjaI88NDU1p7jXrN+1SxOxC4MAx
	du1bpelA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9Aw-00Gnwy-1L;
	Tue, 11 Apr 2023 08:16:26 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9At-00Gnv3-0q;
	Tue, 11 Apr 2023 08:16:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F1B8566031E3;
	Tue, 11 Apr 2023 09:16:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681200980;
	bh=GrCHapiNl4l3fizzmjPO1MazlZDHXxK0RUGAvEI7QMQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=fMxnWqyudsFS08J1c5V9HkDeqBwajRKtokinSGtvUa3THNfsy3yg7Z9mznN031lVc
	 31FaDYC4JOOD/fQpgh9OlTDGnDPw8rz2hINN9xYG3lr3HYDeiGLGYRcEv5mbYMe9Ma
	 ipx4hBu65tfNr5JEeOG8tc7gYYpfLGTnLkenqsBPfdxmhu1xBSNGbJNCjiwO/arTqj
	 eZVz2I+3bqu2ASjtZd5f8PIxSEgtpbVM2zqsw2QkDa6tlIAHO3/5qZbZUYHf42UqW1
	 K7vK8pc5RMOxODIUNETHea5yJBCWiGrWKrwO8shlLTji8YCpP6i+e++Uzu1dhRPm88
	 BaomvjIzzMdZw==
Message-ID: <a903d765-d7b7-ea90-65fa-56c5b69295b3@collabora.com>
Date: Tue, 11 Apr 2023 10:16:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: i2c-mt65xx: add MediaTek MT7981
 SoC
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-i2c@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Shih <sam.shih@mediatek.com>
References: <cover.1680857025.git.daniel@makrotopia.org>
 <4ad55cb4248db60111c20d833631a65854fa1d02.1680857025.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <4ad55cb4248db60111c20d833631a65854fa1d02.1680857025.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_011623_432917_56E0DD4A 
X-CRM114-Status: UNSURE (   8.43  )
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

Il 10/04/23 18:19, Daniel Golle ha scritto:
> Add compatible string for the I2C controllers found in the MediaTek
> MT7981 SoC.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



