Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FBCE7544F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 11:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FlXd1Wwz/cZ0P/WakVCzv7KCBbzPT2AZWQsdgT7N9cI=; b=FYmI3t3AJS1ZjRD9bOTQYNhBB5
	ypiDExQM7eRULkyqMgSutEivjbeq2hGeqYC7EZgp+vq/THghzw8+fV2mhEhqgWqTKDMQAI1FscgvC
	fZT5jEbW84E8DfTsfypqHGyxKtplX7cIKg+CIVYaFFKr0i2Eow/Jr+D3atyZM4bvffVm+M0O5U1oE
	fiJUItWxg/7bRIZhytsOackh3jTFWsWD4WO+o60Bl8gOvRRhUgwFH9YFz2vuyiD3L79n47sDbYsRq
	PIcExtVlSgBoYpStRRweYf/6ZaHKsXL+qXEIO/r3KCp9oMtmoSin0esatb/GEFdEL8IFWDrHPC/zQ
	Fp1u9SjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qndj2-00EYBV-2Q;
	Tue, 03 Oct 2023 11:38:04 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qndiy-00EYAc-2N;
	Tue, 03 Oct 2023 11:38:02 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4E7316607313;
	Tue,  3 Oct 2023 12:37:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696333079;
	bh=CBp8+gNkRzBEFZU964Z4m7S1kl7820hZYja9Nis+J5c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iV63/FouGYa1jsTZp6muZhX+6NhaklXSntSFMFCy/BeuPBWvJRtEy5MGFkKknJbRp
	 5j/w4UtJ1yRneKZZqYtFqT8gjfdOr1EpSAaioLQZhjhfiz5LExJu4L6519eUojSLgq
	 nNyrJAhVBozE1kOoMPuhhH2MVz3c3TiancKmYTSPv/htADbAEl/oKHtcnwvzR6OyZu
	 045V3oOcP5T6zykG4hDpe7cP2+R4wEnUi/oXZ4VWviQPxls6tpp8CUc6XlWYIkBPAG
	 btPp3OvnrhSCpdlx0GLEzI6FuDALfTm0ZsubS6v7xJVaKGqF1hZV1ZMn1vPWCx6GZE
	 KSltA2GZpcZFA==
Message-ID: <51a5e6e7-c583-2ecf-3928-24b2fc07aedb@collabora.com>
Date: Tue, 3 Oct 2023 13:37:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 0/5] MediaTek: Update MAINTAINERS and dts fixes for v6.7
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabien Parent <fparent@baylibre.com>,
 Miles Chen <miles.chen@mediatek.com>, Macpaul Lin
 <macpaul.lin@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Sam Shih <sam.shih@mediatek.com>, Frank Wunderlich
 <frank-w@public-files.de>, Jieyy Yang <jieyy.yang@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Seiya Wang <seiya.wang@mediatek.com>, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 stable@vger.kernel.org, Eugen Hristev <eugen.hristev@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20231003-mediatek-fixes-v6-7-v1-0-dad7cd62a8ff@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231003-mediatek-fixes-v6-7-v1-0-dad7cd62a8ff@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_043800_910383_444F4276 
X-CRM114-Status: GOOD (  14.88  )
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

Il 03/10/23 13:13, AngeloGioacchino Del Regno ha scritto:
> Hello SoC maintainers,
>      
> As suggested by Arnd in [1], I am sending an update to the MAINTAINERS
> file, adding myself to the MediaTek SoC maintainers, and some urgent
> bugfixes for MediaTek devicetrees.
>      

Forgot to add....

[1]: https://lore.kernel.org/all/84b2de54-8337-42a3-a25c-a95cf2f3349f@app.fastmail.com/

...so doing that as a reply to this cover letter; sorry for the miss.

Cheers!

> mt6358 PMIC
>   - Bogus property dropped
>      
> mt7622/mt7986a
>   - Fix dtbs_check for t-phy nodes
>      
> mt8195:
>   - Fix early boot failure when DSU PMU enabled
>   - Fix memory layout for demo board
>      
> Regards,
> Angelo
> 
> ---
> AngeloGioacchino Del Regno (1):
>        MAINTAINERS: Add Angelo as MediaTek SoC co-maintainer
> 
> Eugen Hristev (1):
>        arm64: dts: mediatek: fix t-phy unit name
> 
> Macpaul Lin (2):
>        arm64: dts: mediatek: mt8195-demo: fix the memory size to 8GB
>        arm64: dts: mediatek: mt8195-demo: update and reorder reserved memory regions
> 
> Nícolas F. R. A. Prado (1):
>        arm64: dts: mediatek: mt8195: Set DSU PMU status to fail
> 
>   MAINTAINERS                                  |  2 +-
>   arch/arm64/boot/dts/mediatek/mt7622.dtsi     |  2 +-
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi    |  2 +-
>   arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 39 ++++++++++++++++++++++------
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi     |  1 +
>   5 files changed, 35 insertions(+), 11 deletions(-)
> ---
> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
> change-id: 20231003-mediatek-fixes-v6-7-341b5cfdc07a
> 
> Best regards,


