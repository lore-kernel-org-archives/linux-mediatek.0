Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A1BECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 10:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zwzLdWoWFgq62O5OUUPFj6Ag8jaRzLM+v7K+j93cq9Q=; b=wBCHk4chAJEnMLmHZiJlmcOQbd
	2sR0cYNKwIxvfGZ12m96I+mnsaJbf3XeyWnWwfb/XGNpbghy1jHeQPqo4HfQYdZa5/pEPKpZGvmdL
	cNO+9D4rFxTWm6a4Nqowfwo+7xn0Hde/szfePIAzd57SOVJvoehTX69P0h44V6mCbzatXHU8aHvR8
	UASwdgu9wiZXGr7MMLJgrVhMMz7XBxSf11zbcxux8sJZO7esfSBfJJ9RyXCqF1P1vx4EFFBEMxeZL
	XLBrpKNY9enF6LKd4pJL1sw8m29BW2kOf7wb6X9qBuW3ty4XLuhTgJt5d7dC9AJrjJhqWhfT/mCFu
	iwbP+RUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooMKe-00GZb6-75; Fri, 28 Oct 2022 10:11:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooMFg-00GXAD-VO; Fri, 28 Oct 2022 10:06:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zwzLdWoWFgq62O5OUUPFj6Ag8jaRzLM+v7K+j93cq9Q=; b=cVI3iPRP9gWeyM/NYB9omyAnZp
	OjsiPD+FvsdDnL8BZPbbWr7Jw8M4vaX/fkYw7lyqdSfoW1G4VEf/66lCba6pHDfYDBR7eQuxJ/bKV
	aKYAKv/Upmqe8CAJaXt0a0tw1uiBicrRbrAPnyx1JGuyoXjgO4j+yZj3LDhLBDixNvv3dHO0FI4BA
	hzizln9IDaFoJAYFKrjyN8LIGCrGA0/JTUsnlwmAzi7NtF2sHT1g41LBWyB4+sfE4q2ZTPqotZiAq
	jHqC/UHYyScRSUZ/qbT9sH27kK+EoxHPBbAqTgbKv3ci6uIu//ZChpy9W09NlUgzrkrCD4qJbXdn4
	b+GGbYzQ==;
Received: from mail.astralinux.ru ([217.74.38.119])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooMFd-0075Ml-3r; Fri, 28 Oct 2022 10:06:11 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id D5A801864518;
	Fri, 28 Oct 2022 13:05:55 +0300 (MSK)
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id RQ0YjnkqfdBW; Fri, 28 Oct 2022 13:05:55 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id 7E2381864579;
	Fri, 28 Oct 2022 13:05:55 +0300 (MSK)
X-Virus-Scanned: amavisd-new at astralinux.ru
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id PqBdEedcLvs2; Fri, 28 Oct 2022 13:05:55 +0300 (MSK)
Received: from rbta-msk-lt-106062.astralinux.ru (unknown [10.177.20.20])
	by mail.astralinux.ru (Postfix) with ESMTPSA id DF1611864315;
	Fri, 28 Oct 2022 13:05:54 +0300 (MSK)
From: Anastasia Belova <abelova@astralinux.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Anastasia Belova <abelova@astralinux.ru>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 5.10 1/1] vdec_vp9_if: add check for NULL for vsi->frm_bufs[vsi->new_fb_idx].buf.fb in vp9_swap_frm_bufs
Date: Fri, 28 Oct 2022 13:05:39 +0300
Message-Id: <20221028100539.30925-2-abelova@astralinux.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221028100539.30925-1-abelova@astralinux.ru>
References: <20221028100539.30925-1-abelova@astralinux.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_110609_467250_80561A38 
X-CRM114-Status: UNSURE (   9.90  )
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

Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
---
 drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c b/drive=
rs/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
index d9880210b2ab..dea056689b48 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
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


