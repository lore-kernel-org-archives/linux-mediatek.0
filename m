Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F0ACAC5B0
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Oct 2025 12:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/zcAyMi7iRvz6DT9Srqlkg41Q0hHrE7Mrjqu6LbnD9w=; b=lxJfldfU0gmfUHSm8lIAsHgRRa
	izClmfbVbSQ/H9dST2dFcTtIo1HkrVyoPqTE20+bKnOdBHWMKWfj0xcWb9BcGM8khA+IbzWVX77g9
	ort8Tk2oMPGEb6o8WTgNqKvnE9T5aGNtgma8Byob1Uz9Fk1Hk9YeDFKJ4NH2ZxMYdVrebArIM1QYR
	eUzO2FWfpZS3+n/syALfFUyOBSYuTxeS8RBs9LQOtVBXcShl/Kduw3FXnKWMbXTD89VkloLRfADtj
	5ftxt13gmlic5yUqubbWb4+QAdz3hinfcDB7c5/OZjer746/PG5LoB56ujjyZZRSGt19n8EhTithQ
	h4jkRc6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4els-0000000CGuu-2DFR;
	Fri, 03 Oct 2025 12:20:24 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4elq-0000000CGu1-0dQP
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Oct 2025 12:20:23 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id B6B191D0011A;
	Fri,  3 Oct 2025 08:20:18 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 03 Oct 2025 08:20:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1759494018; x=
	1759580418; bh=/zcAyMi7iRvz6DT9Srqlkg41Q0hHrE7Mrjqu6LbnD9w=; b=o
	5JVBmwOsLt06LaLc/7ipjSZv7RQAjFNamo4e3XlCgqTI2egrt7VrC5ugFIzwXWAL
	AnrvFwzCBxlky8G81UCp4mSLHUGF6wv42LAbQZg29sICy6PGXT8w2XuegQ5BL7OS
	GYyzqFo4gHS6iyBj7tUB+DuhvIZBOzHigbAD66/Zo3dRYNqc8sHrWeaF9+vycx5X
	AHHGly4KOd9Jj66wEMaQEmP0GzG+09ZeLl12XHrBeH1oXlA1a1auNpABp3rTM6vy
	jKOb2qaS9lA36IleyQCXI0sRZuOLql5oDhXNtnuCoLZxei6Z81YPj3XLOyeNzGc3
	bMUI26rlkBnMmkgeFadFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1759494018; x=1759580418; bh=/
	zcAyMi7iRvz6DT9Srqlkg41Q0hHrE7Mrjqu6LbnD9w=; b=m6oEZU1E72b1Gz5nA
	ClcHGcxnvZkFlcAdjRRvDg0YSTByjQto/cFEHL9wqFBvIpWI4/poVv+0ytVYwtoU
	lovBVsTsFhk7I27Bmi98XQUiQnT9YT4HfwkLJfrozRYT0NQzWMFiyrFld/yzsoBm
	x/Nmz0XcRu8ZOBFjFeFP9tthq0w6Cky2ayLn8KHQZm2sKHoynvQcC9m2Bg2GuIcW
	+zP+DD5QlTAQZTR8j4xP3UywEHzhFXJoujh/uA7SQ4IycSNZmg/M76kGfznNp/gp
	9Obi+ac2xZv6s1DGl77sGdT0tZTcbELTJEpHHuEj0PzTBBq5VPPDOzcwNI7LYqHZ
	e2Xzg==
X-ME-Sender: <xms:gr_faMxhN-OatVnL2bpk2C9b8BbCfRrQNu1FfXkxQ5-rXpU8a145lQ>
    <xme:gr_faItGRdkWeW_j3lE-vY6bvbMLedkdVjNFcZyL3C-DWTYVcwyESDaYfCekh-5GG
    rRE0lgO2DlM0C3Ehtze2ZujQFraI1yDSOhNiFPYP72ZuWv4duC_>
X-ME-Received: <xmr:gr_faOxa8TWJjcNq0dYuu2KXrcr2pqN4_ruyj6nAM-LLKPVXitdK8DxVbLPUNpxVH39mWVSY_LkURHhppFMgTe7QlUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdekkeekkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekredtre
    dttdenucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgr
    shhtrdgtohhmqeenucggtffrrghtthgvrhhnpeelfedtledvgffftdevudejudegkeetve
    ejtefgkeduueejveejheefheevgfeiteenucffohhmrghinheprghlphhinhgvlhhinhhu
    gidrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghpthhtohepiedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheprghllhgrnhdrfigrnhhgsehmvgguihgrth
    gvkhdrtghomhdprhgtphhtthhopehmihhnghihvghnrdhhshhivghhsehmvgguihgrthgv
    khdrtghomhdprhgtphhtthhopehlihhnuhigqdhfihhrmhifrghrvgeskhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinhhf
    rhgruggvrggurdhorhhgpdhrtghpthhtohepshgrmhesghgvnhhtohhordhorhhgpdhrtg
    hpthhtohepgihirghnghiihhgvuggvvhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:gr_faLCNea9K211UiNqGzkynV2HJvBcKBHobrrVf8fJ9Wfck-2FScw>
    <xmx:gr_faMeSfbmNEv37aYdOu_NE4X32vAUQ0-ZWdyt19g11pvsL4Fybfw>
    <xmx:gr_faFm_0rsx5C6VC5ZodAZAF7il-RjCFmViDBAiVK9NrS0ySkKo-Q>
    <xmx:gr_faDFzf-NFtoSrvBPlEH5R54kF-EbcT6LqecT3k1VD9-mTCq-yLA>
    <xmx:gr_faFkn_svGOA1p3Th96qO8XCkBRC1N4PxzjT5poxEJiTss81QVHcqm>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Oct 2025 08:20:15 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: allan.wang@mediatek.com
Cc: Mingyen.Hsieh@mediatek.com,
	linux-firmware@kernel.org,
	linux-mediatek@lists.infradead.org,
	sam@gentoo.org,
	xiangzhedev@gmail.com
Subject: Re: Regression in linux-firmware-20250917 for mt7921e driver
Date: Sat,  4 Oct 2025 01:19:27 +1300
Message-ID: <20251003122000.7335-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <dda63a6b723d31f41e6e275ac7f38d31c6715fc8.camel@mediatek.com>
References: <dda63a6b723d31f41e6e275ac7f38d31c6715fc8.camel@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_052022_375581_E2449683 
X-CRM114-Status: UNSURE (   4.37  )
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

Hi,

I have a laptop with a mt7921e wifi chip (Lenovo Z13) and can confirm that firmware-20250917 prevents wifi from working, downgrading to the prior version from August or passing

"mt7921_common disable_clc=1"

restores functionality.

Also reported to Alpine - https://gitlab.alpinelinux.org/alpine/aports/-/issues/17560

Thanks,

Ryan

