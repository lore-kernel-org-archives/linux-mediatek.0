Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76179C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 23:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FCer5gAVUdd0FOEKf3tNqbl9xYTKwLqXI2J1NL9WLR0=; b=ozbwa0NM957hPphev1mlodRAGq
	ZEJAhGkAMe94bh3aWwAB1xNP6pQrqqjXiYJPyF2R6HU7ce4xk0n3vC6la6466/KNjjzKgGGDBGtPY
	fV5VSsbCqdDOAByGsjE+MfhdOnjVVMfI5hm6rEcLPdtY3FCGRQ3V5xy7556dHgEFFxrGpoat4rGJ8
	FnGpTg3xpWYAr37OTIPwqZmqOLDffPXVdCpozaxdR/+a0U76QSyLl++A+kUYL7SRYjdMu2N5kQ6Jm
	M6wvY7RcdRmhrDHeIR1H/2DT9jDXCyLZHSanbxUsVuH64XAmqV1GT/hoObytV4qg526mgfnBgDdEX
	3ltPzRpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6hB2-00EQ1j-8W; Wed, 29 Jun 2022 23:32:56 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6hAl-00EPte-Sb; Wed, 29 Jun 2022 23:32:42 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 15FBF6601907;
	Thu, 30 Jun 2022 00:32:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656545558;
	bh=oVgoLvTdsd3vaxbfPQK9/lB07D3jznp/onCu5eG80IE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DYZVTa/kWWCEzdcyPjtsQlw1LwuKtkD0cA6/9L6y/+nGcLOi0f5Y39k6bMiekFkxJ
	 tllDtSzjRfpkLgbBcUqOzzh07mw7maRlBggAZpCSxrQ1OxY80SCzM6lIQNbhSFz9Nu
	 dtcvEjO1VLsqpJpmPalVBEeTQTKSWdhM7kQNmaw1wGJ+TB9p2w87alNwjQ3njXGaA/
	 jPglypyCNmhveth26Otc10vnzbGfNpWHfTv3/fmqeddQzp9wkZx+COF2dmsNGZz4l/
	 VONMwpCVJSZNrGvcsNFjQyON+khcMPpYDEybH/X38JXJlSspqJZ7bkxmFge+i/pexi
	 KE//s4DwiSB9w==
Date: Wed, 29 Jun 2022 19:32:32 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH 5/5] arm64: dts: mt8192: Add vcodec lat and core nodes
Message-ID: <20220629233232.a3rz7vqu6qsq3gi6@notapiano>
References: <20220629121358.19458-1-allen-kh.cheng@mediatek.com>
 <20220629121358.19458-6-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220629121358.19458-6-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_163240_123894_6E399C4C 
X-CRM114-Status: UNSURE (   7.56  )
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

On Wed, Jun 29, 2022 at 08:13:58PM +0800, Allen-KH Cheng wrote:
> Add vcodec lat and core nodes for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

