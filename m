Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328C6E75457
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 12:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jEYO2NkrxQsO6qQsxm8aU+R8LGjZWuGj1ySjbOKj8VI=; b=V9N35wprddHm13LsVW3lk8MeU6
	KLb1ltc7Oi0rMtCuqNHfS7B+VIguY7/ZA4/Bgrs+j4nCS9qQmWkt0K/0rciSNmclVpK8zfMk8uPiI
	j5EULYVg9Wuu4R4qLKvgmaSKJjy5rULmkcmPPwb/kk8fQKnsQxjWU3yJ9BuswwJ9otB8LTyLK2qn1
	8vAaQ2wrRL9ig5vJLdFkmDNSuhcemamBgE8501ifKp7zJiDomO6FR9uxJSj0KMX5rAb3HDlORZZB6
	H4t51wBaWkAm2qpySQigJ4N2896lVRCQIXPZ5UHHVfdbwdFoE26qDnwEKKEBraELeNmRyeLdtQBns
	/WrrYVkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnem2-00EdcH-0E;
	Tue, 03 Oct 2023 12:45:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnelx-00EdbK-2x;
	Tue, 03 Oct 2023 12:45:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 287BE611EC;
	Tue,  3 Oct 2023 12:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81FD9C433C7;
	Tue,  3 Oct 2023 12:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696337108;
	bh=RJXkdGT/Nhkeb2GuoSRT2fL7sCAwLnQPGvr69EUBjvI=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=pargP6MBcbO0eqbPYlG8SeUTvjfHoYjB1luHQfdbgcsf8F6ZbM8E4RQBJr98P7G+G
	 UQ+mBqa252CJuexEOSRcyLexoRoN21yqSDH5IY2UsrAdvyhuRaxLXWj2DKKcVasL4K
	 NaPu5ULcg/sSpMng2GlFSyQBnNuDnC5bRUzzQTigJ6OB6jzrKS58DWez8fMryIBxpw
	 5c61WelMqR7e/Kq3TRc9rDkh1gg0wdaDa0IrdMZO/9IcdPHCcx1gv91H97ggSV++u8
	 bTMMMpobvBosOOIkFuOHxB3fl2VFzKK9v00YhbNjQwgVn6SNlsBi8W5DUv4w1oICaM
	 jCLh7o2qwGMEw==
Date: Tue, 3 Oct 2023 08:45:07 -0400
From: Sasha Levin <sashal@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 0/5] MediaTek: Update MAINTAINERS and dts fixes for v6.7
Message-ID: <ZRwM06dwpF/7wEs5@sashalap>
References: <20231003-mediatek-fixes-v6-7-v1-0-dad7cd62a8ff@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20231003-mediatek-fixes-v6-7-v1-0-dad7cd62a8ff@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_054509_997969_59E89914 
X-CRM114-Status: UNSURE (   8.99  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>, Seiya Wang <seiya.wang@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, Tinghan Shen <tinghan.shen@mediatek.com>, Eugen Hristev <eugen.hristev@collabora.com>, soc@kernel.org, stable@vger.kernel.org, linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, Fabien Parent <fparent@baylibre.com>, Miles Chen <miles.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Jieyy Yang <jieyy.yang@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Oct 03, 2023 at 01:13:42PM +0200, AngeloGioacchino Del Regno wrote:
>Hello SoC maintainers,
>
>As suggested by Arnd in [1], I am sending an update to the MAINTAINERS
>file, adding myself to the MediaTek SoC maintainers, and some urgent
>bugfixes for MediaTek devicetrees.

Just curious: if it's urgent, and there are patches cc'ed to stable, why
wait for 6.7 rather than one of the 6.6 -rc cycles?

-- 
Thanks,
Sasha

