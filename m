Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A56E77188
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2025 10:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BmIO87v4Cw/macK9lR5c+RUj51wdElXoGVTShoSksnM=; b=E5g3aEEq6mN781Y/CfpfVAWScv
	fNyovzFu/DAjDJO+ci7mhuNvTzuel5/eV12fQoTdS8BoyC6cbVEfFwEW0yR6UY/YVN2G4vlyKumds
	rkI6atnSeJNFD4ChRC7MrmVjJ7HZRXbmmkmA6zpMU41Pqr8wvkhXUtCo3m7MFXdwjWwdJDwHJ3b8i
	qfpmKsYI6jxbLxnVDYJc6uyp5p2yN6UPGbplK4/a+CHbN9M8aHjwlyLBg9Asn6igd6mV5L8Mr/2pw
	UyByEojinZcJkI+DdTvML6+mvv+/e8s8vI+iPz//4SPBKQxfcjp06AEtkuMCaLE9q2KAkPylzlIMX
	f3RnioTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIYK-0000000AALH-1ryF;
	Thu, 02 Jan 2025 10:35:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIP3-0000000A8bm-3N3H;
	Thu, 02 Jan 2025 10:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1735813568;
	bh=Czb6aXX2yCzHoge+VlRIHz2pmWSjuJOZlfjlLJLxNQQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pH8zx77y7dr7sqBwC2P2G0A5wY6tGua8hIQDYA6lkbVtRRYlv4LHj6fX0r8Qa/FDa
	 CGcNZcGAX4NtkNu1Wo8SmFAnnHKjMQD6SkPPAtBSAw4zNC0jxXGG5F4zoBvC0t31aN
	 DJIyjjNVGyy3HdH0zvH9lDykHYbBTdv5H2cRE5vzLXEtS6BQb9zZiG6hwN8EBegbK+
	 4aU2Jbo8dNq85M0o9TmkDhb03cUqwQg/8BkfnCZprSt8aC1whOMACbweuMhy3l0EVt
	 mF7elsE0aNzTwN4sN2YcQeO2Cu/4TXjZDBrL3FyNQDkjl9WJSr33n6HZx0s9QBW8EV
	 LB6XIwYI4FJvg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3463F17E1558;
	Thu,  2 Jan 2025 11:26:07 +0100 (CET)
Message-ID: <49874ffe-61b2-4532-b3ce-e5d9e408fdd5@collabora.com>
Date: Thu, 2 Jan 2025 11:26:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: mfd: mt6397: Add bindings for MT6392
 PMIC
To: Val Packett <val@packett.cool>
Cc: Fabien Parent <parent.f@gmail.com>, Rob Herring <robh@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org
References: <20241226050205.30241-1-val@packett.cool>
 <20241226050205.30241-2-val@packett.cool>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241226050205.30241-2-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_022609_986195_3D56B5D7 
X-CRM114-Status: UNSURE (   7.90  )
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

Il 26/12/24 05:58, Val Packett ha scritto:
> From: Fabien Parent <parent.f@gmail.com>
> 
> Add the currently supported bindings for the MT6392 PMIC.
> 
> Signed-off-by: Fabien Parent <parent.f@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


