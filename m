Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6986DC636CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 21:07:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D7C8613FB
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 21:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D7C8613FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rY3FAW4JFYVJnH6uC75+5xDAxHEpZXCS8jv7Z/EGXaE=; b=Shcb0W2zYH43vV
	iFlbknO45WdsiF0y9r8hVkmhrwzWBZeSjlJcqB1/XRnZ2LCkRr7COSLvPsHQNStW+u1dsatjI+J+Z
	HdRVKM+6RppZYPJvdy1ufOBEKxRCAAD4ztDEjMToRmGUa3IBN7XYkJJuyfqEYkCpVTnqiC6Xvvr6w
	b9rD3uqbUeOFtN2kHB9Eiy9jzDcpRjXOWujAUpwII6xxkiW+7eXSBjBmGSTefEFoPo8mG/B0Lumnz
	Y8dOeqA284JoTxc2lPG+Mj/gXtxDYKeJiCNGv3Rwhv8lcJUlMu3m6uj/mLyBAlyhmapAM1pPmN7cT
	A9DLwoJhlX3PVa74Dlrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4V3B-005Fg7-4W; Fri, 16 Jul 2021 21:07:13 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4V2x-005FeG-OF; Fri, 16 Jul 2021 21:07:01 +0000
Received: by mail-wr1-x430.google.com with SMTP id f9so13501984wrq.11;
 Fri, 16 Jul 2021 14:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4pKHQr/tbhIkbF86KWS5quyjtsLNIoQ9B8exVpj2LvE=;
 b=imAamG32La2GeVnoJxdszWNMiUMaWujFLyvTENQHuWfTNRlb3SNnTdV2TWYAG1R2Iq
 m9X19q9TnKhGwiwjEH98ZQhJwckwrBhte8sRCGV17eJZMnpW2fdtMFrGUfeeoNSaTayd
 LNvkDS8mdvqtmEc5tJlf6wcLsvtMo1o4qYUjrh0PBKA5tzm6OrBhawxNiYgPW1gs0IPp
 vj0V9sc6Zjwq1IuJt4g70TdNSfiurt7XfQniw376QSwYntbenJpbGWiNTYwMWZno0VHp
 U6ArIOb7fhN+HtK0VjCI9PwBEWg2Hu987FF2a1GTl/wrOzQFCcEHcnvoCNdPYPcXTVIO
 2RsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4pKHQr/tbhIkbF86KWS5quyjtsLNIoQ9B8exVpj2LvE=;
 b=U0nqzev3veABRX0H0Po3MMek+94MlV1HvSAPj9JidCCcNYT9lxMHJ8t1SoxpHouzyC
 2iJ5bVAbEdig40qNOqMbnFV8mMgtent3UIn40ZhwV1t3qC4VP+XIWWp0RQfe2e7a+k52
 SHEJSxLX/P0rOKAXb7J9fpYnu8SR/QyMbtYwc9IxqL3fdc9LtiGwqh0aXTqpYKF/jTSu
 JGNLGfydW6JJyh9LzKOyPdgH76YaOwDdKquCB3mh2nsfJfANbhfznpdOBueU6p0hmso5
 I/OnTFV2VF4rdwWEs+KSX/0llClyHxh5ywEzIS8Zba7XBp7diva+M7zFEPj1Ti7KRjFw
 9OEw==
X-Gm-Message-State: AOAM530mvany4F2Nna2x/PviKkFDU/ciWYRVmgWYtnHZ1a/8How0AOGG
 +j2txo3208MCbYSKLW7Nrms=
X-Google-Smtp-Source: ABdhPJzjA0OaqPdB0BisEA9NQVoLMSvfu5B0rWbk6wjlzGlw9RLplrT5VwiaLaYOwPhAHtcCdcseAQ==
X-Received: by 2002:adf:a287:: with SMTP id s7mr14497864wra.120.1626469617176; 
 Fri, 16 Jul 2021 14:06:57 -0700 (PDT)
Received: from skbuf ([82.76.66.29])
 by smtp.gmail.com with ESMTPSA id d8sm11514867wrv.20.2021.07.16.14.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 14:06:56 -0700 (PDT)
Date: Sat, 17 Jul 2021 00:06:55 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: ericwouds@gmail.com
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 DENG Qingfang <dqfext@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [PATCH] mt7530 fix mt7530_fdb_write vid missing ivl bit
Message-ID: <20210716210655.i5hxcwau5tdq4zhb@skbuf>
References: <20210716153641.4678-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210716153641.4678-1-ericwouds@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_140659_857279_05633E5E 
X-CRM114-Status: GOOD (  25.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 16, 2021 at 05:36:39PM +0200, ericwouds@gmail.com wrote:
> From: Eric Woudstra <ericwouds@gmail.com>
>
> According to reference guides mt7530 (mt7620) and mt7531:
>
> NOTE: When IVL is reset, MAC[47:0] and FID[2:0] will be used to
> read/write the address table. When IVL is set, MAC[47:0] and CVID[11:0]
> will be used to read/write the address table.
>
> Since the function only fills in CVID and no FID, we need to set the
> IVL bit. The existing code does not set it.
>
> This is a fix for the issue I dropped here earlier:
>
> http://lists.infradead.org/pipermail/linux-mediatek/2021-June/025697.html
>
> With this patch, it is now possible to delete the 'self' fdb entry
> manually. However, wifi roaming still has the same issue, the entry
> does not get deleted automatically. Wifi roaming also needs a fix
> somewhere else to function correctly in combination with vlan.
>
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  drivers/net/dsa/mt7530.c | 1 +
>  drivers/net/dsa/mt7530.h | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 93136f7e6..9e4df35f9 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -366,6 +366,7 @@ mt7530_fdb_write(struct mt7530_priv *priv, u16 vid,
>  	int i;
>
>  	reg[1] |= vid & CVID_MASK;
> +	reg[1] |= ATA2_IVL;
>  	reg[2] |= (aging & AGE_TIMER_MASK) << AGE_TIMER;
>  	reg[2] |= (port_mask & PORT_MAP_MASK) << PORT_MAP;
>  	/* STATIC_ENT indicate that entry is static wouldn't
> diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
> index 334d610a5..b19b389ff 100644
> --- a/drivers/net/dsa/mt7530.h
> +++ b/drivers/net/dsa/mt7530.h
> @@ -79,6 +79,7 @@ enum mt753x_bpdu_port_fw {
>  #define  STATIC_EMP			0
>  #define  STATIC_ENT			3
>  #define MT7530_ATA2			0x78
> +#define  ATA2_IVL			BIT(15)
>
>  /* Register for address table write data */
>  #define MT7530_ATWD			0x7c
> --
> 2.25.1
>

Can VLAN-unaware FDB entries still be manipulated successfully after
this patch, since it changes 'fid 0' to be interpreted as 'vid 0'?

What is your problem with roaming exactly? Have you tried to disable
hardware address learning on the CPU port and set
ds->assisted_learning_on_cpu_port = true for mt7530?

Please note that since kernel v5.14, raw 'self' entries can no longer be
managed directly using 'bridge fdb', you need to use 'master static' and
go through the bridge:
https://www.kernel.org/doc/html/latest/networking/dsa/configuration.html#forwarding-database-fdb-management
You will need to update your 'bridgefdbd' program, if it proves to be at
all necessary to achieve what you want.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
