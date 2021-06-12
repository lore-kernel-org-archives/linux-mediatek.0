Return-Path: <SRS0=FQm5=LG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD262C48BE5
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Jun 2021 14:36:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80F4161376
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Jun 2021 14:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80F4161376
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3xeN9Tw6eNOeTS4mlilOGsAgKfJsoh9qlDGgxE8RHCc=; b=L8v50LOwVQVz8W
	VmIIBwZctfD7OpKZ7ox0a93Eklg92yMA7Hy30LMMftw7mCaumZHVoIT2tEcL0QG4x3TMO/tPJim5G
	FodM7yXfO/UxsrMrUYLnboOkztfbY9UUz9TyJ4K+KsGwMArhCJcbytCqVyEdg0GuRWJAiItiSIni+
	6jo0jrE8erp7pIsEq4Xw6ZIGUxa37KeWJbEUVeKbdTEN4h7k9rcj5mzDlr0tRLP6irtNFyKagDVcK
	tr5q5MCkGUIdCPw/2MopNdom3NWzM2NjkRVE86ThFIFSzJ3DgvPwS+22hfQ22zUbc0urtqoSuDFwL
	dVAbPdTPd1BNiMVbgZ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ls4jw-008eCL-BA; Sat, 12 Jun 2021 14:36:00 +0000
Received: from mout.gmx.net ([212.227.15.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ls4jj-008eBc-A5; Sat, 12 Jun 2021 14:35:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623508529;
 bh=4GRBqMXu77f5LzS1AYmY/Pv3PyBwvmo8iWWSKO+eOSM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=MOUpEMFz2zwru/v/vvDy+q8zQBqjKnDBqkptW8QS+wxzQ/4z4NfOnO77JaNYUHowL
 ZJ8JmgUjJLtNAAUF0bHUqvK3lvjRpAh18C7y7Yu+A5CxXTPlTeuA7X53oKA6TKZWaX
 MyN/WQIGTLnBllo9wSB3BDcAECZ3hdySw3bx96fU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([83.52.228.41]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MG9gE-1m6QjE3X3M-00Gct6; Sat, 12 Jun 2021 16:35:29 +0200
From: John Wood <john.wood@gmx.com>
To: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>
Cc: John Wood <john.wood@gmx.com>, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Shayne Chen <shayne.chen@mediatek.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mt76/mt7915: Fix unsigned compared against zero
Date: Sat, 12 Jun 2021 16:35:05 +0200
Message-Id: <20210612143505.7637-1-john.wood@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:RLOmvHMXqv6YzC6MbWRgT6VnA5VAhfOSQfIeL9vcZRQOX2acGVX
 iFXwCXoE4TnDXw5rfZ0VQBHl2rJ2xS7R4Rm6FhL3+iTmFFmT1Okpy9Uu5nwBDJ2vGH8lxoK
 Q01TmeCapD6wUdgI51jJ9t176VmNcezyrJMHUELa/8EKxo5VcJPOf4vvbu7y3dkc60p4QAK
 xzAYFKNLbqYHIs81Pc8Dg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XQhJptkxzu8=:GGdsO5+3quPg2/g0XpWZlq
 y0lAUcznNQGLmuH16OSKkJIM4Y5/1EoH2WK6+oqLGe6LgZu+8x9SKeHr0djXqltXoF6J5XxOY
 ALRycaueYFMpUZzbNG+RmXleNj8jO4mlKOjmioYPHZYFP/gxNYUGEDMFCxURxp7zBiktfG2iT
 ZvFlCmZoILCizNSKhbF/yp9oyHxgVpe4kkd9S3KOMl5ashU5DCAXWqnfXUkRDcwieCuI72R7R
 AhTugHHYhE3uIzwp2LUwAKfrabcXNMb4mJ3NuY3iAqDHJ3NK4S0EN6IJc4ezxK3LloMal67eY
 /ibmICAdETG+6pvTI2v+KjiMra/M1gFQEK8mnILXE8cVLSLb/We3HxAD+l6kPWSo6c3vqcJi6
 iJmTmfncgmAvpJuEKYMkA05p1ImF2/+BBpRBRf80H2SwAmFehKOjBuitB5K03cs+DGqRVza69
 IJrCBKj4DfiXd2UlCBf77jYdL7SsVWW4cMYvX4Hn4//c5++RowKsZ8y9btg8vGyETa+Ll9jfl
 uwUi/1PWRmoQl+/SgU5sEGugHB0ap7Ttmb+9yTvYZPBfL8N3+bjNM4Rpv4gmDK+L3RdjPLAIi
 dqtdPCXRpERtFzyJD1SQKMBaqbPzpnPS/Ag8ebeqwdQWf3Z8LeYbPaIk0Q+Zhxb4bMZWRIF+l
 OuRngIlIRrfsA1AMvDkqhdxdP4rbvonSfwhkFzvx6exXl4pgko6I0x75PY7SIizeunCxMIaBy
 GsAH0TSCWn8i3HKLBwNvp52UvZZVeUJBqREQ0ut3F+C4+dDea1o62bKlhtDxHRQsELyXKxYQG
 3pwq/ojHjW1fjCybKyu4HiQBMSsg6Dqdk5DX6bLK/b/xpD6kPW/mDwH+tI1uZMVwh9iFBUBhe
 q2CKAxApNZfzEzIRpIdAEN0FTESLfRiuj97IGsFaPF/hTbavQtdEHryZejTlNmHCkHGA3lw5+
 p/5HmwTAS74AydtlI6QbhXE02pnCKspy77tuHpb+Pg166zkwTeu7jYYK8qvXsy8Z3BcmsvDqU
 TM10UDILOhMK9Rfu+vDGNHorrpxBZIqzyToOEZ9msLnhqvYdu4GCST0Rh9tSFx6RZhfG5ap4I
 9vA83+u7aHTVXJEwAKBoW9mOAN3l/eIkbc9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_073547_712941_630BBBCC 
X-CRM114-Status: GOOD (  10.69  )
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

The mt7915_dpd_freq_idx() function can return a negative value but this
value is assigned to an unsigned variable named idx. Then, the code
tests if this variable is less than zero. This can never happen with an
unsigned type.

So, change the idx type to a signed one.

Addresses-Coverity-ID: 1484753 ("Unsigned compared against 0")
Fixes: 495184ac91bb8 ("mt76: mt7915: add support for applying pre-calibration data")
Signed-off-by: John Wood <john.wood@gmx.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index b3f14ff67c5a..764f25a828fa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3440,8 +3440,9 @@ int mt7915_mcu_apply_tx_dpd(struct mt7915_phy *phy)
 {
 	struct mt7915_dev *dev = phy->dev;
 	struct cfg80211_chan_def *chandef = &phy->mt76->chandef;
-	u16 total = 2, idx, center_freq = chandef->center_freq1;
+	u16 total = 2, center_freq = chandef->center_freq1;
 	u8 *cal = dev->cal, *eep = dev->mt76.eeprom.data;
+	int idx;

 	if (!(eep[MT_EE_DO_PRE_CAL] & MT_EE_WIFI_CAL_DPD))
 		return 0;
--
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
