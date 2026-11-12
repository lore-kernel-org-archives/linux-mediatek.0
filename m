Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4EA606A8B7
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 09:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dBO0paso;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E7pVGTfa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=x+rfaCA4ush8qUVvX6S99ceUR99SDAoQmuJBN2GZ2D0=; b=dBO0paso/XAOBZ
	akFLYXPO/xzQk1a7hhq/Uc1vpy+qngyOlqEAwxydpimIBjo/ZEKuVqqX9cn0gbwMt8G1ebtJBMRv5
	+DFoiA4ie50AT4KDgfjVStszjftoYWodQjD0CKlc3sbzpbzXdqWXatdKTjtF6nZ+gRQEfF9Z7uuXs
	dhJK9NQ2f9IaXqQFkP9LktCSrVL/5bXe3qJ24XwTI3w9d71N/IMjcljgyRYWDLqcAJk1jvwdtQx0B
	F8UUsxRcuFOR4j9XiQHS+4YIsIs8NqpukaDrNAYtHMdqFCTVl9Qa2g0Rm3+w5lnXMCplp4DJ2Jd8x
	OKeYSiaEygPPALS11W7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQjA-00000009HRQ-3Z4t;
	Thu, 12 Nov 2026 09:04:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQj9-00000009HQw-1h8F;
	Thu, 12 Nov 2026 09:04:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2EBDE40786;
	Thu, 12 Nov 2026 09:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB4611F00A08;
	Thu, 12 Nov 2026 09:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794474255;
	bh=x+rfaCA4ush8qUVvX6S99ceUR99SDAoQmuJBN2GZ2D0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=E7pVGTfa/QUTh4zoDzj9GU2Uu0CN8QWmD1EgT/w8MZu/y4V3t20F+xxh2Wk+rU30f
	 T2l2OMTV/bTbFwK8iB66kycMxdzXZFrN/TcGQF5TTgpY/SbZGv7VujlAkJp5D9+1vF
	 ov0kqMTxkxuryn38uQ8G8eW/u51we0N1xoZtYU1/Eys1vY3fd1v+djxoqZ5MleJNVj
	 FYZRAeRtwKqEu4Hu+rF37tp6HwTPmWO4EkDhlAfk6HoU65g+QiENd8WX87avWTp1cY
	 7AD5+1fxCA8kzKYeVRAOcYoI/fHnYsy3VRbULrMpsa0/yxqXxojfq7rM2KalJ+hUeV
	 u0KyRc4AagpiA==
From: Vinod Koul <vkoul@kernel.org>
To: linux-phy@lists.infradead.org, Chen Ni <nichen@iscas.ac.cn>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20261008081027.3889413-1-nichen@iscas.ac.cn>
References: <20261008081027.3889413-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] phy: phy-mtk-dp: Remove unneeded semicolon
Message-Id: <179447425353.428303.4512833714146244885.b4-ty@kernel.org>
Date: Thu, 12 Nov 2026 14:34:13 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Thu, 08 Oct 2026 16:10:27 +0800, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
> 
> 

Applied, thanks!

[1/1] phy: phy-mtk-dp: Remove unneeded semicolon
      commit: c1850f4997894fadc101b95cacf3752cdb6be0eb

Best regards,
-- 
~Vinod



