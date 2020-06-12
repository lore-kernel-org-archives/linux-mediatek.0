Return-Path: <SRS0=I3u4=7Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A191C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2020 03:05:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E81320853
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2020 03:05:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hxr0w9l1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rPRWkJxB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E81320853
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6DHXvG4pPtaCTX0JbRa1F8lUieMOSIB7/REeE6nRfcg=; b=Hxr0w9l1YGi5Xh
	lz2O/+V4KR/VA8fv2qY7KM7eMbK954YIXCIBgE64JmP3yUgt59SgzbSuGnIYRbFghXBg1O2ULsrcx
	9yNlJ7pGLIU3jMZIA7UsPH6jK0RrltROXGxupv7ENDkj+tlID0c7tPRUGioCaA6LqNJh7Myt4KpPH
	4WFMDn0GPfKPlrGGmgVJj1kKrEvas6HGkFDfKP0/EZEdPTP4cAQgvUEURdxfGyvXr9yXcERBIWyZw
	G2mJm4e096XMatdrMDNPlneFJm/hbHT1C/A400ELDlKqQLZZdl5BichDebnU4+6oiG+xgFmVG4OiQ
	oKibULYRNqeV3HKJ6cEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjZzv-0004xI-VG; Fri, 12 Jun 2020 03:04:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjZzs-0004we-Rf; Fri, 12 Jun 2020 03:04:50 +0000
X-UUID: a0a94743c2d247fb80686d977340cd5d-20200611
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4ugaD47iUL4BuPnMM1qrVPvyuTBGu1L6KG0vHWf0DCc=; 
 b=rPRWkJxBR1yYN75ni+N1ZK1CPz2zpQccPkSTbyJiJnKOxG70PpMbuijmNTC8y+u6jg1G3EIW+SH4WLGoqXH3Vk7qjuorjhVF2dbkojBksaEo27rYn5B7vLbRjFxzUsEOmY9rYpXNWjFgFsEREo8/K5C6e3Ga12x3psZCiO7VNzU=;
X-UUID: a0a94743c2d247fb80686d977340cd5d-20200611
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 99498391; Thu, 11 Jun 2020 19:04:39 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Jun 2020 20:03:58 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Jun 2020 11:03:56 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Jun 2020 11:03:56 +0800
Message-ID: <1591931042.32738.26.camel@mtkswgap22>
Subject: Re: [PATCH 2/2] soc: mediatek: devapc: add devapc-mt6873 driver
From: Neal Liu <neal.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 12 Jun 2020 11:04:02 +0800
In-Reply-To: <CAAOTY_8gOjr9nBUVA6oNu0v+D0Rc0AbhJ41wBCvDpMme+kuHmA@mail.gmail.com>
References: <1591698261-22639-1-git-send-email-neal.liu@mediatek.com>
 <1591698261-22639-3-git-send-email-neal.liu@mediatek.com>
 <CAAOTY__g3Fnwsoqx=x_tgdMii5K_L9TmF_9048XbAOSJwb-Cxg@mail.gmail.com>
 <1591867563.27949.9.camel@mtkswgap22>
 <CAAOTY_8gOjr9nBUVA6oNu0v+D0Rc0AbhJ41wBCvDpMme+kuHmA@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 005BB3DA2D65FC5B57A0519DAAFE8FDBD2C12F6D6217733C280C03F26BF6CFFA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_200448_900891_00621757 
X-CRM114-Status: GOOD (  16.49  )
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
 Matthias Brugger <matthias.bgg@gmail.com>, Neal Liu <neal.liu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Chun-Kuang,

[snip]
> > > > +/*
> > > > + * devapc_violation_irq - the devapc Interrupt Service Routine (ISR) will dump
> > > > + *                       violation information including which master violates
> > > > + *                       access slave.
> > > > + */
> > > > +static irqreturn_t devapc_violation_irq(int irq_number, void *dev_id)
> > > > +{
> > > > +       u32 slave_type_num = mtk_devapc_ctx->soc->slave_type_num;
> > > > +       const struct mtk_device_info **device_info;
> > > > +       struct mtk_devapc_vio_info *vio_info;
> > > > +       int slave_type, vio_idx, index;
> > > > +       const char *vio_master;
> > > > +       unsigned long flags;
> > > > +       bool normal;
> > > > +       u8 perm;
> > > > +
> > > > +       spin_lock_irqsave(&devapc_lock, flags);
> > > > +
> > > > +       device_info = mtk_devapc_ctx->soc->device_info;
> > > > +       vio_info = mtk_devapc_ctx->soc->vio_info;
> > > > +       normal = false;
> > > > +       vio_idx = -1;
> > > > +       index = -1;
> > > > +
> > > > +       /* There are multiple DEVAPC_PD */
> > > > +       for (slave_type = 0; slave_type < slave_type_num; slave_type++) {
> > > > +               if (!check_type2_vio_status(slave_type, &vio_idx, &index))
> > > > +                       if (!mtk_devapc_dump_vio_dbg(slave_type, &vio_idx,
> > > > +                                                    &index))
> > > > +                               continue;
> > > > +
> > > > +               /* Ensure that violation info are written before
> > > > +                * further operations
> > > > +                */
> > > > +               smp_mb();
> > > > +               normal = true;
> > > > +
> > > > +               mask_module_irq(slave_type, vio_idx, true);
> > > > +
> > > > +               if (clear_vio_status(slave_type, vio_idx))
> > > > +                       pr_warn(PFX "%s, %s:0x%x, %s:0x%x\n",
> > > > +                               "clear vio status failed",
> > > > +                               "slave_type", slave_type,
> > > > +                               "vio_index", vio_idx);
> > > > +
> > > > +               perm = get_permission(slave_type, index, vio_info->domain_id);
> > > > +
> > > > +               vio_master = mtk_devapc_ctx->soc->master_get
> > > > +                       (vio_info->master_id,
> > > > +                        vio_info->vio_addr,
> > > > +                        slave_type,
> > > > +                        vio_info->shift_sta_bit,
> > > > +                        vio_info->domain_id);
> > >
> > > Call mt6873_bus_id_to_master() directly. For first patch, make things
> > > as simple as possible.
> >
> > In devapc_violation_irq() function, we use common flow to handle each
> > devapc violation on different platforms. The master_get() has different
> > implementation on different platforms, that why it called indirectly.
> >
> > Once we have new platform, we only have to update devapc-mtxxxx.c
> > instead of common handler flow.
> 
> You just upstream one SoC now, so I have no information of 2nd SoC.
> Without the 2nd SoC, how do we know what is common and what is SoC special?
> So the first patch should not consider the things which does not exist yet.
> 
> Regards,
> Chun-Kuang.
> 

It has lots of refactoring work need to do if you really want make it
"simple". Could I explain more details and let you judge it is simple
enough?
For most MediaTek DEVAPC hw, the violation interrupt handling sequence
is shown below.

1. Domain processor receives a interrupt issued by DEVAPC.
2. Software read the violation status and identify it.
3. Software read the debug information which are stored in hw register.
	a. debug information includes master ID, domain ID, violation
address, ...
4. Transfer debug information to human readable strings.
5. Extra handler to dispatch owner directly.

What we really care is which master violates the rules, and which slave
had been accessed unexpectedly.

Here are platform specific information:
1. Slaves layout (platform devices)
2. hw register layout which are stored violation information
3. Master ID mapping table
4. Domain ID mapping table

Hope these steps could help you understand what is common and what is
SoC specific. If you want to see the 2nd SoC's driver, I can also send
it for you to take a look.

Thanks,
Neal

> >
> > >
> > > > +
> > > > +               if (!vio_master) {
> > > > +                       pr_warn(PFX "master_get failed\n");
> > > > +                       vio_master = "UNKNOWN_MASTER";
> > > > +               }
> > > > +
> > > > +               pr_info(PFX "%s - %s:0x%x, %s:0x%x, %s:0x%x, %s:0x%x\n",
> > > > +                       "Violation", "slave_type", slave_type,
> > > > +                       "sys_index",
> > > > +                       device_info[slave_type][index].sys_index,
> > > > +                       "ctrl_index",
> > > > +                       device_info[slave_type][index].ctrl_index,
> > > > +                       "vio_index",
> > > > +                       device_info[slave_type][index].vio_index);
> > > > +
> > > > +               pr_info(PFX "%s %s %s %s\n",
> > > > +                       "Violation - master:", vio_master,
> > > > +                       "access violation slave:",
> > > > +                       device_info[slave_type][index].device);
> > > > +
> > > > +               devapc_vio_reason(perm);
> > > > +
> > > > +               devapc_extra_handler(slave_type, vio_master, vio_idx,
> > > > +                                    vio_info->vio_addr);
> > > > +
> > > > +               mask_module_irq(slave_type, vio_idx, false);
> > > > +       }
> > > > +
> > > > +       if (normal) {
> > > > +               spin_unlock_irqrestore(&devapc_lock, flags);
> > > > +               return IRQ_HANDLED;
> > > > +       }
> > > > +
> > > > +       spin_unlock_irqrestore(&devapc_lock, flags);
> > > > +       return IRQ_HANDLED;
> > > > +}
> > > > +
> >
> > [snip]
> >
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
