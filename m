Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06DBD10375
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Nov 2025 03:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J7o8+a1I25gyMr2nCGcTd+8YhviSg5xpSP1kY5jJpYc=; b=IMC0ugvhE2CQ8IDugaJTHoHJyE
	/tLpHigfjpNg+ay+gK7z/Jpzm4JsDVyO+TLUiPkFEKhWSuJmuCGjeQxlcyTA0IMFqYYOHoST/VMet
	iltPvsd2XrR7vP1hmW1sZMB7pAAXE8rhCZv8T9qItoS1034vgy181Cn6uiIs6Lno5vHhoHbMF2CGB
	0Fk+0+RRiNaPUssYEc+PBVBe23Az2k0PN9yhhU06e96aWXZjIS51rj3InLETbiFZNvAtlCywUTooi
	Mva5Ljhs3RiluUdjZYMTVl/UJ5neET73hmd9D2PIv721xDArNXA2feuz3Z8absfC4KMJdrFALRlfD
	61G9gmdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO63b-0000000EI1b-02o8;
	Wed, 26 Nov 2025 03:19:03 +0000
Received: from mail-106103.protonmail.ch ([79.135.106.103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO63Y-0000000EI0g-3GBp
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Nov 2025 03:19:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1764127134; x=1764386334;
	bh=J7o8+a1I25gyMr2nCGcTd+8YhviSg5xpSP1kY5jJpYc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DRh5rBXfGFjvsGmNuNwefNFSRj0debIygHyCCwP8j8/TottpJs2+lxRgPJfQyzaX0
	 XdTOtqjzG/afpZWYvYb3U515HXvTiYkVU2w+yvZ2sGgN3cYdg/2PsHn4OC+UaK9TBE
	 dKR6Cr/92W4jsn+Z5d75c6kMtQQCSkH9JX2kW/dhAwJsgNHSerXXDBS8HiZY4KnCUR
	 uRBXEnli8GCWoKpeVp0hTfaBKCDs2WhxDOEaQfJytO8tI7nlJD4P8vD9gYLz8z5yfh
	 FYH2qhH8tZh+xgor54M4bqFJJ76GulDq9GuiyDpsYUTohK0le+1o0fnyTk3yDDfoHx
	 EhCR7VJB0iANQ==
Date: Wed, 26 Nov 2025 03:18:48 +0000
To: patchwork-bot+bluetooth@kernel.org
From: incogcyberpunk@proton.me
Cc: Doug Anderson <dianders@chromium.org>, marcel@holtmann.org, luiz.dentz@gmail.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, regressions@leemhuis.info, regressions@lists.linux.dev, johan.hedberg@gmail.com, sean.wang@mediatek.com, stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3] Bluetooth: btusb: mediatek: Avoid btusb_mtk_claim_iso_intf() NULL deref
Message-ID: <fcMPe6V9vMYxkXRMnKXiaeTnOwAMBNRTmF1mgLePTpz3Q4hPqpb0WVQ5aXZljqkOtZ2W_47PVL1Q4lnf7kZJhFS4aGwP8_4QiqJl2ScKSi4=@proton.me>
In-Reply-To: <176366460701.1748676.511972373877694762.git-patchwork-notify@kernel.org>
References: <20251120081227.v3.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid> <176366460701.1748676.511972373877694762.git-patchwork-notify@kernel.org>
Feedback-ID: 139104781:user:proton
X-Pm-Message-ID: f6d82a3f4af4a0c9485cbb7610dd235edea26b50
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_191900_952882_9058C94F 
X-CRM114-Status: UNSURE (   5.98  )
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

Hey,

It's been almost a week since the regression was reported and an patch was =
provided to fix the issue, which has now been accepted in the linux-next tr=
ee; but I see that despite being a patch for regression, a merge/pull reque=
st was not made upstream for the latest -rc mainline release.=20

Is there any way that I can track the updates for this patch to be onto the=
 mainline release?=20

Sorry, if I am missing anything.=20

Regards,=20
IncogCyberpunk

