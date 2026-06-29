Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A345AC44500
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2026 14:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYFgpODSCVX2C5CNzgVOEDY1ictoCpmsvxoF8q8OHKo=; b=47fi0nf1BKREp3xGh/WnjCcmon
	Q4NQFcPc66E26UL2kNhD9o3e5pFcO6UdlGEg9gOH4wecVW8TeqFSBu9ci7FEfKsCEHFs0Ip/KekL8
	nRixtpAZyD3ykExpb6B0qkG8UCBb0QPoQFF3pFU6DxGKr3xFYyXFpcLrDvb+k5yUAVaZLM4C7m8nL
	8/7NJGrzGVL01ThY8n3KMMJiF7lcHOtsoHHizfiUjbpNLZFESXhBRLS9V6AF1eBJgUiI+2B+Q4f7B
	LbSi2tmeY/OOc9+VLNc+nXwCTQxFoVh6uH1FDn70gpxRKYz10i3ybEIgAM/mHE9nOq49J/Y+/J8Ee
	CvP2lthA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weD9S-0000000Eu8Y-303o;
	Mon, 29 Jun 2026 14:39:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weD9R-0000000Eu7H-2mON
	for linux-mediatek@bombadil.infradead.org;
	Mon, 29 Jun 2026 14:39:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=TYFgpODSCVX2C5CNzgVOEDY1ictoCpmsvxoF8q8OHKo=; b=fTJXEkCAP/kcm06YjMtTdvobup
	w3YguxqBGBjKIDyyAmE2z/0bPiRVjm6UMOAfz3UJAi8faEGxbUf/uHe7cHH3wAXA3v+HQhxkeBoXl
	7Bw3GzZAWTEfkMgtNSxFyU333081F8zkBPb/TluZKlHbjafMXtZkV0rct3c7C+jWkaelKcihW+aMR
	p2qE0s/ffffe8yEzk6fHyb1PyWUYADV75vk37NbrMWz8+jNIkZiH3rj+PiHqnHlnVXSinMtm9W1Iy
	0UQ0N+uLiaKO0/BS08FVmkkx8g+teP2mlgOGmoOmHwyyWHCS89sKHV+Zvza4wteF3AuhdDZdpWHqx
	FM3baEHA==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weD9N-000000017j1-2ITQ
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Jun 2026 14:39:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1110E4E407AD;
	Mon, 29 Jun 2026 14:39:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D86715FF96;
	Mon, 29 Jun 2026 14:39:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B956A106F189D;
	Mon, 29 Jun 2026 16:39:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782743984; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TYFgpODSCVX2C5CNzgVOEDY1ictoCpmsvxoF8q8OHKo=;
	b=aCINo6MownjuVkcTFqrBr6oSrm3KiWHhDbzIYYJ/yhUTr3GRLSU5pNQBR3xUhiWKC5lRAl
	zKe52tasxQ7pMqqgMxsDYO05TRJUMwagkFZ0v4+NTv8gGVKvA8tznu1Tz4vfhKHeIDN4mM
	gZPg6uMlPb4kb+cl7JI6OMHegkXbnn/2CeKQ/sbXDd6lxM9jSSndONVpxCF+Kfg0Xqf6V9
	Xs4gZjXiYC4JxCCzTVMUlCo4GMmJhXiO/ppDooUwI08QuSvtKKYIPF0+zsv0nia5qnlpn/
	2p1CgPs/Unv4XUBFxkU06v+4IAyS3dmeAyjqRqzickQZpPppazvjaRub7+36EA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260615063232.44383-1-pengpeng@iscas.ac.cn>
References: <20260615063232.44383-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] mtd: nand: ecc-mtk: handle ECC clock enable failures
Message-Id: <178274398069.256048.11835186154105614379.b4-ty@bootlin.com>
Date: Mon, 29 Jun 2026 16:39:40 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_153953_965357_4C6B6AB4 
X-CRM114-Status: UNSURE (   7.76  )
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

On Mon, 15 Jun 2026 14:32:32 +0800, Pengpeng Hou wrote:
> mtk_ecc_get() gets a reference to the ECC platform device, obtains the
> provider state and then enables the ECC clock before initializing the
> hardware.
> 
> The clk_prepare_enable() return value is currently ignored.  If enabling
> the clock fails, the code still touches the ECC registers and returns a
> live ECC handle to the caller.  The provider device reference acquired
> by of_find_device_by_node() is also kept even though the handle setup
> failed.
> 
> [...]

Applied to mtd/fixes, thanks!

[1/1] mtd: nand: ecc-mtk: handle ECC clock enable failures
      commit: 82d9a2b45b170f0c52ac61e0e3e23f212cd065f0

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


