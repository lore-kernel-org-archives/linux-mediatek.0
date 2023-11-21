Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075E0C61D92
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 11:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WAtOnq5t69wz6MlZEAonSf4gDXURb2kTiRYoajtaxQ=; b=UNAjeQN6PKozOPaAIeq2WXxT7u
	FVXRRlEQ8U2HgJKR6a+u4yfXvrQ9vLNdfImggQ7DHe8hS2w82DZeaGWrl7MoheAahXjdTfUf+GnBd
	C7KCx4uF0e+SNoJTu+Oeid/7TcHoonLqpKrdCIm7gjmm4KuaToHswxzGpUGecOvzEh3ULnvDcJCoV
	aHS/cLFuSn6kJKhL0Y7NjmVY77K7sRnhnXdzWdS73Y4ay2PoG98jpVo7RiiCp08El4QuaIYo2Gdgs
	/tPRJxoT8eQnnxxBaRWDNR1oTmIbOT+QRorTcV0Fyvpm+taI8eWBmUNw06XtWV81z2nGv53c4QcAO
	VASc0bBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PEc-00Gba3-2H;
	Tue, 21 Nov 2023 11:48:06 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PEZ-00GbZW-2I
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Nov 2023 11:48:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C91A5CE1B6C;
	Tue, 21 Nov 2023 11:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9165CC433C7;
	Tue, 21 Nov 2023 11:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700567280;
	bh=jAkO0wCcoQAJh9kzzWEPvEYnyVg9GBQBsbrBcf4OCYs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=YiBmB7g4IWPSTl6o4cY+YpPGW+h1wj1Y93vHEIqoH75K9Nw7p6dSlecIAV0uYbxHR
	 ZtSjJ6DnREKiOSycEFmzPa7OXt/gA/i9LhY1RdoSBNoNopXeVrCxP7QVi/45IcYXC7
	 f6HXQs8QdjX1mCASGS5IX6nYiW73o1OdTls//fLDRAOria/uw3BgaU25c/Ua8J3Bi8
	 UGd/hWV+WaZuGLqttEBt7TaoGvH4lymxMpPH685/4UTibh3+Mxni/Zm7aeEMvf0c2t
	 GtISl7o1Pvsq/JN+VOJUe8BNTBpISM3uM6610R2jybk7iQM8Hr/IrwBy3NvP9MIgL6
	 dqKwYylq489cQ==
From: Kalle Valo <kvalo@kernel.org>
To: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
Cc: <nbd@nbd.name>,  <lorenzo@kernel.org>,  <deren.wu@mediatek.com>,
  <Sean.Wang@mediatek.com>,  <Soul.Huang@mediatek.com>,
  <Leon.Yen@mediatek.com>,  <Eric-SY.Chang@mediatek.com>,
  <km.lin@mediatek.com>,  <robin.chiu@mediatek.com>,
  <ch.yeh@mediatek.com>,  <posh.sun@mediatek.com>,
  <Quan.Zhou@mediatek.com>,  <Ryder.Lee@mediatek.com>,
  <Shayne.Chen@mediatek.com>,  <linux-wireless@vger.kernel.org>,
  <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 0/3] wifi: mt76: mt7921: series with CLC patches
References: <20231120032750.19747-1-mingyen.hsieh@mediatek.com>
Date: Tue, 21 Nov 2023 13:47:53 +0200
In-Reply-To: <20231120032750.19747-1-mingyen.hsieh@mediatek.com> (Mingyen
	Hsieh's message of "Mon, 20 Nov 2023 11:27:47 +0800")
Message-ID: <87fs0z8h06.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_034804_009978_D1B8FA2D 
X-CRM114-Status: UNSURE (   6.16  )
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

Mingyen Hsieh <mingyen.hsieh@mediatek.com> writes:

> From: Ming Yen Hsieh <MingYen.Hsieh@mediatek.com>
>
> Sync internal mt7921 patches for CLC.

What's CLC? The patch title and the cover letter are gibberish for me.
They should have an understandable introduction in plain english.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

