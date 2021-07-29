Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D9DC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 14:41:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6F5560D07
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 14:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6F5560D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DJ2ds9V3L6GNjCKVwdGN4L0p6o+yxdZ7T6rXFbT2bdk=; b=cu1hPyLfV/RDa+lxTSnjz7Y1CT
	JQPEfVgyZmDq7CCysjGvneTbsQwyrXISUGhMe5ydK8ll6ElBV2P5yG4MAkCC2gZN9zU7RXghhMJ2c
	2bL74BN4TZv1IwUDK8Us8BY/URCyX7dR6EcoOqR0hqC4hv1xCFG0dCvxhFPDSk5qdejSbS1cWMwID
	iumJM2ibe8k0kcyKAssDJDrOWrmuEeMwLhZj1hsS8+tWvFGIKiu5MN8UPJxaodkpduueXAhSkLLqR
	qb5aXvoOgv6e34xhdmniEXOueO6mi8o9Ob1B8iTi7AuI1Je57JCshkI5bhO8I456+Gvq6m8Hnyii1
	m/sdJtgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m97E3-004ZAL-IK; Thu, 29 Jul 2021 14:41:31 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m97Dt-004Z6T-2T; Thu, 29 Jul 2021 14:41:22 +0000
Received: by mail-ot1-x32d.google.com with SMTP id
 h63-20020a9d14450000b02904ce97efee36so6078583oth.7; 
 Thu, 29 Jul 2021 07:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FPq9UnKVcU4kfCZLJNlpegR0xa6ct4O4koLbgdWD4mQ=;
 b=cBLsSxg7emiU57PRaLgGFkBKp+9tX2FpCAewe/ej4ucoKac0M7vtwcSsfbgbQkFe0K
 yvTTr4Md3XROGREifNti6dvrHwC+JRTnL5mUPKYH/PtrNRdxozTbyYPPw2mnZvQqcc1I
 vBbeRNT/FlKIqiCJeLALw8oEB0d5vwfJ/kYLKO2Oc1O6XtVXwgKpFNxW1gGnBdAJE+H2
 MgnOH+mldYPftLCSGFPhGlznENlozNZngjSwd2gwTU1XfjvlYVUE9B+IZOkqxDwTtYGH
 W3A1zx/NsSHBsyQcUg7Zxw/GaTX63J96u7+JW0iEj8uqZG+AfH/O//Evz6+MBmR213u1
 tySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FPq9UnKVcU4kfCZLJNlpegR0xa6ct4O4koLbgdWD4mQ=;
 b=RFU5dkshj21JCy9/Wxm8fPfc5tH2Q/xKycisFHgbFaztdnfPYmT19zapmkJJkFvP2c
 5mugXncN6QT8YNWQCxfhDnXOOkakAR8vfigq6jCH7ddzymjBCanN6AGGYiLny8HEhrGn
 0HBsYm0FOzfVLBHC7ewvw9r1jSwL4deNzNQ5B4O0Li1kwKPHJkrhyObQKmQJL1jBKsmT
 7g4rlsQ8nXtgL67IPfQ6+p5BmW8BzNWG+I7cCAwNcS/YlIVnQylWSEDHFCov3uOxYD3L
 9CfzvrtpWO1VtdY898b7O1ym8HD+N/iQZYM7105iuyxf4/9uq/xIvw6MblpCQ6gL3DAw
 Mo1Q==
X-Gm-Message-State: AOAM532bD9Dbpt4ot2LXACB1Y2ekZ5LHUFIBoAyI3lL956WKRQhP+mXP
 hWNtc/RkPO9u1NyxDfR4H1k=
X-Google-Smtp-Source: ABdhPJwU0Evtf3qU/3HFjq/6at57j3lQJc6/jHgfrc1Z2hQjAvtCqtjbxb3Nz982mtFrMD7LIMr1nw==
X-Received: by 2002:a9d:6d8d:: with SMTP id x13mr3571864otp.192.1627569679341; 
 Thu, 29 Jul 2021 07:41:19 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([8.48.134.27])
 by smtp.googlemail.com with ESMTPSA id v13sm421ook.40.2021.07.29.07.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 07:41:18 -0700 (PDT)
Subject: Re: [PATCH net-next] net: ipv6: add IFLA_RA_MTU to expose mtu value
 in the RA message
To: Rocco Yue <rocco.yue@mediatek.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, David Ahern
 <dsahern@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com, rocco.yue@gmail.com, chao.song@mediatek.com,
 zhuoliang.zhang@mediatek.com
References: <20210729090206.11138-1-rocco.yue@mediatek.com>
From: David Ahern <dsahern@gmail.com>
Message-ID: <c4099beb-1c22-ac71-ae05-e3f9a8ab69e2@gmail.com>
Date: Thu, 29 Jul 2021 08:41:17 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210729090206.11138-1-rocco.yue@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_074121_209804_9D73F882 
X-CRM114-Status: GOOD (  13.04  )
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

On 7/29/21 3:02 AM, Rocco Yue wrote:
> diff --git a/include/uapi/linux/if_link.h b/include/uapi/linux/if_link.h
> index 4882e81514b6..ea6c872c5f2c 100644
> --- a/include/uapi/linux/if_link.h
> +++ b/include/uapi/linux/if_link.h
> @@ -347,7 +347,7 @@ enum {
>  	 */
>  	IFLA_PARENT_DEV_NAME,
>  	IFLA_PARENT_DEV_BUS_NAME,
> -
> +	IFLA_RA_MTU,
>  	__IFLA_MAX
>  };
>  
> diff --git a/include/uapi/linux/ipv6.h b/include/uapi/linux/ipv6.h
> index 70603775fe91..3dbcf212b766 100644
> --- a/include/uapi/linux/ipv6.h
> +++ b/include/uapi/linux/ipv6.h
> @@ -190,6 +190,7 @@ enum {
>  	DEVCONF_NDISC_TCLASS,
>  	DEVCONF_RPL_SEG_ENABLED,
>  	DEVCONF_RA_DEFRTR_METRIC,
> +	DEVCONF_RA_MTU,
>  	DEVCONF_MAX
>  };
>  

you do not need both IFLA and DEVCONF. Drop the DEVCONF completely. IFLA
attribute can be used for both inspection and notification on change.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
