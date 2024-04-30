Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9330EC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 08:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Date:References:In-Reply-To:Message-Id:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIJWRQ/GsHANFmMHphyChIFItia/z5Pl0jXnpAecs5M=; b=ulLUHpVJmOGMW8UHvLeCh5ib9b
	j/jFTIILrsyRjzf84i7tvTFZhuZ4CI8SlqhNCoyw4GjA7mZAKd4vV1ljA9PlbjiXXKFCy//yuaGbi
	iphaFXhSvfvs2VpxLfafWETyrK/NIPr6nsS3AP3r6gU1DS5NplshyzeHA/2MI8jpfH1q2n0j+RerI
	bXOGchwL53uwvy+qFTOwLSo7t2vOIBEpVSBI4z5YCuEuLNSNjH1PWxeJXjYcD35vfTV6j0e3b/YIP
	rade37HQjS/cELrR4cWWpyK5WT6Bvu0CTfdGwtDqJKGpET1wEkpewQNsPGFpksCqeB0UrZpVboCR+
	wtzOjcTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1iVt-00000005Xw1-0ReT;
	Tue, 30 Apr 2024 08:06:57 +0000
Received: from fout7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1iVp-00000005XuF-1h2e;
	Tue, 30 Apr 2024 08:06:54 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id A1D371380903;
	Tue, 30 Apr 2024 04:06:52 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 30 Apr 2024 04:06:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1714464412; x=1714550812; bh=uIJWRQ/GsH
	ANFmMHphyChIFItia/z5Pl0jXnpAecs5M=; b=AjlGQUEoh+KEIOsH2Ud7xVCZSn
	3v0RVla3lL+C/slzwG3AOb/vqg43pfaXY2nqG5JnN7O91drQI2rpclDIfcsVm8tW
	sdesTTbt74UPPrcoBx3VAYHDBTGuJI9x39OBg/QXl3EYZDnGdC29V/apaBEhMAwI
	sjUE83aUTkytr3OpqmHeRZDhE+1ZCLJ83lSLFYx4N4SgB4Kyley1rDPNxgNU3hA8
	7db5IAJrDeZo9n3+841/MsbiLeknsR4vb423T9Cqllj7bjPmlT94J/52aC0aZuYQ
	HQRwGj9r6/sJZq05huQxGxlJrcoxKUsx9kijfSvjdtkmqjtXSpa9+h/GIc4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714464412; x=1714550812; bh=uIJWRQ/GsHANFmMHphyChIFItia/
	z5Pl0jXnpAecs5M=; b=kVcaXL5CKezi2HbBsDM4xRGKk5YcdWo6ZKxSy7jseocz
	BHcPE50WYEk677GwEqdnMbuXegbkGwnkyjL6cjNuM+MiWo/bC8fQ8j2rcz7IIRuW
	JQV4+Shb3eKeYRxa7fy4Z/lqH+X3X0HvwyAHUmm1JzjZuBRW1Pk0feIw5FpXRlZu
	HeOpACcIAePLInOayrZqdO9dvAZFSqXSBLuQSuhdgUjCBpSKGMstEQ5NYcDvPVrT
	6TZbgmkbk7ijP43OyL3FQwPNgwIxR003shFzt8kZ4Zpn00IiHMXUxY5nLbITvtp2
	aSmgVsiJzjhdiPPOzktA4RbOF4emjmbYaSSI+7gwgQ==
X-ME-Sender: <xms:nKYwZrbLnUBL5mw7YrV3uAhODw4bQNvGPcbMjc-GB_-fh7noHaHBXg>
    <xme:nKYwZqZc8y8Ad3SkvmKroHy56Q1IyfS5vGwDcYerJCGQItMr-iqjIPXuh3r8dEX97
    Nak0NlZdfwLBWafe6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdduvddguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
    feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:nKYwZt_uQ2QeHlFSq-lhSQ3aJPPg3fKUIpv9031TgPevUxRyJhIriw>
    <xmx:nKYwZhp7AJYc_m8I5AxY9xMYvq68NBTimaTeYQyELf304zv8aF32WQ>
    <xmx:nKYwZmqKCZHI4JzXpgiPybMfETPKEJl__PGqE94WtIx7eJeF7SKxQA>
    <xmx:nKYwZnTHCVoHgd_NKrEnDBg5zuL4Jtj7d8gd1CHXIAucnMAlbETRKA>
    <xmx:nKYwZvlX4EMc_kjysJcJlUUElQ6KQTHex6X4QFY1ftLSOOUdtkVsoX0O>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5D0E7B6008D; Tue, 30 Apr 2024 04:06:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-386-g4cb8e397f9-fm-20240415.001-g4cb8e397
MIME-Version: 1.0
Message-Id: <8f777b2f-ab15-4df7-91e5-f779f408fd65@app.fastmail.com>
In-Reply-To: <2a683392-9fda-4da9-9bf5-ffa2b982634c@collabora.com>
References: <20240423102915.371782-1-angelogioacchino.delregno@collabora.com>
 <dc4975fa-82ae-4b2b-94f2-c518595f8694@app.fastmail.com>
 <2a683392-9fda-4da9-9bf5-ffa2b982634c@collabora.com>
Date: Tue, 30 Apr 2024 10:06:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 arm <arm@kernel.org>, soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 Device Tree fixes for v6.9
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_010653_533155_4B949006 
X-CRM114-Status: UNSURE (   7.23  )
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

On Tue, Apr 30, 2024, at 09:55, AngeloGioacchino Del Regno wrote:
>
> Yeah, I have to fix my stuff to stop generating the gitolite address when
> preparing the pull requests.
>

This is what I have in my ~/.gitconfig:

[url "https://git.kernel.org"]
    insteadOf = git+ssh://gitolite@ra.kernel.org
    insteadOf = ssh://git@gitolite.ra.kernel.org
    insteadOf = http://git.kernel.org

That should be sufficient to transform the URLs the way you need.

    Arnd

