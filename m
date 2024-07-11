Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E406C3DA45
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jul 2024 21:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPw/SO2sSnfKID7p0VglZO30XRVzBtVu+U7rJuk0nik=; b=uEITPOLjeCOx3A8hazK4xooO2L
	WyfziJKV8dFSEk0Z+Y1RTU7iDpYx7tscJ/BqTHko3Ud6zQ7ZiTxFSuUPvYoJAjW1chkn8oC+UagA1
	kECz+o3VwXWBr3Tqr5IAwjKYZNpU/zF4R6Ym9Ipuxpq4c7ecNBGONM7/HKcvXXHNfGbde2AUhw0AV
	VppBd8tnNI69TRbA/2Wbe1yI0rYPoeMlsGG3nH37uV7ccBK8hz7T3sKgXlpkazkq5y+U5YXTopOoM
	Q30riRjffJqTIddHN5KaFW9tFG2Lj3QmmInEBFrKiTUR2Nd/Oh9XDIQUSi8vZZszU6SJdd9MIYQII
	mgJML/Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS0wO-0000000FQAR-3rYF;
	Thu, 11 Jul 2024 21:03:01 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS0wN-0000000FQ9h-00W9;
	Thu, 11 Jul 2024 21:03:00 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-70b3c0a00f2so1111755b3a.3;
        Thu, 11 Jul 2024 14:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720731777; x=1721336577; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TPw/SO2sSnfKID7p0VglZO30XRVzBtVu+U7rJuk0nik=;
        b=Am5yDy+ZxgED86RIeiSzl660zxnaacn0kcH9Z9W2cRJFWtJJsmSSdcAm14JSOUQRlM
         ZSBgEjen2GlgY8OAK/GYclKKYFov1NM4zx8sZ7AfRoVPYp9ZL1hcYFbbce1QUBPzzgHd
         ZxRrRK0Cpa5kT6jC9zi+wkkDUyrX5Ll536Lp/kV1+DmO7Z69Md04ahGtpi0d1UcVgTX3
         Ek6aLd9/vDMmyZ55KG5ajSBnkIDSSLnlgLgynkMK9DvMrVvn1jCB94E81NNo11wEN9Ia
         AUT2ik0y8ls0Plhv9zdZQyhNZW53x0jNmZFEX+n75nU5T1ih9Jl3pARYiHlynGGCy7Yp
         vb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720731777; x=1721336577;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TPw/SO2sSnfKID7p0VglZO30XRVzBtVu+U7rJuk0nik=;
        b=Clr1SjQx7qD2eO2V5cMTvRh+M1F30B4oDlABOYXD61oOFAXVORAItfxTPUpfmuSEqZ
         O8y8Ido4arAKBNx1q4JAyu8+mRvpSRdrQ4dkG9gESPUUo+jqVrfvO9M3wUNKTLyM2gVk
         qD5kehXccHdElXD5EL9b9qZVs2sjG4eqcEuFwDWKCm0Bq2WZ8xGRKVkVhekd5VFiqnng
         NQTLIdJZn5r0GjsOJR6VWXp9piU0txFSe6utKS1WqtpjEZv3Jz45HaqV/vylYbY9qdKk
         FIU/O4a4Ed0xzzQDotW9fCUY3+0LX1P9M90RnU7DKv9QUzwcOfQVSmPSHijP0vA+ZhQ9
         x9Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWZvERJcuG/Xq3wOcyaoSP45k2Q8XI4Btqfv5rDQWz5CCY95BbLb+Zf+NTyoD8UVmHGU5ufOOSXFCHCOwrJxTwnNDQPLpgoYYkLGez0zrh6+Rsqz5BnOfl/l2e7uxYCbp/IniyvLQc/sodDcWesk93QCSNVyxjwGVk=
X-Gm-Message-State: AOJu0YyNciHLX2FZvRdgg7pt5bisd64Me10KY45BWjeFdB3achoQzISq
	WWxTc1xn9QfO61g0ypF/RDq7jOnT8FykYv782JicCWoGziD8K9tT
X-Google-Smtp-Source: AGHT+IGdb0yZ9jv0Ip0mZjZRgjiQo6tr0WqPFqmNDoqYhcf4lY/3x6skldRaQwFgzPd+apnufW2qnA==
X-Received: by 2002:a05:6a20:a11c:b0:1c0:e1a5:9583 with SMTP id adf61e73a8af0-1c29821ac95mr10981697637.17.1720731777394;
        Thu, 11 Jul 2024 14:02:57 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net. [141.239.149.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6acf417sm54587155ad.265.2024.07.11.14.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 14:02:57 -0700 (PDT)
Date: Thu, 11 Jul 2024 11:02:55 -1000
From: "tj@kernel.org" <tj@kernel.org>
To: Boy Wu =?utf-8?B?KOWQs+WLg+iqvCk=?= <Boy.Wu@mediatek.com>
Cc: "boris@bur.io" <boris@bur.io>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"axboe@kernel.dk" <axboe@kernel.dk>,
	Iverlin Wang =?utf-8?B?KOeOi+iLs+mclik=?= <Iverlin.Wang@mediatek.com>,
	"josef@toxicpanda.com" <josef@toxicpanda.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] blk-cgroup: Replace u64_sync with blkg_stat_lock for
 stats update
Message-ID: <ZpBIfwThiVwstlXL@slm.duckdns.org>
References: <20240710061334.1888-1-boy.wu@mediatek.com>
 <Zo8HTD2AD-b51q0C@slm.duckdns.org>
 <6114fbad7bce9b15806bb9fee25a1075ecb53dd1.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6114fbad7bce9b15806bb9fee25a1075ecb53dd1.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_140259_077482_72B9B67D 
X-CRM114-Status: GOOD (  10.63  )
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

On Thu, Jul 11, 2024 at 02:25:29AM +0000, Boy Wu (吳勃誼) wrote:
...
> I can remove the 32bit only define, but I think we need to add back the
> u64 sync, because the spin lock and the u64 sync serve different
> purposes. The spin lock is for handling concurrent problems from
> different CPUs updating stats, and u64 sync is for updating 64 bits
> data and fetching 64 bits data from different CPUs in 32bit SMP
> systems.

Hmm... so what I'm suggesting is using u64_sync for the per-cpu stat
structure as they are guaranteed to have only one updater with irq disabled
and use a spinlock for the shared iostat which can have multiple updaters
and isn't accessed that frequently.

Thanks.

-- 
tejun

