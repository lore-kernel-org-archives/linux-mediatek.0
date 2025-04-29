Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4981FC3ABA5
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Apr 2025 12:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=koN3i9u1yWXLoLucqgVgrkyci1pR0i09zyThj3OeDXw=; b=JGxVct4SFcaStmLLQwkFxOYTER
	ACcmJraaSZeOSA8TGK3veiocwk5X4XsrUtHIJ8SSZhQiZrNfzUqkB2bNez2SS0RLVF4y+xCrZZ1gU
	uzjRewe64z6aj0taTh1SxoyVRZZ84bowuKETpelPvixmrBCFekW0lhuHeggMk/+edE9cTES5+HeDZ
	dQaR0CYX4g9k04z4zbmWOPf6hPcm+l/vcyZ36uRcvhggFfvHZNsQr+nrOJ+K5WdOYyKdFyo4VKRGS
	Q618XOQNxpc4fA7egHpNPLIB2ebeIJpKODmMv6zpeaL60tXDBLI77FLfjwHKuaXsRM0BqK3xnytR2
	hElbHdWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9k4W-00000009eD5-0Rng;
	Tue, 29 Apr 2025 12:28:24 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9k4T-00000009eCW-1sWG
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Apr 2025 12:28:22 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ac7bd86f637so1327385966b.1
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Apr 2025 05:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745929699; x=1746534499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=koN3i9u1yWXLoLucqgVgrkyci1pR0i09zyThj3OeDXw=;
        b=B+VW+2wSfr0PNhJ0PI7UpChSSvh5lw14ceJXunPqgqvTeMyKe3gIq/PhLht8Y/rRlH
         btvIyBbuEc1vNGS2lzh+CGWFfFLjxJ6QI0GhyB9KLkzYZfBWMrEjZ+VAj04gf6eAt/px
         mJeSMTVOPgiHuu23HqcjQwnl9axHUMhzaUdLnISvLv1wEa9eYnzBhOIDLeE3ySMgCKIh
         cpX9jVVTpDHPGE7+FKric4ODmk+4ie/U62IE2Tc74VDGryGX9Q9FZXH0XPZcoZvVckZY
         +HJHgE7t8RFwSrgNHVSY4OWQKthVb0Vyg4KRW8qvwoMifOVCX7SXjwoOdT2RFPaBt+kN
         m3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745929699; x=1746534499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=koN3i9u1yWXLoLucqgVgrkyci1pR0i09zyThj3OeDXw=;
        b=vgzC+PuTmVdvTttMffmp/pnDnX2nrL7P305jRbE86sJZDfI58joLc6eMt6z8YhDA/4
         nuU0dLHYPrLBZYlVPhc8OGvy5PpmLsBgeLqbFosShhsxSEBZMU4DBBCu3H1wzuXeXZrr
         C+MtfP9lg7v/xosDENCyxBdzgjgxrhxzqDJJqIvff1p+FaJcm3aXNM0wRmbL0yxNXL6d
         H5B+nVUqUVvM0aB+n7kzQmahEfcKqJvQezIClzwk08zNlg04BGx+aGWLd5WA4dzDnj0Z
         sEUHJLqZ052YWxCRILYbpbCCeUYzHk+kHMaMFdwrUPZnMoMTLuic0ZuiM1BBdU7Yfhhm
         Wefw==
X-Forwarded-Encrypted: i=1; AJvYcCXbGjwhAc9N30xKbMqYoWEt8S82ctdyt6Ed0d48zGKMbOSWtoaK7ztYlySEKxMn73mcHy15PXYIKU8FrdaFPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwlmbK9/SW74h6apmEtmZ/J8mgggXVrSTnUtjt9aouz39DMkGyH
	PBdMlirGurIFVqcNz3Qgua/fTztioyKxs5PnOqV74vCFRCBtP3FEI6Yhls9l
X-Gm-Gg: ASbGncsWR1VEMlORSKkJ2uoPilhyE70j7izFR4218WCSiwsUXhO7H1vhRcJFx98/GvX
	N7Yws5wUcfquJQNtTHL/x67IQ7nbfwbsKbE2MxkngAEZkc+3XkmrCuapf29943AsQoPKeUyaDve
	jrgv9Ja4cKEiN56RnbJd7AeDRDo+b+uEFoHAG5FIIfZ3O6MVAvI05f5g9x+1Rzf06Af+tKgb/u6
	/ybNuo0Y42pZtUrCBO24oDQjb4OVe9c4GTQGes1GS8JjU0HZcGMLcVVuwtkZ9GXBOFALkNvvQmQ
	0bFefiDh+tuJ6hgk9Ez1anzBzCqdV8scbheC82+VWxAiSLFU1/Se4xvCNdK2vhbDKe5EUTI0Fw=
	=
X-Google-Smtp-Source: AGHT+IG1cQ9kMKsOk9UcxUNfRkjZe36IRUreA2Ii4HOx5L8MjlYzzS9/KmX0g0YbwebVrk2HrnGwpQ==
X-Received: by 2002:a17:907:1ca4:b0:ac7:b1eb:8283 with SMTP id a640c23a62f3a-acec6a4958dmr286707466b.17.1745929699093;
        Tue, 29 Apr 2025 05:28:19 -0700 (PDT)
Received: from p1g2.lan (128-78-204-97.abo.bbox.fr. [128.78.204.97])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf77dasm768290566b.87.2025.04.29.05.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:28:18 -0700 (PDT)
From: Gary Bisson <bisson.gary@gmail.com>
To: angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Gary Bisson <bisson.gary@gmail.com>
Subject: [PATCH] Input: mtk-pmic-keys - fix possible null pointer dereference
Date: Tue, 29 Apr 2025 14:28:15 +0200
Message-ID: <20250429122815.72724-1-bisson.gary@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_052821_486448_2103FA7D 
X-CRM114-Status: GOOD (  13.19  )
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

In mtk_pmic_keys_probe, the regs parameter is only set if the button is
parsed in the device tree. However, on hardware where the button is left
floating, that node will most likely be removed not to enable that
input. In that case the code will try to dereference a null pointer.

Let's use the regs struct instead as it is defined for all supported
platforms. Note that it is ok setting the key reg even if that latter is
disabled as the interrupt won't be enabled anyway.

Fixes: b581acb49aec5 ("Input: mtk-pmic-keys - transfer per-key bit in
mtk_pmic_keys_regs")

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 5ad6be9141603..061d48350df66 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -147,8 +147,8 @@ static void mtk_pmic_keys_lp_reset_setup(struct mtk_pmic_keys *keys,
 	u32 value, mask;
 	int error;
 
-	kregs_home = keys->keys[MTK_PMIC_HOMEKEY_INDEX].regs;
-	kregs_pwr = keys->keys[MTK_PMIC_PWRKEY_INDEX].regs;
+	kregs_home = &regs->keys_regs[MTK_PMIC_HOMEKEY_INDEX];
+	kregs_pwr = &regs->keys_regs[MTK_PMIC_PWRKEY_INDEX];
 
 	error = of_property_read_u32(keys->dev->of_node, "power-off-time-sec",
 				     &long_press_debounce);
-- 
2.47.2


