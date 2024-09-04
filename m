Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29E8CD3431
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 12:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aO9ZiOlbToA5gahsBzJeseLep5Ro0Hb56Y6urVLbIqI=; b=EuoaDIQfU0HDwvryzV2k7Z+mX2
	+R4x1wxTfQbnGFNLPQjF7XDnpZ6rmwR8QMU8coBsnwtEq1Y/X7rOd/KgYXECEEX1xFgcjprqYfOVk
	xvKCMpaUSxUy2C1ubHtce8WngQbAs9bCt1QPF+D8siQABzziyrCd0X/7UdbQuoP98eJQUIjqEKFaC
	IjjatIEACb7oQI/cFuk1vXDoQjwnvD/8vmvDZdo+LJ3Dxf3St/sCswDGzDSGfKKvAEMYCx3gvdaNs
	tyaxM2L4dHHf0ajbTVeh6xsOdoeNgJeShbc/9sKrIUy7ZAJUnloHqsUdVqfcy4u9+kTZKbxG7TnSf
	4pPVH+WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slpK6-00000004Obh-0KXy;
	Wed, 04 Sep 2024 12:41:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slpJC-00000004OTt-1r5l;
	Wed, 04 Sep 2024 12:40:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=aO9ZiOlbToA5gahsBzJeseLep5Ro0Hb56Y6urVLbIqI=; b=oO40/AEMkHRdxoucgAL7zwviWx
	9HYsDBQm2KgJJIeuX3IRDC9Aq+doXlz1O9jdIxTRMMGnmuTFgEkqr80a2QhVavtCrQjnUuhOBuumq
	KkN7WXu+VLVVcpq7qcfsDalShkHUVdvHhLs1dqcLX9/HwLR1YKJZ3GcF7p2gehSqE4tJ2hdDqMEVK
	jPJn0rfpSOvYaXtWG3pLo5nLpjyNvoUVpLDTzbhGKxcRFx5130/IaN1pnKcMpM5zQuNibxXGuEDQh
	G0wdFKnYnnzYX8poySOF+zQ5QKhmH2gEJcorgzQR+lhmZEZnRMlF7RLo2hms3kiYEr0dZ3RLRoeGK
	u/whUTSQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1slpJ6-00000000D8Z-0gV1;
	Wed, 04 Sep 2024 12:40:22 +0000
X-UUID: a9b8eb286aba11efba0aef63c0775dbf-20240904
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=aO9ZiOlbToA5gahsBzJeseLep5Ro0Hb56Y6urVLbIqI=;
	b=hDGncRrm7b8ky/s7h1UVMV51Sl30en+lDozdiYCeT1ZOuo/3Wt7jbsVhy4cYsNLSvap3+Uu15ojDoBBq61BDhlla5jTZgzLK2YPqn4God2+1dUTNnP8SXnGx/eqggmZ9u5zLZfWFhZJCrlvWXKx/++l1SrUg9xKRfdGVb6RZNB4=;
X-CID-CACHE: Type:Local,Time:202409040456-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:b8a5df3d-f97a-4fff-852e-7d5b0ecedf88,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:421270bf-d7af-4351-93aa-42531abf0c7b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: a9b8eb286aba11efba0aef63c0775dbf-20240904
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chunhui.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 153902802; Wed, 04 Sep 2024 05:39:01 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 4 Sep 2024 20:38:58 +0800
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 4 Sep 2024 20:38:57 +0800
From: Chunhui Li <chunhui.li@mediatek.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-modules@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<wsd_upstream@mediatek.com>, Chunhui Li <chunhui.li@mediatek.com>, kernel
 test robot <lkp@intel.com>, Xion Wang <xion.wang@mediatek.com>
Subject: [PATCH v2] module: abort module loading when sysfs setup suffer errors
Date: Wed, 4 Sep 2024 20:41:07 +0800
Message-ID: <20240904124108.20444-1-chunhui.li@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_134020_570128_068374A6 
X-CRM114-Status: GOOD (  18.45  )
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

When insmod a kernel module, if fails in add_notes_attrs or
add_sysfs_attrs such as memory allocation fail, mod_sysfs_setup
will still return success, but we can't access user interface
on android device.

Patch for make mod_sysfs_setup can check the error of
add_notes_attrs and add_sysfs_attrs.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409010016.3XIFSmRA-lkp@intel.com/
Signed-off-by: Xion Wang <xion.wang@mediatek.com>
Signed-off-by: Chunhui Li <chunhui.li@mediatek.com>
---
 kernel/module/sysfs.c | 53 +++++++++++++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 17 deletions(-)

diff --git a/kernel/module/sysfs.c b/kernel/module/sysfs.c
index 26efe1305c12..61a3547e56f9 100644
--- a/kernel/module/sysfs.c
+++ b/kernel/module/sysfs.c
@@ -69,12 +69,13 @@ static void free_sect_attrs(struct module_sect_attrs *sect_attrs)
 	kfree(sect_attrs);
 }
 
-static void add_sect_attrs(struct module *mod, const struct load_info *info)
+static int add_sect_attrs(struct module *mod, const struct load_info *info)
 {
 	unsigned int nloaded = 0, i, size[2];
 	struct module_sect_attrs *sect_attrs;
 	struct module_sect_attr *sattr;
 	struct bin_attribute **gattr;
+	int ret;
 
 	/* Count loaded sections and allocate structures */
 	for (i = 0; i < info->hdr->e_shnum; i++)
@@ -85,7 +86,7 @@ static void add_sect_attrs(struct module *mod, const struct load_info *info)
 	size[1] = (nloaded + 1) * sizeof(sect_attrs->grp.bin_attrs[0]);
 	sect_attrs = kzalloc(size[0] + size[1], GFP_KERNEL);
 	if (!sect_attrs)
-		return;
+		return -ENOMEM;
 
 	/* Setup section attributes. */
 	sect_attrs->grp.name = "sections";
@@ -103,8 +104,10 @@ static void add_sect_attrs(struct module *mod, const struct load_info *info)
 		sattr->address = sec->sh_addr;
 		sattr->battr.attr.name =
 			kstrdup(info->secstrings + sec->sh_name, GFP_KERNEL);
-		if (!sattr->battr.attr.name)
+		if (!sattr->battr.attr.name) {
+			ret = -ENOMEM;
 			goto out;
+		}
 		sect_attrs->nsections++;
 		sattr->battr.read = module_sect_read;
 		sattr->battr.size = MODULE_SECT_READ_SIZE;
@@ -113,13 +116,15 @@ static void add_sect_attrs(struct module *mod, const struct load_info *info)
 	}
 	*gattr = NULL;
 
-	if (sysfs_create_group(&mod->mkobj.kobj, &sect_attrs->grp))
+	ret = sysfs_create_group(&mod->mkobj.kobj, &sect_attrs->grp);
+	if (ret)
 		goto out;
 
 	mod->sect_attrs = sect_attrs;
-	return;
+	return 0;
 out:
 	free_sect_attrs(sect_attrs);
+	return ret;
 }
 
 static void remove_sect_attrs(struct module *mod)
@@ -158,11 +163,12 @@ static void free_notes_attrs(struct module_notes_attrs *notes_attrs,
 	kfree(notes_attrs);
 }
 
-static void add_notes_attrs(struct module *mod, const struct load_info *info)
+static int add_notes_attrs(struct module *mod, const struct load_info *info)
 {
 	unsigned int notes, loaded, i;
 	struct module_notes_attrs *notes_attrs;
 	struct bin_attribute *nattr;
+	int ret;
 
 	/* failed to create section attributes, so can't create notes */
 	if (!mod->sect_attrs)
@@ -176,12 +182,12 @@ static void add_notes_attrs(struct module *mod, const struct load_info *info)
 			++notes;
 
 	if (notes == 0)
-		return;
+		return 0;
 
 	notes_attrs = kzalloc(struct_size(notes_attrs, attrs, notes),
 			      GFP_KERNEL);
 	if (!notes_attrs)
-		return;
+		return -ENOMEM;
 
 	notes_attrs->notes = notes;
 	nattr = &notes_attrs->attrs[0];
@@ -201,19 +207,23 @@ static void add_notes_attrs(struct module *mod, const struct load_info *info)
 	}
 
 	notes_attrs->dir = kobject_create_and_add("notes", &mod->mkobj.kobj);
-	if (!notes_attrs->dir)
+	if (!notes_attrs->dir) {
+		ret = -ENOMEM;
 		goto out;
+	}
 
-	for (i = 0; i < notes; ++i)
-		if (sysfs_create_bin_file(notes_attrs->dir,
-					  &notes_attrs->attrs[i]))
+	for (i = 0; i < notes; ++i) {
+		ret = sysfs_create_bin_file(notes_attrs->dir, &notes_attrs->attrs[i]);
+		if (ret)
 			goto out;
+	}
 
 	mod->notes_attrs = notes_attrs;
-	return;
+	return 0;
 
 out:
 	free_notes_attrs(notes_attrs, i);
+	return ret;
 }
 
 static void remove_notes_attrs(struct module *mod)
@@ -223,9 +233,9 @@ static void remove_notes_attrs(struct module *mod)
 }
 
 #else /* !CONFIG_KALLSYMS */
-static inline void add_sect_attrs(struct module *mod, const struct load_info *info) { }
+static inline int add_sect_attrs(struct module *mod, const struct load_info *info) { }
 static inline void remove_sect_attrs(struct module *mod) { }
-static inline void add_notes_attrs(struct module *mod, const struct load_info *info) { }
+static inline int add_notes_attrs(struct module *mod, const struct load_info *info) { }
 static inline void remove_notes_attrs(struct module *mod) { }
 #endif /* CONFIG_KALLSYMS */
 
@@ -385,11 +395,20 @@ int mod_sysfs_setup(struct module *mod,
 	if (err)
 		goto out_unreg_modinfo_attrs;
 
-	add_sect_attrs(mod, info);
-	add_notes_attrs(mod, info);
+	err = add_sect_attrs(mod, info);
+	if (err)
+		goto out_del_usage_links;
+
+	err = add_notes_attrs(mod, info);
+	if (err)
+		goto out_unreg_sect_attrs;
 
 	return 0;
 
+out_unreg_sect_attrs:
+	remove_sect_attrs(mod);
+out_del_usage_links:
+	del_usage_links(mod);
 out_unreg_modinfo_attrs:
 	module_remove_modinfo_attrs(mod, -1);
 out_unreg_param:
-- 
2.45.2


