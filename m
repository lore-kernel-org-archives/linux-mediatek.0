Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF120E7718B
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2025 18:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KcsYGT2jr/Cwk+E0bZ78S9/+2iE2NBGtFjNzzo30vdQ=; b=qrjkHb21HIyjifjwHNDj4b6f6z
	fKPlS9F3D4JbY1kuiB39u72LBk6CIvBSxzpxFYdLP9FpaT+cGpZmYF8rIZYEorbjJZHrA/4ihUu9J
	WIPT/Ad0Su/THgSe21nF+XY0wCKLqwbYT4o3fmbrGhCULP1CDMF+Mt1xSQvWKD8N7rzAp0NzgWhpB
	uVAuYIeLIsy+iGIop4hABzKuSt+O1AfGYxV9MopLUqhfCsJQ+f3ivceAqheAmvrLgsTThzFnp78gh
	dqF07vuLoGRjHGSB3tFhRGI0+KMUl4PE5ME+GFZS7Ew+agkzbWygtlnxaWg06qlLrJTKTSNW27zAl
	Xh9DfmXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTPlB-0000000B67K-2iH2;
	Thu, 02 Jan 2025 18:17:29 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTPl9-0000000B66v-1nqF
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Jan 2025 18:17:28 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21619108a6bso147268035ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Jan 2025 10:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735841846; x=1736446646; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KcsYGT2jr/Cwk+E0bZ78S9/+2iE2NBGtFjNzzo30vdQ=;
        b=OgOkEC70nxucWCVDmoJEco2Zk55/ziW3wm9XHbyc2fbGDjdwR6vXYb13ldEeMF60tf
         32FXWV2KLYuRK2qiQdf03PKJQDaiICTyvj21tGQa2Za+c5d2Adp1dJRtHCv1sCmeMuM4
         TIecObQ8Cwj5Y7lGmvUox1Z0k8QSu4SAexmjMvy8cTPoSWFYQenourm5/n+mtqPel/Dt
         gQA9VkBD1WPGfs+GCA2AedcwPCiPSUbKTl5qNvCVUoio9wmGljPhEWWFIlANZ7X8yl9/
         b87tWou4laN62koIYLqxVR3ph+I196LKgqyMrhPjHCEU6yAzEn6v4ZAozOr4DjH71kUH
         +EUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735841846; x=1736446646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcsYGT2jr/Cwk+E0bZ78S9/+2iE2NBGtFjNzzo30vdQ=;
        b=f7++a2geJds3g3LwoYh8+oJfKT97aDTmqlh8t/g4AKkASBftigtN3unMSyhXxUB8Yi
         M4+mhbF0qBqRZmpEsBCQeenNaMFxZFdHt3uW61dPopffOay+VcingGqc9g65gKzlMBYw
         k4d2zmQgPvt11p15aKtepn4Y/thQ2MI5v/Po7Rxu1wSo4TsO19v6VNb0kPBi9bdELQOM
         LtPEpJa6QplVekNZeUqgQj38tBeAWZ+QeNDCln7bI5HVCHS6tCOjLDSttOw606eL8GGb
         sAMvoUe8a4TNsvuljvSglWwQNfTF5Nf87/+VUq/uFKIvM0Cl0P5gtvocE4HYCa5m3x7j
         4eJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVImFhcyYEYPMQsnJt1/LBAVEba0/+vqJuWkCqPWGLA3ljd1j2jlQ6hOs2gIPnt933abAyi008O3R422Oq8bw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIlwHAaiLsrdvJZj7dW7J7hkS1hkWL6O0bRUQNY6dNVbJ+UqN8
	HSqCnIkEBur0fUX2vLrzm4hi6uAskGbA2iLGren+SbOS4v4eFbnj
X-Gm-Gg: ASbGncs8k6WAs/OPld0lUCq1gNj6QdRMD/Dv8ZfgRU96sDXBVp3PGE6+fM22KEttzrr
	0/pmKULDi4mJZQXTSvRamf7KIYSRpKuPRIw2PT2+D4TLVDjDZTUrjgn6Do0Fv+a6QTQcsbJAuat
	f2oVIOe6uIooF6Kx3cpmsOypJ7RNTkzrr5uKjoesFU1+cn27FvMNSed+OHPvpqD9BzVVs+VKvrV
	raSJmD1CD++qaQSOTRSN9eJoRsfSUDTNW1ZwgBP/AERe7yygil8DKPfmEqN
X-Google-Smtp-Source: AGHT+IGUftEvjzgeM5eRfZJQJDkV96dM36oyQ3FUyp6cKSKianTN7IVhYXtyu9gI0RnxWUv7Qt/Czg==
X-Received: by 2002:a05:6a21:78a5:b0:1e1:a0b6:9882 with SMTP id adf61e73a8af0-1e5e046331fmr66924613637.17.1735841845904;
        Thu, 02 Jan 2025 10:17:25 -0800 (PST)
Received: from smc-140338-bm01 ([149.97.161.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad816305sm24535993b3a.31.2025.01.02.10.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 10:17:25 -0800 (PST)
From: Fan Ni <nifan.cxl@gmail.com>
X-Google-Original-From: Fan Ni <fan.ni@samsung.com>
Date: Thu, 2 Jan 2025 18:17:22 +0000
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-sound@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-block@vger.kernel.org, linux-cxl@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net, arm-scmi@vger.kernel.org,
	linux-efi@vger.kernel.org, linux-gpio@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-serial@vger.kernel.org, netdev@vger.kernel.org,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Alison Schofield <alison.schofield@intel.com>
Subject: Re: [PATCH v4 01/11] libnvdimm: Replace namespace_match() with
 device_find_child_by_name()
Message-ID: <Z3bYMiOG0u3Jtv3h@smc-140338-bm01>
References: <20241211-const_dfc_done-v4-0-583cc60329df@quicinc.com>
 <20241211-const_dfc_done-v4-1-583cc60329df@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211-const_dfc_done-v4-1-583cc60329df@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_101727_489136_2E9B480B 
X-CRM114-Status: GOOD (  16.29  )
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

On Wed, Dec 11, 2024 at 08:08:03AM +0800, Zijun Hu wrote:
> From: Zijun Hu <quic_zijuhu@quicinc.com>
> 
> Simplify nd_namespace_store() implementation by
> using device_find_child_by_name().
> 
> Reviewed-by: Alison Schofield <alison.schofield@intel.com>
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---
>  drivers/nvdimm/claim.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/nvdimm/claim.c b/drivers/nvdimm/claim.c
> index 030dbde6b0882050c90fb8db106ec15b1baef7ca..9e84ab411564f9d5e7ceb687c6491562564552e3 100644
> --- a/drivers/nvdimm/claim.c
> +++ b/drivers/nvdimm/claim.c
> @@ -67,13 +67,6 @@ bool nd_attach_ndns(struct device *dev, struct nd_namespace_common *attach,
>  	return claimed;
>  }
>  
> -static int namespace_match(struct device *dev, void *data)
> -{
> -	char *name = data;
> -
> -	return strcmp(name, dev_name(dev)) == 0;
> -}
> -
>  static bool is_idle(struct device *dev, struct nd_namespace_common *ndns)
>  {
>  	struct nd_region *nd_region = to_nd_region(dev->parent);
> @@ -168,7 +161,7 @@ ssize_t nd_namespace_store(struct device *dev,
>  		goto out;
>  	}
>  
> -	found = device_find_child(dev->parent, name, namespace_match);
> +	found = device_find_child_by_name(dev->parent, name);

Looks good to me.
Just one general question.
The function device_find_child checks parent and parent->p, but
device_find_child_by_name only checks parent although they share the
code except the match function. Why that?

Fan
>  	if (!found) {
>  		dev_dbg(dev, "'%s' not found under %s\n", name,
>  				dev_name(dev->parent));
> 
> -- 
> 2.34.1
> 

-- 
Fan Ni (From gmail)

