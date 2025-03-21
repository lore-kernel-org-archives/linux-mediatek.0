Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951FBC36002
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Mar 2025 21:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f3/ahBZgYfr5QGhY3NdFxhDpxuNvdguuT+JBJRbbarA=; b=4ec7I8RUMTwAqpvQmqeJbZqh/B
	hLtJvsU1okj4E7cg6+Ar17RqGa1O9hmVtHNJJ14VRN2be/yz5n3fPZo1p26uGzCd8O2Am9FY0Lsve
	hMKuxShZ25hSdBeXXTp3UJWcckX29+/at2xNrPuVf3JAzocxUAopYqHuAyuyOKwhxkDjxmS9WdD5n
	UUXnOkZ3JGCvfSEi6S5Hp91jhparGfpGRoudn3QwpVZ7FcE8PJ6whhAJWkI7JnlV62RYa4Z/dB5TZ
	lPsHIr3yw4KoZA6Xpqwa1mXg4Oi0NBkO9wmAP9nh8UCfUfOwMLo6RyDjuZ8/xd9I4NDreQ8lIqdJ2
	qI9R4HAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvkI8-0000000GPbK-2YvL;
	Fri, 21 Mar 2025 21:52:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvkGS-0000000GPJJ-3a20;
	Fri, 21 Mar 2025 21:50:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B862761144;
	Fri, 21 Mar 2025 21:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F52DC4CEE3;
	Fri, 21 Mar 2025 21:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742593851;
	bh=OuXsCIjww8IGPIERo9jMNo59TtIIO8iDeK1LYXy5qcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mRXd7UtIRqeAPMkVSIWqUxf6NRJDuETi5ei5Xx2ZrXry9WCOECAdPPwt+QM5r6O0E
	 Tgmg1fmyg3MSOvrtuJB/qszgX7onxH6yXKu74w47hxtBK8MOpgeHIJOx5FasxccWDG
	 N15PsR9S61n6PT8yuH5NQkMD+j2FER8vUrn/W6QLIjYCDjCs6Ln1wHf81ZtTcqgmhl
	 YBuOK9VADQqCk6zHzPlrO7N+lH9ykVYO4ulZlzlxZtv+fpu/Ou8kFe9wse4dTEb+tw
	 F+oWlaOntz9e20/mdckQPWqh5zfdYsDpOIBNrZlGzBjr8725fscNL5ZZ7t3Yx3iym9
	 LMgcSbPv357+w==
Date: Fri, 21 Mar 2025 16:50:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xueqi Zhang <xueqi.zhang@mediatek.com>
Cc: iommu@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wendy-st Lin <wendy-st.lin@mediatek.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: memory: mediatek: Add mt8196 support
Message-ID: <174259384769.4178048.13773796481091254405.robh@kernel.org>
References: <20250320073625.25225-1-xueqi.zhang@mediatek.com>
 <20250320073625.25225-2-xueqi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320073625.25225-2-xueqi.zhang@mediatek.com>
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


On Thu, 20 Mar 2025 15:36:16 +0800, Xueqi Zhang wrote:
> Add mt8196 smi support in the bindings.
> Since mt8196 has more than 32 SMI larbs, update 'mediatek,larb-id'
> maximum to 63.
> 
> Signed-off-by: Xueqi Zhang <xueqi.zhang@mediatek.com>
> ---
>  .../mediatek,smi-common.yaml                  |   4 +-
>  .../memory-controllers/mediatek,smi-larb.yaml |   4 +-
>  .../dt-bindings/memory/mt8196-memory-port.h   | 460 ++++++++++++++++++
>  include/dt-bindings/memory/mtk-memory-port.h  |   4 +-
>  4 files changed, 468 insertions(+), 4 deletions(-)
>  create mode 100644 include/dt-bindings/memory/mt8196-memory-port.h
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


