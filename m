Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A13CF31AC
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 09:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PqhQZRSK6nU5FRES0nDKlEHSH2B+5qn2nJYYKhk1Af0=; b=zT4LjoNuOCqJ/z6PiXHcv6hxhm
	efclAGISQWvuqBb57C5r8w3HeCWYk1+3mme8gUSKJHU9bwRvtXwBXZdxUymKxF22Eb2oVJpGpC0zZ
	QZvXzovDcj3nlTSUiMVa9cQPYM6ANsT63vOK4654FvQyVPDTAZnBf2kaKG+dnS/y5Tw99koD7riA4
	n+3bG21nH9V2bWZ19ntzeqA+CtSERYQ0wsQZNS4UhprdLpenpiGjCZHzcGNCuEMef74P1Qx2Dtbxg
	1aTN2licMg7JEw3wLkvUhy4Ed34Xj7NIeOVBOaxlkzfCTHtNPio9agUTn9adqkD26Vl2vnAu3degc
	HagjC7QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svvMT-00000005Hbo-29EC;
	Wed, 02 Oct 2024 09:09:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svvL6-00000005H8U-1rpf;
	Wed, 02 Oct 2024 09:08:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727860086;
	bh=Xtda8GgdmpzB/6piVb67QcbqKu9enLjmiJSRfaL4WgE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=E/YMZX2xXUFZOGClSYWCrQeBKYJH5iA1V5TKBUPVfMiTSX/RSn9r2zZFdOqopzOIB
	 d/TmRttPlHx4KkojpmDKtl8iMax2n955FPyEw5cVDgNr/xV6jizXnFY561kWWWjj5K
	 Xs7mzP1SBkNDo0BK/QXawTzgFt0x7qxxVu+qUITEDMIDcrylcDAn7cI0Q8b4m3KTNP
	 Je1C9m+puoRlziweE0ZKx1UWz5/F76xn04zgrEx9AOqnv+S+u3OimO5AQ+/N0QqGvJ
	 gVmn3dCG0DtF4V0gowxpeqnVaJjn8v9aJig2Dkjwma9RETssKeFtnOfPIOAJMRDdcY
	 ob2L6bL4+11Lg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A84D917E10D2;
	Wed,  2 Oct 2024 11:08:05 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Pablo Sun <pablo.sun@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20241002022138.29241-1-pablo.sun@mediatek.com>
References: <20241002022138.29241-1-pablo.sun@mediatek.com>
Subject: Re: (subset) [PATCH v3 0/6] Enable Mali GPU on MediaTek Genio 700
 EVK
Message-Id: <172786008562.33539.7007504716451192939.b4-ty@collabora.com>
Date: Wed, 02 Oct 2024 11:08:05 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_020808_666738_DBFBC104 
X-CRM114-Status: UNSURE (   7.42  )
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

On Wed, 02 Oct 2024 10:21:32 +0800, Pablo Sun wrote:
> This series is based on linux-next, tag: next-20240927
> 
> Enables the GPU on mt8390-genio-700-evk.dts.
> The panfrost driver probed with dmesg:
> 
> panfrost 13000000.gpu: clock rate = 390000000
> panfrost 13000000.gpu: mali-g57 id 0x9093 major 0x0 minor 0x0 status 0x0
> panfrost 13000000.gpu: features: 00000000,000019f7,
>   issues: 00000003,80000400
> panfrost 13000000.gpu: Features: L2:0x08130206 Shader:0x00000000
>   Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> panfrost 13000000.gpu: shader_present=0x10005 l2_present=0x1
> [drm] Initialized panfrost 1.2.0 for 13000000.gpu on minor 0
> 
> [...]

Applied to v6.12-next/soc, thanks!

[5/6] soc: mediatek: mediatek-regulator-coupler: Support mt8188
      https://git.kernel.org/mediatek/c/32ab0090

Cheers,
Angelo



