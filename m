Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA24C4829E
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 09:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xmg4GyqE2bkdR/9vhzop5Jgy/Ivyzo3N8XAugZKeJTI=; b=PTISQnHX9mK9UaM0YJP2tI/HPZ
	Haszp7PCG5vdXV2OWKBQnViTstlUiiYQZw/95gc9oSANxZW5b+h8rPguQdKnTMWA1OVtnzYfY4RbU
	eedyqTceed+Qxmu83biHmuO6ZO7cIKH+gF6NKWpEABnG52cNEgb9pECMwcU1QiZVCpQDQbbZPzpjT
	njA6byiz2EH7ll0qU1VkNTU4Cv6xYkT+O0Dmm0oHPAE4PvtUhSeLgLJ475t7DiLeoiX7X67ByQAxu
	jJqzwv6Bhxt985+ztLExpEyI+7S2+9YHFosbfh38pOpxX9AiRc9LImDRl0PZFIt31Wdcm1WiUBFji
	U7MAB5uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raY04-0000000FYh7-1K2q;
	Thu, 15 Feb 2024 09:25:48 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raY00-0000000FYeM-1cP0
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Feb 2024 09:25:45 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a3d82926ed2so66405966b.0
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Feb 2024 01:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707989141; x=1708593941; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xmg4GyqE2bkdR/9vhzop5Jgy/Ivyzo3N8XAugZKeJTI=;
        b=F9Hi91f/LWWZwYcxWByggszG8Q0qnPi1v9yL0Lw+BDGiwjS3MZTjFgGh5TqyHMR59t
         0nMaCbFJWSi7dwyr7mov21glwrl0h1K2AWRNtiMnoHiazvTcThepeM1lo3imp2GJX/Tu
         KrWXUg8df3Hrds/cDEnKiJJwB0g1qwIUxaSdAGnnPeH3DSO0+a4YH4k91aGg1t7V+t7c
         4Boh3aXcNqaFYXjCWauIVPvn2/dC1xFtKHugrUurIw9Y9BB+b13FvAYQ89l9fdGWX5z/
         cIJPSw+iI+ITkLb1CbDFC7V4sheUDULJg9/IYfnn8GskrC/sI+6Bx4RWvqPY418ewfZh
         TuCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707989141; x=1708593941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xmg4GyqE2bkdR/9vhzop5Jgy/Ivyzo3N8XAugZKeJTI=;
        b=QH//nt7eWaU18atsui9Jc9gMyMB3enis7hGZv6oxOZozcmq+LVb/VH7JNER5PWk1ne
         sUnh4BfbK4xMsXKIJN60ScChMYWeHGq2Spm4ROLfazdRC16DPsXeNzc1Nz0GTly94nUC
         NfUU5wut2RMAINDZ3s506RV60Kj7D7UBrIQ+UxpyuMDL3IMFlIf5SJfgh6/IcemcKC2I
         Bvx9tffgXoeImwerkT8of//yEFDmFDKy/QNS0UfzlPhC4QbLMOkjaKuAzBwNYuURen+h
         Yx0zBvNerSCtOMMuW2lg9PBuJy55cN+r9qDemdBVCXa+fTL0ptQCkG3qLjpintA2YuMg
         Q+UQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNKfjUJlFuyehS4b1//bRhSbNbhzJIf8mKQUvWXsYXLSV55r9k0xxMH4sNSrWPCCkOG4lmyhqR5p465dssbwcU5FxfD9mdMzMK40Xg0uPXoUBg
X-Gm-Message-State: AOJu0YwbDh0eaEzJfkHQi0oLfvHuui3CPnRRg0vgqjRsJPQX1noUOS2W
	xV8QO6sYCXG+IPuAxRgPA6L2jpRv6LUGlibssbuTrC49YzXWK5vMG497FbnCAqQ=
X-Google-Smtp-Source: AGHT+IFZx7QXYqNf+ovTF4psE466cIvMPkky9JfvKHFlSZz7hccBdnIOqgiC2SA4zAAW7qdtAbVNXw==
X-Received: by 2002:a17:906:d28b:b0:a3d:9f8e:8821 with SMTP id ay11-20020a170906d28b00b00a3d9f8e8821mr562492ejb.20.1707989140973;
        Thu, 15 Feb 2024 01:25:40 -0800 (PST)
Received: from linaro.org ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id ss26-20020a170907c01a00b00a3da9857e46sm80390ejc.99.2024.02.15.01.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 01:25:40 -0800 (PST)
Date: Thu, 15 Feb 2024 11:25:38 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC v3 1/4] dt-bindings: spmi: Add PMIC ARB v7 schema
Message-ID: <Zc3YkgrkauRcZfNB@linaro.org>
References: <20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org>
 <20240214-spmi-multi-master-support-v3-1-0bae0ef04faf@linaro.org>
 <ea9d31c4-e5c4-4869-8bf9-caef3dd32829@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea9d31c4-e5c4-4869-8bf9-caef3dd32829@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_012544_457288_06E18C28 
X-CRM114-Status: GOOD (  19.73  )
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

On 24-02-15 09:54:37, Krzysztof Kozlowski wrote:
> On 14/02/2024 22:13, Abel Vesa wrote:
> > Add dedicated schema for PMIC ARB v7 as it allows multiple
> > buses by declaring them as child nodes. These child nodes
> > will follow the generic spmi bus bindings.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline), work on fork of kernel
> (don't, instead use mainline) or you ignore some maintainers (really
> don't). Just use b4 and everything should be fine, although remember
> about `b4 prep --auto-to-cc` if you added new patches to the patchset.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time, thus I will skip this patch entirely till you follow
> the process allowing the patch to be tested.
> 
> Please kindly resend and include all necessary To/Cc entries.
> 

Forgot to run "b4 prep --auto-to-cc" AFTER I added the bindings patch.
Sorry about that. Will do it for the next version.

> 
> Best regards,
> Krzysztof
> 

