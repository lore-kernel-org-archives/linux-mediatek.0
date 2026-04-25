Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C205DFF885C
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 19:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=byzvVsEsSYOVH5gPh5T7X/DmHAalyQEftbu3O8NQ380=; b=qUgT+mEFz7ycDLYxaQp01ml+QL
	Tt4LXndM+5/bkZ2zilQS2TJg9tSbvsVNu3HDcDfWPo1DXoJIQ5accft+2r51YHks4C2vYGmz348h4
	OQMnEvZCKnFC4DCxEKP0YrwxDuR0cOj2y2rdCCzCfMEWO32qZOmRFvuv15s9IcHliNszUnmZjtyjn
	JItCu5KxlAJKSviZ2PRF9fwbufQ+QS36PfWgA/8ktPuCXsp/sxZWutIJC6plHL9F+LRjZkFv+UGMi
	zpgRwGaiVeimnQDdGtKplWhmItULw27s390NiOLZLLLhnWH3E9+Fs5TwJ+r6DN+i9KjN+spRrnRY3
	nieEYY6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj1P-0000000EmB6-13K6;
	Sat, 25 Apr 2026 19:50:35 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj1M-0000000EmAf-2en7
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 19:50:33 +0000
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d1872504cbso7659886a34.0
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Apr 2026 12:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146631; x=1777751431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=byzvVsEsSYOVH5gPh5T7X/DmHAalyQEftbu3O8NQ380=;
        b=J/+jDsd1ZCte14+cyTeNaXXZfVEdmPeWPcbyh0kmfwVkNLXXxcn78FErC7W/FY62Yx
         FihkKF0dZ2e1ba0O7o+PlJ+XdwbqMwYFEo4xiXszCip5FBkdcfeFdRR5L4ixPT1KcTgj
         EeN1zbP/IKaR2dWjwF/sfUSkU6lbWoXlmLBgr3dRTTIbt3g81Wb5ME/9sJiR/9xv5G3u
         HgLaiiQUhYigAedshwltCwU+2KMuoX/L+8Zq1VZLcdkJp9Xk6qnmrNCwA0yiSM07AuWj
         qIYP1HiCy41b2YvNUi0f1A3E4EXnalsSxq/ID8y+o++pLH0u2OhJhcFlL2JCJxaXlY+O
         5KJg==
X-Forwarded-Encrypted: i=1; AFNElJ8QpgQYcPT/31LjM8Hw5bpZqjpAMw7S9JRWv2EbkTV9T9V5VyJQQoluWqri3mt4sIHVUd5ROdb+z8OPJAS1pQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YykLhbGb5r4jrvPqS5ubeDjpgvjsOW9b33BXhb57ip9rXd8tlay
	7GhqIwKmH0Jsu74h+OoMsP5ZhQ/FNgAQRLd4OY8L6FbV/sPO0UkXBPki
X-Gm-Gg: AeBDievucF5KHB2mvIsc0B9PLD5JK72Zxgk+/5onS1vNMDMzMhi8nA0DQclakQSXm9f
	R7DAfEuvMOVf8CDUFHh0l2ggoYq9KDZw7hyPwe8B5as226l6W+PVpKMAg4Z1JhlTmaGMo7uoi/+
	xCMjwPpVDPupMzDB5A7nQvuo7bUFrx0crJ1vGZ479l15PCAY9yEyrFXCDTK5aVysp10LmUAHVdO
	3i2OnDiOXzdun137jG94XXuH/85gu7M9TM9MaezWhCCvhv5xaAeiF7ZkgtXX50XDscsJud/6kUW
	jz5n+UoabGBtfdldRQkKHDQJc13Qv2CY4bGILh6MLKby9OV1ZtPnUmOdel8O5icHVMlycWQr0zu
	jgqSdEMLprZ96E4JxmFShJrrOUXM4GL81Vjcjc7hyif6CGX9R97SrW250xrzzuL/HZkZTsI9cAX
	BSl+O0EZAJhBl4CO0wLzFevKuuTVlusKXFRnNf7GNU2Sj9Uw1GUQjbjk/1CVkbey6ROBAlyC1mo
	g==
X-Received: by 2002:a05:6830:2784:b0:7db:f286:18ee with SMTP id 46e09a7af769-7dc954ac645mr18252905a34.4.1777146631611;
        Sat, 25 Apr 2026 12:50:31 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:2e29:c3c3:de27:ce76])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcd164d2c3sm13987624a34.24.2026.04.25.12.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:50:31 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Javier Tia <floss@jetm.me>,
	=?UTF-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>,
	Marcin FM <marcin@lgic.pl>,
	Cristian-Florin Radoi <radoi.chris@gmail.com>,
	George Salukvadze <giosal90@gmail.com>,
	Evgeny Kapusta <3193631@gmail.com>,
	Samu Toljamo <samu.toljamo@gmail.com>,
	Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>,
	Chapuis Dario <chapuisdario4@gmail.com>,
	=?UTF-8?q?Thibaut=20Fran=C3=A7ois?= <tibo@humeurlibre.fr>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v5 02/21] wifi: mt76: mt7925: add 320MHz bandwidth to bss_rlm_tlv
Date: Sat, 25 Apr 2026 14:49:52 -0500
Message-ID: <20260425195011.790265-3-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425195011.790265-1-sean.wang@kernel.org>
References: <20260425195011.790265-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_125032_676100_733BC106 
X-CRM114-Status: UNSURE (   9.07  )
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

From: Javier Tia <floss@jetm.me>

bss_rlm_tlv() in mt7925_mcu_bss_rlm_tlv() has no case for
NL80211_CHAN_WIDTH_320. When associated to a 320MHz BSS, the switch
falls through to default and sends bw=0 (CMD_CBW_20MHZ) to firmware
via BSS_RLM TLV. Firmware then configures the RX radio for 20MHz
and cannot decode the AP's 320MHz frames, resulting in complete data
path failure at 320MHz.

Add the missing NL80211_CHAN_WIDTH_320 case with CMD_CBW_320MHZ and
center_chan2.

Tested on ASUS RT-BE92U: 320MHz throughput goes from 0 Mbps to
841 Mbps (iperf3 -t30 -P8), PHY 4803 Mbps EHT-MCS11.

Reported-by: 张旭涵 <Loong.0x00@gmail.com>
Closes: https://github.com/openwrt/mt76/issues/927
Tested-by: 张旭涵 <Loong.0x00@gmail.com>
Tested-by: Marcin FM <marcin@lgic.pl>
Tested-by: Cristian-Florin Radoi <radoi.chris@gmail.com>
Tested-by: George Salukvadze <giosal90@gmail.com>
Tested-by: Evgeny Kapusta <3193631@gmail.com>
Tested-by: Samu Toljamo <samu.toljamo@gmail.com>
Tested-by: Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>
Tested-by: Chapuis Dario <chapuisdario4@gmail.com>
Tested-by: Thibaut François <tibo@humeurlibre.fr>
Reviewed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Javier Tia <floss@jetm.me>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 37cdf3e8a067..016c534f748c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2334,6 +2334,10 @@ void mt7925_mcu_bss_rlm_tlv(struct sk_buff *skb, struct mt76_phy *phy,
 	case NL80211_CHAN_WIDTH_160:
 		req->bw = CMD_CBW_160MHZ;
 		break;
+	case NL80211_CHAN_WIDTH_320:
+		req->bw = CMD_CBW_320MHZ;
+		req->center_chan2 = ieee80211_frequency_to_channel(freq2);
+		break;
 	case NL80211_CHAN_WIDTH_5:
 		req->bw = CMD_CBW_5MHZ;
 		break;
-- 
2.43.0


