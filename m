Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E577C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 01:47:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FDC820693
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 01:47:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m9F6o4Lx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="E8eQCC3g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FDC820693
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r0CWrXsPoHYOZcuhQDeZV9AE4J6AnpGgi/0TWxPdFyw=; b=m9F6o4LxOXFlnQ
	QLwo7cb4w2nzha2t8+dQ40u+y4L5pCZoRTg8hO/MsAEuqIhee+Kk1VsDNXmOc5nl0HXhWxmWiZpRC
	67aSTys0lhwrSq6q7Vzdl5iWZSxzXl0RipNa9S5ny7927CVYFuCTFNMmGEFyt8otlF6mWsFPuIop2
	cQGzA6f0Snl/aq2jdN6TqfYHGircihlBG8y803iq1psxkcpJNWjOAyS6sQYLdEUeRH+VBtS2ki6w4
	9uFJoQXwtw9azBrI1WusRAPvnmYuDZqyrgQpssyhXaZbnsb04zfa6mn486FqI2LClQ+IbltcHgdWq
	Ws1BjTCzRk0zJEWEXN+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZ2yJ-0006o0-TE; Thu, 14 May 2020 01:47:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZ2yH-0006n3-8I; Thu, 14 May 2020 01:47:38 +0000
X-UUID: 67f9e8df95a146ed957d3d08d7ea1006-20200513
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Drge9OXYgbT+fFEdFivffpxHUog0+A3cvV/oIWxCy0o=; 
 b=E8eQCC3ggnQS0UGiA7OXfIXtk9/yM9/YzL5CssbiVK1y76v+bCyWf+UmyThF4nPkYhvWQI/M7NAhVbl9J/zpH8EXOjzB651RBGC/ZPEk1UMwx07M50pAqcHcyPxcGPk09AUmDiP5jGEJFdJhOxTWi696gSni5l+Xt/9espY9SuE=;
X-UUID: 67f9e8df95a146ed957d3d08d7ea1006-20200513
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1309554704; Wed, 13 May 2020 17:47:32 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 May 2020 18:37:29 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 May 2020 09:37:27 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 May 2020 09:37:25 +0800
Message-ID: <1589420249.3197.69.camel@mtkswgap22>
Subject: Re: [PATCH -next] scsi: ufs-mediatek: Make ufs_mtk_fixup_dev_quirks
 static
From: Stanley Chu <stanley.chu@mediatek.com>
To: ChenTao <chentao107@huawei.com>
Date: Thu, 14 May 2020 09:37:29 +0800
In-Reply-To: <20200514012655.127202-1-chentao107@huawei.com>
References: <20200514012655.127202-1-chentao107@huawei.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_184737_301548_FBA9D479 
X-CRM114-Status: GOOD (  12.45  )
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
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org, jejb@linux.ibm.com,
 linux-kernel@vger.kernel.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, alim.akhtar@samsung.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Tao,

On Thu, 2020-05-14 at 09:26 +0800, ChenTao wrote:
> Fix the following warning:
> 
> drivers/scsi/ufs/ufs-mediatek.c:585:6: warning:
> symbol 'ufs_mtk_fixup_dev_quirks' was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: ChenTao <chentao107@huawei.com>
> ---
>  drivers/scsi/ufs/ufs-mediatek.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
> index c543142554d3..73e4a4f9a3a2 100644
> --- a/drivers/scsi/ufs/ufs-mediatek.c
> +++ b/drivers/scsi/ufs/ufs-mediatek.c
> @@ -582,7 +582,7 @@ static int ufs_mtk_apply_dev_quirks(struct ufs_hba *hba)
>  	return 0;
>  }
>  
> -void ufs_mtk_fixup_dev_quirks(struct ufs_hba *hba)
> +static void ufs_mtk_fixup_dev_quirks(struct ufs_hba *hba)
>  {
>  	struct ufs_dev_info *dev_info = &hba->dev_info;
>  	u16 mid = dev_info->wmanufacturerid;

Thanks for fixing this.

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
