Return-Path: <SRS0=8BsG=MJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3608DC636C9
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 15:45:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F384861106
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 15:45:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F384861106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MhB/cnu2y8Iltm0eYDpRX66x/BuYWwMaBOGhg7kvtFA=; b=ofN9rcGqkDRwEa
	n2qn6A4udPWnrSsBpwx3k+YPgqqdC3JFCB36O+vGYKZRqU+CpZmcy5U3TwftUWqLMwUO8V+X4StXa
	Ku5KOutxVH0IPDWXJy38/6qu86EiQOA+gJFlz0OX1n7EpiH9diq0xtWUamgGMvRTsO78mVlIkzOkp
	afkdm5K9M3OpEoISulP7xbs7o3TRtCD5W1GMgyHJQ9lD3REOlh/42VnaZ9QUapjhYEk8dHcfMJVkH
	smVt+iI+2rHRcg5HUlQcMITPrlWz2nlUvSVNzh8aQQE8bbyDDju4RiDPS3q/ccnTU3nxIsRWy/e3l
	WkAvxZrXZ6Imlu4IN7FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4mVf-006mHw-E2; Sat, 17 Jul 2021 15:45:47 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4mVR-006mFs-Ji; Sat, 17 Jul 2021 15:45:34 +0000
Received: by mail-pl1-x62f.google.com with SMTP id x16so6969630plg.3;
 Sat, 17 Jul 2021 08:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=Hfi96rlmPe+R59fiIJkywQN9f0GSoIHlsAihgcSK3F8=;
 b=p0WCreKSpGz6knWvIZiZfC2UOx3oK/hunPjr/MwSGARdJRT177f9xnwck0etUuSFZo
 QPwQw67I3G7QJUHJ7UXpZDP0bbK+FXGP6fbQ40n7iAxZXd9GA+WAMqA6rikj5zt9MaRz
 gHuPLoo3Vn7HQ7DOhJQy+waYc+iOnO/addgeXq5NlC/EqeSftrdawqtCwPT8/Uut14tB
 0kDiQxiZn6+9rrra19C0HAxZtjKPW+CAL0dEt7LkmAeuJ/D+TxGVH9SvuNaBn281qJ2L
 xJT3CUR/juyC2c9tYC8YjRUihMds2Ppa0aB4Fl4ylH0PmCxo/v+fjbW+0X3ZfXyWnNP9
 DvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=Hfi96rlmPe+R59fiIJkywQN9f0GSoIHlsAihgcSK3F8=;
 b=ivEsI17l0on/0lW/95HZJiydyN7ggV6ZZeT7Tv69+QxhrJ45wEbugXmBzZUKyXTKaV
 gVqMh8N93xxmH/BBCoXcVMJl+OdKhPRiXE8tlkYHQHqJJRQHL7wr7zgevPXgyzsQtEr6
 nyI6a7EIskChsW2rpRpr7uV43Bvn8KlbBbCkJpD42WRV7G3FCGWrFBcJjLCHM2EL560b
 fpeDH18+cSt8Hked4JLgmRwL2mVAL0n0PLwYQN23dZKAFteIDPmeXe3pcle+nohNEoBq
 iO9c9aKYFRykSNeT/w2hR9sxkrHXcF3uuds5Fg5pVdggHP7JvgYA9N4DX9F+s8z3zWh9
 iTyA==
X-Gm-Message-State: AOAM533sYq0/EX4cTZMvU4yYYKHyMOhir1cHkW0nggmp7y6D5lAfQOHp
 zCjPrmrDRod0xRdY3q1V7yw=
X-Google-Smtp-Source: ABdhPJxW/N+e0Ct6YYUm1eqepLMt+QYVM4f/p1pqdyZAgzfPuSR/vAlxc9MSQA1vjFMEjhsWJet0Eg==
X-Received: by 2002:a17:90a:1d43:: with SMTP id
 u3mr21335921pju.121.1626536732650; 
 Sat, 17 Jul 2021 08:45:32 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id h8sm13212826pfi.47.2021.07.17.08.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 08:45:32 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Landen Chao <landen.chao@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 frank-w@public-files.de, steven.liu@mediatek.com
Subject: Re: [PATCH net, v2] net: Update MAINTAINERS for MediaTek switch driver
Date: Sat, 17 Jul 2021 23:45:23 +0800
Message-Id: <20210717154523.82890-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601024508.iIbiNrsg-6lZjXwIt9-j76r37lcQSk3LsYBoZyl3fUM@z>
References: <20210601024508.iIbiNrsg-6lZjXwIt9-j76r37lcQSk3LsYBoZyl3fUM@z>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_084533_696228_19646774 
X-CRM114-Status: GOOD (  14.87  )
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

On Tue, Jun 01, 2021 at 10:45:08AM +0800, Landen Chao wrote:
> Update maintainers for MediaTek switch driver with Deng Qingfang who
> contributes many useful patches (interrupt, VLAN, GPIO, and etc.) to
> enhance MediaTek switch driver and will help maintenance.
> 
> Signed-off-by: Landen Chao <landen.chao@mediatek.com>
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>

Ping?

> ---
> v1 -> v2: Remove Change-Id.
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bd7aff0c120f..3315627ebb6b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11588,6 +11588,7 @@ F:	drivers/char/hw_random/mtk-rng.c
>  MEDIATEK SWITCH DRIVER
>  M:	Sean Wang <sean.wang@mediatek.com>
>  M:	Landen Chao <landen.chao@mediatek.com>
> +M:	DENG Qingfang <dqfext@gmail.com>
>  L:	netdev@vger.kernel.org
>  S:	Maintained
>  F:	drivers/net/dsa/mt7530.*
> -- 
> 2.29.2
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
