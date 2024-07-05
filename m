Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6372C3271E
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 18:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVFbWqs/ujGoWS6V+Wtmkt0OqRspry6ZAA+kHzk0dpg=; b=WXKBlLTCODnNt1D7cMTb6SlZlw
	gCy4fukfbMaueZRdqCcP4Y1r9VPGoiaxJQFknmeEAcPK+fMQ18CdUb0i5jSl6Q/6+9EmRgmbBI2Yh
	c3A6bzDtlOt7x+J5b3z1bAAlp17G1pvcQZd6wXXwBHorjQqZxTtEzdMO+QTQY3KuJePgJfQki8Ndv
	Hw05u7ROBh3Y6UNBQcXM1bi3sy39R0WscxPk7hDeZdziFoiuP6/R84EP7WgvDdhCK+D34j0lcrx+0
	DilhtG9JbId/nAMuOtmebqK6VdHNcwQqWMbA0iQnik2KBP16jj7gxNXeQHowAHR8AzhB4tNGZnfM5
	s3CNdiuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPnTe-0000000GcMN-3r9s;
	Fri, 05 Jul 2024 18:16:10 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPmV4-0000000GWDy-0DMJ;
	Fri, 05 Jul 2024 17:13:35 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1f9fb3ca81bso12101625ad.3;
        Fri, 05 Jul 2024 10:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720199612; x=1720804412; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jVFbWqs/ujGoWS6V+Wtmkt0OqRspry6ZAA+kHzk0dpg=;
        b=B94qL1v6HvVe5VTNBABzswtMD1+nn5CUbFaS2XWXGZyPU8DZL0Kr4pgq0AqSriU3wH
         /I0ae1IEa4vc/Q0AF4UHkNa+DUGBzXClm0FoZVLpbDuZpsPInhMzMdDnZX4VbFVVP2JA
         YUqoUP+fo/I44xT379EVnTn3yDwIKbIQO0db0WQHSIlzY5EyXlVVIOx5Q6w8Y/jmWiwE
         k13j5+bIZmhQAFAZSmRs7/l8TrGWp8F4ovRZth9yF8QXdcHZWuQKfl3dlU14YdZNcMNY
         Vl9HZ7O6bRcvy/SdcHZFj8gkX0SD/ocpmPNTejXZGkGZaQ0vWESn+5bcpXPgcnvzEE9M
         VKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720199612; x=1720804412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVFbWqs/ujGoWS6V+Wtmkt0OqRspry6ZAA+kHzk0dpg=;
        b=Q6b0YDJBQOzeJAjO1pOu0kux9Dk3PGAcMyF+EgzuJWDenwIPrN+1zDgCTjKfoIMCYJ
         EX+TVRhThc1aObW/Y/rlFltddWC519e/khIOSXpYcr5q8DRxALn9y03wb/ssW/UojzTw
         DuYPjFt8aY42nv7LdD3Xe0l2mHZTS9IhTI/vdUn5BzL0HCUG8nqBEgJ9JRctYmEJaKk1
         gm4GX+694H6NcShiW7qFf+QXd/PRS+zD5/R1q0W5G1CzK8VWryx6Rd2riRfNKvWtF/d4
         MyegjmELMRWzbrktZz45Jxr6MwdSvXEeVjnEWrRyGQAnUdYLmdMOZOOJWfDappiIESkF
         RIdw==
X-Forwarded-Encrypted: i=1; AJvYcCUU1uoVF/Yo4QxORUTdyJWR7NNDGBE11NXnK+U4IzS+bHkDH1PePaWEeWmamV+9xPJLf1Q9EURVFqTdqb9wM8Za/hfE8cpe2BwztmmxuSa8HREvHMLMXVdp1HkiOqqNcys35F56QX0CWWQUYqqPzZVQ/gZXYqAvonw=
X-Gm-Message-State: AOJu0YxSzwyLncrN1JmRGe4LAtQCcQ5DLCrjMPmrugNCM58G+1dWXijs
	8kpmiOkGrf+ndqzmYV9zyEg3t37n+oH2UkJkokimV7Ek7hfIaT1v
X-Google-Smtp-Source: AGHT+IH31dSGm35koHtTUahNqqOpbaEin66n8iLUwVNuXlEOt+qvmQRWPJFKWZW/d4uoEwNBfCOkVQ==
X-Received: by 2002:a17:902:6805:b0:1fb:3474:9527 with SMTP id d9443c01a7336-1fb34749830mr30241585ad.25.1720199612155;
        Fri, 05 Jul 2024 10:13:32 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net. [141.239.149.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb57299335sm10136725ad.128.2024.07.05.10.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 10:13:31 -0700 (PDT)
Date: Fri, 5 Jul 2024 07:13:30 -1000
From: Tejun Heo <tj@kernel.org>
To: "boy.wu" <boy.wu@mediatek.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Boris Burkov <boris@bur.io>, cgroups@vger.kernel.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, iverlin.wang@mediatek.com
Subject: Re: [PATCH] blk-cgroup: add spin_lock for u64_stats_update
Message-ID: <Zogpum23mjHZC8yO@slm.duckdns.org>
References: <20240705075544.11315-1-boy.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240705075544.11315-1-boy.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_101334_149572_E8295914 
X-CRM114-Status: GOOD (  11.04  )
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

On Fri, Jul 05, 2024 at 03:55:44PM +0800, boy.wu wrote:
> From: Boy Wu <boy.wu@mediatek.com>
> 
> In 32bit SMP systems, if the system is stressed on the sys node
> by processes, it may cause blkcg_fill_root_iostats to have a concurrent

What is sys node?

> problem on the seqlock in u64_stats_update, which will cause a deadlock 
> on u64_stats_fetch_begin in blkcg_print_one_stat.

I'm not following the scenario. Can you please detail the scenario where
this leads to deadlocks?

Thanks.

-- 
tejun

