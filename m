Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229CFC5AD55
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2026 02:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ujyD7jgd2uYoNISfol1DV4SvsMNF2Ff35/OcJJPtWQ4=; b=QCbGqBqeLIRdr6pmHAUUh+a6XZ
	6+6wkvs/OBgVRxUoq6bVYOWo3DPnZ4XyfRTSKfUwlxS/J4nozAJEbnrSUAWq3pV6oiFEUIGnnmTVQ
	PC+KD8RNrqCrN6Xqlb3VBh++RXC5B1Yh+1omjE2P6M5rQi8QSD8W+7ukIvpCLAgF92t3fdDTfbIYO
	z2YHlLD42oyUDe6JC5camhz7eEhFKG1ca/UQifQBBTF9eCCXTEGnURF+HiSd2ZnqkyleTaRoePSJ3
	UFn51A5qY265UcbbbpO46CWMqUKj8inPoaY2eXSLqPH+L88bZaGcroqPy94z426/rH5opzlfsKJXb
	MwwiYHlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtFy2-0000000AvRL-328M;
	Mon, 10 Aug 2026 02:42:22 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtFy0-0000000AvQf-1kyG
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Aug 2026 02:42:21 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso1348449b3a.2
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 19:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786329739; cv=none;
        d=google.com; s=arc-20260327;
        b=DFqY24Gt9nRKDFAvHsNOWRJm/I4kOzW/f+eynCpZyfbjVqxqTM3cuhtZGT20iaq+Ci
         wMI0E4grlhfxHSQqFuv7ZQGhCHlLl8QfHf6nvS/cYA9L7oRsp0Dae+pWxm5TjFLQGrJg
         a6zGZh2rpdLmFjpcyeT1brXtq403CfpLuhGDpDuDu85/xnVB06ck4n5OPWcrA2ZzTYa8
         rW47/ZnUc9QUNdGtuaUdkSAQNXaVBbWVhMBRriF8Z8E4E5j+kuIgffDj/pKVhXHgTGUE
         8CDTX+M4Uv0AwN4jHRf1g7tdNj2mecTuwAq6mmENy3XmFLWu/Euev6Bh4fYPWCQh0+bz
         nihA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ujyD7jgd2uYoNISfol1DV4SvsMNF2Ff35/OcJJPtWQ4=;
        fh=zEPj56Q14DdE9DnVoNRFRBq6XZdBuYN+9CgsofkCBVA=;
        b=lrt/EVkb+/ONyiyd8eT9W0Ys0S7POMKRLuZqnYnsKbHS6G1s+MurO3I3Hp0JPx2f3X
         OAmOAZg+7a00tOn7lFHLQTULuzCiNyArNkGg+7AQWm0I//4jK5YQQxi65qDyHD8aE2Bt
         PePw/Dsa4u2XtMR712YnPb5jJ86/WAaVLTQw1dYRQGbCJaHLJ/8ziCfWNl13lUKT3UpI
         3T2khwkm3NgVvYdr778WRrz2b7Ag9ldMqtX/KvIx+Wps+NltmhjIwQcL7RJa1Ed4n+CW
         lAHLw2CYNAC74fuvGGYHUyWA8CsXmZIpdZ25B4XoyyBtc0auS3miBzJPZpG3TlueiQFs
         mxbg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786329739; x=1786934539; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ujyD7jgd2uYoNISfol1DV4SvsMNF2Ff35/OcJJPtWQ4=;
        b=jEJsnlQUirepoWKi5iEBDyJLo19ai4sguibV+QVo9lhpTqLS0iytRVMTG2xXfXy2k/
         JvsJe0zvg/Hz3U24+tyl/bl93f3zqW2xES80r8z+EAk9VjKue+OAgDPtzYXGwaO1ag81
         5a4upbo+dWjPsP2AOJ8ka4Sccsd/GTUxpYW2sNsplXK4yi9PHFu35t4TRi4cvKdIi8tm
         abMmZwhLfcO/DZlGhxtntKD/rT0R4WMLIjSW939HnXnAf8EhYwlZ7O8koX5ho33alYFb
         5oZz0tDoi6+kEZXZZ4whL+D0TtIvNTMk0Z3Jd+GWdY4Yn+89w2IeQ7xt1s/nhbe50Ud4
         6ECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786329739; x=1786934539;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ujyD7jgd2uYoNISfol1DV4SvsMNF2Ff35/OcJJPtWQ4=;
        b=m9uGHEde4/A+lWLuRo3mmeS9DMrMefCjuPWle/p/ZDuGk8YJ6lni0i1/mzW31NWWQf
         otKp9szCVjzdQwEw5Dx9q/cofNCx/lm2/NW2o6Uf9RB02W8Qr+GWjGEgRJ5zgdTiccfm
         ymLRnR5cFJ8ItqpMSrv/dhPDL28metONiNLkqPtXv7KD/OW4G8PsJJg6RyIvkMcZURj3
         y3nvBLVDJ2lZv52IN5a5kLL3PSnLG2PgqyVwVml7/zEeGFyRscQayQC0z84pgzu7+eQF
         hY0Sm/ztaZ1qRNTL28+MiIirDLk0GIFfuqTnj+zDldv34XF7rYsXCzoGtzHehL5tfgdM
         clcA==
X-Forwarded-Encrypted: i=1; AHgh+RoolSk1aGrElJ7d26knb0ybqVfHpptHb9a9qJVIUGEBJLyNhv5j/dEksfC2NxgXkwVG/nn4u5hFDqzCaQrtxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YznZEfYAvDg1wrTuuU2hHaWaTRgb9CO7GenOP+ilq4lgVwSha0C
	3EuaGAqXW6Gtf93LpO8Rysd4L2OuF48cw6uu57MIbCQCFOVEjn6Pbo6wVca5P0eOHxVsiOccQtn
	fgCrdKKXxsPkyeHnFEIwigyfJ9xnWQYQ=
X-Gm-Gg: AR+sD13i6pemboSvA7ke315l0G1mTVuTRxTM5JFcG1Fv8RPKLldeWKGNAPnkZoefPqX
	9ZJcrffkeRmgBU1jIMN1jeJUJ3ftqglPqZwMBVtG/ZDI/QpknrIfFYIUeHrQZlbowuaRQeP0zRT
	tc/WHz+DLuJQKn67LBo0uH0OFOyg5i8ffMEIdBOAhHPcu0oZHEYDzUFbtJ9z4XW/A8iDTEy/IWl
	PQDKU8Pj1Ifw5264AL/Z6DcAhn7oPTDXYGdMqel2t/LYZOCHvB5ykCSmKORjr+MhcA0hsUBcPK9
	FUBFyePfMEddiCSPePmG91Hw1cyTX9Eay6vy8YE36cwtxV6HTzoFVQdVENt3SBQwbbd8KzGblPO
	RUz846LSFKx7rdmB9RIHvYstdtkCzN67z5EDILVJgdxxvVtk0oa2F9zPP
X-Received: by 2002:a05:6a00:1d9d:b0:848:469b:3d19 with SMTP id
 d2e1a72fcca58-84f69700138mr18901107b3a.29.1786329739493; Sun, 09 Aug 2026
 19:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260807081652.38692-1-phucduc.bui@gmail.com> <2eb8b31e-a3c6-4310-b9cc-7acd135b6c99@roeck-us.net>
 <CAABR9nHqKKbxkzBNkENadhFJgC_HuetV+ab7SVsGH+cwbF+OFw@mail.gmail.com>
 <9971b3aa-cb1f-44a9-9d58-4f75f0c6ccea@roeck-us.net> <CAABR9nHu4pt-Rg8Aq0B6KfKFHX+C1xQmMk6=j8jq1Zn-MQ0p6Q@mail.gmail.com>
 <ccd8fd7d-4555-4ac5-ae73-c16e98b8edc8@roeck-us.net>
In-Reply-To: <ccd8fd7d-4555-4ac5-ae73-c16e98b8edc8@roeck-us.net>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 10 Aug 2026 09:42:08 +0700
X-Gm-Features: AUfX_my6zYcbzcH2Wjjxkf8uek_ej0039cVqQTNpkObFSyVFxGT4TjQ-70scvlg
Message-ID: <CAABR9nEGsisuuQhLwxdcB9i2sEuH=AQb3yaPHPNecya8G_5ieg@mail.gmail.com>
Subject: Re: [PATCH 1/4] watchdog: qcom: Propagate errors from optional IRQ lookup
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_194220_482605_F8860414 
X-CRM114-Status: GOOD (  11.22  )
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

Hi Guenter,

Thank you for your feedback.

>
> I wpuld probably implement something like
>
>         if (data->pretimeout) {
>                 irq = platform_get_irq_optional(pdev, 0);
>                 if (irq < 0 && irq != -ENXIO)
>                         return irq;
>                 ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
>                                        "wdt_bark", &wdt->wdd);
>                 if (ret)
>                         return ret;
>
>                 wdt->wdd.info = &qcom_wdt_pt_info;
>                 wdt->wdd.pretimeout = 1;
>         } else {
>                 wdt->wdd.info = &qcom_wdt_info;
>         }
>
> (which I think would be a combination of B and C) but ultimately it is
> POV and doesn't really matter.
>

I'll go with your suggested approach.

Best regards,
Phuc

