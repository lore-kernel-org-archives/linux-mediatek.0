Return-Path: <SRS0=yOeO=IO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E5EC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 09:56:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B59F365018
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 09:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B59F365018
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1DGElbA3FfzahkbxOigwXAxOUawdyZMajyFGrtBU4so=; b=g6j9+qp1ffdtxtMzTp9YxI+OA
	nI65znd1g5Ijr7GgfcB/wTt06KpONVbut+hDtVIayckg9TqPegV97Aju0qV50C0BBYBhJ2GzFTjRN
	ZWcjw1C8aewjY4/35625oJ0JCuIff7fS4acQsw5vIMrdGNrWyQop3KSCuzpAijAMkAkn9DNzIrMzM
	AfcHvpT5WoLMvYQ5LTzojC7ciCy7oDuN94I6fKK0XxbWtlWwPXneDLXsq9N7/OZlCrq/wUbnLMeHh
	3hY4HAVrqNpoDgedopPoXcE8WI3RkCx/dZPogJLinO/XtYOmRnHjfHL5bqJeKtMtY6fhag21uvxvi
	5GFapGtTQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM6Qx-000KWf-1k; Tue, 16 Mar 2021 09:56:15 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM6Qo-000KUw-7o; Tue, 16 Mar 2021 09:56:07 +0000
Received: by mail-ej1-x62c.google.com with SMTP id si25so15360243ejb.1;
 Tue, 16 Mar 2021 02:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QYNfh3jaX3N1CtGg7NED72HcSFgmcITNomBhZBJqE/Y=;
 b=uGMvRB1D0xw70y+CqywgeVFN8O2H8SGeov523gtjUoa3d4JflrPmx1ryXrBFlUdjpF
 hacp04N79LXlDGf/LQEJQKlgRado5Q5fS8vPFPDhPT8Ug6WXSqpAOyTVaaVc3bIOk0cX
 ldw1XneeXXuYuimA5flZYweCUnMr6Z36zoHhlsKNvNR4QMUngnYJnU1oqx6/kxLL3vSW
 64cS96xu3+n9VfJB74iIYUjthP83UwHCV6OE6MiAtUSCH91mdEdkT4jFl+QFOlfizyMk
 nk3a7yFivK9qkNFyZlCaN9Hj6kXDEsRgvMH7VbLgwClPp6fhx/HL2O1avjXcAuhjYbCV
 xlgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QYNfh3jaX3N1CtGg7NED72HcSFgmcITNomBhZBJqE/Y=;
 b=ZLicaS6pQuqAXRINy82LbE7YTl/fAY31fbyEXIxIGwGyQXqLKw90kOYaIti5V+I0TJ
 paGmm3wV4V1OJRHyoiHpgV/cGpWM8BeN1HjkQ77/LE4+azXf1TeJffhjmVrIcQMwSpuD
 9e4esuTJXK2jvfg/k+GPqLbyT8fh7iWV0fqKFxXXwrZiR+yhRJaNWbyIfWBKeEmekZV7
 2CgLSAuSCoj+RoSwOWVlj2UfobabBV2xfI4dgxGY4sbyeFR4OirySFUMW1suBGtFg8XJ
 C77VWXxxvE5AMLKqQFLHQ0xwB2//zvdlLtu0lfZHMlvZHgK5VCXZ98dwsPA6lDps0PsS
 tHIw==
X-Gm-Message-State: AOAM530nOpQDbPgdnaf/TLSnPJ97U1VK7JgJnoARH4SzuEvz7+Ofv0VN
 Yfncu/PAHHPnXqZGgSHXMT0=
X-Google-Smtp-Source: ABdhPJzw1VKhJ6YtiLJyj67J0yZSTlZtQfHt+vO+1cr3OxFeMOB954HHMAFSoDcehWnH6I6ZeWT1iw==
X-Received: by 2002:a17:906:5e50:: with SMTP id
 b16mr29207175eju.272.1615888565730; 
 Tue, 16 Mar 2021 02:56:05 -0700 (PDT)
Received: from skbuf (5-12-16-165.residential.rdsnet.ro. [5.12.16.165])
 by smtp.gmail.com with ESMTPSA id a26sm10649008edm.15.2021.03.16.02.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 02:56:05 -0700 (PDT)
Date: Tue, 16 Mar 2021 11:56:04 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Frank Wunderlich <frank-w@public-files.de>,
 =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH net-next] net: dsa: mt7530: support MDB and bridge flag
 operations
Message-ID: <20210316095604.dvg32ia5pfdtpenw@skbuf>
References: <20210315170940.2414854-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210315170940.2414854-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_095606_423875_BB1D3D2E 
X-CRM114-Status: UNSURE (   8.38  )
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

On Tue, Mar 16, 2021 at 01:09:40AM +0800, DENG Qingfang wrote:
> Support port MDB and bridge flag operations.
> 
> As the hardware can manage multicast forwarding itself, offload_fwd_mark
> can be unconditionally set to true.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
