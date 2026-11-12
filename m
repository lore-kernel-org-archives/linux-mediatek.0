Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0AB606A8BC
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 09:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yQIsomjZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uyrd76u1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=A8iyex9cYMkKxvqxqG1xwYW9Nwxn9W0BRlqiRHO6lXE=; b=yQIsomjZ73eYXE
	FvoGwCi34EXXPWDBD76jZd9Iyr8RRfgMlHOzeBZ/v7LtPwpjGChpT0Uc8A2/e2MTBKa2rouyE8zDM
	X/F7qxhNsUELESfdKUQhhE5/l0EvcZF//RyKw4+yPTuGYceS9CBWylx6nRqDP7ri9ZdQ6rDik+8ib
	UzF1W7Nh2wxGWlCRi25czzhwd6FZ+YiQ9Q59ONFXCwd0Fd/Qt/Y0LEIkQ63SWopifOFjRaM6KA+ct
	zXejbdd0J1UW97zN5krvuEDvCiMfY+gNCd/HtoiM9Mc3c5DxgP+UvU5RQjVwGTXZgL803PWzaCQFZ
	Odhr9eCWEiPotlYcStpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQjD-00000009HSx-03cR;
	Thu, 12 Nov 2026 09:04:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQjB-00000009HRe-0gH0;
	Thu, 12 Nov 2026 09:04:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E54BE43BF4;
	Thu, 12 Nov 2026 09:04:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EFF41F00A06;
	Thu, 12 Nov 2026 09:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794474256;
	bh=A8iyex9cYMkKxvqxqG1xwYW9Nwxn9W0BRlqiRHO6lXE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Uyrd76u1nOvfwz6b3m4E2PnaDOy+CYcLXf7d6ehS95fDY4nNAsXb0O+hJbEEWaDyJ
	 4U0UXGl5Idwg2LyJkkUDWWmBUM/WqqEx6vzMgoWMHHMS+lpk2cmm5w/146O6cy5jLO
	 KI1Vs31JRqU+qY7H88iaJB1C5BGTlJI69vexccGvOB+YvTaYc/1Z/zVV6BOik442uc
	 vYXztlEGb7Y6kLTBcIzqMDtR3IbWOcZXGWVMxJtuUa1Mxvwq3go5LS/2p773wpmPWw
	 DCbSzLQm7ddFhcrdVH34XtQFpM00y7FPg3WxZ7ZhYCtsc9QFfrVtj2G0lOSxxvMNqh
	 3SUzEe2GVxVLg==
From: Vinod Koul <vkoul@kernel.org>
To: linux-phy@lists.infradead.org, Chen Ni <nichen@iscas.ac.cn>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20261008082242.3890614-1-nichen@iscas.ac.cn>
References: <20261008082242.3890614-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] phy: phy-mtk-pcie-sphy: Remove unneeded semicolon
Message-Id: <179447425529.428303.16030031802360196858.b4-ty@kernel.org>
Date: Thu, 12 Nov 2026 14:34:15 +0530
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


On Thu, 08 Oct 2026 16:22:42 +0800, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
> 
> 

Applied, thanks!

[1/1] phy: phy-mtk-pcie-sphy: Remove unneeded semicolon
      commit: 39515eaa61116b7ff32e935458b682b1c5ce0f94

Best regards,
-- 
~Vinod



