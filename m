Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804A1C5B555
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Jun 2025 08:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4pYCzyvVuUxf1ykvfMA4e/Vu/0PCYvey3wVDJfkBM4g=; b=RVQALCdsUFHAgkPBpwvfAkoZ+7
	iGcFZh7lZ94Qpw7wOpPy48rkWzecB7OKP1zTYExuhfXEYuQpxn/cwBZc59Fu1JZ3ksy+sO5jGqGp+
	lv/gqelOSsinqCK73n6c2yNP+eaJ0baN/2fso3rpyKTvnRkrR/Yq2Y/lJ4QitBy9ST55NPOw8ciYz
	v3LYu4W4S47tQd6uBATswOPRzpLmhx6oOxdFtIJ05F5Suq0oAEvgYTKS94Ow4CYxBvlXu03J6rnli
	z5G6VzkxZW9wEliYoRbKiLUEGlQ/+BDMV/kp7zJdz0ToVvG4WjOwuG5AGKy3tSStz33vx04Lw8MNz
	0kqrAoGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjju-0000000Cvg0-2R8B;
	Wed, 04 Jun 2025 08:44:50 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMj8y-0000000CqVR-0syQ
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Jun 2025 08:06:41 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a4f7865b22so719486f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Jun 2025 01:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749024398; x=1749629198; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4pYCzyvVuUxf1ykvfMA4e/Vu/0PCYvey3wVDJfkBM4g=;
        b=dN9cAmbVaMFlJFTGchG3z9Kr1KA29tImYEkSGbwvkZTU4QfnRrHXwb9OtLERuCnzSa
         kacMi4erbFR0O2XiZ9CdXgu17wJXecn1b5iF4NwDiwR+9/k8bRS0qLxAuDYBHXBtx8Da
         az1KgZtYpnHWzIPrc/u3zAPsRQ2bxh1Cy4kw9dwrIPnVDETbQpjigL1OlocQG0xiOtHg
         H2S+lLgUVFeZPlpd8NrPjRDBRmPDGXPj50SeJHh2qiNlgi2zeLDAD8MJSr3I0VWHQgjs
         dlb7ki+R33leeQfhWf/45t3Q05MEfMNJE6rsV3cBVLKOgtfGNGFwck0AMHkxlh+0AMJT
         EZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749024398; x=1749629198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4pYCzyvVuUxf1ykvfMA4e/Vu/0PCYvey3wVDJfkBM4g=;
        b=vt6f1OGZqW/tG1CS/mTPQFH7EOzPgSWCku/ysceZkflAUffaCcP2pFW0EtRzE+EqDr
         UFs/EcU4vUkuR3oS2vY1LN1HVKknreiO8MeevSeoOE49Gh2hF0iEy1MRHWK5OvKQESxR
         lb43bcMdvHBz0QSlXaHUjv9h1+zBPk8M0p75/ODNzTcAwbjgjWeQ1vjg0UXtrmzkNbsY
         6N8wKkRivE4078caIvKRH9sqqeSVrw+slsuwZUsqWNJc9xii6F2uge0hyxiJW1JWIBAq
         WDia8xnzfSvrp3VzeRwbNGfRNMBL4/5lsfMVXoF1yNHVOK3WN2dBw+LjXqdY8Bs4cOBF
         2YNA==
X-Forwarded-Encrypted: i=1; AJvYcCUSwpclkZs7qXP4HD0po/0fojmCZTRwafjK9LG8MxwhR7W+yed0TeD+ZW3MSJ+VEHNSce/Cl/oY+53QhX6FUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1nAfb0llZ7sFN8P0QzAF8oo+1Fk4rc/yMOm/aaBhpEHxGbCVq
	rTeGu2eJwmm62p/TQuXYK/113spb9a6fd749Z5sjYaJ8Jkir1WbZLt4=
X-Gm-Gg: ASbGncsCSoR8SrtJyKINuxiv5KwPVwUYl6SYzHjNTpuZr8GoKKzehjvS4viHWylgP11
	FgOTvS5e1CCXo2GZIba8aOxB/mSPIzP9A/gktPBxkcgWPc2pTTg23qAEWvSaMyS1cd/dBeUWS1M
	/TZpgGd8ozvrkG0ELb2eRdpLrdtza7YSLsoTd3uH1jxRN61TKOnz/RD9KL/TdpdTxmJ46cZQto3
	XyC554VR55vED3+YMYCZUcyzeQjOSev4ExvEWK3Xih9jQHbk0ElRmgrerqpHNuX+WcD45+3RU2R
	6yjwtcNT9VeE6Pnwtw/H596qLbmNe3IFoM+izUc58H8/cfrmml9VdCGXce0rqpLPkodWLgKxOZo
	11xke72hjirkhG0PkpuqK33Ls6U1JGvRJHgKMaQ==
X-Google-Smtp-Source: AGHT+IF2ugr+CYuO5R6m+k+nVTMMVyTkAQoZCMAynyAqBF16OKr2HATLFSRU+dGGEAd4mbVnWkCUCQ==
X-Received: by 2002:a05:6000:22c2:b0:3a3:61ab:86c2 with SMTP id ffacd0b85a97d-3a51d91f3abmr462084f8f.7.1749024397789;
        Wed, 04 Jun 2025 01:06:37 -0700 (PDT)
Received: from localhost (81.red-80-39-161.dynamicip.rima-tde.net. [80.39.161.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b7bbsm20597082f8f.4.2025.06.04.01.06.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 01:06:37 -0700 (PDT)
Message-ID: <bcc1994c-6ece-4e71-a8b9-9367f6734381@gmail.com>
Date: Wed, 4 Jun 2025 10:06:36 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] ASoC: mt6660: delete MODULE_VERSION
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 SOUND ML <linux-sound@vger.kernel.org>,
 MEDIATEK ML <linux-mediatek@lists.infradead.org>
References: <20250531155950.101164-1-xose.vazquez@gmail.com>
 <bd02757e-458b-4a3c-9194-7d7bbbd318f5@sirena.org.uk>
Content-Language: en-US, en-GB, es-ES
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
In-Reply-To: <bd02757e-458b-4a3c-9194-7d7bbbd318f5@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_010640_250765_726D6DDF 
X-CRM114-Status: UNSURE (   9.09  )
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

On 6/2/25 1:21 PM, Mark Brown wrote:

> On Sat, May 31, 2025 at 05:59:49PM +0200, Xose Vazquez Perez wrote:
> 
> Why?

Reminiscent of ancient times when modules were developed outside the kernel:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2cd53fa9d38b98ea5ae4268e021c4f4cd68227a5

This is the only driver under sound/ with this macro.

>> Cc: Liam Girdwood <lgirdwood@gmail.com>
>> Cc: Mark Brown <broonie@kernel.org>
>> Cc: Jaroslav Kysela <perex@perex.cz>
>> Cc: Takashi Iwai <tiwai@suse.com>
>> Cc: Matthias Brugger <matthias.bgg@gmail.com>
>> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Cc: SOUND ML <linux-sound@vger.kernel.org>
>> Cc: MEDIATEK ML <linux-mediatek@lists.infradead.org>
>> ---
> 
> You've not provided a Signed-off-by for this so I can't do anything with
> it, please see Documentation/process/submitting-patches.rst for details
> on what this is and why it's important.

Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>

