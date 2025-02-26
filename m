Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D2EC021BE
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2025 02:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4VmNKfDBeT2r+sunfTq9ySMJ9kY9GvZ3/jQtVX3LyqY=; b=tRt7V57f3gbS5SnoYu9NL21iap
	6lWbp/tKff7DjbZcUG9PW1ObmZ2/tg6XUf3kp0F+Htc11jpAt4e64Ymh8Ik9L0C8ffqBXAQvk/zTQ
	zIsBJqwcxnvfzhKGRWh22Adnyvp84B23k6beuitipX17MYtKg+BJsJEX2W2x6MuaIEb5QXnH52xw/
	CbyHDrjKMGa36oFse65yO6nsvOlS1AiCdwseE+qTDNLnDQMAXG1NmFP2CT6zZS0G9hwfD64dU0U9L
	Niz/4e95XZBN2axZyjIBIapXxHGIGXKD8l+QvB00a30y5+rTtwOTfde7hr77t5gLpjThUI2EDvwKl
	ImJLSznw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn7ba-00000002ENc-2EoJ;
	Wed, 26 Feb 2025 02:57:02 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn7bY-00000002EN1-1AzA
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Feb 2025 02:57:01 +0000
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-72722d2717aso1709067a34.2
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Feb 2025 18:57:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740538619; x=1741143419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4VmNKfDBeT2r+sunfTq9ySMJ9kY9GvZ3/jQtVX3LyqY=;
        b=XwxyAkhIHXQaQB96NX1G8jYK9prvpEB6BMy2LXyeGZcMhCJG8blgl2PlmYmHbrp+zV
         EzXyfiCkm/FqfqFYaPhHCNjxDZrlsA+pQPYmvWIBV2TBEpfwzrUNdaKGD+U6AC3QtYKO
         atfp674pgERJ8IpvfXGfCDPM7ixsf79Hsb7mcQet8oe9O9Gipb+gKYBA9CtJafbpmYpD
         fybZ9mJXA5zcnphNJo5ncOCTpW7dGP6uY4fJoatP2ShuONJ+yYrD7qCfRFpSv4XrZuS5
         pv/+Upp16czAn2aZvPemgm6BkcYaGM6yGxiKEX3XgEmVWrMBtQ/e45idOayj3GdNpN3a
         JflQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7M9w/tb2JvkQdTzr8xvNe2+hW0TtNRwkPgI2+vk1BRaukY8dSBjM5f7FfGSqs0L0t4qjfIfe//BL3o6PUbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzIA74q39kbm07SpCi/a+I3YZNOpE3dnZkE3JoybS+ezMGpM0tK
	QI0H7HgLNBn+N2lhkI59jt+KF5hS3DBJkVvU07i4EyTGPf//mywCMKJDkmFQ
X-Gm-Gg: ASbGncv9osF+XaWfavXHsSgWCrgS4zSmUvONIsfnwOdw83TO8l2ffyPs280w8E/kJbq
	wnBv4HiV6PTRtgt4RpKIqQV9vOhppLcyHf7PniMciIMKi/ianp82ZsS6wuONJpUeZ5m5Vdijl2i
	DKiy050Ye+XWyjM6YRTBUO7aw2HicrcfCVwCLQTYYvDlkW8fS7wA5mxOKhE7IG0lMh1u//ltiJr
	mB/4yVXnzU1EuTsqSismcwKs9BfZc2p8ciqY9ttfy7lYaPY2DaFW6f02Owk0uGVmXfqOskQ7UDa
	yVR1gDb2UevAwmFaC3tkjQn8euVm4W45vFCGlFEQbig=
X-Google-Smtp-Source: AGHT+IFiUnxL+4G0l2kiQXu6jPoju3mD9QkYVvUkz+KEOIYzU+4oe5AsYRZuU8AunD+nl3yeKCZrdA==
X-Received: by 2002:a05:6830:8d2:b0:727:38a9:c203 with SMTP id 46e09a7af769-7289d197965mr4381520a34.25.1740538619373;
        Tue, 25 Feb 2025 18:56:59 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c1113f0135sm676360fac.27.2025.02.25.18.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 18:56:57 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org,
	Caleb Jorden <cjorden@gmail.com>
Subject: [PATCH v4 3/6] wifi: mt76: mt7925: fix the wrong simultaneous cap for MLO
Date: Tue, 25 Feb 2025 18:56:44 -0800
Message-Id: <20250226025647.102904-3-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226025647.102904-1-sean.wang@kernel.org>
References: <20250226025647.102904-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_185700_318543_526FDFAE 
X-CRM114-Status: GOOD (  11.35  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

The mt7925 chip is only support a single radio, so the maximum
number of simultaneous should be 0.

Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
Cc: stable@vger.kernel.org
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Tested-by: Caleb Jorden <cjorden@gmail.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2:
  1) generate the patch based on the latest mt76 tree
  2) update the commit message
v3:
  1) fixed the merge conflict
v4:
  1)  add tested-by tag
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 4f35c2f16d0d..604f771af68e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -256,7 +256,7 @@ int mt7925_init_mlo_caps(struct mt792x_phy *phy)
 
 	ext_capab[0].eml_capabilities = phy->eml_cap;
 	ext_capab[0].mld_capa_and_ops =
-		u16_encode_bits(1, IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
+		u16_encode_bits(0, IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
 
 	wiphy->flags |= WIPHY_FLAG_SUPPORTS_MLO;
 	wiphy->iftype_ext_capab = ext_capab;
-- 
2.25.1


