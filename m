Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509D7C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 11:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exwDTtUU4YP/GE/Q2WzHPb4ZnH6hdXH9abjDy6v3w/8=; b=EhIxQagKJeB0R4+zvZBJhKR6Gv
	vKUQ+oK2rChFZdQN/gEmJmE7yHFz4BCqIBIEqFQSa6vd8hbNJa0/pV/9J2NYOLa4jIN9sbGy2O1UC
	5nJvqQdKv/GAwLA4zOtOulNF9xQn0wI/5EJrdqNRYWjPaIY5sogRy9oCmn/rM2t1wdtLlscq+UARw
	ksBlfqzaJ3B2p/sYzKHYJthwSgl9hykutLG2ftfewgyyBowy4gwJWCFm/77kB/rHCy2Z8exJ+vOUi
	MK/0K2Qq0FR7fABhtX1UUG6geVgzhXuCl276DSwaHInNr1HsB1JuC+zjSVYhDs636B/UdNG5SoOB8
	7YcHc8pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8K8a-007e2O-Ud; Mon, 04 Jul 2022 11:21:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8JWP-0077yX-At; Mon, 04 Jul 2022 10:41:43 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 56F1166015A6;
	Mon,  4 Jul 2022 11:41:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656931299;
	bh=6KRTStMyxprmle19K42jEmubDL4XaDPBD7JNqObYU7Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZAsj1oqoZxdfYYIkcj0q/rRR0XSrqwlV5rPZ5Np/XrwNQay1ebJiCf4vWsvs/31Nh
	 wlnug8PzUwUryv8IUn26H02vOkJkzzXy2fcGmK7iSBmjIHy39d8jZ30j91U6L36NoX
	 2AHreANN+bnX0H3fD2GnCesD4Xp2yQgOasMM3G7B579UNsSWWfojoEi5YFF6GrTrJ9
	 zrnTnK4lNgASlYCloGAI5Z/9awqo+ljm8l2Wl3W9GX/zBCBxf0ttc9VvU3g/3oFb8y
	 u/DjmKRpV6gL8NHJqMblg+BIrgoprYDc0Dw4TX3AjVkS4xJO6qRN0xvsDnqLUxdkOm
	 awTHCA273ImfQ==
Message-ID: <64468e68-2cef-e753-a4dd-9e17fb7bec1d@collabora.com>
Date: Mon, 4 Jul 2022 12:41:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 06/16] arm64: dts: mt8195: Add cpufreq node
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Cc: iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 YT Lee <yt.lee@mediatek.corp-partner.google.com>
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
 <20220704100028.19932-7-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220704100028.19932-7-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_034141_581807_3141C312 
X-CRM114-Status: UNSURE (   8.21  )
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

Il 04/07/22 12:00, Tinghan Shen ha scritto:
> From: YT Lee <yt.lee@mediatek.corp-partner.google.com>
> 
> Add cpufreq node for mt8195.
> 
> Signed-off-by: YT Lee <yt.lee@mediatek.corp-partner.google.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


