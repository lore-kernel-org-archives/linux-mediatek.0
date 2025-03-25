Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38D6C35FFC
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Mar 2025 05:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NuOW0Mn55yGdA776GNjzbVfbIbXDAQCU4PRgrw1oTbc=; b=iBGcEQOeSN9BRmBf8I3jEnbwgs
	rN1jQLda3Fs5IFdbrDTMYVZzyJilBc1cPC97+864frPYsEV2jcBy9HLvY1TkXE3FROepFverY1KeF
	XoaPAyFdodFkUVBg0SWvT9rNyVhZHO5RSD50K66td89Mjy98anwLauZS3LE0k9TEJDZmXZK0UAWRR
	XQiltWYEmI1bD4KUNWVcJj9UiAmdSc8P6Vhipmjx76YIwbyb5a4FC2YaY4S2zpMkfdKg7FYeMVVYn
	++zl/r4owYz16jR9WUDBZOcob7XUQ11bupPO/8x/+YMpjIpdSZU05+4EO/3K5ZQOWSUujeDeDmmoF
	g+n8YGYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twx6G-00000004vCY-2yyC;
	Tue, 25 Mar 2025 05:45:20 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twx6E-00000004vC0-2CVP
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Mar 2025 05:45:19 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cf680d351so36345035e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Mar 2025 22:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742881517; x=1743486317; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NuOW0Mn55yGdA776GNjzbVfbIbXDAQCU4PRgrw1oTbc=;
        b=yO4CADKvBFkKV2aua8P7MFvx/FGYTSVwCbXJGxwhQPSL7bKB3dmZcqMHHa/I9k5eT5
         gUEJjuQdBekLb+k0IhPS6Pc6a+mKYqYZrCbMaekbUl+bTC8tyBvl3azEHoVy/uwIMy4h
         13FIvinmSOeu0BunDUwKu3BT+vyLR5VWlNOnMu2JzIUa4QjJEQSMHTJimli24QqFEo07
         rCdXZvoO3PImDa/ONQg674/i08dSY/+ZerePyogAZvmRmG/lxKth4gaGVu8AAJXYQ5Cx
         YvO/sNJoqPYxq7Lcm44H5O4ETxaVlmtD4YlN/61FsWRLjWKVD+1kRwvWOSL/1K81j9sY
         1isw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742881517; x=1743486317;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NuOW0Mn55yGdA776GNjzbVfbIbXDAQCU4PRgrw1oTbc=;
        b=XhBgQhRet+n2YbwBdPwiGLIYo0VjyyRq9WebdxK6rBYXEXofJy6rlW+aUJUWi7BFIo
         W+FFD5emOSNJJmrS8Je/MBdFZnMtAOvUFVIjx64f7ZCA3d6ICbLy203O5hMavFyycf9A
         +zoqi1d0W2xiBNTEueLHRlLehTYOdqBnNUm8u0lbGKZMvugPtd2QKfxQExmPb80WnvDM
         7irvjFAV9GjU+o6sB1ohEyDDkPgJZtEuwHFv8vkDlsPV/Yrnys66h1HB55x9FgN2+l1G
         CKur2g+NMByFKM8pf3rRQbiFl1BVUCeGS5oj9GAMDYCPkFzx64An3bJYcPVXj7RdhK5Y
         NiiQ==
X-Gm-Message-State: AOJu0Yx041D3h+Yo7B1mQtZUsVDx3pzU0x32hbm06wbN5RaN68IFm2At
	fHSbr072a9c+Lo0B9Iw82TK9c1kqHQPhnbKWK4JTIajn97cAZNtj1IUAD5h9Rk4=
X-Gm-Gg: ASbGncuNYyXTxfnKkvgUsgwd9jcQ1Kc5uv+xW5RJ7TLrMTtF2F3DIWa6OCe5zQW7ELV
	KC61wAoHInQkCSPRzsShqT6BJMupH379VAIj26mjkb6nEsCMSpAcll/tKwZWfS9E2GKdOFiMQBA
	somprsuy/eSfvdhnTlyJUGiUVo8Kw8Y3a2BQDyJyGZdGqloRPdkzv/1XF9jcxgoeKKGDeL7hM7E
	YLvHZ5kWvkL1PMa0cvByqrZQftELuVSjJ+ihNEuW1jRgH2qxV18RWlaDP6AfUJquRw3rsuBURgZ
	ueHlbjZdk10raT+OU49o0xtWpDeeVaznZc1QAqCy6lml805VZg==
X-Google-Smtp-Source: AGHT+IF0isVPqVCYpl9rR0NWLH2sdHbJrynsZYBvQ3H0d1pQUJpfgitgI7fDNncvjMKlZBokQOX5Ow==
X-Received: by 2002:a5d:64c3:0:b0:391:3156:6be with SMTP id ffacd0b85a97d-3997f900893mr12836083f8f.7.1742881516589;
        Mon, 24 Mar 2025 22:45:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9957d9sm12693479f8f.9.2025.03.24.22.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 22:45:16 -0700 (PDT)
Date: Tue, 25 Mar 2025 08:45:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: [bug report] pinctrl: mediatek: Add EINT support for multiple
 addresses
Message-ID: <dac846e5-d15d-4def-a7e3-ce17e74e2da6@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_224518_579104_CE7B70B7 
X-CRM114-Status: UNSURE (   7.16  )
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

Hello Hao Chang,

Commit 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for
multiple addresses") from Mar 22, 2025 (linux-next), leads to the
following Smatch static checker warning:

	drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:384 mtk_build_eint()
	warn: error code type promoted to positive: 'count_reg_names'

drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
    374                 return 0;
    375 
    376         if (!of_property_read_bool(np, "interrupt-controller"))
    377                 return -ENODEV;
    378 
    379         hw->eint = devm_kzalloc(hw->dev, sizeof(*hw->eint), GFP_KERNEL);
    380         if (!hw->eint)
    381                 return -ENOMEM;
    382 
    383         count_reg_names = of_property_count_strings(np, "reg-names");
--> 384         if (count_reg_names < hw->soc->nbase_names)

count_reg_names is type int but hw->soc->nbase_names is unsigned int.  So
if of_property_count_strings() returns a negative error code then it's
type promoted as a high positive unsigned int value and treated as success.

    385                 return -EINVAL;
    386 
    387         hw->eint->nbase = count_reg_names - hw->soc->nbase_names;

hw->eint->nbase is a u8 so the negative value is truncated to a low positive
value.

    388         hw->eint->base = devm_kmalloc_array(&pdev->dev, hw->eint->nbase,
    389                                             sizeof(*hw->eint->base), GFP_KERNEL | __GFP_ZERO);

This allocation will always succeed.

regards,
dan carpenter

    390         if (!hw->eint->base) {
    391                 ret = -ENOMEM;
    392                 goto err_free_base;
    393         }
    394 
    395         for (i = hw->soc->nbase_names, j = 0; i < count_reg_names; i++, j++) {
    396                 hw->eint->base[j] = of_iomap(np, i);
    397                 if (IS_ERR(hw->eint->base[j])) {
    398                         ret = PTR_ERR(hw->eint->base[j]);
    399                         goto err_free_eint;
    400                 }
    401         }
    402 


