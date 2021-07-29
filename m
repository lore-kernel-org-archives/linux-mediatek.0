Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15915C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 14:44:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D60E26056C
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 14:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D60E26056C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gftyYFbBRqTPt4y89Z6ec3Rw8jGr8L6V1ac/oDgTK0Q=; b=b/76TKYJWfxB/kNMlLwFdjYXxB
	6+onTyK51VvWJoMo2+glc0wWcUp7Q0kL+wypGOXnj8t80wDvo6yIjwQF5bFoaiJA1ZRehXLSLaHrk
	oLmE6FUul9lWFtuf2R2JjtND7w53kKEr5+Qrz/qPRjgTM90P1gxUXVWJYKMBDhYe1qb+sWemLFK0r
	sx1Pb9jT/T+21KYbsMp1zFa8A3wLKxybMN7U39Ouw2HlSFFUMnRRrZJBKGaNRmHdNR7DZc5bUt6Pi
	Nqyacr5SgntME4+uvF/UNR+N2EKkQyOAjFwxS3EUpd8YgXdtC0t6sXg9HatnVmsYVcZbo4oNJl6CU
	0fvHcNnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m97GU-004Zz5-Fk; Thu, 29 Jul 2021 14:44:02 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m97GK-004ZwP-VD; Thu, 29 Jul 2021 14:43:54 +0000
Received: by mail-ot1-x336.google.com with SMTP id
 v8-20020a0568301bc8b02904d5b4e5ca3aso6051850ota.13; 
 Thu, 29 Jul 2021 07:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ghdxG0AoLe9NYK/5EqgXys2/gqMIiZChPSue54uLchk=;
 b=h5QdEIDfmW+qxNLxgwDPqXny2wX+yEEJ4/J9Z+Ql6r86dNvSf+4dlY0Yf3Hbu8oYou
 Iq6CyCsYnRiN6wktlsxFyVGykeXkaeYfdoAKzdhpg+38d3M8gpKFvWbV/k3Xv0l4v9d6
 pKN0rCv+MZ7iXJeu9DzZtJVZI58fZ88inIHb8Dl5AlvTKqXBXM6s1F9NUTwJKAgoRGjl
 aewNWLycjYdpqjqowNpfCwvP7Lx9ZYpNVePodZ5LWy9Gbk9Pju6lblUJc0flI5R6Us/Y
 WyuOogW0RMDlK7MfpPfYqf4ufR8Bmi5uGStkpC34oGbijcVbEO2mifQShWh8uTtOXDuq
 KNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ghdxG0AoLe9NYK/5EqgXys2/gqMIiZChPSue54uLchk=;
 b=XiUANEqcb5EzbEZ3+OSykSTAwL67JIzlz4Ar41iPO849AzjLRBlDOIGfUdM7QVwzFJ
 444BFttTZvrmGYKcSyurvpPtzwV3d14UpDbBGRokSUDPQLH6YDq97cASW22Go5oasHwr
 tLxsXo3BcEKYX32Hvu3Ck/cpPLTbKu/e6nNkL6zN+qFF65zX9ORz5PdgSjy64EjUKr6n
 /s+4OMMviJ6EXRaZ2dAN/0/8HxtH3v+YsRwJJhLPssa8j79B80mK+vXYL2REBU+XvXMI
 DOEqij87TUCSRbCUgpJN26noDMhUeJEBrBFh98iy/dWG9r44DN9LfVA1sWq9p5t9dd4C
 BA6w==
X-Gm-Message-State: AOAM531Q5JC7+d2+LKC8HuFr1Oto15IXSPUMS37MgZhk7w88od7sktd1
 yJRUT22UuJefTdqXhFdKaUU=
X-Google-Smtp-Source: ABdhPJxOlhPK2Sc0q6P9nlTm0HsGtyt3h3SAEh58UtL/WN1pniTAIGjbnVXsSG2RsXMv79AzNtBy1w==
X-Received: by 2002:a9d:4b02:: with SMTP id q2mr3715524otf.52.1627569831801;
 Thu, 29 Jul 2021 07:43:51 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([8.48.134.27])
 by smtp.googlemail.com with ESMTPSA id l29sm501715ooh.44.2021.07.29.07.43.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 07:43:51 -0700 (PDT)
Subject: Re: [PATCH net-next] net: ipv6: add IFLA_RA_MTU to expose mtu value
 in the RA message
To: Rocco Yue <rocco.yue@mediatek.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, David Ahern
 <dsahern@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 rocco.yue@gmail.com, chao.song@mediatek.com, zhuoliang.zhang@mediatek.com
References: <20210729090206.11138-1-rocco.yue@mediatek.com>
From: David Ahern <dsahern@gmail.com>
Message-ID: <e0284a3a-2a6f-0d1b-5ca9-7d1b62b9f5f4@gmail.com>
Date: Thu, 29 Jul 2021 08:43:50 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210729090206.11138-1-rocco.yue@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_074353_101503_BFF3DB16 
X-CRM114-Status: UNSURE (   8.25  )
X-CRM114-Notice: Please train this message.
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

Also do not add mailing lists that cause bounces. Specifically, you tend
to add wsd_upstream@mediatek.com as a cc and every response to you
generates a bounce message for this address.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
