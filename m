Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D13C05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 16:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1d5ojnmia1Y4CLSFeMu2wE+MLDW3yZPfv1hdEIVgr0A=; b=gNjKPJ1MHfJc6mRGAHMVDN9O1/
	su8Fhe8xvwSZU2oQGKTbNv3m/G8105Iy3ZbF7HpvDwVgT7uS5LENmVbW7qOR4ANRImQbNnAX2G1WX
	LJskWjM93n0gUsLBKucA3Wg8a8pTpDEKl2MT3WuZ+4bonPNoWUuXgV3GfM7R8dZPSETExLEBhT/ja
	+P1qAX02ityqLr1ZPuGmzlMLOWpMBbORkgHjCYYJOPYkBKeIEiVPag8rwl4X9rW/CqcCO4rOdislP
	MfRxYW69uwU8NahAAum852X5rcuYBIO6OPP4tdnWI7YXvi3b3uiiXlc4goRE/AlKBujTf739OveyO
	8gvnoIGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJziK-000YKf-UT; Mon, 23 Jan 2023 16:30:33 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzL5-000QGB-Ja; Mon, 23 Jan 2023 16:06:35 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8B09B6602E19;
	Mon, 23 Jan 2023 16:06:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674489981;
	bh=cQC3SstRN0i+rvAOG3ydA4+K6fOMQx+oZJ/RtdVRVpw=;
	h=From:To:Cc:Subject:Date:From;
	b=et/J8I8vWx34O+uyFxgCXVxZQYlkSJwYerq+782D+3/vyLydpK1LW4NJB/MnGYvja
	 7daHL7g9uGu7Au5vdVrI1rEt/2BxZQJftUU9huccAqA/zkuxNL3NaFB7U3t71m6+7X
	 remb2zKawD6ZiKN9yHZ5OlyZMj89MPlgM0ie0eRUOFL+DSnkapAv5f/rKNptT4rSPU
	 9MI5H82KP3vuc0Cl1uGq9GsJLBs14ZQrKpo7uVlfSaFWdupWrEN0Bw3POWWfLScqS8
	 9UScJ4m1cKEEmJbXafsKxWZ+4tajbM6imq4Kf0eepjqT2tlFy2KR8tVD5AyF3SqIsY
	 ec2HzgVzl99QQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: thierry.reding@gmail.com
Cc: u.kleine-koenig@pengutronix.de,
	matthias.bgg@gmail.com,
	weiqing.kong@mediatek.com,
	jitao.shi@mediatek.com,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/2] pwm: mtk-disp: Fix backlight configuration at boot
Date: Mon, 23 Jan 2023 17:06:13 +0100
Message-Id: <20230123160615.375969-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_080631_847552_1953F237 
X-CRM114-Status: UNSURE (   7.93  )
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

Since the pwm-mtk-disp driver was fixed to get PWM_EN state from the
right register, an old two-wrongs-make-one-right issue emerged: as a
result, MT8192 Asurada Spherion got no backlight at boot unless a
suspend/resume cycle was performed.
Also, the backlight would sometimes not get updated with the requested
value, requiring the user to change it back and forth until it worked.

This series fixes both of the aforementioned issues found on MT8192.

AngeloGioacchino Del Regno (2):
  pwm: mtk-disp: Disable shadow registers before setting backlight
    values
  pwm: mtk-disp: Configure double buffering before reading in
    .get_state()

 drivers/pwm/pwm-mtk-disp.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

-- 
2.39.0


