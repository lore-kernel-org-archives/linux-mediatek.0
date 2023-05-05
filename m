Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DD4C77B7C
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 May 2023 09:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bT+FsayvxI7HVYX5WADvS84xhY80KvQLewbXZluwnl8=; b=0IERDkPfWO9PxHOlLAMO1ozJNe
	YlkBCd68U1MnTkjyvIFU5xiDOHHmVKTA6meV6oMXvMKi+aAy+QLfv9EO8eoJ9VgQarZd7OozLe4rc
	0Tvu/xTE4WWBYc+X21OnrpMwiXENh7LeNTB7Aq1Df8sJznM7mH8mLjs0LUp9JXipD6vZjnVz6qE3+
	fArDSLrlMMdID3Z6hWHeZ85BfyfEzhvQKwTR1Dq+J2Qmj4KdVxDCqGO2pgJuRkc4/Onyk3yA8aiMi
	9iu6OnDzThT/HXYbk5/E20niQFaVELPe/USDoTgr5vvb5IKEhzmxv1qoP05xJ6Bnytyzl0pYQdOUO
	SZA8+ajg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1purho-00A8He-3B;
	Fri, 05 May 2023 09:26:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1purhl-00A8Fg-0P;
	Fri, 05 May 2023 09:26:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6032163CB9;
	Fri,  5 May 2023 09:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114A4C433EF;
	Fri,  5 May 2023 09:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683278779;
	bh=lSshFfSGlyCi4G0qcKJd031Akuz+SfzSDmjiM7FKFpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IOg+47p2FzSo6WXiYzWJqEGAZiRc5D6cLwe4n8/RYwwLqArfccLCr3x+fGPrUACbM
	 3hpfrSknlmvxQ8TbCWGivTgknyEGVepFt3BoUTOMunwrf4qKgnDMf70V+QrS1sQ+H2
	 SMu+YNYRppB5GdY27xveXRbuBlZ8qMJ5VMRWsZ5gTzptXjnNZtxvP1hJemO9HaitoD
	 X1PMNzX5Aa/VHFFZ/lfZ4zSZSPRIkMf6jnR2TEPiknUoBimmHGg4gwTQVGQC2E3+49
	 PbAtnCSUAr/eCbG3nyj12sLa/GqsolUKgeOtcBNkt4TrJGUkKFUsnoJOPTqSdYpoym
	 zch1EdXtNONUg==
Date: Fri, 5 May 2023 14:56:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
	chunfeng.yun@mediatek.com, kishon@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux@rivosinc.com
Subject: Re: [PATCH] phy: mediatek: Remove unusued ret and check
Message-ID: <ZFTLt5JJVtbX8HQh@matsya>
References: <20230505001945.10179-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230505001945.10179-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_022621_229990_2D5EA5E9 
X-CRM114-Status: UNSURE (   9.47  )
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

On 04-05-23, 17:19, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> This trips up a maybe-uninitialized warning, but it's actually just not
> used.

Thanks but this is already fixed by 714dd3c29a22 ("phy: mediatek: hdmi:
mt8195: fix uninitialized variable usage in pll_calc") in phy/next and
should be in Linus's tree shortly

-- 
~Vinod

