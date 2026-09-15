Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8606C88E53
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 13:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqNJN6r+R9FTM7z/9qcKuZusSlTXIajY6lxs4DtiQ28=; b=MoZ0gWGndACGOt0zlIQsA8i3kl
	am86zey3ovQ9qry5F3VF9GG756FFtQHSolOWGK/NETJGwOBHpeB72oakWHOV5fAhiWQmr6WlLbcej
	OgmngfkmBglZUdpEd/iBqV/70FIxwFaFY/QC8aPSwFKjG5LESAcwJMvfqxE0OihStbbMpxS0XwEG+
	PH6t4vBXEXydltdQT59HUWwRiXcV+C6N9BCiAqsZHqz6PvQZuh5LL66p6zn9fBUwqlUkvBlFmT7wJ
	yJh9uonTHiE76qyV9SwqolDBh6va9C/L8z32XC9nBtRiQ2KqVBRZi/NZvuEN85QZgykCJj6Mit6Wd
	j6oV0m1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TbS-00000006q0I-1zf0;
	Tue, 15 Sep 2026 13:53:42 +0000
Received: from mail.mdapi.ch ([31.3.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TbP-00000006pzN-1JD7;
	Tue, 15 Sep 2026 13:53:41 +0000
From: Martino Dell'Ambrogio <tillo@tillo.ch>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tillo.ch; s=mail202603;
	t=1789480414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tqNJN6r+R9FTM7z/9qcKuZusSlTXIajY6lxs4DtiQ28=;
	b=NNe58tWkpZIcv6/bgOgFEUCwqpE1158HwBtqmTNw5vhn11cEWdaIxUclShlOJxNXKr5Hrd
	ECsm+APMyJjozz7HJEcke8x6Vf9mMPMJop5FqQ3Kf3eoyVjYdgzJg/RU/ccklGYH38V8c2
	Kix15uM1zWl94kgnlyKcaUh8xxUWoIDKQqSj6MzTBwPnBS4NUEJHuoCP7bzGh9OZizHQSb
	aBMQzKeccRDZdQRJWkmT0A8okjT2hVOwbrHt4eAiJyD0xfaL1nVsF+0kEeBkhgMqN+Hme+
	qGShLltJ0aJbFGFpJUBFsvEBFxOleXqMVA8elDAUPOrJuXVL68wBKybBHUu0Dw==
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kees@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com
Subject: Re: [PATCH v5] arm64: dts: mediatek: mt7986a-bananapi-bpi-r3: add ramoops region
Date: Tue, 15 Sep 2026 15:53:33 +0200
Message-ID: <20260915155333.821189-1-tillo@tillo.ch>
In-Reply-To: <a463a9fd-dddd-4b78-8408-2be683f80f13@collabora.com>
References: <20260915141226.600486-1-tillo@tillo.ch> <a463a9fd-dddd-4b78-8408-2be683f80f13@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_065339_732966_35240D9C 
X-CRM114-Status: UNSURE (   6.87  )
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

On 9/15/26 15:27, AngeloGioacchino Del Regno wrote:
> You forgot to send the 7988a bpi-r4 patch :-)

It did go out - as v4 rather than v5, which is probably what threw the search
off. Only the BPI-R3 needed the v5 respin, because its v4 accidentally carried
the BPI-R4's values. The BPI-R4 patch was already correct at v4, so it stands
as sent, and it does carry the plain reserved-memory node you asked for:

  https://lore.kernel.org/all/20260915135722.566918-1-tillo@tillo.ch/

Same To/Cc as this one, sent 13:57 CEST, five seconds before the R3 v4.
Patchwork picked it up as 14818166 in the Linux-Mediatek project.

Happy to resend it if that is easier than fishing it out of the archive.

And thank you for applying the BPI-R3 one.

Martino


