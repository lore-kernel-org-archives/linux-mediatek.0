Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C020E606A32A
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Nov 2026 21:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z1GeEggz;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=Ef75yHj3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kZOrHoSAnT5UgnO8k0w22Mr5IvkNGKHdmxoMOe658bw=; b=Z1GeEggznh+TpQ
	nC0nnjn+aondQh8Uj6lnXCVH/UXeOiGlXUG+HgN5EdYIPKtPM+wknQpisX5T5Mt74f7SCYV5IILc3
	IRc3+dWNINAq4SLDQK0UwQy92VhJiQsTA8boWoCSe7eFSVIVT/e+0zigqm+jTgzTBXAZZVrrJKG43
	yxCojVv/jic4lXlbr66lMGHDNf1cyhQoNvuQ+xTtZpNrkCBKno1bdGI8MZW6gHIwsVoCbKsn7FKRX
	zmh3bTplThSPKw+kE1I4+Q4vq3X4qk5oF15hopSiuebMPK+Vpck17FxVmib55wFJuZ2Om78Dy+Iyy
	nDPnRA3ZP0foDHUnbGpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsTB-00000000KJM-1vxZ;
	Sat, 21 Nov 2026 21:18:01 +0000
Received: from out-239.mta1.migadu.com ([95.215.58.239] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsT8-00000000KIA-2EQB
	for linux-mediatek@lists.infradead.org;
	Sat, 21 Nov 2026 21:18:00 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=kZOrHoSAnT5UgnO8k0w22Mr5IvkNGKHdmxoMOe658bw=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795295875; v=1; x=1795900675;
 b=Ef75yHj383H0XQpxr9m/gL5cVF0vsky/wHvleIAq+/tBgzrJWJvwhMq3op1gev/Zm9TPhbpG
 LFSKYq4SpWLol7o1Z8I58+gtINDPMgul71WNLVDUjlfFMj12f5B0gSH63ldwKLzXm8ey2FDgYAg
 j01wwOnW7lFCrFqrgDOjM4Nube4XqwY+dUOTNkGTt8nRm9k5WSVRKhSC9qh4F0gBwMdR/xLwSX4
 1m2qgWMypcn88OK4NXmD96WgCDSThku497P/ovRDO+8sPb0BKlPGc4WSJQZav9IBH1kh6tiuYWD
 GOQjMAulVHjrNz+zvS2xpPTkuvfrl3i2/3xEOcrQZlBSA==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ec504e152cd85e24;
	Sat, 21 Nov 2026 21:17:55 +0000
X-Mizu-Trace-ID: ec504e152cd85e24
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Viktor Pashaiev <w.paszajew@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH wireless] wifi: mt76: usb: keep the tx worker parked through a reset or teardown
Date: Sat, 21 Nov 2026 14:17:40 -0700
Message-ID: <20261121211741.14944-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261021233935.748017-1-lucid_duck@justthetip.ca>
References: <20261021233935.748017-1-lucid_duck@justthetip.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_131758_853677_72F87F3E 
X-CRM114-Status: UNSURE (   5.65  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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

On Wed, 21 Oct 2026 16:39:35 -0700, Devin Wittmayer wrote:
> The mt792x USB reset and disconnect paths park the tx worker and then
> stop tx. If frames are still queued when the wait runs out, stopping tx
> parks the worker a second time, which warns.

Felix's "wifi: mt76: usb: do not park the TX worker again under
MT76_RESET", now in mt76, handles the same double park, so this one
can be dropped, thank you.

Devin

