Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2749ED47CAD
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 01:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWTGhizPE0uX/1Ee6qZDpLjHp14QecuWlmzggUKYyNs=; b=cy2pgrvMuRqoVzHz41fKAZMNPx
	CQBKbBr1H/ifGiZJW0drQ18gYfe3J5+gWj2clke3/TrZwNO/MxTkCvAPDxiy17qZjV5Z+5bBjyyab
	aMCwbxV/sOh1JO6cLQfWDlH1eTe6VojQ8ysk30tuZh7JVnlf87DWFHNyFO3k5Lus1C80k8juofljQ
	Vh3H81Vc7+ff1E2R2Jn+JlWTzfTCU9UyIO4x7aR2dVTsTOrhCxGyVCl0VNvllakt7/gHOqWRzWIlF
	dJtEV0unK4807tCHSFvvqUB8dlr5SQYMbU2sd7Pf3yhor2Y9bhF64eHlrNkJHWIv3fjAECJW6ulrB
	7M1JTWkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHe-0000000DOdq-0sNa;
	Fri, 16 Jan 2026 01:05:50 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHQ-0000000DOTE-02hW
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Jan 2026 01:05:40 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-2b6ae4c2012so847313eec.0
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 17:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768525535; x=1769130335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWTGhizPE0uX/1Ee6qZDpLjHp14QecuWlmzggUKYyNs=;
        b=fjfCHWKh9nDE8/QGMspINE653yJUo358cGMabhvUGefla++6caEZ4br4EQis1jh3mA
         s6HEz8P+cL/F99hOmbdL1WQd33SU+Hroid9NN3Rtq/DoVDkFQsNBcFjLe31cDZ2pDlgT
         F2yjCsNvXtsGgUG+i7IqYojhwxS2ZmMagRpb1nxMDzMpzES+QTHeJX5XqJFXfLolzp0L
         kiU9mWES0tw914kHAt/pUmdFqoxNV9hWoe7CR58DH8UhlQ6xl7K1p2fBWn6OjRLiF392
         5AF6PvbYFvHRuUSGEn+NIwGQpgKbW4omjUzk7dXPYcRAM2Mcgp3iKMQI5DN9T19CqxEk
         G8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768525535; x=1769130335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zWTGhizPE0uX/1Ee6qZDpLjHp14QecuWlmzggUKYyNs=;
        b=o/23DmedDDGvSDheQSiENh72rDYWeiV5qVTCs/pAjIlfgkliBo77ju7ZVrSbduVPQl
         FbygR4lhiwNRuJaqTOsbfNSqHROwOeCAEDvkEtgk06XZZ4sNgwZecuWwe+7XWMeCchXx
         zT3iDE5VAj9r3qS2tDlaaF/itCWJTeIfynBullxH7KQ8YJ4Hr55FPH9RBxCwSBjjpf74
         i2V2qhTLR1rAQ8M1ioxXi3jnERuDhrNNMLgiR8pVRd/9Pmh2b+jH7Xsn28UnYBHFgDNQ
         S9Wdf/nGs4r8Njp1UQXwVK2WUTUzsNErVoagDm5QWF6RPeXU0lHcPevLWBbycl8ESkuR
         D/JA==
X-Forwarded-Encrypted: i=1; AJvYcCWbPqrIz+cGVTdKCa/2LGczdNKMbDInj8nZVjRWkjR4D0KGrT8gS5phpB1asHwwgwCj8WoJMxPo62F1SPjBwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuRtbqDdzzsYB4PN3Pmov2wv8fzX+JxTXG5CXjvzJF8q/HNbMr
	F31kzBAU3eb3iB8xJXzYKU/IQBPYX23HA1GvBmj5h0SjCABOAPtCQ1DX
X-Gm-Gg: AY/fxX6vgP2eZh+vYMCFa3AxPrvQKz+ZCi5d0JNoX3okMkHDKtbG0frJ/rFR3/O3+UP
	T0P/UB+TmhUd65Mio0pct3ExHDxXmNyr/TYMSkLEi6TQ+Mv6N+MIbaljARkqy9uovhwDaSgeKvH
	mq1qQiyBThLRRc3HBXjVS/iQyeJJigFfSaD7tKlLwXvGIbgdqJrtCQJlNEMyF5vqQhP8yytcrKU
	zQuhQWNJD/qUv/8hdR2IPwlQtBlOhdEYtH+iT6gnaR+/lIpYXuE/+q4a8/+LHA4T/4JGjwldWBI
	Vcw7GV16u8JAzfawxXSeUgYD5oDG76EvqbzGOiqVj1oyAcUWznmuAUlvkAnPTvpeqive03WQHXr
	ZhC4h85zsISyCevGxLELmR0JbOO4uOpoXVOXdinXZ7lyLPraBSEOm8mX0h81xK9V/AjKhh/HSx2
	DUtSf06PHyH73sox3+yGRyHqGCiBZslkMsGD91zKajCE2jab7XY0KLWg+I6dWGsg==
X-Received: by 2002:a05:7300:748a:b0:2b6:adb4:8a18 with SMTP id 5a478bee46e88-2b6b40c8cf0mr1480744eec.22.1768525534956;
        Thu, 15 Jan 2026 17:05:34 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f1d2:502c:a6ff:5556])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm1019884eec.32.2026.01.15.17.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:05:34 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	linux@frame.work,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	Zac Bowling <zbowling@gmail.com>,
	Zac Bowling <zac@zacbowling.com>
Subject: [PATCH v4 08/21] wifi: mt76: mt7925: add error handling for BSS info in key setup
Date: Thu, 15 Jan 2026 17:05:06 -0800
Message-ID: <20260116010519.37001-9-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116010519.37001-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260116010519.37001-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_170539_412550_E55DF086 
X-CRM114-Status: GOOD (  12.73  )
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

From: Zac Bowling <zbowling@gmail.com>

Check return value of mt7925_mcu_add_bss_info() in mt7925_set_link_key()
when setting up cipher for the first time and propagate errors.

The BSS info update with cipher information must succeed before key
programming can proceed. If this MCU command fails, continuing with
key setup would program keys into the firmware for a BSS that does not
have the correct cipher configuration.

SECURITY NOTE: Silent failure here is particularly dangerous because
the user would believe encryption is active when the firmware may not
have the cipher properly configured, potentially resulting in
unencrypted or incorrectly encrypted traffic. This ensures the error
is propagated up the stack rather than silently ignored.

Reported-by: Zac Bowling <zac@zacbowling.com>
Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index a7e1e673c4..058394b2e0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -637,8 +637,10 @@ static int mt7925_set_link_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 		struct mt792x_phy *phy = mt792x_hw_phy(hw);
 
 		mconf->mt76.cipher = mt7925_mcu_get_cipher(key->cipher);
-		mt7925_mcu_add_bss_info(phy, mconf->mt76.ctx, link_conf,
-					link_sta, true);
+		err = mt7925_mcu_add_bss_info(phy, mconf->mt76.ctx, link_conf,
+					      link_sta, true);
+		if (err)
+			goto out;
 	}
 
 	if (cmd == SET_KEY)
-- 
2.52.0


