Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782DDC54E94
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 09:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gBh0+9Ej4fdZiBcL1FEtjjBddEyxpct0JkyXcSRf3Wg=; b=z9LlnT0gNCqpF9fK448eglU3DS
	mW+DIm3JiCd7ztq2zFSwQsuCOvJGFfozh9G/o1qbCajDa85QJqqzafK/cQG6CdSswkgFV4EV5YhYX
	yhUo0GrKitC9EJaLSAzsdfTe/+Q4sdkUd+y+Y1wkDETCNGgjFpKAcNk1OSggTAGPFS4IWiHMtfC3X
	NyZbWPvVWpBoS6X2nzWSQe5D5um8uFitybfylWnFpGKw0FHGQmCS8EspVCkhMroRXCZbBXQ3ZdLJf
	V5MVjgIZw/xbwA74mgpyMP+mEdEPys0R4S9lf085252bGaeR8oTnG3MGEaYHiLdatmslx2QG9XFfQ
	nk3TbSMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKcLe-006geK-S4; Wed, 25 Jan 2023 09:45:42 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKbJ4-006U8z-Ia
	for linux-mediatek@lists.infradead.org; Wed, 25 Jan 2023 08:39:00 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5066df312d7so9487047b3.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Jan 2023 00:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gBh0+9Ej4fdZiBcL1FEtjjBddEyxpct0JkyXcSRf3Wg=;
        b=lB4btchvNlTfCRHflexrgCXbRXFvyy8g1gFK/OMeKiIJNh1tqeN9E/OUXMnf2U4uji
         YYT9ZG6Uz9BNIXcJPuB6IBGSNwEdssClBGTD7I8F8xN9feCnsNR77DeUemH49gSW7JIZ
         i8Fyk+8dX7xmZBgb/4LlxS50DWuY+p/ZAvE5rke3AXUvgG50Y7E3pTP3J2Z3NRLwRPG+
         tuCoTtjvQeclLyeusopPtZIO8LUuu13+9dnLJ2g+6d0g96WjPTO8eD8l7HbwyilzSGVH
         oGzLOV4is7gwgAYTgd7llD5IZe+pWMCF81FsE6KNSAjCT9NY1E+DcM18ZvHUvuruVpcX
         WOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gBh0+9Ej4fdZiBcL1FEtjjBddEyxpct0JkyXcSRf3Wg=;
        b=lU93lsgRsanj5PO2fnMTLqdW4rBSytsGKrs/47PwkVez3XCqv8sewbNZsKEinmWXvn
         kX81ATFWfE2UldkqnFPcgjAivssfxM8Vro45MY/0VSuqwWNg7u9U68DBClHf8oAlz5Jk
         D9LUyiPM5aO1IG6nr9xyczdpCx7ABRcWr/dU+psL2emUE4tv+YQUwrBIsYKcirIpfWTh
         i+dwYcVhswYAhpsO0h+upZGk9LjBCTEsTiCHzGgvxCU4DyA1j1Oli+GHJ/Z4rmofeRfC
         miqnOom2LnnYD5LKJ6J/eX0hlspBN8Gel3sK0vkS4fVCV366fhMHgM4nbH0kKrJcBPVM
         MFPA==
X-Gm-Message-State: AFqh2kq46/E6t6CUi+CAQvD+jpAGtKL6Go8cFZEh6OX6nRprQe/RUQsj
	AMReDg5BahWMX1U1XLxIFotUl/jdufY=
X-Google-Smtp-Source: AMrXdXtLI+TT5dUaC9pRI2aKjkmKt7tjdC79b+se6AwZUh4jJJgCSUqcAubWc2ByjewYclrfSPgwiLKmrmw=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f7b0:20e8:ce66:f98])
 (user=surenb job=sendgmr) by 2002:a05:6902:34f:b0:6f9:7bf9:8fc7 with SMTP id
 e15-20020a056902034f00b006f97bf98fc7mr3373858ybs.279.1674635936246; Wed, 25
 Jan 2023 00:38:56 -0800 (PST)
Date: Wed, 25 Jan 2023 00:38:45 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.405.gd4c25cc71f-goog
Message-ID: <20230125083851.27759-1-surenb@google.com>
Subject: [PATCH v2 0/6] introduce vm_flags modifier functions
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
X-CRM114-CacheID: sfid-20230125_003858_677993_17956494 
X-CRM114-Status: UNSURE (   9.37  )
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

This patchset was originally published as a part of per-VMA locking [1] and
was split after suggestion that it's viable on its own and to facilitate
the review process. It is now a preprequisite for the next version of per-VMA
lock patchset, which reuses vm_flags modifier functions to lock the VMA when
vm_flags are being updated.

VMA vm_flags modifications are usually done under exclusive mmap_lock
protection because this attrubute affects other decisions like VMA merging
or splitting and races should be prevented. Introduce vm_flags modifier
functions to enforce correct locking.

[1] https://lore.kernel.org/all/20230109205336.3665937-1-surenb@google.com/

The patchset applies cleanly over mm-unstable branch of mm tree.

My apologies for an extremely large distribution list. The patch touches
lots of files and many are in arch/ and drivers/.

Suren Baghdasaryan (6):
  mm: introduce vma->vm_flags modifier functions
  mm: replace VM_LOCKED_CLEAR_MASK with VM_LOCKED_MASK
  mm: replace vma->vm_flags direct modifications with modifier calls
  mm: replace vma->vm_flags indirect modification in ksm_madvise
  mm: introduce mod_vm_flags_nolock and use it in untrack_pfn
  mm: export dump_mm()

 arch/arm/kernel/process.c                     |  2 +-
 arch/ia64/mm/init.c                           |  8 +--
 arch/loongarch/include/asm/tlb.h              |  2 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c            |  5 +-
 arch/powerpc/kvm/book3s_xive_native.c         |  2 +-
 arch/powerpc/mm/book3s64/subpage_prot.c       |  2 +-
 arch/powerpc/platforms/book3s/vas-api.c       |  2 +-
 arch/powerpc/platforms/cell/spufs/file.c      | 14 ++---
 arch/s390/mm/gmap.c                           |  8 +--
 arch/x86/entry/vsyscall/vsyscall_64.c         |  2 +-
 arch/x86/kernel/cpu/sgx/driver.c              |  2 +-
 arch/x86/kernel/cpu/sgx/virt.c                |  2 +-
 arch/x86/mm/pat/memtype.c                     | 14 +++--
 arch/x86/um/mem_32.c                          |  2 +-
 drivers/acpi/pfr_telemetry.c                  |  2 +-
 drivers/android/binder.c                      |  3 +-
 drivers/char/mspec.c                          |  2 +-
 drivers/crypto/hisilicon/qm.c                 |  2 +-
 drivers/dax/device.c                          |  2 +-
 drivers/dma/idxd/cdev.c                       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c     |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c       |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  4 +-
 drivers/gpu/drm/drm_gem.c                     |  2 +-
 drivers/gpu/drm/drm_gem_dma_helper.c          |  3 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        |  2 +-
 drivers/gpu/drm/drm_vm.c                      |  8 +--
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.c       |  4 +-
 drivers/gpu/drm/gma500/framebuffer.c          |  2 +-
 drivers/gpu/drm/i810/i810_dma.c               |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  4 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c        |  2 +-
 drivers/gpu/drm/msm/msm_gem.c                 |  2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c            |  3 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |  3 +-
 drivers/gpu/drm/tegra/gem.c                   |  5 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c               |  3 +-
 drivers/gpu/drm/virtio/virtgpu_vram.c         |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c      |  2 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c       |  3 +-
 drivers/hsi/clients/cmt_speech.c              |  2 +-
 drivers/hwtracing/intel_th/msu.c              |  2 +-
 drivers/hwtracing/stm/core.c                  |  2 +-
 drivers/infiniband/hw/hfi1/file_ops.c         |  4 +-
 drivers/infiniband/hw/mlx5/main.c             |  4 +-
 drivers/infiniband/hw/qib/qib_file_ops.c      | 13 +++--
 drivers/infiniband/hw/usnic/usnic_ib_verbs.c  |  2 +-
 .../infiniband/hw/vmw_pvrdma/pvrdma_verbs.c   |  2 +-
 .../common/videobuf2/videobuf2-dma-contig.c   |  2 +-
 .../common/videobuf2/videobuf2-vmalloc.c      |  2 +-
 drivers/media/v4l2-core/videobuf-dma-contig.c |  2 +-
 drivers/media/v4l2-core/videobuf-dma-sg.c     |  4 +-
 drivers/media/v4l2-core/videobuf-vmalloc.c    |  2 +-
 drivers/misc/cxl/context.c                    |  2 +-
 drivers/misc/habanalabs/common/memory.c       |  2 +-
 drivers/misc/habanalabs/gaudi/gaudi.c         |  4 +-
 drivers/misc/habanalabs/gaudi2/gaudi2.c       |  8 +--
 drivers/misc/habanalabs/goya/goya.c           |  4 +-
 drivers/misc/ocxl/context.c                   |  4 +-
 drivers/misc/ocxl/sysfs.c                     |  2 +-
 drivers/misc/open-dice.c                      |  4 +-
 drivers/misc/sgi-gru/grufile.c                |  4 +-
 drivers/misc/uacce/uacce.c                    |  2 +-
 drivers/sbus/char/oradax.c                    |  2 +-
 drivers/scsi/cxlflash/ocxl_hw.c               |  2 +-
 drivers/scsi/sg.c                             |  2 +-
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    |  2 +-
 drivers/staging/media/deprecated/meye/meye.c  |  4 +-
 .../media/deprecated/stkwebcam/stk-webcam.c   |  2 +-
 drivers/target/target_core_user.c             |  2 +-
 drivers/uio/uio.c                             |  2 +-
 drivers/usb/core/devio.c                      |  3 +-
 drivers/usb/mon/mon_bin.c                     |  3 +-
 drivers/vdpa/vdpa_user/iova_domain.c          |  2 +-
 drivers/vfio/pci/vfio_pci_core.c              |  2 +-
 drivers/vhost/vdpa.c                          |  2 +-
 drivers/video/fbdev/68328fb.c                 |  2 +-
 drivers/video/fbdev/core/fb_defio.c           |  4 +-
 drivers/xen/gntalloc.c                        |  2 +-
 drivers/xen/gntdev.c                          |  4 +-
 drivers/xen/privcmd-buf.c                     |  2 +-
 drivers/xen/privcmd.c                         |  4 +-
 fs/aio.c                                      |  2 +-
 fs/cramfs/inode.c                             |  2 +-
 fs/erofs/data.c                               |  2 +-
 fs/exec.c                                     |  4 +-
 fs/ext4/file.c                                |  2 +-
 fs/fuse/dax.c                                 |  2 +-
 fs/hugetlbfs/inode.c                          |  4 +-
 fs/orangefs/file.c                            |  3 +-
 fs/proc/task_mmu.c                            |  2 +-
 fs/proc/vmcore.c                              |  3 +-
 fs/userfaultfd.c                              |  2 +-
 fs/xfs/xfs_file.c                             |  2 +-
 include/linux/mm.h                            | 51 +++++++++++++++++--
 include/linux/mm_types.h                      |  8 ++-
 include/linux/pgtable.h                       |  5 +-
 kernel/bpf/ringbuf.c                          |  4 +-
 kernel/bpf/syscall.c                          |  4 +-
 kernel/events/core.c                          |  2 +-
 kernel/fork.c                                 |  2 +-
 kernel/kcov.c                                 |  2 +-
 kernel/relay.c                                |  2 +-
 mm/debug.c                                    |  1 +
 mm/hugetlb.c                                  |  4 +-
 mm/khugepaged.c                               |  2 +
 mm/ksm.c                                      |  2 +
 mm/madvise.c                                  |  2 +-
 mm/memory.c                                   | 19 +++----
 mm/memremap.c                                 |  4 +-
 mm/mlock.c                                    | 12 ++---
 mm/mmap.c                                     | 32 +++++++-----
 mm/mprotect.c                                 |  2 +-
 mm/mremap.c                                   |  8 +--
 mm/nommu.c                                    | 11 ++--
 mm/secretmem.c                                |  2 +-
 mm/shmem.c                                    |  2 +-
 mm/vmalloc.c                                  |  2 +-
 net/ipv4/tcp.c                                |  4 +-
 security/selinux/selinuxfs.c                  |  6 +--
 sound/core/oss/pcm_oss.c                      |  2 +-
 sound/core/pcm_native.c                       |  9 ++--
 sound/soc/pxa/mmp-sspa.c                      |  2 +-
 sound/usb/usx2y/us122l.c                      |  4 +-
 sound/usb/usx2y/usX2Yhwdep.c                  |  2 +-
 sound/usb/usx2y/usx2yhwdeppcm.c               |  2 +-
 129 files changed, 292 insertions(+), 233 deletions(-)

-- 
2.39.1


