Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4275C43465
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 16:33:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B3B6239D1
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 16:33:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XG5RXh05";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QKd/jSJr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B3B6239D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fn1AGTNyAcxXTZvy259WQpONOwnZ3hruZMcDZZegiqk=; b=XG5RXh05UtsP5oVDlinHMA+GG
	oaZ62ZjI6E9xgNCZnfYPOG0gysSU/UtSVrl5zuHnyA1UbGbOWZEBq1GsHt3eckGRYqO2ZEVxafg5B
	/HyGWkccw4mVrJgl0UjeqEsTmkBb4J++DP59HiZKZxQB3vBIJ2/R4Q9C9wcKtTym+MfdCsa+uPlxj
	quUSZ9IStTWNEZhCZh3amuDQIJ5Q3iWalDayCGo1SuKbFjlWL7lmBvAiGtWnqW0u9fFvrBgaGX7bi
	3LYOwoFFxvKP6hOAIVW0PToQIRE+1GpAQ9XkGF0yDr8BRmGSNVhYj1zWdGL/RrNNcyH1OH557fjLH
	FbUdOlNGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKOkk-0000RE-Pp; Mon, 21 Sep 2020 16:33:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKOkh-0000ON-L9; Mon, 21 Sep 2020 16:33:20 +0000
X-UUID: 336fccce98144764b77ad60030edafdf-20200921
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Wqur0A/O4zCVq+R1isOtEyenroFb1CxOmxqgph5t7K8=; 
 b=QKd/jSJrHQBWbNJbHDv/cRTkTgSNh2JEb4G1Hu0mGc4J+To8yClG33Thd1Pp/TielJ5SNhNKT4MgQ/Y/p8yiCbU6wkSUZ+TlPI3ydIJ3eXwywfEkmKXvebgW22XitMSobzHWcFM9osPE9WgPhChiuLEVcLAEmFbQEEELxysu+Lo=;
X-UUID: 336fccce98144764b77ad60030edafdf-20200921
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1748694286; Mon, 21 Sep 2020 08:25:48 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Sep 2020 09:25:45 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Sep 2020 00:25:42 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Sep 2020 00:25:43 +0800
Message-ID: <1600705544.26565.0.camel@mtkswgap22>
Subject: Re: [PATCH v3 8/9] soc: mediatek: cmdq: add clear option in
 cmdq_pkt_wfe api
From: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Tue, 22 Sep 2020 00:25:44 +0800
In-Reply-To: <728ace99-e5e6-f8bf-1687-e9b51dfae8d7@gmail.com>
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594136714-11650-9-git-send-email-dennis-yc.hsieh@mediatek.com>
 <728ace99-e5e6-f8bf-1687-e9b51dfae8d7@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: CF75B351C78BB23BFE95C06D5BB530850A195FB215A3BAA5AF935BDF06F4FA5B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_123319_881734_689C0040 
X-CRM114-Status: GOOD (  25.25  )
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
Cc: Daniel Vetter <daniel@ffwll.ch>, wsd_upstream@mediatek.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Houlong Wei <houlong.wei@mediatek.com>, HS Liao <hs.liao@mediatek.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Matthias,


On Mon, 2020-09-21 at 18:19 +0200, Matthias Brugger wrote:
> 
> On 07/07/2020 17:45, Dennis YC Hsieh wrote:
> > Add clear parameter to let client decide if
> > event should be clear to 0 after GCE receive it.
> > 
> > Change since v2:
> > - Keep behavior in drm crtc driver and
> >    separate bug fix code into another patch.
> 
> This, should go...
> 
> > 
> > Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> > ---
> 
> ...here :)
> 
> I fixed to commit message and pushed the patch to v5.9-next/soc

got it, thanks a lot


Regards,
Dennis

> 
> Thanks!
> 
> >   drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |    2 +-
> >   drivers/soc/mediatek/mtk-cmdq-helper.c   |    5 +++--
> >   include/linux/mailbox/mtk-cmdq-mailbox.h |    3 +--
> >   include/linux/soc/mediatek/mtk-cmdq.h    |    5 +++--
> >   4 files changed, 8 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index ec6c9ffbf35e..c84e7a14d4a8 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -490,7 +490,7 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
> >   		mbox_flush(mtk_crtc->cmdq_client->chan, 2000);
> >   		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
> >   		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
> > -		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event);
> > +		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, true);
> >   		mtk_crtc_ddp_config(crtc, cmdq_handle);
> >   		cmdq_pkt_finalize(cmdq_handle);
> >   		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
> > diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > index d55dc3296105..505651b0d715 100644
> > --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> > +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > @@ -316,15 +316,16 @@ int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
> >   }
> >   EXPORT_SYMBOL(cmdq_pkt_write_s_mask_value);
> >   
> > -int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
> > +int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear)
> >   {
> >   	struct cmdq_instruction inst = { {0} };
> > +	u32 clear_option = clear ? CMDQ_WFE_UPDATE : 0;
> >   
> >   	if (event >= CMDQ_MAX_EVENT)
> >   		return -EINVAL;
> >   
> >   	inst.op = CMDQ_CODE_WFE;
> > -	inst.value = CMDQ_WFE_OPTION;
> > +	inst.value = CMDQ_WFE_OPTION | clear_option;
> >   	inst.event = event;
> >   
> >   	return cmdq_pkt_append_command(pkt, inst);
> > diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> > index efbd8a9eb2d1..d5a983d65f05 100644
> > --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> > +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> > @@ -28,8 +28,7 @@
> >    * bit 16-27: update value
> >    * bit 31: 1 - update, 0 - no update
> >    */
> > -#define CMDQ_WFE_OPTION			(CMDQ_WFE_UPDATE | CMDQ_WFE_WAIT | \
> > -					CMDQ_WFE_WAIT_VALUE)
> > +#define CMDQ_WFE_OPTION			(CMDQ_WFE_WAIT | CMDQ_WFE_WAIT_VALUE)
> >   
> >   /** cmdq event maximum */
> >   #define CMDQ_MAX_EVENT			0x3ff
> > diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> > index 34354e952f60..960704d75994 100644
> > --- a/include/linux/soc/mediatek/mtk-cmdq.h
> > +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> > @@ -182,11 +182,12 @@ int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
> >   /**
> >    * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
> >    * @pkt:	the CMDQ packet
> > - * @event:	the desired event type to "wait and CLEAR"
> > + * @event:	the desired event type to wait
> > + * @clear:	clear event or not after event arrive
> >    *
> >    * Return: 0 for success; else the error code is returned
> >    */
> > -int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event);
> > +int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear);
> >   
> >   /**
> >    * cmdq_pkt_clear_event() - append clear event command to the CMDQ packet
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
