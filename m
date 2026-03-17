Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7C1FF6E86
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2026 21:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b97wXvolFR+e8uTxUV44AIrk4klW4uv/w8rxmuRBTvM=; b=CCRATHEDwhS9ZX8JXYHt/h0FZB
	5P5CyO+nUmu55ESPXr4cF9k/njnto+8bVFjfV3myDjqzTP1XY/OazObg7WRUy2m6y8HzJALZH49H+
	YwWp/6Gn+YJZaOA/mOSFaS0qVZ0nXPiCHPgdYliHYlTPxofAAbY6WlQWjwqxyf8MKRf9iTuajqreD
	pp+/jtkiAMRNcu4tQSn/VAKU1uq2F/oH+8Zj0seJVRLiMOvgZeZSG3hnMazek56zaWi1lFOEu6cHg
	ALELmqnWFP3ISUsRmI0nTlXuBNNSXj4gtEIiAONaw2Wpy3/bp0Q3Oo6fm0xVZuz2qSj46uUVjxh9J
	dBJjHbcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2cKj-00000007HDh-009L;
	Tue, 17 Mar 2026 21:52:13 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2cKf-00000007HDH-0Yc6
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Mar 2026 21:52:11 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=justthetip.ca;
	s=key1; t=1773784324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b97wXvolFR+e8uTxUV44AIrk4klW4uv/w8rxmuRBTvM=;
	b=McNzcTmJC/2il2UOCI/lu+tEQ/UnzmIk/CqheZbms3XrfXVudpE2Sqp1z2HIv5bVLqwZb4
	SJhalPo3N3PXezbvWJ3XLI2z8fAuvTpyJNRO3iJRcXdB5SYKMQ+ICd82QhaPJIzGuSaBUx
	f0R5GIaoRWO51l69I3uR1RZSknF8vtv14benj6MKNUR/9ML6i2Pkr4jDCfUtI7g+WMMOfs
	OeN6b9tzCB286cOHGF3wIz/md6LNP3rmjwWuvWVaI4ZB5qQ4ON0S8cGVjn9meD6IPsPYCL
	wYiSYjMv79B/FxMt5xwg+oV5kSD5KUoB1Lr7Hl7csz/3dQT8oCy7iGm6EgA4Pg==
From: Lucid Duck <lucid_duck@justthetip.ca>
To: linux-wireless@vger.kernel.org
Cc: nbd@nbd.name,
	sean.wang@kernel.org,
	lorenzo@kernel.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 1/1] wifi: mt76: mt7921: fix txpower reporting from rate power configuration
Date: Tue, 17 Mar 2026 14:51:58 -0700
Message-ID: <20260317215158.152921-1-lucid_duck@justthetip.ca>
In-Reply-To: <20260317173016.136975-2-lucid_duck@justthetip.ca>
References: <20260317173016.136975-2-lucid_duck@justthetip.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_145209_593620_60CD372E 
X-CRM114-Status: UNSURE (   3.50  )
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

I missed adding the stable tag. This bug has been present since the
mt7921 driver was introduced, so it should be backported to maintained
stable kernels:

Cc: stable@vger.kernel.org
Fixes: 1c099ab44727 ("mt76: mt7921: add MAC support")

Sorry for the oversight.

Lucid Duck

