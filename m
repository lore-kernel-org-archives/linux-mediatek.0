Return-Path: <SRS0=+2NV=IN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F1CC433E9
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 20:03:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D013C64DDF
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 20:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D013C64DDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8ii1jiksSRhIBUv0Y5mnYe1mtnFW0LCJm1GYLgXgGgU=; b=j3BijLrfHWWfaXCDeVXUz1uVi
	LP4t2VQimvhZG2MhDl2hCVGqdoBC8cjIykYW8mTTnJL0tk8LFp46l4Av57iXAIIjHF5XrrkXwnSAI
	7plM+Kepx2jmAExIyklfcqLqmtqOCJvEFrxJchldvyrBR20lWsz2esAVHEETNlD7FOpkZJTmSYlEf
	MRTFiNcTz1eBnb2RwFbHjpgExGooffQbL/fzbc47blKTNF2XfCIjluhBn5icFRvc1IfH8dnfZgeb+
	7eJ+V4yQo8bl0JNfuZi9ogFFCvSAbz8P8viL/PnVs1LOWq/lQLrnw5h3lZbn0olCpMPZsk2Kt65G3
	/FJmN8dxw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLtQw-00Gp0G-DY; Mon, 15 Mar 2021 20:03:22 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLtQq-00GozJ-34; Mon, 15 Mar 2021 20:03:18 +0000
Received: by mail-pg1-x533.google.com with SMTP id o16so4132011pgu.3;
 Mon, 15 Mar 2021 13:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4Go4PTA7wIYrW2Nafn8vquSQ2REdIl3hiShJgeKtl+8=;
 b=jXJF+bq3kVD20zt2PHA264DWtOpqLhyzr6Tn2V19Mi1t6d59kZ7wqpOP/oGlHMLBUq
 6ofsQYTDy9dfpiy3agJspezufFdcKOYPRLum9E3oYmuh/EDom0qsgHDoOqVt5RGpydwL
 LpfL8rMj3Aq2AsBS4PibK/Te3w5p1Zkj0J7w+j89DdoECMDVGEIjkvJAOK8eRfWphuEm
 KfOVhip/fdfEW6G9mjkRGxE1uQi0FcDMknvIvobXEWR1EDaxzURoilAHwYau2kKf7PLr
 WKi6Kzgg95N8Fpzu0Zztwp3TEfnm/esOjYLVUovwfOSZmgKxMXDC5ueJd8w2AgPutaJc
 9PUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Go4PTA7wIYrW2Nafn8vquSQ2REdIl3hiShJgeKtl+8=;
 b=nppouGBlQkRk/UNr0oWlYEsdEnrsQfwVD2bceFEMWCq8yo2jJW1eJWGDudg/rkVtgt
 LsGDVzX5O98KLOBcyFaymPyjnEQz9uOv/WBYtjact5+O2kf/ipbkSAafwcXBkUm/7jgX
 S0cmit0aQZNCnJ5h+dxT25kS4NIyPJG8Yf1EWhauJ+W7CinORLPMRffUUbXnAo9udYoN
 NaqTVEZWTmVRqTkJq18M4ZxxGtu0C8hPeq7fIyBR35RONO+sH4W49391t5kOEinNOn6O
 P4xmi2I2AEQX4n3NeGKZTxb++x+kBrAaJIgm4ggOutXwMeylLDFz1ZvIbtYYLiM8x64e
 q0xw==
X-Gm-Message-State: AOAM532eKEuCK4yK8xjCExY/3Mwv58/JE6zsOtPEErpKEuPP3S0c+mgf
 l0Je2063cdbVWn32fKdYkjw=
X-Google-Smtp-Source: ABdhPJzRDLUtvo3tFtmTJYpTgjzZmWysMq4AB+CfaFho70CldVEH2zBVzppudCPfxABSy1hAwV0vlg==
X-Received: by 2002:a62:ddd2:0:b029:1f1:533b:b1cf with SMTP id
 w201-20020a62ddd20000b02901f1533bb1cfmr25393858pff.56.1615838594083; 
 Mon, 15 Mar 2021 13:03:14 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id i14sm459765pjh.17.2021.03.15.13.03.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 13:03:13 -0700 (PDT)
Subject: Re: [PATCH net-next] net: dsa: mt7530: support MDB and bridge flag
 operations
To: DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Russell King
 <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>
References: <20210315170940.2414854-1-dqfext@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <892918f1-bee6-7603-b8e1-3efb93104f6f@gmail.com>
Date: Mon, 15 Mar 2021 13:03:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210315170940.2414854-1-dqfext@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_200316_831431_64971E69 
X-CRM114-Status: GOOD (  15.47  )
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



On 3/15/2021 10:09 AM, DENG Qingfang wrote:
> Support port MDB and bridge flag operations.
> 
> As the hardware can manage multicast forwarding itself, offload_fwd_mark
> can be unconditionally set to true.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
> Changes since RFC:
>   Replaced BR_AUTO_MASK with BR_FLOOD | BR_LEARNING
> 
>  drivers/net/dsa/mt7530.c | 124 +++++++++++++++++++++++++++++++++++++--
>  drivers/net/dsa/mt7530.h |   1 +
>  net/dsa/tag_mtk.c        |  14 +----
>  3 files changed, 122 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 2342d4528b4c..f765984330c9 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -1000,8 +1000,9 @@ mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
>  	mt7530_write(priv, MT7530_PVC_P(port),
>  		     PORT_SPEC_TAG);
>  
> -	/* Unknown multicast frame forwarding to the cpu port */
> -	mt7530_rmw(priv, MT7530_MFC, UNM_FFP_MASK, UNM_FFP(BIT(port)));
> +	/* Disable flooding by default */
> +	mt7530_rmw(priv, MT7530_MFC, BC_FFP_MASK | UNM_FFP_MASK | UNU_FFP_MASK,
> +		   BC_FFP(BIT(port)) | UNM_FFP(BIT(port)) | UNU_FFP(BIT(port)));

It's not clear to me why this is appropriate especially when the ports
operated in standalone mode, can you expand a bit more on this?
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
