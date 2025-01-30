Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACD7C0218A
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jan 2025 16:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=egOGJAXdzlspJHrqV9BICD/kSifyMaJ0VQH1AZZmLmM=; b=0znVqxdWyghP1SfLQX8c0vYn1g
	ZATlRaSUqeQLeKWLs1pVgWlQIp21qG3tsDd1WbHKlF0Qtqin+7ZyJXsw+H5oAMBIIjVMiK33mdSTQ
	wKkILrCXwVdsoTuJkW0SnT5P4IxL66YrlYKMPGqhRKWf8DOIbqJdJVvXMj0twyrhp1Ys13TqSIprR
	nIPQUKH5At5SVVDV2yAro4byYLl8zUTQokRIgCRGTqobrBoObVc2Zdf/2Iqwox//B8ddQ8M0P2PVE
	Xuh3EB4obi2/IZEvnngDRfjTxhuSG7IWpjguzQKPWK/eC7iLZVeWt2ozDKu5RvCTYlZV3vWl4f1bS
	K0kqZBjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdXDo-000000098WO-3wtZ;
	Thu, 30 Jan 2025 16:16:52 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdXCV-000000098MJ-1ttq
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Jan 2025 16:15:33 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so535761f8f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Jan 2025 08:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738253729; x=1738858529; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egOGJAXdzlspJHrqV9BICD/kSifyMaJ0VQH1AZZmLmM=;
        b=TUR9yh7r4M9Po/6DhIRjljcHZwuxMkQV/LRDZY1LMmqR1jBEi/9Y3GQWKRg1kyXuRh
         WG8mgGO5KzfFJwg5r9WFUHjV9wMYPSXQzmuk8MYPpNQjh5TZw9km6IR1epNzgvm+/pTp
         m7Lz+uLsKqmRirMq68EihXnHQeHyIdsv/V2lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738253729; x=1738858529;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=egOGJAXdzlspJHrqV9BICD/kSifyMaJ0VQH1AZZmLmM=;
        b=WNTOdL46Z6YlqASdDRcHjqJeJgSLnBKj23yJmsDaEFUxm7oL9svyTnDMXJ3xhKSjJm
         ze70JMfZIF7Q8LR8cvg/mqdXwwhmq3MaTbwlrKOnNEtBU5YbZ1v2Q/In6J/b96rpfioT
         g5YGjg7XFg/l6OQVT/TWFXGwbA02DaHYjM4DllaQdFUqiiRm34ccyU+c/IV6HauCmjQ4
         IoED3LXFN9b8MgALrnWOnfcayrLcvqWBirQPGntcyFTit670dOkvw/Q2zIRp4hdPYOdl
         1z8G13IDwDpIotFf1bzaS2bowFQapKibq1ukf/3Vk7UR8sIe1yEfWb0UE8dGMyFZ93Qk
         yXMg==
X-Forwarded-Encrypted: i=1; AJvYcCU0LVV02x3eDQR7h0ZPA0naS4fho+L0cM86q9gAI+DAFTCxmxMjucxoepdWk4D+Mq+9agNe3QOj7tUW6oGM8g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7h9+bJNc+FUnuWzlliug9fFHwkaiRfr9/z6r7q/PhbZ7SUtHC
	PDi0QZNpTKCTwBF8joOBXTOmC/Wr8SS2glCHUtr839k6MVNx9ZimfnNiQhXKoqY=
X-Gm-Gg: ASbGncsc6d9d+xR8vo5wRoqTTTvLr+JTDgMkiAQ6YiVzNbdtwp/DP5ArQogXnbFSI4h
	XJKJi2d/PKmN9J7yngWlZsAw9hIm1NYonF4R/27qfgw90PiGl8nnFSuw6UJPW/vhKU6S2AIfh0j
	QL9DidyK1aBXkNqxzRV5GTbXzQzVxl0Kn1Zdfpyjxlq63tbL2nhKEmWQ35h4eZLnzpkFUEDGTi7
	JH1cRqUHRGGBhHTAUsQElcsa8SjBwYUp40wBFBV+Ou9qN0EqDj0DpFoxzNWiCYWoE75h+wMFGqH
	jstPlg03LL+wcaEpwr3imaU0lyk=
X-Google-Smtp-Source: AGHT+IFrK9TYn7kQQFdMHsFiVHo3J2E8mwQ+Y3KTlIT27Ql0a3K5so/x8gXOhuMpz8Mjv2POiya4DQ==
X-Received: by 2002:a05:6000:1a86:b0:385:e3b8:f331 with SMTP id ffacd0b85a97d-38c5194a53dmr7160268f8f.14.1738253727206;
        Thu, 30 Jan 2025 08:15:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b57b6sm2393207f8f.72.2025.01.30.08.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 08:15:26 -0800 (PST)
Date: Thu, 30 Jan 2025 17:15:24 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Florent Tomasin <florent.tomasin@arm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yong Wu <yong.wu@mediatek.com>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, nd@arm.com,
	Akash Goel <akash.goel@arm.com>
Subject: Re: [RFC PATCH 0/5] drm/panthor: Protected mode support for Mali CSF
 GPUs
Message-ID: <Z5ulnIuzapOVBQgb@phenom.ffwll.local>
Mail-Followup-To: Florent Tomasin <florent.tomasin@arm.com>,
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yong Wu <yong.wu@mediatek.com>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, nd@arm.com,
	Akash Goel <akash.goel@arm.com>
References: <cover.1738228114.git.florent.tomasin@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1738228114.git.florent.tomasin@arm.com>
X-Operating-System: Linux phenom 6.12.11-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_081531_489158_A06CD9D8 
X-CRM114-Status: GOOD (  63.73  )
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

On Thu, Jan 30, 2025 at 01:08:56PM +0000, Florent Tomasin wrote:
> Hi,
> 
> This is a patch series covering the support for protected mode execution in
> Mali Panthor CSF kernel driver.
> 
> The Mali CSF GPUs come with the support for protected mode execution at the
> HW level. This feature requires two main changes in the kernel driver:
> 
> 1) Configure the GPU with a protected buffer. The system must provide a DMA
>    heap from which the driver can allocate a protected buffer.
>    It can be a carved-out memory or dynamically allocated protected memory region.
>    Some system includes a trusted FW which is in charge of the protected memory.
>    Since this problem is integration specific, the Mali Panthor CSF kernel
>    driver must import the protected memory from a device specific exporter.
> 
> 2) Handle enter and exit of the GPU HW from normal to protected mode of execution.
>    FW sends a request for protected mode entry to the kernel driver.
>    The acknowledgment of that request is a scheduling decision. Effectively,
>    protected mode execution should not overrule normal mode of execution.
>    A fair distribution of execution time will guaranty the overall performance
>    of the device, including the UI (usually executing in normal mode),
>    will not regress when a protected mode job is submitted by an application.
> 
> 
> Background
> ----------
> 
> Current Mali Panthor CSF driver does not allow a user space application to
> execute protected jobs on the GPU. This use case is quite common on end-user-device.
> A user may want to watch a video or render content that is under a "Digital Right
> Management" protection, or launch an application with user private data.
> 
> 1) User-space:
> 
>    In order for an application to execute protected jobs on a Mali CSF GPU the
>    user space application must submit jobs to the GPU within a "protected regions"
>    (range of commands to execute in protected mode).
> 
>    Find here an example of a command buffer that contains protected commands:
> 
> ```
>           <--- Normal mode ---><--- Protected mode ---><--- Normal mode --->
>    +-------------------------------------------------------------------------+
>    | ... | CMD_0 | ... | CMD_N | PROT_REGION | CMD_N+1 | ... | CMD_N+M | ... |
>    +-------------------------------------------------------------------------+
> ```
> 
>    The PROT_REGION command acts as a barrier to notify the HW of upcoming
>    protected jobs. It also defines the number of commands to execute in protected
>    mode.
> 
>    The Mesa definition of the opcode can be found here:
> 
>      https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/panfrost/lib/genxml/v10.xml?ref_type=heads#L763

Is there also something around that implements egl_ext_protected_context
or similar in mesa? I think that's the minimal bar all the protected gpu
workload kernel support patches cleared thus far, since usually getting
the actual video code stuff published seems to be impossible.
-Sima

> 
> 2) Kernel-space:
> 
>    When loading the FW image, the Kernel driver must also load the data section of
>    CSF FW that comes from the protected memory, in order to allow FW to execute in
>    protected mode.
> 
>    Important: this memory is not owned by any process. It is a GPU device level
>               protected memory.
> 
>    In addition, when a CSG (group) is created, it must have a protected suspend buffer.
>    This memory is allocated within the kernel but bound to a specific CSG that belongs
>    to a process. The kernel owns this allocation and does not allow user space mapping.
>    The format of the data in this buffer is only known by the FW and does not need to
>    be shared with other entities. The purpose of this buffer is the same as the normal
>    suspend buffer but for protected mode. FW will use it to suspend the execution of
>    PROT_REGION before returning to normal mode of execution.
> 
> 
> Design decisions
> ----------------
> 
> The Mali Panthor CSF kernel driver will allocate protected DMA buffers
> using a global protected DMA heap. The name of the heap can vary on
> the system and is integration specific. Therefore, the kernel driver
> will retrieve it using the DTB entry: "protected-heap-name".
> 
> The Mali Panthor CSF kernel driver will handle enter/exit of protected
> mode with a fair consideration of the job scheduling.
> 
> If the system integrator does not provide a protected DMA heap, the driver
> will not allow any protected mode execution.
> 
> 
> Patch series
> ------------
> 
> The series is based on:
> 
>   https://lore.kernel.org/lkml/20230911023038.30649-1-yong.wu@mediatek.com/#t
> 
> [PATCHES 1-2]:
>   These patches were used for the development of the feature and are not
>   initially thought to land in the Linux kernel. They are mostly relevant
>   if someone wants to reproduce the environment of testing.
> 
>   Note: Please, raise interest if you think those patches have value in
>         the Linux kernel.
> 
>   * dt-bindings: dma: Add CMA Heap bindings
>   * cma-heap: Allow registration of custom cma heaps
> 
> [PATCHES 3-4]:
>   These patches introduce the Mali Panthor CSF driver DTB binding to pass
>   the protected DMA Heap name and the handling of the protected DMA memory
>   allocations in the driver.
> 
>   Note: The registration of the protected DMA buffers is done via GEM prime.
>   The direct call to the registration function, may seems controversial and
>   I would appreciate feedback on that matter.
> 
>   * dt-bindings: gpu: Add protected heap name to Mali Valhall CSF binding
>   * drm/panthor: Add support for protected memory allocation in panthor
> 
> [PATCH 5]:
>   This patch implements the logic to handle enter/exit of the GPU protected
>   mode in Panthor CSF driver.
> 
>   Note: to prevent scheduler priority inversion, only a single CSG is allowed
>         to execute while in protected mode. It must be the top priority one.
> 
>   * drm/panthor: Add support for entering and exiting protected mode
> 
> Testing
> -------
> 
> 1) Platform and development environment
> 
>    Any platform containing a Mali CSF type of GPU and a protected memory allocator
>    that is based on DMA Heap can be used. For example, it can be a physical platform
>    or a simulator such as Arm Total Compute FVPs platforms. Reference to the latter:
> 
>      https://developer.arm.com/Tools%20and%20Software/Fixed%20Virtual%20Platforms/Total%20Compute%20FVPs
> 
>    To ease the development of the feature, a carved-out protected memory heap was
>    defined and managed using a modified version of the CMA heap driver.
> 
> 2) Protected job submission:
> 
>    A protected mode job can be created in Mesa following this approach:
> 
> ```
> diff --git a/src/gallium/drivers/panfrost/pan_csf.c b/src/gallium/drivers/panfrost/pan_csf.c
> index da6ce875f86..13d54abf5a1 100644
> --- a/src/gallium/drivers/panfrost/pan_csf.c
> +++ b/src/gallium/drivers/panfrost/pan_csf.c
> @@ -803,8 +803,25 @@ GENX(csf_emit_fragment_job)(struct panfrost_batch *batch,
>        }
>     }
> 
> +   if (protected_cmd) {
> +      /* Number of commands to execute in protected mode in bytes.
> +       * The run fragment and wait commands. */
> +      unsigned const size = 2 * sizeof(u64);
> +
> +      /* Wait for all previous commands to complete before evaluating
> +       * the protected commands. */
> +      cs_wait_slots(b, SB_ALL_MASK, false);
> +      cs_prot_region(b, size);
> +   }
> +
>     /* Run the fragment job and wait */
>     cs_run_fragment(b, false, MALI_TILE_RENDER_ORDER_Z_ORDER, false);
> +
> +   /* Wait for all protected commands to complete before evaluating
> +    * the normal mode commands. */
> +   if (protected_cmd)
> +      cs_wait_slots(b, SB_ALL_MASK, false);
> +
>     cs_wait_slot(b, 2, false);
> 
>     /* Gather freed heap chunks and add them to the heap context free list
> ```
> 
> 
> Constraints
> -----------
> 
> At the time of developing the feature, Linux kernel does not have a generic
> way of implementing protected DMA heaps. The patch series relies on previous
> work to expose the DMA heap API to the kernel drivers.
> 
> The Mali CSF GPU requires device level allocated protected memory, which do
> not belong to a process. The current Linux implementation of DMA heap only
> allows a user space program to allocate from such heap. Having the ability
> to allocate this memory at the kernel level via the DMA heap API would allow
> support for protected mode on Mali CSF GPUs.
> 
> 
> Conclusion
> ----------
> 
> This patch series aims to initiate the discussion around handling of protected
> mode in Mali CSG GPU and highlights constraints found during the development
> of the feature.
> 
> Some Mesa changes are required to construct a protected mode job in user space,
> which can be submitted to the GPU.
> 
> Some of the changes may seems controversial and we would appreciate getting
> opinion from the community.
> 
> 
> Regards,
> 
> Florent Tomasin (5):
>   dt-bindings: dma: Add CMA Heap bindings
>   cma-heap: Allow registration of custom cma heaps
>   dt-bindings: gpu: Add protected heap name to Mali Valhall CSF binding
>   drm/panthor: Add support for protected memory allocation in panthor
>   drm/panthor: Add support for entering and exiting protected mode
> 
>  .../devicetree/bindings/dma/linux,cma.yml     |  43 ++++++
>  .../bindings/gpu/arm,mali-valhall-csf.yaml    |   6 +
>  drivers/dma-buf/heaps/cma_heap.c              | 120 +++++++++++------
>  drivers/gpu/drm/panthor/Kconfig               |   1 +
>  drivers/gpu/drm/panthor/panthor_device.c      |  22 +++-
>  drivers/gpu/drm/panthor/panthor_device.h      |  10 ++
>  drivers/gpu/drm/panthor/panthor_fw.c          |  46 ++++++-
>  drivers/gpu/drm/panthor/panthor_fw.h          |   2 +
>  drivers/gpu/drm/panthor/panthor_gem.c         |  49 ++++++-
>  drivers/gpu/drm/panthor/panthor_gem.h         |  16 ++-
>  drivers/gpu/drm/panthor/panthor_heap.c        |   2 +
>  drivers/gpu/drm/panthor/panthor_sched.c       | 124 ++++++++++++++++--
>  12 files changed, 382 insertions(+), 59 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/linux,cma.yml
> 
> --
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

