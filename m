Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D28C021B8
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2025 09:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2WAbQXSXaGvM32JXh/SdBxTvg3DTs4VP0FUGSg+rI4=; b=MTMUB3k+pMo1YzjljxvvJrWn2w
	6tVHcaKbUkTpqy2/EiH4NHmUIsI1fx90rmR6SB+bWyR8pZmCMcj3GtWfZTA5dAGFOVbZZ+EwlFbLh
	8F7jGVDB8bdl1HvNv00Xfr42q8pp0eixuI5GJrwmRZN4u6GA+tBpLV+ARpNTEviqxyvQbtXJnslRj
	vrjBIW3G/DlwoQOTk15KtyCgI7Iu4YHNevIOGh88Zb+tPiUTHaJE/0IASF3u0mXjaP3sIlpmP0psx
	y99fWIp4WUKTOoT/MrN8POVhRXD628nHuroN/UBEygi3E0fdo/O38VdF5y6JOvNIKUHL0HcgTYCMw
	dWsUdNhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDqR-000000037HR-3dci;
	Wed, 26 Feb 2025 09:36:47 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDqO-000000037GD-2Vf2
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Feb 2025 09:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=n2WAbQXSXaGvM32JXh/SdBxTvg3DTs4VP0FUGSg+rI4=;
	t=1740562604; x=1741772204; b=gh53jl+/7uX+24ZDrQe2l+IQzgIMHiknaLglWZpiisWrBuy
	+bWvXX2oZcc5OJyDWth3HNXBRXeo+NxC/Wna5WehChKHd81ypL0PHcjEULmz/7feWPBq2i4VpXBQu
	wkQn1jhuBXs9ElqWUQPj4HPGT4NwyoU11jf/cY6Cp7Y4oAbVJmq1JyVzgqI2OEmqXr1QfqByBf/zV
	7iAp4L54ELh0ttNVNakOS/Z+baHtioBp9U47qRBFP9JGf1y1/hTIn6x6cq39GmkQvYaPzsNTEZc6/
	SrrbdxdhZohpduh2/ENoJEFMyXobBEnNy+6fPVtcYEKvLFZMPBtVQbTDNsTTYVmQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tnDqH-0000000BLoK-3nhb;
	Wed, 26 Feb 2025 10:36:38 +0100
Message-ID: <cb87ed76c1cd85611f0a7c1ce1f248bbe0e2d978.camel@sipsolutions.net>
Subject: Re: [PATCH v4 1/6] Revert "wifi: mt76: mt7925: Update
 mt7925_mcu_uni_[tx,rx]_ba for MLO"
From: Johannes Berg <johannes@sipsolutions.net>
To: sean.wang@kernel.org, nbd@nbd.name, lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com, deren.wu@mediatek.com,
 mingyen.hsieh@mediatek.com, 	linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, 	stable@vger.kernel.org, Caleb Jorden
 <cjorden@gmail.com>
Date: Wed, 26 Feb 2025 10:36:36 +0100
In-Reply-To: <20250226025647.102904-1-sean.wang@kernel.org>
References: <20250226025647.102904-1-sean.wang@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_013644_927845_7174C547 
X-CRM114-Status: UNSURE (   4.15  )
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

Dunno if this is because of the tree it got applied to (Felix please
send me your tree info!), or something else, but check out the automatic
checks here:

https://patchwork.kernel.org/project/linux-wireless/list/?series=3D937821

johannes

