Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2ECC46467
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Jan 2023 06:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5i2PAsadZxre+fZA40ApSOO4k6rDBMhHG9OHUSd1jK0=; b=vh6oKoDxSXHAYp/5Fq8p1qc6k0
	wdE5WjCXP4BN5d5AqoKVuQ+nA68Ki0A6hDm57h4y3SWgfjsmKgrotw1MViRCR5/HNvEdlZM1qFt1k
	3pqO+jBI1mzdSOC1gaMcVpnPE8DgnzdDUSD7K+OHyzdiQlP/HPXDQoubyzm9CZIny7YfK+N4ttUNf
	HeSokfygQf/zlK3Ixgz/315/u6RZvJMUOfjBFKuN5tlYWBJlGH6qcIGJbqb+Bjvj0usuHRwoG2SjN
	PG2wKabztsuel1E06L4g3OKTDPmprcAATPaLCkZgliU6o3tLjZuoAl3OJkadKmczx3xxJhj1pKnrG
	i052YZ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCxNQ-007BgP-Ue; Wed, 04 Jan 2023 06:35:52 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCxMp-007BHm-BO; Wed, 04 Jan 2023 06:35:16 +0000
Received: by mail-pg1-x533.google.com with SMTP id v3so21603025pgh.4;
        Tue, 03 Jan 2023 22:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5i2PAsadZxre+fZA40ApSOO4k6rDBMhHG9OHUSd1jK0=;
        b=gAU5b++TyEBAGOOaOjV+IHnXy9gGfUTiYm9Ah5+13Veoa4PyVgvxtlUrJbzk1V5sa8
         AcmbmoM63BK7EcMazLZ+5+ksoUUBV4oKeYdzfMi/cjQJlqjA+Ozr1k/UUT0bugDyccfv
         Ws5ridHBCE+02PZxSg8qgC+RdpMVR7YW8LaNn4UAUqkUlTRVO426XC2NlSmJ0QoDZWbG
         UbtWr4etQF+jokXd1g4um6O/bTDPKAK2WoE1WcQ7lxR2KB1+gyC3PkD5y7vkWifaubjb
         jtvlU7Uq0JfA4iU1+NqoukvI0jAXDKOszVV7xPRs4BDXNHp6N9caWLIzFyo86ylzz7dn
         P9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5i2PAsadZxre+fZA40ApSOO4k6rDBMhHG9OHUSd1jK0=;
        b=jcnFsVME4dKS29r6uEub70tamjXUZS9V1Aky58QEwnnE6bsfiANh3dJsj3rjkJrgDQ
         wq6J0lSDwK2UYj1llTWExVXvsuJGKw20ADrDzODlVvMhFRmb4GrVkhWqGaq2mKkwSdPJ
         0LkAmYYFh14rwKGgvRx7bcI0BGxG1E6/pmwkXHFsKdwry6RDWu1HyKsMBlkdqiZjvwsM
         D1zhM8wH02GXd9VnBntn0FoaaaiULzQbdin1t9oRAsokScDu1ZO8n7hnDdNHaQVAp8X6
         HIx5DhRqFVqREVyy8d9zkoGLBj8lkufHczVArYdDGQQE+/Ehn3sykxLZPI7RsUW+Cpdo
         cQJQ==
X-Gm-Message-State: AFqh2kqRQaqi3upT6wg8GxlUoSZECZChfAVCHSx4rlUFMhtXnh7X3pNM
	b90bCqkTS1qvuczgVnwqNd4=
X-Google-Smtp-Source: AMrXdXvi6Dj8Q8jPRtltXyZIDqYzpi3IkyqsCHG995ldQ2iwyBQ2irb4AHPBwcV/AwV9CgE0Jc2w3A==
X-Received: by 2002:a05:6a00:21ce:b0:581:26c2:aa0a with SMTP id t14-20020a056a0021ce00b0058126c2aa0amr43392435pfj.30.1672814112856;
        Tue, 03 Jan 2023 22:35:12 -0800 (PST)
Received: from guoguo-thinkbook.lan ([240e:379:964:5365:9621:efdc:4c9e:b465])
        by smtp.gmail.com with ESMTPSA id 67-20020a621446000000b0056d98e359a5sm20378439pfu.165.2023.01.03.22.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 22:35:11 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Chuanhong Guo <gch981213@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Deren Wu <deren.wu@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>,
	Ben Greear <greearb@candelatech.com>,
	netdev@vger.kernel.org (open list:NETWORKING DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] wifi: mt76: mt7921u: add support for Comfast CF-952AX
Date: Wed,  4 Jan 2023 14:33:38 +0800
Message-Id: <20230104063341.18863-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_223515_524718_069BB7EC 
X-CRM114-Status: GOOD (  10.24  )
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

Comfast CF-952AX is a MT7921 based USB WiFi dongle with custom
VID/PID. Add an entry for it.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/usb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
index 5321d20dcdcb..a0778ecdb995 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
@@ -15,6 +15,9 @@
 static const struct usb_device_id mt7921u_device_table[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x0e8d, 0x7961, 0xff, 0xff, 0xff),
 		.driver_info = (kernel_ulong_t)MT7921_FIRMWARE_WM },
+	/* Comfast CF-952AX */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x3574, 0x6211, 0xff, 0xff, 0xff),
+		.driver_info = (kernel_ulong_t)MT7921_FIRMWARE_WM },
 	{ },
 };
 
-- 
2.39.0


