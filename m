Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB86C3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 08:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CcJzTAL9IFu4/nhUMP2RjTp8+dJQAQi4jXS1e0DRnFY=; b=tLeSrgbxjpIHvGpsL90foc6TJY
	4ASj843ljt9FfuAUFAC0gvVI6AmxzzR+T5U+8V72eMbdH7/hv93p7dtQheFiX1IyNs3pOip0uV4pJ
	loGFefktjmeICnxwkC2TbIJAvKVpIs3C6ddiA9C+OFjc9MEACiQ6zFoA1tnEXw4LAc0wZ9Tu6/jSu
	0gxQcck17GUmEWCkBuwRr1n4j7zvdM190ONaJvvCbmal3uQ3jPioZGV63WldQTHyYbtlRYadaCNW2
	gHoEuTw5r0xp0lagzvMvLtdK+BphLn59q/S2dc1BnxQcRpKmbDC6j9VRch7t8YwZVArBRfbfPx883
	Sn8waWEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYiFV-0000000EGsa-42JR;
	Tue, 30 Jul 2024 08:30:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYiA4-0000000EE6j-3yuj;
	Tue, 30 Jul 2024 08:24:54 +0000
X-UUID: 2bb211844e4d11ef955bff358274dad2-20240730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=CcJzTAL9IFu4/nhUMP2RjTp8+dJQAQi4jXS1e0DRnFY=;
	b=qNiCW+mrbTHqMq3Ivje8mGgJ4ZQKBFLQEC2qveMZ0lC4L7aAUe/GnTBZh1UgRbJzgCt6H+9KhJQGMxHbIOg5/wmTnyD86y0MrqBZ+e6159qIp/L0LM23xbtGXYFOx2ZOTPrLhi2lKQboD4VsRrE7+EzYN41tHKSWL3mv8KNTPKk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:5b28ae7f-0fa7-413a-bff2-6c21ee945b94,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:6dc6a47,CLOUDID:fccfedd5-0d68-4615-a20f-01d7bd41f0bb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2bb211844e4d11ef955bff358274dad2-20240730
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <liju-clr.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1994421735; Tue, 30 Jul 2024 01:24:42 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 30 Jul 2024 01:24:40 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 30 Jul 2024 16:24:40 +0800
From: Liju-clr Chen <liju-clr.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Richard Cochran
	<richardcochran@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liju-clr Chen <Liju-clr.Chen@mediatek.com>, Yingshiuan Pan
	<Yingshiuan.Pan@mediatek.com>, Ze-yu Wang <Ze-yu.Wang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-trace-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <PeiLun.Suei@mediatek.com>, Chi-shen Yeh
	<Chi-shen.Yeh@mediatek.com>, Kevenny Hsieh <Kevenny.Hsieh@mediatek.com>
Subject: [PATCH v12 24/24] virt: geniezone: Emulate IPI for guest VM
Date: Tue, 30 Jul 2024 16:24:36 +0800
Message-ID: <20240730082436.9151-25-liju-clr.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240730082436.9151-1-liju-clr.chen@mediatek.com>
References: <20240730082436.9151-1-liju-clr.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_012449_658955_133FC0F0 
X-CRM114-Status: GOOD (  13.56  )
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

From: Kevenny Hsieh <kevenny.hsieh@mediatek.com>

Emulate Inter-Processor Interrupts (IPI) handling for guest VMs.
Ensure that when a vCPU thread enters an idle state and relinquishes
CPU control to the host, it can be woken up by IPIs issued by other
vCPUs through the gzvm driver.

Add a new wake-up mechanism, `GZVM_EXIT_IPI`, to handle IPIs. Ensure
that idle vCPUs can be woken up not only by virtual timer (vtimer) and
virtio interrupts but also by IPIs issued by other vCPUs.

Ensure proper handling of IPIs, allowing idle vCPUs to be woken up and
respond to interrupts, thereby maintaining correct and efficient
inter-processor communication within the guest VM.

Signed-off-by: Kevenny Hsieh <kevenny.hsieh@mediatek.com>
Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>
---
 drivers/virt/geniezone/gzvm_exception.c | 5 +++++
 drivers/virt/geniezone/gzvm_vcpu.c      | 3 +++
 include/linux/soc/mediatek/gzvm_drv.h   | 1 +
 include/uapi/linux/gzvm.h               | 1 +
 4 files changed, 10 insertions(+)

diff --git a/drivers/virt/geniezone/gzvm_exception.c b/drivers/virt/geniezone/gzvm_exception.c
index 391168a3f737..7a4e3d76aa7a 100644
--- a/drivers/virt/geniezone/gzvm_exception.c
+++ b/drivers/virt/geniezone/gzvm_exception.c
@@ -105,3 +105,8 @@ int gzvm_handle_guest_idle(struct gzvm_vcpu *vcpu)
 
 	return ret;
 }
+
+void gzvm_handle_guest_ipi(struct gzvm_vcpu *vcpu)
+{
+	gzvm_vcpu_wakeup_all(vcpu->gzvm);
+}
diff --git a/drivers/virt/geniezone/gzvm_vcpu.c b/drivers/virt/geniezone/gzvm_vcpu.c
index 247848ee126c..5cdd6ccbe76d 100644
--- a/drivers/virt/geniezone/gzvm_vcpu.c
+++ b/drivers/virt/geniezone/gzvm_vcpu.c
@@ -184,6 +184,9 @@ static long gzvm_vcpu_run(struct gzvm_vcpu *vcpu, void __user *argp)
 		case GZVM_EXIT_IDLE:
 			gzvm_handle_guest_idle(vcpu);
 			break;
+		case GZVM_EXIT_IPI:
+			gzvm_handle_guest_ipi(vcpu);
+			break;
 		case GZVM_EXIT_UNKNOWN:
 			fallthrough;
 		default:
diff --git a/include/linux/soc/mediatek/gzvm_drv.h b/include/linux/soc/mediatek/gzvm_drv.h
index 61f3ae4ee793..0302890ed69e 100644
--- a/include/linux/soc/mediatek/gzvm_drv.h
+++ b/include/linux/soc/mediatek/gzvm_drv.h
@@ -241,6 +241,7 @@ int gzvm_handle_relinquish(struct gzvm_vcpu *vcpu, phys_addr_t ipa);
 bool gzvm_handle_guest_hvc(struct gzvm_vcpu *vcpu);
 bool gzvm_arch_handle_guest_hvc(struct gzvm_vcpu *vcpu);
 int gzvm_handle_guest_idle(struct gzvm_vcpu *vcpu);
+void gzvm_handle_guest_ipi(struct gzvm_vcpu *vcpu);
 void gzvm_vcpu_wakeup_all(struct gzvm *gzvm);
 
 int gzvm_arch_create_device(u16 vm_id, struct gzvm_create_device *gzvm_dev);
diff --git a/include/uapi/linux/gzvm.h b/include/uapi/linux/gzvm.h
index 1fe483ef2ed5..bcbc4d62a70f 100644
--- a/include/uapi/linux/gzvm.h
+++ b/include/uapi/linux/gzvm.h
@@ -189,6 +189,7 @@ enum {
 	GZVM_EXIT_SHUTDOWN = 0x92920009,
 	GZVM_EXIT_GZ = 0x9292000a,
 	GZVM_EXIT_IDLE = 0x9292000b,
+	GZVM_EXIT_IPI = 0x9292000d,
 };
 
 /* exception definitions of GZVM_EXIT_EXCEPTION */
-- 
2.18.0


