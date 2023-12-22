Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10255C46CD2
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Dec 2023 22:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwejgOu3CLIEy7WBg6DtMDhgjRDGncrbITb/o+9tVKM=; b=TJYmkz7uPn7aQORKCCcLjaR9uy
	9pK4YMtPG2VNLCZnlPcSDwld/PUJMyDEq1jKvNn2pmXnf5LMNwHgVqARyQdtJVAzhpMmg6LGN7/0f
	qYr3bEKaredV38CI/FKrESZKcy25Sv1RRRQpLgoWp3PID3gGGuYSUdTcsYR+bL4LGbtI6mcVmwxZY
	Vo76sgMzD0dTq7v11fqP1axofOnuxMwjXsSOveVLawJHv0o47Ephzl5SwtDbiVPdmLxH4lBKyeoty
	xw3UqDIIvPGIbEISQqi3/9uww3YT+mb/KXGNQ6rOF8HlDaxBrNSkPfJe7Kt1FfMPX6z5HKr37MbzI
	TocC2mpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGo2m-006vzI-2z;
	Fri, 22 Dec 2023 22:31:00 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGo2j-006vxI-1p
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Dec 2023 22:30:58 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6dbb650ad59so1433114a34.0
        for <linux-mediatek@lists.infradead.org>; Fri, 22 Dec 2023 14:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703284254; x=1703889054; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WwejgOu3CLIEy7WBg6DtMDhgjRDGncrbITb/o+9tVKM=;
        b=kfYrK6NH9AnhmDWYl4Eq32bXqvCDSlFsu2sfEuppvRjkEVTIdiIbs7ypvln13GtDeo
         C+xZ5T5GLSpWLtJLsf/V57E6RmwuJTZpSVy3RYyySrsWrn/QKMAL62zi1Llj1RF7U9R7
         ckJ6Ao9yi9xKHvIphrjf45q34Z9E9GnWVf6cM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703284254; x=1703889054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwejgOu3CLIEy7WBg6DtMDhgjRDGncrbITb/o+9tVKM=;
        b=tjvKto7ogNYeNssxWZiVzqV7nTu8fdDtoWGjTcOm016rIQQnQKJZbg5Kfe0mawYyvD
         XCPTln49FYKp1Ji1S35UGtO0LNruROvl09bKloxjuR294ImiRvVRp+Uzq8oSwbkGCvg9
         s6JNpfV8JaL0vnH2AN+2CVkfCyfEcxPHtOCU/2RF69He63nRpnm9gREaC++evcr5lKLr
         g1UzvnItyE99iafCmSlKqmzrM6vcKniRKKP0gVqCYgvi3hr0Lf0f8ljGGhgd3TCaCYuV
         /yoR4Nt40C6ecehrvJ7xNBR3+1qzx/mKB0KCkdbrvrHmhTM3ewEoPqGqnDx/Lc/IX/nc
         IH1g==
X-Gm-Message-State: AOJu0Yzs1vTIo0mWrxJ+kl+nEmagHrddA+H0ewinB1Zzsxzq4RjGffW8
	mwGX8e6cJ6AJja8a2qs1sqyINphvIab2gTPJViteS/skTqYj
X-Google-Smtp-Source: AGHT+IER1bh8jMPP1/3cXJs8YlZWz0DMEgd5cLDf4OrRRbTGp5gF9dbStw6xbzqvzSRoXTPBelayfBgYtrmw0We3VHY=
X-Received: by 2002:a05:6830:97:b0:6db:c040:b5e9 with SMTP id
 a23-20020a056830009700b006dbc040b5e9mr1589627oto.51.1703284254400; Fri, 22
 Dec 2023 14:30:54 -0800 (PST)
MIME-Version: 1.0
References: <20231220235459.2965548-1-markhas@chromium.org> <ZYRAuY1LGdD8_u5K@smile.fi.intel.com>
In-Reply-To: <ZYRAuY1LGdD8_u5K@smile.fi.intel.com>
From: Mark Hasemeyer <markhas@chromium.org>
Date: Fri, 22 Dec 2023 15:30:43 -0700
Message-ID: <CANg-bXDw+bYNTu-HFaNAPb4e+_oKt2ExR6PehWR_==vpboKGaw@mail.gmail.com>
Subject: Re: [PATCH v2 00/22] Improve IRQ wake capability reporting and update
 the cros_ec driver to use it
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, chrome-platform@lists.linux.dev, 
	cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_143057_604046_2BED6D4E 
X-CRM114-Status: UNSURE (   5.60  )
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

> Just wondering if you used --histogram diff algo when preparing patches.

Not knowingly. I use patman which uses 'git format-patch' under the
covers with some added options:
https://github.com/siemens/u-boot/blob/master/tools/patman/gitutil.py#L308

