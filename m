Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A4AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 02:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XLI+XqLaVZJc80HPRtb3Co48RWwLHPyeujreMS6Mxi0=; b=HZ9UXr64qOAPZB
	uCI+/MZxNsL5VtW1BEPX/tQSM1WPiP77shr6LVxB67NQsXPzJgos5mxzprVWsqa8GDwjWZIbxgF5N
	40HXicnPSz1iLQC7Q4q1y2Vof0lDyVnCqVeZ+X2jh515MxyGmfsJ0p1hW3kX6GtM7qZ6efBFiYmuc
	x1clgzkLFzajgQFVbmwh6gmOnk9v+nAYZ4t8IbCRvm6S4b+q6XgEQXKUXpVZJ9T9LBzFCeoMCvpw8
	LmfwgqXJ4xOecNOv9v+gqG4kpQW2cCz+Rqk2Qt8YAGuyoCpuuN2bRfo7mnqUy53QXMQLCUTrad07d
	pM5EmC9k+8WzAaCd0bZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJnfY-00HaJm-GB; Tue, 15 Feb 2022 02:34:20 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJnfM-00HaGf-Ja; Tue, 15 Feb 2022 02:34:09 +0000
Received: by mail-qv1-xf29.google.com with SMTP id n6so16405964qvk.13;
 Mon, 14 Feb 2022 18:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=06Kfv1DXtnVDrheRxya2snTjYCwD2TQR57hbpR3zm0s=;
 b=OJUTaC8m4FlgAFC/uh7uJBfFqqP/RkqnhJTE59PCuIH76NWYuimLf/S2LQejeyi662
 bFda6a/SPjSJoKXe3yWCje0n+Q7l+ikqo8j32lVc2XsHc+bQOjG/sm1PqP9+sY1HOAjd
 0P3Z00beuW1C64qL8bVTHg7+XTkp2++lLg9XgBKZcs8PU/jOoFFZgEY9PfSk5k2QjTsd
 fZVQx0j0E/RbeOCEDPeRkOxyBIbyxVKnYOBJIVleOCox0eXHYItVAUeq/JL4Ahc2mUcb
 cmYPtxBdWHYwsGxkhaPXC0+vjH0cSXY0cMfLHzEWiLX09nsWGZH4VI0hPTDwT3BKJNvv
 B0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=06Kfv1DXtnVDrheRxya2snTjYCwD2TQR57hbpR3zm0s=;
 b=mzFxEkuabOJfMd6W1JWcISOSQPB/RSMLLN3Os9lVMJnbj8zAGBeiAx+7zi8zqI/Lrd
 4G75/qfkT7WH0aiIgNW3FKa7xHy8YECAIaxEw1NZ9vg0ZlbeC+DNn0mqG8yoHjkRY80x
 SPB1NVkRLviakyGWQ/r8L5Y0PIgUmwY8zjiP5gimgvk5Zq8fbUWkYKSZemiKddVPFZCB
 FiAcpopzg8y94fibYFgEaQwhwE6L5j/5jTuYY3mRGLgVxTcnGaz9znbUtjRBm/YXFud7
 33StLZ+GrqEryAZJcAtXM812x0jobkIZNM6tMnDEGJeAh0g5YKUPT1nHyujHGZymRhrR
 H9WA==
X-Gm-Message-State: AOAM530tjvUCjGZ89PChQUkho888OmJazDgz0sN0HB/CeaxPSuYkuAGS
 S/MRORtc8VGbWHdP0hcKg2w=
X-Google-Smtp-Source: ABdhPJysV3vOFxo9MY9xSnNFS0irUrGngNCaqUIS5vyTJGLJ3J7HfDrRw4++7et3pzr7mwdIB3xOgg==
X-Received: by 2002:a05:6214:1c07:: with SMTP id
 u7mr1073836qvc.129.1644892446726; 
 Mon, 14 Feb 2022 18:34:06 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id s1sm18976509qta.0.2022.02.14.18.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 18:34:06 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: nbd@nbd.name
Cc: lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
 shayne.chen@mediatek.com, sean.wang@mediatek.com, kvalo@kernel.org,
 davem@davemloft.net, kuba@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, matthias.bgg@gmail.com, arnd@arndb.de,
 Bo.Jiao@mediatek.com, deng.changcheng@zte.com.cn,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] mt76: mt7915: use min_t() to make code cleaner
Date: Tue, 15 Feb 2022 02:33:55 +0000
Message-Id: <20220215023355.1750720-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_183408_666987_DD7D4E22 
X-CRM114-Status: GOOD (  10.22  )
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

From: Changcheng Deng <deng.changcheng@zte.com.cn>

Use min_t() in order to make code cleaner.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/net/wireless/mediatek/mt76/mt7915/testmode.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
index 83da21d15ddd..61f255166a7f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
@@ -228,12 +228,8 @@ mt7915_tm_set_ipg_params(struct mt7915_phy *phy, u32 ipg, u8 mode)
 
 		ipg -= aifsn * slot_time;
 
-		if (ipg > TM_DEFAULT_SIFS) {
-			if (ipg < TM_MAX_SIFS)
-				sifs = ipg;
-			else
-				sifs = TM_MAX_SIFS;
-		}
+		if (ipg > TM_DEFAULT_SIFS)
+			sifs = min_t(u32, ipg, TM_MAX_SIFS);
 	}
 done:
 	txv_time = mt76_get_field(dev, MT_TMAC_ATCR(ext_phy),
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
