Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2155DC352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 10:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8M/39tGlx8O8QyEDLP0XFO7ROlhKsZW+CmlBDr7waM=; b=wfHx/GAyjM/nom7p1ySXHmDIAd
	+ULr6Yc5SVeBSBcyGSjP/A0miuy62ieB6NmLS+K8/axA40Vg8ZTAyAX7ZTYCDPvD6Mgm1iyAsOQJ/
	WOfTGGWa9eeCK4xWtXEbxo6UGIAPMOsuRjL8wSbatmPWf3qB7cPidldANQLmBTKY4YRd52Py6+cU2
	2vyP6Eyq4Mi3xOKA0MSzOpRWgka5yEyXgQ2SINZ+Npd2+zXzrbjEAtORYTGoeuTNheHMxjOUms8oG
	58lkmaxIJEA3kEwanDdP4rggoLDNYHJTab6nD7OGi0nrOZ6dJTjNB+zfUFKqNN/napAOt6lXR11LT
	Wpy8upqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2rT5-00H2mQ-W7; Wed, 07 Dec 2022 10:16:00 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2rSs-00H2XC-KX; Wed, 07 Dec 2022 10:15:49 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6D9246602BCA;
	Wed,  7 Dec 2022 10:15:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670408145;
	bh=xenTL6ycu6+J3dZkWwVqbyz6cpJbQ3K/72/MLgrrW/g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=csvgkyZsfJVtOhUqHsF67yjdQ4Myj7Ij6uUKXdL5wVB/Wc4qJx0ziPEA+6pIUJKQX
	 n2tdsBeKl95ESt8JzqfIV4c9SfzXumwbyRnITpibdLhlhhbMUGp/7DAkCcY6Fav1Sr
	 j7eV9ZfTMkIxo2z3bEtjgjW7tfTpK1XsKomx+pAGmhjKbJoSkv8HvK/mPfGIulapqv
	 T6HVXqH5ccANG3Qzeew0izlxulMivy8ics97W4y/466JTM2GZAWvoy5cSeh2EQ5qpO
	 f5HRlmMmRKisM33PWsUAVVDvN8s4lBNgXkdvkerr5D8phfpuCzeEkBFYQxwyeyWj7w
	 +9rz5aQQLZBqg==
Message-ID: <fa7d4a05-d224-47e6-cd4d-fdb246d70e27@collabora.com>
Date: Wed, 7 Dec 2022 11:15:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 3/8] arm64: dts: mediatek: mt8195: add MMSYS
 configuration for VPPSYS
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
References: <20221207094921.15450-1-moudy.ho@mediatek.com>
 <20221207094921.15450-4-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221207094921.15450-4-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_021546_834529_945ADD22 
X-CRM114-Status: UNSURE (   9.23  )
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

Il 07/12/22 10:49, Moudy Ho ha scritto:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> With the change of the MMSYS binding file for MT8195, the compatible
> name of VPPSYS in dts need to be fixed to match the definition.
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



