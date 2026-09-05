Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B59FC624D3
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Sep 2026 13:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7ZiQ14PaKZnvVJYQMcokZ3A3QMdtNODA5hCdhtAeY+w=; b=btkQYSQjCRCNfe3KNEBqQgIzNa
	GBjJsEVMKjvidx1FlGHoPIytVdYo9qU82fgyymRxKuK+A/NekRQCQquxo6frCfN3FkWAKPunQ7nya
	wuNRehCq0rZ6xAN0mFpL5YsRufWG11Guv7hyYGCjsR96hnFgHc2874j9G3IH2xsghIFlbfayd4y0Y
	BYytJnN1qkB4di7rINjj+Iu2XSiN9QJU8vYe3dizRTG/6e1xJEtGIchdhpdBFUDajWE8DDBI67Adw
	MN1Twh2G84BIX84wHBlOYz+MivQkUTboQaiP7ntBuMBDQSCUAlCCRg5hmWM35ChPLKk4MgOfvWbFo
	JGNPBvHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qX2-000000046cF-0NnP;
	Sat, 05 Sep 2026 13:34:08 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qWy-000000046bU-1yKN;
	Sat, 05 Sep 2026 13:34:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=7Z
	iQ14PaKZnvVJYQMcokZ3A3QMdtNODA5hCdhtAeY+w=; b=Gb14eWztY+/ZTaUJ3z
	bMdWKBMcrV14ksX7NMTjXIE2dUoMpB2S8iWP7Fe7l+6pPdAJJU0bTqRe0CowhtG8
	ftEoehkGgWWgzDueL1D+/+AKzv/a74ryCzDItGPqOC3vuc1isLl7fk+GtObmElUO
	8uZqbkfyiU30XH8W8m7gJewHM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDnL50zGpxqMotiNw--.8161S2;
	Sat, 05 Sep 2026 21:33:40 +0800 (CST)
From: "hpp.iscas" <hppiscas@163.com>
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: "hpp.iscas" <hppiscas@163.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: mediatek: mt6735-mfgcfg: Publish the OF module alias
Date: Sat,  5 Sep 2026 21:33:37 +0800
Message-ID: <20260905133337.64201-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID: PCgvCgDnL50zGpxqMotiNw--.8161S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruF4xKw4kuw1DuFWrKF1kAFb_yoWDZwc_C3
	WDXrW7Zr1xtryjkr40gF1fZFWIqa1DZr1kCa4Yg39aqryxCF1DW39Fv39rXr4UW340vF1D
	tr1kWr1xCanrAjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRk9NDUUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxRRVHmqcGjQeNQAA3p
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_063404_907736_039F6EE2 
X-CRM114-Status: UNSURE (   6.45  )
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

The MT6735 mfgcfg driver is built as an independent module when its=0D
tristate option is m. Its platform-driver match table is not published=0D
for OF modalias matching.=0D
=0D
Publish the existing table while retaining the clock and reset setup.=0D
=0D
Fixes: 0bd9b1211f74 ("clk: mediatek: Add drivers for MT6735 syscon clock an=
d reset controllers")=0D
Signed-off-by: hpp.iscas <hppiscas@163.com>=0D
---=0D
 drivers/clk/mediatek/clk-mt6735-mfgcfg.c | 1 +=0D
 1 file changed, 1 insertion(+)=0D
=0D
diff --git a/drivers/clk/mediatek/clk-mt6735-mfgcfg.c b/drivers/clk/mediate=
k/clk-mt6735-mfgcfg.c=0D
index 1f5aedd..8a18ee2 100644=0D
--- a/drivers/clk/mediatek/clk-mt6735-mfgcfg.c=0D
+++ b/drivers/clk/mediatek/clk-mt6735-mfgcfg.c=0D
@@ -45,6 +45,7 @@ static const struct of_device_id of_match_mt6735_mfgcfg[]=
 =3D {=0D
 	{ .compatible =3D "mediatek,mt6735-mfgcfg", .data =3D &mfgcfg_clks },=0D
 	{ /* sentinel */ }=0D
 };=0D
+MODULE_DEVICE_TABLE(of, of_match_mt6735_mfgcfg);=0D
 =0D
 static struct platform_driver clk_mt6735_mfgcfg =3D {=0D
 	.probe =3D mtk_clk_simple_probe,=0D


