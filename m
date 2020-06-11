Return-Path: <SRS0=zMKO=7Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F7BC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2020 09:26:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FD9120760
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2020 09:26:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jmbKxzvH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sd7V/kvT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FD9120760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iaol3ovo6SOJpYwIE5HQ3hgpcTbhDrtl6S1Ms/AlCCA=; b=jmbKxzvHjKgmOG
	j7JUaJa1i26bwAvmsC/XU+l/Qi/mWb6T7oRtl2Xweu+DCrzZlzX9SxViWh2F3LpsVnDFBQ894A1Nf
	/F7Obrp8yZQE+qj+qFK+XmyOJIH88zkrvU2BSCIbRZAuhh0QDw/dgbOYxalousah0ngl1kiszFl/K
	D2dy3gY50tFPdybZnH8sX0xeueuWlfM+yFlmWqdlWrD/zcFzontnlmDh85CQvgRpIjmjMnGthcRaf
	J8ftwoWwt/P1eE2m3BJXnnjnhQJ2c32+Hcj+I4nXrkpYd80S0bbu/VhvuzE7C0rWH+6liffjKBTd1
	PVGKCGI+M9R65fu17dSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjJTU-0001Ru-Hj; Thu, 11 Jun 2020 09:26:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjJTR-0001QL-2G; Thu, 11 Jun 2020 09:26:14 +0000
X-UUID: 94624fa3ead5447aa6539b5f782fc22d-20200611
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=arPIeFMQZ1+NZeZaAa8iqxicI65qOT2Z+fn97VHkHyg=; 
 b=sd7V/kvTL+bcexp3YLpxV/isLcX1pmju0wE7zCKMn1elCqftHm0oQC5Z2cT7/pIQL7bykmG0vP8ncVbo7WL1l6kipwHEW80r4NExv45dHkGT8aFrXWLqyxajPg+RTsOBxg91H98cVlz57JiRTWqXR5dV3RuxoIIr3lxeqyIUlcc=;
X-UUID: 94624fa3ead5447aa6539b5f782fc22d-20200611
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 30019533; Thu, 11 Jun 2020 01:25:48 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Jun 2020 02:26:02 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Jun 2020 17:26:01 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 11 Jun 2020 17:26:01 +0800
Message-ID: <1591867563.27949.9.camel@mtkswgap22>
Subject: Re: [PATCH 2/2] soc: mediatek: devapc: add devapc-mt6873 driver
From: Neal Liu <neal.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 11 Jun 2020 17:26:03 +0800
In-Reply-To: <CAAOTY__g3Fnwsoqx=x_tgdMii5K_L9TmF_9048XbAOSJwb-Cxg@mail.gmail.com>
References: <1591698261-22639-1-git-send-email-neal.liu@mediatek.com>
 <1591698261-22639-3-git-send-email-neal.liu@mediatek.com>
 <CAAOTY__g3Fnwsoqx=x_tgdMii5K_L9TmF_9048XbAOSJwb-Cxg@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_022613_117205_F827DFCD 
X-CRM114-Status: GOOD (  13.64  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-06-10 at 00:01 +0800, Chun-Kuang Hu wrote:
Hi Chun-Kuang,

[snip]

> > +
> > +/*
> > + * mtk_devapc_pd_get - get devapc pd_types of register address.
> > + *
> > + * Returns the value of reg addr
> > + */
> > +static void __iomem *mtk_devapc_pd_get(int slave_type,
> > +                                      enum DEVAPC_PD_REG_TYPE pd_reg_type,
> > +                                      u32 index)
> > +{
> > +       struct mtk_devapc_vio_info *vio_info = mtk_devapc_ctx->soc->vio_info;
> > +       u32 slave_type_num = mtk_devapc_ctx->soc->slave_type_num;
> > +       const u32 *devapc_pds = mtk_devapc_ctx->soc->devapc_pds;
> > +       void __iomem *reg;
> > +
> > +       if (!devapc_pds)
> > +               return NULL;
> > +
> > +       if ((slave_type < slave_type_num &&
> > +            index < vio_info->vio_mask_sta_num[slave_type]) &&
> > +           pd_reg_type < PD_REG_TYPE_NUM) {
> > +               reg = mtk_devapc_ctx->devapc_pd_base[slave_type] +
> > +                       devapc_pds[pd_reg_type];
> > +
> > +               if (pd_reg_type == VIO_MASK || pd_reg_type == VIO_STA)
> > +                       reg += 0x4 * index;
> > +
> > +       } else {
> > +               pr_err(PFX "%s:0x%x or %s:0x%x or %s:0x%x is out of boundary\n",
> > +                      "slave_type", slave_type,
> 
> Move "slave_type" into format string.

Why is this necessary? Is there any benefit for moving this?
Since the line length is almost over 80 chars.

> 
> > +                      "pd_reg_type", pd_reg_type,
> > +                      "index", index);
> > +               return NULL;
> > +       }
> > +
> > +       return reg;
> > +}
> > +
> 

[snip]

> 
> > +
> > +/*
> > + * devapc_violation_irq - the devapc Interrupt Service Routine (ISR) will dump
> > + *                       violation information including which master violates
> > + *                       access slave.
> > + */
> > +static irqreturn_t devapc_violation_irq(int irq_number, void *dev_id)
> > +{
> > +       u32 slave_type_num = mtk_devapc_ctx->soc->slave_type_num;
> > +       const struct mtk_device_info **device_info;
> > +       struct mtk_devapc_vio_info *vio_info;
> > +       int slave_type, vio_idx, index;
> > +       const char *vio_master;
> > +       unsigned long flags;
> > +       bool normal;
> > +       u8 perm;
> > +
> > +       spin_lock_irqsave(&devapc_lock, flags);
> > +
> > +       device_info = mtk_devapc_ctx->soc->device_info;
> > +       vio_info = mtk_devapc_ctx->soc->vio_info;
> > +       normal = false;
> > +       vio_idx = -1;
> > +       index = -1;
> > +
> > +       /* There are multiple DEVAPC_PD */
> > +       for (slave_type = 0; slave_type < slave_type_num; slave_type++) {
> > +               if (!check_type2_vio_status(slave_type, &vio_idx, &index))
> > +                       if (!mtk_devapc_dump_vio_dbg(slave_type, &vio_idx,
> > +                                                    &index))
> > +                               continue;
> > +
> > +               /* Ensure that violation info are written before
> > +                * further operations
> > +                */
> > +               smp_mb();
> > +               normal = true;
> > +
> > +               mask_module_irq(slave_type, vio_idx, true);
> > +
> > +               if (clear_vio_status(slave_type, vio_idx))
> > +                       pr_warn(PFX "%s, %s:0x%x, %s:0x%x\n",
> > +                               "clear vio status failed",
> > +                               "slave_type", slave_type,
> > +                               "vio_index", vio_idx);
> > +
> > +               perm = get_permission(slave_type, index, vio_info->domain_id);
> > +
> > +               vio_master = mtk_devapc_ctx->soc->master_get
> > +                       (vio_info->master_id,
> > +                        vio_info->vio_addr,
> > +                        slave_type,
> > +                        vio_info->shift_sta_bit,
> > +                        vio_info->domain_id);
> 
> Call mt6873_bus_id_to_master() directly. For first patch, make things
> as simple as possible.

In devapc_violation_irq() function, we use common flow to handle each
devapc violation on different platforms. The master_get() has different
implementation on different platforms, that why it called indirectly.

Once we have new platform, we only have to update devapc-mtxxxx.c
instead of common handler flow.

> 
> > +
> > +               if (!vio_master) {
> > +                       pr_warn(PFX "master_get failed\n");
> > +                       vio_master = "UNKNOWN_MASTER";
> > +               }
> > +
> > +               pr_info(PFX "%s - %s:0x%x, %s:0x%x, %s:0x%x, %s:0x%x\n",
> > +                       "Violation", "slave_type", slave_type,
> > +                       "sys_index",
> > +                       device_info[slave_type][index].sys_index,
> > +                       "ctrl_index",
> > +                       device_info[slave_type][index].ctrl_index,
> > +                       "vio_index",
> > +                       device_info[slave_type][index].vio_index);
> > +
> > +               pr_info(PFX "%s %s %s %s\n",
> > +                       "Violation - master:", vio_master,
> > +                       "access violation slave:",
> > +                       device_info[slave_type][index].device);
> > +
> > +               devapc_vio_reason(perm);
> > +
> > +               devapc_extra_handler(slave_type, vio_master, vio_idx,
> > +                                    vio_info->vio_addr);
> > +
> > +               mask_module_irq(slave_type, vio_idx, false);
> > +       }
> > +
> > +       if (normal) {
> > +               spin_unlock_irqrestore(&devapc_lock, flags);
> > +               return IRQ_HANDLED;
> > +       }
> > +
> > +       spin_unlock_irqrestore(&devapc_lock, flags);
> > +       return IRQ_HANDLED;
> > +}
> > +

[snip]


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
