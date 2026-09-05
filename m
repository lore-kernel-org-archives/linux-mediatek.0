Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F34C624D3
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Sep 2026 13:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FObr8zk9lwX0SnKtG4JNGHiNnmnoWGmqHJglX3yyxo4=; b=gRjLRn6VzdzjacHWqEkS0Bargn
	/EIL4o3cxkzjBfHJIi+sJlNCk8zPDN64tRSbo9TBb47AME+DLNKYktT1CrsCnA4oNLsLMVM1w3IHj
	ZyUJumV81fpPTOqH2iSWFqICBrkujDV2ZJwhHaVEUfozURMQwAu63/olXfaZDithy0Q4ca9JF0TGj
	cV6DYB6evZf8EFyatibX3CIWdmSVkbbiDS4TqyMDnyNM9Ik6uQwxnn89+BW31W6sx6KAwNQkcK7A/
	2o8anyV1oCcD24fwRqqY3i+VRIdeNE5FUl8OG9eCENJydHN2Ks9zdhY5C+CfjX8VF8DVa2Rz7yNkC
	svZF36BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qXe-000000046hU-43Bd;
	Sat, 05 Sep 2026 13:34:46 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qXZ-000000046gQ-1bJQ;
	Sat, 05 Sep 2026 13:34:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=FO
	br8zk9lwX0SnKtG4JNGHiNnmnoWGmqHJglX3yyxo4=; b=HZe6aquM6Sh+cv781J
	CParfciaUTDsKmtySjBC7rS/zOhx1VkF46q9PC9ol36HIQf7MBdrwWb00jMDx1J2
	GcjqiJtCe40S/zXYwPK5eAaWhtMKv29bHJUljVAY3lej3icbAU2R5nctiFtGLAdL
	AzVkb3dnr1md9LWGxm1fhuYh8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wA3rmtcGpxqLTNrAw--.54824S2;
	Sat, 05 Sep 2026 21:34:21 +0800 (CST)
From: "hpp.iscas" <hppiscas@163.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: "hpp.iscas" <hppiscas@163.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>
Subject: [PATCH] clk: mediatek: mt7988-apmixed: Publish the OF module alias
Date: Sat,  5 Sep 2026 21:34:17 +0800
Message-ID: <20260905133417.64373-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID: _____wA3rmtcGpxqLTNrAw--.54824S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XrW3tF17WrW8KFy7XF45GFg_yoWDZFg_uw
	4DZr4xuryDKF9Yvr4Fya1fZr9IkrWavrWDXFyrtw1ava4DuFsrZ39FvwsYqr17GryvvF1D
	JFnY9Fy8Cry5ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRk9NDUUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxh1fKGqcGl0TVAAA3a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_063441_803380_D4283B5C 
X-CRM114-Status: UNSURE (   7.66  )
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

COMMON_CLK_MT7988 is tristate and builds apmixed as a separate object.=0D
The apmixed platform driver has an OF match table but exports no OF=0D
alias, so that table cannot be used to select the module on a device=0D
event.=0D
=0D
Publish the table. Keep the existing initialization entry point.=0D
=0D
Fixes: 4b4719437d85 ("clk: mediatek: add drivers for MT7988 SoC")=0D
Signed-off-by: hpp.iscas <hppiscas@163.com>=0D
---=0D
 drivers/clk/mediatek/clk-mt7988-apmixed.c | 1 +=0D
 1 file changed, 1 insertion(+)=0D
=0D
diff --git a/drivers/clk/mediatek/clk-mt7988-apmixed.c b/drivers/clk/mediat=
ek/clk-mt7988-apmixed.c=0D
index 416a4b8..24f4e7b 100644=0D
--- a/drivers/clk/mediatek/clk-mt7988-apmixed.c=0D
+++ b/drivers/clk/mediatek/clk-mt7988-apmixed.c=0D
@@ -75,6 +75,7 @@ static const struct of_device_id of_match_clk_mt7988_apmi=
xed[] =3D {=0D
 	{ .compatible =3D "mediatek,mt7988-apmixedsys" },=0D
 	{ /* sentinel */ }=0D
 };=0D
+MODULE_DEVICE_TABLE(of, of_match_clk_mt7988_apmixed);=0D
 =0D
 static int clk_mt7988_apmixed_probe(struct platform_device *pdev)=0D
 {=0D


