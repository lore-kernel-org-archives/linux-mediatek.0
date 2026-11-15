Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0663606A31A
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Nov 2026 18:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M1FSNSam;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hs2wFkU6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4v9kEdXT9EbKxbjfyQTCBXpQmQO0tv1S0oBUI2ZRadY=; b=M1FSNSamB955nx
	vV+DkAcGCOuJBcLj0Ryc8LljYGyXqOfzuR67K4AAWan6EkQ6QhYc+Jf7+OUW76HaewqEtYHLdTTds
	bSXu8wxMFkxU+evmdezIPBP7iTVy/rjU1bz1DoQJFrgQhy4jivNj0pwfyDxmeOrejFHREFsXZv7e4
	hQGv5ghgc34Hk9oN18xy3F+Xtb31j2w4K/wnGjToFESGTbXpXu7pHbTBQKiPeFnth8VGoOzivH1KE
	P68ZNI3X4J0vGYFn/EAhxDdBbumUwQ939R4p7eJYVcxIChKqqbg2KUDuB4K1TlNe5bHh8uGfUPptX
	dWGcMUQeR9Yhr9bH56TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSewg-00000000KW9-2zLg;
	Sun, 15 Nov 2026 18:27:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSewf-00000000KVq-399U;
	Sun, 15 Nov 2026 18:27:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E7A2F612A9;
	Sun, 15 Nov 2026 18:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6721F000C4;
	Sun, 15 Nov 2026 18:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794767236;
	bh=4v9kEdXT9EbKxbjfyQTCBXpQmQO0tv1S0oBUI2ZRadY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Hs2wFkU62DxMVcVeVK/hAY2ufoadWt+Durtr+oAEZEZAHVRiIPzUn8lVsPDt5Gn6A
	 LCjm667oyvLp/6VsY85AeLD12M/krbIKIgKoosrrjyCH8Bs+p2meRhASbg+kMC2cvM
	 QzOEgYrkeLy0x/CLwV2gYxtqqx1ssQUFYhJbA8s+gu69qB0zN2CezYt1IxGO1LmOcQ
	 ChvTkCD2Egs8VWSW4BrQHtHenMBDdDB7z4bhmmoqPKGANygD0zgisrIdYkxydir576
	 UAuL+0VtHWziRhbhZ1qJB9384CqIX5ydm0HVaLZ2YWAeT6u2+v9nTXAYzi/wxW+YGW
	 95lD+ddDCxnWw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 4E20633D38DA;
	Sun, 15 Nov 2026 18:27:01 +0000 (GMT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 00/22] Add speaker and headset jack support for
 Apple Silicon Macs
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hector Martin <marcan@marcan.st>, Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
Date: Sun, 15 Nov 2026 18:27:00 +0000
Message-Id: <179476722024.140154.15587190322612964079.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=317; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ytHYPz0XriWoB7CgG8WB4aH/P5ex9L4TMTkLssWLVm4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJ+/iz9N/mHi728XsdGBVdR5aNnVf4dbTT4IdmRdP2n0
 KttyacyOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRD6wM/9S72z3mLK8tSzx9
 4NSkAKUV6/Z/7dTSuuv6b3nhkq3KnrMZ/uk++dB/R291D1tVuZfLHucp3HoXysLSk7c6Jx4XL/4
 swAwA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Hi folks,
> 
> This series adds the machine driver and related bindings for the
> primary audio subsystem on Apple Silicon Macs. The macaudio
> machine driver is based on an RFC sent many years ago
> by Martin Povišer[1]. 

This needs a rebase against current code.

-- 
Mark Brown <broonie@kernel.org>

