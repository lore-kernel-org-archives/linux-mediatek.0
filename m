Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C28C4727F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:24:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D984521D7F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:24:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qd0h+6Wv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jgeYgyNN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D984521D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TA6ulUGyKfQG74+QOXXCd3tHz9J7h8UXBWeL5z9Kl1E=; b=qd0h+6WvnA584uhwbLzCWuhAv
	3uQgPzDPNvPvQ7gNSAIPrED66EzOzO5DXmev8pL98iO9eCzzpBzx7Z1i30icmLYPn73E9dXnnawq1
	MY3RWgkCaqHO3mfECM4S+n9obQxrDbUHfC2h3fpPFkLQndmeQmvTuDM6N62Sz3ApMjdRQOVLQFar4
	TvB/pt4F7kJTK3TqujUaP+WFEmLrT6L2AIJWZTlk+SvO2ekXDcuICLyETulmcLO89MFES1+byNTKP
	l8NJCkvkwbZiMB3SsoCxjR0tI5+iAhL0OaPnAkIKq7Fw96J8VQgPMiXLLTzmY6e7tIOJVkS8XpbKs
	1tSatyrDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLh98-0004v0-Bm; Fri, 25 Sep 2020 06:23:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLh8p-0004mm-Og; Fri, 25 Sep 2020 06:23:36 +0000
X-UUID: 6bf1e30ec45340ae97d97a0b93bd206a-20200924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5m2HSwffSuI932K1En8gKb5kFERaGLGtuyzTCslXPfc=; 
 b=jgeYgyNNiBcGA7vxuVF7jRR06cqBSuf5mHsIn+UBvA0iiQ7/sKblmfJ2cl72TNKMeyPAwtsm1/Pl+b7dJ9x0uEWz8Gl3Uja4S8Ek3kewahVqzIEoRLvLVNq9WmhaglYnMrtRS6mLcZ7Q22xIvN4PSOQXRQrTfTvf4DmA+qb5D5k=;
X-UUID: 6bf1e30ec45340ae97d97a0b93bd206a-20200924
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1975715978; Thu, 24 Sep 2020 22:23:31 -0800
Received: from MTKMBS33DR.mediatek.inc (172.27.6.106) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Sep 2020 23:14:57 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 25 Sep 2020 14:14:55 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Sep 2020 14:14:55 +0800
Message-ID: <1601014350.29336.3.camel@mhfsdcap03>
Subject: Re: [PATCH RESEND v3 02/11] usb: gadget: bdc: remove
 bdc_ep_set_halt() declaration
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>
Date: Fri, 25 Sep 2020 14:12:30 +0800
In-Reply-To: <1601013702-29079-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1601013702-29079-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0ED28E65ED35707369240D5F2A3D4650E2E08390086064CF86FD6E10BFE9FAFF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_022335_986601_FBD420A5 
X-CRM114-Status: GOOD (  14.25  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Al
 Cooper <alcooperx@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 Sasi Kumar <sasi.kumar@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Colin Ian King <colin.king@canonical.com>, Nathan
 Chancellor <natechancellor@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Felipe,

   Sorry again, please ignore these ones, 01/11 is lost, will resend
  
On Fri, 2020-09-25 at 14:01 +0800, Chunfeng Yun wrote:
> No definition for bdc_ep_set_halt(), so remove it.
> 
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
> v3: add acked-by Florian
> 
> v2: add Cc Florian
> ---
>  drivers/usb/gadget/udc/bdc/bdc_cmd.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/bdc/bdc_cmd.h b/drivers/usb/gadget/udc/bdc/bdc_cmd.h
> index 373e674..a3a6dbd 100644
> --- a/drivers/usb/gadget/udc/bdc/bdc_cmd.h
> +++ b/drivers/usb/gadget/udc/bdc/bdc_cmd.h
> @@ -16,7 +16,6 @@
>  int bdc_stop_ep(struct bdc *, int);
>  int bdc_ep_set_stall(struct bdc *, int);
>  int bdc_ep_clear_stall(struct bdc *, int);
> -int bdc_ep_set_halt(struct bdc_ep *, u32 , int);
>  int bdc_ep_bla(struct bdc *, struct bdc_ep *, dma_addr_t);
>  int bdc_function_wake(struct bdc*, u8);
>  int bdc_function_wake_fh(struct bdc*, u8);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
