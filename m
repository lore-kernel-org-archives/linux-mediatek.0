Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218E2C46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 14:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0d22Wj9YSgGlvQPy7q8cZh2XhkSJ1Gv5em2fXiDoRRE=; b=2P7Kq4A8kZoSXxOBpvQAh0v6MF
	lFvX1nNo1IS0nmD/32lQHNEK1XABYNAgAAgqwlNw5dDbD4XXGjvsmgxARJh/C21QWDLn4egU5eVqr
	00wEfPf420QQa5LC9BMUdnMA1g+4Tbj5bu6yQCjQ5R7DlWv0tYPcOrXYh0SsmH8hkgM1ozswYOh0L
	xY5BAUtNjNhNpwaB2CWgtQhQCDI9FEZWkHxWxkLTRh2gK6NGDT10zvnkQ1GVblWH44sbBh98Q9nN/
	b9fHnr8vdobxfl3GcfB8DPwP5h/vkw8ZDZj/wLV3jB/3boinmyrMHrgaz1LVOu9X8tRY/+megma7/
	+eLjGFwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHQBT-00Akx0-VQ; Mon, 16 Jan 2023 14:09:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHQ4M-00Aggu-LI; Mon, 16 Jan 2023 14:02:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 02D2C60FCA;
	Mon, 16 Jan 2023 14:02:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1345AC433EF;
	Mon, 16 Jan 2023 14:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673877757;
	bh=rKhjvkQjqw5KgkQ2IGqQE+M1sJPep97rfaS5IO0auYg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NQ3kgJk1vmkTeA1lOwjtfoxP/rT4tY+1KhWg4RhMbiT77aX/ozV1XBKLXQUvBlYjg
	 4ZdNbYK7X6qEo1Nz0xQfq9bZIAyygVGDnASxf+sU6HiTb06+XHvD/T6XJvJvlScQJ8
	 LmRHDh5xQD1T0h8H0WmNBWFZBbq6LLpvsD1CL2C7xfRwBgaZEc8zZl6OS5UH7CSuyo
	 5ZCzZqq/sUh3eUoSsXZq2Iba2GLU5Wc0gTy2Ef/kxtYmo6xAmTCgVeYxG/3FgnmBF/
	 UuRIBtlpEMCedDWLznp5koEuOiebyX2Ty1CrrX4p4qshlh7JvN1EQHSEBz91+mqbmU
	 DWEE/p7TK8Dng==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jiaxin.yu@mediatek.com,
	tzungbi@kernel.org,
	trevor.wu@mediatek.com,
	julianbraha@gmail.com,
	allen-kh.cheng@mediatek.com,
	renzhijie2@huawei.com,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 12/53] ASoC: support machine driver with max98360
Date: Mon, 16 Jan 2023 09:01:12 -0500
Message-Id: <20230116140154.114951-12-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230116140154.114951-1-sashal@kernel.org>
References: <20230116140154.114951-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_060238_779340_22A062AA 
X-CRM114-Status: UNSURE (   9.68  )
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

From: Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>

[ Upstream commit 810948f45d99c46b60852ef2a5a2777c12d6bb3e ]

Signed-off-by: Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>
Link: https://lore.kernel.org/r/20221228103812.450956-1-chenxiangrui@huaqin.corp-partner.google.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 7bdb0ded831c..b027fba8233d 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -187,6 +187,7 @@ config SND_SOC_MT8186_MT6366_RT1019_RT5682S
 	depends on SND_SOC_MT8186 && MTK_PMIC_WRAP
 	select SND_SOC_MAX98357A
 	select SND_SOC_MT6358
+	select SND_SOC_MAX98357A
 	select SND_SOC_RT1015P
 	select SND_SOC_RT5682S
 	select SND_SOC_BT_SCO
-- 
2.35.1


