Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846B1D5A6E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2024 04:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AIM9G46Lewbfr7gTOPpDDjFQJKkuhMHWUdwgeo5jv2s=; b=1L/FEiV5bCl8CZa6pwSllrv8ye
	D58231yOs01eq9Ix8lLuliKGugawUnpLyuSRg/txyUYLUV5nJhHcxF4JSmNqE0+ttCGdiRJFAmb0R
	YlLjRvdNwBSGfRkH2fMr5U2YHVJftAus3MfnTo54JEP6X5iR1qWV1RYnoIi6I6OM/D++aBCKU935F
	edTW2qf05Rvy9dT98/Oxe0Wv1TsBVRRad9zkMoXZp1DbvaScrsclDxyJp6G0zhnlC94f2iXSnu/Iv
	A48qxHNCtKkinghjA04zKNwDMokJKdhw3731YaLY4Nmoza37JmKTeTOlqBgFCCLa4G4SQ9vHT6pZo
	caDM16IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFnZX-00000009dGX-499C;
	Tue, 26 Nov 2024 04:53:11 +0000
Received: from mail-4022.proton.ch ([185.70.40.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFnZU-00000009dG3-2EU5
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Nov 2024 04:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=monroe.io;
	s=protonmail; t=1732596783; x=1732855983;
	bh=AIM9G46Lewbfr7gTOPpDDjFQJKkuhMHWUdwgeo5jv2s=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=BTzIZ1i+w+Qek8LkJZ8KTdZc3YrHMmLqez+q1QnnCTWSeC76rmA/m/aYzXZHayjRT
	 BiGb5olZV3rZwSKHvjn2dArD0d3L7G3aLlElYwBtwP7kBe9kwCkiL70f1ayFFvXP7U
	 sQFuHc2aga344twHxm0GzFQF38ACAN1LePFmXMEFK6DOVW/Ss9Srfgf+AhRccPVGVX
	 WHvRvvkYRMZQXZF2msr6DBV+i/1HYrMBmJJBv127kDwec/+lOGjRQ06VgbmRGaJBTq
	 JbDrdQG95XdXuAuXOCxPZWHibiGsDlMk6xlWzMTXN+ULWUqiX9HbROUG4nfW4njK/q
	 hmwMDoAPidY9g==
Date: Tue, 26 Nov 2024 04:52:58 +0000
To: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>
From: Chad Monroe <chad@monroe.io>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, Chad Monroe <chad@monroe.io>
Subject: [PATCH] wifi: mt76: mt7915: exclude tx backoff time from airtime
Message-ID: <026380cec180261956b983cbdb009605867bcd8d.1732596478.git.chad@monroe.io>
Feedback-ID: 9731019:user:proton
X-Pm-Message-ID: 0bef503ef34258a0a7a67823071503228d0c0792
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_205309_187322_B7A13852 
X-CRM114-Status: UNSURE (   7.33  )
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
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 9 +++++++++
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c  | 9 +++++++--
 drivers/net/wireless/mediatek/mt76/mt7915/mmio.c | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7915/regs.h | 7 +++++++
 4 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net=
/wireless/mediatek/mt76/mt7915/init.c
index 6bef96e3d2a3..faa1bc8359d9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -512,6 +512,15 @@ mt7915_mac_init_band(struct mt7915_dev *dev, u8 band)
 =09mt76_clear(dev, MT_WF_RMAC_MIB_AIRTIME4(band),
 =09=09   MT_WF_RMAC_MIB_QOS23_BACKOFF);
=20
+=09/* clear backoff time for Tx duration */
+=09mt76_clear(dev, MT_WTBLOFF_TOP_ACR(band),
+=09=09   MT_WTBLOFF_TOP_ADM_BACKOFFTIME);
+
+=09/* exclude estimated backoff time for Tx duration on MT7915 */
+=09if (is_mt7915(&dev->mt76))
+=09=09mt76_set(dev, MT_AGG_ATCR0(band),
+=09=09=09   MT_AGG_ATCR_MAC_BFF_TIME_EN);
+
 =09/* clear backoff time and set software compensation for OBSS time */
 =09mask =3D MT_WF_RMAC_MIB_OBSS_BACKOFF | MT_WF_RMAC_MIB_ED_OFFSET;
 =09set =3D FIELD_PREP(MT_WF_RMAC_MIB_OBSS_BACKOFF, 0) |
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/=
wireless/mediatek/mt76/mt7915/mcu.c
index 87d0dd040001..35af41b5bad6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3150,8 +3150,13 @@ int mt7915_mcu_get_chan_mib_info(struct mt7915_phy *=
phy, bool chan_switch)
 =09res =3D (struct mt7915_mcu_mib *)(skb->data + offs_cc);
=20
 #define __res_u64(s) le64_to_cpu(res[s].data)
-=09/* subtract Tx backoff time from Tx duration */
-=09cc_tx =3D is_mt7915(&dev->mt76) ? __res_u64(1) - __res_u64(4) : __res_u=
64(1);
+=09/* subtract Tx backoff time from Tx duration for MT7915 */
+=09if (is_mt7915(&dev->mt76)) {
+=09=09u64 backoff =3D (__res_u64(4) & 0xffff) * 79;  /* 16us + 9us * 7 */
+=09=09cc_tx =3D __res_u64(1) - backoff;
+=09} else {
+=09=09cc_tx =3D __res_u64(1);
+=09}
=20
 =09if (chan_switch)
 =09=09goto out;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/net=
/wireless/mediatek/mt76/mt7915/mmio.c
index 44e112b8b5b3..530182e20ce2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
@@ -138,6 +138,7 @@ static const u32 mt7915_offs[] =3D {
 =09[AGG_ACR0]=09=09=3D 0x084,
 =09[AGG_ACR4]=09=09=3D 0x08c,
 =09[AGG_MRCR]=09=09=3D 0x098,
+=09[AGG_ATCR0]=09=09=3D 0x0ec,
 =09[AGG_ATCR1]=09=09=3D 0x0f0,
 =09[AGG_ATCR3]=09=09=3D 0x0f4,
 =09[LPON_UTTR0]=09=09=3D 0x080,
@@ -212,6 +213,7 @@ static const u32 mt7916_offs[] =3D {
 =09[AGG_ACR0]=09=09=3D 0x054,
 =09[AGG_ACR4]=09=09=3D 0x05c,
 =09[AGG_MRCR]=09=09=3D 0x068,
+=09[AGG_ATCR0]=09=09=3D 0x1a4,
 =09[AGG_ATCR1]=09=09=3D 0x1a8,
 =09[AGG_ATCR3]=09=09=3D 0x080,
 =09[LPON_UTTR0]=09=09=3D 0x360,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net=
/wireless/mediatek/mt76/mt7915/regs.h
index 89ac8e6707b8..c5ec63a25a42 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -66,6 +66,7 @@ enum offs_rev {
 =09AGG_ACR0,
 =09AGG_ACR4,
 =09AGG_MRCR,
+=09AGG_ATCR0,
 =09AGG_ATCR1,
 =09AGG_ATCR3,
 =09LPON_UTTR0,
@@ -254,6 +255,9 @@ enum offs_rev {
 #define MT_WTBLOFF_TOP_RSCR_RCPI_MODE=09GENMASK(31, 30)
 #define MT_WTBLOFF_TOP_RSCR_RCPI_PARAM=09GENMASK(25, 24)
=20
+#define MT_WTBLOFF_TOP_ACR(_band)=09MT_WTBLOFF_TOP(_band, 0x010)
+#define MT_WTBLOFF_TOP_ADM_BACKOFFTIME=09BIT(29)
+
 /* ETBF: band 0(0x820ea000), band 1(0x820fa000) */
 #define MT_WF_ETBF_BASE(_band)=09=09((_band) ? 0x820fa000 : 0x820ea000)
 #define MT_WF_ETBF(_band, ofs)=09=09(MT_WF_ETBF_BASE(_band) + (ofs))
@@ -505,6 +509,9 @@ enum offs_rev {
 #define MT_AGG_MRCR_RTS_FAIL_LIMIT=09=09GENMASK(11, 7)
 #define MT_AGG_MRCR_TXCMD_RTS_FAIL_LIMIT=09GENMASK(28, 24)
=20
+#define MT_AGG_ATCR0(_band)=09=09=09MT_WF_AGG(_band, __OFFS(AGG_ATCR0))
+#define MT_AGG_ATCR_MAC_BFF_TIME_EN=09BIT(30)
+
 #define MT_AGG_ATCR1(_band)=09=09MT_WF_AGG(_band, __OFFS(AGG_ATCR1))
 #define MT_AGG_ATCR3(_band)=09=09MT_WF_AGG(_band, __OFFS(AGG_ATCR3))
=20
--=20
2.39.5



