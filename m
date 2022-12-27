Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F930C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 10:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Date:Content-Type:Subject:To:From:Message-ID:MIME-Version:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bHOkwMF9BYGhkMtp/8kbzXG4DbyBdCjjFJsU5MNHFRY=; b=VbmlDTVlFkFpwts+L2MfxyyCr1
	ZTS4vGEgBamP/gXqpvfKtF31wpmaC08LHKEOqHxXkSXzF/GxqDk++8pNWwP3KEz6SwAl0ODJCUZjH
	/9FsP5blhJ7G6RZZp7SDRoW4/qzeWEsh1PxrU4giCA/grjjqMh6vXt9+hcEk39iftRiA52ypPdMCP
	iQ99mL5P6cNAztXOoXe95Ftq4wGJ+WgtI2P1ukpYEGK6yiuCeilrHlsBhvTV7zbdIu61HV3kyCEMn
	iAwlLjkD0PS2V7z5B9OWXWmYcdkmDyYdrbWcBN0xcMwIjqEMLUT/9GjelJxbyYCNCAvXj7uYqKc9u
	rDaAvOMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA7CZ-00C5PO-Vu; Tue, 27 Dec 2022 10:28:55 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA7CK-00C5G6-77
	for linux-mediatek@lists.infradead.org; Tue, 27 Dec 2022 10:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1672136902;
	bh=HHhEOTVbu87OD90CVd5kNLsPiJ+kXgqHJC7zg+mL7/g=;
	h=X-UI-Sender-Class:From:To:Subject:Date;
	b=QWfFY1iRdT7dFpENs4Rtpp/BuUzIcUzu3GgblzBIani1YWL3KO1fHnnMoAfTavAi7
	 FiMGLuZfOOfMAtqPxl6M2+/U3XPBCfAl9A9Pb2S6Ygj2YotItIY0MK8pi3KrX7fZVL
	 6hrFkchnp76nxjvixufjsGj3DiDqGkg5OyvPGbU/U8UFY2e8uTCymb/CJuH9c3fOyj
	 C08Hy/mAdYLdXEqpAVCqf20bux6QD0/oM8V9dg34hVFxSk9dLnberDE08yaD+NV0MI
	 Hqs508mMFb8vNfEw55PykA7aaAGBX7Y6A+tWdestECF4PQbK0x14g2l7ci0aMiuwMC
	 cfEtDoRK3lnFA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.153.252] ([217.61.153.252]) by web-mail.gmx.net
 (3c-app-gmx-bap27.server.lan [172.19.172.97]) (via HTTP); Tue, 27 Dec 2022
 11:28:22 +0100
MIME-Version: 1.0
Message-ID: <trinity-bd6bf7f8-5dbc-42fc-891b-8bfc802a1a2c-1672136902605@3c-app-gmx-bap27>
From: Frank Wunderlich <frank-w@public-files.de>
To: linux-mediatek@lists.infradead.org, Ricardo Ribalda
 <ribalda@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Mark Brown <broonie@kernel.org>
Subject: [BUG] 6.2-rc1 spi-mt65xx broken on mt7986
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Dec 2022 11:28:22 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:uzM8P9RDVqa0VKW0KGbYlEFsTLLikWlIc3kZeCZI3WMTCZsR6Ll1M6/pv9JbNFpd93LL8
 Y1fJdgr4bfA3JZb4ay9OuFrZBPBo8/L63GrgRpfjyACjCwaIjuRFVHWsueGgWhr/InTId14/zDd0
 R76gzydBrvQakxwjvEgXi86gA66y54IdjpjPs7JjB1npPpVwCt5jengCHFZVV8oCRvMnIYmhzgKF
 G4Bh7xA/tI47ZueYjUnMRRVTBYJ5D0J3HAB9SyM/ilig8C7VswPtCKWmfC1yw3VrRhTBfj9IFz4p
 Ug=
UI-OutboundReport: notjunk:1;M01:P0:JRUfuHp++es=;uiIf5yFDVyymTb+YuUTD6awl1r7
 IldEICND1zJ51gmYe6RPyDphLXvhPX6qJeDBeNGUCG+a1/QgsX1QVW0Pt1dbAkrBUv9yUTM2F
 d+RftSloOFsROCkSYaLLQ3P8I3vNs1ygXbSPgY8YoSnDwvsf5StlT7XhQ26hi34g+Adg2oUG4
 IDL/aATKQjnt3aFyeyZavTo3AeMJ6b9AWwtTORFANZ34uoNlirqIoso8n2aWEt5Ie41m8jLrs
 L7TEUuuJnKA4osWp7wG0UB0Vew8/ClkoWZHqgi3YvlZVskX9WBhd1NjkirlePMRCHfyLtgWvH
 hbfnC42/W8mlaH2BQuH2s6Sd+kmIw6N4xupbYonAejyzfGsT+6pgN4apfdTLZAY6Xp6kk0Ida
 qa30vXotOiw3alEtAGqwwQGXxO5VrrcTLYf9zESpKOSpczuuSWofZRTMSntCUzN5++VpHbHob
 8au3eqa/qcE0zlsyK6IB3mSUE4m0KAPdc1R+ZPuHk1ZMGsOUl2EmxjpCKjcGjS7BJg3vMdH4j
 OZ6EhEGqWN3ZJSIKTgjrVUTCmc8vSzsk5tspXC8ZRVwSXj9m2+y1dkb40FetGaBeYLlR05KLi
 6cjuI9Xg7pBAoyaHWCG+u5LTm5YHmkJ7CmvTg3zkwnPeEFslws3iBYFdh00gwNitIDh2sb1MQ
 mPK8nG+Pls3AT6tDRg1lVDtUeQ4XDUyeD0A73UDmQ/sLVbM5VcZQ7Y1JFg2X2SuoQ6TOt7oxE
 h70DMb+IxNT84em0VQ5ZFuUmrtHrm95coAEIgEfHjAsg+z1Pj9ibyYmPY7tJdhR+dxxoX6XSw
 crvnu8EYZH+mzo0k4wUYVBgQ==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_022840_754708_B1E2176C 
X-CRM114-Status: UNSURE (   4.23  )
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

the following commit breaks SPIM-NOR on mt7986:

c6f7874687f7 2022-11-28 spi: mediatek: Enable irq when pdata is ready

> [    2.145931] pc : mtk_spi_can_dma+0x0/0x34
> [    2.155212] lr : mtk_spi_interrupt+0x74/0x360
>
> [    2.091801] mtk-spi 1100a000.spi: spi-mem transfer timeout
> [    2.097310] spi-nor: probe of spi0.0 failed with error -110
> [    2.102930] Unable to handle kernel read from unreadable memory at vi=
rtual address 0000000000000010

after reverting the commit, no trace happens and nor is recognized on my b=
oard

regards Frank


