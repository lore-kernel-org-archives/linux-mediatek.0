Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0CDCD98E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+xBbIRxBXS5OYYxHEW50Za3vbeVn2bnT2ZgYpZa7ur4=; b=W8wdosIddUfDBRBje0lFcxlaxM
	nPj62MoB1uj4682ZtMICpDlhWalRNOicFoj23Z30B2lL7g6yAjwv/LvYBvVYCjsfnw6VPIlanlWQV
	Tc6EJXCsLqFELwP0CseUXAGAr60H/MI2sNZCrAaD8KgiqFrr9kf4CMrIkPeVT9zk9mKQzzZNgrLTN
	It3sFRCqJmMR5uuIal0MBIp3aLnnO4s7GoLdBKc6MwWeE0UInZru6/FQPulH77JvR9nop3Q40weW3
	bTSeyx35H23VqTtFDuwQluMiqFaPEl00hG8XMRV99Wxkd6U3nETAotc0pRhkvovrNCdh9xsjSXZoT
	DRd7bKlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZna4-0000000H3c5-1b0k;
	Wed, 17 Jun 2026 10:33:12 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZna1-0000000H3bI-4BT9
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:33:11 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-30be4a661aeso100444eec.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692389; x=1782297189; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xBbIRxBXS5OYYxHEW50Za3vbeVn2bnT2ZgYpZa7ur4=;
        b=hLR9e7X9oiTfQcYeiL3eHZ9gdXTtITfNO8lNN/i9FZ3Z5xg3l8ianTQPPOf+17AWcg
         U71SV3orCJYY6PmnL8TUJbASoNAh4y2L3S3KcyvCjMzcriuXYwSUQtsCGTpI9naZlhAV
         DXq6xSNoJVzCQxvufnDS1EpKhpiH9aL5lK+Ggvhbec7fbMJj/SGjFpg73TQLmB8PjD17
         +4tAHVWcM/7LGal/6o+GEooG6ET/0FcNGpcoPCR3Ia1y8amUZKxzeX6iRqeXpE0FD6nB
         8bzhnvZTSwps1Iu+iURV7wdI4qmHFQ9I2CGiPK96+jVMDDVxQIi0rUXF4zVOih/RyCeQ
         iXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692389; x=1782297189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+xBbIRxBXS5OYYxHEW50Za3vbeVn2bnT2ZgYpZa7ur4=;
        b=jWshMVTHZNN1vGG7j5vnS3MR44Kiuz/t7OQSHQ7dnN5yxoq9ZqHfCceDD3Eg1uhmvi
         LJUDGt4LPhWdQ61of2OPpC/rSINCqybSLkBRv/Ep/QdTndvBNMazi2YFWpvRjlIv1QCV
         f6CcYJbJq3rq8GWax9bBT3ZMLO5KNNXV+RA7tTzVIN5JkEjeVuCOCvdHwvM6fmOgGr0K
         8OC9nfQZ3vAcbvgz7Op3po+WEEVLht8ylQXsmTIRzNck1n2WjxH9ufH4RlxI2qPr8rWt
         5pmlbKCENbLThY8mq+x7a5ikArlYC4ix8a5uR6bArQRQ3wYDjd9rsgQFYVFjoIL82OUn
         goTQ==
X-Forwarded-Encrypted: i=1; AFNElJ87Txo7xPyF4+a+/ZAseLDEUltqYlb2hwgR4BGGmbRAcNSMcp4WeU5qbrOjUkYbNr2db5MVn0qIhn/f4YmrQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzsJdtrTNk5I92SJfUQES5MhtpfOp8aeJXLpedC/MUK5TAEVsft
	Oe488GMBh9jNphA9nnHm09zX5T+n90qdHKA97eXMyNqxEMQf0ZumzIPA
X-Gm-Gg: AfdE7cmFxKuKlMkP2mhwBheSYOjSH2sh5USTYsmRNFm5LR8ihjZtIZI8TBK6H3robMM
	TTtdy3Unr7NS1WICx7N50pp5OA1Ghoqo1YDWadheDlRDpdjX1JJiOkEx8ZkDsqJtXlFoqmRQxso
	GspEevHGK0vIVTfCY6Ml3FTT1rAURiygx8ckgmlxfkJ/ZnfrjVXNCZ9PFSx9lrrR92DkQN21zly
	woT+e0YB2sCM0S9hy0ss87N5o4133DG85zr6M3szuDqyGEkKDIKsZm/Ro8G/GdW1QaTQLW1Lolp
	/7dMTHf5An+RuWaJ9opldC0ROJ+lUBLyaQjeCYJCNksdMLYJWJyGXvrHe/97+J3vAKuJ8tK0hQD
	crIMepqa7vrpmVK7igJ7TQo8dZYl3IGEQgkmx6Fjx7IIpx6dNQulxuHKeP6bDX77R3OvX9R9Kl6
	bpQrXEWap3KrnEwKxwkBqqZkIq5DLKRN15PX//yPQjoJoubaU=
X-Received: by 2002:a05:693c:2d94:b0:2ed:2942:34ab with SMTP id 5a478bee46e88-30bc990c00amr1603108eec.3.1781692389024;
        Wed, 17 Jun 2026 03:33:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:33:08 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 01/78] ASoC: codecs: ab8500: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:18 +0700
Message-ID: <20260617103235.449609-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033310_041109_3B012F56 
X-CRM114-Status: UNSURE (   9.67  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/ab8500-codec.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 6e8ef9cd1b31..20beb830fd62 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -989,9 +989,8 @@ static int sid_status_control_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(component->dev);
 
-	mutex_lock(&drvdata->ctrl_lock);
+	guard(mutex)(&drvdata->ctrl_lock);
 	ucontrol->value.enumerated.item[0] = drvdata->sid_status;
-	mutex_unlock(&drvdata->ctrl_lock);
 
 	return 0;
 }
@@ -1014,7 +1013,7 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 		return -EIO;
 	}
 
-	mutex_lock(&drvdata->ctrl_lock);
+	guard(mutex)(&drvdata->ctrl_lock);
 
 	sidconf = snd_soc_component_read(component, AB8500_SIDFIRCONF);
 	if (((sidconf & BIT(AB8500_SIDFIRCONF_FIRSIDBUSY)) != 0)) {
@@ -1025,7 +1024,8 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 		} else {
 			status = -EBUSY;
 		}
-		goto out;
+		dev_dbg(component->dev, "%s: Exit\n", __func__);
+		return status;
 	}
 
 	snd_soc_component_write(component, AB8500_SIDFIRADR, 0);
@@ -1043,9 +1043,6 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 
 	drvdata->sid_status = SID_FIR_CONFIGURED;
 
-out:
-	mutex_unlock(&drvdata->ctrl_lock);
-
 	dev_dbg(component->dev, "%s: Exit\n", __func__);
 
 	return status;
-- 
2.43.0


