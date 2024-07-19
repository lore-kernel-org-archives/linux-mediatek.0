Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEA6C3DA5D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jul 2024 17:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ZbMHz0p5DWuVseBb2N8rhX28Nxn5bBUC6D+VNe4hHM=; b=iag4NWzKSYe39aASVUrZsyufTP
	TFKyLEMErcU+yhLfl3e+csuruutfHT2Wb6FzFE/SuHEOxwFJ1IIlrJ1L29zqgJsY7R+3WzCSJfJfd
	+0KjDAFlIfz/o1APm6APRcU04in1+Nuq6mum1UmpveQ8ev39prfNyRoCId1m5fHKzitxoXpNO9QBQ
	MKwC/1CHrXIdaaLarOQlAndjKGRFb2cnQIat0lLeYyvpbCXbJ8oQUwmDFPl7MmazTr+eRsP8uUi78
	DTtgsjHP4B5TZp73xtLMYIO4P0b+pSUvfTnGzq2tHCCgXmNIEdidjMR94ES6pBC36TVivB82k+OMx
	t+Zqn5Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUrSY-00000003OYH-2831;
	Fri, 19 Jul 2024 17:31:58 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUrSW-00000003OXZ-0c4A;
	Fri, 19 Jul 2024 17:31:57 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1fc4fcbb131so19994225ad.3;
        Fri, 19 Jul 2024 10:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721410315; x=1722015115; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ZbMHz0p5DWuVseBb2N8rhX28Nxn5bBUC6D+VNe4hHM=;
        b=HgrA4gyUTaZ/JseE2y4DLJlaXonQhhUJxnkyWfH/5/9ZHWWlzRgJG1xdecH+O1iche
         YOLbmM93MPjobYdrbhZnMFd06L+dTdPvZBPmEyLMr2A2ieaSc8krP5orXYT8qij/C7fj
         90/0+5HMfo7JvwBypq+HkDqYSLQjA6TbEpmYo1Jk+jDwQtu37q+12IQvFa6U0nEoq8H9
         X85GHDm5GLkpXwGk57NV8NMIM/nVzb3ivtxzXpfRyC4kpBSQ5p/FudiBR0ib9NxELaux
         BUU2maOMFbHU96yD2MLHYOukkqAMWriNAtBJrYPwLKR1ckouT8wHfDhZePypB7GfJq7T
         RjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721410315; x=1722015115;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZbMHz0p5DWuVseBb2N8rhX28Nxn5bBUC6D+VNe4hHM=;
        b=cHhNSMVU7duKVs2H8G9dSqrdmYQVvFSud58HqOvB1NZtty7LJG99dgq0mC1skRmPrz
         FumUQWCBHKTtfA0S3ywOMdSKO/GnPqty1TCqYbklNOK1WHUMvES3ZmdyCLa5D60P6FSO
         l2dFmkVNUME+uUqrvWih3DvFpzWzxspynYXZ7e+JmZRrnVvUVk6kR24LuCIkhyQXQ0qd
         G9QWKVfXYJE8Vrly7aoC98I/fo+CbnKSHMRa8MrLuRdYQsMl7ykC/MwFPRKOqdOKQVAJ
         rwjHq+wvusnw6lhdXt0Mqeb+eLArk0qNKjJC4SHwxL7sSvRx8rT+jDGqcqXhwVuWjjLZ
         v+3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWD1xnVOUythIs2O+VjHwzltok3xf5vkgGudt+C6iOvuZxmqmlqehN5MHKHjR0fhwagqS5rLyyqH1mEiR6mAnlYPrRtsehUCrdau7gYRF/yR3Oo54fMjxpScY1Kfu+YjzS9T/QCHpFIXtVxGo7yMqoNjINP73QGgvg=
X-Gm-Message-State: AOJu0YxU7RN3CTNcvRUBG/HZrEAw4mVcIzoen8MsGHHT10nnSyXqL7Xm
	hjcWL9KGf4WVESweUdNaACzZN/vw/sRBI1UH0RarbdUulLukqJEd
X-Google-Smtp-Source: AGHT+IFsThoFkOXcqDTCyPseR9byS+0442uGUbWIB1NvdVDLi0q/DrexI8yvkm4IqTHzGS1Ss2DQJQ==
X-Received: by 2002:a17:902:ec91:b0:1f9:d0da:5b2f with SMTP id d9443c01a7336-1fd745879femr4471445ad.39.1721410315354;
        Fri, 19 Jul 2024 10:31:55 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net. [141.239.149.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f48875esm7196225ad.287.2024.07.19.10.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 10:31:54 -0700 (PDT)
Date: Fri, 19 Jul 2024 07:31:53 -1000
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
Subject: Re: [PATCH v4] blk-cgroup: Replace u64 sync with spinlock for iostat
Message-ID: <ZpqjCVxSAV-Q7Yhy@slm.duckdns.org>
References: <20240718084112.12202-1-boy.wu@mediatek.com>
 <ZpmF8HJsuefjC7Xr@slm.duckdns.org>
 <00c595a16b4e96ae56973ac2ce586f6ad736059f.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00c595a16b4e96ae56973ac2ce586f6ad736059f.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_103156_211142_4C93A0C9 
X-CRM114-Status: GOOD (  23.48  )
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

Hello, Boy.

On Fri, Jul 19, 2024 at 01:47:35AM +0000, Boy Wu (吳勃誼) wrote:
...
> If it is for readability, I think keeping using u64 sync instead of
> replacing it with spinlock is better, because what u64 sync protects is
> 64-bit data for 32-bit systems, while spinlock can be used for many
> other reasons. The root cause of this issue is just the incorrect use

Yeah, but it can't be used when there are multiple updaters.

> of u64 sync. Adding back the missing spinlock for the correct usage of
> u64 sync is simpler. Is there any benefit to replacing u64 sync with
> spinlock?

It doesn't make sense to protect u64_sync with a spinlock. Both are only
needed on 32bit. What's the point of having both? Also, note that iostat_cpu
is also updated from two paths - bio issue and stat reset. If you want to
keep that u64_sync, the only way to avoid possible deadlocks is adding
spinlock in the bio issue path too, which will be pretty expensive.

> > Also, for blkg_clear_stat(), we're running a slight chance of
> > clearing of
> > iostat_cpu racing against state updates from the hot path. Given the
> > circumstances - stat reset is an cgroup1-only feature which isn't
> > used
> > widely and a problematic interface to begin with, I believe this is a
> > valid
> > choice but it needs to be noted.
> 
> I don't get this part, but if this is another issue, maybe another
> patch would be better?

It's the same issue. Reset is another writer and whenever you have more than
one writers w/ u64_sync, there's a chance of deadlocks. So, iostat_cpu also
has two writers - bio issue and stat reset. If you want to keep using
u64_sync in both places, the only way to do it is adding spinlock protection
to both paths, which is an expensive thing to do for the bio issue path. So,
here, we'd rather just give up and let stat resetting be racy on 32bit.

Thanks.

-- 
tejun

