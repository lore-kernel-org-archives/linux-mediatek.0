Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAF4C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 20:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Date:References:In-Reply-To:Message-Id:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3bIwKnsy9ifetBfNY+3G/QZkKlWgtgdGBGngqxa9+ik=; b=Nw1Ob7Svo+Pehe/Yv3OkQhfWSa
	a0nznpZ6YQCbhyM1dssy/zPhHQW8Eh3dTTn5J9DboLEfeSHYbEqC/XIdfnefCwQvYXiwYrRNXQpPH
	WaEmDEPbkJKXiyW3U0+115HFRCTtLh2sFl97RnRX3m3VZkCECYCftdI4ZuWS7JCq0bUw8csj3RK8E
	I/5mEComeWn50/LPUvk2co/DqTTitKa1GgMcJ9viJopJ5J01d6K4x3pLDZ02uMTtOcENF+/D4Rebs
	bWxVwOv00FhKCU1ii6HdMf2a5rtLTU/PaWGfIspcI8qZMCskOG48+WEsIlhzHgnUZ9aEYvmRgXvzT
	BSrAPCAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1XGR-0000000481E-2JQg;
	Mon, 29 Apr 2024 20:06:15 +0000
Received: from fout8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1XGN-000000047yk-0x8F;
	Mon, 29 Apr 2024 20:06:13 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id BB4B81380368;
	Mon, 29 Apr 2024 16:06:08 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 29 Apr 2024 16:06:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1714421168; x=1714507568; bh=3bIwKnsy9i
	fetBfNY+3G/QZkKlWgtgdGBGngqxa9+ik=; b=HbgG3qj53eKRmhBscBhH1xlRmn
	nDm1RH9c12EwGP98UP9Dd5b4MFxjJb8KLi2ng0+aakho2SZNziHbM5g7VZJC2Q2Q
	2MDIBDz63ydAXDudYk+0GOi8Bcv4C+UH1ctYR8e04PbMF3jVCIKz/+S11lreX3E8
	9lf6HOCseuOUOUS/McJKDHy3vHKyb9Zzap07BxVnRqJja16J3nLmYnOitHN58jiO
	nAZVOqNl0A+vwtMj5qguJFboE/j8Qjbteom9myV3jI50wBw3cgAP/ad6dr53lB10
	hgd0vNiq+QnQoIGsr88wbQSl1dVH/g2uiy2J8chwDOzwCrsgm3scC/xhyibg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714421168; x=1714507568; bh=3bIwKnsy9ifetBfNY+3G/QZkKlWg
	tgdGBGngqxa9+ik=; b=fSDBHS9wSxfB5RWx+g2dy6rwGvjR9rbbqx+5P6UcAhmR
	1ozFK2kjugdPmjxCqPcQx3ZvFGsGd4iTGOzytCfp175R0N7hW86eqPXYN4qXFT1W
	+m24+5LxTJFuXZNHIIwHPMtrPjZVqDubP9fhX3GzBx/nmgJs/I8vLA5MUQaSib1r
	Caonbc2kwHjy281NfbgEXkSlLgB9+Ybj9yasNvcNFUeVIfAQR1W1UrvIZJZWG9BN
	cZTeSPe6SUfVAU1atticcTacOFlAXsYhNkk8D+sqpKSZWDGtKAqBauFsaGDXKqcJ
	OcHf5OUlI8h3CuWbzmDhXnWSuaapTVTTwpr9A8yKxw==
X-ME-Sender: <xms:sP0vZtjxn-7_N5zXNwSraCLu-FBqrtL32VClpOu7vBRPaAEDjCrFPg>
    <xme:sP0vZiAleNg2jMMSc-J2iRxoGJ57iDuaw_3JaZhHUyKCA4E2lgTgC51P0XgGvJ_F4
    HW7F3W8HxS-3ewOEAs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdduuddgudeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:sP0vZtHmYg0d8ITut70uysTKybASUJ1ARZMd1oTW5Uhg7aXNKp56Ig>
    <xmx:sP0vZiR5C9rggca3QB8yaPVT_D2Gp_K3xmgTWloaHX9Y5hdB4NYhVA>
    <xmx:sP0vZqywLEcgZhZRoTvN31wjnSjZsQznZZxjw_vzTWipvz5RAHitYA>
    <xmx:sP0vZo5dOPwUBFsS0zFgTpkOSLCQfAyWYBEXmIqKAK0YXZ4ncvSptg>
    <xmx:sP0vZkttMvmIiFhfqqzcBbgI3TttK5YCyTsFdr-Ptur63gMrEYlNOc7W>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4AFC7B6008F; Mon, 29 Apr 2024 16:06:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-386-g4cb8e397f9-fm-20240415.001-g4cb8e397
MIME-Version: 1.0
Message-Id: <7eab1a4b-4cb0-4142-b3ba-fe9e73f41eff@app.fastmail.com>
In-Reply-To: <20240429140245.238210-1-angelogioacchino.delregno@collabora.com>
References: <20240429140245.238210-1-angelogioacchino.delregno@collabora.com>
Date: Mon, 29 Apr 2024 22:05:48 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 arm <arm@kernel.org>, soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.10
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_130611_540528_E9427B44 
X-CRM114-Status: UNSURE (   7.60  )
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

On Mon, Apr 29, 2024, at 16:02, AngeloGioacchino Del Regno wrote:
> This introduces the new Airoha (MediaTek) EN7581 home networking
> platform (routers) in early stages, but with support for its
> Evaluation Board, a few more MediaTek based machines, and
> improvements for existing ones.

Could you respin the pull request without the defconfig
and Kconfig.platform changes and send those as separate
patches? I always try to keep these in distinct branches
on my end so I can send my own pull requests separately.

The actual changes in your tree all look good to me.

     Arnd

