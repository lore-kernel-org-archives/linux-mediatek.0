Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D13DCA0FED
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 15:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6rE2Mo/S6FC8K9CPr0EZ3GEd735ek87jyLmNaVnpPyA=; b=oGiQ5qbRepSMKtjGL0I/N9O2ZX
	j3aBSnwIBS2o+Xn3fsIfH3VzOk2R/KEEnB4ZFrN21DoWCytG/JzuJcglFtjYeO2onn86NalMAZaJu
	9iWIHAU7LkQrQe4lo3nKUe0C9+jKweoAAOmCl7bYu53SVFy5mnDDyzDNMLuP1W6GIWnDYkdhdUiFy
	8bQ23DIoZ4gKwythhkBGx3JT/4SxjkcLjXBnIc984anQnBlMNTyYy0ansx4pCWct1t2U8AzEMQbc+
	pAsfgtupCa5XlBq1HoVpmsCeuvt7ZwrHzua+6EpWDeVqyM0HSngC8WxXKYXcKJGFhqbQ9JpiSuiT1
	bVZ+1zJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0TD-00000008BcY-0b9p;
	Tue, 09 Sep 2025 15:41:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvv72-00000006Bg3-380Q
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Sep 2025 09:58:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D02D601BA;
	Tue,  9 Sep 2025 09:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB58C4CEF4;
	Tue,  9 Sep 2025 09:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757411887;
	bh=L8J+G7X3cATY+Wpwe2QZJ086a3PvYwOheYLmI2a2b/0=;
	h=From:To:Cc:Subject:Date:From;
	b=AaVF3oBmW3ZuTPgbCdu+lti3ixCelDqxQk1Q6lpUWb2bssmiSP+9qv/Wka7ekcY9n
	 a14ijqcwI2CcN9/Ag7RwMEOLFkC7IrujIjZP/FhYTU9eCa6m2KnjL1WX6xLTQT3jR9
	 V1SqlPTAarB5BgBY/hrsRyyBB6JIICnT1jEJsm7ASmnlid1z59iyP8AdUXzA4gKJOX
	 14+D0PjznyC8v7QUnB8SZUhTFqiC4fLAVimwVgt3AncJvDxzTz+ftv8+50S7dgGdU8
	 lACeti7DfDV7+XtkfcgxSRV/f3RiZh+uuttKHXqGZGOhxp/qvCguFJK5+ys1SRL9lK
	 euUCvceh7MyaA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1uvv6z-000000001Su-0Thp;
	Tue, 09 Sep 2025 11:58:05 +0200
From: Johan Hovold <johan@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Roger Lu <roger.lu@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/2] soc: mediatek: mtk-svs: fix device leaks on probe failure
Date: Tue,  9 Sep 2025 11:56:49 +0200
Message-ID: <20250909095651.5530-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This series fixes mostly benign device leaks in case the svs driver
probe defers (or is ever unbound), but which should be fixed if only to
reduce the risk of such bugs being reproduced in places where it matter
more.

Johan


Johan Hovold (2):
  soc: mediatek: mtk-svs: fix device leaks on mt8183 probe failure
  soc: mediatek: mtk-svs: fix device leaks on mt8192 probe failure

 drivers/soc/mediatek/mtk-svs.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

-- 
2.49.1


