Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9297DC44512
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Jul 2026 08:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rxtd5Q/pDjtbfL0tvsekDL5RGMidpEpCQZcAeYntQgM=; b=iTqW0l78RHWwVqUobysZNuUhY+
	8kSrHkpnHt9aglyqygPNZDo4ugRjFQxmld7vNEUjAgukhc+4xTeFB3zjjuti5aV5OyK8q7y7aAJpH
	hLJxZA8lUX0DppEpW5V1QhBVAu6zvws+OBhznoGuCiD3YZnUCFLFFtkAMhU9N8GgPPIGxBUsyEIJe
	QAmhgePVF330bD6J6YqcfttOfYcI2Y4wL/65iTd02fZpJbXRJD+FLiGkkT33YySglghN2T859SKtU
	za2WrczjzaxSiQKpYallA5xn1f8kUs383pKNQfJ92EnLNz/WJA7GzJH5EWG/d5DodrYvyDilMaV6v
	inKe+txw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlMqL-00000004qgD-0vFY;
	Sun, 19 Jul 2026 08:25:49 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlMqI-00000004qf1-3Xhc
	for linux-mediatek@lists.infradead.org;
	Sun, 19 Jul 2026 08:25:48 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38deea72eebso7038882a91.1
        for <linux-mediatek@lists.infradead.org>; Sun, 19 Jul 2026 01:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784449545; x=1785054345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rxtd5Q/pDjtbfL0tvsekDL5RGMidpEpCQZcAeYntQgM=;
        b=daQW/PwyFlPZPtMQYVnzzqE/lS0OEzDzJGFGjjM1xFDteRJkyphdjl0y+LPwkxf921
         7e5O3r8r2vak0gSAnURZ1CO44b2HSRbHG/PR1MGpXuDCr2ej8CZPf2AybjW3Fa0i6Xvt
         BRvRdAgvnw6sDeF0sqioDnREOkL/mD2PRzv9v+MLy3FWnHuoqDY7ubL2s/EV4pYGoHID
         EW6X4VcG/C3y+rfblqRDsUb2g/fpdt4/ve0MxlfPB8haNF9UnKqWlFzArv2vl/CGVyBp
         a/ojFul1sXQsWOYELC3/A7dnz2OhuSqNqjSfJNxrF0TOhK48yPAyzE00r/hF0kfM69Fs
         3qZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784449545; x=1785054345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rxtd5Q/pDjtbfL0tvsekDL5RGMidpEpCQZcAeYntQgM=;
        b=lOK08S/mOQWpSIAPqzvfuTixWT+iwV4cQOzqvhGFcURYOUejuFYgHZ1FPdQWbO4fS5
         hHbrzppMF8Lwz8QztMMVxEpF8+DEc2AJbwV49aYsoaAvCnZgC2ISRcDr1czQm5E9ieKA
         n+PXp6VVhwE6s8XnbDydf421r/JV7liagr7XK0O/CzIh3H6zehN5RxVfJ/hnCaincMJN
         /uPrBo2C/igSCmuzIZlYz5olI5uPzLy7FMM8Zo3Yi9oCwC/3z9wiQ1X8sQyptwRz17T8
         WLevrgpfUl5tX67bynAK3dOqm2vUqpigAXjF5HbZBXqzMCanqlUEImHi98wgLgbbZP9H
         uoAA==
X-Forwarded-Encrypted: i=1; AHgh+RqbqIAnKt6aXXvUoLZNjWmluCkINkcayPqUg6Kzrp2FVPctrh0wO8YxE45O0LQApglLz9xvXJ8LNb2ZawnkSw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2mG19Fp08UwzcctXvZS1ugJofzDE6pfCv1JQdeqMoBxDdDRI2
	1cvrZtHc0Te5SoY/PRDHErCFUmDR0aOI/FH2aJLhfZFlJMJDEv2oGlhg
X-Gm-Gg: AfdE7cmwKZyYTnWbHi6iOh0SeATl/DV+TxsmF5z3Tvcj/DFJgs1Rk2jvwQYSbLHK76N
	YJUAyRH1TJxHaPyKPWsh94aGwQutRO/oNeXRCgNmfFv2w+QKhwL866/1Hl1GdomWq7lCkIjcCm9
	qAC2td8BSD3vk3ic7Idq+3XlVEY/Rm3NTuR5l6lYZLSNiJNKp/CfUaiqSJzsW/slt8BUjlqgKFa
	0UDzRXU7PanGr9PSFKDk4CchgLd0NlEyYJe6r1Mgo+V8snicZyB4+RhoOV/WhJ2dAKmPqDzo0Ko
	vLvOJZ+z5qsfbmJ1TSHTh02r4QL372GPNOFpJXUzaMPld6IznJwWxEGfvRGg15DLnLBp0rkkCjn
	fY7BdKdh7229dYPhvz2k+O3gd/+/rH24S9s1B9Z1xpoCMM3shO6wb5B2DUPzUviWOrbrOlbDRTU
	oS09CRKMS3CA==
X-Received: by 2002:a17:90b:1d10:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-38e659bf4d8mr2833691a91.0.1784449545591;
        Sun, 19 Jul 2026 01:25:45 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29e340esm19585964c88.5.2026.07.19.01.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 01:25:45 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Ahmed Naseef <naseefkm@gmail.com>
Subject: [PATCH mt76] wifi: mt76: mt7603: add 0x7592 EEPROM chip ID
Date: Sun, 19 Jul 2026 12:25:30 +0400
Message-Id: <20260719082530.3879831-1-naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_012546_890992_8E85A675 
X-CRM114-Status: UNSURE (   8.41  )
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

Some EcoNet based routers ship an on-flash EEPROM whose chip-id is
0x7592 instead of the expected 0x7603. The device probes as PCI
14c3:7603 and the hardware MT_HW_CHIPID register reports 0x7603,
independent of the EEPROM value.

This is seen across multiple EcoNet EN751221 and EN7528 based devices
(for example the Genexis Platinum 4410).

Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7603/eeprom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7603/eeprom.c
index b89db2db6573..05f7aaefaf89 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/eeprom.c
@@ -142,6 +142,7 @@ static int mt7603_check_eeprom(struct mt76_dev *dev)
 	case 0x7628:
 	case 0x7603:
 	case 0x7600:
+	case 0x7592:
 		return 0;
 	default:
 		return -EINVAL;

base-commit: 50a7f9f9d48eb50c0e95bef53358acb5af5cb3c6
-- 
2.34.1


