Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245DCC35FFC
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Mar 2025 05:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whPHeHDPWb1OWluhkdd8/iDGoq5/wJGdCJNpRYEBORs=; b=CV/9oZpoVBQC76pkkbkbaoQHRE
	Jb9NzNOUCKiPR+PqUMoSH77trn9S/LFbqy09izI6yyySyE8gB7i1zpTsLUKTCDBYHjBWbgsmk4AJy
	B8bgyKfJ1Ldpttw5KsBhwFFG/4kykO05zI+0exIjHcFpQmkE2gYwYaOkl7MtNBZoXGjgprvgLVLpt
	z5wPKRNMeCzkIWpal9QgkiAJBMpnvcjvUczB9clfUxzNFsVzGheHDTgGizC0tooD0Q7ym4uEruV+h
	3XEpdT9pK4WBLH2gc8yZVgMpHql9iEQyRUKA1bKjGbf7CM3RRr8Yjl/IZ+PTvPlgAPtERZG33T/9c
	cMaZm8wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twx8A-00000004vI8-0a9P;
	Tue, 25 Mar 2025 05:47:18 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twx87-00000004vHb-08aD
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Mar 2025 05:47:16 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3997205e43eso4290395f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Mar 2025 22:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742881633; x=1743486433; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=whPHeHDPWb1OWluhkdd8/iDGoq5/wJGdCJNpRYEBORs=;
        b=oCbhhRvn98R3Lyo30F3BzM86GEPQ9lsJlGpelvgNI9Qwx1ucUCG+x9xxATs9mWvrF3
         84yYsxXF5To1AM+VptNalet5UB6slcZC52IT4jrkdmrn/n0ekImhSJspIU68GZReNBA2
         ue4rGI0VmkTrTvG/tgs1pvy0AZdtLnylPS/IoDge6QThK7tOF0p6WRjsPGj/kaInPtWk
         cz9nGBseUHvTJD8d3mRhEAeO92q67d0LL8PuKqDnuoQ0QvEWuc4tSFBSfRweOE0Js884
         J5pvr340nsAixUWOQ3+5JrGRourutCdi4W6f3CVHGdRdPgOki+UwBoE5IxHfJv9MqQY7
         AXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742881633; x=1743486433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whPHeHDPWb1OWluhkdd8/iDGoq5/wJGdCJNpRYEBORs=;
        b=gGHbGdQfFxcF3Gth/n1IEeYb8z6PGoUqdqEweVBl5BGXS+FkgpBXO8Ob1aTUPtGm1J
         R72DMYd1IHpdvHe9ORRN1b/G2/OjFuE1qBZYxCYCo+k7xkiZcoppkxRjrwQQ0EI+A8Dq
         CV9LV/EZasMijEGSPkYb9t8hg6YfCCpoCPrOAK3YGPMDzu9SMlau4gcEYVfi1+2GCUX7
         RGsTBa0kB4WSPuitOoaWKckkiC6U1nmWWjqGFR/GxKUtLZkkJonoqG3PsAXjg6q8MvJD
         OcVrXDSxpgGsHc4/7Lc5VZ7CBf5tKbo4H6lZMYpf8Qx33XlSkmsohQqTS3XMMOgyDMXe
         T8cQ==
X-Gm-Message-State: AOJu0YwROJi0HDkaEYQkPX87g7iH52r1PnD/O/fmLe54S320kEiyPD6X
	BNqFVivQB8EcbVY+lxP2MZQaZsMJwZgQ60nxrnqZ1edzbM+M68UzBXRFdaK0y3I=
X-Gm-Gg: ASbGncv8p5F/WRK99WO3GNjerYdJLs7OnlD9lq4NRphWtII6KpkbGYtuE39KFbXUrLh
	kKna8cIqo0CKXaITW9Z60P/Yn3unUolKOzLLZOaYM2QnMC9Dl2OltMYwDZ4cDjCXXp72ksKmd5n
	FKwU9ZvPpn9/t/ksZGwN+VNmIRFgjpwmnWNFLUfSkDKrcSgX6C2N/OBl9vEXskMzundOqQk9BAJ
	/8MO2rkFV6hAMcM32vkhhyyipSBKkGK+KL236tGEKTK5lcFpiNcvxtjU98mCL/jnn7gCrYQ1eEf
	IuZv7umt6CgDXPN4h4yU14J0K0/FJTEy6bf1NOv17x2xHFyVbA==
X-Google-Smtp-Source: AGHT+IGNzmhxmfDpRSL//4YZV8P7hlWa94c/MQzOCUBl2MVttM9km40tpC411Ib7relS5eSAvLZ41Q==
X-Received: by 2002:a05:6000:4008:b0:39a:c8a8:4fbf with SMTP id ffacd0b85a97d-39ac8a85327mr556569f8f.18.1742881633309;
        Mon, 24 Mar 2025 22:47:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d43fdeb6esm190742885e9.31.2025.03.24.22.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 22:47:12 -0700 (PDT)
Date: Tue, 25 Mar 2025 08:47:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [bug report] pinctrl: mediatek: Add EINT support for multiple
 addresses
Message-ID: <065d465b-60b1-4c25-b9db-1f00b40cb09f@stanley.mountain>
References: <dac846e5-d15d-4def-a7e3-ce17e74e2da6@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dac846e5-d15d-4def-a7e3-ce17e74e2da6@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_224715_079401_8C2C9849 
X-CRM114-Status: GOOD (  14.75  )
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

On Tue, Mar 25, 2025 at 08:45:13AM +0300, Dan Carpenter wrote:
> Hello Hao Chang,
> 
> Commit 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for
> multiple addresses") from Mar 22, 2025 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:384 mtk_build_eint()
> 	warn: error code type promoted to positive: 'count_reg_names'
> 
> drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
>     374                 return 0;
>     375 
>     376         if (!of_property_read_bool(np, "interrupt-controller"))
>     377                 return -ENODEV;
>     378 
>     379         hw->eint = devm_kzalloc(hw->dev, sizeof(*hw->eint), GFP_KERNEL);
>     380         if (!hw->eint)
>     381                 return -ENOMEM;
>     382 
>     383         count_reg_names = of_property_count_strings(np, "reg-names");
> --> 384         if (count_reg_names < hw->soc->nbase_names)
> 
> count_reg_names is type int but hw->soc->nbase_names is unsigned int.  So
> if of_property_count_strings() returns a negative error code then it's
> type promoted as a high positive unsigned int value and treated as success.
> 
>     385                 return -EINVAL;
>     386 
>     387         hw->eint->nbase = count_reg_names - hw->soc->nbase_names;
> 
> hw->eint->nbase is a u8 so the negative value is truncated to a low positive
> value.
> 
>     388         hw->eint->base = devm_kmalloc_array(&pdev->dev, hw->eint->nbase,
>     389                                             sizeof(*hw->eint->base), GFP_KERNEL | __GFP_ZERO);
> 
> This allocation will always succeed.
> 
> regards,
> dan carpenter
> 
>     390         if (!hw->eint->base) {
>     391                 ret = -ENOMEM;
>     392                 goto err_free_base;
>     393         }
>     394 
>     395         for (i = hw->soc->nbase_names, j = 0; i < count_reg_names; i++, j++) {
>     396                 hw->eint->base[j] = of_iomap(np, i);
>     397                 if (IS_ERR(hw->eint->base[j])) {

Oh, also of_iomap() returns NULL on errors, not error pointers.

regards,
dan carpenter

>     398                         ret = PTR_ERR(hw->eint->base[j]);
>     399                         goto err_free_eint;
>     400                 }
>     401         }
>     402 

