Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B699DC54E76
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 10:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hss0DScungQG3wuEN+tDn4zevM2VhdEJWx+ngv2QB2g=; b=VgzRo/98yPN4yIRkk+GiZNB08/
	Ztuh9k6Y7rp/znMF4z5pRW1nmSeikmHpcAFU0fLOH3lJkAJ45axJ/qB/RJSq/t36OQZg2zL6ynV0/
	PeFJIo5l0fHC+OjMt3+OZ/Wk9OZ2yZJofpOSk/oHqW1BP/35400BU3uHT50uisvGDtGUL1IUpr9Ip
	nhNXog4MMXIj8g3M5xRFXN6aw4b1eAVtdz6oIVH6aNMSacgtJ497dyl5xF7+NGQqAAtWjX/BT/Pzu
	K/NDt3zqk9W/KRjWVhDx/l6dTSKUgtvT1KfSJzcJ4gyHqk0QWX2r1nB3H0RV78eq0HI69SHFBWo4g
	cLgyeaHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r51zZ-00BqRy-0y;
	Mon, 20 Nov 2023 10:59:01 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r51zT-00BqQi-2S;
	Mon, 20 Nov 2023 10:58:58 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6cb55001124so999324b3a.0;
        Mon, 20 Nov 2023 02:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700477934; x=1701082734; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hss0DScungQG3wuEN+tDn4zevM2VhdEJWx+ngv2QB2g=;
        b=Rtde8rpXa6NyD4TFsjiOyGpkdscmRLBfYhSCM+kWct45S0YbclXGaFAS8SBGyZsA3d
         ZduILBqIRPRefGBZIpw9IG9hJ75cSFHjJqT59cBbjybgrfr3qHQY45zFf/NArocaeFR0
         r3tGLJvIBbj1FHR4n/622IsuPVRm2/tIH0pfWk46SxxsZ7pq9wyLB4A8mfrLqWAWBn3V
         +vIT3mAYGT1vSfzNVUVpJD3MfDPduWND9dfqWEG1EaUH1GYj3wbo5vKM9z1Kb4KhwoNP
         nBF3QnV5ZsZEtOp8qSkV6Z/lbfY+fhZKgwKZejjjFP2kri92DJ0z7LNDAvMvhVowo7CL
         6X6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700477934; x=1701082734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hss0DScungQG3wuEN+tDn4zevM2VhdEJWx+ngv2QB2g=;
        b=O0mxDBnvqjtjJCTkYf0JpGGZ75X7h+1zAqFou+p90hdFob5oHz1MmvYd1pWGabaRmK
         dtkkIueDAw5mrXrJI7hhsztgegYk9bZS7WTXq4YNgF/yWQDnU3Ot0EjxoQIlh83AoPy+
         WIHDvCMKW4BgNwEOq8CiuvOVJy5YkFz4CvG13MaCVv6rIrzmBVoIItyl3ZyjnwVXKW/X
         VM90fta9OEaBlyfn6SL/4kkKHXMz9obrLkXIZp/ISd+0CXl6ACaqUGh0/SA3r6SYzgz9
         bWkMBl5LdxDQ7VF+R/f86m8/WgDGWoqpxshnNvsSdsIbdxkS0MrkSRqt7zKt8AmhUzE0
         bA4A==
X-Gm-Message-State: AOJu0Ywlu/hRxUd1syoMryl6VTPv0qTKvbRjTRe0Ilmw28roZ/XLiEpw
	OODFC+Cxa5Mc0BtvlqGRQro=
X-Google-Smtp-Source: AGHT+IE0ir36wseZ1ERuTn6WVBZ2hZ9lSDF8lyMELvj+kI6imXtdURMceGktUBcNOEOyuiWaZcapPg==
X-Received: by 2002:a05:6a20:3d87:b0:187:2b7b:1b87 with SMTP id s7-20020a056a203d8700b001872b7b1b87mr9778084pzi.21.1700477933855;
        Mon, 20 Nov 2023 02:58:53 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id v10-20020aa7850a000000b006be4bb0d2dcsm6010021pfn.149.2023.11.20.02.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 02:58:53 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 667ED101D8174; Mon, 20 Nov 2023 17:58:51 +0700 (WIB)
Date: Mon, 20 Nov 2023 17:58:51 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Yi-De Wu <yi-de.wu@mediatek.com>,
	Yingshiuan Pan <yingshiuan.pan@mediatek.com>,
	Ze-Yu Wang <ze-yu.wang@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	David Bradil <dbrazdil@google.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Jade Shih <jades.shih@mediatek.com>,
	Ivan Tseng <ivan.tseng@mediatek.com>,
	My Chuang <my.chuang@mediatek.com>,
	Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <peilun.suei@mediatek.com>,
	Liju Chen <liju-clr.chen@mediatek.com>,
	Willix Yeh <chi-shen.yeh@mediatek.com>,
	Kevenny Hsieh <kevenny.hsieh@mediatek.com>
Subject: Re: [PATCH v7 01/16] docs: geniezone: Introduce GenieZone hypervisor
Message-ID: <ZVs760ggqT-erCji@archie.me>
References: <20231116152756.4250-1-yi-de.wu@mediatek.com>
 <20231116152756.4250-2-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231116152756.4250-2-yi-de.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_025855_831538_59147324 
X-CRM114-Status: GOOD (  26.36  )
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

On Thu, Nov 16, 2023 at 11:27:41PM +0800, Yi-De Wu wrote:
> diff --git a/Documentation/virt/geniezone/introduction.rst b/Documentation/virt/geniezone/introduction.rst
> new file mode 100644
> index 000000000000..fb9fa41bcfb8
> --- /dev/null
> +++ b/Documentation/virt/geniezone/introduction.rst
> @@ -0,0 +1,86 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +======================
> +GenieZone Introduction
> +======================
> +
> +Overview
> +========
> +GenieZone hypervisor(gzvm) is a type-1 hypervisor that supports various virtual
"... hypervisor (gzvm) ..."
> +machine types and provides security features such as TEE-like scenarios and
> +secure boot. It can create guest VMs for security use cases and has
> +virtualization capabilities for both platform and interrupt. Although the
> +hypervisor can be booted independently, it requires the assistance of GenieZone
> +hypervisor kernel driver(gzvm-ko) to leverage the ability of Linux kernel for
"hypervisor kernel driver (also named gzvm) ..."
> +vCPU scheduling, memory management, inter-VM communication and virtio backend
> +support.
> +
> +Supported Architecture
> +======================
> +GenieZone now only supports MediaTek ARM64 SoC.
> +
> +Features
> +========
> +
> +- vCPU Management
> +
> +VM manager aims to provide vCPUs on the basis of time sharing on physical CPUs.
> +It requires Linux kernel in host VM for vCPU scheduling and VM power management.
> +
> +- Memory Management
> +
> +Direct use of physical memory from VMs is forbidden and designed to be dictated
> +to the privilege models managed by GenieZone hypervisor for security reason.
> +With the help of gzvm-ko, the hypervisor would be able to manipulate memory as

s/gzvm-ko/gzvm module/g

> +objects.
> +
> +- Virtual Platform
> +
> +We manage to emulate a virtual mobile platform for guest OS running on guest
> +VM. The platform supports various architecture-defined devices, such as
> +virtual arch timer, GIC, MMIO, PSCI, and exception watching...etc.
> +
> +- Inter-VM Communication
> +
> +Communication among guest VMs was provided mainly on RPC. More communication
> +mechanisms were to be provided in the future based on VirtIO-vsock.
> +
> +- Device Virtualization
> +
> +The solution is provided using the well-known VirtIO. The gzvm-ko would
> +redirect MMIO traps back to VMM where the virtual devices are mostly emulated.
> +Ioeventfd is implemented using eventfd for signaling host VM that some IO
> +events in guest VMs need to be processed.
> +
> +- Interrupt virtualization
> +
> +All Interrupts during some guest VMs running would be handled by GenieZone
> +hypervisor with the help of gzvm-ko, both virtual and physical ones. In case
> +there's no guest VM running out there, physical interrupts would be handled by
> +host VM directly for performance reason. Irqfd is also implemented using
> +eventfd for accepting vIRQ requests in gzvm-ko.
> +
> +Platform architecture component
> +===============================
> +
> +- vm
> +
> +The vm component is responsible for setting up the capability and memory
> +management for the protected VMs. The capability is mainly about the lifecycle
> +control and boot context initialization. And the memory management is highly
> +integrated with ARM 2-stage translation tables to convert VA to IPA to PA under
> +proper security measures required by protected VMs.
> +
> +- vcpu
> +
> +The vcpu component is the core of virtualizing aarch64 physical CPU runnable,
> +and it controls the vCPU lifecycle including creating, running and destroying.
> +With self-defined exit handler, the vm component would be able to act
> +accordingly before terminated.
> +
> +- vgic
> +
> +The vgic component exposes control interfaces to Linux kernel via irqchip, and
> +we intend to support all SPI, PPI, and SGI. When it comes to virtual
> +interrupts, the GenieZone hypervisor would write to list registers and trigger
> +vIRQ injection in guest VMs via GIC.

Descriptions for feature lists can be aligned:

---- >8 ----
diff --git a/Documentation/virt/geniezone/introduction.rst b/Documentation/virt/geniezone/introduction.rst
index fb9fa41bcfb8b3..f37ddf4e979992 100644
--- a/Documentation/virt/geniezone/introduction.rst
+++ b/Documentation/virt/geniezone/introduction.rst
@@ -24,63 +24,64 @@ Features
 
 - vCPU Management
 
-VM manager aims to provide vCPUs on the basis of time sharing on physical CPUs.
-It requires Linux kernel in host VM for vCPU scheduling and VM power management.
+  VM manager aims to provide vCPUs on the basis of time sharing on physical
+  CPUs. It requires Linux kernel in host VM for vCPU scheduling and VM power
+  management.
 
 - Memory Management
 
-Direct use of physical memory from VMs is forbidden and designed to be dictated
-to the privilege models managed by GenieZone hypervisor for security reason.
-With the help of gzvm-ko, the hypervisor would be able to manipulate memory as
-objects.
+  Direct use of physical memory from VMs is forbidden and designed to be
+  dictated to the privilege models managed by GenieZone hypervisor for security
+  reason. With the help of gzvm-ko, the hypervisor would be able to manipulate
+  memory as objects.
 
 - Virtual Platform
 
-We manage to emulate a virtual mobile platform for guest OS running on guest
-VM. The platform supports various architecture-defined devices, such as
-virtual arch timer, GIC, MMIO, PSCI, and exception watching...etc.
+  We manage to emulate a virtual mobile platform for guest OS running on guest
+  VM. The platform supports various architecture-defined devices, such as
+  virtual arch timer, GIC, MMIO, PSCI, and exception watching...etc.
 
 - Inter-VM Communication
 
-Communication among guest VMs was provided mainly on RPC. More communication
-mechanisms were to be provided in the future based on VirtIO-vsock.
+  Communication among guest VMs was provided mainly on RPC. More communication
+  mechanisms were to be provided in the future based on VirtIO-vsock.
 
 - Device Virtualization
 
-The solution is provided using the well-known VirtIO. The gzvm-ko would
-redirect MMIO traps back to VMM where the virtual devices are mostly emulated.
-Ioeventfd is implemented using eventfd for signaling host VM that some IO
-events in guest VMs need to be processed.
+  The solution is provided using the well-known VirtIO. The gzvm-ko would
+  redirect MMIO traps back to VMM where the virtual devices are mostly
+  emulated. Ioeventfd is implemented using eventfd for signaling host VM that
+  some IO events in guest VMs need to be processed.
 
 - Interrupt virtualization
 
-All Interrupts during some guest VMs running would be handled by GenieZone
-hypervisor with the help of gzvm-ko, both virtual and physical ones. In case
-there's no guest VM running out there, physical interrupts would be handled by
-host VM directly for performance reason. Irqfd is also implemented using
-eventfd for accepting vIRQ requests in gzvm-ko.
+  All Interrupts during some guest VMs running would be handled by GenieZone
+  hypervisor with the help of gzvm-ko, both virtual and physical ones. In case
+  there's no guest VM running out there, physical interrupts would be handled
+  by host VM directly for performance reason. Irqfd is also implemented using
+  eventfd for accepting vIRQ requests in gzvm-ko.
 
 Platform architecture component
 ===============================
 
 - vm
 
-The vm component is responsible for setting up the capability and memory
-management for the protected VMs. The capability is mainly about the lifecycle
-control and boot context initialization. And the memory management is highly
-integrated with ARM 2-stage translation tables to convert VA to IPA to PA under
-proper security measures required by protected VMs.
+  The vm component is responsible for setting up the capability and memory
+  management for the protected VMs. The capability is mainly about the
+  lifecycle control and boot context initialization. And the memory management
+  is highly integrated with ARM 2-stage translation tables to convert VA to IPA
+  to PA under proper security measures required by protected VMs.
 
 - vcpu
 
-The vcpu component is the core of virtualizing aarch64 physical CPU runnable,
-and it controls the vCPU lifecycle including creating, running and destroying.
-With self-defined exit handler, the vm component would be able to act
-accordingly before terminated.
+  The vcpu component is the core of virtualizing aarch64 physical CPU runnable,
+  and it controls the vCPU lifecycle including creating, running and
+  destroying. With self-defined exit handler, the vm component would be able to
+  act accordingly before terminated.
 
 - vgic
 
-The vgic component exposes control interfaces to Linux kernel via irqchip, and
-we intend to support all SPI, PPI, and SGI. When it comes to virtual
-interrupts, the GenieZone hypervisor would write to list registers and trigger
-vIRQ injection in guest VMs via GIC.
+  The vgic component exposes control interfaces to Linux kernel via irqchip,
+  and we intend to support all SPI, PPI, and SGI. When it comes to virtual
+  interrupts, the GenieZone hypervisor would write to list registers and
+  trigger vIRQ injection in guest VMs via GIC.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

