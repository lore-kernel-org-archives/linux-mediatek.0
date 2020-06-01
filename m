Return-Path: <SRS0=JxEE=7O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A6FC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2020 02:51:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E88C206A4
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2020 02:51:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I0hb7Rqf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qOCe4LpU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E88C206A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XwxLrdJWnqycAtjN1irLAqheZMlqBUEoy6XnQXlbqAg=; b=I0hb7RqfcUibuX
	BcNzNrRscUvzsEtaGR4llBzUqqNBjfizrpzyl5ntXWtTMMT9mS68D5+h817AzBm0koPV91ZoshSbI
	n7yDV7HXhq4ubcc9mvrmiq3odso/eS8uY8BgCGppE/FVdESgcQ7oiNxkfkfAkzdbAqK9SsXYILXu0
	3+ZM4Gm4z3ZnawbNWQhHX1xPPdetApyG7mv0Jdn1J2Sfovge0zjksOAvd0uQLBm8Z06al+VM+aeo6
	F+C//VWFP9glq2xA1yeAQbjb6HVaJ43ebrZFccuaVRYInszvxiirPxZ91v7lxU6cr14KZ7rsbqykD
	pQXGzMZfcTiXnmzywm3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfaXr-0007G0-TU; Mon, 01 Jun 2020 02:51:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfaXp-0007FQ-BE; Mon, 01 Jun 2020 02:51:22 +0000
X-UUID: fe1fab3fc3524ebbbf146d8040fc23ca-20200531
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5OOtmndFogETs8MsnbhnGCSCp5lzPK/Ub28tiH9HSm4=; 
 b=qOCe4LpUd6d5OFeHIjXgXEd/HYSO3uLFU5JBSAVcw3RvIDOtb4IG+P2dzNy/kf89qqg4lfFazYiZdCrdroVm4Dsgz4ptdKi5tUw4Sae2vSNm+LwHQXylTHu1fkfY/qBeeXpmksf7/RbgPS56a5Vp9T2wjivjUXWuFnXEuBRRTAE=;
X-UUID: fe1fab3fc3524ebbbf146d8040fc23ca-20200531
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1768681985; Sun, 31 May 2020 18:51:19 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 31 May 2020 19:41:15 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Jun 2020 10:41:08 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 1 Jun 2020 10:41:07 +0800
Message-ID: <1590979273.15486.0.camel@mtkswgap22>
Subject: Re: [PATCH v6] support gce on mt6779 platform
From: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 1 Jun 2020 10:41:13 +0800
In-Reply-To: <CABb+yY16FzgafSYRo8DuVMttqUR5JVzXDsaP2rX+UnrNOD6k2A@mail.gmail.com>
References: <1590685491-17107-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <CABb+yY16FzgafSYRo8DuVMttqUR5JVzXDsaP2rX+UnrNOD6k2A@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 23F5E0BF1671CC4EE062D7B349A502EB7F010BB185DCAB11634C1C6C2FE40B6C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200531_195121_392589_1B9C8819 
X-CRM114-Status: GOOD (  14.85  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wsd_upstream@mediatek.com,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, HS Liao <hs.liao@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jassi,

Thanks for your comment

On Sat, 2020-05-30 at 15:34 -0500, Jassi Brar wrote:
> On Thu, May 28, 2020 at 12:05 PM Dennis YC Hsieh
> <dennis-yc.hsieh@mediatek.com> wrote:
> >
> > This patch support gce on mt6779 platform.
> >
> > Change since v5:
> > - spearate address shift code in client helper and mailbox controller
> > - separate write_s/write_s_mask and write_s_value/write_s_mask_value so that
> >   client can decide use mask or not
> > - fix typo in header
> >
> > Change since v4:
> > - do not clear disp event again in drm driver
> > - symbolize value 1 to jump relative
> >
> > [... snip ...]
> >
> >
> >
> > Dennis YC Hsieh (16):
> >   dt-binding: gce: add gce header file for mt6779
> >   mailbox: cmdq: variablize address shift in platform
> >   mailbox: cmdq: support mt6779 gce platform definition
> >   mailbox: mediatek: cmdq: clear task in channel before shutdown
> >   soc: mediatek: cmdq: return send msg error code
> >   soc: mediatek: cmdq: add address shift in jump
> >   soc: mediatek: cmdq: add assign function
> >   soc: mediatek: cmdq: add write_s function
> >   soc: mediatek: cmdq: add write_s_mask function
> >   soc: mediatek: cmdq: add read_s function
> >   soc: mediatek: cmdq: add write_s value function
> >   soc: mediatek: cmdq: add write_s_mask value function
> >   soc: mediatek: cmdq: export finalize function
> >   soc: mediatek: cmdq: add jump function
> >   soc: mediatek: cmdq: add clear option in cmdq_pkt_wfe api
> >   soc: mediatek: cmdq: add set event function
> >
> >  .../devicetree/bindings/mailbox/mtk-gce.txt   |   8 +-
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |   3 +-
> >  drivers/mailbox/mtk-cmdq-mailbox.c            | 101 ++++++--
> >  drivers/soc/mediatek/mtk-cmdq-helper.c        | 163 ++++++++++++-
> >  include/dt-bindings/gce/mt6779-gce.h          | 222 ++++++++++++++++++
> >  include/linux/mailbox/mtk-cmdq-mailbox.h      |  10 +-
> >  include/linux/soc/mediatek/mtk-cmdq.h         | 125 +++++++++-
> >
> Please break the patchset into two. The lower mailbox related changes
> with soc changes on top.

Ok, I'll separate patches into two patchset, thanks.


Regards,
Dennis

> 
> thanks

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
