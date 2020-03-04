Return-Path: <SRS0=cHEQ=4V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D07C3F2D1
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 02:26:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F11C020866
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 02:26:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EAHfv9V5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OpZDbhpr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F11C020866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTxm0olgotPKua8SvE8aP/YWw6iJGmQ6DwUB+6VfvF0=; b=EAHfv9V5TjLuov
	xT25hk+TzSPyrgG6nHuz8UvyhpIFA/K10NEF3vWuKxkYujDOvYoEw1BpMYBvGQdfv1eBQxGGQtRgq
	1nWhyoDqlHFzR7ZsVQcT4pLtLxmb21MKW2lTV5Sem5JI/GN7M6A4JnCAfZV+keuELJOXpM5PR0F7o
	HtLrF7LooJMzlkn44LsNiY6IFU4kjO/44BXJCwWNt9V0SOtyu0HMqtKahd/yID3ITqylZg9ug00Il
	rb20oPZKf4+aGlFDtpqsMwxpNignFCc0niZmVXhv1nb51V+UfAQQJWk+BqhvLE3ZVTQOWcAFHBeLF
	HyfyIR4EnttVoIsPyaig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9JjM-0007kV-Nr; Wed, 04 Mar 2020 02:25:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9JjJ-0007js-Q7; Wed, 04 Mar 2020 02:25:51 +0000
X-UUID: a1d8f66878334195943ad9bd250cf075-20200303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=WRwJNL3/LSu9YAz4lzMmh4KqQ+Mz5WRqM0Z4EacS3BA=; 
 b=OpZDbhpry9lCxT8XBLFuk96dgH/gU7hMsiAKr6zInqpN7CzkwjGPHy3zWDyBWi64oEYyqAbJi7EE3/gTOpHiJuaelpeL2K05QNWxg3NK0tq64zyLBiJvKXWM1KTektECPOkVJRf+qysm9+bv+GggZwdj08lfoo2gyA1iFALswp4=;
X-UUID: a1d8f66878334195943ad9bd250cf075-20200303
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1366308211; Tue, 03 Mar 2020 18:25:45 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Mar 2020 18:27:01 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Mar 2020 10:23:40 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 4 Mar 2020 10:23:04 +0800
Message-ID: <1583288736.14250.2.camel@mtksdccf07>
Subject: Re: [RFC PATCH v1] scsi: ufs-mediatek: add inline encryption support
From: Stanley Chu <stanley.chu@mediatek.com>
To: Eric Biggers <ebiggers@kernel.org>
Date: Wed, 4 Mar 2020 10:25:36 +0800
In-Reply-To: <20200302180231.GB98133@gmail.com>
References: <20200302091138.10341-1-stanley.chu@mediatek.com>
 <20200302180231.GB98133@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_182549_861268_F9BCBA82 
X-CRM114-Status: GOOD (  20.65  )
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
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 light.hsieh@mediatek.com, satyat@google.com, avri.altman@wdc.com,
 linux-fscrypt@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Eric,

On Mon, 2020-03-02 at 10:02 -0800, Eric Biggers wrote:
> On Mon, Mar 02, 2020 at 05:11:38PM +0800, Stanley Chu wrote:
> > Add inline encryption support to ufs-mediatek.
> > 
> > The standards-compliant parts, such as querying the crypto capabilities
> > and enabling crypto for individual UFS requests, are already handled by
> > ufshcd-crypto.c, which itself is wired into the blk-crypto framework.
> > 
> > However MediaTek UFS host requires a vendor-specific hce_enable operation
> > to allow crypto-related registers being accessed normally in kernel.
> > After this step, MediaTek UFS host can work as standard-compliant host
> > for inline-encryption related functions.
> > 
> > This patch is rebased to the latest wip-inline-encryption branch in
> > Eric Biggers's git:
> > https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/
> 
> Please don't use a random work-in-progress branch from my git repository (which
> hasn't been updated to the v7 patchset yet and will be rebased); use instead:
> 
> 	Repo: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
> 	Tag: inline-encryption-v7
> 
> Also, this patch doesn't apply to either branch anyway:
> 
> Applying: scsi: ufs-mediatek: add inline encryption support
> Using index info to reconstruct a base tree...
> error: patch failed: drivers/scsi/ufs/ufs-mediatek.c:15
> error: drivers/scsi/ufs/ufs-mediatek.c: patch does not apply
> error: patch failed: drivers/scsi/ufs/ufs-mediatek.h:58
> error: drivers/scsi/ufs/ufs-mediatek.h: patch does not apply
> error: Did you hand edit your patch?

Sorry for this.
I rebased this patch as RFC v2 to below tag,

	Repo: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 	Tag: inline-encryption-v7


> > diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
> > index 53eae5fe2ade..12d01fd3d5e1 100644
> > --- a/drivers/scsi/ufs/ufs-mediatek.c
> > +++ b/drivers/scsi/ufs/ufs-mediatek.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/soc/mediatek/mtk_sip_svc.h>
> >  
> >  #include "ufshcd.h"
> > +#include "ufshcd-crypto.h"
> >  #include "ufshcd-pltfrm.h"
> >  #include "ufs_quirks.h"
> >  #include "unipro.h"
> > @@ -24,6 +25,9 @@
> >  	arm_smccc_smc(MTK_SIP_UFS_CONTROL, \
> >  		      cmd, val, 0, 0, 0, 0, 0, &(res))
> >  
> > +#define ufs_mtk_crypto_ctrl(res, enable) \
> > +	ufs_mtk_smc(UFS_MTK_SIP_CRYPTO_CTRL, enable, res)
> > +
> >  #define ufs_mtk_ref_clk_notify(on, res) \
> >  	ufs_mtk_smc(UFS_MTK_SIP_REF_CLK_NOTIFICATION, on, res)
> >  
> > @@ -66,7 +70,27 @@ static void ufs_mtk_cfg_unipro_cg(struct ufs_hba *hba, bool enable)
> >  	}
> >  }
> >  
> > -static int ufs_mtk_bind_mphy(struct ufs_hba *hba)
> > +static void ufs_mtk_crypto_enable(struct ufs_hba *hba)
> > +{
> > +	struct arm_smccc_res res;
> > +
> > +	ufs_mtk_crypto_ctrl(res, 1);
> > +	if (res.a0) {
> > +		dev_info(hba->dev, "%s: crypto enable failed, err: %lu\n",
> > +			 __func__, res.a0);
> > +	}
> > +}
> > +
> > +static int ufs_mtk_hce_enable_notify(struct ufs_hba *hba,
> > +				     enum ufs_notify_change_status status)
> > +{
> > +	if (status == PRE_CHANGE && ufshcd_hba_is_crypto_supported(hba))
> > +		ufs_mtk_crypto_enable(hba);
> > +
> > +	return 0;
> > +}
> > +
> > +int ufs_mtk_bind_mphy(struct ufs_hba *hba)
> >  {
> >  	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
> >  	struct device *dev = hba->dev;
> > @@ -494,6 +518,7 @@ static struct ufs_hba_variant_ops ufs_hba_mtk_vops = {
> >  	.name                = "mediatek.ufshci",
> >  	.init                = ufs_mtk_init,
> >  	.setup_clocks        = ufs_mtk_setup_clocks,
> > +	.hce_enable_notify   = ufs_mtk_hce_enable_notify,
> >  	.link_startup_notify = ufs_mtk_link_startup_notify,
> >  	.pwr_change_notify   = ufs_mtk_pwr_change_notify,
> >  	.apply_dev_quirks    = ufs_mtk_apply_dev_quirks,
> > diff --git a/drivers/scsi/ufs/ufs-mediatek.h b/drivers/scsi/ufs/ufs-mediatek.h
> > index fccdd979d6fb..5ebaa59898bf 100644
> > --- a/drivers/scsi/ufs/ufs-mediatek.h
> > +++ b/drivers/scsi/ufs/ufs-mediatek.h
> > @@ -58,6 +58,7 @@
> >   */
> >  #define MTK_SIP_UFS_CONTROL               MTK_SIP_SMC_CMD(0x276)
> >  #define UFS_MTK_SIP_DEVICE_RESET          BIT(1)
> > +#define UFS_MTK_SIP_CRYPTO_CTRL           BIT(2)
> >  #define UFS_MTK_SIP_REF_CLK_NOTIFICATION  BIT(3)
> 
> But if this is all that's needed to get inline crypto working with Mediatek UFS,
> that's great news.

Thanks for your review :)

Stanley Chu



> 
> Thanks!
> 
> - Eric

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
