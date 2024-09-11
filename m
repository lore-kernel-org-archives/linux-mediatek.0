Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252FFEE0211
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 07:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=waChnXwLMhRh3dlZr0LgUZgVxCRtJHDpRHsW78jjWKY=; b=z5t16GVKhgHSx+u64rbRfKLIBo
	Z/mtkcSzKwle50iRDg6BoX7XmiJbKbdwYwouhPOqQbwlbh2Q1RaPzW+DMZUpVQA28tNOt8BGh27Nu
	wmlG+lY00AJXusgWR9w7fGr0nsIXk0RIz9FoSgfyozyIp8ibLaK1WfG2Rnl84Fu7SsZuz4T+Q62RC
	JzaYHbmX7DcudYhOlVlqjJt8LiJ7RIi009oRqS2v9AHRLI390KhboRXO3hhdM5ejpylb31q0Zf88i
	Jo1eaxr32OaXvw3glEs5NPFYh6NnFTZZtOABS0wGyKLfgNtKY1UvXifIsvGUowPIVuzYq6PVqNBRK
	5yCkEXJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soHxn-00000008U8P-33vc;
	Wed, 11 Sep 2024 07:40:31 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soHrJ-00000008SCc-3rhZ
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 07:33:51 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-374c84dcc64so5021160f8f.1
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 00:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726040028; x=1726644828; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=waChnXwLMhRh3dlZr0LgUZgVxCRtJHDpRHsW78jjWKY=;
        b=Svg6cqNJYm/oaSnd7twGOmsivLof5cZM3yRwLsx1rNzK6qDyRTjADlvS95frGdOWrc
         esaBjOHPO3Ay8nDpt27QN2XioyU8wEZnpXQxlkACq9NBt6+dJL4tsxMuaKKElh/gIR28
         u34HALJB2ZmQtlcrxG5GkdcOL3cI1PEz8+pcGY5SEjqxSqIzebLDXG9ytqyBdP2kMmv4
         6xDF3rzXL7r5/ZTdZbM9mq+wYwPc7ZK1Zzog9y86/lqZaA/ROttmw/E/RSBLR5lfDSaQ
         HH9ntwaDoTHGMaFvsaBbE+s3cJVFqVyAJXAshfpV7/VoIztV5CZ7Mk7ecxPBmfuPErJT
         1TrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726040028; x=1726644828;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=waChnXwLMhRh3dlZr0LgUZgVxCRtJHDpRHsW78jjWKY=;
        b=JQ0FZn80gxp0mRoWuVxU1n6zEeZFDLAF9jw6dH+bJ2HPoXPP6yV4hF7vvOj1esJFxP
         kPrmuTmx5QVxtgvEY22eurLHUdf0SpP55PUjta8knmrAkT1V1DVkG4l6UMqXjvDribuv
         t3BsMbtJ9JWQXQ1+cfV8kfXxkBS9YqYJFQu/FJcEDUjN7te9BLukPTqfJlkYAgp2jWxO
         jzpjs99QZcMypQ9T3ZRM1fMod7H6lbQucLRxvMEy/Lp5ZQns9Rsobyh2iXTJtbz0ZhmL
         IX+cswdsPp7EBQOg74G9j2alZmK1aKHCgX92JghffV1G8K0QlbrJOpFwmT4nLKyhEYLY
         mNCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZi/t2Nxs/XW3engC+n8ZwdbDy7zpY7vVke+TIVplfDGsaL2jn79HjPaY5M7frUZfLGiBmvDLyoc1ANx2ttA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbPTqBuTRE7bzD2DRcN/BUosI7V192bsWi8rekftPhlsg9FyDg
	92K+B3Lke7mO2o7js5/H/vAoV0ZmgjxpwESXeRJJ140BmoyMHdJAZIvphMBsmdo=
X-Google-Smtp-Source: AGHT+IFMVgzPMtBRrBHgElmU/sBq1NB5UAguIy0Y4R1hUBBFHq+7IGxgt5spwjTOJVmuneLA6Zx7pA==
X-Received: by 2002:a5d:4248:0:b0:374:c512:87ce with SMTP id ffacd0b85a97d-378922b7b58mr11531383f8f.30.1726040028125;
        Wed, 11 Sep 2024 00:33:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb8b050sm133397595e9.40.2024.09.11.00.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 00:33:47 -0700 (PDT)
Date: Wed, 11 Sep 2024 10:33:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [bug report] ASoC: mediatek: mt8365: Add I2S DAI support
Message-ID: <67af3580-a907-403d-8bfd-76b5c304ab99@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_003349_993786_CA33338E 
X-CRM114-Status: UNSURE (   5.81  )
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

Hello Alexandre Mergnat,

Commit 402bbb13a195 ("ASoC: mediatek: mt8365: Add I2S DAI support")
from Jul 22, 2024 (linux-next), leads to the following Smatch static
checker warning:

	sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:271 get_iir_coef()
	error: buffer overflow 'iir_coef_tbl_list' 8 <= 8

sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
    259         const u32 *coef = NULL;
    260         unsigned int cnt = 0;
    261         u32 i = freq_new_index[input_fs];
    262         u32 j = freq_new_index[output_fs];
    263 
    264         if (i < 13 && j < 13) {
    265                 u32 k = iir_coef_tbl_matrix[i][j];
    266 
    267                 if (k >= IIR_NO_NEED) {
    268                 } else if (k == IIR_RATIOVER) {
    269                 } else if (k == IIR_INV_COEF) {

These if statements limit "k" to the 0-8 range.

    270                 } else {
--> 271                         coef = iir_coef_tbl_list[k].coef;
                                       ^^^^^^^^^^^^^^^^^^^^
But this array has 8 elements so it's off by one.

    272                         cnt = iir_coef_tbl_list[k].cnt;
    273                 }
    274         }
    275         *count = cnt;
    276         return coef;
    277 }

regards,
dan carpenter

