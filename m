Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC728C27C76
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 08:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J7ancMifNNyjJiTof8bzSGdh+LvtuOAZ/yhUxoIZ6EY=; b=rFa8odx5WlHcpLMK0X011BhnUj
	HmL63lN9g19bk+mfi5JTt0zbDwhM875J04D/3QVvkpR/QWR/eB/d+B0u9QYsIM5/GAvrHj9ea3PI0
	IaORJyJz/B75XjMe1SIqyAbT11tK6RbnIPwnGKlP0yqg9GSnTFb72VChuZqs58eFofkEtLM3cahDO
	KNSgzTMJ81IsHUaQzvO1k9s9oNtAg7VZwF90oqaDvNGsuIoOsramI09TEucPDW/qGZAQR6w6ke6yE
	EnjFqCAxZjjIcVTBv7Zz5EUq/znCGHbbRNduyiQ1WgzbMWIeWxbiv7XL5klvtVf1SSZrQB2oiKefJ
	aQdiBpWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKbPJ-006VDi-48; Wed, 25 Jan 2023 08:45:25 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKbPG-006VCW-00
	for linux-mediatek@lists.infradead.org; Wed, 25 Jan 2023 08:45:23 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-4ff7c6679f2so147824667b3.12
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Jan 2023 00:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=J7ancMifNNyjJiTof8bzSGdh+LvtuOAZ/yhUxoIZ6EY=;
        b=l/hcCYqvcIly8bHSP154OLa3geKFmW7WOJHtqW6QP0WOiQCkjUgO6NFBclTznfTfXd
         q/KZ4uqcFfz6e/A7WhMCPvMZlY7cpI5ZXPygAYrMACNGYIbdZdn2/wrvbiLbPFMi0EJU
         e2xhTpttA9V49soY/4kK5pbOiY/jtu7/UBbsL9M2oZElpThGo5ueYxij1daBdATn/U6J
         lFgz4QPoUTVqu2tO2Jv29c+EKfKlUr82uf6j5jrJG0K4kH7t4tXslYBl2iUfCiGyJg2L
         sa2ZzT9fi8Nbfwma/h4EwurZmwhJrp5hy3f2wiTWrdCgSBqaWH+IxEwCQ2mYpS41PmTz
         ZJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J7ancMifNNyjJiTof8bzSGdh+LvtuOAZ/yhUxoIZ6EY=;
        b=g2zjmr3fTAR3N54KyCsO0F9uVSyolWC9YNc7wcbrh1QhBr0/SMQIUtRsdAeMgnjjX1
         tSoH+ndldE64xgdFhVC/cZEeENSY3m5o9QPGA+EMUzwZRb++KVQLo7OAiNs+dVvc5PBU
         3HjRSNwTe4ieJIp7hxCVqxSsOm8UI7GPbxQJ6hY08k6/NjkM4CRuCMGBiwMuwQoCk5iN
         ojSGskFzGfawYNWW/CyC5PoILtzV30CnN1n7Q1O7tCch8S10GpW8ZyDgDJTEWMJ/c9rY
         Poh/+pj/+Z+eADfqYChz+2CO1bG98VTgzt1HZNX18TmMU3fRUZOH+deL12rXCAppBYD6
         pFkg==
X-Gm-Message-State: AFqh2komL4LVQrc+zXvCBvcPRSZQ2OkQEGeOcl+fRVFLHPiwp9RrsRU1
	dEBqse78YwuVoyikMEoaymplM8GKb8M=
X-Google-Smtp-Source: AMrXdXslOvF1txeQ7QJk1q8MehIUDQnhzGgaj+Ckxm4gdtDkml40uAzU8COPOn8c5wwtHui85E8JZje3JZk=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f7b0:20e8:ce66:f98])
 (user=surenb job=sendgmr) by 2002:a0d:ca88:0:b0:501:80db:3eca with SMTP id
 m130-20020a0dca88000000b0050180db3ecamr2010555ywd.100.1674635950405; Wed, 25
 Jan 2023 00:39:10 -0800 (PST)
Date: Wed, 25 Jan 2023 00:38:51 -0800
In-Reply-To: <20230125083851.27759-1-surenb@google.com>
Mime-Version: 1.0
References: <20230125083851.27759-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.405.gd4c25cc71f-goog
Message-ID: <20230125083851.27759-7-surenb@google.com>
Subject: [PATCH v2 6/6] mm: export dump_mm()
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: michel@lespinasse.org, jglisse@google.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mgorman@techsingularity.net, dave@stgolabs.net, 
	willy@infradead.org, liam.howlett@oracle.com, peterz@infradead.org, 
	ldufour@linux.ibm.com, paulmck@kernel.org, luto@kernel.org, 
	songliubraving@fb.com, peterx@redhat.com, david@redhat.com, 
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
	selinux@vger.kernel.org, alsa-devel@alsa-project.org, kernel-team@android.com, 
	surenb@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_004522_041988_F557DE0B 
X-CRM114-Status: UNSURE (   7.86  )
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

mmap_assert_write_locked() is used in vm_flags modifiers. Because
mmap_assert_write_locked() uses dump_mm() and vm_flags are sometimes
modified from from inside a module, it's necessary to export
dump_mm() function.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/debug.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/debug.c b/mm/debug.c
index 9d3d893dc7f4..96d594e16292 100644
--- a/mm/debug.c
+++ b/mm/debug.c
@@ -215,6 +215,7 @@ void dump_mm(const struct mm_struct *mm)
 		mm->def_flags, &mm->def_flags
 	);
 }
+EXPORT_SYMBOL(dump_mm);
 
 static bool page_init_poisoning __read_mostly = true;
 
-- 
2.39.1


