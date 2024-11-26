Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71F6D65554
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2024 20:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KG/Kg0ePMdkfS4t5EFLIRwRC4Dq4IlcBVb7Xm75eJbU=; b=QaxHgdY5qFnnPa9oCSOZedUila
	AA8RHloUKXZx0y+QN5cP5a61Vf7A8Io4Om5bsVyYqYdJSGJWW6rz9Vxp9j1Q8PegH+bclspU0SBEa
	xnK36uodB5ksj6hp4Vc8EWU4dq+WdnJBbnEymV83qbmIBBkE/IUpsB40w4yyrubl9FzNzKEyPRTvU
	414u+A5yICTBz+0c8+yHUsrQpqe6RhAgaL49dT6FkXVZOKOvkc5H0Sr1q9hBzn08wMLxlRe8DT95u
	JF/DdhzzmlhDNl3dFXvbxsPI69W3YkWZ8ARHNSouPfL485hOqHXyZhPUla4iKvV14Mt+zlR5cs593
	L7US6ExQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG2Mn-0000000BfmT-2WZY;
	Tue, 26 Nov 2024 20:41:01 +0000
Received: from mail-10626.protonmail.ch ([79.135.106.26])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG2Ml-0000000Bfko-0H0P
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Nov 2024 20:41:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=monroe.io;
	s=protonmail; t=1732653653; x=1732912853;
	bh=KG/Kg0ePMdkfS4t5EFLIRwRC4Dq4IlcBVb7Xm75eJbU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=ZvS5CaD4YYZpKp/QfYVYA9QemezOwhZM6t4YgEV39H93i3QtHsjsItpbWecNF680e
	 FVBvdFM+NiNbxPx+bef6wr7sa4cP5YP8GrkyXZLx2tPVp66we2OZxYHWaTqxP2hmq5
	 gomYJnk7xfZfcEXoZIK0fIxtYEu2xO1euXiZ9ZpI8Qa9OKtyFOM5nC5cjDdvuPLbKc
	 v6dVm/2I4u6GBDP72Ihb1PTwtLwNYjULMeA1OxmKTJaq8NFHzdTb5RAmdOL5a+78PS
	 0Kk+DdNIZD/y3XHbjvFmlz6EVSsimdzp4u5tKSBActfwrMZIPXgfY/N/r4AjO8OI16
	 EGOuhQTU6qeJA==
Date: Tue, 26 Nov 2024 20:40:49 +0000
To: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>
From: Chad Monroe <chad@monroe.io>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, Chad Monroe <chad@monroe.io>
Subject: [PATCH] wifi: mt76: mt7996: exclude tx backoff time from airtime
Message-ID: <88821d8f08e2715927939b35e630a06171962636.1732653612.git.chad@monroe.io>
Feedback-ID: 9731019:user:proton
X-Pm-Message-ID: 8f0a5ca459019cf184da20d2b34238f678a70372
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_124059_718271_A4103273 
X-CRM114-Status: UNSURE (   5.71  )
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

This helps to make STA airtime counters more accurate.

Signed-off-by: Chad Monroe <chad@monroe.io>
Suggested-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 4 ++++
 drivers/net/wireless/mediatek/mt76/mt7996/regs.h | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net=
/wireless/mediatek/mt76/mt7996/init.c
index f6a010b61a8a..afc4884f7ba2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -460,6 +460,10 @@ mt7996_mac_init_band(struct mt7996_dev *dev, u8 band)
 =09mt76_clear(dev, MT_WF_RMAC_MIB_AIRTIME4(band),
 =09=09   MT_WF_RMAC_MIB_QOS23_BACKOFF);
=20
+=09/* clear backoff time for Tx duration */
+=09mt76_clear(dev, MT_WTBLOFF_ACR(band),
+=09=09   MT_WTBLOFF_ADM_BACKOFFTIME);
+
 =09/* clear backoff time and set software compensation for OBSS time */
 =09mask =3D MT_WF_RMAC_MIB_OBSS_BACKOFF | MT_WF_RMAC_MIB_ED_OFFSET;
 =09set =3D FIELD_PREP(MT_WF_RMAC_MIB_OBSS_BACKOFF, 0) |
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h b/drivers/net=
/wireless/mediatek/mt76/mt7996/regs.h
index 06e307b5b02e..1876a968c92d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
@@ -175,6 +175,9 @@ enum offs_rev {
 #define MT_WTBLOFF_RSCR_RCPI_MODE=09=09GENMASK(31, 30)
 #define MT_WTBLOFF_RSCR_RCPI_PARAM=09=09GENMASK(25, 24)
=20
+#define MT_WTBLOFF_ACR(_band)=09=09=09MT_WTBLOFF(_band, 0x010)
+#define MT_WTBLOFF_ADM_BACKOFFTIME=09=09BIT(29)
+
 /* ETBF: band 0(0x820ea000), band 1(0x820fa000), band 2(0x830ea000) */
 #define MT_WF_ETBF_BASE(_band)=09=09=09__BASE(WF_ETBF_BASE, (_band))
 #define MT_WF_ETBF(_band, ofs)=09=09=09(MT_WF_ETBF_BASE(_band) + (ofs))
--=20
2.39.5



