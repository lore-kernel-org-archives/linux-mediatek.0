Return-Path: <SRS0=Po0r=ML=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FE9C12002
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 09:20:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C25766108B
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 09:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C25766108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1D6z9BSLJoqC1sLfCXGMOVt7uo8mcLp/b/G2XwclkhA=; b=bubDR0sqyDjR8Q
	KetXEG/3Hig3XEd9AE41fTBtDzZqVQOMyFhn693DK5zkGci1WCBOOVCpihVDKcJsGuOhKBGnJ4Lx0
	RUJUYZCxi/IYUCXetHHgcp+PdoDSwIi3WXwvV0jquOMwy2krGqiHir1/m1SsBJlrCK3Mx21u0/2zD
	BXkeCFF57Q2Yu3VUXMTEL2MFxN9UTnRFLfAY/kUr+lXdbmCQhEH0ZB81x0faTB4b7KR3d5UVNtPgB
	5ZodTz3pOOma51SYsmomqg6eibBrerNP/IFE8zG7lepD1YeRKgvG9z1yN9gDG2TN+EDSE+5Fwxmnv
	T94srwDqJKW42ikAfSog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5PRG-0093TL-Hi; Mon, 19 Jul 2021 09:19:50 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5PR0-0093P4-Ep; Mon, 19 Jul 2021 09:19:35 +0000
Received: by mail-ej1-x62f.google.com with SMTP id qb4so27502184ejc.11;
 Mon, 19 Jul 2021 02:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Mpyf33A1sQVVQcz3IapdZfoMQHbi8kdYOp0EbZmfX78=;
 b=S6uDV/pnjhfUad+Fhz2AyaqUCoayLOP/g4IN8r0EfRR8oDvnRExLva/CukvdnO40sD
 vzR1D4Hb2LpIsgQshTDQ4mLFJ+uqxER2Wx5M5SXRWyIFAtODhKce21A8YdfgMfs7gkzQ
 0/yReZvWOoNZsjE2EoOFVhXr8lr/EYaq1fefKarutbYIcMY1k6W/UR6vShile3mLfoOD
 uWV4T9rvH8VuLHQFDS4JMqQkfNsGkY/JfdWHm9GDn3gL81TAqm5BjfhL6dIrHCTEfsfk
 zohUt/mzuM1r8/0tHVo+wakZRA10KTrNld40sJCrk0YTh/6oFIcV3DfXElkoOBqms2zl
 N2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Mpyf33A1sQVVQcz3IapdZfoMQHbi8kdYOp0EbZmfX78=;
 b=aN/P7UhisogU2Wp351l1JdvAJcn20lgoT8M3xKAPvcSAx7qQ345qAXkIOyDWSTx/6Y
 qj9O4OYbx+yyCtplF+gsUsQ/uhm3vB4gsmy9rHGCnOVIs9p8j/19oMk3sMQcZ5ABrHgx
 MAEGeMX1Bivf1Ic5dDuncfGgbgu7ym5Qkt2N7PhVHtZkQZDVs0CElc1Yk5wGOe6KkV6Q
 CFAHNQsd8bq1n9vaL1wOjRFUAkBiMDSu6QezDrdOusy9wiZES1edM86VVtBmzCm1WQNM
 69p1QMo+FnbutCJgNDQhhBBQ7lPcXxeiCUPGwZFLWa9Na/MtHEFQ+1zzaZVgJUbk7oEa
 i1og==
X-Gm-Message-State: AOAM531eGQVNFPwvxZDUs0+XiUs63lx2ff3ZyvZF496s0AhHxwQQ3JsK
 ZyOFo4n+FrMjXl4EXDAM0A0=
X-Google-Smtp-Source: ABdhPJyT23y0r4YXMvj0whLX3nD63SU+Q30IVtB8Af5zLWCwNoqBApEUY6EuVisVvgFJp4RSYXavTg==
X-Received: by 2002:a17:906:2a08:: with SMTP id
 j8mr25810993eje.449.1626686371909; 
 Mon, 19 Jul 2021 02:19:31 -0700 (PDT)
Received: from skbuf ([82.76.66.29])
 by smtp.gmail.com with ESMTPSA id jg9sm5611900ejc.6.2021.07.19.02.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 02:19:31 -0700 (PDT)
Date: Mon, 19 Jul 2021 12:19:30 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Landen Chao <landen.chao@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, dqfext@gmail.com,
 Sean Wang <sean.wang@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, frank-w@public-files.de,
 steven.liu@mediatek.com
Subject: Re: [PATCH net, v2, RESEND] net: Update MAINTAINERS for MediaTek
 switch driver
Message-ID: <20210719091930.36l2zjlgngeq34wa@skbuf>
References: <49e67daeadace13a9fa3f4553f1ec14c6a93bdc8.1622445132.git.landen.chao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49e67daeadace13a9fa3f4553f1ec14c6a93bdc8.1622445132.git.landen.chao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_021934_551881_A5C3BD44 
X-CRM114-Status: UNSURE (   9.78  )
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

On Sun, Jul 18, 2021 at 02:14:20PM +0800, Landen Chao wrote:
> Update maintainers for MediaTek switch driver with Deng Qingfang who
> contributes many useful patches (interrupt, VLAN, GPIO, and etc.) to
> enhance MediaTek switch driver and will help maintenance.
> 
> Signed-off-by: Landen Chao <landen.chao@mediatek.com>
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> ---

Acked-by: Vladimir Oltean <olteanv@gmail.com>

Landen, please resend this patch properly (to the list and not as a
reply to the v1 patch). It is not tracked by patchwork otherwise.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
