Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFC1C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 23:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tk7AONgbfdDeHTbKVGT4XfJ5oFMO3xWw+bJnRDROhPc=; b=bTdfw+p1pamQe3VbylGIUHvUAo
	GBHJFzH1ihdfeF43UllJtfaRD40/EjvPH3JnGuBrKL2kYdk7HTDo47ZbWgLfEchycpBeyRtn+FuA1
	8vYyrvXY4bRzXZNIAm448FcvGBXQWtIqzaqkzQQijvN5CNbG4SzGns/3ZzyUoz1CE6SR2XOu3wdiw
	oTAFiz0YVWiemTNCTEi5TaZ1Mcg01E3Dawfjh4un28MH8c5OW2RuxxSxMv99DoX7gunFHl8gq4ZCw
	mQ8DVXGKLNedoEzIMLnOOb9OOTp51N6WBJLhDpybLuvyyn8NvQxnT2gpBfxo+ChKhGXxUm54LtbKt
	SWhJXdCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDa5X-002dAI-TE; Mon, 18 Jul 2022 23:23:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDa5N-002d7f-29; Mon, 18 Jul 2022 23:23:34 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A1B876601A63;
	Tue, 19 Jul 2022 00:23:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658186611;
	bh=ueHareq2lBmSzrfXkKzx7fGfwxDmuIWF5D8pgRa5xxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NWa23fDATco2oFnMi8UA3XKmwA+raBTNgR8E/pk0t5Kc11Pxkz+XUP82VH96guprU
	 ZMtjFx0xxB5cT5vO6Sfa24m/vIzNO+bmiic6PAv2f5vej4eHRZj1ulkSnTU1F1sCKE
	 ryBvTsL6E8xqS9TV5FvXZthYWYGAoi5VmrMJ2J0dtiIK9esBvwTecym5oeEnaA09gx
	 cMwwGck9SeYsN5unYjF7MdycYxME+C7MAVynUo7PtsL7yZUca/Fy47MVyzElvTaZqd
	 +V2vKsTSuRGIN4TMjeWaNEUzoD9qv2fFCoy/3cqZiM+b0iCPqvEc/Z53yMN/HxEqbY
	 JfFzt9San8/FQ==
Date: Mon, 18 Jul 2022 19:23:26 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v3 0/5] Complete driver nodes for MT8192 SoC
Message-ID: <20220718232326.l7cffiighmcdl3at@notapiano>
References: <20220712114046.15574-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220712114046.15574-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_162333_256143_EB157160 
X-CRM114-Status: GOOD (  14.15  )
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

On Tue, Jul 12, 2022 at 07:40:41PM +0800, Allen-KH Cheng wrote:
> This series are based on matthias.bgg/linux.git, for-next.
> 
> I remove vcodec lat and core nodes PATCH from series and will comfirm
> clocks usage then resend PATCH.
> 
> Also should reference below PATCH for dsi in chunkuang.hu/linux.git
> dt-bindings: display: mediatek: dsi: Convert dsi_dtbinding to .yaml
> 
> changes since v2:
>  - add mmsys #reset-cells PATCH
>  - add missing fallback compatible
>  - add display aliases
>  - remove vcodec lat and core nodes PATCH
> 
> changes since v1:
>  - add Reviewed-by Tag
>  - rename dsi-phy from dsi-dphy
>  - add missing power-domains in disp mutex
>  - Add remove mt8192 display rdma compatible PATCH in series
>  - use "mediatek,mt8183-disp-rdma" as fallback
>  - remove mediatek,larb from rdma node
>  - remove syscon-dsi and add power-domains in dsi
>  - add reset property in dsi and mt8192-resets.h
>  - correct Typo: s/ndoe/node in commit message
> 
> Allen-KH Cheng (5):
>   arm64: dts: mt8192: Add pwm node
>   arm64: dts: mt8192: Add mipi_tx node
>   arm64: dts: mediatek: Add mmsys #reset-cells property for mt8192
>   arm64: dts: mt8192: Add display nodes
>   arm64: dts: mt8192: Add dsi node

For the whole series

Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Tested on mt8192-asurada-spherion. I have a working display with some additional
nodes on the mt8192-asurada DT.

Thanks,
Nícolas

