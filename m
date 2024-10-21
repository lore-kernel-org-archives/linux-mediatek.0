Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B201DD15D8C
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 13:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n+U0QEfZ2iJVJp6J5EYqpj40r8BEEKYegVpPpzy5OvM=; b=E8LHMwod12bGWBSQ2IwoUv/hJQ
	B6Rv/bSx2i+fk30BPZGx7s7S5R8AZ5E7wMQzm2494keAL/LMFu6RwtYyEtdbPJIAHZF7XsdKDbk5F
	mG9H8MUbPjhbf506KgfT4XX1SivKP6rHyzkAkL6rJ9P8qP8S5bl8ZHTkPy8ZueRjnzbutmCAOJuDh
	ZGpbhT2U//ukxe02CwiVHeeC5kpabvr4C+FdSejyQJv0ew/ZEg9l76uED0NCTL/1Ya2ZgHMq+UCFd
	irg2/A3/uX0hYXJliVYdAnTcuxF5/ByUDCiZcwe3hnpkR0Lz/vgQapCBZcRJGRvPf1bJFUpXul4KD
	gazcqTSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sgZ-00000007SsX-2yOk;
	Mon, 21 Oct 2024 13:43:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sPl-00000007Pcm-01JL;
	Mon, 21 Oct 2024 13:25:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729517139;
	bh=gpfJV/J4XAJzXROwT21rmERu+KudR+NkEeezem1wx7g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DkhESxST6R8Xa4W1xZkzow/DuKu/6IEgyOACCxg13bWiWa54UsFYkoGPuyiutlAyh
	 hO6uBa68dH133v4N58WdAYtjUg0Ak1KqlrZn+KpNqFWPfBe7sBos3kG4WT1h1oiadz
	 dvlqyA2h++S+YSXArVWZq7MdNbnV+bOh9dxOJwK3h9UKsI3gGEZ1+TjGTdKprno7EX
	 HQxMAmWgG4LfO7Ic43Iu6RwQ0PmNXjDmTA/IA/U57Nkwilb93ijT+0J2bi4QVEYb6D
	 WoIraize3GEnWZb3k3cDPKghAIZmpz+NHYiHd2gYBM9WtpJFoZ3od+PD8IIMOmDlct
	 SWPH8vUhLDxTA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 908F817E3616;
	Mon, 21 Oct 2024 15:25:38 +0200 (CEST)
Message-ID: <9a1d72b0-f545-406a-b827-5ce082c706a3@collabora.com>
Date: Mon, 21 Oct 2024 15:25:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: mediatek: pwrap: Add MT6735 compatible
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 jason-ch chen <Jason-ch.Chen@mediatek.com>,
 Chen Zhong <chen.zhong@mediatek.com>, Flora Fu <flora.fu@mediatek.com>,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241018081050.23592-1-y.oudjana@protonmail.com>
 <20241018081050.23592-2-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241018081050.23592-2-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_062541_225701_42B05C99 
X-CRM114-Status: UNSURE (   6.68  )
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

Il 18/10/24 10:10, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add a compatible string for MT6735 PMIC wrapper.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



