Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310DCCA9ED1
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2026 05:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WUHR+jwX20wnPasopncz+EdY4KBemgqmO+gzErpgMVo=; b=JDzXEFipSXdxBxV5EFGwsbpAuY
	WwXaLudgY/h/2H242YTGdUcxzFeD3jg+LvHIatQk7Z3g7u+t1DHwUH7wmHD0s01G4YxLmrxW+9FNf
	dnYF/LW4INNhMMoHL6yxsZQQFS4PEJZROV1JxSWdqDoE0mmPMcwaznzQO8zEM0/b7PInto86Sr1r4
	vhtjvNNjuAZKQ2Hvc+5sp6t8kcLyQG2ED5DFXBjZkYGERwjUG3CBDAwrgPBuxbsvlJcVE5Hgi2Ac3
	fi4GPjifXBcNVY1f6ow2wkDMpRFf00HK0TEWwI/PX8DCoz58ZbcjlDaqXkf3qAmWtGq+YG64gi89I
	1y3s04QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG8dc-00000009gPJ-2YUO;
	Mon, 12 Oct 2026 05:31:52 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG8da-00000009gOb-1YFw
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Oct 2026 05:31:51 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-33e6279a1d7so2068928eec.1
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Oct 2026 22:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791783109; x=1792387909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WUHR+jwX20wnPasopncz+EdY4KBemgqmO+gzErpgMVo=;
        b=euDblYUZy1Sp9V4C4arZmCj6RMmGeFQdEOK4tOcFv2+WPVGkDR+SdB8Thqy4mO6LPa
         1ggJpIluqfl37WZSXlOQBpBntlnp2l9owN7FdESw0ZcxWeiTEePiUG70EaBkGaMHBWRq
         EkSWrAnOlVlyr94in/ubqYJxG3s6Wz7n+4VuRSl6YjWqUr2KFhjkVQDO66tqwUrUXaLd
         O1jR5VOgeRqySAdZX1sSGKhbgNeCRIUtYn8hYcdWgoz4XgHZkRNkcP6sj51Jmh4uybmA
         wdw7UPj6prNcc8F035GMp1sMcQSHQg4RlXq4V8INQJrhpMyMVSQNHanA+bYWDfKs/ecX
         ecRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791783109; x=1792387909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WUHR+jwX20wnPasopncz+EdY4KBemgqmO+gzErpgMVo=;
        b=xVVaQdnfhaqWib/MA43YvrU2nh0f5DyJcWH23UM3vD/ju6PzLN3q19coeQChJ7RN1Y
         /gwtmzLOYMAPQ++nIN0sO9qSqth3iAkDTbmzb/5jXans9vlGqB9aREq7Mi8GwwTKxaLY
         wCrop/5Lipv3XG/cbUFXHrcrRSJx6pCRXL8xm9OQwcs0JBVWqfup56T33VLgIPvNzHw4
         04798ZXr99p3kWTWap6mBYoDaay65bJUucvTmpHqotOSj70a7kzVbZdkN1/oyev7XoJu
         yux8xP4pbnQnAN0o/Ll8T+uQN6ASiC3b5XQ4kDW4nsfYmZz9ozHZTd6lQnYac4znx4MC
         TMTg==
X-Forwarded-Encrypted: i=1; AKwUvBxkZb51Bikq4jASydsqzG3Azh6fa8LtI5+CCfvYECM+dCJMNMhhIXCe7kNkEF1YYmegF8TVJyEaVH8nKHkgTA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKPX/xJx/2byH2EXFf7cvmYHRsvyyaI2/wE89wbUyvuV2tEVlBe
	6nXkYNkS8AfMfsvJgcgxvPac2fYOQc+t4xzTec7f9deKWwgUCUByo69Q
X-Gm-Gg: AYBFou0LvUXRDdyw3gAkM40LYniK0OS4sEQcBLyyy9tl3viqp1jgHxrdGFTR3WVWRui
	Jc//aPkYkssYgxzmV8lRz7BRQp75+SMJTMxsM/42e1BhQUEPb/aXqmf621eyHlerkR6c7GhrPGv
	gTGdxcexppUSelQemlXVLO3s3NsQfcN2yzELRAmbJOYysJxGkVCARMpFwjr+yg6//oD7nnY4Wgp
	AZbLOx3pTe9kmiLb6fXAGjzOH2Ry5v9ITzBTY2I1nl8w0XdrA3KaGFDKKMGLL4m5C0xoCzS6y37
	629chDWHCWCNLc2LwrmPoyfhHfiaR8VJ163jyO1AXj2C1SzujttY8Xhuib+vCBSpYrIEdJ+JAd6
	uS61bTRZwPwZSo6+7ZtgugMtkh2jw8rL5tT/8+lXoiNkmjlRB9yuFOtOZqa6+DBJjTCjU9Y6RTf
	Kz5auDZ4EwdxIY02Lm2ojSOyAX5h++ZW9ONq6GRfRlgirsgGx8YXwALlO1m7zx8oZ34r50RmUEk
	r2k3BMH
X-Received: by 2002:a05:701b:2510:b0:13f:c85d:17bb with SMTP id a92af1059eb24-16a5888c49cmr12926299c88.1.1791783108925;
        Sun, 11 Oct 2026 22:31:48 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2f17feasm33513653c88.9.2026.10.11.22.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 22:31:48 -0700 (PDT)
From: Priyanka Mani <priyankamani2100@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8365: Fix out-of-bounds read in get_iir_coef()
Date: Mon, 12 Oct 2026 05:31:19 +0000
Message-ID: <403cc04bb103dff096edf72b99ae6868ee91f359.1791782072.git.priyankamani2100@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_223150_447860_3A526628 
X-CRM114-Status: GOOD (  14.86  )
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

get_iir_coef() looks up a resampling coefficient set by reading an
index "k" from iir_coef_tbl_matrix[][] and using it to index
iir_coef_tbl_list[], which has 8 entries (valid indices 0..7).

Before the lookup, "k" is only rejected when it is >= IIR_NO_NEED (11),
or equal to IIR_RATIOVER (9) or IIR_INV_COEF (10). The value 8 is
neither a sentinel nor a valid table index, so it falls through to the
else branch and iir_coef_tbl_list[8] is read one element past the end
of the array. The bogus coef pointer and count are then returned to
mt8365_dai_set_config(), which dereferences coef.

The current matrix never produces 8, so this cannot be triggered today,
but the bounds check is wrong: it relies on the matrix contents instead
of the size of the array it guards. Bound the lookup with the actual
array size so only valid indices reach the table.

This was found by Smatch:

  sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:271 get_iir_coef()
  error: buffer overflow 'iir_coef_tbl_list' 8 <= 8

Fixes: 402bbb13a195 ("ASoC: mediatek: mt8365: Add I2S DAI support")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/67af3580-a907-403d-8bfd-76b5c304ab99@stanley.mountain/
Signed-off-by: Priyanka Mani <priyankamani2100@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
index a058973662b3..2e678f4aa4b1 100644
--- a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
@@ -267,7 +267,7 @@ static const u32 *get_iir_coef(unsigned int input_fs,
 		if (k >= IIR_NO_NEED) {
 		} else if (k == IIR_RATIOVER) {
 		} else if (k == IIR_INV_COEF) {
-		} else {
+		} else if (k < ARRAY_SIZE(iir_coef_tbl_list)) {
 			coef = iir_coef_tbl_list[k].coef;
 			cnt = iir_coef_tbl_list[k].cnt;
 		}
-- 
2.43.0


