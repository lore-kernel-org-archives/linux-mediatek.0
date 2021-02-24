Return-Path: <SRS0=l1Zb=H2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3774BC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Feb 2021 08:42:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ECA7601FF
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Feb 2021 08:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ECA7601FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yehdroWZABd35DrHIpbZn1wSoSHMYPrI6riE9L7OPw8=; b=zF/8zIs6StwQ5zzYFpm+PTiTK
	ehAaLQsSn6dBMU+fInJqsWO8VRp2oV1khHPjYmdiQj8XqqXfnY7p589sMvCiFLyYXl5ff6sNOw+t/
	/WYSQ2MGNqwDs5eFxIgjvczcK6QdPJ5/sycOgjNJ5GIEfA0DUY4/lNQCVadOvYV/Jr8ddg50PNDrn
	4r8EnhRJkyA0UHLxvY4s6coMQDwacvKZsyjEA/0N3ZCHgrKSx5bQjuUDQUsuNsmGbB6TXKs+AlzA6
	aV43OZzYsELLQW4kByFUWcW0X/cBND+HelDcaFcODaDfpb/O5CY7vRrzhMfrU1+6vg+Yzu4HoRa2S
	2IlQmU7rw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEpkh-0005ZJ-J7; Wed, 24 Feb 2021 08:42:35 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEpkd-0005Yg-GA; Wed, 24 Feb 2021 08:42:32 +0000
Received: by mail-ej1-x630.google.com with SMTP id t11so1642070ejx.6;
 Wed, 24 Feb 2021 00:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XVG9kkpo/lXRBZutmGYmQBFfXrsF0BkcDwDodruvH/c=;
 b=rafZ6ScglMDahYvRIlpX2R5wkAI9vtSwEx4LGzYdK88Szfo3hqY+8beG5h+XBbyTYZ
 gN+k68/9zGJu5rR1rHltKG8X8CTZffU0B1ICjjfp6lMRE4N9+RC7SFVkYWuEIO/GkfRB
 5fzuUZB7AIPoAbYYfTKakHRogP0MTRH4DAtJEf0BlhkASlzsgo0O1D+WZrSOvbOX6UBo
 HIUxzhi9v5znmgZaFB2RtJ7u2BVg5fYx6En1Xfv0cuhpbdpzCW+e2ssVVJkebNLognUH
 +pkUISgDyEGLZt/IPGltODNcz5/BtU+1o+h/t/W1irL+K7FkAtn67v/JwjdX96AEqyVC
 MSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XVG9kkpo/lXRBZutmGYmQBFfXrsF0BkcDwDodruvH/c=;
 b=fUDs/ekinc5BK5CUOYwwtUoWXinWIIQT3wxinTkPPVLFmnCwpCKDASAt3tmWdEm9ka
 qVZVsCHckD3TCABXqvWg02CstfM52EQzjCYpSwCVNvddYY7W0uDUbFq3faDXn4SfAAml
 nOlGKf1LuaQ8lOFZFiAP2JXDUYAsssJtr62hfdvRBLEBfiym7kUg8d6tkbUrR0IvcECj
 cxjNUTPQDYqkN7dHpjjXUmUtbb497vGcFExL2tC0WFe3ed9qIHobm3fFunuNllRL1nU8
 1RM2e2oFaczxNeeYBgGBAAystWLkyUiMSNFzrFMUNnnC5+B19ZUa4vSU6/qHYsb98Fu4
 ubTA==
X-Gm-Message-State: AOAM533BxnlQTZEV2g4SCU80mXIqhJs7TDWaKdnEqHQXMg/tbKfgArbI
 yFnmteg91JUphNfA8T2YDOo=
X-Google-Smtp-Source: ABdhPJz9qlNumriQMVcc5+WWdSZbUlP/J55REHufHMwlsZDBxMiiGgA9Jk88kJX7NGlU+EEblwLHIA==
X-Received: by 2002:a17:906:3786:: with SMTP id
 n6mr15645084ejc.496.1614156148700; 
 Wed, 24 Feb 2021 00:42:28 -0800 (PST)
Received: from skbuf ([188.25.217.13])
 by smtp.gmail.com with ESMTPSA id f11sm790947eje.107.2021.02.24.00.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 00:42:28 -0800 (PST)
Date: Wed, 24 Feb 2021 10:42:26 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Subject: Re: [RFC net-next] net: dsa: mt7530: support MDB and bridge flag
 operations
Message-ID: <20210224084226.idtvqtdpl5vbstup@skbuf>
References: <20210224081018.24719-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210224081018.24719-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_034231_613396_877C2C2A 
X-CRM114-Status: GOOD (  21.12  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 24, 2021 at 04:10:18PM +0800, DENG Qingfang wrote:
> Support port MDB and bridge flag operations.
> 
> As the hardware can manage multicast forwarding itself, offload_fwd_mark
> can be unconditionally set to true.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
> Changes:
> Add bridge flag operations and resend as RFC
> 
>  drivers/net/dsa/mt7530.c | 123 +++++++++++++++++++++++++++++++++++++--
>  drivers/net/dsa/mt7530.h |   1 +
>  net/dsa/tag_mtk.c        |  14 +----
>  3 files changed, 121 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index bca4fc724e45..341a6b3f7ef6 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -1000,8 +1000,9 @@ mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
>  	mt7530_write(priv, MT7530_PVC_P(port),
>  		     PORT_SPEC_TAG);
>  
> -	/* Unknown multicast frame forwarding to the cpu port */
> -	mt7530_rmw(priv, MT7530_MFC, UNM_FFP_MASK, UNM_FFP(BIT(port)));
> +	/* Disable flooding by default */

I think the comment is incorrect and this _enables_ flooding (which btw
is ok until we get the address filtering thing sorted out).

> +	mt7530_rmw(priv, MT7530_MFC, BC_FFP_MASK | UNM_FFP_MASK | UNU_FFP_MASK,
> +		   BC_FFP(BIT(port)) | UNM_FFP(BIT(port)) | UNU_FFP(BIT(port)));
>  
>  	/* Set CPU port number */
>  	if (priv->id == ID_MT7621)
> @@ -1138,6 +1139,55 @@ mt7530_stp_state_set(struct dsa_switch *ds, int port, u8 state)
>  	mt7530_rmw(priv, MT7530_SSP_P(port), FID_PST_MASK, stp_state);
>  }
>  
> +static int
> +mt7530_port_pre_bridge_flags(struct dsa_switch *ds, int port,
> +			     struct switchdev_brport_flags flags,
> +			     struct netlink_ext_ack *extack)
> +{
> +	if (flags.mask & ~(BR_AUTO_MASK | BR_MCAST_FLOOD | BR_BCAST_FLOOD))
> +		return -EINVAL;

I think BR_AUTO_MASK is confusing (because it is internal to the bridge
layer) and could be better expressed as BR_FLOOD | BR_LEARNING.

> +
> +	return 0;
> +}
> +

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
