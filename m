Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E09FC9832A
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2026 06:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PkrZSWPLPilS0VQS6JpOnVfLzUocbaP/bkS/pwSTo4o=; b=UkbngBVBq9PF7R5yxrBhcKOUD2
	LTt773yccMV7mD3tX8JpCZZG+XESwg5bNIfHiEk8/+0yneGEZNw+4DVKrdQmuzrZvKggWUpUntaTF
	ri8aN1oYYWIWK4ffP+c8Boq+MFtIf0UVsWt9yQW+R34tSQbcwS50DIFz3WC3o1G8lH9cYnOZt42VG
	HXYZfPL9D2rcUFNZzHAF9yqa1TB09tl/cIOJrngm75lkPkcrWzGmJdN0rpg0zjufoLJpmKUrenB1n
	cYs6Mcn6Ruk+EqcIEcs0JpW5tVzXvu2gH4FMTwS93tC/5WT7OggY8zJE9T8PEZ4GH3s6KVpCPK3pR
	LG2o7Z6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR4e-00000002Pok-2Q8w;
	Tue, 29 Sep 2026 06:12:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR4c-00000002Pnq-46Lv
	for linux-mediatek@bombadil.infradead.org;
	Tue, 29 Sep 2026 06:12:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PkrZSWPLPilS0VQS6JpOnVfLzUocbaP/bkS/pwSTo4o=; b=WBkOVkaPDJ1iPxBm6UgIFpvuVq
	ydIDw8k6vPeOWkSgqIaQsVMTWSt8Rhg9m5/dlHYmDj/CWnl2wIsv8jIoxblnR0IcaX686lsDPxYZI
	0QAlu73saZ5pyrVMKzgid/7R7cCLSegM0l7WJdNCt3MaLtQrSicF1rfzjGvUwtfkjnEyCfVZbeGKZ
	4DPzCuuNxaDd4YpYxZdZmQwDDi5bMz3B53EhX7ip4ieixFXH4PKgMnhXYVDp1HWXD+kEQbyvNa7Bc
	DOafuwfC9FiyScoCJnpn+qfIGIMClSgzHN1oqKF9QX+6QoWk6bymXYaPXHQtQ7DAU6goDj3b+aDa5
	Ar9G1XHA==;
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBR4X-00000002EWU-0h5w
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Sep 2026 06:12:15 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-398beb616f5so1831530a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 23:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662331; x=1791267131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PkrZSWPLPilS0VQS6JpOnVfLzUocbaP/bkS/pwSTo4o=;
        b=rM503SCsWjqL3EC9t0z0lzVdqEXvXco5HtpAmoFaWzwBn7y6VyDptiWemmCrYgQd1b
         DP7ck/ay8rsHOehH9JLgIWBxu8f3WUyfP5n3Ed08Fp931//25VB5wfQz4pGYGFlpgUxH
         i8ARdcJkijm6KamoIiHuiGXq4UKF87mpVN05NInbFeAOmJyUwXVJWONVMerdXe6ydrQW
         C+4hV+LanKQBc01hYmB1lvOg17VYbW6ecFco0tmy6kVOtl8Hog4rZJFCg7EYFmql7Pou
         6cH6CKBdE1nN+rNEgr8cZdjOnjbqsFm5ENOTmrDbvSvpUbFd4dsFd3RbcGwdvIAvZFgW
         D5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662331; x=1791267131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PkrZSWPLPilS0VQS6JpOnVfLzUocbaP/bkS/pwSTo4o=;
        b=2zu7qgiL9cxzj1vngwy/PuWx57Z4kDLOrm+AKHwmkMhuCcpSXRXrajFPcTr8wfaOT/
         KYB44uqC9YOg0OIWbVGqi1mW9xmAtcBwupg4JV9ZDftjOhUA2oy7uQ0qehc/nZvNQ2e4
         j8sXvoPH3v+A3ZK+I3Y6rq+5d68v3eE3MXenpx/SKK6Jrsem0Ez+Kb1Dx8tauKEeN1q9
         1arSaqVDtg4wkpSrmNv0YGZ169WKgF38ZygTOwu+v4PPaGFZ1cmyoLqYWk3D8LcGmuPG
         93Sda0h5BbCVleLGYb9DcypX97CRKgUz9OT1ixkJd78E5n8ysfp30PGasLFaCzUDwRUS
         49hw==
X-Forwarded-Encrypted: i=1; AKwUvBzru5/tSxYKpnM/oQijKsBItN/64VKYyzkpVcdGhSlr16afwD4SntsGV62V9FnNSZsQMuwer2UL+Y9aVGKEKg==@lists.infradead.org
X-Gm-Message-State: AFq9FYKCX9229KnvbVPmaa9RxBZEVMAe63Eaw6TnRVG7nyJpZexpeHvk
	1w7VWY8XmBPcx6a6418e3o0gHu7c3AyatqRe/c7RsgtECHiaaybKEPoThEis9g==
X-Gm-Gg: AYBFou2hxQkDjvPQk7qilqeoRYjQNISO4nYMxxsWFFb8e4KGbMd2Tf+93C6TzNfoFHf
	ShgkyQvk8bhX/gYQlD9U0KxYf+jd2NBAd5DAIz3PllG2id1h6Am7Vjrxmx+7WHHbd7Ikl0ZTiiW
	QLT6EPRMbNbEzDmDm/iZbhUbY8B93KJTlrgFo24qtd89/f8USNaHlFp/rLISYaxx+JkaXjj9ScJ
	Fxgs4KofYAPreIf1qCLUNr4tWib6KOqAIKPSfy4oR+CMvvvc/vGe2mPZaCP8jUE/t0C9V3XYkTK
	vnwn75UEUNco44oFAQJzVF1ZQ0WfpMoTlhwJF6fowNwYFC2zoLNWddZA+UMrgns9WdaDGVLNVla
	8DpzHaP6+C3CbhEFRXay+oXmFmPLbuIWqMtma+O1Dg8raCsZNgTDMmT07WGS0LodrWklFB5zvaA
	EDvGoKXBJ4jCl7RXjJNKWzAoDwMMKg5yTmMjZ6wZCePyD953tdKcbBpGTXMyHgDhDpxaW3NksN+
	P7WgSKiebKugJm6SzTtvNfDmlZehpXzM+z4nhyknKhr+MxcYELXDZYixyDalQY1SZmdnyEF8Qxf
	1+qTJNXis2c1Cg==
X-Received: by 2002:a17:90a:e7cb:b0:3a0:f4ee:d2b2 with SMTP id 98e67ed59e1d1-3a49c1a1183mr871310a91.32.1790662330868;
        Mon, 28 Sep 2026 23:12:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:10 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 03/10] ASoC: mediatek: mt8196: fix MCK error handling
Date: Tue, 29 Sep 2026 13:11:14 +0700
Message-ID: <20260929061121.124001-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_071214_441067_0D267640 
X-CRM114-Status: GOOD (  12.87  )
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

Disable the clock if setting its rate fails after the clock has been
enabled, preventing it from being left enabled on the error path.

Fixes: 7384ecab34eb ("ASoC: mediatek: mt8196: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
index 1dc4210e58c7..1d107b85d03c 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -502,8 +502,10 @@ int mt8196_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		return ret;
 
 	ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[div_clk_id], rate);
-	if (ret)
+	if (ret) {
+		mt8196_afe_disable_clk(afe, afe_priv->clk[div_clk_id]);
 		return ret;
+	}
 
 	return 0;
 }
-- 
2.43.0


