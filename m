Return-Path: <SRS0=PvK4=BS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D669DC433DF
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Aug 2020 00:57:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0237214F1
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Aug 2020 00:57:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NCzOU9dh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uGADEwR2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0237214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UCh1qfRp5WCtG384Wuy5Vai942voGf122FqsfDgms6o=; b=NCzOU9dhrDDCB/8gRjI0cuAQH
	AIrCNNTLTCn9qcxOJVlhlYx9IiV5fwzRGWQgV/4mhd0HMSiTqw6yLUy9aZsr1bftniEOyRPIQgO3H
	ysEOOSGlbYJdjMRjlyNUKW2SpExNuF9wTxEF41UU1B18Xcrm2nAanx360+zer66FdAtrz8fq/YwMn
	8NKZWnn1y4+45XjQAIgTJIuSFIp3TH+INlYBKEgEiqJ29ZmCfnwRPkDe6iJJz2PFkuyETjIdQfSiy
	qEyW19S9YGjH2p6XHj6ibo29usW+DICDKdw83HUjhPm5O7CtyLxrSC264rDiPvH3EsRAYZs0i6kze
	kd7okq5eQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k4DAn-0008EQ-Ir; Sat, 08 Aug 2020 00:57:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4DAk-0008DQ-O8; Sat, 08 Aug 2020 00:57:20 +0000
X-UUID: b5f5d70a0a2a4b19a49a1499b4af8b14-20200807
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=tl8qgIAJrElb58CrFhs8MW6abG2NpTHnjHQaoObZ1ys=; 
 b=uGADEwR2dEIeOSXciGaBDzB+EFJYyT7NWFZ5bQgbTLGsLSfU8qQGJ+1a/7MYv6fUvVLNcX6IOChpVNG+/5uu6wxTJdPYXMEvfB1ZFzOeR2dwfToPzTkOCiEr5INRNErAQ1WDjQGm6AgsR4PFo3AgzLY9JjN78FgnGGKUKl14dR8=;
X-UUID: b5f5d70a0a2a4b19a49a1499b4af8b14-20200807
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2108174467; Fri, 07 Aug 2020 16:57:09 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 Aug 2020 17:57:07 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs02n2.mediatek.inc
 (172.21.101.101) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 8 Aug 2020 08:57:06 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 8 Aug 2020 08:57:04 +0800
Message-ID: <1596848179.8263.11.camel@mhfsdcap03>
Subject: Re: [v2] i2c: mediatek: Fix i2c_spec_values description
From: Qii Wang <qii.wang@mediatek.com>
To: <matthias.bgg@kernel.org>
Date: Sat, 8 Aug 2020 08:56:19 +0800
In-Reply-To: <20200807131904.6515-1-matthias.bgg@kernel.org>
References: <20200807131904.6515-1-matthias.bgg@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 228AB456F0D1809A0D32EF84CD12D6E7106F8FEF72C429D702EDD5E86D0510A32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200807_205718_925080_D5798BB8 
X-CRM114-Status: GOOD (  17.81  )
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
Cc: Matthias Brugger <mbrugger@suse.com>, wsa@the-dreams.de,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, matthias.bgg@gmail.com, yingjoe.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-08-07 at 15:19 +0200, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> The struct i2c_spec_values have it's members documented but is
> missing the starting '@', which leads to warings like:
> 
> drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member 'min_low_ns' not described in 'i2c_spec_values'
> 
> We also delete min_high_ns member as it is not used in the code.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>

Reviewed-by: Qii Wang <qii.wang@mediatek.com>

> ---
> 
> Changes since v1:
> delete mint_high_ns member
> 
>  drivers/i2c/busses/i2c-mt65xx.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index e889f74703e4..efc14041d45b 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -253,14 +253,13 @@ struct mtk_i2c {
>  
>  /**
>   * struct i2c_spec_values:
> - * min_low_ns: min LOW period of the SCL clock
> - * min_su_sta_ns: min set-up time for a repeated START condition
> - * max_hd_dat_ns: max data hold time
> - * min_su_dat_ns: min data set-up time
> + * @min_low_ns: min LOW period of the SCL clock
> + * @min_su_sta_ns: min set-up time for a repeated START condition
> + * @max_hd_dat_ns: max data hold time
> + * @min_su_dat_ns: min data set-up time
>   */
>  struct i2c_spec_values {
>  	unsigned int min_low_ns;
> -	unsigned int min_high_ns;
>  	unsigned int min_su_sta_ns;
>  	unsigned int max_hd_dat_ns;
>  	unsigned int min_su_dat_ns;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
