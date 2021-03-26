Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C7CC433C1
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 20:08:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 685C4619D3
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 20:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 685C4619D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7cB8MBlNbdUd+MmVPYP3Uk492KENU86T15dpBVhb5Mk=; b=cYBkPtGLls2hls3nCX2vfI1SX
	oiQRysUgoi75uEMjz4lZau4uf/GRoZMfiUMfmRBzyoBId7WAmXGjuAPbZilnFTLtv8Ljh+zfhy66V
	wKilVtzyoItgYlvyiWfz+vlKMwSUV87UXO621Zz8pWiiCCPvAP0spVn/Re0eWNXfUf/Fb8O4LMmmM
	4QhCIGLPuF3dAPjhaZItz8MUMKgg01bZlNCIoZx3idyuf+C4it6rS2tOyU7NEDpgR9bC078u6/E37
	RFt5u3OOllf8S4Qf0flFcMe+9+iU3EQT18nwVx+lsu2MsWcx2fO9IyzPDskbYmGGeXoqLmuNhnD0g
	/7ZWxMScw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPskv-004H0G-4K; Fri, 26 Mar 2021 20:08:29 +0000
Received: from mail-io1-f44.google.com ([209.85.166.44])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPsks-004Gz6-BB; Fri, 26 Mar 2021 20:08:28 +0000
Received: by mail-io1-f44.google.com with SMTP id k8so6610242iop.12;
 Fri, 26 Mar 2021 13:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DASKl11Okq61XpyLvc+74DH7y8wg+D061aTOEn3xo/4=;
 b=Dd5/5ZRiE+XQIR42mxjd8jbeHVKuqoB+9fobpaVqHDfgrokU3XAV+rZpunFp3syMD3
 HYhAiC0pIG6eNvF+SBCERTNdD8bIC3qRQePIhmL8DERRC43M+DjPRKUkQNpdW16d75bD
 eGccOMnUaXu3mkmJBQkI5WCuynPtPXG2iylBODp1bnSaztqshIsWx4EFOjFAqNMURFxK
 FiMkKCH+0sAVxcTlz84+Ev86vSAjO+0qBKnl0vSqDSOKaVGzsT4cuP9johPPEI+XpGgO
 7zE1s6roybQ/K/sXT+twunrHznemPEvxQmghJx8NB3jSSPs/oeSQktX9QPlrDXcB5ZnQ
 JuYQ==
X-Gm-Message-State: AOAM5308Rh7rrtAUjmcGCExLrBqm82omRrpP1zNB5EPVtofqGgHW8T86
 /U/alT/sAvaK4z/vPhSSfg==
X-Google-Smtp-Source: ABdhPJzOMr0U8Z8VHTkdGna00jzbpA/m/ZJVl1xMmbaPPdHDWEfwemmVN983hu/qZLjWRyhejOe9Ug==
X-Received: by 2002:a5e:d908:: with SMTP id n8mr11743371iop.121.1616789304697; 
 Fri, 26 Mar 2021 13:08:24 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id b4sm4677200ilj.11.2021.03.26.13.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 13:08:24 -0700 (PDT)
Received: (nullmailer pid 3784988 invoked by uid 1000);
 Fri, 26 Mar 2021 20:08:20 -0000
Date: Fri, 26 Mar 2021 14:08:20 -0600
From: Rob Herring <robh@kernel.org>
To: Roger Lu <roger.lu@mediatek.com>
Cc: Enric Balletbo Serra <eballetbo@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, Nicolas Boichat <drinkcat@google.com>,
 Charles Yang <Charles.Yang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, YT Lee <yt.lee@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 HenryC Chen <HenryC.Chen@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>
Subject: Re: [PATCH v14 5/7] dt-bindings: soc: mediatek: add mt8192 svs
 dt-bindings
Message-ID: <20210326200820.GA3784958@robh.at.kernel.org>
References: <20210325025114.25842-1-roger.lu@mediatek.com>
 <20210325025114.25842-6-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210325025114.25842-6-roger.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_200826_576859_29DBA1B3 
X-CRM114-Status: UNSURE (   8.83  )
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

On Thu, 25 Mar 2021 10:51:12 +0800, Roger Lu wrote:
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/mtk-svs.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
