Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D505C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 17:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/FfFQ5VlOW9S+zhNnrrbC3sIGoecBcU0snnEzeanXGM=; b=nM9R+aEl6gbIfE
	AKhXZxyTuCVH2W48nzlWqF474W1TKrU1Xgrb8L+w+yY4hQS3laOwCaRxvHTid10gtpF5kW1BpCPqU
	PON9+5nUoF6RD82Eq4agtedsPKTFLHv1T4THZA3RFrzM50guQVZbB3dH8bpa1pX3hGwbrEJmchfWu
	f8lq4YMLi/GKYeH5w/LG/AmG7vvJyNh4Ex9DNJ3EWwhO8MkhvRKOGUJV1J1eeRk8QXAdwbn/n87Kd
	jH7Od6MT1hhmA1YbzTIQ7R2xVTFB3MsRWvtQyBxl4Xn3ginu6D6UbRTDzEBhAWchsI7nvKqvBRrfu
	QTZZUdHHxMbgodT7W0+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRdE4-005OQ5-54; Tue, 08 Mar 2022 17:02:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRd1Y-005Jxf-0T; Tue, 08 Mar 2022 16:49:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 50CD1617A7;
 Tue,  8 Mar 2022 16:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDEF6C340F6;
 Tue,  8 Mar 2022 16:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646758162;
 bh=QjbxPfHfkHcwJzSVslnbdnqgcuAnAr4VEguexb/zu98=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AdSTc7aJjL5PmnPnK59VS1LgDwwLYF23D7ab6rEh73lEDp8goxdf7FULqziggL1FL
 NzHnOhkeuftGQgZivEFNejfbLL7Zvz3hHmbvYvg/FDK3MrUVD8i7mJZ0uwAWqRhVXV
 DphqozrVX2c1cB6ZxqJJpMIfcoD5JqV0udWesTpnygtfEBwJfmTS7xeeyQsfcjyQcC
 62boKjScT7bDpozIlTDFSzoAGRw4KfwxZFmqR455fdVZrdLR5Y/sIaNFxtRnyIpAK1
 IZ5CMiXZ46LQ7l4YQi6oEmakGn4+ET4lM48WCD7hkV7KXdAO7yY/XRWwht8Pr/G3nw
 vlGz3b2GhEgYA==
From: Arnd Bergmann <arnd@kernel.org>
To: SoC Team <soc@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [GIT PULL] arm64: MediaTek fixes for v5.17
Date: Tue,  8 Mar 2022 17:49:02 +0100
Message-Id: <164675812246.4164061.13281744278219084371.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <8eb8510d-c597-4fee-e4b3-924b6d4bb3be@gmail.com>
References: <8eb8510d-c597-4fee-e4b3-924b6d4bb3be@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_084924_138696_6C7B69D4 
X-CRM114-Status: UNSURE (   9.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Mar 2022 10:38:34 +0100, Matthias Brugger wrote:
> Please have a look on the following fixes for v5.17.
> 
> Best regards,
> Matthias

Merged into arm/fixes, thanks!

merge commit: 35e33a24f8fe0bacc55d62eb506d99c122f02012

       Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
