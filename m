Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7B5ECE584
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 16:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLkal1Ab/hfo4k1izmSkYPq/gUsrKPgGpDc1SoF3+dU=; b=XSBx67RafkT3hoTcHO+1aubR94
	owPkH9XGHHL7JMOjni/IXU8GYjUdqdX3CP7+O+MUVrpDNHDbjtfySGEczMbwdwevUsGYXcA1JtWxi
	u5esZUfHbemdGr6W3iTekZsigVIw8qAHD9WnImH8viDsBXGQ2IpsoLPhWSaetJ6JHqcXoWTLWCbK/
	iREnD/ASMIH69irc3vXVrFKsT1F1Y+PBsVOIKg/LNMD5IYsP/+dqHQH0B+QUqoD1DbOML+aVLU6gG
	6ihEggC1nkzlA9eTUuFR0PZUgiG3PwnSiz+tb/RmSarmicXeZKpdx8DJ+UVZqi8TP6jSto6PmDyOm
	KaVw4ndw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snhAj-00000002dVy-1ltG;
	Mon, 09 Sep 2024 16:23:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snh1c-00000002c7D-2peG;
	Mon, 09 Sep 2024 16:14:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 558CC5C0273;
	Mon,  9 Sep 2024 16:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68860C4CEC5;
	Mon,  9 Sep 2024 16:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725898439;
	bh=yDChzJjmgW4nM5O9QsBLIaNDGh7qLwtF9Pzw8gaiZE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BZsAWBkc1G1NQkcsSfhiqCXxlydEAaGbpwbSz25Wmo0unaFvyI7K4Z7iWGTAfnB6H
	 kh2clR5a9PKWr+rd36vKBo1lYJ/5CkSkeVrsvRGoRyGvaEml+xRBJJfeYF+F2feu4T
	 lDM7rxmkOcFqnQfNaKXPe0VorUsuEHuZKlEbyfroVRZdvL7L/+8pTizUt9y9KEPJrO
	 PXKMMysEOCxQL5Pkinfzgv7SnLvINHPQb4DoOejXE7Lozcq0AD9k+54Vrz4pqpHNdi
	 JKqOq7ZKZLTV4ALSGkayNabL/u4oef24HYgfo2QqfVn3VCUI4M5mtq3qmF+TIElc/N
	 hXRx50e987HdA==
Date: Mon, 9 Sep 2024 11:13:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fei Shao <fshao@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Jassi Brar <jassisinghbrar@gmail.com>, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 12/13] dt-bindings: mailbox: mtk,adsp-mbox: Add
 compatible for MT8188
Message-ID: <172589843790.327330.8035137632260512976.robh@kernel.org>
References: <20240909111535.528624-1-fshao@chromium.org>
 <20240909111535.528624-13-fshao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909111535.528624-13-fshao@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_091400_809691_E2506B41 
X-CRM114-Status: GOOD (  10.45  )
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


On Mon, 09 Sep 2024 19:14:25 +0800, Fei Shao wrote:
> Add compatible string for ADSP mailbox on MT8188 SoC, which is
> compatible with the one used on MT8186.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> 
>  .../devicetree/bindings/mailbox/mtk,adsp-mbox.yaml   | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


