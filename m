Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9CFECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 12:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PdukXL+14+SCNZvplferwaLudZcQBMaEPikpoQpVCHg=; b=juZ8ptFHyDrqxM5XXF5iqZm3iK
	LQPoFUCc9IpnEKxO3DqVnX82lSqQXDMbPs9eIUnVTjmMH3ip0rq5nC0ZC5yH8au270KOkYwg4E6n2
	+pWr/FQ6lJ+Jr64gOOsugQ1WaBgp2fBo3IE1jlz7OBX1IntIqnD8zqMIPpyIPHD75yZt56vqTdypt
	5eC2kkRsU0kN6BU9IV5jCoNz3I9yXNyaU3Bu0aaXMXpw3VDv+2U7nyapD/f/g/j4hm2T1fXi4sQ1r
	VRhwpPwadjyanpm+24f8KIJFzPOF5T5dNRSb2Gg5xbzmlHcQpwfLaHJH05pAOdP2fRJ7Es1JRxFiO
	m1Kow1kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooOwf-00HBfP-CC; Fri, 28 Oct 2022 12:58:45 +0000
Received: from mail.astralinux.ru ([217.74.38.119])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooOwR-00HBab-PG; Fri, 28 Oct 2022 12:58:33 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id 6266A186458D;
	Fri, 28 Oct 2022 15:58:24 +0300 (MSK)
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 7BSvSK3WxBlH; Fri, 28 Oct 2022 15:58:24 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id ED4DA186458E;
	Fri, 28 Oct 2022 15:58:23 +0300 (MSK)
X-Virus-Scanned: amavisd-new at astralinux.ru
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ud5wkNZ1Usua; Fri, 28 Oct 2022 15:58:23 +0300 (MSK)
Received: from rbta-msk-lt-106062.astralinux.ru (unknown [10.177.20.20])
	by mail.astralinux.ru (Postfix) with ESMTPSA id 27F931863FEA;
	Fri, 28 Oct 2022 15:58:23 +0300 (MSK)
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
Subject: [PATCH] vcodec: mediatek: add check for NULL for  vsi->frm_bufs[vsi->new_fb_idx].buf.fb in vp9_swap_frm_bufs
Date: Fri, 28 Oct 2022 15:58:11 +0300
Message-Id: <20221028125811.11340-1-abelova@astralinux.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_055832_013363_1FC1B7E6 
X-CRM114-Status: UNSURE (   9.37  )
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

If vsi->frm_bufs[vsi->new_fb_idx].buf.fb =3D=3D NULL while cleaning
fb_free_list NULL-pointer is dereferenced.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: f77e89854b3e ("[media] vcodec: mediatek: Add Mediatek VP9 Video De=
coder Driver")

Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
---
 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c b/=
drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
index 70b8383f7c8e..b0679aaf6192 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
@@ -512,7 +512,7 @@ static void vp9_swap_frm_bufs(struct vdec_vp9_inst *i=
nst)
 	 * clean fb_free_list
 	 */
 	if (vsi->frm_bufs[vsi->new_fb_idx].ref_cnt =3D=3D 0) {
-		if (!vp9_is_sf_ref_fb(
+		if (vsi->frm_bufs[vsi->new_fb_idx].buf.fb !=3D NULL && !vp9_is_sf_ref_=
fb(
 			inst, vsi->frm_bufs[vsi->new_fb_idx].buf.fb)) {
 			struct vdec_fb *fb;
=20
--=20
2.30.2


