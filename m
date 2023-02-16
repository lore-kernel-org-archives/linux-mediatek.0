Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECDFC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 12:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LjOcvsZDIQCf+hq+MC47oV0H+OQ7PYaJvMVzLlaMG/g=; b=O3jVo3DrlL7xwUfiVsNClpryL/
	J8FMcRqBZtE/+KE59HHZRqYpoZeuyWIFJjmB4FB5ggWbZVK88u4GkM1Z9WG6bGtqUY1ZC1AbRvHJ5
	ZakWHhEspZwp79DKxD8udZ11ZVt6nZHQjmFxwuEHoRK6fMRnDhZcyKPLesS8CSquRSKtZ/8UtD38U
	NPUgw+OzlVvhrTqTHH+HLK4lZ+/dQ5NQncJ0wkme/OauoZ1lj+N++dnWKBnlR1e5uzXNGeb2JlQwy
	odyhdU89fSNsyTTStGlAgpg/xte8RTc2hiqUog5CAMUqpdA24MijoZABCkT5FqKLPI83HtowdUxSb
	DB2tz8nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSdAS-00A7hF-Ja; Thu, 16 Feb 2023 12:15:16 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSdAP-00A7gI-UH
	for linux-mediatek@lists.infradead.org; Thu, 16 Feb 2023 12:15:15 +0000
Received: by mail-ed1-x530.google.com with SMTP id a10so2441478edu.9
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 04:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LjOcvsZDIQCf+hq+MC47oV0H+OQ7PYaJvMVzLlaMG/g=;
        b=bLVOYgJbpodTUmrN6JEz8wHouhRjeij0pQm1HtJliwebNIB+uBscgGPxjOsodww3UL
         /IyVhn7TGvfsqrjfn+BuqfrFWYPaDyQWBBCGgVoTDTOE0KPkdl2k+h7ph5whuu9trUw5
         8aUebWPfpb2p1AupPxeLAoYTCHSOgJUFYPpNAhRLdTBXD89zxVIZFWEnp91Hz0dlUlv6
         UDtKrwj24I4pEBaIjVtEPeSrl/QaFOCfJ9aPYyVodOE2IlrR7gMGpPAtbxxnl+K8X1oH
         HTrJqivihA2UivxNoqXcaHdDCT1/hdPFWJTn4zW6tT71hMRvNjcgR/nw9lqmOhd1MGFS
         GPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LjOcvsZDIQCf+hq+MC47oV0H+OQ7PYaJvMVzLlaMG/g=;
        b=4sE53JaiwHUMa6ekPndUduQpwOd/lYHp4Elo7zfhyD+TpMi7FUS2mFJihTErBxdlX1
         yxPxBhozIbQRRdnj/GCCB6lGY7YqEuTWFYwY1YASOfnukRGYDtfLynzMn/KDqCKkjqDJ
         ZiMAT3Jd3skcVezwkC7PRuXCQ/NJ7L+//UOO4oQ5Ir9yAVzcG5gnIPNSUQ0mbvaC4fh4
         CKpBcaQnTLq6mTmxHQ+fQT9wYvwwmHJLXcfBbdBGRSvOyjktB4YAtzAM/cziq7iWBQE/
         CspH40/1OgS3JO5MMI/lUagmtPboM9iPgvGTduDrDviA4L8/CDASMquBLHvdbtQEmm83
         UmNw==
X-Gm-Message-State: AO0yUKU21+Vs4Q/VMXeGV+uqKfvsEEUeIM378ws5mPD7zgu6ns7a6Vvv
	6Pl8km7sAlzA+x6E51x/yYI2tUPh2pldfw==
X-Google-Smtp-Source: AK7set++FMpxqDaSzuqmtTnlKrhVhMkeqZRMCr8YnZqw1C2uL/5q3tGz3OgBKKCOYhdz7nmD9qaGDg==
X-Received: by 2002:aa7:cf04:0:b0:4ac:b8eb:e398 with SMTP id a4-20020aa7cf04000000b004acb8ebe398mr5141813edy.6.1676549711175;
        Thu, 16 Feb 2023 04:15:11 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k2-20020a50ce42000000b004acbecf091esm780169edj.17.2023.02.16.04.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:15:10 -0800 (PST)
Date: Thu, 16 Feb 2023 15:15:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: Howard Hsu <howard-yh.hsu@mediatek.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	MeiChia Chiu <MeiChia.Chiu@mediatek.com>,
	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>,
	Bo Jiao <bo.jiao@mediatek.com>,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] wifi: mt76: mt7915: unlock on error in
 mt7915_thermal_temp_store()
Message-ID: <Y+4eSSqaHCpfK1EG@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_041513_998142_EA4DC95F 
X-CRM114-Status: UNSURE (   8.51  )
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

Drop the lock before returning -EINVAL.

Fixes: ecaccdae7a7e ("wifi: mt76: mt7915: rework mt7915_thermal_temp_store()")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 1ab768feccaa..728150b35537 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -89,6 +89,7 @@ static ssize_t mt7915_thermal_temp_store(struct device *dev,
 	     val < phy->throttle_temp[MT7915_CRIT_TEMP_IDX])) {
 		dev_err(phy->dev->mt76.dev,
 			"temp1_max shall be greater than temp1_crit.");
+		mutex_unlock(&phy->dev->mt76.mutex);
 		return -EINVAL;
 	}
 
-- 
2.39.1


