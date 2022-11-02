Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC19C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 12:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XIwwONpUR9SdSPR3A4IDAkq7FO9Vi6bAN02Uo080t4Q=; b=dXhXE/z4I7zfLD4PNnicWC/fAz
	8yvqcufzEyJDcgMZ/D1tvXyzIK851lwUDKKC9pfeKZB76cwrYVDRYb7wSru53VnYXVFC3ELMVMNr0
	klayNmpot2KYhto0IPnUoXHMOGmNdnmPZJ/f3AIMaKcE7P5lYTrwDvQ/dnjYaakf4YIHrWGMzrqBS
	JtTZ4poKTPI7m/Z3xwEhmAm+PljyLTxF9rSfeWbmLrXZwyrBlNRDg6VviTmUvSZAPnQH9VSNpyeDQ
	kQRY7FfJtjW29vjdrZ32Yds3/6nT0m35iJpfk1xrAgzEkogxIYDK3aXlFqTr0vdmRnR1BnTEfZceN
	FVpwDh6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqCaH-00Av8E-F6; Wed, 02 Nov 2022 12:11:05 +0000
Received: from mail.astralinux.ru ([217.74.38.119])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqCa5-00Av3Z-UQ; Wed, 02 Nov 2022 12:10:55 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id 240631864286;
	Wed,  2 Nov 2022 15:10:37 +0300 (MSK)
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id x3qXL0O3_M-d; Wed,  2 Nov 2022 15:10:36 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id C9B7A1864285;
	Wed,  2 Nov 2022 15:10:36 +0300 (MSK)
X-Virus-Scanned: amavisd-new at astralinux.ru
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id OhcNLsfn8h1N; Wed,  2 Nov 2022 15:10:36 +0300 (MSK)
Received: from rbta-msk-lt-106062.astralinux.ru (unknown [10.177.20.20])
	by mail.astralinux.ru (Postfix) with ESMTPSA id 1483F1864280;
	Wed,  2 Nov 2022 15:10:36 +0300 (MSK)
From: Anastasia Belova <abelova@astralinux.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Anastasia Belova <abelova@astralinux.ru>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	lvc-project@linuxtesting.org
Subject: [PATCH v2] vcodec: mediatek: add check for NULL for 
Date: Wed,  2 Nov 2022 15:10:27 +0300
Message-Id: <20221102121027.4285-1-abelova@astralinux.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_051054_187747_3E857FBA 
X-CRM114-Status: UNSURE (   9.47  )
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

Any time calling vp9_is_sf_ref_fb we need fb !=3D NULL after checks.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: f77e89854b3e ("[media] vcodec: mediatek: Add Mediatek VP9 Video De=
coder Driver")

Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
---
 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c b/=
drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
index 70b8383f7c8e..776468cd834a 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
@@ -208,6 +208,9 @@ static bool vp9_is_sf_ref_fb(struct vdec_vp9_inst *in=
st, struct vdec_fb *fb)
 	int i;
 	struct vdec_vp9_vsi *vsi =3D inst->vsi;
=20
+	if (!fb)
+		return true;
+
 	for (i =3D 0; i < ARRAY_SIZE(vsi->sf_ref_fb); i++) {
 		if (fb =3D=3D &vsi->sf_ref_fb[i].fb)
 			return true;
--=20
2.30.2


