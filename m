Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D2FC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 08:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0KyzH6iF/2h8WKmxHwC7DvzsHzEnM46mvo7z/nvS0E=; b=fLL4EFgFscC6LhHOWi/d8AOuNZ
	5b50KkcAfsFAcpxSG4IkV/Maz1XSL/DBvOvdNdpzvnMukewDnbikQHYN7YVxooX5qZh6lsgI8r49n
	Ap2jnAoR2HgWaPnt+vE3ceyVjOU/MDKYWDQ+Vk1S4XK1WTJ73Vhn/cfMw7MIkf6vBuCJuwnprFhBF
	gNYC/fBSAzFhcpfSFcjmMfIh69X0HlexBw+NU91qv6A4NUH1g4TNe2rjoJAul5nbobR9jFtHzTioI
	BF4vo4Bcer7anVFSvPB2jiyWsfBvsRGNVAI9hIlMJaBNJJRcSXfIsnTpA6IvcclV5Hl6oW4Z8hDXu
	iyh0TLeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy7Fv-006RKd-Av; Thu, 24 Nov 2022 08:06:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy7Fs-006RJE-L8
	for linux-mediatek@lists.infradead.org; Thu, 24 Nov 2022 08:06:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D845B62015;
	Thu, 24 Nov 2022 08:06:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5DEDC433C1;
	Thu, 24 Nov 2022 08:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669277202;
	bh=+hdVqNbGzl+XUzfQ1p3+T+Rghb2DWU3+wt8Ww6Qy7jU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=j55+x6av7TgZLYbiVh3pJoDs0aKnvGLNyVdNT5zborUjYzts+yQnJ0kz02D5BNhqO
	 dHyTGXnZLxY+LIC+hBFi5h9sdlTQS0hZFtyU2jHPOzeS9Ivwz6ktKmnxD3WaA3FAYg
	 JWpRTu+li9J9nnaVLXgJlDOjP1llGvrsLWO2u9HRcwvaNM4CSExop2K3T9smYrOhzQ
	 mp6IgDVSmFf0I8FWrIl8V8k2Reg+mdPu11UAJIRbLyifZ4cCMDd04xnTSw3Wziv5ZZ
	 JmOPE+wjZkH+jW6TG6FVASt5ldQYC6M2ztI15KqqdNtX122LXGosHgQhxfaL893ons
	 WuOBlHwEkotCA==
From: Kalle Valo <kvalo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,  linux-wireless <linux-wireless@vger.kernel.org>,  Lorenzo Bianconi <lorenzo@kernel.org>,  Ryder Lee <ryder.lee@mediatek.com>,  Evelyn Tsai <evelyn.tsai@mediatek.com>,  Bo Jiao <Bo.Jiao@mediatek.com>,  linux-mediatek <linux-mediatek@lists.infradead.org>,  Peter Chiu <chui-hao.chiu@mediatek.com>,  Howard Hsu <howard-yh.hsu@mediatek.com>,  MeiChia Chiu <meichia.chiu@mediatek.com>,  StanleyYP Wang <StanleyYP.Wang@mediatek.com>,  Money Wang <Money.Wang@mediatek.com>
Subject: Re: [PATCH 0/9] wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices
References: <20221122084554.9494-1-shayne.chen@mediatek.com>
Date: Thu, 24 Nov 2022 10:06:33 +0200
In-Reply-To: <20221122084554.9494-1-shayne.chen@mediatek.com> (Shayne Chen's
	message of "Tue, 22 Nov 2022 16:45:45 +0800")
Message-ID: <87k03kojxy.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_000644_785127_2676A01A 
X-CRM114-Status: GOOD (  15.26  )
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

Shayne Chen <shayne.chen@mediatek.com> writes:

> Add MediaTek new mac80211 driver mt7996 for Wi-Fi 7 (802.11be) devices.
> The driver first supports Filogic 680 PCI device, which is a Wi-Fi 7
> chipset supporting concurrent tri-band operation at 6 GHz, 5 GHz, and
> 2.4 GHz with 4x4 antennas on each band.
>
> Currently, mt7996 only supports tri-band HE or older mode.
> EHT mode and more variants of Filogic 680 support will be introduced
> in further patches.
>
> Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
> Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
> Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> Co-developed-by: Howard Hsu <howard-yh.hsu@mediatek.com>
> Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
> Co-developed-by: MeiChia Chiu <meichia.chiu@mediatek.com>
> Signed-off-by: MeiChia Chiu <meichia.chiu@mediatek.com>
> Co-developed-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
> Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
> Co-developed-by: Money Wang <Money.Wang@mediatek.com>
> Signed-off-by: Money Wang <Money.Wang@mediatek.com>
> Co-developed-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
> Signed-off-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
>
> ----------------[commit message cut here]----------------
>
> This series is based on the following series with fixes folded:
> - https://patchwork.kernel.org/project/linux-wireless/cover/20221110093525.29649-1-shayne.chen@mediatek.com/
>
> For easier review, the big patch has been splitted into multiple patches
> per functionality. These patches will be folded into a single patch in
> the final version.

I wish you had split the patches per file like I asked, it makes
reviewing a new driver so much easier. Reviewing is hard, please always
take us reviewers into consideration when submitting patches.

No need to resend because of this, but I am grumpy.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

