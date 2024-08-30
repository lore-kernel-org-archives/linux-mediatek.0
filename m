Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8985CA1004
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 15:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pDt0mv0FxdO/SFYLH9NKc/21x2V5goVaLIbOQhTAmQs=; b=oE3Vl/QJqJu4nPUNzTkmjGQZst
	KhnVrnLO8EvZCj7v1sSe8JhOMhPShwFDml6VyoH3tyvakEMtbbogutkOK6kqcbfuKQBWrCLzlOxr3
	9FNa/YtyZvWPR93c48Lzzc2d3LZFS2ej8n4MdYjkOsVp5C+Xn2ibbyB8XXBr1VteUKEIO6ZwXQV6H
	xL8npAJL9ophaS2hbxPqvBW/Y2XqMypTzW+26Qpc0xxxAOv4DXPe/xYwJ0xjcNMbDXuo8hSNBzWi+
	N3JopyOoDyPxVZh7jegkE1DxIIINqJUCfMTrM1GLNC+viwgMxcFn4WVWddzPdDSraUK7m58MlSoxL
	//V3gC9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk3hA-00000006qYd-1Ymh;
	Fri, 30 Aug 2024 15:37:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk3e6-00000006ppe-1Msj;
	Fri, 30 Aug 2024 15:35:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 40569CE1E6E;
	Fri, 30 Aug 2024 15:34:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36455C4CEC2;
	Fri, 30 Aug 2024 15:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725032079;
	bh=sMhjK2G93E8pRdOEGgRej93yB0F8vhk+6uOsJO083iE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BGu2EEG4qNddC56ktd+1VgcidfLuPMPi9DcvYjB8+u+ih72S9+0T0da4r8ynZnk3g
	 uR/6O5p6dBovtm452fMouESkWIiCaWQUfBRivhC/tUQ64Np56kzACgQ+N5XZ+qxpVJ
	 e2QXDNUpP+7nKL9d3OlS3Rwkz4Tq04Ccw/3LjyXnfdQqgefQt1EAS2K682LY4cetbV
	 N1y5WDQj4SEetgbGNmagrg5ajX/6/W5ZmL4qsIapmKNu1lpl3iqkTybW/MclgMf9vf
	 Qwa7DbNb4yqKc4qE0/ylwDVkqcbTik4pTgPG9Cq20KDSUbfiXsxUUScfIlMlLegBaw
	 xMaFmb9Ds0C7A==
Date: Fri, 30 Aug 2024 10:34:37 -0500
From: Rob Herring <robh@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, Sean Wang <sean.wang@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Sen Chu <sen.chu@mediatek.com>,
	Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v2 3/7] dt-bindings: rtc: mt6397: merge to MFD
 mediatek,mt6397 DT schema
Message-ID: <20240830153437.GB4175444-robh@kernel.org>
References: <20240830110732.30080-1-macpaul.lin@mediatek.com>
 <20240830110732.30080-3-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830110732.30080-3-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_083442_558993_F3B72E88 
X-CRM114-Status: GOOD (  14.22  )
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

On Fri, Aug 30, 2024 at 07:07:28PM +0800, Macpaul Lin wrote:
> Convert rtc-mt6397.txt be compatible with the DT schema.
> Since this is a simple RTC device node, merge it into parent
> mediatek,mt6397.yaml. Subsequently, remove rtc-mt6397.txt with a
> separate patch.

This doesn't match what the patch does. You can just squash this into 
the MFD patch where you add the schema.

> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../devicetree/bindings/rtc/rtc-mt6397.txt    | 31 -------------------
>  1 file changed, 31 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt6397.txt

