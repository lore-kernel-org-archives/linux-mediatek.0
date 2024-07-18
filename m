Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31BCC3DA49
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jul 2024 21:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0auihaX9QkuNb5Qm1JcvF0jC8t0q/ycofneQ+RbNug=; b=45+LHc3Dnr0RofHyya9pZSATed
	tuPqaCrfwiCwJtEDEMvpJrLxxzyaIJki3+F2R+2rEusJa8hijIr5acZouZI5N9QchzDD88lTatOxv
	o7koRgCeaO1Ctc0mwu7ur/iBez/UtBnNdlAoJF5lnj9vwMauTDzOZ9soSQ58Ex8o4DmDHmWhE5u82
	k/VnoKZIloZuVoT2eGdjq4XVFo6RyKpbARS7TH6LXVyCDzCWihxYCLdgr4AQQEdMu7cM8w9W0zgdE
	nfy4ufZyhMIbqeamM+19HzVLvZSUFH+fxj7ep2IehT//5+LkOTWwRCIEpiAuyotIKupv+akrarrDD
	g2m5Xu5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUYTh-00000000g5C-2s4d;
	Thu, 18 Jul 2024 21:15:53 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUYTL-00000000fza-2oCI;
	Thu, 18 Jul 2024 21:15:33 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-70af8062039so218944b3a.0;
        Thu, 18 Jul 2024 14:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721337330; x=1721942130; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/0auihaX9QkuNb5Qm1JcvF0jC8t0q/ycofneQ+RbNug=;
        b=Oc/Uv0fxP8Cvm6P+V8dWtcjrF7QxV6hOlu3J78S00Fnc1sLmVjinVWb7dGBFbwCTT8
         CARj6si2re6787vFkCMc//S0QHy/t9u5Fs7k+07hdhXJf1DpLfVCtfIZxuBOTOJ2lfTr
         dRnhxjImY40kv1ReDvBHmxG94XKUWcQR7Va0LpKsOzo+EeR1wLb9E4i09Y+0kFZV2mtS
         rioeEzDm+k2TZpFAY9VaF2LoRhgaHFWesL/RmPnRuC61hEJU6j8nceYn8CI/VtN05Vo4
         /wf6tVRE3e9xCKNozuf4VfQ4U1YjpBHmvZ3B/kv5PjVKQXVB51C5NPw/X+WmNMJowabL
         CU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721337330; x=1721942130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/0auihaX9QkuNb5Qm1JcvF0jC8t0q/ycofneQ+RbNug=;
        b=N4pXAfTjtvuj5y+EJAMV/ioN0E9/ShVfmaOXnHcN/0MSDP4T78PvJE/lky5UgW63Io
         ACDttmvpXDt4JLDDQghuZkIwg05Lrjz9lmDSSON3OemaV4rzZnUbQYEI2UlSXjIcsMt1
         jjR/UwDXfFCDVWVwVoS4u2VYOWK4d5K9F1yZ+gq+oOsEAmAgJsasyWXecrzlAHbjj6ok
         crk2NOjUoA3XFErgoJi8UbF94FsWe3AhDSWr15sADzg2CHyASXYsJvSDZeqqOpV7+VwH
         EoOCzzztV+O2cnNnTjaQosFBVDr9P87hoKspN8dpaYHshu8eXs1LtmUjZl+4vXlhbyw1
         yGlw==
X-Forwarded-Encrypted: i=1; AJvYcCWRzwymBIjT6FKnzXoJkkbipm0ZaqtjFtiKKLZqrioLu/Cp9k2PbC2TQEFCL9ShpaEjyBVHalHBflhdPUGK0KjlINi2LNgdS5hPf8ltG8IvkYB34XUPCUprUPqtNbElVnp5pxJEI73eCtfpbQLpwdgWCf8Wiw5h+aI=
X-Gm-Message-State: AOJu0Yx3oXeSS21ohnULm2fqlzlvv8n7MZLgSfxSCKBMfxjZPyrfzE4x
	crsyG90xrNMzOtSou8zxl2xCJ9gWIfNx+C4mQ/SqERXCFF0pn19bBSEfwQ==
X-Google-Smtp-Source: AGHT+IEzvKX6abFCuyAD2x0BS8ix3G4cXfdKksDDsoZuZtDnnZow0Vh1MnuqD3v6DJxjydy4SuuorQ==
X-Received: by 2002:a05:6a20:c901:b0:1c3:b2da:cdff with SMTP id adf61e73a8af0-1c3fdb10556mr6962771637.0.1721337330009;
        Thu, 18 Jul 2024 14:15:30 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net. [141.239.149.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd64b4a29bsm174255ad.15.2024.07.18.14.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 14:15:29 -0700 (PDT)
Date: Thu, 18 Jul 2024 11:15:28 -1000
From: Tejun Heo <tj@kernel.org>
To: "boy.wu" <boy.wu@mediatek.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Boris Burkov <boris@bur.io>, cgroups@vger.kernel.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, iverlin.wang@mediatek.com
Subject: Re: [PATCH v4] blk-cgroup: Replace u64 sync with spinlock for iostat
Message-ID: <ZpmF8HJsuefjC7Xr@slm.duckdns.org>
References: <20240718084112.12202-1-boy.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718084112.12202-1-boy.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_141531_729356_D6DDF626 
X-CRM114-Status: GOOD (  11.88  )
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

Hello,

On Thu, Jul 18, 2024 at 04:41:12PM +0800, boy.wu wrote:
>  static void blkg_clear_stat(struct blkcg_gq *blkg)
>  {
>  	int cpu;
>  
> +#if BITS_PER_LONG == 32
> +	guard(raw_spinlock_irqsave)(&blkg_stat_lock);
> +#endif

Can you please collect the ifdefs into a single place? If guard can be used
for that, that's great. If not, just spin_lock/unlock wrappers are fine too,
but please collect them into a single place and add a comment explaining why
this is necessary and why u64_sync isn't being used.

Also, for blkg_clear_stat(), we're running a slight chance of clearing of
iostat_cpu racing against state updates from the hot path. Given the
circumstances - stat reset is an cgroup1-only feature which isn't used
widely and a problematic interface to begin with, I believe this is a valid
choice but it needs to be noted.

Thanks.

-- 
tejun

