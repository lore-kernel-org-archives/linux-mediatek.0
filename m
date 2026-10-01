Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE732CA5FCB
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2026 12:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjdWTCMCrG0qSY5UkWMV3CxXtTMt/S/l59K8lGrEUjI=; b=JuJZfra/0Ho3TEojxlXyd6aBfc
	ZZDpNB7WnWyFtau9gX6Q2HE5bTUvm8LAly9uNSGFyLpsVwoqx4UrzbNhrAJOexVcnPAo/duXPfjza
	3SoF8Dn2sCFInTmps+RFbuKE9vAGerF0ENcZSS8i5ZBrtUBx7yymaA/8A59sCS9eGE7fakmTGF1YH
	pDK58dV12en5w54IEl+2AABmepikabIZwwaxM/ar4A65qVT3v9QkUFPF7tvWq/AuFA01XIV9BcPLZ
	/kVQjV7oyK6JAlcQQAP26AsirG+BMqvK0GbJ/n3i/m9ViG7qjFDMkTX6DkjJ8/28qaEom/WCzAXnR
	MU1dAaxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFeg-000000092ES-2jWB;
	Thu, 01 Oct 2026 12:12:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFee-000000092D6-3OjJ;
	Thu, 01 Oct 2026 12:12:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 080EB601E4;
	Thu,  1 Oct 2026 12:12:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8428B1F0089A;
	Thu,  1 Oct 2026 12:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790856771;
	bh=BjdWTCMCrG0qSY5UkWMV3CxXtTMt/S/l59K8lGrEUjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mv2uQhff028iEsz0sMG1AJEXmo0Q1SoxZBqU74WS7UHjYb5T1cA/NF8YNj3zfPWCN
	 zy7VyZ9jMQkJn0TEBD+4Uju18urhDsM6ioXFMI7+46fet+ECfZxegY4BBOF0EpL7mx
	 g05v8WCce9xWCh26rJ6O2p9lT6a0H4rDPcP/kOMcCU41ENhkJFrW7ipb45TyqBQ51F
	 965Qx63eAXN8Wx39QaWNFOB5V0IygeoJqWoImxkUMA2XhkMESaS1P01luR9z1GvKyN
	 ltfQpb+toIrithbl2tKEWP1nT2cPDW4NvaI2dDvc4SyDXZ/LSC+9ul0bQaVkfC5mIa
	 AP8qgOPW2155w==
Date: Thu, 1 Oct 2026 14:12:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: arm-soc <arm@kernel.org>, soc <soc@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Subject: Re: [GIT,PULL,3/3] MediaTek SoC driver updates for v7.4
Message-ID: <20261001-quick-curvy-dragon-b0fbdd@quoll>
References: <20260923103222.25504-1-angelogioacchino.delregno@collabora.com>
 <20260923103222.25504-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260923103222.25504-3-angelogioacchino.delregno@collabora.com>
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

On Wed, Sep 23, 2026 at 12:32:07PM +0200, AngeloGioacchino Del Regno wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-soc-for-v7.4
> 
> for you to fetch changes up to 96c2b43b1fb305e91700f64e9f758fc140c66b83:
> 
>   soc: mediatek: mt8167-mmsys: add routes for all display paths (2026-09-21 15:10:28 +0200)
> 

Thanks, applied

Best regards,
Krzysztof


