Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37F3C624DB
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Sep 2026 05:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wTk32Ew0eWRxgZEIm+irABFlqLX5+f3hL/ACE0etaE=; b=q+9l2rtQhoWicUMPsA7Gsx3wc6
	comIdYdupEj4+ON+G7+YfOLeYA4GJUvzHIaCu3PJ909pg33N71Jmks7/8ppIzmFsCXeKHDObLd0Au
	FluGbcK+XX/75j7UImTcptNafsoK34+TKDYLnD2nBOEAa6v27WH+Yd/e5fUoPkSFNZFq2BKiBquwr
	GT1qGe50Lr/awMGbKB0l5oBONM90nlOzHbTGcco2DQNOzl/n9OvaWVjTPtD0A/abUYAL+a4eFvkKN
	VUJcz4x2NuTjd8yHqY487O4egnlFxOL2s0yJmm2UTF6GinTGz7H8fxMImgOfH/OSKS/t8sj1sLlo3
	CadAXO9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2jH4-00000003ih7-48ea;
	Sat, 05 Sep 2026 05:49:11 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2jH1-00000003igl-1bst
	for linux-mediatek@lists.infradead.org;
	Sat, 05 Sep 2026 05:49:09 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2F891883C9;
	Sat, 05 Sep 2026 07:49:04 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HN4AlLPN_2I6; Sat,  5 Sep 2026 07:49:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1788587343; bh=dLgyqMjJrt6QoHcIhrs2GwJlrjB833hjrC0NvbX6Bb8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RX8dqXbPZXUzXy91NZ7MRhX0CkfXZ18pgqtfmXqOY8DWqMe8wmLa8B0eSdi53aZJU
	 MZmWm0CLbT4m8QTVBs4lRs6MaLjkYWDGdj8TYLF0NolXfal7Y3x7+1SCvRDVSsj9ZF
	 gxGwQ9ohJNsZV7PKXKXbp0tSblmwNKa1uYF6kSbHt4x2xWM0Wq2PyZiMSyee8oWoGO
	 BsiistNCCfOFLs2868tyLvUpjJEDpE1OcisdSCEqMv4g4/BSRUNRfwMuNNmOyfnOxm
	 7cgKj6W8y33VSr1ITIC5kc0o3hVC4j9sg539Hbgo7YDLNcRwkq2RokqGY/0wWLybVQ
	 jDE1UlUVBo4Sg==
From: Marco Scardovi <scardracs@disroot.org>
To: Devin Wittmayer <lucid_duck@justthetip.ca>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Deren Wu <deren.wu@mediatek.com>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
 Klara Modin <klarasmodin@gmail.com>, David Gow <david@davidgow.net>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: mt76: mt792x: fix NULL pointer dereference in
 mt792x_init_acpi_sar_power
Date: Sat, 05 Sep 2026 07:48:50 +0200
Message-ID: <oWkA8ZPAS2aI62u9I6EKqQ@disroot.org>
In-Reply-To: <20260904234838.19342-1-lucid_duck@justthetip.ca>
References: <20260904161826.5638-1-scardracs@disroot.org>
 <20260904234838.19342-1-lucid_duck@justthetip.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_224907_873483_D854FB4D 
X-CRM114-Status: GOOD (  17.63  )
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

In data sabato 5 settembre 2026 01:48:38 Ora legale dell=E2=80=99Europa cen=
trale,=20
Devin Wittmayer ha scritto:
> On Fri, 4 Sep 2026 18:18:26 +0200, Marco Scardovi wrote:
> > Fixes: f965333e491e ("mt76: mt7921: introduce ACPI SAR support")
>=20
> There is a patch for this from 25 August:
>=20
> =20
> https://lore.kernel.org/linux-wireless/20260825181712.28548-1-lucid_duck@=
ju
> stthetip.ca/
>=20
> Klara Modin reported it, David Gow confirmed the fix on a Framework 13.
>=20
Hi Devin,

sorry, I didn't notice that a thread was already opened so I supposed no
one reported it at all.
> One note on the Fixes tag. The crash needs a regulatory update to run
> before registration, and that only started with these:
>=20
>   9b80bd9cab40  2026-06-09  mt7921 regulatory wiphy self manager
>   e9f3f1cc133f  2026-06-09  mt7925 regulatory wiphy self manager
>=20
> Before those it just set flags, so the 2022 commit would reach stable
> kernels that never had the bug.
>=20
You are right on that, I'll pay more attention next time
> Your trace enters through the regulatory notifier, mine through
> firmware init. I could not find mt7921_regd_notifier_work in mt76
> here, so if you have a second trigger I would like to see it.
>=20
The whole patch is as you see it but: I didn't add anything more.
Tbh I was working on a whole different sub but the OS refused to start
because of this one so I came up with the absolute minimum patch to
make it working
> Thanks for taking this one on.
>=20
> Devin
At this point you can count this patch as void. Thank you for your time,
Marco



