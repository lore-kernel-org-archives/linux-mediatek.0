Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DB6C3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 13:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+xVJ3ReYXJX/Q5q3xmlau+FJFUTwxemu5i8u3z1nTc=; b=EIEp72jqJppJP4dcVy8I2ovnzE
	NCwzAKjXMBRddjZ50cKMPxWS1gdixPcd/NKVriE4HNwqUEw+gCCW/YpLpHnWqA+a4mKCUhsMooEOZ
	xBVFim1mvB3ug8GUgzXlKIOHk237z5Vnzph3ecdcNYBiwDupyPNesnDiLecoAB/Eyz74OoqQWy6fO
	r3S+LFq/tItyCwfJyP0hV6TYdhgmVjb7n2VhIXuWIbeKYIbAG9EPeU19lJ9/w7bCQKWm4xUlc9zfd
	Rk/7BX4QEvAwM6fbn65EpE8+2cD0eWJezU7h4ZXuiE+VSLRO11p9dh8NqrKk9+5DnBlRWYGfHTYv2
	8WwRGI/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmnM-0000000FFO2-1emJ;
	Tue, 30 Jul 2024 13:21:40 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmmc-0000000FF9t-11Sj;
	Tue, 30 Jul 2024 13:20:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722345650;
	bh=eXaI/4FwsIpMMOSXo9miQuvnjamSIypwnH2R9aE0zu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oyIKrgLR1b61z1jp1U8LKQ+bZZe3UCz2uWQm94URXzu4zoq+R9wvNZP5BRiXWXwVw
	 Efsgz/NSbmMmINLLF8Bk3bBM2tA4AlfCLgXudpsrGd4sUrnJxWybYUAqq4gWHWf1sN
	 u+Ov361y5CTxk8f3zV57dG7TUhdABz23Gtb4O+POaikg22Q36674DQClbLbuiqk5Va
	 lV7simRNIRhppRx6kXW8b4SLdOge9q9fYTn3AtNRgbSgz7yZjshLRB1kEX1v6NuSF2
	 AreCuWMCZ30/+Wav1R4erGt2sWgHpKS11zYxMIILl9lEHihD45MaGGyi9s6gfrchgm
	 4fnlYZpk9tINg==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 478E43781188;
	Tue, 30 Jul 2024 13:20:48 +0000 (UTC)
Date: Tue, 30 Jul 2024 09:20:46 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Moudy Ho <moudy.ho@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8195: Add SCP phandle to MDP3
 DMA controller
Message-ID: <9820b8cb-2443-4085-a18a-264da51e0a08@notapiano>
References: <20240606-mt8195-dma-scp-node-err-v2-1-e14702e9d3f2@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240606-mt8195-dma-scp-node-err-v2-1-e14702e9d3f2@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_062054_444469_A1D5CD89 
X-CRM114-Status: GOOD (  12.85  )
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

On Thu, Jun 06, 2024 at 05:12:04PM -0400, Nícolas F. R. A. Prado wrote:
> While the MDP3 DMA controller can look for the SCP node based on
> compatible, it's best practice to supply the MDP3 node with a phandle to
> the SCP since that allows supporting dual core SCP as well. Besides,
> relying on the compatible search causes an error to be printed, since
> the phandle is tried first:
> 
>   mtk-mdp3 14001000.dma-controller: can't get SCP node
> 
> Add the missing phandle to follow the best practice and get rid of the
> error.
> 
> Fixes: 5710462a116c ("arm64: dts: mediatek: mt8195: add MDP3 nodes")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Hi Angelo,

I already asked in another patch, but in case that was missed: It seems this
patch was missed. Do you want me to resend it?

Thanks,
Nícolas

