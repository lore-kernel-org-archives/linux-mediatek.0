Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24EEC77B7C
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 May 2023 06:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4A4G4qwEPKMlunWXWecKMmAoXT1IA0fweLSiZ+GVAJM=; b=W2ezeeCn8cWs+mTJUMSVVSmPYO
	Aq/csh+THMXmK2y5bkLKtmVm82NyWE3n4dW1J4Xt1FZgvOgljABalNCZ+Ioutr1S6WLoGD+vv2N6j
	BAcIIhRRnXAF53OXks6y/kiHHVLHf1nLIxkIWnU8FNjBreUxlQ58viFmjrD/zMlgxFBu4FNAfk13+
	NA8igQJXJQdNgFW/fB3BJYVouozeaSm4AIWxKI7+2XmIG3R5z64Runx8uDsqqLSEvHMSFHCnNhMX+
	CmGksoiKLM5midwOcbtEz8arP4gE6LjuEO7xBU87jc3M2PiWymMjvMk+Zbw1ckRlWGPX4Pp9AQv/7
	2686QUfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puSpX-006ofn-1J;
	Thu, 04 May 2023 06:52:43 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puSpT-006oeb-2X
	for linux-mediatek@lists.infradead.org;
	Thu, 04 May 2023 06:52:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=4A4G4qwEPKMlunWXWecKMmAoXT1IA0fweLSiZ+GVAJM=;
	t=1683183156; x=1684392756; b=FKiabDFbuHvhs7iAfR6hTWXkqsVGIROfLk8bLCwV0WLV8MN
	c0oPshVdaFeq+/zTXkxp0lU/CBp1WEiCo5pgb+9A5GeQJGEDmNocuYn/M15gVtOghFixqHtnwGgql
	YvviZszojNEYg5OpaE9Rur6QqyhJIultGtiEH17SZ/Ah+osAnw4vptABRDg9JUwn272Emj3nFGoLF
	CXTZ9u8j8P8fwGiOU52MKcrghi7hmQhVRZlDl/LW+s+UeqbepgIUg8SIGuZNLfr6GgpweH/WTBd8I
	LAfmopWYcN/z4EhyU1o2eEpDp8fAfYvK5Ah9vMxyGb8Gw+KmOdbqLPjYCetga+Hw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1puSp7-00GpXU-2g;
	Thu, 04 May 2023 08:52:17 +0200
Message-ID: <d2e0469440d366c2323424ebfc1b634d669e1ed9.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: mac80211: Abort running CCA when stopping AP
From: Johannes Berg <johannes@sipsolutions.net>
To: Michael-CY Lee <michael-cy.lee@mediatek.com>, linux-wireless
	 <linux-wireless@vger.kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Money Wang
 <money.wang@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>
Date: Thu, 04 May 2023 08:52:16 +0200
In-Reply-To: <20230504061049.21082-1-michael-cy.lee@mediatek.com>
References: <20230504061049.21082-1-michael-cy.lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_235240_035416_5A7BC759 
X-CRM114-Status: UNSURE (   4.55  )
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

On Thu, 2023-05-04 at 14:10 +0800, Michael-CY Lee wrote:
> From: Michael Lee <michael-cy.lee@mediatek.com>
>=20
> Signed-off-by: Michael Lee <michael-cy.lee@mediatek.com>

A commit message would be nice. And maybe a fixes tag?

Also "CCA" is something else, not related to color change, not even sure
where the "A" came from?

johannes



