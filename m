Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B564EC7EE23
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 07:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bQkcKOOh9+9+h5Wo9QpwYCFE1dm8fKf6W5fu9wvra0o=; b=Cww/Ioum/002gLKOMRLG2W2OzM
	ADHRx4x66uHWbBaKEkhy7DSvLxQHdY3rC4BNvEMUeSbcyR4Nht4Q1P9VZgVVbGBJUaL2NYhqiYD+W
	LY+YOnDMUavReOHkpIpBOajmFLOh6HjzIGVQvMKaK7irXuC69ngitpw5UstymRiDJopQzgM1WnGUG
	I2HoJjNR9rXCCpEUUpsTyaY2ZeCmOyFAPZ5wiyOpZ2vXsOtITewWVAjoqo0vccx6Nvp3aPw6jjDEw
	FR2E2Iq2mchCBglGjmHadxaF/AN1izJovFzc0NIX6vjDfD23HwFn6CZPH9VsfswW/2JVfixetRTik
	ffD9xrCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nl8-004mCK-1a;
	Wed, 07 Jun 2023 07:39:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nl4-004mB7-2x;
	Wed, 07 Jun 2023 07:39:08 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A3BBB6606EF8;
	Wed,  7 Jun 2023 08:39:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686123545;
	bh=zAuyPUiU9jrv+aiquvtaEM4Y+1gjNV1uCT3NGbu8FtA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=adTfqgtati+QaTsV5DsXyXXB9UECFWsmnnhMNSaLvcCiWgrHBJZ8/TPWNCe0sOysg
	 ikT6wE4gS7OyNA7h7f3XUewaPDhJxDMCbCuacZbrYGB33XhXdVo/b5vAsdLz/A3BcM
	 ip9MjTkt4kfoY6LvSvzXzZX2McKTItw0SP2ppyDyG9A3OzV9tb7FRd0tk1D7Tpfuap
	 /xvSExOke4QPCAlfVODhMJUiUZbOkzOoNqHIbvaar4GqcHrZhNC7La3SH2ZjcACd4t
	 s0WpSuQeL3kmhVH69U0WTTdq699e6kOqdeGP1S8Zgd6VKvXi2PsTep3swOFGDdmJfd
	 gv78y6SDWWBKA==
Message-ID: <90cf0b1a-d847-a2c0-7a54-babea8747c4f@collabora.com>
Date: Wed, 7 Jun 2023 09:39:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v13 01/11] dt-bindings: remoteproc: mediatek: Improve the
 rpmsg subnode definition
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230607072222.8628-1-tinghan.shen@mediatek.com>
 <20230607072222.8628-2-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230607072222.8628-2-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_003907_083951_41593E76 
X-CRM114-Status: UNSURE (   8.10  )
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

Il 07/06/23 09:22, Tinghan Shen ha scritto:
> Improve the definition of the rpmsg subnode by
> assigning a distinct node name and adding the
> definition source of node properties.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



