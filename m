Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD65C54E94
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 16:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49H+5dcfdqsESvQ4qNxkOgTxyGkRYtaMvRra0jMgwoI=; b=2Dsu4epB04YzFjey/fZT26DC0F
	LuWEWQcrplSLQMvC/0XR/G+nsd2QuWSJrhAT6/qgegxz88ehq0Or0TmnE41vPr2b0aE+urgeXK8+6
	jpnbcCWiPwdqv9WXqhOP4/rXEFWjwqzvV96V/lWBplathzqFtw6WI8JGMpKjQ3Wos8ikL2Eep/x97
	dnnsGviAUkluOWW7AMY/DrpVS7gcrsqhJ45mvRkKUO88Mco0mn9q6cY42G95z/3+fLLhSTFExXsos
	nNAlwzNIZpT4ay2SL1J4p6tEMhyBxNAywpm7I3iF/qXKAV3+J9WBnqA5tdgqgK5vaESCw+ywl/Laj
	FxbP4wRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKj3d-00868m-Rd; Wed, 25 Jan 2023 16:55:33 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKj3W-00861I-EJ
	for linux-mediatek@lists.infradead.org; Wed, 25 Jan 2023 16:55:30 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-4ff1fa82bbbso225687797b3.10
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Jan 2023 08:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=49H+5dcfdqsESvQ4qNxkOgTxyGkRYtaMvRra0jMgwoI=;
        b=S433Z2p/j0oEnqzhdMbCoBVS6yLsoVuhPxi7PQkxnyRK8RoE5tlGqQCWFiSx/y2EvP
         VAUU6f5te6yd0FF3QKoXQk59fXSc40Ni99FjmOhoS8uoMeuhfG+AT8hg6vTHrAcNtls7
         iMIrnMdjSfEnhMBuERTLvpM6IdVwE9wobd2Cb3XY0VBKEUGGTBatMri522T6kyoxGdRv
         R/YHI2CzXA+66ssNNRD0kBHVPl8TI5ear6XOrgI2lTdtmT0YpMoSddNSDob6lG0ADoLk
         +xTQAwFZ3i/oeH+aroOYDwlOGwYRh8N7mvnq0HFpqRIYUl+jcTUyG7X+0g74P9WaFx1x
         4nDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49H+5dcfdqsESvQ4qNxkOgTxyGkRYtaMvRra0jMgwoI=;
        b=HMGAKyFppk0wvx4719j4fQMtluSLgkdl1Q/XC1I3K6U+9bWuzpaH3Y5pgCMW8O/xET
         DRvW7QJ/LOnja9naeeXqubzddGIq/S3JEfA2WoFYGnUO9a2KZcY9AKxVUNnkSbJULo2M
         lup3y3V1sd20wbP4jo7hEMvzD+52+gFrGFj70ieEd9sYqBX0w69ySOF7djUOvddTESjV
         lVXBwA7RKtADGPzD5FDjWC7FArQqSPNr5RY2UiktEQLNjwP0jkl2XHGqIUbyxdzgFAOe
         T4MmiCi31TTMaXV5wqilYyOOB99yYymhAbj4caFL7pIsZzrsIVNO/cl9DNQx43aT/j12
         uUcQ==
X-Gm-Message-State: AO0yUKXNOg8FNpUR8GGxMrj+VlNb+qgJTLzWWBYso+n7RqxblZdJo52X
	whmy4LX6MLQAy2AXbLsV2+6G/0SJfWQLe1qd0S71Dg==
X-Google-Smtp-Source: AK7set/FwLbWx6yiqkzvjcGbe3t+VxnD8xj+/iXHUbjRIwB0jRkvrcCR+VhH4DhOMzxTzJJlzd0h1TxaYfABci/YfRk=
X-Received: by 2002:a0d:d456:0:b0:507:26dc:ebd with SMTP id
 w83-20020a0dd456000000b0050726dc0ebdmr239978ywd.455.1674665724181; Wed, 25
 Jan 2023 08:55:24 -0800 (PST)
MIME-Version: 1.0
References: <20230125083851.27759-1-surenb@google.com> <20230125083851.27759-4-surenb@google.com>
 <Y9D2zXpy+9iyZNun@dhcp22.suse.cz>
In-Reply-To: <Y9D2zXpy+9iyZNun@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 25 Jan 2023 08:55:12 -0800
Message-ID: <CAJuCfpG7KWnj3J_t4nN1R4gfiM5jgjsiTfL55hNa=Uvz4E835g@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] mm: replace vma->vm_flags direct modifications
 with modifier calls
To: Michal Hocko <mhocko@suse.com>
Cc: akpm@linux-foundation.org, michel@lespinasse.org, jglisse@google.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mgorman@techsingularity.net, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	peterz@infradead.org, ldufour@linux.ibm.com, paulmck@kernel.org, 
	luto@kernel.org, songliubraving@fb.com, peterx@redhat.com, david@redhat.com, 
	dhowells@redhat.com, hughd@google.com, bigeasy@linutronix.de, 
	kent.overstreet@linux.dev, punit.agrawal@bytedance.com, lstoakes@gmail.com, 
	peterjung1337@gmail.com, rientjes@google.com, axelrasmussen@google.com, 
	joelaf@google.com, minchan@google.com, jannh@google.com, shakeelb@google.com, 
	tatashin@google.com, edumazet@google.com, gthelen@google.com, 
	gurua@google.com, arjunroy@google.com, soheil@google.com, 
	hughlynch@google.com, leewalsh@google.com, posk@google.com, will@kernel.org, 
	aneesh.kumar@linux.ibm.com, npiggin@gmail.com, chenhuacai@kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, richard@nod.at, anton.ivanov@cambridgegreys.com, 
	johannes@sipsolutions.net, qianweili@huawei.com, wangzhou1@hisilicon.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org, 
	airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, l.stach@pengutronix.de, 
	krzysztof.kozlowski@linaro.org, patrik.r.jakobsson@gmail.com, 
	matthias.bgg@gmail.com, robdclark@gmail.com, quic_abhinavk@quicinc.com, 
	dmitry.baryshkov@linaro.org, tomba@kernel.org, hjc@rock-chips.com, 
	heiko@sntech.de, ray.huang@amd.com, kraxel@redhat.com, sre@kernel.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, tfiga@chromium.org, 
	m.szyprowski@samsung.com, mchehab@kernel.org, dimitri.sivanich@hpe.com, 
	zhangfei.gao@linaro.org, jejb@linux.ibm.com, martin.petersen@oracle.com, 
	dgilbert@interlog.com, hdegoede@redhat.com, mst@redhat.com, 
	jasowang@redhat.com, alex.williamson@redhat.com, deller@gmx.de, 
	jayalk@intworks.biz, viro@zeniv.linux.org.uk, nico@fluxnic.net, 
	xiang@kernel.org, chao@kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca, 
	miklos@szeredi.hu, mike.kravetz@oracle.com, muchun.song@linux.dev, 
	bhe@redhat.com, andrii@kernel.org, yoshfuji@linux-ipv6.org, 
	dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com, perex@perex.cz, 
	tiwai@suse.com, haojian.zhuang@gmail.com, robert.jarzmik@free.fr, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	linux-graphics-maintainer@vmware.com, linux-ia64@vger.kernel.org, 
	linux-arch@vger.kernel.org, loongarch@lists.linux.dev, kvm@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-sgx@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-acpi@vger.kernel.org, 
	linux-crypto@vger.kernel.org, nvdimm@lists.linux.dev, 
	dmaengine@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	xen-devel@lists.xenproject.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-rdma@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-accelerators@lists.ozlabs.org, sparclinux@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev, 
	target-devel@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-aio@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-ext4@vger.kernel.org, devel@lists.orangefs.org, 
	kexec@lists.infradead.org, linux-xfs@vger.kernel.org, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, kasan-dev@googlegroups.com, 
	selinux@vger.kernel.org, alsa-devel@alsa-project.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_085526_497507_C36916BB 
X-CRM114-Status: GOOD (  16.97  )
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

On Wed, Jan 25, 2023 at 1:30 AM 'Michal Hocko' via kernel-team
<kernel-team@android.com> wrote:
>
> On Wed 25-01-23 00:38:48, Suren Baghdasaryan wrote:
> > Replace direct modifications to vma->vm_flags with calls to modifier
> > functions to be able to track flag changes and to keep vma locking
> > correctness.
>
> Is this a manual (git grep) based work or have you used Coccinele for
> the patch generation?

It was a manual "search and replace" and in the process I temporarily
renamed vm_flags to ensure I did not miss any usage.

>
> My potentially incomplete check
> $ git grep ">[[:space:]]*vm_flags[[:space:]]*[&|^]="
>
> shows that nothing should be left after this. There is still quite a lot
> of direct checks of the flags (more than 600). Maybe it would be good to
> make flags accessible only via accessors which would also prevent any
> future direct setting of those flags in uncontrolled way as well.

Yes, I think Peter's suggestion in the first patch would also require
that. Much more churn but probably worth it for the future
maintenance. I'll add a patch which converts all readers as well.

>
> Anyway
> Acked-by: Michal Hocko <mhocko@suse.com>

Thanks for all the reviews!

> --
> Michal Hocko
> SUSE Labs
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>

