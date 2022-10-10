Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B80FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 08:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bv9TAuS1TQQ97VrLSTK+ffa4jRhiflV4O97LzPPBjfU=; b=qPYvffr/kaxjWlCxFx33wJetFR
	aZoAPqUsBm07w/A5jORs7FT7NFRL78D/z3kObkRrQ26pTyzxcEeATCRuA1B/Cv35yjwy/KvWlwWNj
	cMU/gX8mAZFxwVu5c5UfLkhgop/6u18vn+jXIm7sArJrZfU1djLZyNxSewmYFle27qQzQxL0lsnnl
	Wxs0eh1TUHqAdB0n6XRcgcPUxwzwJ0Jl3nZsPtqPHX6zpvJvD5Oaf7Any0I57L9xtB40GlvyArDYv
	3YaPSMv8R5R+HvWSFDt4d0bGK3Q8GAtz9iO49/RLLlOdky3c3v2jTduXbcogFcdFHm+7W0/lj6jfN
	UVDRVYFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohnxw-00HXNA-Hy; Mon, 10 Oct 2022 08:16:48 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohnxW-00HXBO-RJ; Mon, 10 Oct 2022 08:16:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 79B6F66022A5;
	Mon, 10 Oct 2022 09:16:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665389776;
	bh=d+LK7H8qb9z2A0aeSerxPVuUxq+r6RhCo8pFa2ITy2Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KcPbtHNOHJvM7SFbE1ihhhC8tSvJ3bOVGhpuAzBBBYZh6y0hsItlg4ClnUdSQFeEo
	 1ElBoca5OV6BFeTfIiGKc4ZtDJ9lpXOERTCTBmvJWUP+YOoWPAJn+fXV7HSGAPu9Pn
	 j2ZwBKetWYmJeZOjvBUxmOpN6SLitq0pXsjwvna4g10YIYf0lVPdoWOyPAwXGwRfGF
	 aC9MtQwRgEZa03JJVzYX8e684dr8Fi7Y9BZDQKwKWCKTFWZtZ2u/GuHj7ObEUfeKpJ
	 QJZxJRJNTX37fM1XpTKF9rkN3EmRX3yehqaDopkPUfuvaUVgCrNJrhAWLF8z3ZsKum
	 mJyx5fAukgOMg==
Message-ID: <fbfe429d-11ea-1b9c-197d-ac2fcabb8269@collabora.com>
Date: Mon, 10 Oct 2022 10:16:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 05/10] dt-bindings: pinctrl: mediatek,pinctrl-mt6795:
 Fix interrupt count
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221007125904.55371-1-y.oudjana@protonmail.com>
 <20221007125904.55371-6-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221007125904.55371-6-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_011623_087201_3C83D7C5 
X-CRM114-Status: UNSURE (   9.20  )
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

Il 07/10/22 14:58, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> The document currently states a maximum of 1 interrupt, but the DT
> has 2 specified causing a dtbs_check error. Replace the maximum limit
> with a minimum and add per-interrupt descriptions to pass the check.
> 
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



